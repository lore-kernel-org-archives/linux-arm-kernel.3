Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F72CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P8gHcAXRVnhX7bf/JMYlU0gKp9t3RAqFT2blU+b57cU=; b=Jj4Uu5UYknZ2WEYdHxArYI7k2l
	baC7sFC6gauWWhfWoI9V/iAK2kECax5vtDafkK8GV34XSHpdQ39eL18CW0iU5VwUlHDzBuYb/c6QP
	6+GSh39e7K6OJDkprDJzhFiwhzVS/NO3hUTTKuVOTBOMrBwVLVru6c5mTd9AmgbopJfAJfkCRPzEB
	htKMkWKfRXHR6slkC4sbk8MjVhSf1bH1xpL451PZln9KhmxAWSztuKP/139pMH2HE4dp2YEzzMRsi
	9yUc723/OXFZNPD3e5JV/CAvySe3qUfk6D9XKrDMsHvDoHoX5uUkSsPklpfcdIpMSZ90GLm7wb9tc
	9pZuzwfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGLc-00000000JTA-1Zb4;
	Thu, 18 Sep 2025 15:15:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGL8-00000000J37-2sMn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 15:14:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 20CEE6024D;
	Thu, 18 Sep 2025 15:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5BCFC4CEFB;
	Thu, 18 Sep 2025 15:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758208469;
	bh=mHSphCkW3+4FibtzIPn4VoAtJ2QhcYOpjw7Naeo/RP4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fkvpkmktz62LTJQhjz0jCwOQFKd696tMff4TfrI6vmCLGuu6DMwKsDaixnkflpi0O
	 MzG531wt0IWq9YHchcH/PcncT847XCeWkoxBrLCuE/1wI854QwrL8Yl062/HAvhz25
	 bSq8H3V801X9co86Nj29PCNK8oegohvlZnA2b7dv/SvruLlmV/NGWmsCOxyHta0LmU
	 T1X33k8abbgfn0rrCrGT6uSSD9Y5KGjDdjC0EiZ6SoZcEzUBISBMapZ+scrMk+QyAn
	 /ngwhWEZArQMF23vJyEOKp9vBHRaOvY8JIeCFa+DdtRIMauXbpJSshAVh7R3Lz1upA
	 lmtLoGBV8fLOA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uzGL6-00000007TmF-0to1;
	Thu, 18 Sep 2025 15:14:28 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Jinqian Yang <yangjinqian1@huawei.com>
Subject: [PATCH v2 10/10] KVM: arm64: Convert MDCR_EL2 RES0 handling to compute_reg_res0_bits()
Date: Thu, 18 Sep 2025 16:14:02 +0100
Message-Id: <20250918151402.1665315-11-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250918151402.1665315-1-maz@kernel.org>
References: <20250918151402.1665315-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, yangjinqian1@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

While MDCR_EL2 cannot be RES0, convert it to the same infrastructure
anyway, as it make things cleaner.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/config.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index 7b5c5044d4f64..109d1edcd83d4 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -1162,6 +1162,9 @@ static const struct reg_bits_to_feat_map mdcr_el2_feat_map[] = {
 		   FEAT_AA64EL1),
 };
 
+static const DECLARE_FEAT_MAP(mdcr_el2_desc, MDCR_EL2,
+			      mdcr_el2_feat_map, FEAT_AA64EL2);
+
 static void __init check_feat_map(const struct reg_bits_to_feat_map *map,
 				  int map_size, u64 res0, const char *str)
 {
@@ -1204,8 +1207,7 @@ void __init check_feature_map(void)
 	check_reg_desc(&sctlr2_desc);
 	check_reg_desc(&tcr2_el2_desc);
 	check_reg_desc(&sctlr_el1_desc);
-	check_feat_map(mdcr_el2_feat_map, ARRAY_SIZE(mdcr_el2_feat_map),
-		       MDCR_EL2_RES0, "MDCR_EL2");
+	check_reg_desc(&mdcr_el2_desc);
 }
 
 static bool idreg_feat_match(struct kvm *kvm, const struct reg_bits_to_feat_map *map)
@@ -1417,8 +1419,7 @@ void get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg, u64 *res0, u64 *r
 		*res1 = SCTLR_EL1_RES1;
 		break;
 	case MDCR_EL2:
-		*res0 = compute_res0_bits(kvm, mdcr_el2_feat_map,
-					  ARRAY_SIZE(mdcr_el2_feat_map), 0, 0);
+		*res0 = compute_reg_res0_bits(kvm, &mdcr_el2_desc, 0, 0);
 		*res0 |= MDCR_EL2_RES0;
 		*res1 = MDCR_EL2_RES1;
 		break;
-- 
2.39.2


