Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00AC6E9B371
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 11:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CqcMPXVC6Z2wduLlHr8nkj7dm9qVqZ1xy72adokVf28=; b=YmjvW7XAlBUKOzpGwV4941Yzg4
	tgO3UMg4F5OubWFPiMwVNsbYlkagGthpU16RuK0le9n3JbJ8SqqHmeErqDNBv3jm0++Y1cNtidIeQ
	u7TiOfTtV/mETSq5KiKYiXfS5HLR/kF378KKNQaDJM0K5tOEoV7sM4HV6J92Ee1fx0gH70wYO1rMD
	UtPgATT6ee0FqixJlawyZEDMcNJCQBptEACNoCsmcK10+GbyBQn8PgIR3KzDygXD5G6s5CX6NW97N
	5uxSeGRu5FQbVlFV/v7vd4mM3lR7JdFiyvyJVBZnwxINSQ3e12SbdG0mJs8EvbQGk7H5THUGUIDbN
	b3GvVe6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1tn-0000000CsMR-1nc0;
	Mon, 02 Mar 2026 11:57:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1tk-0000000CsIY-1GBB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 11:57:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EE08E44580;
	Mon,  2 Mar 2026 11:57:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBC1EC2BCB0;
	Mon,  2 Mar 2026 11:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772452635;
	bh=deRj+9TylccUHPGZfWLldzliB/6yc9WG4BmX+5DwoFs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=if0tEaq7q++sSLV+ooiEE3K2Iuk1Loy9O7y2zNKJufn/ATtT9+fH8eJmPX6ITqkpQ
	 7+dJWzUcMFYKHSu2kEyiYUZmsyyZ9SINi1stVbUfYrIkFvF072XsTQ1Y9NlykF3lOB
	 J1PjQvrRQAZ0l6fRjFXHs72FTQ9d1hEUH6GI4xBteBzZBDR2hXeWXO5Wu7xIV162bp
	 YX24bzkJt+tdW/hS4K1SHFV/BQC4unuRgQ9H3wMdSO8dZbl4u13AO4foQPFIkswT52
	 AtChUMIQq3JAeiLof2zGKFSQrxpqAAqtVU+OlWNBvEMl/OuQHrIBCbLI9md+9gJKL+
	 mB8bXdUzdtWgg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vx1th-0000000FDFJ-48kJ;
	Mon, 02 Mar 2026 11:57:14 +0000
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
Subject: [PATCH v2 05/11] arm64: Convert CONFIG_ARM64_SVE to FTR_CONFIG()
Date: Mon,  2 Mar 2026 11:56:46 +0000
Message-ID: <20260302115653.1517326-6-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302115653.1517326-1-maz@kernel.org>
References: <20260302115653.1517326-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, tabba@google.com, will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_035716_397543_73626B94 
X-CRM114-Status: GOOD (  11.51  )
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

While CONFIG_ARM64_SVE=n prevents userspace from using SVE,
the sanitised ID registers still advertise the feature.

Make it clear that nothing in the kernel should rely on this by
marking the feature as hidden for all when CONFIG_ARM64_SVE=n.

This is functionnaly equivalent to using arm64.nosve on the kernel
command-line.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kernel/cpufeature.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 0726c2a186028..b5b19f21709f1 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -293,7 +293,7 @@ static const struct arm64_ftr_bits ftr_id_aa64pfr0[] = {
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL1_AMU_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL1_MPAM_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL1_SEL2_SHIFT, 4, 0),
-	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SVE),
+	ARM64_FTR_BITS(FTR_CONFIG(CONFIG_ARM64_SVE, VISIBLE, ALL_HIDDEN),
 				   FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL1_SVE_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL1_RAS_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL1_GIC_SHIFT, 4, 0),
@@ -331,29 +331,29 @@ static const struct arm64_ftr_bits ftr_id_aa64pfr2[] = {
 };
 
 static const struct arm64_ftr_bits ftr_id_aa64zfr0[] = {
-	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SVE),
+	ARM64_FTR_BITS(FTR_CONFIG(CONFIG_ARM64_SVE, VISIBLE, ALL_HIDDEN),
 		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ZFR0_EL1_F64MM_SHIFT, 4, 0),
-	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SVE),
+	ARM64_FTR_BITS(FTR_CONFIG(CONFIG_ARM64_SVE, VISIBLE, ALL_HIDDEN),
 		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ZFR0_EL1_F32MM_SHIFT, 4, 0),
-	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SVE),
+	ARM64_FTR_BITS(FTR_CONFIG(CONFIG_ARM64_SVE, VISIBLE, ALL_HIDDEN),
 		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ZFR0_EL1_F16MM_SHIFT, 4, 0),
-	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SVE),
+	ARM64_FTR_BITS(FTR_CONFIG(CONFIG_ARM64_SVE, VISIBLE, ALL_HIDDEN),
 		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ZFR0_EL1_I8MM_SHIFT, 4, 0),
-	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SVE),
+	ARM64_FTR_BITS(FTR_CONFIG(CONFIG_ARM64_SVE, VISIBLE, ALL_HIDDEN),
 		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ZFR0_EL1_SM4_SHIFT, 4, 0),
-	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SVE),
+	ARM64_FTR_BITS(FTR_CONFIG(CONFIG_ARM64_SVE, VISIBLE, ALL_HIDDEN),
 		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ZFR0_EL1_SHA3_SHIFT, 4, 0),
-	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SVE),
+	ARM64_FTR_BITS(FTR_CONFIG(CONFIG_ARM64_SVE, VISIBLE, ALL_HIDDEN),
 		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ZFR0_EL1_B16B16_SHIFT, 4, 0),
-	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SVE),
+	ARM64_FTR_BITS(FTR_CONFIG(CONFIG_ARM64_SVE, VISIBLE, ALL_HIDDEN),
 		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ZFR0_EL1_BF16_SHIFT, 4, 0),
-	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SVE),
+	ARM64_FTR_BITS(FTR_CONFIG(CONFIG_ARM64_SVE, VISIBLE, ALL_HIDDEN),
 		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ZFR0_EL1_BitPerm_SHIFT, 4, 0),
-	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SVE),
+	ARM64_FTR_BITS(FTR_CONFIG(CONFIG_ARM64_SVE, VISIBLE, ALL_HIDDEN),
 		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ZFR0_EL1_EltPerm_SHIFT, 4, 0),
-	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SVE),
+	ARM64_FTR_BITS(FTR_CONFIG(CONFIG_ARM64_SVE, VISIBLE, ALL_HIDDEN),
 		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ZFR0_EL1_AES_SHIFT, 4, 0),
-	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SVE),
+	ARM64_FTR_BITS(FTR_CONFIG(CONFIG_ARM64_SVE, VISIBLE, ALL_HIDDEN),
 		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ZFR0_EL1_SVEver_SHIFT, 4, 0),
 	ARM64_FTR_END,
 };
-- 
2.47.3


