Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9AC7C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 18:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+1tmObYapMIF6Mb//DliiEqyJHtafMOQuHhyP2cPmE=; b=FoepNUsygGcoAZcUEeTV0cCF0f
	5WC4HHaUqFBMJE8cMhPn4SDFXFCsqrGCbfWMlT7AdcAHK6+mEwoVWSRIlo01lnSeVRoZlaNTlJ4fr
	wBLJdQL8bGLA+YW0F6QDAXCV2xsc0596E7+/sYSvQC5WOjZDsuu6tU2uY3vs5/HLS76WTP7yOzKl9
	an1cjEP+Aojkazp0SqRr4MM1VH8UUwKxRW/998P9/Y8HwyENsj9VguytGJlF+xzlidkPzMCDbuAUG
	7mQXPQiXABOnwEdx0SWnC7N1tnr9m9QVfQyWsVpcIXN5GcLDgsvsiwPT8fE5Is9bM9BXarzBj6e+e
	lQUMFCIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tizyp-0000000FnXu-16I6;
	Fri, 14 Feb 2025 17:59:59 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tizM0-0000000Fg0Y-1EaM;
	Fri, 14 Feb 2025 17:19:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739553591;
	bh=00LuyQwthdh+8uIpImTyvsn+9nWVCxHN/HdOPIE73Mc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Nu/Nyn5abae0kdlvkimaIaT1dlXXVOhx4s5ajeC1Hs4tM/knyuv8wJ1doPmItwuId
	 1McNTYmOrE/rUCQ6EOcJuBlmRhk62VBC5G/v7KzwcIkBXdkuXOSnMjscKTlUSutlN0
	 HMQMTbK4YM83FcMgtV5tIcyVs28IrtvsOGPoSyGb8vZ85vRH3vE6kMzPBncq3N7FQ3
	 7xJfSM+d3GIcgOBNimcw1fEVt892CB+cqxerpNO8OWwkZzfq649PzGkaH59Pj+uotj
	 lJyKv8j/0jJLlgNR0xNISh1b8lhWWmRPUciXPJMbqyrxIlww37EXXzar4kmWD0V0fw
	 CBzCzy5Iiwxkw==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1003])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4DBAA17E0239;
	Fri, 14 Feb 2025 18:19:46 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 14 Feb 2025 14:18:38 -0300
Subject: [PATCH 07/13] ASoC: mediatek: mt6359-accdet: Drop dead code for
 EINT/GPIO IRQ handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250214-mt6359-accdet-dts-v1-7-677a151b9b4c@collabora.com>
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
X-CRM114-CacheID: sfid-20250214_091952_477123_A4B6E24A 
X-CRM114-Status: GOOD (  12.38  )
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

The ACCDET supports two modes for IRQ generation: PMIC EINT or AP GPIO,
which in principle could be configured through a DT property. However
this DT property has no user nor is documented in a binding, and the
driver only implements the PMIC EINT case, so drop the unused code
intended to handle both cases.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 sound/soc/codecs/mt6359-accdet.c | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
index b71957f7a2edb352add23884fd9e231e36b08621..57a70867b4b80fc904ae07ee05d0e554495ed6e7 100644
--- a/sound/soc/codecs/mt6359-accdet.c
+++ b/sound/soc/codecs/mt6359-accdet.c
@@ -31,9 +31,6 @@
 #define REGISTER_VAL(x)	((x) - 1)
 
 /* mt6359 accdet capability */
-#define ACCDET_PMIC_EINT_IRQ		BIT(0)
-#define ACCDET_AP_GPIO_EINT		BIT(1)
-
 #define ACCDET_PMIC_EINT0		BIT(2)
 #define ACCDET_PMIC_EINT1		BIT(3)
 #define ACCDET_PMIC_BI_EINT		BIT(4)
@@ -448,8 +445,7 @@ static void mt6359_accdet_jd_work(struct work_struct *work)
 		mt6359_accdet_recover_jd_setting(priv);
 	}
 
-	if (priv->caps & ACCDET_PMIC_EINT_IRQ)
-		recover_eint_setting(priv);
+	recover_eint_setting(priv);
 	mutex_unlock(&priv->res_lock);
 }
 
@@ -583,14 +579,6 @@ static int mt6359_accdet_parse_dt(struct mt6359_accdet *priv)
 	if (ret)
 		priv->data->eint_pol = IRQ_TYPE_LEVEL_LOW;
 
-	ret = of_property_read_u32(node, "mediatek,eint-use-ap", &tmp);
-	if (ret)
-		tmp = 0;
-	if (tmp == 0)
-		priv->caps |= ACCDET_PMIC_EINT_IRQ;
-	else if (tmp == 1)
-		priv->caps |= ACCDET_AP_GPIO_EINT;
-
 	ret = of_property_read_u32(node, "mediatek,eint-detect-mode",
 				   &priv->data->eint_detect_mode);
 	if (ret) {
@@ -910,10 +898,8 @@ static void mt6359_accdet_init(struct mt6359_accdet *priv)
 				   0x3 << RG_ANALOGFDEN_SFT);
 	}
 
-	if (priv->caps & ACCDET_PMIC_EINT_IRQ) {
-		config_eint_init_by_mode(priv);
-		config_digital_init_by_mode(priv);
-	}
+	config_eint_init_by_mode(priv);
+	config_digital_init_by_mode(priv);
 }
 
 int mt6359_accdet_enable_jack_detect(struct snd_soc_component *component,

-- 
2.48.1


