Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD88DC61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 20:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vek3l8Nm6PYSR+a+p5WH1tFEh9m7ZoSbhoGF7zP/muM=; b=0+5yyDNajC4gsRE4gjZupFHKO3
	2jRYxgIU5kk2yfP6Wfj/IBrsfXVl6xz6FkJLYXUJvKVUK3Y+ulzRQffK5BWrigaAie8Je9gemtK4F
	I4AKaBlxG994Eu313aXsiiaE3pCtJKbV1LU/CYUqXR6yBkhoYrPCTmEPgsfnc5KjSEsgBiG5IQYwJ
	yW/dcvMgHpgNvi+pIOu+xVVV8E3104qUw9fXybmv/TW2+3SW3hBUnKzB7giq5Ff1QvVCSpe5H/n0t
	UrTdSKUkyM8BrtGOSw6L2Ssr45FVzHzZNrjEIQ9L2DjuX8aO2d/P92Th2NGPY9Mz9HTu5w68ufhDF
	4VdjuFDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP5BV-00000007zqJ-3Lji;
	Tue, 10 Jun 2025 20:03:01 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1yR-00000007UhH-3KA3;
	Tue, 10 Jun 2025 16:37:20 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-48d71b77cc0so69296021cf.1;
        Tue, 10 Jun 2025 09:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749573438; x=1750178238; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vek3l8Nm6PYSR+a+p5WH1tFEh9m7ZoSbhoGF7zP/muM=;
        b=QNf1RWfpbOHwadzhjhY050PwQv0/v/sYtlMBTUDsnkjTfA019pDf6+0FLmNlzEDyW8
         5xsBTqiME1G6cFTXFKzh9D++ODKrGwL3iq5S+rcKJh3PLe4ooukJU24pLlkdIdmnTusv
         rGPCZqh/ewOJjGioWqkv48cHtewgZd58I3FtogNZFRviYX4FMyeItbE28wJC9FTtkOG4
         4N5351JF27XpNb1pMt97sxUgV66ELFbnPpwtciVKaPfUWh83HZl5vv3SmEFQbv17T1TZ
         cXqtTpQFSd9FhkkJSrT4n1aIvXHjOxUiFLXLGIfXTqBg9UiR/Jfo7OjDlKqRrsR27xco
         NRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749573438; x=1750178238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vek3l8Nm6PYSR+a+p5WH1tFEh9m7ZoSbhoGF7zP/muM=;
        b=U5HkcjpByUQiabvdndzBxLWYyu5QAEwIpZK5EFJQs8pGKnHCIUaUgV5yU6b32zqVkr
         45nBsXcVMtgeIpXPQRjSADlR0ZQAA4eO+eCQdL5AuzB6WaovNqcB4apmHDghjxPOhiCL
         A6ehtiONObu2dBZaD/+tL3nRNcgxEPHVorQ9ZMIOiIC6hzxlw3FjIZs6ue+Lq0+AWelD
         Gn+I8+HWbR4AAmzIZ1h5XHACTRLMMEVFFrsI+MB245RjLFzsGrdWECneTOOowU6LV7no
         YM6StsLHktL2j//yYuNHmX0TZWk9Y4gjjXzX4qHaE7jUTl4ilYWP4dGl+qbxCsnBgNvZ
         3jIQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0vyE2gCcV/JhVFKVWS3uaMeiMgGncH5UL+27wJOAJvQkxJ7wf9RPnMQka7Jch0XSJO9jECyW6dcHN3grfrfE2@lists.infradead.org
X-Gm-Message-State: AOJu0YyTD64SkujCQgkgTIqx+9+dR/ZATYTLg91jlGb8pLBx9L3srfEa
	LUVFl2Ipb+SLh6JKByZMuXxKWzhUS4tyq6yUXfW3Xk66EdFHU/Jc9sM7XVpV8umM
X-Gm-Gg: ASbGncui3s3luN2bnqcFjJ/Z4PE5pyWNXfVnY8tOI2q7Swixn2acu+EIAcXQPEtLGZ3
	RLu2nixHpqtXoCH+ep0GKfvO0k6PHudKmmX6JvULWaJ91zunbAGV0BecS6mcaredeeZCWZ96ODo
	OtLVAfETKol85Bqk7Z0wIIPxq82MgVcooK7m6/Cber4snPA6prXuKjuLb/6jL0MiluVlBnxfxhq
	L/am8me42YvMFDtEt+bGgXOT4fhzCTG26s4sOI67ciOH/WqxZ8Zl01z59+W/MGFgWpyz1W2wroV
	pdQFlR+n2RnjF7QNcMRxpTHzORqK8zLOAdpv66vx8y3AzFsAmA==
