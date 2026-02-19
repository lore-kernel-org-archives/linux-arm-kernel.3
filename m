Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7F8C531CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 19:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OrKjObcVnktdng3MaHpYo+sRHMBrJYdmlcdWSWQ+W3Q=; b=N0QY/eUo/Pxs8imnYapupL7NN3
	paw3DtLCTwGI8CI6o/2AArdFDF3b/xrpQWqyNF570qcP0IVG/t375T2jBULXzstSFyrloe82RSyza
	zTKpUBZVp6PU9Roi07lSBEaqrffruxoWH7v8OYZhQ166hjLGeWSkxO1dTOU0/t4Z40ewvQmb/zBPR
	Xn2pfawjfvDoqo2Ilae9C6B6c6SAThY5LWUZmg9CFq6W604sNcbjlLba3qfuUNkGnrW0neaG9bmKY
	91h6USPTK81dHSZIp+IVsiibdpEk/KyfXHoRxxcjoExhZNAaANppdr3CLs43ugjioAi7gwUD3xpz4
	IVJgRHDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtA7w-0000000BtG6-0AeY;
	Thu, 19 Feb 2026 19:55:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtA7o-0000000BtBj-3rSu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 19:55:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EF07444499;
	Thu, 19 Feb 2026 19:55:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4371C19423;
	Thu, 19 Feb 2026 19:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771530947;
	bh=ra6ZXjBUgr5NeCCDN4jJSvWIzYbVtmiPtz2uAL75yMM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mV0aWKGvtFRgyma7BZGSaAUl80uGyre7Me8PNuPH/HPsmv6O0jvQb9LK0ynrD5S3E
	 tn/ZbpLhg+jIzHIVp+loChaddMndU0BHOXfPNrGIxEmyHQ2dTSbdN/nVP5cZmjwuK4
	 /pWbcSZryENnEPvjKPIpPKJ4wq1qdF4y3pK03K0fut3ruP9d5XsBAIrWyPznRVsd2Q
	 ZmBX5cWy2ur2LsK7aNp3B06Xc2Yl28w41JiIBCnKvATl1bV2G4Ln2fwoPkUwvRxjoS
	 s/qyu/XMNc2Eo7y9mI5T/ANS5QDm+g3Tn8mh8zwv9Gyr3EmXJq+MVkv6qZBGLTZFr9
	 MYxi6M3qmMM/g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vtA7l-0000000CGHL-33a7;
	Thu, 19 Feb 2026 19:55:45 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 2/9] arm64: Convert CONFIG_ARM64_PTR_AUTH to FTR_CONFIG()
Date: Thu, 19 Feb 2026 19:55:25 +0000
Message-ID: <20260219195533.2455736-3-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260219195533.2455736-1-maz@kernel.org>
References: <20260219195533.2455736-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, tabba@google.com, will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_115549_015590_65D8B656 
X-CRM114-Status: GOOD (  11.72  )
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

While CONFIG_ARM64_PTR_AUTH=n prevents userspace from using PAC,
the sanitised ID registers still advertise the feature.

Make it clear that nothing in the kernel should rely on this by
marking the feature as hidden for all when CONFIG_ARM64_PTR_AUTH=n.

This is functionnaly equivalent to using arm64.nopauth on the kernel
command-line.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kernel/cpufeature.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index b34a39967d111..7ad124faae08e 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -247,16 +247,16 @@ static const struct arm64_ftr_bits ftr_id_aa64isar1[] = {
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_EL1_SPECRES_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_EL1_SB_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_EL1_FRINTTS_SHIFT, 4, 0),
-	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_PTR_AUTH),
+	ARM64_FTR_BITS(FTR_CONFIG(CONFIG_ARM64_PTR_AUTH, VISIBLE, ALL_HIDDEN),
 		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_EL1_GPI_SHIFT, 4, 0),
-	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_PTR_AUTH),
+	ARM64_FTR_BITS(FTR_CONFIG(CONFIG_ARM64_PTR_AUTH, VISIBLE, ALL_HIDDEN),
 		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_EL1_GPA_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_EL1_LRCPC_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_EL1_FCMA_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_EL1_JSCVT_SHIFT, 4, 0),
-	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_PTR_AUTH),
+	ARM64_FTR_BITS(FTR_CONFIG(CONFIG_ARM64_PTR_AUTH, VISIBLE, ALL_HIDDEN),
 		       FTR_STRICT, FTR_EXACT, ID_AA64ISAR1_EL1_API_SHIFT, 4, 0),
-	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_PTR_AUTH),
+	ARM64_FTR_BITS(FTR_CONFIG(CONFIG_ARM64_PTR_AUTH, VISIBLE, ALL_HIDDEN),
 		       FTR_STRICT, FTR_EXACT, ID_AA64ISAR1_EL1_APA_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_EL1_DPB_SHIFT, 4, 0),
 	ARM64_FTR_END,
@@ -269,9 +269,9 @@ static const struct arm64_ftr_bits ftr_id_aa64isar2[] = {
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR2_EL1_CLRBHB_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR2_EL1_BC_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR2_EL1_MOPS_SHIFT, 4, 0),
-	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_PTR_AUTH),
+	ARM64_FTR_BITS(FTR_CONFIG(CONFIG_ARM64_PTR_AUTH, VISIBLE, ALL_HIDDEN),
 		       FTR_STRICT, FTR_EXACT, ID_AA64ISAR2_EL1_APA3_SHIFT, 4, 0),
-	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_PTR_AUTH),
+	ARM64_FTR_BITS(FTR_CONFIG(CONFIG_ARM64_PTR_AUTH, VISIBLE, ALL_HIDDEN),
 		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR2_EL1_GPA3_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64ISAR2_EL1_RPRES_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64ISAR2_EL1_WFxT_SHIFT, 4, 0),
-- 
2.47.3


