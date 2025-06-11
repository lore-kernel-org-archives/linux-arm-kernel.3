Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F939C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 16:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HFpwfaBk9Zi/05ZHLg2kQwpAQr276eZe2gpjdnyEXsw=; b=APIzjUpslse6J6535K4Q/PdcJE
	MXaOPSFz3SUVe1AzEaW2+WX4su/LVptphho0MbYe0c2aRJxonYpkBmxR6sgcNLriKqJxM+QfwrtIN
	HtsMcFqFH891781NttJXNNaaPclX+AJzkLbbxltaRDDn5cs3Qyx6ewM+Uh+GqLHaSjkUhX2EW/R7q
	rL3JlgpixStBhCXGkBFrNaP+wparvkBcMIiG1E7Gh2z9eZ5VxuqjPCqSHAXgizb1LY/dDn6VXjMKj
	Iv4F8U5Asjtxt29Oi3YsuI59U1/1XQavEapMyfEOLKH0KGHPfTGzx8hb8N/VsjXx+wTYLRjn3ZUU8
	XvqhpPAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPO1Z-0000000AYYO-4AZH;
	Wed, 11 Jun 2025 16:10:01 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPKyB-00000009t8w-0no8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 12:54:21 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a50fc7ac4dso4273556f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 05:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749646458; x=1750251258; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HFpwfaBk9Zi/05ZHLg2kQwpAQr276eZe2gpjdnyEXsw=;
        b=cqhnQkNnpjPVwn4/1zSZL/iTHVDAexiH/03NcEI3eOqpTVCoqholuA9ME548zelh5T
         npeTZ6adXx7Dwa/O7F4tpDqMksXfqXzCEaafbTbL1kz6A51x0CkF0H/ECnvDL02W7UzJ
         BE4HDo7OQ5H8KEl7HrTtS7LaNOMpcrickaFvCsazHMwdV342hZ5VGEWbA6E0wReAiuMZ
         b8hsF5lAcqgy0InUrWmEAwevsUlDWsa/Ipv8jhE9nZADLxonrU455jQqcTBQ4hThebd5
         Rxk04D5tfBw/F2ARAP3rxTiIfd5uwbTlhKSuJrnr7TsU876Wd+a1Vn1qB2WWk+1gCTAK
         tPDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646458; x=1750251258;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HFpwfaBk9Zi/05ZHLg2kQwpAQr276eZe2gpjdnyEXsw=;
        b=uQgXNe7PswcqmNcEdBOr5carE6vV74cAYYgC8adrHpF6Dw0Lp9r+ROgWYQM5QqFqL/
         B3yUxisj7QbEq5oSULTZENEsDnLE+WF/oD9jlDKlO6hDdokY3oMlJjcBrUspz58jfoV6
         6Bb0kuK56WqBl5J8AYW8vd4nAe0EWW5wf8W79yVNUoy7A59r2JTd1aNn8qJ7nL0S7Z+7
         GElg8ic0H6N8CzHtoS2EH6JOFEjCDnEnNuJ0/Q0z8W2IqQvZNOXz68+YPo4U4J9APayo
         2GnGZC+6zBWXepqu5L6k+7jCNo/GNzA3avrLfRbrXTQJ6FQ+nZkQjPm7oQAko/pjkPz5
         /ToA==
X-Forwarded-Encrypted: i=1; AJvYcCWcYEeEvlxmGDvJRAgHqdl+zkhdlNk+a2x4Txi2tdqC/GwMYcOs7OJFEgSRCyCYXj0wv87ME4kcn5YGB+LaHM5a@lists.infradead.org
X-Gm-Message-State: AOJu0YwsHyRU2lSaoxGOettKym+5JfDxVNlpQKYbh/Oa4b3eCDCEHErz
	2vUyvFiqiyHE6h2l5P3pVrznCEayxNlf8/8xdSHIgSpmCvt0XSXMWlvMTQpLPioo3dQtusoEr93
	HabWV
X-Gm-Gg: ASbGncv++6MAn3ue222pphUMUQFryJnx/IhnJP+K6nS4QMOlAy2yTDvUjqdJNH+BL4T
	RYA07yNNCtbTkD0i20EcIWiP9voKMs3V3y9bUjvTddTKmNfZYvU4TDIGlX5zWgOxNm9yc4dYIMi
	ZkeOGu7rGH7KZy/wCY7detcIJeP0lhcKxjoTHI/PBzIJciG8jln7i2+xm+s9AamS/YSAt7QMZiw
	03sqF5Jnqh+YOBSkcUMDKzsMypoH22b6xuXkO4It2tQQFtbYxdU+oV/2PfqXX7557zw8KM/eDZe
	OzM+mjme0BvP1UARABdDkxQwN7djZ/RO8gxlQbk7EXIivzrvjiw1oEY29xEZPoAhbKJk7YFqLAN
	UN7LBMR6yZgg=
X-Google-Smtp-Source: AGHT+IGIlwjD38JS//yUBEcvXlmN2huAOqXtp/YJa3YDrL38fHSYMCV1TEIKntX391ju7QlDra2xEA==
X-Received: by 2002:a05:6000:2586:b0:3a4:d939:62f8 with SMTP id ffacd0b85a97d-3a5586cb2a6mr2093860f8f.32.1749646457670;
        Wed, 11 Jun 2025 05:54:17 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:8ef3:a82f:ccaa:91b5])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a53245275esm15225486f8f.76.2025.06.11.05.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 05:54:17 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 11 Jun 2025 14:53:58 +0200
