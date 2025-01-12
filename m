Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FF0E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 13:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BOVqy08C6GsLjB0sMrq2+YSaSxUnwU9JmLZUrKlTUz0=; b=4i5yqjWUtx4mT01wUgwMGBe2CU
	PtfGlswuQPkxIIgT9RJ5DwShZVlg3jXSb5u8c6zUcUMq/XFAKJeBT7ozQcFI5AVNmSFjh5mMKiTpf
	Q+tO4s9k13btTnzG+sUd/efk+8uPTvoF7yeDPWnc2hhKd58W9XH3UOCFvSNe+JhSwhb4y9MmpJPJ+
	iIVaPgive9W0FLUNKpt3Wif0B1Z0vgkBunTuBH26zNTDWVJUcOQc5/w74d9P7acjtj99qqGga/HEC
	WeniG0MkgKZCmPd3dwd8wD35kn+kB3beTaOxtj8Wj5hkdWDW/TXUOrqRNEBKaail8Z5DiohSoWCwR
	aAIde3Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWy93-00000002mQr-3iYd;
	Sun, 12 Jan 2025 13:36:49 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWy5P-00000002lcM-1wPZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 13:33:04 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5d0bf4ec53fso632040a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jan 2025 05:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736688782; x=1737293582; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BOVqy08C6GsLjB0sMrq2+YSaSxUnwU9JmLZUrKlTUz0=;
        b=ZyBWCApEkDTJYXGkiImFD/PWn2qA/f0nhb/7ZXZxuWquZ+EhmZ/koj6zNHMkwihEPs
         cXd5nzygwScv2YYVSFzRd5TLjUQT54U/OKgYfUc57fj5PLMcyR77h6RECxz4JputXp4b
         QPEEcVQyeNUNMvlKJRb0cCwri9Y5UHalpNHVIVmiiSzxU8duofZ70w/6VLPh51kENvXN
         WDlEDs8dRhcHSVuICqzoyV5u2+mUi1NgFgIYem9fCUTyT4/IomPGVHqyBPBsFOFf7b1T
         0ZS1xaVmbAH53RzFZmz3VxuON3lJ6k22AwQNmvcUBvkuXnB4H72zF2Zx7rK9YkHuaXg3
         1JeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736688782; x=1737293582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BOVqy08C6GsLjB0sMrq2+YSaSxUnwU9JmLZUrKlTUz0=;
        b=p6CmUwedy4FwKqzqJAQdwgsbJ2xgB9poX81T2VupU2bRkDSi/xjJztLyG3PptGrbez
         GKFY8gLqzNcESk9zf0by9hc2oWSm7d7F3RFo5wME0wGx5AmSfOruyIgdnuvE78WmwWbd
         Ejkz02D3u8ICGSL6YQtBuhyZi6ggrBOSNSBNHQeEfg7pPfsq5IlsVEkDGNpUKjsBKSZM
         MhbNxbN/2zPYC1n7boY/3teCNfMur79O6SXvBV+WLi1DsuU3019H1CFo9KEAmeHZReS9
         UQ7/cqjAGAnd2XH3zM1pNzh4K1HIUmbdHzQ4iRFMAs+fWifpmrcsj9bVffEp5yw2vJhG
         VewQ==
X-Gm-Message-State: AOJu0YzN6RFsrA/Cjm33ySRI9/7YwsdD0vhi2steVnY39dHWvtgcqPmG
	lba3I+ebUrKKr/CogHFmw+8DbVgeotC09APw07IPF13uYSlGT1IfMWQv9fY79Fw=
X-Gm-Gg: ASbGncuSfu/ZiKCBLl3LhNc0g024G240VAFeq7aOVSNDEtGlpRkjeJaYO8phyhfI6r0
	CUNIHfjvM0CPGLY9Ge47xScvy+uLbhUzJy3gtAtqACyOCb8RMaAbODynX8e/GfFZ2g2b903t7NN
	bEF6U0uimGbHIndLshqMLnyX7runpDol1lAuYxmUkni1RYIHb7odnPngk5XBhVAyhXLr6BeMIQ3
	D5adPkKRH/tzxvVt6plc/xQ25O7g2gu4klWq7bUkEoLPJvhEFlBQ/EQ1d1NTS05V3WXOvwi
