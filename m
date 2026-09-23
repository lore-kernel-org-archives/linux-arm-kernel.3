Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F225C98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 20:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q38gPulPuKur3IEZF2LFNkQp+BQq6YW8/OlTIlhL7Jo=; b=Y+tk/UI7s4ZiErZdrYzSkAbpel
	itDr9XRcVVOUBj3VtTaPeqBTFQroEzPo/JsgCNRNrrljoD/+Y9u12UtdcWLAxIUVHWaOpXZD2qoxy
	zoLl4ntYjh47Utd1Tu8lZR9MAshbMDVIygbCVkpelwNoFALzqm0XNUjWKl/+bo0G/nXN0+PZjYRDJ
	kE+8yaaEmXI+zXq+927QwlPlTVUspkIrAXkWVqHTV+jVZcNHxCKtxhWmaUAHo+p6MyvEoRXbRhgKL
	1qQGXA7NTXXafxOswmeZPJNv8VcCYSNHJo/KwEb6FjZrCw+VcoO5a8Sb+8RfatEfarC6EA4zP2ZIk
	Wb4VdfcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Tsi-00000009VRr-1IoA;
	Wed, 23 Sep 2026 20:47:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Tsf-00000009VQp-2edE
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 20:47:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Q38gPulPuKur3IEZF2LFNkQp+BQq6YW8/OlTIlhL7Jo=; b=XEd6UrwjCLR89Dik7HAlc8QqWW
	P1AchKtR2al0BffDJ9NxmATD6zZy4ltbcNiUTqwys49Px5Aev9TiuE2DjDt9WgPSJESTfKgdEi4V0
	WXch+qsuPmsApYHbc/KzfijxPXXoD5OmEbdIF0CJwyNkGVX0412sLj3u03/KAT78z6Ge7wNVGqhBP
	g2qrpyfnVK+F6KIEuodv/EZ6enizdtp97b8NhiPc+TDqM2rytWmf2QF4WryLT3E0Ty07jxaCLOvkJ
	e3w3VGJOHvxhLYJtAdoW8NK3c997C4J3EzkaA5wXAyrBc+QmYF9YS7ASHpWf1WJjejr/Yqeb7EJhJ
	tkc6VoyQ==;
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9TsZ-0000000FGlg-2flW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 20:47:51 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so15421575e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 13:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790196466; x=1790801266; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q38gPulPuKur3IEZF2LFNkQp+BQq6YW8/OlTIlhL7Jo=;
        b=D6ZCu4tiFuk3L9f5V2myfH6uZsgmQ5zlpLqEHQsOJq+XI60Z83IjIAV8mqmtrYu8m/
         3kGzl6pyTj8foyR58lVlvOSgpBUeealoEI/3f6T11uONPCIkvZ+MVUZs1wVppITihqu1
         dK+FRpJiQV8ADbOdN0iwSwurdViDRQOf1uaINo9C4O7gnphhmVyCfW92c7FxFjJZBlwD
         Y6icsIpn16gQgZbywIVyoZ2QKPQE3LuuTRXTmBLukEKx0JQKv0pULRZgERctqZJObLuF
         Q8h4IvByKtwSfrW3oz7/QI48HcOWbNuy7Ef8YrSo6FPvZ+vpsTL+S7C0ab2gR3YVuRDl
         swDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790196466; x=1790801266;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q38gPulPuKur3IEZF2LFNkQp+BQq6YW8/OlTIlhL7Jo=;
        b=v0CAZ5XD53PVNcnaWoTqny1jqhOtRVfdogF6RvoZxFhR+3901T5RXxxmeRClOqcZXs
         oGK03yM4bCpSx9enWlmmkS/EbrTrPqVx5czplBocLfw4hg4iwrdVJ8tQMQijc2fNAeuE
         PgbZnMeHobphIgwT/p48K0adnj6Jvfa/hj4INUasP3oHdyVlfGgLbSN58WhbVEqsJWQM
         EbZytGQ3r3txKxyksNDUFtiJKmFJQ+nw8TdNidcxgSZHsEIM5OAyKyyTkEjQhvcJma/m
         1su83lkSSmvwYN1WSbq9YQpbP1dA1rkorVqLaD6vYqqmIEeqULfFr8Z3v9ELuPmVmxdK
         +1TA==