X-Google-Smtp-Source: AGHT+IHGaxxovrv2vFOeyWwXKXC8AtzwIvEB5fpx3Rxey4/mgeB4i4LmRr6mNTejwPat0j2MR0ppkg==
X-Received: by 2002:a05:620a:4513:b0:7d2:2833:6dff with SMTP id af79cd13be357-7d3a888df03mr7490585a.26.1749573438459;
        Tue, 10 Jun 2025 09:37:18 -0700 (PDT)
Received: from geday ([2804:7f2:800b:5a56::dead:c001])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87eeaf97af8sm1488235241.33.2025.06.10.09.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:37:18 -0700 (PDT)
Date: Tue, 10 Jun 2025 13:37:12 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Hugh Cole-Baker <sigmaris@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 1/2] PCI: rockchip-host: Retry link training on
 failure without PERST#
Message-ID: <810f533e9e8f6844df2f9f2eda28fdbeb11db05e.1749572238.git.geraldogabriel@gmail.com>
References: <cover.1749572238.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1749572238.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_093719_837978_4FC6F737 
X-CRM114-Status: GOOD (  19.79  )
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

After almost 30 days of battling with RK3399 buggy PCIe on my Rock Pi
N10 through trial-and-error debugging, I finally got positive results
with enumeration on the PCI bus for both a Realtek 8111E NIC and a
Samsung PM981a SSD.

The NIC was connected to a M.2->PCIe x4 riser card and it would get
stuck on Polling.Compliance, without breaking electrical idle on the
Host RX side. The Samsung PM981a SSD is directly connected to M.2
connector and that SSD is known to be quirky (OEM... no support)
and non-functional on the RK3399 platform.

The Samsung SSD was even worse than the NIC - it would get stuck on
Detect.Active like a bricked card, even though it was fully functional
via USB adapter.

It seems both devices benefit from retrying Link Training if - big if
here - PERST# is not toggled during retry.

For retry to work, flow must be exactly as handled by present patch,
that is, we must cut 3.3V power, disable the clocks, then re-enable
both clocks and power regulator and go through initialization
without touching PERST#. Then quirky devices are able to sucessfully
enumerate.

No functional change for already working devices.

Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 drivers/pci/controller/pcie-rockchip-host.c | 141 ++++++++++++--------
 1 file changed, 87 insertions(+), 54 deletions(-)

diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index b9e7a8710cf0..67b3b379d277 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -284,6 +284,53 @@ static void rockchip_pcie_set_power_limit(struct rockchip_pcie *rockchip)
 	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_DCR);
 }
 
+static int rockchip_pcie_set_vpcie(struct rockchip_pcie *rockchip)
+{
+	struct device *dev = rockchip->dev;
+	int err;
+
+	if (!IS_ERR(rockchip->vpcie12v)) {
+		err = regulator_enable(rockchip->vpcie12v);
+		if (err) {
+			dev_err(dev, "fail to enable vpcie12v regulator\n");
+			goto err_out;
+		}
+	}
+
+	if (!IS_ERR(rockchip->vpcie3v3)) {
+		err = regulator_enable(rockchip->vpcie3v3);
+		if (err) {
+			dev_err(dev, "fail to enable vpcie3v3 regulator\n");
+			goto err_disable_12v;
+		}
+	}
+
+	err = regulator_enable(rockchip->vpcie1v8);
+	if (err) {
+		dev_err(dev, "fail to enable vpcie1v8 regulator\n");
+		goto err_disable_3v3;
+	}
+
+	err = regulator_enable(rockchip->vpcie0v9);
+	if (err) {
+		dev_err(dev, "fail to enable vpcie0v9 regulator\n");
+		goto err_disable_1v8;
+	}
+
+	return 0;
+
+err_disable_1v8:
+	regulator_disable(rockchip->vpcie1v8);
+err_disable_3v3:
+	if (!IS_ERR(rockchip->vpcie3v3))
+		regulator_disable(rockchip->vpcie3v3);
+err_disable_12v:
+	if (!IS_ERR(rockchip->vpcie12v))
+		regulator_disable(rockchip->vpcie12v);
+err_out:
+	return err;
+}
+
 /**
  * rockchip_pcie_host_init_port - Initialize hardware
  * @rockchip: PCIe port information
@@ -291,11 +338,14 @@ static void rockchip_pcie_set_power_limit(struct rockchip_pcie *rockchip)
 static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
 {
 	struct device *dev = rockchip->dev;
-	int err, i = MAX_LANE_NUM;
+	int err, i = MAX_LANE_NUM, is_reinit = 0;
 	u32 status;
 
-	gpiod_set_value_cansleep(rockchip->perst_gpio, 0);
+	if (!is_reinit) {
+		gpiod_set_value_cansleep(rockchip->perst_gpio, 0);
+	}
 
+reinit:
 	err = rockchip_pcie_init_port(rockchip);
 	if (err)
 		return err;
@@ -322,16 +372,46 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
 	rockchip_pcie_write(rockchip, PCIE_CLIENT_LINK_TRAIN_ENABLE,
 			    PCIE_CLIENT_CONFIG);
 
-	msleep(PCIE_T_PVPERL_MS);
-	gpiod_set_value_cansleep(rockchip->perst_gpio, 1);
-
-	msleep(PCIE_T_RRS_READY_MS);
+	if (!is_reinit) {
+		msleep(PCIE_T_PVPERL_MS);
+		gpiod_set_value_cansleep(rockchip->perst_gpio, 1);
+		msleep(PCIE_T_RRS_READY_MS);
+	}
 
 	/* 500ms timeout value should be enough for Gen1/2 training */
 	err = readl_poll_timeout(rockchip->apb_base + PCIE_CLIENT_BASIC_STATUS1,
 				 status, PCIE_LINK_UP(status), 20,
 				 500 * USEC_PER_MSEC);