X-Google-Smtp-Source: AGHT+IHAPDDqI1itoMeCFKalJTN43D2b88pk2KL4TDUxwjUyr+2n3z7I5NTnbvxsw1RUzD8twrEPcg==
X-Received: by 2002:a05:6402:5206:b0:5d3:d747:6496 with SMTP id 4fb4d7f45d1cf-5d972e801dfmr6260298a12.10.1736688781780;
        Sun, 12 Jan 2025 05:33:01 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9903c4477sm3584609a12.51.2025.01.12.05.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 05:33:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 12 Jan 2025 14:32:44 +0100
Subject: [PATCH net-next 2/5] net: ti: icssg-prueth: Use
 syscon_regmap_lookup_by_phandle_args
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250112-syscon-phandle-args-net-v1-2-3423889935f7@linaro.org>
References: <20250112-syscon-phandle-args-net-v1-0-3423889935f7@linaro.org>
In-Reply-To: <20250112-syscon-phandle-args-net-v1-0-3423889935f7@linaro.org>
To: MD Danish Anwar <danishanwar@ti.com>, Roger Quadros <rogerq@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 imx@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1430;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=9S7gVVHLbOOdhmOrgxdeq6yW9GeOcGb38tpUZkh03pU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBng8SCCW0MlfjlA9K1TjLeHUu3QGRRtM/WgAZoC
 WMtHJkHeVGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4PEggAKCRDBN2bmhouD
 10+YD/9A02R/3MQQubS4ahQZTK/vIgEnDoLeLOZ2z6ur0SaSsl8P8g2c7riLLdYF92lSsgr7uRd
 jmeT9wLRxCkXUvDb6BlQcaqDWHzdA8yCfatXJo3i/2gmM28IQU0DZHciCQ9Er059Bd1mWk1TZDp
 LNC55whGCCGmpzxIn2wGaL7HylIHDR0oWZ2JQ+IBGe4+Iw2oTVS4tPErPl7ysAZCJbqOl8oHjI4
 ijfACgxQuzSwv72lLqmbXddZZ5BsAbYIfA0ql2sUIVsXx7/dcdo+J+1922mAUQcDtuQ3L8YdsK1
 nrT2AECb9AT2yQFJUWCFgml36SGT/AAGcCDFhEGrSm5sqmRhO+pbePafGg1SzeB/ykFZP8pbtmI
 kYyHMLG58LuLSM9wBwV7e230On5UeKDGtoQB2lhdPZqpTAypo/lNglE9T0jBII67mTOsel8rhNY
 8eWLdF/Ir8VjBmMK66BDKbEGh5NscM7qzw602iC1Zf4w/xVnMqR/P6ukm9kumXSAueVzXvGHj4P
 /9tyS3lSciwxAHxVcbKlC5/9XPgtg7i/7Ij3eN0jCdXqwbClXlaRNEYPaQ6bGPpOj4Ozpq7FzLc
 BDYupKiqx9fiH26x/CdTVFDC0seiQ9ZBJW9cttHi/2Pr2k57jYb1KWuMCQeroyLpY+MEyUYCjfb
 o98tiqTnTayP/uQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_053303_506418_92AD7AC7 
X-CRM114-Status: GOOD (  10.98  )
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

Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
syscon_regmap_lookup_by_phandle() combined with getting the syscon
argument.  Except simpler code this annotates within one line that given
phandle has arguments, so grepping for code would be easier.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index 5465bf872734a3fb9e7e481d556eaec3cce30e0e..68f1136e3db725eba239b10f337786ac735030ca 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -2559,20 +2559,15 @@ static int am65_cpsw_am654_get_efuse_macid(struct device_node *of_node,
 {
 	u32 mac_lo, mac_hi, offset;
 	struct regmap *syscon;
-	int ret;
 
-	syscon = syscon_regmap_lookup_by_phandle(of_node, "ti,syscon-efuse");
+	syscon = syscon_regmap_lookup_by_phandle_args(of_node, "ti,syscon-efuse",
+						      1, &offset);
 	if (IS_ERR(syscon)) {
 		if (PTR_ERR(syscon) == -ENODEV)
 			return 0;
 		return PTR_ERR(syscon);
 	}
 
-	ret = of_property_read_u32_index(of_node, "ti,syscon-efuse", 1,
-					 &offset);
-	if (ret)
-		return ret;
-
 	regmap_read(syscon, offset, &mac_lo);
 	regmap_read(syscon, offset + 4, &mac_hi);
 

-- 
2.43.0