X-Forwarded-Encrypted: i=1; AKwUvBzdBOamd7HYjK4gvmjwhb1wrpN3no8SuZ0rVQBDJ0a2f43bla6w0XhfBEDJmH84IXd5ohgk0h1L2FDIzwt+1ewp@lists.infradead.org
X-Gm-Message-State: AFuF++mrNlqUpDYzSI3D8SjSxDAdG8R1UEcWLMiLjDfiyDX6GKMHupf3
	LdMeobEE5zJ9GiYnK8mGGWRZW+iiQl4GMIGYCJdYVOSxUPNgx+kDOWWaJGqTAqJijas=
X-Gm-Gg: AYBFou3B5TbaEyekS7dwGDzr1VhNofv984tumL85FYgtafbZjxduDy2gDXFe0lhCjCr
	oLMM1YsWF8zuIT0isoHuWMGtgX5jWVmRdF71qab0dSCXcS183fGVkS+w/QgfsEKfKmD+J8akUbj
	QKJRVr21hEDCKpFOnoCSy0Vv2u5SCSvVVqCungNcTHGf6fNLrkqvrT59+bAw7rYrlcX0l1+8Sn6
	prO5Ax4T483VMO8cz1VNPoFo+77qmnOvlvHJJwzD9gZCx+n3iVZiNK+CAQWw1OqOvdOD3sTW6yl
	wRDVQW75BZ7XhvHnjBUVAg7QqqZzi00herODxhLzbIaeLOeZMqw12IjDquIBg4wxMbUxa7PkYc8
	sitFCJfZrzQ+KlaWQTCscnODkD4NYlYVsqzGLulRZCTFn117UmuuulNVXrChaXiq5EbY3Ii8rh8
	IBGhKfMiP/W4tDlaZIubEtqKrKaHtE5xDOkvnoWba1f6bRyhdMer1rM/OX4MT29TPzpUW3Jurml
	wEBy4awA2kZ0/tl3A==
X-Received: by 2002:a05:600c:1c0b:b0:49c:fc6e:8cb4 with SMTP id 5b1f17b1804b1-49fe66dfe1amr7799915e9.24.1790196465888;
        Wed, 23 Sep 2026 13:47:45 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5df44f9sm11367675e9.11.2026.09.23.13.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:47:45 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 23 Sep 2026 22:47:32 +0200
Subject: [PATCH net-next v3 2/5] net: stmmac: sun55i: Add per-compatible
 match data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-allwinner-a733-gmac-support-v3-2-15735155a789@baylibre.com>
References: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
In-Reply-To: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Andre Przywara <andre.przywara@arm.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4588; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=DYM49ne6atEAPBbwp7MW6XIu2N107jKi+6HoBXrWSjs=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlbrN66bpWrmPz5JntSyopU3pdTNryr12g0buPx2RphV
 zNNfNP2jlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenAEyEM5eRYf7qmbuZ5Q3skvb5
 ZNtkmHIU7X2ubZlgtU9wQ6y2xfYHVxn+J69n1tIWZfwm0hWTqKwxVf0Y28P2zvazHA1199pWmxl
 wAgA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_214748_768259_D42D34EA 
X-CRM114-Status: GOOD (  18.59  )
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

The A733 GMAC210 glue registers are in a dedicated MMIO region of the
controller rather than in a syscon, at a different offset.

Add per-compatible match data holding the glue resource init callback, the
stmmac flags and the glue register offset to prepare the support for the
A733.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c | 68 +++++++++++++++++-----
 1 file changed, 54 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
index 862df173d963..c4df53285007 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
@@ -16,6 +16,7 @@
 #include <linux/of.h>
 #include <linux/phy.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/stmmac.h>
@@ -23,8 +24,6 @@
 #include "stmmac.h"
 #include "stmmac_platform.h"
 