Subject: [PATCH 3/4] clk: clk-imx8mp-audiomix: use the auxiliary device
 creation helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-clk-aux-v1-3-fb6575ed86a7@baylibre.com>
References: <20250611-clk-aux-v1-0-fb6575ed86a7@baylibre.com>
In-Reply-To: <20250611-clk-aux-v1-0-fb6575ed86a7@baylibre.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2798; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=ojLJe2tP2Vz209foMJ0Lu2S+h70I7DXs1+HhM6dEcXA=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoSXx0XZWnNZ1AgTV5+LghlbWYLZmdaCeetdFuI
 qp+F7j2WVaJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaEl8dAAKCRDm/A8cN/La
 hb16D/wP9KqqBEL7B0U8B0WK3yPhG6P25gSKeMgOS5rbf0shnJGcVbdMZrh5wm9fTchQpnEmZCz
 D2n4bKvAkLeTU4ydkqcJ269ydY7GRX313GINYYGI8Vg+zmRD8n52Kb7Stu2lxt/0RX81QLy/2vE
 UdgZmzXLrQ2p7vQFa+B/AAU02dJwd0jzeD6TTYstyr7Vt22QGmMBtRTl8MUiRbzFn0UTGfsNFxN
 wLGmBduWVn0u+WPHyEatcPAogHrnl78ggZsxkNmDNlLHJVlsjCYMKbOq4m2XV4NacsNVmG5G8dp
 GfaM8mfrSlogZpEL5Zbhz7PoJCcUjHf+NcnI35LMc53E30vHuphLQjdsUzJuDn3jsUO4FvCyUfA
 lom1Lz7f5BY4l3cojZXX+fHtCnp3Rjx736PDJxmvmXUNQM48ymIwr1jNh9XzYHP/6ZdnaTFXPT0
 iLNQEC7PVi55LOyqA3Qh0Q4OTu0SXEL0Up0aCmi9hwUbtnsn8Hcnl2Ici1abYub+Us8WzOQVJT1
 AeckT54HKRMGKNqpj/OQ4rMW8woe2BBCfkRgubAj13myhy1nI05lTUzV3LAtolCUdR3iSGT9htf
 iTexlX/QOC4yKNXuJoKwrB9N2TTIu2a9Jj0O/jNY3tem+RlQF7wWF88v6oSJ0sGAoHiCXLPtX8D
 rA4jtMmEVS0/N7w==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_055419_261740_6D6E75E6 
X-CRM114-Status: GOOD (  14.01  )
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

The auxiliary device creation of this driver is simple enough to
use the available auxiliary device creation helper.

Use it and remove some boilerplate code.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/imx/clk-imx8mp-audiomix.c | 49 ++++++-----------------------------
 1 file changed, 8 insertions(+), 41 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-imx8mp-audiomix.c
index 775f62dddb11d8cfd17a4ebf7a677ef399c5e617..765fb1f5bd4fa2b039d7414abd89471438ee41dd 100644
--- a/drivers/clk/imx/clk-imx8mp-audiomix.c
+++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
@@ -230,61 +230,28 @@ struct clk_imx8mp_audiomix_priv {
 
 #if IS_ENABLED(CONFIG_RESET_CONTROLLER)
 
-static void clk_imx8mp_audiomix_reset_unregister_adev(void *_adev)
+static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev)
 {
-	struct auxiliary_device *adev = _adev;
-
-	auxiliary_device_delete(adev);
-	auxiliary_device_uninit(adev);
-}
-
-static void clk_imx8mp_audiomix_reset_adev_release(struct device *dev)
-{
-	struct auxiliary_device *adev = to_auxiliary_dev(dev);
-
-	kfree(adev);
-}
-
-static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev,
-							 struct clk_imx8mp_audiomix_priv *priv)
-{
-	struct auxiliary_device *adev __free(kfree) = NULL;
-	int ret;
+	struct auxiliary_device *adev;
 
 	if (!of_property_present(dev->of_node, "#reset-cells"))
 		return 0;
 
-	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
+	adev = devm_auxiliary_device_create(dev, "reset", NULL);
 	if (!adev)
-		return -ENOMEM;
-
-	adev->name = "reset";
-	adev->dev.parent = dev;
-	adev->dev.release = clk_imx8mp_audiomix_reset_adev_release;
-
-	ret = auxiliary_device_init(adev);
-	if (ret)
-		return ret;
+		return -ENODEV;
 
-	ret = auxiliary_device_add(adev);
-	if (ret) {
-		auxiliary_device_uninit(adev);
-		return ret;
-	}
-
-	return devm_add_action_or_reset(dev, clk_imx8mp_audiomix_reset_unregister_adev,
-					no_free_ptr(adev));
+	return 0;
 }
 
 #else /* !CONFIG_RESET_CONTROLLER */
 
-static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev,
-							 struct clk_imx8mp_audiomix_priv *priv)
+static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev)
 {
 	return 0;
 }
 
-#endif /* !CONFIG_RESET_CONTROLLER */
+#endif
 
 static void clk_imx8mp_audiomix_save_restore(struct device *dev, bool save)
 {
@@ -408,7 +375,7 @@ static int clk_imx8mp_audiomix_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_clk_register;
 
-	ret = clk_imx8mp_audiomix_reset_controller_register(dev, priv);
+	ret = clk_imx8mp_audiomix_reset_controller_register(dev);
 	if (ret)
 		goto err_clk_register;
 

-- 
2.47.2


