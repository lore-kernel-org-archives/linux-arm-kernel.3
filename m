Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D96CE8D4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+LocAunkWAjtwlCsH55TDCF1cpoIaLWUds9m3pS14oU=; b=0RFe4gChAeh6GIcTkUKuU/EF9k
	wUb1xXlQXeOzNgDhEmAT2M8zXWLZmr2OwKS7qELFpgxixUSY47iZke3a3rJoVxVsCTLX3OlPL3T+x
	lvJ1Qaxc8RIqaVZ0zZ6dceBZwjkvxiHpWuD6536wv7P511j/XgAFE5MSl7YpMdEeQpahcd5Rh2svc
	M+v4WNVm6oUg3Qu5ibHyY6QC7CXxZlDCeoxngfHYj4FjXVzJ1aeqyWzAG6v+mxljnATZZKdnFEqw/
	zd0YccSfrADJGAazB+zGeFNAhhy3SZetJK5lZtPFo6jQFTIYdKRgQGOJWYgFWclO91T5IRbt8la7X
	xQZtf5LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwKt-0000000CeyM-3VD0;
	Fri, 14 Nov 2025 16:07:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwKr-0000000Cewt-2Rp5
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Nov 2025 16:07:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=+LocAunkWAjtwlCsH55TDCF1cpoIaLWUds9m3pS14oU=; b=pZbHu6GyAYVM5cSsXw+AUuTuok
	dHSRS54rYSqbjsOUqmoysR4oxGH+ckn7GBq8ZNr82ZGrRTXooysZHwF3K5NNolEYaGlxJpnKYCoS9
	afbaMEhaH/CVn12Ybu8aP1p6LRMGxaly0QUusJXnX2t67WaEZ3ecrcYqdauYJOnptA809ABaIvSoN
	9Hf6KnYJ8qQaxzn8Rw6sSPnB1RzZh5rknoycgWP4ZkuU5B4cSvFz5l/W3e+RKYqNdpNWGJkYi1mQ2
	U6F663grOhkhgjbkH4O6fFNo6+MA3KCSiwl/G/6xPUbIFLElA3LPMPdsXLevtpDm9ZBRErAsFv9kE
	6FSu1tag==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvTA-00000002vKn-0xCv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 15:12:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4487F106F;
	Fri, 14 Nov 2025 08:07:29 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BCE1C3F5A1;
	Fri, 14 Nov 2025 08:07:34 -0800 (PST)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: james.clark@linaro.org,
	mark.rutland@arm.com,
	james.morse@arm.com
Subject: [RFC PATCH v6 01/35] arm64/sysreg: Add new SPE fields
Date: Fri, 14 Nov 2025 16:06:42 +0000
Message-ID: <20251114160717.163230-2-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114160717.163230-1-alexandru.elisei@arm.com>
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_151212_452406_7FAECC09 
X-CRM114-Status: UNSURE (   6.76  )
X-CRM114-Notice: Please train this message.
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

Add the PMBSR_EL1.MSS2, PMBISR_EL1.MaxBuffSize, PMBLIMITR_EL1.nVM and
PMBIDR_EL1.AddrMode fields, which will be used by KVM.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arch/arm64/tools/sysreg | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 1c6cdf9d54bb..1e7b69594f04 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -3070,7 +3070,9 @@ EndSysreg
 
 Sysreg	PMBLIMITR_EL1	3	0	9	10	0
 Field	63:12	LIMIT
-Res0	11:6
+Res0	11:8
+Field	7	nVM
+Res0	6
 Field	5	PMFZ
 Res0	4:3
 Enum	2:1	FM
@@ -3085,7 +3087,8 @@ Field	63:0	PTR
 EndSysreg
 
 Sysreg	PMBSR_EL1	3	0	9	10	3
-Res0	63:32
+Res0	63:56
+Field	55:32	MSS2
 Enum	31:26	EC
 	0b000000	BUF
 	0b100100	FAULT_S1
@@ -3112,13 +3115,20 @@ Field	7:0	Attr
 EndSysreg
 
 Sysreg	PMBIDR_EL1	3	0	9	10	7
-Res0	63:12
+Res0	63:48
+Field	47:32	MaxBuffSize
+Res0	31:12
 Enum	11:8	EA
 	0b0000	NotDescribed
 	0b0001	Ignored
 	0b0010	SError
 EndEnum
-Res0	7:6
+Enum	7:6	AddrMode
+	0b00	VM_ONLY
+	0b01	BOTH
+	0b10	RESERVED
+	0b11	nVM_ONLY
+EndEnum
 Field	5	F
 Field	4	P
 Field	3:0	ALIGN
-- 
2.51.2


