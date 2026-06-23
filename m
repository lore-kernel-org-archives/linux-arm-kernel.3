Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2A5CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 00:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xK7gA+mNqCVOPxICiu0g2rIIo2TaGMOn0j7mn87G6BY=; b=jOreFLK7LZnprN5evnDmL25s2A
	vvxfDrY5UyB4L7HE2QPLmP4AMTmMt9DPj7c15XvI7Umwa39zilcG9U6yh7qYrjeeSvXV59v7Fa1MM
	ld8RQ1TIHlkeXuHACvAR5hS6OtINS0bLcd1xrcYbuuCyiPpacXjnL+J36Xd+IO8KpX+iZYT7bd5CV
	MjuAho8TkhQddXnBPwdehZwScu7T0fjRafRzoQLyA0G9AgV92NlL80yqVg48hQ+bE6jb6jzCnaPEM
	879mtKIT7VVnk3ZCcsmBG7X7JK+tDSXO23ujqs726w0Tpua2GEBHZ1Dtoumew1ljBEBfydRH2VWkK
	YZIkfsnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbpQo-00000005VQH-1E1P;
	Tue, 23 Jun 2026 00:56:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbpQm-00000005VNK-2uW8;
	Tue, 23 Jun 2026 00:56:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E4466445EC;
	Tue, 23 Jun 2026 00:55:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 87EEEC4AF0C;
	Tue, 23 Jun 2026 00:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782176159;
	bh=oNsgaMXHLlra24NBdq6RupRTEMcGejIGKTuUqnPeGlc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XUCVxddJ7E37Zsb18RDSYXf7Q+Gnlw5Y4kLEc8tPN5uKvf69pWTg6dlQr+C5YSeea
	 mLdaP0iiElbkdHJqI5pA+GMtR8VighNl7ttZNzkfOIC3XkFpS9/jS5TgK53mIqfDFs
	 cOZGniFooBs4JZ6Ysxv2/Zdh/oEjOWr10sVV9QhJhDVqR+HcGujLsq+B8WqzLAD3bK
	 A2KDdYVZPuib4xoFV5HY+or1ieQNcXkEUV9ornFHcRGPYKm8/b6cKYWaDVYcTs0FgS
	 qIubNwQNAXfK1i4v2Mqyodf+beczJu8k4nI39hAPkk6Q5UO5iNxkdRk0jKjR1p7szH
	 jJenLsCNM7G3w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C60FCDB466;
	Tue, 23 Jun 2026 00:55:59 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Mon, 22 Jun 2026 20:54:27 -0400
Subject: [PATCH 6/8] phy: qcom: qmp-combo: Drop qmp_v4_calibrate_dp_phy
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-sm8450-qol-v1-6-37e2ee8df9da@proton.me>
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
In-Reply-To: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782176157; l=6420;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=wemVUjwDy8ay4aX+zEx9KZVN32QTCYOm+vzvoGiRPdw=;
 b=71NzxZTLzOO2ipMLH3BnWIj19jwKf1VRFD5vUryZvbHlr+TCQ7bxi0cBxo2s5FyUWg5wy1JB0
 DUplzvUgRHCC0+49q1Q/QmBuABM1wOL/TPK1VfplNV5Btfqbwa+LFSA
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
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
Reply-To: esteuwu@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Esteban Urrutia <esteuwu@proton.me>

There are no downstream device trees that specify five values in the
qcom,aux-cfg1-settings array.
Plus, after cross referencing both downstream device trees and entries
which refer this function, only 0x13 is specified.
Since 0x13 is written at initialization time, drop this function as a
whole, and remove now unused variable assignations.

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 31 -------------------------------
 1 file changed, 31 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index cdcfad2e86b1..9bd666ac2c49 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -2325,7 +2325,6 @@ static int qmp_v3_calibrate_dp_phy(struct qmp_combo *qmp);
 static void qmp_v4_dp_aux_init(struct qmp_combo *qmp);
 static void qmp_v4_configure_dp_tx(struct qmp_combo *qmp);
 static int qmp_v4_configure_dp_phy(struct qmp_combo *qmp);
-static int qmp_v4_calibrate_dp_phy(struct qmp_combo *qmp);
 
 static void qmp_v8_dp_aux_init(struct qmp_combo *qmp);
 static int qmp_v8_configure_dp_clocks(struct qmp_combo *qmp);
