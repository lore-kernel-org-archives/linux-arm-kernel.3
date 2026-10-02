Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E47A3CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 10:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H2+UoLV5EQZ4gVLgr1KEEplo+9wcM8KCSskxv90KfBU=; b=4WivsR7duhdert9RYVdkPL+TL7
	5BnLGKCeFLgIe1VyyO4020Jnn/PY39BpYviHmaLjDhDfojgTDG6Pe7zc6fabZcKORb8ezaod+WiWd
	auyvS058V0FPM8ioBTHsIEtTwUSJl5Dz1tjy96ScNLT6A22PQWx8ZStTcZnYH17gU7ixGG2uEo0Re
	L0iKZktU+qAoA2wInBZAW51RrbAHCWe5g49V5mWTzP4fiVIGrbvFtWia1bRkufyaHcg38nP8xuKOl
	EBiHwhhdqZgDlmE2Evu1XITfPpaOYy5zV5q2/vsOhU41kzVEeWBezlI1i0movL1QE4frir1PK/XLT
	odx3304Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCaUq-0000000BJ7U-0sf4;
	Fri, 02 Oct 2026 10:28:08 +0000
Received: from esa8.hc1455-7.c3s2.iphmx.com ([139.138.61.253])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCaUn-0000000BJ4k-09fv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 10:28:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1790936890; x=1822472890;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=HvjQ+Rk40qOIm9mo8ia6lTFXzNLel1Ows72ZgD35JU0=;
  b=DS232FuPLjKrXMLaliu5MdoQYPb2YI5drjXdEfRyMICyLPUU0EZS4RZ/
   mBRiadrZlEXfesqhmWEa3BGqJmedMnZeXxJ6FAfKBtDQupapqYfd87nyT
   XV4jCneyYREnhogBmn/uyrrNdy6KJa9wkuYNH5btSOOV5iiraszHcLqBB
   daaNZIox3DzelWzyS/Q028nTBazAvfaFfLRmgxHieJ19hEMNuxA1qI6Jk
   qj6wMAK/p7yEk9Z3B6WWfxNQD1kcU1xbo6CUJ+052mLPFrBsjb5UURf40
   JC0nn0EZ9s7KmN/MKFlhmrN4KXAqaRK16tFbYIy6WLyUVfVhiNhn5y8OU
   A==;
X-CSE-ConnectionGUID: HJytxa/tQO24xBLVEOQY0g==
X-CSE-MsgGUID: d5Jc3JkvQDqXGkgFD7ELxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="244925549"
X-IronPort-AV: E=Sophos;i="6.27,136,1786978800"; 
   d="scan'208";a="244925549"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 19:28:08 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id B356E1C000D9
	for <linux-arm-kernel@lists.infradead.org>; Fri,  2 Oct 2026 10:28:03 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 677F018026FA
	for <linux-arm-kernel@lists.infradead.org>; Fri,  2 Oct 2026 10:28:03 +0000 (UTC)
Received: from [127.0.1.1] (unknown [10.124.178.20])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 540942018B2A;
	Fri,  2 Oct 2026 10:27:58 +0000 (UTC)
From: Tomohiro Misono <misono.tomohiro@fujitsu.com>
Date: Fri, 02 Oct 2026 19:26:49 +0900
Subject: [PATCH 1/4] arm64: cputype: Add FUJITSU MONAKA definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-monaka-fix-for-upstream-v1-1-4aec0b0cbe34@fujitsu.com>
References: <20261002-monaka-fix-for-upstream-v1-0-4aec0b0cbe34@fujitsu.com>
In-Reply-To: <20261002-monaka-fix-for-upstream-v1-0-4aec0b0cbe34@fujitsu.com>
To: Tomohiro Misono <misono.tomohiro@fujitsu.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Marc Zyngier <maz@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: Kohei Enju <enju.kohei@fujitsu.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790936872; l=1256;
 i=misono.tomohiro@fujitsu.com; s=20261002; h=from:subject:message-id;
 bh=HvjQ+Rk40qOIm9mo8ia6lTFXzNLel1Ows72ZgD35JU0=;
 b=PT/2bczWTHPh+YbXoztDgvLhcaFSSU3/j9P+tSfd1xJariCWXTyjJxPMEI7KFfecJjOT4VorY
 wM4k8oN9UWSCD2z/KXUzlE1TAEFJXeuiK3IiNjg6dhZZYuLdzCZPZpH
X-Developer-Key: i=misono.tomohiro@fujitsu.com; a=ed25519;
 pk=VLRxj5y4GJrHLmj3e2NBg30fX2U//ydi7c2G2qiNo10=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_032805_373751_C0234B89 
X-CRM114-Status: GOOD (  11.01  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add cpu part definition for FUJITSU-MONAKA.

Signed-off-by: Tomohiro Misono <misono.tomohiro@fujitsu.com>
---
 arch/arm64/include/asm/cputype.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
index 1fa29616e586..3f648cb10e61 100644
--- a/arch/arm64/include/asm/cputype.h
+++ b/arch/arm64/include/asm/cputype.h
@@ -138,6 +138,7 @@
 #define NVIDIA_CPU_PART_OLYMPUS		0x010
 
 #define FUJITSU_CPU_PART_A64FX		0x001
+#define FUJITSU_CPU_PART_MONAKA		0x003
 
 #define HISI_CPU_PART_TSV110		0xD01
 #define HISI_CPU_PART_HIP09			0xD02
@@ -235,6 +236,7 @@
 #define MIDR_NVIDIA_CARMEL MIDR_CPU_MODEL(ARM_CPU_IMP_NVIDIA, NVIDIA_CPU_PART_CARMEL)
 #define MIDR_NVIDIA_OLYMPUS MIDR_CPU_MODEL(ARM_CPU_IMP_NVIDIA, NVIDIA_CPU_PART_OLYMPUS)
 #define MIDR_FUJITSU_A64FX MIDR_CPU_MODEL(ARM_CPU_IMP_FUJITSU, FUJITSU_CPU_PART_A64FX)
+#define MIDR_FUJITSU_MONAKA MIDR_CPU_MODEL(ARM_CPU_IMP_FUJITSU, FUJITSU_CPU_PART_MONAKA)
 #define MIDR_HISI_TSV110 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_TSV110)
 #define MIDR_HISI_HIP09 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_HIP09)
 #define MIDR_HISI_HIP12 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_HIP12)

-- 
2.43.0