-	if (err) {
+
+	if (err && !is_reinit) {
+		while (i--)
+			phy_power_off(rockchip->phys[i]);
+		i = MAX_LANE_NUM;
+		while (i--)
+			phy_exit(rockchip->phys[i]);
+		i = MAX_LANE_NUM;
+		is_reinit = 1;
+		dev_dbg(dev, "Will reinit PCIe without toggling PERST#");
+		if (!IS_ERR(rockchip->vpcie12v))
+			regulator_disable(rockchip->vpcie12v);
+		if (!IS_ERR(rockchip->vpcie3v3))
+			regulator_disable(rockchip->vpcie3v3);
+		regulator_disable(rockchip->vpcie1v8);
+		regulator_disable(rockchip->vpcie0v9);
+		rockchip_pcie_disable_clocks(rockchip);
+		err = rockchip_pcie_enable_clocks(rockchip);
+		if (err)
+			return err;
+		err = rockchip_pcie_set_vpcie(rockchip);
+		if (err) {
+			dev_err(dev, "failed to set vpcie regulator\n");
+			rockchip_pcie_disable_clocks(rockchip);
+			return err;
+		}
+		goto reinit;
+	}
+
+	else if (err) {
 		dev_err(dev, "PCIe link training gen1 timeout!\n");
 		goto err_power_off_phy;
 	}
@@ -613,53 +693,6 @@ static int rockchip_pcie_parse_host_dt(struct rockchip_pcie *rockchip)
 	return 0;
 }
 
-static int rockchip_pcie_set_vpcie(struct rockchip_pcie *rockchip)
-{
-	struct device *dev = rockchip->dev;
-	int err;
-
-	if (!IS_ERR(rockchip->vpcie12v)) {
-		err = regulator_enable(rockchip->vpcie12v);
-		if (err) {
-			dev_err(dev, "fail to enable vpcie12v regulator\n");
-			goto err_out;
-		}
-	}
-
-	if (!IS_ERR(rockchip->vpcie3v3)) {
-		err = regulator_enable(rockchip->vpcie3v3);
-		if (err) {
-			dev_err(dev, "fail to enable vpcie3v3 regulator\n");
-			goto err_disable_12v;
-		}
-	}
-
-	err = regulator_enable(rockchip->vpcie1v8);
-	if (err) {
-		dev_err(dev, "fail to enable vpcie1v8 regulator\n");
-		goto err_disable_3v3;
-	}
-
-	err = regulator_enable(rockchip->vpcie0v9);
-	if (err) {
-		dev_err(dev, "fail to enable vpcie0v9 regulator\n");
-		goto err_disable_1v8;
-	}
-
-	return 0;
-
-err_disable_1v8:
-	regulator_disable(rockchip->vpcie1v8);
-err_disable_3v3:
-	if (!IS_ERR(rockchip->vpcie3v3))
-		regulator_disable(rockchip->vpcie3v3);
-err_disable_12v:
-	if (!IS_ERR(rockchip->vpcie12v))
-		regulator_disable(rockchip->vpcie12v);
-err_out:
-	return err;
-}
-
 static void rockchip_pcie_enable_interrupts(struct rockchip_pcie *rockchip)
 {
 	rockchip_pcie_write(rockchip, (PCIE_CLIENT_INT_CLI << 16) &
-- 
2.49.0


