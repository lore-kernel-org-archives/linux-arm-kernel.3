Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F333C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 13:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B5B/1MAbm7XWDn7sksBQeFE3Zfzb3mpfhe3LWfzUyF0=; b=xymyr3NRJtQYIxMKgxUOqVnDCu
	AiH3I23FwegsBaM5B7vzsG8PPEo0mqV1Uu/4i0LZOBgvnEy1PaLjZDsdWneCfTPAI2QMsXRaHwuyP
	iyaGUDfjD61dTHIrAAwlS/d4SDCqE4TKqVk4LcdAxxmusesRjN6HOnoStLBakgk/+rzOw+E9gplip
	onujZWFM7QiNiFMvRRVEeO8tisFIiYG13jXyfxgy9aryyeZ+gGyZaCXpX2NfO/PVoylGj5yjB6maH
	MBIml4jnNJNAKPKOHFp+8flHkUzQZOYcidBeYYZdBjaAuLllkBW5E+GO0CB0IMFRmimApRPJrRF9a
	8ouxm3dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqBas-0000000B6K6-066k;
	Thu, 06 Mar 2025 13:48:58 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9Cv-0000000AkdH-0X8E
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 11:16:06 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5e52c1c3599so760294a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 03:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1741259763; x=1741864563; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B5B/1MAbm7XWDn7sksBQeFE3Zfzb3mpfhe3LWfzUyF0=;
        b=fJIkNHtE+eNoqJeDLkB9l3wHqiZlfpnYHJiwRrMhI6UCreqQXlkNurU5Eo2dDlmghh
         hC1kKzjQRb1ZrZgAkHOaorbquRpB/TEk/i56RjZxTyuJ15LMXn/BjwkSyZ7ZRD9IMq/v
         I1FVKvxy/ikk+QYU4TfQaH0KWuEDabL6bL1l4AaMKtziQXui9NmbyF5cc2hg0ogRIgqu
         So/M2nAZ23jwH6Lk3aFeU+dclqIzYcju23fU/2C3ssVb1nPyPEt1V7gQdlhv/GksML8t
         cS1l2rzVs4ABJdXfTnwwLig9MOs/xMdEMdIFxImdksLHsMO/5oCwyMa2qM5m76bin3X2
         Wl9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741259764; x=1741864564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B5B/1MAbm7XWDn7sksBQeFE3Zfzb3mpfhe3LWfzUyF0=;
        b=oI0f7rAvR6NiEp3/OuKe2bGA5GQcFyMvhrfGHR+hEbCyKrR3AS7Mjey+0DtRNd5Ovc
         boLGomzYunOoI7I2tmpZBJ9w2UWnULADZ7a6pmtpRJyiXX7UpDFdYKw/G14tX3aigbSN
         DY46zCpFDBdrH8g3te2AzsgFl2DmIXNdm8eG1H6aGBpW5lRm+HlWzhL4J3vIVP1ANDXF
         4J4qkiO3t9h0TwbsyD9wNHNHjIyTjuHoSnayq/4f0jd2N92nKjWTkfSFP9PtK9uTWqH0
         VNRjy+G1omYs+9U5bXOdvwZHJPXKWhjRv01xpDFkhA77+kT/r35Nfkq8DwPmcsWx81iU
         ZDLg==
X-Gm-Message-State: AOJu0Yx63712K3FipsZY0+NBElanrA6z+QL5Xgiu3KkYJKXwj2xxa+N8
	c/fxaYDvdh6kVHY0qeyAi/IIq8OiYMCsqp85qxShAsxOrlUKcTe7czzGCgnRgNk4D2rFsagNnz4
	G
