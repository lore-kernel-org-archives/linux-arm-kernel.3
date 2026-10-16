Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64FF4CCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 10:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yK0WQACtshO1o4FrXw+zV9TJ9Wu6OvYxJ52uJZRAsB8=; b=MSgDwXTl0u+Xy0MMJn8ypyquI6
	lQXMboL4JzD+6cfErXDWv5QoRfhL5nSF0DJbb805ZwRr1MyaqW5cJRmfkq5V2ePDS7MsfGpN1aoCe
	CtK15aYIkAsC0B/TgLpeBAtppX/I8F/GHCQWgWbHV0sEWdPPkmEwtn+TCHKvrZszfFKLDWQk2LR3t
	komDxs4XPK7LLP9TScW3/gSyVwFj/xSMimTj1U5NTy9NrVO/vcdI9tBSVGpl/3weeJJXp88LiaAiz
	u7PxSzzXKGRqPXbzbSr3X70Kl8VAMRzXvydDAbrOUQ2fXbAQrAuWI+alf+sLmTCf4kxQNNoPfdAF3
	R1A2FHog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHekq-00000002YXr-0DRQ;
	Fri, 16 Oct 2026 10:01:36 +0000
Received: from esa2.hc1455-7.c3s2.iphmx.com ([207.54.90.48])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHekn-00000002YWJ-0TJY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 10:01:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1792144899; x=1823680899;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=4HLtUEu6vOSWthchY0abaCAXnqmO5hM988d7N6N6Jvk=;
  b=Zzd5UgMxkXicfhW0eVJbmfaCL72XcQjOnQ5mTQ/MTgBu/sO7LqK8uyUB
   8PHi3gPd9/zajnvQyP4jwzVFyYC6qjGsyqzxmHIkGmPb7KwF1TJBcCEZs
   l+8k8SGZVBPmnyFJDYZFyZyQ3eRbGPweG/HLK7R9UB42u085YrYpH6LlW
   OmmxUjp2/8+xozVEloLBmL25kik3ifxNrIAm0jWV4+U9xHRA/K5JsHX7j
   Q1/P4o1lc9okytu72k68jqMrLoLoG95vw9SZyQlTtdE+cKnsVgZMg+9Zn
   dUbYi8UN5Ue2qhturcI10rsk2yrQNO/zFm/tRDmLV3xmD2/Enph8VKr7o
   w==;
X-CSE-ConnectionGUID: t71zfxebTRK16ja55gpaaA==
X-CSE-MsgGUID: z9RauOJSQ8+1Yn1TY2SjZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="258446674"
X-IronPort-AV: E=Sophos;i="6.27,161,1786978800"; 
   d="scan'208";a="258446674"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 19:01:37 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 7295C820C23
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 10:01:30 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 26CCEC041DF
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 10:01:30 +0000 (UTC)
Received: from [127.0.1.1] (unknown [10.124.178.20])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id E73F5101A408;
	Fri, 16 Oct 2026 10:01:22 +0000 (UTC)
From: Tomohiro Misono <misono.tomohiro@fujitsu.com>
Date: Fri, 16 Oct 2026 19:00:45 +0900
Subject: [PATCH v2 1/4] arm64: cputype: Add FUJITSU MONAKA definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-monaka-fix-for-upstream-v2-1-fc7ede7f9f48@fujitsu.com>
References: <20261016-monaka-fix-for-upstream-v2-0-fc7ede7f9f48@fujitsu.com>
In-Reply-To: <20261016-monaka-fix-for-upstream-v2-0-fc7ede7f9f48@fujitsu.com>
To: Tomohiro Misono <misono.tomohiro@fujitsu.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Marc Zyngier <maz@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>
Cc: Kohei Enju <enju.kohei@fujitsu.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 kvmarm@lists.linux.dev
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792144875; l=1258;
 i=misono.tomohiro@fujitsu.com; s=20261002; h=from:subject:message-id;
 bh=4HLtUEu6vOSWthchY0abaCAXnqmO5hM988d7N6N6Jvk=;
 b=ob2a5dW1Cp7erGw46/nu4XJECdkaC2iBygiES5mJCTg2NCwW0aQp5ra6LnTWj09KYplfnJF4i
 hlwhi1qe8cnDCoTV5TZSvBfK9d8n39jNsCQg122rO6r9jEYl3BiBVLL
X-Developer-Key: i=misono.tomohiro@fujitsu.com; a=ed25519;
 pk=VLRxj5y4GJrHLmj3e2NBg30fX2U//ydi7c2G2qiNo10=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_030133_477229_8B80AC62 
X-CRM114-Status: GOOD (  10.49  )
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
index 1fa29616e586e..3f648cb10e61c 100644
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


