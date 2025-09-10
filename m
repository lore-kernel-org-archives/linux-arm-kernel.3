Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D306CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 08:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CdoEjc5e7kQwXoL1Cm6IjPM2seG7Imvb9wLqalhk7Jo=; b=B7JYbRpGC2PXToKO5TraKCCKHj
	/mjj+s8QTnjwDnPzO3663ULOBswfnSCexCYcwI6kQx4JpQMzSCRAjh/XeMg0mx7rQgxkDjYZCXpxi
	V3U1ZM4qkCwBkLofuSP5tXYodc/w572u93zBJQJsvxExQ7HlnYxlTp53syZQZ01N/5ia/TfO15XZF
	qy2YAJOoULsscul5lVdJS0b66VWkc5iFh2UmLz1To/gt0fQsR2XOMpYk3J3/YVtg0R84Bc44w57fb
	hTP85ccwwoYEz5/qwQub89MlH/JxUMCXP6/vQ73SxoaLBUW+7S+7r/qJbgX1u5FKdn/2HN/iF7tE2
	nQ5Ta/3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFsB-0000000CnKm-2M6z;
	Wed, 10 Sep 2025 08:08:11 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFs5-0000000CnEG-44qm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 08:08:07 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-45df7cb7f6bso2441635e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 01:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757491684; x=1758096484; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CdoEjc5e7kQwXoL1Cm6IjPM2seG7Imvb9wLqalhk7Jo=;
        b=UPUvCiW+3p53Rp9lw68+63rEpY+Dcqi0QEr3eSuSyKMvrfoMVX5X8dltVE5hqMfF7Q
         Hu9CDcvlTzx2W3v3zshbZNM3akWS4q7Nm3TLOPRLx2/NHKW2LC9dDiC2iXQKE+JkyvUB
         S/+Q7zULQcbZU3KL/DoXEq8gcbrR7A+kXqRlVHSNL12+Fg+gD/4FiWNCDYwOgLVON3a1
         46nIlun15yK+L6kvni1J9xUgq/E5/P0jplcnCoCrCwkmXzU2yRKxSyG1H8v8tefeVe09
         7MYtPi8Jbjkh7rtrQKyHBgKjUh1MuMkWK55wRTjAFi6tZA4jp8BeGRpP98zaTyIdp1vP
         lDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757491684; x=1758096484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CdoEjc5e7kQwXoL1Cm6IjPM2seG7Imvb9wLqalhk7Jo=;
        b=lMNMvkBlxdHyyncd0y9xO5634HEdG9qxXsJjAZfqpNmd9VNv3jmIwh3yMv/3ydD/tb
         Yoq5cxWYJURC3PNvhvQkyNaSP0SbyHX2Lf2NHOgON9mkXoQLX+LsC5rUvJgSd5x+veBl
         RwbD7NO4CfKJYseWEfDExwV2IRTRZ+pSyazf3/v+TSzcQtzpThx12Bf64p7nQ4p9t3s2
         CS2nUVxDcKs537JUOJ2jqpAYRvEQ4Aw/eoGJa+fewxeXIFXTLVoyKo7EGfG3k4qcDZfc
         UazA3m5ymFYQdubUYbCHUfyJS8/P5N4EQJT8lOm5XukaGvkXrTMtzfaNwCcvZAV8/W7b
         Ltng==
X-Forwarded-Encrypted: i=1; AJvYcCWXO9D4VFetp7JvhZhlIn5cdKxMX0bQFqyoIjJDgz2bkZnt44QEOjTVp6CFfKW7yrVbF5Gq0G9+vZUTS0lOl4tx@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ0y0dUXLhMUa5k8uMv9GbwU+dZKYUVfvnGstSv6iCePeAopb5
	Q6a5NRbx5V+UqSeYIjq2bH8dQHXQFqx+lvRzwxxF9FRUAlsjAwhcI3ftuCipRVqyKfM=
X-Gm-Gg: ASbGncuax1zczoYPUdfKgbBixCs6TUMQyHm2ojEvh89/IU22/CUYvQKBDCR/LS6nUvm
	P6jsTUeOgkBQ6qApeo79K/HyF4/jYGiZ/v6Wa5rxvLImshm5y5gUifApz/L4zEE+KGy4IGX1q7h
	z1WUUR1lxfBTGCGqOE5hRzrnE57dFsZlcXX5OO0uAevkl7xNkyOMrAxnefZ4kKKlpbFSJbPzl1H
	s9CHmMNRxATqhwh7pUpelkdviuLTrEAvcPqRhl+2rVI1ag7MityqA2RyHREHIxuRhKbZ18UbtmG
	TR6LEEQgY457lSQE0Czam/mwjGje/UV+NtTufCLkfERaQL6Lpy2cHONzLcI7NmfUchQidWoMphD
	WKUhjl6sas1fqyrC06w==