X-Gm-Gg: ASbGnctQie3pD3lksHiKOhKpygv6Hnbf0wNckbwdevpgr0aY9MOgPU3o/LSEHwJMSFP
	p/MdnpoZdu/hxZ8BdO/JUjzXFsPEOZPfmOuw1VevFM7FDe6U8JEChLHm9aLEfryXEcuylQKBmOq
	Py401yh2f86RcHlCOCaFvHQC+48hfuVvb6RZd9HPAWWfPgfF2AryK+Go9IoGWRe5kDpSYplTrO2
	o5SbcQsDY2rC7xWWrhUO8sRTWubLO8IVbvEHK95wKv4S9Gzns9y7zCoXllUQXPCe841gNG6Rh9I
	Jkh3SdeLblrAjxNlFrO9d5at75I2LEXHSrj/VRMOJQ==
X-Google-Smtp-Source: AGHT+IGEsRF+ZuhCrECUeqOSfOd/YhlB/c+V8tdTbUibcDVmAxZHV2uaYCpCEp4a4SsOt6thlQaVKQ==
X-Received: by 2002:a17:907:3f89:b0:abf:3f82:1218 with SMTP id a640c23a62f3a-ac20dd0539fmr697232066b.46.1741259763526;
        Thu, 06 Mar 2025 03:16:03 -0800 (PST)
Received: from localhost ([2001:4091:a245:8327:80ad:8144:3b07:4679])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac2394399aesm78672066b.30.2025.03.06.03.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 03:16:03 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Thu, 06 Mar 2025 12:14:44 +0100
Subject: [PATCH v5 06/13] can: m_can: Support pinctrl wakeup state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-topic-am62-partialio-v6-12-b4-v5-6-f9323d3744a2@baylibre.com>
References: <20250306-topic-am62-partialio-v6-12-b4-v5-0-f9323d3744a2@baylibre.com>
In-Reply-To: <20250306-topic-am62-partialio-v6-12-b4-v5-0-f9323d3744a2@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Anand Gadiyar <gadiyar@ti.com>, 
 Chandrasekar Ramakrishnan <rcsekar@samsung.com>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, 
 Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, Kendall Willis <k-willis@ti.com>, 
 linux-can@vger.kernel.org, Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4086; i=msp@baylibre.com;
 h=from:subject:message-id; bh=mSNYgSWj+YADxcJYTld46k4BIENA6g6D+Jdi+6l+eLo=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNJPNh9psOCQeNLEOCn+b9SePUt9tki7Hto5sTxt5WbzS
 MFGOzufjlIWBjEOBlkxRZa7Hxa+q5O7viBi3SNHmDmsTCBDGLg4BWAiiQmMDGv+Cuxsuy9m4Bt+
 5bq2c0U4p+yipf2Kv94uemPBsfXvuSuMDM2GYXFdIh8YnRnetSdYFXOIHROwcC0LWJR/88vTsAs
 uvAA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_031605_169871_12511FA9 
X-CRM114-Status: GOOD (  16.77  )
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

am62 requires a wakeup flag being set in pinctrl when mcan pins acts as
a wakeup source. Add support to select the wakeup state if WOL is
enabled.

Reviewed-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 drivers/net/can/m_can/m_can.c | 68 +++++++++++++++++++++++++++++++++++++++++++
 drivers/net/can/m_can/m_can.h |  4 +++
 2 files changed, 72 insertions(+)

diff --git a/drivers/net/can/m_can/m_can.c b/drivers/net/can/m_can/m_can.c
index 20fbef50db20ab5cea5afe4c44fda8b03e5c8c85..c1c5f8e90d37cde1daa8ab17c2be4b8be451dc50 100644
--- a/drivers/net/can/m_can/m_can.c
+++ b/drivers/net/can/m_can/m_can.c
@@ -2233,6 +2233,7 @@ static void m_can_get_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
 static int m_can_set_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
 {
 	struct m_can_classdev *cdev = netdev_priv(dev);
+	struct pinctrl_state *new_pinctrl_state = NULL;
 	bool wol_enable = !!(wol->wolopts & WAKE_PHY);
 	int ret;
 
@@ -2249,7 +2250,28 @@ static int m_can_set_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
 		return ret;
 	}
 
