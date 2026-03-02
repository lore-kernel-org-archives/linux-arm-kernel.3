Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA349E9B36D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 11:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ApPcw5892NAeo01XKkl5KkaXCG0gUIfB7EqXY8kDMQ=; b=eoXWgy9NjBDct+pkLEfwkfwen1
	Esp0gkcTXcn5ruCWGqxY5nTaW7cfDjVdQgC2YapK2iz2O00EaU4MHwxiXzJcVPhUKSaLFKdVwfDPb
	vLl5eoc7OFyAp28xNL1wwEY1rbmSEbcJpIvuptQDCn5lf0fixvZFpF6Px2ibcx6T+WXZZJK8gFHj6
	BmNxf1P9yh387448y/cjD4fq52iE4UDpteGRZ4yhm6ADdQ9yVZeK1jSCBhPzwCHz1GDGIt+yDONU1
	QTdl+sJWDQ55AuqzraJuXUAAvYL0soF6d8DYyNPsZx5cfat6XDTZoGDRhXcCiWsPLtIyNh/kHZM3y
	8/tCXcAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1ts-0000000CsTJ-1DtI;
	Mon, 02 Mar 2026 11:57:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1tl-0000000CsJy-30Ov
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 11:57:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 03BBE4458F;
	Mon,  2 Mar 2026 11:57:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7082C2BCB0;
	Mon,  2 Mar 2026 11:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772452636;
	bh=4NI4YbXlZQ+Hrykvr691ZaobjrUfrAdSa9UBSGJ1ROc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A1y+ZBX4+AMI+PWt0fDw3GJWRfFJD+TaLiJ+inPy9LqA0twVySXLAYufrEICbelyA
	 SaH15BBd7K/YrvSY0gccXzEhVhDtqbmGKhcMM6CJ++axfnuaqgpWgEOIWIwKoRNHDJ
	 +tCIOvDFUZReNL73qtFwgY7bhDnE7NsYtUYekGo62XypgIwJvx8HDTKqaGgyb9RSS5
	 rMXcVuVVz8EXwDrPg/D78cHRyutXGjG1WdBrgyBj0NQGRv/KrcMmrB5cb6M9px1tB7
	 bofpiligij0o3S+JPwLS+dQhoe5aCJW1EOJWiIjdN7cJcMVOsON9LdvTZlSJqzdrZX
	 ENgU5CIF4avNQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vx1tj-0000000FDFJ-0WGu;
	Mon, 02 Mar 2026 11:57:15 +0000
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
Subject: [PATCH v2 10/11] arm64: Convert CONFIG_ARM64_BTI to FTR_CONFIG()
Date: Mon,  2 Mar 2026 11:56:51 +0000
Message-ID: <20260302115653.1517326-11-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20260302_035717_794574_739ECE8C 
X-CRM114-Status: GOOD (  13.83  )
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

Even if the kernel doesn't use BTI and doesn't expose it to userspace,
it is still OK to expose the feature to the rest of the kernel including
KVM, as there is no additional state attached to this feature.

The only purpose of this change is to kill the last user of the
FTR_VISIBLE_IF_IS_ENABLED() macro.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kernel/cpufeature.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 1af5f5b0c48a7..b3e94ad3f08a4 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -318,8 +318,8 @@ static const struct arm64_ftr_bits ftr_id_aa64pfr1[] = {
 	ARM64_FTR_BITS(FTR_CONFIG(CONFIG_ARM64_MTE, VISIBLE, ALL_HIDDEN),
 		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_MTE_SHIFT, 4, ID_AA64PFR1_EL1_MTE_NI),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_SSBS_SHIFT, 4, ID_AA64PFR1_EL1_SSBS_NI),
-	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_BTI),
-				    FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_BT_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_CONFIG(CONFIG_ARM64_BTI, VISIBLE, HIDDEN),
+		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_BT_SHIFT, 4, 0),
 	ARM64_FTR_END,
 };
 
-- 
2.47.3


