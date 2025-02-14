Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999D6C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 20:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=llW5p/2cU9pyD6O50zTC+JdR5W3cKNUgmxri3DfiRBg=; b=fSzGFtc6lezsHllDtsc3E0w5LJ
	NYz7nhZmtGOWY0NGaJeNUYB5A8EbdExLw290StU6vjzKDXfSnw6xwWXimCELDzvckTt2vd+l0fpLa
	TeJscYjufrtncCqkU9uxu03dQlYdFmq2kOBwrb5Upg1UzRapmEMHwU4LtJDJO2fWEEOcwJSMTVLRX
	afegXDtnHVgsRQ8SI0V5J0Ai5U3nG9kWISqwMEjb7OqUIp3TEKUV8bBr1Sf0GfJRJgb0Jr1zTLfAC
	xBvciwUM0kXBhT/KceCXt6hhSNDD8yXxmSu7GzG6O/mztTmfjvuXgxlfjzOFHDva1kkNYVzAEWL1W
	iset/Rjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj2Ga-0000000GA4j-2T6M;
	Fri, 14 Feb 2025 20:26:28 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tizM5-0000000Fg1g-16WN;
	Fri, 14 Feb 2025 17:19:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739553596;
	bh=dllF4OZS+fykAk4GG2xX2cZG/gu45NNSuP+Q2RiVATk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=i+JH/wh04YHiTTELCcPDvcxhtx7aSVDAI/6vzARmHr1S9N/g2EGH0i4tqWOhd6D5y
	 HLwnhk+cyfXsOK2kYWFjreNP1YqwV3D3EKrUtn/JrZK92mGfQDcPxB1CzKAXaZpmrp
	 N5ekz9gh9m4Tr1GCwFOA9zca6xYen2gRPqFFsq5cM1mGz2Nc9cbvFR4SmjO63Wbz78
	 iHsVH+oAx6EvMtZJF8cL6MWQoqe2I445Xxao/4eJDs8zRJpIcpwfMspc/oYNwPa5mT
	 GxeQ3FX1CLzRTWvvEaoei9yzk7rsEjbZEgB2K2HifLLPPoVwCZTqmJ/f7hHuY+u5r1
	 gQBIn/RH8NwYw==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1003])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6AF4517E0FC1;
	Fri, 14 Feb 2025 18:19:51 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 14 Feb 2025 14:18:39 -0300
Subject: [PATCH 08/13] ASoC: mediatek: mt6359-accdet: Drop dead code for
 EINT trigger setting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250214-mt6359-accdet-dts-v1-8-677a151b9b4c@collabora.com>
References: <20250214-mt6359-accdet-dts-v1-0-677a151b9b4c@collabora.com>
In-Reply-To: <20250214-mt6359-accdet-dts-v1-0-677a151b9b4c@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_091957_444618_35C5A5DB 
X-CRM114-Status: UNSURE (   9.41  )
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

None of the EINT trigger options are implemented and the DT property is
not described in the binding. Remove the unused code.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 sound/soc/codecs/mt6359-accdet.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
index 57a70867b4b80fc904ae07ee05d0e554495ed6e7..e45630a134bb3a27bb52a80f43901c9fe4eac105 100644
--- a/sound/soc/codecs/mt6359-accdet.c
+++ b/sound/soc/codecs/mt6359-accdet.c
@@ -35,8 +35,6 @@
 #define ACCDET_PMIC_EINT1		BIT(3)
 #define ACCDET_PMIC_BI_EINT		BIT(4)
 
-#define ACCDET_PMIC_GPIO_TRIG_EINT	BIT(5)
-#define ACCDET_PMIC_INVERTER_TRIG_EINT	BIT(6)
 #define ACCDET_PMIC_RSV_EINT		BIT(7)
 
 #define ACCDET_THREE_KEY		BIT(8)
@@ -596,15 +594,6 @@ static int mt6359_accdet_parse_dt(struct mt6359_accdet *priv)
 	else if (tmp == 2)
 		priv->caps |= ACCDET_PMIC_BI_EINT;
 
-	ret = of_property_read_u32(node, "mediatek,eint-trig-mode",
-				   &tmp);
-	if (ret)
-		tmp = 0;
-	if (tmp == 0)
-		priv->caps |= ACCDET_PMIC_GPIO_TRIG_EINT;
-	else if (tmp == 1)
-		priv->caps |= ACCDET_PMIC_INVERTER_TRIG_EINT;
-
 	ret = of_property_read_u32(node, "mediatek,eint-use-ext-res",
 				   &priv->data->eint_use_ext_res);
 	if (ret) {

-- 
2.48.1


