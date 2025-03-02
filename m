Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DF2C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 16:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IAffHjLvOsgmSRGom9WoCJviYGzrq7E/Al4G3Wzlyh4=; b=ct9+25gP4qVdV9rewBgmrEq8uS
	Ou83AIGP1Z5i/2ZSmfkZWIZFVnJBccPJTIKAVL+6AEzTfM7eUumyALexqZVSP1EmJdYUuithUXkHd
	La1Z7c64PwMD6TEWPl8Sx2rd83xndnGH5O0W79vyvG3ls4p8puLm0hSiBmldQa8DdmEPpW8pLzwNV
	ZW4mii8A/HA5bEuqvS6ijMQ5ZvauA4kQuQM28ewQ4hhBQVEp7FBJQkFsuvf474TkKPlqITAduguy7
	qJjR7nCgXBNmuQZOAcwjy1xjPA4eaCxdcGPoJCJDX0OCAynfYblJUAw3Nh69tOp2FdP1QjQntKKWT
	ZxIJ5dtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tomfD-0000000GOMp-0USD;
	Sun, 02 Mar 2025 16:59:39 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tomF0-0000000GKcy-062i;
	Sun, 02 Mar 2025 16:32:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740933152;
	bh=Q8q9/iehdorRcBwKZ4Cn0dk07/+IjdqsbtrE00SPNg4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CtewjSn5nE+5PROzUrKP7hg/DB7xjV07/vM97EHyiUopwBJw3Jt/TTu5XwBAF9SvF
	 JKZYhRRXP1jtAqIYEYi4t+30mOTSNrKKFGAYaGPZRO5xokqkhY7IQ4sxkkzwOzogJF
	 g7AmsTIoJVgRWMfw+JTwq/51tK66P68VazMf3gAStzm0+in8sbyvXOOc/qFPQPeAWs
	 N34ys+c7BmfWyhLT6O65JJyiohp9OVvOu7WlRn6uXx5zGGXK9LqsvEC+3uEbgJ4XBE
	 9X9xzb+9XCkmUOb6Ta6QtY+cxpXxzb5BidSuRYi+KPzRitnua1NIdT058nDDMGIvgd
	 lttmX4jt/cHgg==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1002])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8CFDC17E07F8;
	Sun,  2 Mar 2025 17:32:27 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Sun, 02 Mar 2025 13:30:56 -0300
Subject: [PATCH v2 17/20] ASoC: mediatek: mt6359-accdet: Always set
 comp-vth to 1.6V
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250302-mt6359-accdet-dts-v2-17-5bd633ee0d47@collabora.com>
References: <20250302-mt6359-accdet-dts-v2-0-5bd633ee0d47@collabora.com>
In-Reply-To: <20250302-mt6359-accdet-dts-v2-0-5bd633ee0d47@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_083234_204070_814BFD5C 
X-CRM114-Status: GOOD (  14.09  )
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

The driver currently reads a mediatek,eint-comp-vth property from DT to
determine the voltage threshold of the EINT comparator. Since there are
no current users of the property and setting it to 1.6V is known to work
across multiple boards, remove the code handling this property and
instead always configure it to 1.6V. The property can be properly
introduced in the binding in the future if it really turns out that
different boards need different configurations.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 sound/soc/codecs/mt6359-accdet.c | 8 ++------
 sound/soc/codecs/mt6359-accdet.h | 1 -
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
index 12697b02faff1be39317116cd7d8ffa359f2cd4e..3f6a97e8de8d174e59e512d53135fadc5765b5c1 100644
--- a/sound/soc/codecs/mt6359-accdet.c
+++ b/sound/soc/codecs/mt6359-accdet.c
@@ -61,6 +61,7 @@
 #define ACCDET_EINT_INVERTER_DEBOUNCE_256MS 0xe
 #define ACCDET_EINT_CMPMEN_PWM_WIDTH_400MS 4
 #define ACCDET_EINT_CMPMEN_PWM_THRESH_2MS 1
+#define ACCDET_EINT_COMP_VTH_1600MV 2
 
 static struct platform_driver mt6359_accdet_driver;
 static const struct snd_soc_component_driver mt6359_accdet_soc_driver;
@@ -506,11 +507,6 @@ static int mt6359_accdet_parse_dt(struct mt6359_accdet *priv)
 	else if (tmp == 2)
 		priv->caps |= ACCDET_PMIC_BI_EINT;
 
-	ret = of_property_read_u32(node, "mediatek,eint-comp-vth",
-				   &priv->data->eint_comp_vth);
-	if (ret)
-		priv->data->eint_comp_vth = 0x0;
-
 	of_node_put(node);
 	dev_warn(priv->dev, "accdet caps=%x\n", priv->caps);
 
@@ -594,7 +590,7 @@ static void config_eint_init_by_mode(struct mt6359_accdet *priv)
 			   0x3 << RG_ACCDETSPARE_SFT,
 			   0x3 << RG_ACCDETSPARE_SFT);
 	regmap_write(priv->regmap, RG_EINTCOMPVTH_ADDR,
-		     val | priv->data->eint_comp_vth << RG_EINTCOMPVTH_SFT);
+		     val | ACCDET_EINT_COMP_VTH_1600MV << RG_EINTCOMPVTH_SFT);
 }
 
 static void mt6359_accdet_init(struct mt6359_accdet *priv)
diff --git a/sound/soc/codecs/mt6359-accdet.h b/sound/soc/codecs/mt6359-accdet.h
index 579373807c414130b2a7384db4978e01cf1d046c..288b8fbf7c5efaee6520a2c0a5845e156f3b805d 100644
--- a/sound/soc/codecs/mt6359-accdet.h
+++ b/sound/soc/codecs/mt6359-accdet.h
@@ -48,7 +48,6 @@ enum {
 
 struct dts_data {
 	bool hp_eint_high;
-	unsigned int eint_comp_vth;
 };
 
 struct mt6359_accdet {

-- 
2.48.1


