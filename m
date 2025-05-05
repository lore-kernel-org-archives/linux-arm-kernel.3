Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46321C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 23:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AmKWY7YWAVkOYYVYO3fr0vcmy5ygysA6VFcTfqw86Dc=; b=s124w67Iw7elIrckb80/xpS0na
	Yow+0BifD4hiT6/Ho1uaPFnUf49VeFeWaQhkKfl2XzNx5uvJh7pYk3GPhP8WX9JJaVlO6O8v38ygp
	akBlSG3sI3uy8tZPIwNHSHyVT/3N7ZdxcquwpbQXPP/bSl8l78RGipyzWoOsObisSuU4+j8o9gBPU
	2djZxq3YTj01f/loboMJ6jD0a3b4oEuwl6/KMLHPnDMUn46tKNevIVW1Wui32eUk8ZZtNUSrDMuuS
	/XREseEOUevdv/SAcEAZfhbpzhSxB0hJrGDMl+IyONWteA3TWxUMLv7R+/fPPi8+pdzvivINvoeLB
	mhnaeFOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC5eL-00000009A3u-4ByX;
	Mon, 05 May 2025 23:55:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4Hd-00000008lQ0-3HrV;
	Mon, 05 May 2025 22:27:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5E3B7629C2;
	Mon,  5 May 2025 22:27:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 791F8C4CEEF;
	Mon,  5 May 2025 22:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484052;
	bh=LrT/BzsEdzbAPHh6GUB5YHHxutK4sZM6h/Bma2CUFEc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ifEiYg4Vy9qkuuHby54cAgfNtGMFgLRCxIFWNHvBYYHXOp1CCPy1hX5vgMhFRyY87
	 lK6PLf+tXYZAbnE1SD12yxwquHMV0hN6TU11m5G2dMZ773DgV/B9/UKbUCHR5x3Kpq
	 /DsCQTffiPCIdvIgaxKOEiBJmwyCFLUPGkqF/YP3EG1Xc5RdJW8AAVJPHMawmqsQEO
	 6nxLC6Lz5NCTANBsjZ52kw4m2oAJVRIKiK3PNtZF1fnNYzrvbREt2O9E4LvJsSo8jW
	 LsT3M4o6W5EhH1rg47MbgOuC+0iOG2hffA3Zs2Fr73/W4QwqFI1rBps/JH8QA7m4wM
	 IB0TsBtiZhvPw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 328/642] ASoC: mediatek: mt8188: Add reference for dmic clocks
Date: Mon,  5 May 2025 18:09:04 -0400
Message-Id: <20250505221419.2672473-328-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
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

From: Nícolas F. R. A. Prado <nfraprado@collabora.com>

[ Upstream commit bf1800073f4d55f08191b034c86b95881e99b6fd ]

Add the names for the dmic clocks, aud_afe_dmic* and aud_dmic_hires*, so
they can be acquired and enabled by the platform driver.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Link: https://patch.msgid.link/20250225-genio700-dmic-v2-2-3076f5b50ef7@collabora.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/mediatek/mt8188/mt8188-afe-clk.c | 8 ++++++++
 sound/soc/mediatek/mt8188/mt8188-afe-clk.h | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
index e69c1bb2cb239..7f411b8577823 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
@@ -58,7 +58,15 @@ static const char *aud_clks[MT8188_CLK_NUM] = {
 	[MT8188_CLK_AUD_ADC] = "aud_adc",
 	[MT8188_CLK_AUD_DAC_HIRES] = "aud_dac_hires",
 	[MT8188_CLK_AUD_A1SYS_HP] = "aud_a1sys_hp",
+	[MT8188_CLK_AUD_AFE_DMIC1] = "aud_afe_dmic1",
+	[MT8188_CLK_AUD_AFE_DMIC2] = "aud_afe_dmic2",
+	[MT8188_CLK_AUD_AFE_DMIC3] = "aud_afe_dmic3",
+	[MT8188_CLK_AUD_AFE_DMIC4] = "aud_afe_dmic4",
 	[MT8188_CLK_AUD_ADC_HIRES] = "aud_adc_hires",
+	[MT8188_CLK_AUD_DMIC_HIRES1] = "aud_dmic_hires1",
+	[MT8188_CLK_AUD_DMIC_HIRES2] = "aud_dmic_hires2",
+	[MT8188_CLK_AUD_DMIC_HIRES3] = "aud_dmic_hires3",
+	[MT8188_CLK_AUD_DMIC_HIRES4] = "aud_dmic_hires4",
 	[MT8188_CLK_AUD_I2SIN] = "aud_i2sin",
 	[MT8188_CLK_AUD_TDM_IN] = "aud_tdm_in",
 	[MT8188_CLK_AUD_I2S_OUT] = "aud_i2s_out",
diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-clk.h b/sound/soc/mediatek/mt8188/mt8188-afe-clk.h
index ec53c171c170a..c6c78d684f3ee 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-clk.h
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-clk.h
@@ -54,7 +54,15 @@ enum {
 	MT8188_CLK_AUD_ADC,
 	MT8188_CLK_AUD_DAC_HIRES,
 	MT8188_CLK_AUD_A1SYS_HP,
+	MT8188_CLK_AUD_AFE_DMIC1,
+	MT8188_CLK_AUD_AFE_DMIC2,
+	MT8188_CLK_AUD_AFE_DMIC3,
+	MT8188_CLK_AUD_AFE_DMIC4,
 	MT8188_CLK_AUD_ADC_HIRES,
+	MT8188_CLK_AUD_DMIC_HIRES1,
+	MT8188_CLK_AUD_DMIC_HIRES2,
+	MT8188_CLK_AUD_DMIC_HIRES3,
+	MT8188_CLK_AUD_DMIC_HIRES4,
 	MT8188_CLK_AUD_I2SIN,
 	MT8188_CLK_AUD_TDM_IN,
 	MT8188_CLK_AUD_I2S_OUT,
-- 
2.39.5


