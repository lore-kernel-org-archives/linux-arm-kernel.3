Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB0CCDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 08:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ebJKu9jVn6lf143JvVHMNKq41KUqWP0vuZLPZ5+CqQ4=; b=tNjCWgVdB1ZkZvXn7vLSSBkAFG
	TgrTIO1fFYJVdCIWtPVWX5P9YilDdGjUjwpMuy7g/QmJpaIQH4IUY2C9/ZA76QhkAGajnTcwcSY4w
	UrehgUSG3zm0YUvPRaXJWfBWuC7Mq0tQtLk8DHjq275SJkS5y70z8fgZTle+9SiBb3+bOsa6HVgng
	cQAAM4nHHY5yoYBaoJmNQt/8fFfs+HILOZNYJC1fkxfwAS4pSs484PBTr6XJjToN56HOiqpiaB/9g
	zfmiecpEhAZ8IeV0QPmzrxmrds61KZR3z2M2pPSJ0s83dqgjumlUYb3ToVoj7s9RlDid2iI/3XEpS
	6YKSN27g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJGJ-00000007QF3-1Fya;
	Wed, 24 Jun 2026 08:47:11 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJGD-00000007QB1-16yV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 08:47:09 +0000
Received: by mail-pj1-x1044.google.com with SMTP id 98e67ed59e1d1-37cab825ec9so608550a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 01:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782290825; x=1782895625; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ebJKu9jVn6lf143JvVHMNKq41KUqWP0vuZLPZ5+CqQ4=;
        b=hqoXTRIiper3NAnBqZeQC7HyJy0X7Wf7oXJVe9olKxmuEoLnKZJiI2OnWy2+9aGPCd
         8WSekLbm+Qxe0OcbyZWJhrF2qvcFQ2nsbPNKKAB+nKYxFLjOWaY2P6wMFIb9S4ffpV+W
         VOmPegH4OglXyX9lcYrxy7ACqTXFVneQWLaLGXjuTLO9zJq9sr/apu+B9r6y/mGh9FAu
         uLlCDsrZVKPELZ35EOuvXchbE4lX1KuQN4g45lBIa3C+db8BgpRTFWtFjr9LbjfzqnEG
         8WzzlqYGeukQ8swoWOIGXsrm0LFHX214vlvW+/79/k8C760vU1+ttiCvhCJEDL3XDB+8
         y0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782290825; x=1782895625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ebJKu9jVn6lf143JvVHMNKq41KUqWP0vuZLPZ5+CqQ4=;
        b=akRvrSswIso+igefPnBXK5BSHGvNOwySiB4c7EIXxZacj0rGrV7tCy7pEre6EMaooa
         NMJXD167z16c6PMZ9aHwPyWQm7TZNer19rAmAGKoXa7a+cuXOXvc+n2qm6+2kgpmVID+
         EnL550qC3+daxOBDEuQsrvXzAmv6rowdt/MzG21dy7tMtzDf1ncLIBCV8JvanRA/IACB
         iA08TsWN/vnDEAH04B14xFDs2lrPIpV4fPP6JkswB9KXAhZroo7cwNBnS7MZd57rCYJD
         10tzOWtuuFjAqnWRcv3oTp8GqrdvLS9We788TR2fxiI8KmakSswopOdEOnUNAD8mRi2M
         PIKw==
X-Forwarded-Encrypted: i=1; AHgh+RrT121Hj1ZnjgwIwMZ+4l34LE+t9/SDNf5FBIWuHacdQSgRteG86SKv1/UvvzVRGibvw1zFZyximEDKw845LarE@lists.infradead.org
X-Gm-Message-State: AOJu0YwFUmqN5wAKU64TeoCt0jL7n2m+ctYZeKERjPAQHsxZx/RooGk3
	XTgzQlmiYlqRS7ZaBdc4ZsVNIEelWTBSWY0Og7pQ0YovwRAjo9PDiw2V
