Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A4ED35699
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 09:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QJdrgI0gtiqZZNbRhdCivzcmuLMzMB0vNSWzU58rH+A=; b=H6oNuZtS9/UM8DLZBhXG5OJMIy
	4OxI4wqZBpe9i74a2FT+GB29SCu70inwgejQfIdaEAbGwkgRIPpstymQO5u/CjwIaYs5/rxKRu8LP
	cRe7cRkMcMPynZ7i0zNnjuL/xCCemphFJjTHlBl/V+zalFH3SjT5wFbbSWMYlj5j3L9T6Bo5QBswL
	m9rgO6xNuop1qgJxvbMcIy9Ctwf4e0oZYzClYPdKgSn91EWTeKcAqtEGeYSRCGklZpVG2/uHiqKFA
	KK5WleG2aeBUnWMfURojCt3ffR1Pf7bH/ximT6oDYuS2JRWUhoFJr1txuNguLO3hwC4E7u6o3gADz
	OW6virfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2Gn-0000000Fms1-2ANu;
	Wed, 28 Jan 2026 09:55:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2Gb-0000000FmlZ-3aeQ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 28 Jan 2026 09:55:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=QJdrgI0gtiqZZNbRhdCivzcmuLMzMB0vNSWzU58rH+A=; b=aaNIPxCHEoMHvxrQKkYoH0uY9m
	NFGq46m2W4WIeMYU7s0R9PxN901wzZJ5rm6EsD9HC5APXFXIbO0OinsvOqpFRS7vlRcsJ7MpG+Yxs
	He7R4IL28gb7r8WMH907x27xHopMsXKUKJa+YD0UGggzTl9YmsxS11DHRAu5mEYuC0Kd4gTCVNB/q
	svqE3mZAMPjcJOEBfF60m4BGbG53wYVBGi41DnwKwPE17xEjGXckhdjwxGVVLCVujQgRfN/sYqaDc
	22YV6RwXITNwm4d5NxB+Zys3aZqKoELB3VY8uiPrsfm8dIyrepjcjMZRPzd8pEbIwhuz+3RTtDzLi
	VxD0Aw9A==;
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2GX-00000008GQW-3Fgi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 09:55:15 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-59dd4b602bfso8509750e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 01:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769594111; x=1770198911; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QJdrgI0gtiqZZNbRhdCivzcmuLMzMB0vNSWzU58rH+A=;
        b=mxgllxQwaJ9RdYVg4Ep1xLbG76FiUE8BHK1/bBkBlx6KYh61jglpMLPTmHry0YHKc1
         tXRRFFKC2S/ChvMd9lJyMen9lhBLcwfn9GKTgcmWKohcZDA095EcgFjjUk/ZJ/tUBZBD
         Pu7QOt0kZjdo3rOBHf66fYXC8+vVJCwZOB5DjIoVxyq4qnYEMbKzX/O9csh8PlzG9Ces
         g9xbu7oKEcFHUzjrEhiv+tCtn85fRDmc8HPu2o3UaL4bR3sCe7rdEK8ceH84p/ofEEdB
         KK1WwVbn7mTdTsRKHXxFiQOPhmaMlWwxCCbtVE6PLMmhrOpBqOJkA1E/xWKHEq8/FWV9
         IIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769594111; x=1770198911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QJdrgI0gtiqZZNbRhdCivzcmuLMzMB0vNSWzU58rH+A=;
        b=TbFGfsezs8vVi3xA7/yivFQjTaxIK0tA8MbIzfVT4fVhDBhiG741ytFBleIO1TMRqG
         OWVkAJwrpHb/89+HvqpivhhOIgcdmxRxPGA426LwCWWhtLlTvfJ7zwo110BvAhjI6d1I
         oh5uVVCrQaHxNcftziz3pHJM5O4wbqJCLF+M+H0NYQi5dgAvNFTwgCOEOCHIifdPW7cN
         veT1Kt2zHiRqg4Cjk1Gre0G9UAHDP3nxrYEMiMXqJqQRxbTcG6nQSjhcXL60cHnaBLl5
         yt2ZoIKFZIZE0Vo3SnEgIvRfCvZ9x3q88blxwlAxpseQyXxwmabNOucNp6jNu9Vx/ZbZ
         ek6w==
X-Forwarded-Encrypted: i=1; AJvYcCVhofqEOBbUgRTrDqRPF4C0iIUGfOhU5+PiJu6yAVRijRbYhQ3QO3yBPUl6bUR98eHZ578ORBHTlIH/2PyrAF2u@lists.infradead.org
X-Gm-Message-State: AOJu0Yycv63qUq/VbfSxfsdtIGYnSZNJEHPCL9OwGfIYiJlzlezSXQlC
	CPCbfW9dlDpFPJOw2PzGTi8KjqiBJ9bmrEiJ2djyFqG3wJfetbe2lvGO