X-Google-Smtp-Source: AGHT+IGvVc5t4v/zXXj3XSOg9VlCKaRjy8RNapwWMKX626xKKo9LfhELM3jW9IkDumPkK7A4e7csLA==
X-Received: by 2002:a05:600c:1f11:b0:45d:db2a:ce4a with SMTP id 5b1f17b1804b1-45de07ee7b3mr127598945e9.9.1757491684304;
        Wed, 10 Sep 2025 01:08:04 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df8247cc6sm17813605e9.12.2025.09.10.01.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 01:08:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 10:07:45 +0200
Subject: [PATCH 8/9] net: stmmac: qcom-ethqos: define a callback for
 setting the serdes speed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-qcom-sa8255p-emac-v1-8-32a79cf1e668@linaro.org>
References: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
In-Reply-To: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1914;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=xmsTTIN+xNt0moiTieLp775A3Rxh60igauD1SnixUA4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowTHO6EyrLNmJZzntjQ+QxktZHKsf8HIE32fP3
 DKzaOXZ/t2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMExzgAKCRARpy6gFHHX
 cjAhD/9mxAdGPfan6KTr7LSNd95YNC9Xhm8DikmzNJETYy9C99YxJGy+fco1O7O6JQB/NB2yyqj
 b8H7YlXOcHEWEpajLXslZcKO+MGrldGf+4YySTKrgVI0eJfC2tiKU72AgyWVX8mTvzbCYd/QE1B
 Q/q6VX+d5LcP83v7vJMP+qvyJCEc9zm/AGrV1v67wekYIh0jN+i9PITEBqqCqdHyNeEmhtxXDbH
 BrPBe/0Q7vQH4t0YCui0PB67K2J7bTu2TE3be8u3eJQ+AyDXkQIMGNxfmZ7/SHhPk8ISPRarx6P
 3A/7hoe2nFnpq78Jtda4OWOzSxizgWCwylVbcGAY6N6B1bFwxBkmu3xFk4yvXeO5YueTq7XFbc7
 /SsCnTdkkNI/qwMHtzRaF1aqEy4A8gqomnxkO/icK9cUAGKtvyI4JbAfp9DzrkTsfAkZF6C9Fg0
 yqbqHPKHpiecBRW4GDJZl4YiqP/IA+wPY/D7Pj4VJjpdfID0XsnGAOgonVEzjPxwoPm4C2iKk1W
 Q/P8QkqnnazoP08VI0ZR/oUhxONVStSbiCTJ2IOvWcUYSUfm6/2lJeAvxvQ4l7aQfjFi0mTbUok
 mGTyi/ZSo1b+kDIJ9Swlrh8hlqVaEirtfRm1fTTz0L0md52Fn65DO4rIbsFEm83rxn1oWUZ8KJJ
 dA/04HfQrhChqmA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_010806_628779_C2A40E9B 
X-CRM114-Status: GOOD (  13.98  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Ahead of adding support for firmware driven power management, let's
allow different ways of setting the PHY speed. To that end create a
callback with a single implementation for now, that will be extended
later.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 1fec3aa62f0f01b29cdbc4a5887dbaa0c3c60fcd..2a6136a663268ed40f99b47c9f0694f30053b94a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -125,6 +125,7 @@ struct qcom_ethqos {
 	struct ethqos_emac_pm_ctx pm;
 	phy_interface_t phy_mode;
 	int serdes_speed;
+	int (*set_serdes_speed)(struct qcom_ethqos *ethqos);
 
 	const struct ethqos_emac_por *por;
 	unsigned int num_por;
@@ -646,11 +647,16 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 	return 0;
 }
 
+static int ethqos_set_serdes_speed_phy(struct qcom_ethqos *ethqos)
+{
+	return phy_set_speed(ethqos->pm.serdes_phy, ethqos->serdes_speed);
+}
+
 static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
 {
 	if (ethqos->serdes_speed != speed) {
-		phy_set_speed(ethqos->pm.serdes_phy, speed);
 		ethqos->serdes_speed = speed;
+		ethqos->set_serdes_speed(ethqos);
 	}
 }
 
@@ -881,6 +887,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
 				     "Failed to get serdes phy\n");
 
+	ethqos->set_serdes_speed = ethqos_set_serdes_speed_phy;
 	ethqos->serdes_speed = SPEED_1000;
 	ethqos_update_link_clk(ethqos, SPEED_1000);
 	ethqos_set_func_clk_en(ethqos);

-- 
2.48.1


