Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA21C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 00:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W4fc80i9yldHld5E91SEndMHqpfjSav0lIWuRboOxD8=; b=nB/jag3VKBbsZZezDI1o39E1Nc
	r+9ttkKzgI+8MrYmsX1k65LWFuZXFEltBiUnX1bCS4eZS5YIQmPOHs1jYjMBijtoumeQeDtNHhNfe
	PfCuUB2o/RCPRG9yyR1wpsn5wVDpar3hfLWSGGJgnhJgnoPgRw9Y6o2sYLbPHopyCzkgV3Aa3oV8G
	38yq7M+/N+c7kiU7aSAFAh8kAwFwDN45I26auyix2fUoQstyJgCDcfp44YVjw5tze6/tR03sIM2nq
	PtUYso7zf9TFQdZhJmST8NAOO6IUQeRdlprRzUAdSNMJlhx/w1evIIZV9oi/1sYU7JGeq9CM7J+78
	GDpb9HEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC5xx-00000009ElP-35CV;
	Tue, 06 May 2025 00:15:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4LG-00000008mXX-4ARV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 22:31:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4267B5C5521;
	Mon,  5 May 2025 22:29:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D396FC4CEF1;
	Mon,  5 May 2025 22:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484278;
	bh=g2l8e60TVojOygbW8eyFICSVVjr2ivWSE2C2kKPrgXI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m+PVU3wOOnnG2vNPqWGD826DoZkO5grGoRuoYr6IfWAZ9giht0tk5t82IKBFLUHcS
	 TQ+uiJEIO50u73K2MhmubaQ0OgugMnl97RHhaZLi6DmlqGI8k1TuyjVEJEwuRs6n9B
	 4tY1T9PjSw5Q8zE3F4g8G4EsNp/v3tue1KVs68SxOk4NCaoCaO73ghTLaKQYBqhL2l
	 VNBt0bUj1q7RTU/tSI6kwtM0FFIbhdsOpc5OJSdjR75OGlNorwWPqxFi7XBUqX/3R7
	 c8uoRsqXIAU/il6Oqm96UMnrpcgkw4DGseMcAjSdL7qfEbqW9ccFk7wnIhX4ApvMjm
	 MI5735vo4r7XA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alain Volmat <alain.volmat@foss.st.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 430/642] media: stm32: csi: use ARRAY_SIZE to search D-PHY table
Date: Mon,  5 May 2025 18:10:46 -0400
Message-Id: <20250505221419.2672473-430-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_153119_108126_64A1811B 
X-CRM114-Status: GOOD (  16.30  )
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

From: Alain Volmat <alain.volmat@foss.st.com>

[ Upstream commit a3a91b6e62be24c5df47a800c367504cb41e502b ]

Within stm32_csi_start, use ARRAY_SIZE loop in order to search
for the right setting.
Avoid useless init of lanes_ie / lanes_en.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/st/stm32/stm32-csi.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-csi.c b/drivers/media/platform/st/stm32/stm32-csi.c
index 48941aae8c9b8..a4f8db608cedd 100644
--- a/drivers/media/platform/st/stm32/stm32-csi.c
+++ b/drivers/media/platform/st/stm32/stm32-csi.c
@@ -325,7 +325,6 @@ static const struct stm32_csi_mbps_phy_reg snps_stm32mp25[] = {
 	{ .mbps = 2400, .hsfreqrange = 0x47,	.osc_freq_target = 442 },
 	{ .mbps = 2450, .hsfreqrange = 0x48,	.osc_freq_target = 451 },
 	{ .mbps = 2500, .hsfreqrange = 0x49,	.osc_freq_target = 460 },
-	{ /* sentinel */ }
 };
 
 static const struct v4l2_mbus_framefmt fmt_default = {
@@ -444,13 +443,13 @@ static void stm32_csi_phy_reg_write(struct stm32_csi_dev *csidev,
 static int stm32_csi_start(struct stm32_csi_dev *csidev,
 			   struct v4l2_subdev_state *state)
 {
-	const struct stm32_csi_mbps_phy_reg *phy_regs;
+	const struct stm32_csi_mbps_phy_reg *phy_regs = NULL;
 	struct v4l2_mbus_framefmt *sink_fmt;
 	const struct stm32_csi_fmts *fmt;
 	unsigned long phy_clk_frate;
+	u32 lanes_ie, lanes_en;
 	unsigned int mbps;
-	u32 lanes_ie = 0;
-	u32 lanes_en = 0;
+	unsigned int i;
 	s64 link_freq;
 	int ret;
 	u32 ccfr;
@@ -474,11 +473,14 @@ static int stm32_csi_start(struct stm32_csi_dev *csidev,
 	mbps = div_s64(link_freq, 500000);
 	dev_dbg(csidev->dev, "Computed Mbps: %u\n", mbps);
 
-	for (phy_regs = snps_stm32mp25; phy_regs->mbps != 0; phy_regs++)
-		if (phy_regs->mbps >= mbps)
+	for (i = 0; i < ARRAY_SIZE(snps_stm32mp25); i++) {
+		if (snps_stm32mp25[i].mbps >= mbps) {
+			phy_regs = &snps_stm32mp25[i];
 			break;
+		}
+	}
 
-	if (!phy_regs->mbps) {
+	if (!phy_regs) {
 		dev_err(csidev->dev, "Unsupported PHY speed (%u Mbps)", mbps);
 		return -ERANGE;
 	}
@@ -488,8 +490,8 @@ static int stm32_csi_start(struct stm32_csi_dev *csidev,
 		phy_regs->osc_freq_target);
 
 	/* Prepare lanes related configuration bits */
-	lanes_ie |= STM32_CSI_SR1_DL0_ERRORS;
-	lanes_en |= STM32_CSI_PCR_DL0EN;
+	lanes_ie = STM32_CSI_SR1_DL0_ERRORS;
+	lanes_en = STM32_CSI_PCR_DL0EN;
 	if (csidev->num_lanes == 2) {
 		lanes_ie |= STM32_CSI_SR1_DL1_ERRORS;
 		lanes_en |= STM32_CSI_PCR_DL1EN;
-- 
2.39.5