X-Gm-Gg: AZuq6aJOR9NA4lBDO2Jzp+w0N5NAjLc1/8pSlNBpS/ZnTxSuzblYhfY/poTvbUbtfb4
	+zm5TcUK1vdO0llDw8DbZgtho7WCcGtln38dwLpHJyy1QXDapdqoWIQlJHfEJtzdIkYQzjEt4ak
	M27EL/YJwBkVwpTdyDdhH44PeWwuU0nlXaSYxk0cicbKExb9mD2Ph2qPB1rlf1Z3GxxRRM8ZDQq
	lVPnVazHsarOlM1XQGJ5e/ZUz3Fa4lCoeObm+iSdnhUKCk2i+i9EpCyb5Cle7oRozWUU+F73d8J
	1K7VyQRm00GaC+Za6K6UZjv0mjDeKroE/Z4ZcYIbLqEYN8RdDeFglc6sUByL8hlAwHTD1Url6+K
	W99BJIZbmBkERB+D4r0r1zKXF/d72Xmckcb1v6DM00SCrRRG1/6RpxdtPlf/lb0kj3nt3zarhSk
	2B7SBEU6qgFxWFS22sSi4r7HaBEo6z/GG/Nbr9+Q/M47DmxXcZT7dOhMGW
X-Received: by 2002:a05:6512:3e27:b0:59d:e954:1908 with SMTP id 2adb3069b0e04-59e0412db34mr2132085e87.51.1769594110691;
        Wed, 28 Jan 2026 01:55:10 -0800 (PST)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074bfe83sm459483e87.97.2026.01.28.01.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 01:55:09 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 28 Jan 2026 10:54:30 +0100
Subject: [PATCH v4 4/5] i2c: davinci: add support for setting bus frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-i2c-mux-v4-4-dee49ce276c0@gmail.com>
References: <20260128-i2c-mux-v4-0-dee49ce276c0@gmail.com>
In-Reply-To: <20260128-i2c-mux-v4-0-dee49ce276c0@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1624;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=32tpqgfedy/sxp2AZTtYj6G+OqEGB6zW9YyBBWylfYU=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpedzyZidWVC8WFnAehdPL8hDSbJvc6l5n5RsrY
 Rwu5wFkpYKJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaXnc8gAKCRCIgE5vWV1S
 MsF2D/4ycjuzoTTAKCcdpurYUQEmolVE3xElDDxTgrp+COyg6IN/nX3Q8eUfdj5RwRTURcRiq86
 wamt1pt2hRiUr8Z4vNSS6zdl3jom1GKW+TPuCfhftdjgi/ykEBMhk+Ajm3pL1H3LzRyIm0Hihqr
 CddCtl4w0H06j8pcgYUgwylUoLqoCrLor9TEbCj2JNgDFpKxqSStyCmGZfpRF4dTPItUqh9oVzA
 2/K2F9FU4C3ncSfX10f/mYBbow0rsgwlh6G/OIagu94uA06BokctdIO++00nF8AWJZE11FJf30c
 spDPhucw+AMRfwR1QOoVUbdIIbrNdIXkftfdkOo/tnh7vEkxEMO3OuzHdzNFp0K+krA/gL39RaO
 DbJ8mQ/mjEdDOSg2anqVJTZhMKTA4kYU22SjDSRTTgFu+2+lz1DWKOfKtoDlnPt+ruyC9WALG2Y
 iRhWZ/yyhYhWnVEjuNBV6MGc8KP3ILYBF8/qMI9oyJCHSSeFzs97iHJFlLd60hnWgSMfus6joGU
 ZLDSRDEjW0iY1BxJmEZBolSMLSjOSR7WqCKFUqwRbzbMCw3oNeo1Dtn77W2MdjxDh6Mg4LTYCJ1
 oC4PuIK6y5NE+CJnHMkmbMSYLavl7MhBTr4NePIgB4Qy5ZgIG58yYm1EgIH/DjxxPEA9UwjzqIY
 nCYCJi9nUXPteXA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_095513_970494_068C625F 
X-CRM114-Status: GOOD (  13.80  )
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

Populate adapter with clock_hz and set_clk_freq to enable support for
dynamic bus frequency.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/i2c/busses/i2c-davinci.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index 761de5a814df..3daa823dcb9e 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -279,6 +279,27 @@ static int i2c_davinci_init(struct davinci_i2c_dev *dev)
 	return 0;
 }
 
+static int davinci_i2c_set_clk(struct i2c_adapter *adap, u32 clock_hz)
+{
+	struct davinci_i2c_dev *dev = i2c_get_adapdata(adap);
+
+	if (dev->bus_freq_hz == clock_hz)
+		return 0;
+
+	dev->bus_freq_hz = clock_hz;
+
+	/* put I2C into reset */
+	davinci_i2c_reset_ctrl(dev, 0);
+
+	/* compute clock dividers */
+	i2c_davinci_calc_clk_dividers(dev);
+
+	/* Take the I2C module out of reset: */
+	davinci_i2c_reset_ctrl(dev, 1);
+
+	return 0;
+}
+
 /*
  * This routine does i2c bus recovery by using i2c_generic_scl_recovery
  * which is provided by I2C Bus recovery infrastructure.
@@ -809,6 +830,8 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 	adap->dev.parent = &pdev->dev;
 	adap->timeout = DAVINCI_I2C_TIMEOUT;
 	adap->dev.of_node = dev_of_node(&pdev->dev);
+	adap->clock_hz = dev->bus_freq_hz;
+	adap->set_clk_freq = davinci_i2c_set_clk;
 
 	if (dev->has_pfunc)
 		adap->bus_recovery_info = &davinci_i2c_scl_recovery_info;

-- 
2.52.0