+	if (wol_enable)
+		new_pinctrl_state = cdev->pinctrl_state_wakeup;
+	else
+		new_pinctrl_state = cdev->pinctrl_state_default;
+
+	if (IS_ERR_OR_NULL(new_pinctrl_state))
+		return 0;
+
+	ret = pinctrl_select_state(cdev->pinctrl, new_pinctrl_state);
+	if (ret) {
+		netdev_err(cdev->net, "Failed to select pinctrl state %pE\n",
+			   ERR_PTR(ret));
+		goto err_wakeup_enable;
+	}
+
 	return 0;
+
+err_wakeup_enable:
+	/* Revert wakeup enable */
+	device_set_wakeup_enable(cdev->dev, !wol_enable);
+
+	return ret;
 }
 
 static const struct ethtool_ops m_can_ethtool_ops_coalescing = {
@@ -2377,6 +2399,44 @@ int m_can_class_get_clocks(struct m_can_classdev *cdev)
 }
 EXPORT_SYMBOL_GPL(m_can_class_get_clocks);
 
+static int m_can_class_setup_optional_pinctrl(struct m_can_classdev *class_dev)
+{
+	struct device *dev = class_dev->dev;
+	int ret;
+
+	class_dev->pinctrl = devm_pinctrl_get(dev);
+	if (IS_ERR(class_dev->pinctrl)) {
+		ret = PTR_ERR(class_dev->pinctrl);
+		class_dev->pinctrl = NULL;
+
+		if (ret == -ENODEV)
+			return 0;
+
+		return dev_err_probe(dev, ret, "Failed to get pinctrl\n");
+	}
+
+	class_dev->pinctrl_state_wakeup =
+		pinctrl_lookup_state(class_dev->pinctrl, "wakeup");
+	if (IS_ERR(class_dev->pinctrl_state_wakeup)) {
+		ret = PTR_ERR(class_dev->pinctrl_state_wakeup);
+		class_dev->pinctrl_state_wakeup = NULL;
+
+		if (ret == -ENODEV)
+			return 0;
+
+		return dev_err_probe(dev, ret, "Failed to lookup pinctrl wakeup state\n");
+	}
+
+	class_dev->pinctrl_state_default =
+		pinctrl_lookup_state(class_dev->pinctrl, "default");
+	if (IS_ERR(class_dev->pinctrl_state_default)) {
+		ret = PTR_ERR(class_dev->pinctrl_state_default);
+		return dev_err_probe(dev, ret, "Failed to lookup pinctrl default state\n");
+	}
+
+	return 0;
+}
+
 struct m_can_classdev *m_can_class_allocate_dev(struct device *dev,
 						int sizeof_priv)
 {
@@ -2417,7 +2477,15 @@ struct m_can_classdev *m_can_class_allocate_dev(struct device *dev,
 
 	m_can_of_parse_mram(class_dev, mram_config_vals);
 
+	ret = m_can_class_setup_optional_pinctrl(class_dev);
+	if (ret)
+		goto err_free_candev;
+
 	return class_dev;
+
+err_free_candev:
+	free_candev(net_dev);
+	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(m_can_class_allocate_dev);
 
diff --git a/drivers/net/can/m_can/m_can.h b/drivers/net/can/m_can/m_can.h
index bd4746c63af3f0a032910644dfd48a9ebb3a6168..353ad73649218dc0a03d9ba947c6abc847c958eb 100644
--- a/drivers/net/can/m_can/m_can.h
+++ b/drivers/net/can/m_can/m_can.h
@@ -128,6 +128,10 @@ struct m_can_classdev {
 	struct mram_cfg mcfg[MRAM_CFG_NUM];
 
 	struct hrtimer hrtimer;
+
+	struct pinctrl *pinctrl;
+	struct pinctrl_state *pinctrl_state_default;
+	struct pinctrl_state *pinctrl_state_wakeup;
 };
 
 struct m_can_classdev *m_can_class_allocate_dev(struct device *dev, int sizeof_priv);

-- 
2.47.2


