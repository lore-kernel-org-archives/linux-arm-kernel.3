Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E0BC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 19:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YYNtxPVUnt7W8sYLGkFWE1IWI/6tJSKZf7D/QJmfTL4=; b=0g/tKb2mYbesN0zOTdH1/QcN2o
	9LmlgyVQ5d/gr6OIK4xwWvuqNMIdiFNFUbPxqu4/YUmKEnE8wN5GOY00aIW0PncxMQM3kf/GBBocP
	DCw+7S74rNq+7C3k5Lz4HPyzQA345gJOCSsmlw8sI202cQnQGAgSl+N6neC3Nty5j0mtfBI2tRM89
	Pn+tgmulgjyiqCBeHbweHauzLfQp0DxrnOYI6xELJLoQvyGTvJ93K3tQmk+W3bc1xXNOmo6DXWuOZ
	lKNLJ2kdl+aHAKn9dDsd4TeznuFFd1AwIu3Cj3XL18vqgRzixM27qGqT3iRGnxMnUXvtoNXiJLd3e
	wIIWtuiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpuQ5-000000094LT-3K9D;
	Wed, 05 Mar 2025 19:28:41 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tptzA-000000090XJ-0Clh;
	Wed, 05 Mar 2025 19:00:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741201250;
	bh=UtaKHqK3+fgfZE111SW1PU59SBdv6NpsckijEheGGYc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bt09DITDhDHr6BcjLLw3dplzAzkMk9iEeSH8U36Ow9mXHLYRwDNfK8xvj2DzT3AOA
	 C66WtEZDivhObsGiuVzPIt4WP89xFCNMjNsPiJ0v5gUlKxrNBgO8sT4PkW1WzmzkA9
	 fDXK8SAYkuwEsR7UNgjkWpYbWNiwk53oWK8QHfV2X/Ci3UWlIrQQaNUnCNW4vHewgS
	 0OTF3Er8N1Hi0+tdC6H97FaJDeXhcnTx89lU6u746oqPkLq0gzDkUSMa0kSNo5U0O1
	 KSMB8QQlhG0ZcbgAihtNngxuYctFiD0mWPwRMLA5tbQ7o/egaYaS03JWvkCyDXq2Q1
	 WbbLEDAXCYrgw==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1004])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B2BD317E0343;
	Wed,  5 Mar 2025 20:00:45 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Wed, 05 Mar 2025 15:58:31 -0300
Subject: [PATCH v4 16/19] ASoC: mediatek: mt6359-accdet: Always set
 comp-vth to 1.6V
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250305-mt6359-accdet-dts-v4-16-e5ffa5ee9991@collabora.com>
References: <20250305-mt6359-accdet-dts-v4-0-e5ffa5ee9991@collabora.com>
In-Reply-To: <20250305-mt6359-accdet-dts-v4-0-e5ffa5ee9991@collabora.com>
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
X-CRM114-CacheID: sfid-20250305_110052_225085_52906690 
X-CRM114-Status: GOOD (  14.43  )
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