@@ -2466,7 +2465,6 @@ static const struct qmp_phy_cfg sar2130p_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
-	.calibrate_dp_phy	= qmp_v4_calibrate_dp_phy,
 
 	.regs			= qmp_v6_usb3phy_regs_layout,
 	.reset_list		= msm8996_usb3phy_reset_l,
@@ -2603,7 +2601,6 @@ static const struct qmp_phy_cfg sc8180x_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
-	.calibrate_dp_phy	= qmp_v4_calibrate_dp_phy,
 
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
@@ -2650,7 +2647,6 @@ static const struct qmp_phy_cfg sc8280xp_usb43dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
-	.calibrate_dp_phy	= qmp_v4_calibrate_dp_phy,
 
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
@@ -2696,7 +2692,6 @@ static const struct qmp_phy_cfg x1e80100_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
-	.calibrate_dp_phy	= qmp_v4_calibrate_dp_phy,
 
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
@@ -2785,7 +2780,6 @@ static const struct qmp_phy_cfg sm8250_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
-	.calibrate_dp_phy	= qmp_v4_calibrate_dp_phy,
 
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
@@ -2834,7 +2828,6 @@ static const struct qmp_phy_cfg sm8350_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
-	.calibrate_dp_phy	= qmp_v4_calibrate_dp_phy,
 
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
@@ -2882,7 +2875,6 @@ static const struct qmp_phy_cfg sm8550_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
-	.calibrate_dp_phy	= qmp_v4_calibrate_dp_phy,
 
 	.regs			= qmp_v6_usb3phy_regs_layout,
 	.reset_list		= msm8996_usb3phy_reset_l,
@@ -2928,7 +2920,6 @@ static const struct qmp_phy_cfg sm8650_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
-	.calibrate_dp_phy	= qmp_v4_calibrate_dp_phy,
 
 	.regs			= qmp_v6_usb3phy_regs_layout,
 	.reset_list		= msm8996_usb3phy_reset_l,
@@ -2974,7 +2965,6 @@ static const struct qmp_phy_cfg sm8750_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
-	.calibrate_dp_phy	= qmp_v4_calibrate_dp_phy,
 
 	.regs			= qmp_v8_usb3phy_regs_layout,
 	.reset_list		= msm8996_usb3phy_reset_l,
@@ -3020,7 +3010,6 @@ static const struct qmp_phy_cfg glymur_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v8_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v8_configure_dp_phy,
-	.calibrate_dp_phy	= qmp_v4_calibrate_dp_phy,
 
 	.regs			= qmp_v8_n3_usb43dpphy_regs_layout,
 	.reset_list		= msm8996_usb3phy_reset_l,
@@ -3316,7 +3305,6 @@ static void qmp_v4_dp_aux_init(struct qmp_combo *qmp)
 	writel(0x03, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG7);
 	writel(0xb7, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG8);
 	writel(0x03, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG9);
-	qmp->dp_aux_cfg = 0;
 
 	writel(PHY_AUX_STOP_ERR_MASK | PHY_AUX_DEC_ERR_MASK |
 	       PHY_AUX_SYNC_ERR_MASK | PHY_AUX_ALIGN_ERR_MASK |
@@ -3345,7 +3333,6 @@ static void qmp_v8_dp_aux_init(struct qmp_combo *qmp)
 	writel(0x03, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG7);
 	writel(0xb7, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG8);
 	writel(0x03, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG9);
-	qmp->dp_aux_cfg = 0;
 
 	writel(PHY_AUX_STOP_ERR_MASK | PHY_AUX_DEC_ERR_MASK |
 	       PHY_AUX_SYNC_ERR_MASK | PHY_AUX_ALIGN_ERR_MASK |
@@ -3605,24 +3592,6 @@ static int qmp_v8_configure_dp_phy(struct qmp_combo *qmp)
 	return 0;
 }
 
-/*
- * We need to calibrate the aux setting here as many times
- * as the caller tries
- */
-static int qmp_v4_calibrate_dp_phy(struct qmp_combo *qmp)
-{
-	static const u8 cfg1_settings[] = { 0x20, 0x13, 0x23, 0x1d };
-	u8 val;
-
-	qmp->dp_aux_cfg++;
-	qmp->dp_aux_cfg %= ARRAY_SIZE(cfg1_settings);
-	val = cfg1_settings[qmp->dp_aux_cfg];
-
-	writel(val, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG1);
-
-	return 0;
-}
-
 static int qmp_combo_dp_configure(struct phy *phy, union phy_configure_opts *opts)
 {
 	const struct phy_configure_opts_dp *dp_opts = &opts->dp;

-- 
2.54.0