X-Gm-Gg: AfdE7cmodfV2GRWNi1Sj0RjK7DkLVdDXkVP5grf0qht2HKGOU3DLIRb13RscgaBxoxi
	ogx9v8iJ3B4e2fkgAa/xGwpD9++wMvRDRNN7F/0EgPZtoCuhvvsSLuA4dmeAtVdYsxO/Lat1MNB
	k6pFQ7LkTXbxv7iYufBk4FWUfGvdsSSYT8z+Zxydhp4k0IFHh05cXbSzakekJiED4FG05T3hqQw
	pLQb422K7dP8eRuMa9qdhsq8PKWtG48JE1XadqyaViuyWKLZ1av8hDB5UFw0Aq55uDtkYzzFKAJ
	l3/sXFbDwuuwnXG1Kjlk4QrTODlW+gZV/9ugBTJdVYJBs9fZLfeEwA8sT7gnrH2P5kX7G6vnVXt
	TWHRYDZWCxbUXkd+/VKCGEKKSUl8FIppgyGfdZnlrKVYY9s/2ktQWEihAiyld8rL+4URXZRXUDp
	vjUImGP+udzAgrIt9yAISz9SyhYW+iOS8y9qo=
X-Received: by 2002:a17:90b:3904:b0:36a:f612:e6a3 with SMTP id 98e67ed59e1d1-37de46877cfmr2475296a91.17.1782290824660;
        Wed, 24 Jun 2026 01:47:04 -0700 (PDT)
Received: from [192.168.1.101] ([218.194.36.79])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37de3d152f4sm2138146a91.14.2026.06.24.01.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 01:47:04 -0700 (PDT)
From: Yanan He <grumpycat921013@gmail.com>
Date: Wed, 24 Jun 2026 16:44:41 +0800
Subject: [PATCH 4/7] net: stmmac: dwmac-rk: Enable refout clock for RGMII
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-rv1126-alientek-dlrv1126-v1-4-5aef608a3f64@gmail.com>
References: <20260624-rv1126-alientek-dlrv1126-v1-0-5aef608a3f64@gmail.com>
In-Reply-To: <20260624-rv1126-alientek-dlrv1126-v1-0-5aef608a3f64@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 David Wu <david.wu@rock-chips.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Yanan He <grumpycat921013@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782290789; l=1756;
 i=grumpycat921013@gmail.com; s=20260618; h=from:subject:message-id;
 bh=hGja04LjVLdEUpRMeYni1ttZeCHW7DBtTY1DVjPxwic=;
 b=aI+crboHR6Sc2cp1Nzvxr/IYTjV+SylvGPnYmATX+BdMMDrUePA2j4BHkJb8G4YNpQKcqGWmi
 5Vg6IPb+CuWCLswJq8rvutIrZNwt98EZslHleACcj/eXxIM6e1/OxLq
X-Developer-Key: i=grumpycat921013@gmail.com; a=ed25519;
 pk=oWrY8KwXIunZWlYBV76NG2A3V4p1bJ+aD45Mr56ErTw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_014705_330571_760DD5A6 
X-CRM114-Status: GOOD (  13.88  )
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

Some Rockchip GMAC integrations use clk_mac_refout as an external PHY
reference clock even when the MAC is configured for RGMII.

RV1126 boards can route CLK_GMAC_ETHERNET_OUT to the external PHY as a
25 MHz reference clock. If the driver does not acquire and enable this
clock in RGMII mode, the common clock framework may disable it as unused
and the PHY can lose its reference clock.

Enable the refout clock handling for RGMII in addition to RMII.

Signed-off-by: Yanan He <grumpycat921013@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 8d7042e68926..f6fdc0c5b475 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1112,7 +1112,8 @@ static int rk_gmac_clk_init(struct plat_stmmacenet_data *plat)
 	bsp_priv->clk_enabled = false;
 
 	bsp_priv->num_clks = ARRAY_SIZE(rk_clocks);
-	if (phy_iface == PHY_INTERFACE_MODE_RMII)
+	if (phy_iface == PHY_INTERFACE_MODE_RMII ||
+	    phy_iface == PHY_INTERFACE_MODE_RGMII)
 		bsp_priv->num_clks += ARRAY_SIZE(rk_rmii_clocks);
 
 	bsp_priv->clks = devm_kcalloc(dev, bsp_priv->num_clks,
@@ -1123,7 +1124,8 @@ static int rk_gmac_clk_init(struct plat_stmmacenet_data *plat)
 	for (i = 0; i < ARRAY_SIZE(rk_clocks); i++)
 		bsp_priv->clks[i].id = rk_clocks[i];
 
-	if (phy_iface == PHY_INTERFACE_MODE_RMII) {
+	if (phy_iface == PHY_INTERFACE_MODE_RMII ||
+	    phy_iface == PHY_INTERFACE_MODE_RGMII) {
 		for (j = 0; j < ARRAY_SIZE(rk_rmii_clocks); j++)
 			bsp_priv->clks[i++].id = rk_rmii_clocks[j];
 	}

-- 
2.54.0


