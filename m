Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6C3C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NslOiz4FmeC1gAXIzBWWbeE7YocXiJZ2UeY5oJ9dNYw=; b=ziWCQ+TI+TzVC+uV3ExJBitUGp
	59YNH1oA86vDf2k5vIEI638ov4DGw7qYqTrSPFzgN/pZ8KrPLB0g5z3eLrjfwVjAeuRDz9gDQ6zhj
	qjSzsPcN0mZTN4Fp76UQsvwBWRWugqikSwaOXeizpJHHIadxKl3GgmOYZFlJFe2+WERovTJgiBTji
	M9KMQ2Qh95DnviOoFwNOAWvJUHQ/uprPQMN10sU4nZWNRswY15Pi7FqyR+xJEVmapmXgPIfaqNif3
	1gliuAyiiwVeOwdeEt0+JgDT7wQzpYphUtTKuonHI5KduN0D8EFXGYJQ/G83b3neyLVmvRrDuKEhR
	9u91Rlrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxzU-00000000JO3-3aT0;
	Tue, 25 Feb 2025 16:41:04 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmw1t-0000000HXmx-09Ej;
	Tue, 25 Feb 2025 14:35:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740494123;
	bh=JCE4p346p31jQgHf80qzDsHOhPDN++XJ848duY7iYv4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PlZtZ/LPxsveMjhUJGmt6WtyjcEWKkMBP15eJr0sN541bg+HaP6TqLCj7HE/dgloZ
	 osv0IrO9iqEnFsQcQIJ+rBZ2RbWNvmK18NRR76v1VbpFNzDC4hQJHmpRaSa9sakms7
	 yPPf6gLSVsakrM7Q3qfG21+PDyEESfq+jytvr1hxnG2dApPugTU7V6DFuCySc+7Ama
	 uXuvFCrWS7f4UfMalNFhL6G+18MhcMXHYTkki9Y3b12UpbNsZkfkdCKDYkHi6tac4R
	 /wBxTCWSi1WTGK0S8hq+/9ZhWWQkm1eeNQv0y2qxUcUXJjsj9P3uVKVaVQnl6LOyC9
	 EuW/Xo0iUN2KQ==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1004])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A4A4417E0DD7;
	Tue, 25 Feb 2025 15:35:19 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 25 Feb 2025 11:33:51 -0300
Subject: [PATCH v2 5/8] ASoC: mediatek: mt8188-mt6359: Add DMIC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250225-genio700-dmic-v2-5-3076f5b50ef7@collabora.com>
References: <20250225-genio700-dmic-v2-0-3076f5b50ef7@collabora.com>
In-Reply-To: <20250225-genio700-dmic-v2-0-3076f5b50ef7@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 parkeryang <Parker.Yang@mediatek.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_063525_226488_3E87E978 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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

Add the DMIC backend, which connects to the DMIC DAI in the platform
driver, as well as a "AP DMIC" mic widget. On the Genio 700 EVK board
the dual DMIC on-board are wired through that DMIC DAI.

Co-developed-by: parkeryang <Parker.Yang@mediatek.com>
Signed-off-by: parkeryang <Parker.Yang@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index 2d0d04e0232da07ba43a030b14853322427d55e7..420b1427b71dc1424a52f7ab6140c14659036733 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -150,6 +150,11 @@ SND_SOC_DAILINK_DEFS(dl_src,
 						   "mt6359-snd-codec-aif1")),
 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
+SND_SOC_DAILINK_DEFS(DMIC_BE,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DMIC")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
 SND_SOC_DAILINK_DEFS(dptx,
 		     DAILINK_COMP_ARRAY(COMP_CPU("DPTX")),
 		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
@@ -297,6 +302,7 @@ static const struct snd_soc_dapm_widget mt8188_rear_spk_widgets[] = {
 static const struct snd_soc_dapm_widget mt8188_mt6359_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_MIC("AP DMIC", NULL),
 	SND_SOC_DAPM_SINK("HDMI"),
 	SND_SOC_DAPM_SINK("DP"),
 	SND_SOC_DAPM_MIXER(SOF_DMA_DL2, SND_SOC_NOPM, 0, 0, NULL, 0),
@@ -533,6 +539,7 @@ enum {
 	DAI_LINK_UL9_FE,
 	DAI_LINK_UL10_FE,
 	DAI_LINK_DL_SRC_BE,
+	DAI_LINK_DMIC_BE,
 	DAI_LINK_DPTX_BE,
 	DAI_LINK_ETDM1_IN_BE,
 	DAI_LINK_ETDM2_IN_BE,
@@ -1120,6 +1127,13 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 		.playback_only = 1,
 		SND_SOC_DAILINK_REG(dl_src),
 	},
+	[DAI_LINK_DMIC_BE] = {
+		.name = "DMIC_BE",
+		.no_pcm = 1,
+		.capture_only = 1,
+		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(DMIC_BE),
+	},
 	[DAI_LINK_DPTX_BE] = {
 		.name = "DPTX_BE",
 		.ops = &mt8188_dptx_ops,

-- 
2.48.1


