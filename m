Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E494E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 18:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Oa83hNX3CwwEMxEEP2piKXBeDYRk0kIMXtSMe9IMC8Y=; b=Dvxc7TO1j+aWw8+8HOy5772340
	nME7ITATaOvWoL7lsesZA1XjWMLbzjSUIyiBYXhycg6m7otFmnFFvQVY3cbxGufzAoJSRk6gPySrh
	DvPKJeniYRbVuPMz2wR3dizVy1Wi841XIDa80BKa4M7FeWgoWOtBYcr7/5UN83tX0hUdH72BdcEVj
	DMSU1u9uxnL0Xbw5+Vu81GMfyjK55svuMhEKBHXqiwEDIXbCneYpvOcVaFzHrMefCVivP/nu8NJbv
	AsR4mcUIxCK7dYNr/gY15CW51KMRDKVIy8VyUHFANcwCAjkSVoaqoag2a1fmZiR+eVef4Afabgggi
	04lS2u3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWggE-00000001Hle-3Kpn;
	Sat, 11 Jan 2025 18:57:54 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWgcd-00000001H8Z-0rf0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jan 2025 18:54:12 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3862a999594so99941f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jan 2025 10:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736621649; x=1737226449; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Oa83hNX3CwwEMxEEP2piKXBeDYRk0kIMXtSMe9IMC8Y=;
        b=AQx+RWUZJzqasKh1gxKETTxvl01KkVgrqhZhDCYqAobalKE+daPDZIwciB4Qp9ePCt
         +dqUqabC7Q6KNrmkZeiviSPjp3MFdaPqXr495wFwrvFDl9faIiBuxz8swcHgxoEyHIff
         rz1rBT7uTAZPs1lW6gTLlH4JMlH2W3TWeSd1Q6Lq/UeG7A1r/l+VK85xa+MugdptaVCT
         gwwh4vY/4aWBdaAdhKIePyRaaVA16jZpmH3kKiWN1vo9aXTdan5K5w2TRcwSbDsC7UM9
         VDbsXicbOnw0jf5ARxpzb0/XebYJt0krFQDbYYI4lQDfe3qF+VUxi8gtC3wF83qp7ue9
         ++4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736621649; x=1737226449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oa83hNX3CwwEMxEEP2piKXBeDYRk0kIMXtSMe9IMC8Y=;
        b=EV4uz/3FgWr5+CIaGmZ73tQtARs5XNFFa01icV8j83LqKok722atELrMoQvkXundQ+
         yw+FkpfWktxfb9nh3wmD27+fiXwpTQpaipDoh6V6I1MGdB62wuqYq09cevYk5Ad+vCdF
         BHmSSCzTdYKPHvPRdNSQF4gF0hOBHn97yPDqZ8Fp0A8i6FmFBaKH5dItAwx4xsvwhfN3
         1djkQO6XkttjxCUpv+1bQgLbj+SsLLsqaXBswEO+gbr9gzC1Us713wnKJmxAk9E+7TYJ
         h3ieZK/YYvfiIrbCcZ/zIbaHGWJURrRudHZe+iL/q2sbGYF/qJSAKFsn4r0K8wypnDZP
         X+bQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJ1r2WxMgqjW9A1nlf7pNDoQUbsrH1vbZlj1a1aogYDpDjuAygRoUZkiyESjXSJmJTUarEFf0XWT9Eo07ZPoJJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3+tyRaA44gumsDV9aBz+rb6Cy8RGttHw1IOuH5HBNBlwdnm6M
	Yo9mSKC4eYOM21v0TFYtc2TSVgOb4NIkyrbA9R7Qio36YEzOiMq1qPwklY2c/LM=
