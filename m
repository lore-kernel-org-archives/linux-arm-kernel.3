Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1CDEE74AD0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 20:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YuGAnd8sW4F+V+CEmJaUv5di3BtGFuYG5RsoEXvfXOc=; b=uMKdurEMNWURB6BOYKlViQJSpY
	NT2AtHJoVyL3pKg3jltK/wxs5zW9XLi0BRmp+SHkhCT5nH19ZS3We5bhUxFB2HIX4oFhP1YcmLN9B
	E8Zm8Cu/sdZdgs6pOsS+7RycOZ/5HfVyrmVGYUgraWqVWEZscoCO6nKon+E7Sw98WfLRPUifDYcU2
	EKtUTnDikWMG9Xkfk+bBIzC8rotl9yZa460iIFuN/U2xR0nd2kGJvFM1vMdNOu9DTb56JndkYaU1J
	25DxJaJ117260nzaxIncHN9rCjIRRz/VHu445+5HYTMxODKqRKF2dgi3PMWMjCjXJqysZud3q/iIC
	KKHg2BzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIZD4-0000000AarH-2FgT;
	Tue, 03 Dec 2024 20:09:26 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIZC4-0000000Aahp-1OCM;
	Tue, 03 Dec 2024 20:08:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733256500;
	bh=nMuqNASdDvXJ7RQQnLGP4ZYna4CqD0GHPdKOd8h24RU=;
	h=From:Date:Subject:To:Cc:From;
	b=ZbYSgf4Zo1i9VrUp7UXd5QcS7atcnIODtz9GHmtYQ09YmVXT6of71Rh8K3g79PXbG
	 kziOpE5jN2nm/wQR6O1UleZj0LuJEPug4/j42PIsdusXRR0twS5TfMDz75gDkEKv4r
	 gZgRgPe0gpjj/JIqWPk1hUnUZu2voIUsnGXgCFBeCEL4LXhXeaZ4p9NXsqP4t14XjP
	 jgh1xMEZ/OTNd3LwF3AZKzvpCt+Nz60xnhNF9/KHdin0mLbsewVq3+Z+uYi7TII/li
	 2HJJlF0kFNbJXfCq7nd+uJRRDRGfzXU6jOULFq2Owgy4xLz+dPGGwa387JTyLxl4os
	 Krk0yLG0S81dQ==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1005])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 42EA617E1091;
	Tue,  3 Dec 2024 21:08:18 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 03 Dec 2024 17:07:54 -0300
Subject: [PATCH] ASoC: mediatek: mt8188: Enable apll1 clock during reg rw
 to prevent hang
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241203-mt8188-afe-fix-hang-disabled-apll1-clk-v1-1-07cdd7760834@collabora.com>
X-B4-Tracking: v=1; b=H4sIABplT2cC/x2NwQrCMBAFf6Xs2QfdVDD4K+Jhk2x0MdaSFBFK/
 93ocWCY2ahpNW10Hjaq+rZmr7kDHwaKd5lvCkudyY3uyG6c8Fw9ew/Jimwf/BwkaxKKJshSCiO
 WB8IUmU/exSCZemyp2vX/6HLd9y+aqKzAeAAAAA==
X-Change-ID: 20241203-mt8188-afe-fix-hang-disabled-apll1-clk-b3c11782cbaf
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_120824_526866_E863237E 
X-CRM114-Status: GOOD (  10.48  )
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

Currently, booting the Genio 700 EVK board with the MT8188 sound
platform driver configured as a module (CONFIG_SND_SOC_MT8188=m) results
in a system hang right when the HW registers for the audio controller
are read:

  mt8188-audio 10b10000.audio-controller: No cache defaults, reading back from HW

The hang doesn't occur with the driver configured as builtin as then the
unused clocks are still enabled.

Enable the apll1 clock during register read/write to prevent the hang.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-clk.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
index e69c1bb2cb239596dee50b166c20192d5408be10..fb8cf286df3f02ac076528b898fd0d7a708ec1ea 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
@@ -587,6 +587,8 @@ int mt8188_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
 	mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_A1SYS_HP]);
 	mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_A1SYS]);
 
+	mt8188_afe_enable_clk(afe, afe_priv->clk[MT8188_CLK_APMIXED_APLL1]);
+
 	return 0;
 }
 
@@ -594,6 +596,8 @@ int mt8188_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
 {
 	struct mt8188_afe_private *afe_priv = afe->platform_priv;
 
+	mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_APMIXED_APLL1]);
+
 	mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_A1SYS]);
 	mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_A1SYS_HP]);
 	mt8188_afe_disable_clk(afe, afe_priv->clk[MT8188_CLK_AUD_AFE]);

---
base-commit: b852e1e7a0389ed6168ef1d38eb0bad71a6b11e8
change-id: 20241203-mt8188-afe-fix-hang-disabled-apll1-clk-b3c11782cbaf

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