-#define SYSCON_REG		0x34
-
 /* RMII specific bits */
 #define SYSCON_RMII_EN		BIT(13) /* 1: enable RMII (overrides EPIT) */
 /* Generic system control EMAC_CLK bits */
@@ -37,18 +36,40 @@
 #define SYSCON_ETCS_EXT_GMII	0x1
 #define SYSCON_ETCS_INT_GMII	0x2
 
-static int sun55i_gmac200_set_syscon(struct device *dev,
-				     struct plat_stmmacenet_data *plat)
+struct sun55i_gmac;
+
+struct sun55i_gmac_data {
+	int (*init_resources)(struct platform_device *pdev,
+			      struct sun55i_gmac *gmac);
+	unsigned int flags;
+	u32 offset;
+};
+
+struct sun55i_gmac {
+	const struct sun55i_gmac_data *data;
+	struct regmap *regmap;
+};
+
+static int sun55i_gmac200_init_resources(struct platform_device *pdev,
+					 struct sun55i_gmac *gmac)
+{
+	gmac->regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
+						       "syscon");
+	if (IS_ERR(gmac->regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(gmac->regmap),
+				     "Unable to map syscon\n");
+
+	return 0;
+}
+
+static int sun55i_gmac200_setup(struct device *dev,
+				struct plat_stmmacenet_data *plat,
+				const struct sun55i_gmac *gmac)
 {
 	struct device_node *node = dev->of_node;
-	struct regmap *regmap;
 	u32 val, reg = 0;
 	int ret;
 
-	regmap = syscon_regmap_lookup_by_phandle(node, "syscon");
-	if (IS_ERR(regmap))
-		return dev_err_probe(dev, PTR_ERR(regmap), "Unable to map syscon\n");
-
 	if (!of_property_read_u32(node, "tx-internal-delay-ps", &val)) {
 		if (val % 100)
 			return dev_err_probe(dev, -EINVAL,
@@ -95,7 +116,7 @@ static int sun55i_gmac200_set_syscon(struct device *dev,
 				     phy_modes(plat->phy_interface));
 	}
 
-	ret = regmap_write(regmap, SYSCON_REG, reg);
+	ret = regmap_write(gmac->regmap, gmac->data->offset, reg);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "Failed to write to syscon\n");
 
@@ -107,22 +128,34 @@ static int sun55i_gmac200_probe(struct platform_device *pdev)
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
+	struct sun55i_gmac *gmac;
 	struct clk *clk;
 	int ret;
 
+	gmac = devm_kzalloc(dev, sizeof(*gmac), GFP_KERNEL);
+	if (!gmac)
+		return -ENOMEM;
+
+	gmac->data = device_get_match_data(dev);
+	if (!gmac->data)
+		return -EINVAL;
+
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
 	if (ret)
 		return ret;
 
+	ret = gmac->data->init_resources(pdev, gmac);
+	if (ret)
+		return ret;
+
 	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
-	/* BSP disables it */
-	plat_dat->flags |= STMMAC_FLAG_SPH_DISABLE;
+	plat_dat->flags |= gmac->data->flags;
 	plat_dat->host_dma_width = 32;
 
-	ret = sun55i_gmac200_set_syscon(dev, plat_dat);
+	ret = sun55i_gmac200_setup(dev, plat_dat, gmac);
 	if (ret)
 		return ret;
 
@@ -138,8 +171,15 @@ static int sun55i_gmac200_probe(struct platform_device *pdev)
 	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
 
+static const struct sun55i_gmac_data sun55i_a523_gmac200_data = {
+	.init_resources = sun55i_gmac200_init_resources,
+	.flags = STMMAC_FLAG_SPH_DISABLE,
+	.offset = 0x34,
+};
+
 static const struct of_device_id sun55i_gmac200_match[] = {
-	{ .compatible = "allwinner,sun55i-a523-gmac200" },
+	{ .compatible = "allwinner,sun55i-a523-gmac200",
+	  .data = &sun55i_a523_gmac200_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun55i_gmac200_match);

-- 
2.53.0


