Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC14CF65E7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 12:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eg+g0xuV3APnGlTONA7O8rnakUQlBYOov0J7fLTUZ4g=; b=Km6ux5zJeo0HRAX9UGrYhECZ9w
	udGpYTus2z3cgVrqUtkbbvAT8mMT4QE7EoEjPIx0jHSnWawm2LlptJt2y0xXowH1bjXoDc+s2hCBn
	0irZSBW94GPxI8/fyUW0u9SpTChGD2W8u7EnyTqhI9a0mubYtRx4+9tEV0Xi+VxvHu+d+nz1mI5sg
	5Oft2wLTegR4fi9I2jq9eVYU2rBZUvOKS91b/01PrBVfmSe1DDk0bP4h6mZ9EJEyaeXz8GmZP5Obd
	5QkwZ1Kpo31ETm/o+8hOg8u+z4wU/QPF5h/MzAVBwAFzBzYHUDYv+RaHEqFSHhCNsLuYIwbcgl3Mi
	sB5rzovA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLXF-0000000CUtP-095j;
	Mon, 26 Jan 2026 12:17:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLXD-0000000CUr1-20vF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 12:17:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B6586011E;
	Mon, 26 Jan 2026 12:17:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CD15C2BC86;
	Mon, 26 Jan 2026 12:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769429854;
	bh=W6aUcfR9P06fNpLZkftVeeNOlRaq4qkBHgSGXSIxS0c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kAaWomuVtupR6m6p9Z0B4UoySa61XPmOnESWEjl75OKQcpqlCa0kzKPOWcs505SEf
	 LxqtUy25BSNGJ0/pxdC07uBirD2qT1LQpaFVXXSGmRDbT6Z3kSXgpA1YS8jsCismwk
	 AlyBvgaqvq0TCvt9R/8qTQuoBgirp2tnzJ5lC0cjI4jzvtu1WtE/hZIiUTDLpFbAdT
	 UVz+i8PMWq1aOfrtNHeTgGqg8hLyyy77nNzqdzZzhgLlp/1IgJlss6s8qQFx6CthIv
	 0R5evYDh3ry7cRY6JlwW5diXKfM5QCd61voYBRCXU0c162IBAoPOk8Np3MhHmV3nid
	 rVY9+xNerdjbw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vkLXA-00000005hx6-12Qr;
	Mon, 26 Jan 2026 12:17:32 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH 03/20] KVM: arm64: Introduce standalone FGU computing primitive
Date: Mon, 26 Jan 2026 12:16:37 +0000
Message-ID: <20260126121655.1641736-4-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260126121655.1641736-1-maz@kernel.org>
References: <20260126121655.1641736-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
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

Computing the FGU bits is made oddly complicated, as we use the RES0
helper instead of using a specific abstraction.

Introduce such an abstraction, which is going to make things significantly
simpler in the future.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/config.c | 57 ++++++++++++++++++-----------------------
 1 file changed, 25 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index 0bcdb39885734..2122599f7cbbd 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -1335,26 +1335,30 @@ static u64 compute_res0_bits(struct kvm *kvm,
 static u64 compute_reg_res0_bits(struct kvm *kvm,
 				 const struct reg_feat_map_desc *r,
 				 unsigned long require, unsigned long exclude)
-
 {
 	u64 res0;
 
 	res0 = compute_res0_bits(kvm, r->bit_feat_map, r->bit_feat_map_sz,
 				 require, exclude);
 
-	/*
-	 * If computing FGUs, don't take RES0 or register existence
-	 * into account -- we're not computing bits for the register
-	 * itself.
-	 */
-	if (!(exclude & NEVER_FGU)) {
-		res0 |= compute_res0_bits(kvm, &r->feat_map, 1, require, exclude);
-		res0 |= ~reg_feat_map_bits(&r->feat_map);
-	}
+	res0 |= compute_res0_bits(kvm, &r->feat_map, 1, require, exclude);
+	res0 |= ~reg_feat_map_bits(&r->feat_map);
 
 	return res0;
 }
 
+static u64 compute_fgu_bits(struct kvm *kvm, const struct reg_feat_map_desc *r)
+{
+	/*
+	 * If computing FGUs, we collect the unsupported feature bits as
+	 * RES0 bits, but don't take the actual RES0 bits or register
+	 * existence into account -- we're not computing bits for the
+	 * register itself.
+	 */
+	return compute_res0_bits(kvm, r->bit_feat_map, r->bit_feat_map_sz,
+				 0, NEVER_FGU);
+}
+
 static u64 compute_reg_fixed_bits(struct kvm *kvm,
 				  const struct reg_feat_map_desc *r,
 				  u64 *fixed_bits, unsigned long require,
@@ -1370,40 +1374,29 @@ void compute_fgu(struct kvm *kvm, enum fgt_group_id fgt)
 
 	switch (fgt) {
 	case HFGRTR_GROUP:
-		val |= compute_reg_res0_bits(kvm, &hfgrtr_desc,
-					     0, NEVER_FGU);
-		val |= compute_reg_res0_bits(kvm, &hfgwtr_desc,
-					     0, NEVER_FGU);
+		val |= compute_fgu_bits(kvm, &hfgrtr_desc);
+		val |= compute_fgu_bits(kvm, &hfgwtr_desc);
 		break;
 	case HFGITR_GROUP:
-		val |= compute_reg_res0_bits(kvm, &hfgitr_desc,
-					     0, NEVER_FGU);
+		val |= compute_fgu_bits(kvm, &hfgitr_desc);
 		break;
 	case HDFGRTR_GROUP:
-		val |= compute_reg_res0_bits(kvm, &hdfgrtr_desc,
-					     0, NEVER_FGU);
-		val |= compute_reg_res0_bits(kvm, &hdfgwtr_desc,
-					     0, NEVER_FGU);
+		val |= compute_fgu_bits(kvm, &hdfgrtr_desc);
+		val |= compute_fgu_bits(kvm, &hdfgwtr_desc);
 		break;
 	case HAFGRTR_GROUP:
-		val |= compute_reg_res0_bits(kvm, &hafgrtr_desc,
-					     0, NEVER_FGU);
+		val |= compute_fgu_bits(kvm, &hafgrtr_desc);
 		break;
 	case HFGRTR2_GROUP:
-		val |= compute_reg_res0_bits(kvm, &hfgrtr2_desc,
-					     0, NEVER_FGU);
-		val |= compute_reg_res0_bits(kvm, &hfgwtr2_desc,
-					     0, NEVER_FGU);
+		val |= compute_fgu_bits(kvm, &hfgrtr2_desc);
+		val |= compute_fgu_bits(kvm, &hfgwtr2_desc);
 		break;
 	case HFGITR2_GROUP:
-		val |= compute_reg_res0_bits(kvm, &hfgitr2_desc,
-					     0, NEVER_FGU);
+		val |= compute_fgu_bits(kvm, &hfgitr2_desc);
 		break;
 	case HDFGRTR2_GROUP:
-		val |= compute_reg_res0_bits(kvm, &hdfgrtr2_desc,
-					     0, NEVER_FGU);
-		val |= compute_reg_res0_bits(kvm, &hdfgwtr2_desc,
-					     0, NEVER_FGU);
+		val |= compute_fgu_bits(kvm, &hdfgrtr2_desc);
+		val |= compute_fgu_bits(kvm, &hdfgwtr2_desc);
 		break;
 	default:
 		BUG();
-- 
2.47.3


