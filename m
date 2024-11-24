Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CFE8E668AB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 12:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GlWsimqHI2a/8hP+8/JbfhknrN/8GQ6DXXLQKPI+RPE=; b=eqUzGHWe/18hUhIOHJBQH3puo7
	L8HiPVYziOelxmFMmGhFAz9iPLEoZTjH4vo5IKE9Bwpj9hv9KzPElqrLxffVHF7N/QL95LcCbMF7l
	YFO5XzaSDl07vxr1omw+POmX752ldHxY2OzJ82tLKWHNsfkDP1km/UBnnzLQbLaWpLFiev9CPLVTT
	MAzp2dPhgHvZ99nZfGQRfP5APMuOVxarDT+em66J4Zcd7lN67GCfd9CXlYXTqn3JaakAQPLIzqxKi
	Srg4a5ZQQA1AdpkrPE6lx0SD9xCQ8YSPm2hNnL5ZHHY2x61OSRvVA5bpoRqCgP/rE8KrIvkgzGeE8
	Xqdc1Gvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFCBT-00000005ocH-3WlR;
	Sun, 24 Nov 2024 12:57:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFC5z-00000005nAT-06fo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 12:52:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E54F15C56BE;
	Sun, 24 Nov 2024 12:51:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F10FBC4CED1;
	Sun, 24 Nov 2024 12:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732452730;
	bh=Q3vJFI8VEQ+dQP8mtJd2dsAUO29gicA9uABtQSdl9/Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mn8WSm9ZQt/eYmaY7S8KvMXEohLD32CSr1KBAAAa6P9i9yaUy0NQfnktX/dZ18B/h
	 3zDfQI12bicpO65Z3d5wllDZ5enGtmBT0JGf16MrT7hXZgzknBtKjDVq1gaK/+u3g1
	 dOMbumK5mASPl7yv39WuJIBo4N1ryyaJXFXuetgXr3pa36FoHny/pF2FlQayl3DF6u
	 22ai6s92oONScHxHKGN0hJXSmy0rWG4UL/ODR3JSZ+oi3jb2PIL2Cadpws+CohPJC0
	 5Y1tzUipyT4lFLc8zjCzWlpZvjrhX857k0lsdg4z+OcnjuAk19ByCE89HBtNaHx2Go
	 3dpkq/LbEB6bA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	shawnguo@kernel.org,
	imx@lists.linux.dev,
	linux-mmc@vger.kernel.org,
	s32@nxp.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.11 13/20] mmc: sdhci-esdhc-imx: enable quirks SDHCI_QUIRK_NO_LED
Date: Sun, 24 Nov 2024 07:50:43 -0500
Message-ID: <20241124125124.3339648-13-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124125124.3339648-1-sashal@kernel.org>
References: <20241124125124.3339648-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.10
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_045211_143057_E74DFEA9 
X-CRM114-Status: GOOD (  11.33  )
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

From: Peng Fan <peng.fan@nxp.com>

[ Upstream commit 4dede2b76f4a760e948e1a49b1520881cb459bd3 ]

Enable SDHCI_QUIRK_NO_LED for i.MX7ULP, i.MX8MM, i.MX8QXP and
i.MXRT1050. Even there is LCTL register bit, there is no IOMUX PAD
for it. So there is no sense to enable LED for SDHCI for these SoCs.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Haibo Chen <haibo.chen@nxp.com>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
Link: https://lore.kernel.org/r/20240923062016.1165868-1-peng.fan@oss.nxp.com
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/mmc/host/sdhci-esdhc-imx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index 8f0bc6dca2b04..ef3a44f2dff16 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -238,6 +238,7 @@ struct esdhc_platform_data {
 
 struct esdhc_soc_data {
 	u32 flags;
+	u32 quirks;
 };
 
 static const struct esdhc_soc_data esdhc_imx25_data = {
@@ -309,10 +310,12 @@ static struct esdhc_soc_data usdhc_imx7ulp_data = {
 			| ESDHC_FLAG_HAVE_CAP1 | ESDHC_FLAG_HS200
 			| ESDHC_FLAG_PMQOS | ESDHC_FLAG_HS400
 			| ESDHC_FLAG_STATE_LOST_IN_LPMODE,
+	.quirks = SDHCI_QUIRK_NO_LED,
 };
 static struct esdhc_soc_data usdhc_imxrt1050_data = {
 	.flags = ESDHC_FLAG_USDHC | ESDHC_FLAG_STD_TUNING
 			| ESDHC_FLAG_HAVE_CAP1 | ESDHC_FLAG_HS200,
+	.quirks = SDHCI_QUIRK_NO_LED,
 };
 
 static struct esdhc_soc_data usdhc_imx8qxp_data = {
@@ -321,6 +324,7 @@ static struct esdhc_soc_data usdhc_imx8qxp_data = {
 			| ESDHC_FLAG_HS400 | ESDHC_FLAG_HS400_ES
 			| ESDHC_FLAG_STATE_LOST_IN_LPMODE
 			| ESDHC_FLAG_CLK_RATE_LOST_IN_PM_RUNTIME,
+	.quirks = SDHCI_QUIRK_NO_LED,
 };
 
 static struct esdhc_soc_data usdhc_imx8mm_data = {
@@ -328,6 +332,7 @@ static struct esdhc_soc_data usdhc_imx8mm_data = {
 			| ESDHC_FLAG_HAVE_CAP1 | ESDHC_FLAG_HS200
 			| ESDHC_FLAG_HS400 | ESDHC_FLAG_HS400_ES
 			| ESDHC_FLAG_STATE_LOST_IN_LPMODE,
+	.quirks = SDHCI_QUIRK_NO_LED,
 };
 
 struct pltfm_imx_data {
@@ -1687,6 +1692,7 @@ static int sdhci_esdhc_imx_probe(struct platform_device *pdev)
 
 	imx_data->socdata = device_get_match_data(&pdev->dev);
 
+	host->quirks |= imx_data->socdata->quirks;
 	if (imx_data->socdata->flags & ESDHC_FLAG_PMQOS)
 		cpu_latency_qos_add_request(&imx_data->pm_qos_req, 0);
 
-- 
2.43.0