X-Gm-Gg: ASbGncskPy0Kw9fKpKonUsA55Kew19pvTtPo68UVFm394R9xmMNCCBWYK4DpGP2h2LR
	XoFuMUu+c2e3w24qgBGC2XxiaZ7QUdrA0l0A/ORLBucJRdzB7dOZfpYtg5wUvvfxhcuP5wutszu
	g8ZHS1LgZXkkNex51GsWRwj4Eqgb8smSkracuDcotTC2xFPzQfUAYvy0Kmkt+1RTAsA6DI6Hwmo
	3rV10yjvHDmDOzkEJKWrBiomO/jOtUuq+PTzBUnynJqb6l9YxTmVjSXIBZuE/XkpsH8X5E=
X-Google-Smtp-Source: AGHT+IGjNzKf5xkH+dgFw9vWBtiAwtZ1QisCgXXHwdviDMt1yJXmFajYa2tlVaOtKkX/ki+3PiYKRQ==
X-Received: by 2002:a05:600c:3b11:b0:42c:bb35:b6d0 with SMTP id 5b1f17b1804b1-436e267f21bmr60374135e9.1.1736621649511;
        Sat, 11 Jan 2025 10:54:09 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b81ccsm7981691f8f.65.2025.01.11.10.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 10:54:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] phy: stih407-usb: Use syscon_regmap_lookup_by_phandle_args
Date: Sat, 11 Jan 2025 19:54:07 +0100
Message-ID: <20250111185407.183855-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_105411_245210_7754FB54 
X-CRM114-Status: GOOD (  12.74  )
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

There is also no real benefit in printing errors on missing syscon
argument, because this is done just too late: runtime check on
static/build-time data.  Dtschema and Devicetree bindings offer the
static/build-time check for this already.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/phy/st/phy-stih407-usb.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/phy/st/phy-stih407-usb.c b/drivers/phy/st/phy-stih407-usb.c
index a4ae2cca7f63..ebb1d0858aa3 100644
--- a/drivers/phy/st/phy-stih407-usb.c
+++ b/drivers/phy/st/phy-stih407-usb.c
@@ -18,8 +18,8 @@
 #include <linux/mfd/syscon.h>
 #include <linux/phy/phy.h>
 
-#define PHYPARAM_REG	1
-#define PHYCTRL_REG	2
+#define PHYPARAM_REG	0
+#define PHYCTRL_REG	1
 
 /* Default PHY_SEL and REFCLKSEL configuration */
 #define STIH407_USB_PICOPHY_CTRL_PORT_CONF	0x6
@@ -91,8 +91,8 @@ static int stih407_usb2_picophy_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	struct phy_provider *phy_provider;
+	unsigned int syscon_args[2];
 	struct phy *phy;
-	int ret;
 
 	phy_dev = devm_kzalloc(dev, sizeof(*phy_dev), GFP_KERNEL);
 	if (!phy_dev)
@@ -116,25 +116,15 @@ static int stih407_usb2_picophy_probe(struct platform_device *pdev)
 	/* Reset port by default: only deassert it in phy init */
 	reset_control_assert(phy_dev->rstport);
 
-	phy_dev->regmap = syscon_regmap_lookup_by_phandle(np, "st,syscfg");
+	phy_dev->regmap = syscon_regmap_lookup_by_phandle_args(np, "st,syscfg",
+							       2, syscon_args);
 	if (IS_ERR(phy_dev->regmap)) {
 		dev_err(dev, "No syscfg phandle specified\n");
 		return PTR_ERR(phy_dev->regmap);
 	}
 
-	ret = of_property_read_u32_index(np, "st,syscfg", PHYPARAM_REG,
-					&phy_dev->param);
-	if (ret) {
-		dev_err(dev, "can't get phyparam offset (%d)\n", ret);
-		return ret;
-	}
-
-	ret = of_property_read_u32_index(np, "st,syscfg", PHYCTRL_REG,
-					&phy_dev->ctrl);
-	if (ret) {
-		dev_err(dev, "can't get phyctrl offset (%d)\n", ret);
-		return ret;
-	}
+	phy_dev->param = syscon_args[PHYPARAM_REG];
+	phy_dev->ctrl = syscon_args[PHYCTRL_REG];
 
 	phy = devm_phy_create(dev, NULL, &stih407_usb2_picophy_data);
 	if (IS_ERR(phy)) {
-- 
2.43.0


