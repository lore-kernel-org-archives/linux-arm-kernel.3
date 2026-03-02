Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71673E9B36D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 11:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wn+GDZm2nDFWg8hbNMZ8TDAK9q3fla18e121Gx/yLaI=; b=QazhidaWkWoCq/dI9E+Qc15NGX
	nlIkVZZYcpXKxM+iPccH1PBZzxDRKMrinOcuxe4/WsqcruRruT6jVAdurw3U8Z1KdZJsTSQ3pdpG7
	YmGxAgRmEOvzm4+YnMEagXSXFhidVXRa6vLsFlWRdjaTE46anQiwzvCTwzZ3QaHbK0zD7Kf7fLmI6
	q7uKr+QaX2cKGHO4/qkRNK+lWmljlkLjY2gPXZNUkFHeGdZ/X3RU2ks1K1QlcqErJJEnSbQpTaSAJ
	Lc4nFHxifUOdGfaxiWFAtqNs7zO/XdHs2i2DudvPMMKAN3CBs7RqMVLXt3wTdRWfKdTsqD8bXLJ9t
	fe4y+gyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1to-0000000CsNU-0PFr;
	Mon, 02 Mar 2026 11:57:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1tk-0000000CsIV-2Isc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 11:57:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C470B4456E;
	Mon,  2 Mar 2026 11:57:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F8E4C19423;
	Mon,  2 Mar 2026 11:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772452635;
	bh=8oGe14Z8q8IrahnikjJaKcAbm9DsPBgVywyWzpiAAPQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dDUehnos18AKMFxCzAiDS0gvYAgt73c8AE8O+7gnBHEG3KWSlpLXrtgXWB4T8YqR5
	 ZrefcMmRaoRFbVb/X3wIFa44bAWggul/4oXFGt41DC6pn2jcdZsLSz2YSlafbUAXYg
	 szvMfDjDOuWseW1c8Ge7JpxNU8CaBQY4y/DEUawJWuOxPW8Ye6cqoqxhnAo/5J1zCb
	 2BWObvQKt+C9moH5i7rcPH/tmKRprqdKcRM73UvJmslCgFqWOwB8l3hqUx8JOUretq
	 RT1qAMvJufTDdg8ko76MWZpwQ/gZRawnIh/2moEX7CYnJIBTr7K0xVDIT5uNUKKN5X
	 oWz+FjwIRVW9A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vx1th-0000000FDFJ-3AN9;
	Mon, 02 Mar 2026 11:57:13 +0000
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
Subject: [PATCH v2 04/11] arm64: Convert CONFIG_ARM64_PTR_AUTH to FTR_CONFIG()
Date: Mon,  2 Mar 2026 11:56:45 +0000
Message-ID: <20260302115653.1517326-5-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20260302_035716_645635_C8351938 
X-CRM114-Status: GOOD (  12.17  )
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
index 965dd2acf0640..0726c2a186028 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -248,16 +248,16 @@ static const struct arm64_ftr_bits ftr_id_aa64isar1[] = {
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
@@ -270,9 +270,9 @@ static const struct arm64_ftr_bits ftr_id_aa64isar2[] = {
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


