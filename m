Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89836C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 05:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fkDHET87UFExhpdvkNx3ant78q307rzdUT3zfbIoItk=; b=nk7vsfnEuvCf/QxaskTbHyLw+f
	0kPYVh4u+iresCPLR0VTVJECPUt0C31czKaLb7IvyKBJdH5H8B9MChJTEfReVpsc4bn7NiUy8ZDjV
	PrkEEyiU29LfhqS1pgfUYBhwo6f6Ss76ffs5NJ+9YEsmzhly7/JClIIsZlQU+apJ8v1ewZiHOcVTk
	08sL2wYeJMlXfi/8IqYxI1Nz2dtiZo5Iy56I6Gplqv5R1RI03Oi0wSVV4P4VT421d3JRw+D1zw0xg
	PD+RQ56CIKUYBr6spNijJbNCZFLh7gNELhbgGjZzNT+8wWkEyvalTDs1uFqKukFpL/JMurmUFkw9N
	D9WhKLzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wql1T-0000000GKg2-1y1t;
	Mon, 03 Aug 2026 05:15:35 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wql1P-0000000GKXv-0dzH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 05:15:32 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-7e9ef94c0e2so1586111a34.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 22:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734130; x=1786338930; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fkDHET87UFExhpdvkNx3ant78q307rzdUT3zfbIoItk=;
        b=jNmjQ4F+0XIJqF5zD1DtRTdUDA8wYr7NQ3UKOMqGi4vza/BN7X6MEkazO2sKlx5JaD
         xKP+428E2KLcSqyGKDCWWNLZ/Bb5CNgMOQa/D6ROLG1P9zVUxBAXYZcXukXiBHKSErgp
         ncsO+02xSX2goe5MnyC5ySbag/UzcUTUUQGKo4gMAGTI+IZl3iZWF+SuM+qptAzOxvv+
         hDjdMKZtYqNKSOfI21Q349wLuTmVr5xPll51MKDgOiHGeeUSp8k36/KUpHuzaUSxx2Q3
         dL+IJxpfYvstiiQpX0MWrGA6s+nU5jxXsb+gnWx8fLyDuZ+bKpkHzcNc7em0jCvenZNx
         fFFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734130; x=1786338930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fkDHET87UFExhpdvkNx3ant78q307rzdUT3zfbIoItk=;
        b=cw/t6/NRdi53fUAeffCIdeCDC0bMgJvAIsjgE8f5dpc1Lt8/X8abzoPi5sUf0RMcsf
         lhjZQdvpsXTT/xBgkVFz66BxwvMWb0dBMLitSh20wgrRlul7NKJOKb7K3rPHbSefoVFY
         xpXiRwVHte8NBLmmOgf3RYYuFyQYCASsH7MtJlPWBVYA6whYblqDvthiE9i2MhMmAqxX
         GfBNFz07EYqpp3M5Z3Y+w0KV5kz/3KiDycTzdGHEatDFoY2gZ7HV82I15oLKqLe/ZhlA
         msRFlZvXCBTOFISqdbNrGSPhSIsGoWkWPcXU0b8l8Se7EU9JhaodBO7oF/YgOnbm8gpe
         mJjw==
X-Forwarded-Encrypted: i=1; AHgh+RqdYyjLjT6Y9KPUIeXTXH4kzYleaiLz8v21Af08vb4AjboV+4xxSc2ibUoZ3SWc9m418dXkWbZR5iflKJpIAyrH@lists.infradead.org
X-Gm-Message-State: AOJu0YwxfJxmyExX3QcVp18q7hPoX8Syz9FdAdIeJrU4aYiBhg2SwPMt
	M/dsSXf4zGxhTIe/ho6wnDinhLR4PzHYtyGf5WoKyj2FtCqkkMZzHluAl/l/BPgT
X-Gm-Gg: AR+sD122IXYAJkQMNmrTq10WlD3g6pJOtnJylbNziA6D9LROdW+KsWYhL6ZG01RtxQX
	qVayLqg0OAvmxPN3pkVenyI0DYZX0F+NSRI+g9dzifc082xyGQbK9xwwFgLKNjmVagQ97U3UwUj
	VXjUcyTBURKL8FpGlszk8xDwga+xs5ePwBUOhhOTiv4zWZT+jaFK6KkQ1EKdL85dzAA/ctrIBxm
	YIGr78xybIK2DIWbRWGppuoyW6/N8VwSjfUVOCb7X5K/pt32fPR8fUUaXhvBBbfSEOtGT72IH4K
	+AfU9jghWQxOFigpKNNgkr+hVwvkw7ThU/a1Uc7VdYy3Coy8a52gh68nh2E//DP2HJ4Xcsw36tC
	7GXd61UtHN5x6eOQJ4y7ugVB/A3IApfzXDeVsqL55WzmJYSqaceG50HveJ0EKYcTUlYEBaTE+S8
	tkQdH8ZxVNQYmyYOxST3zx54MFjnQdCTstPB6JVbIJ+YTu6jfj2kWHGbQ0L38/epT81QJoQOlmo
	R06qDac96JXDaQ25uvULLLRprzbJVng8x61yZ3yHc+gH1j6gkLB2ZlTSZ0yqLdVXGpuw/d0cDZp
	InU+2npexEK3QBLTxw1Fno37omT1hEXnx6bJ6f87nF4ApJyjQkN2BOuTNTx4HH3WIHazq1GaMqR
	PnLmSYs4pKYHxo3VZaWZiyf6XdDorpf4AcLwHVQ==
X-Received: by 2002:a05:6830:8389:b0:7e9:e709:44f6 with SMTP id 46e09a7af769-7f196ea3b40mr13694676a34.12.1785734125552;
        Sun, 02 Aug 2026 22:15:25 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:14 -0600
Subject: [PATCH 04/21] net: mdio: factor out OF child registration helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-4-0a53cd9e21cc@gmail.com>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
In-Reply-To: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 mfd@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_221531_203851_B51676D5 
X-CRM114-Status: GOOD (  19.62  )
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

Live OF reconfiguration needs to create the same PHY and generic MDIO
devices as initial bus population, including legacy PHY nodes that need
address scanning.

Factor fixed-address child registration and PHY address scanning into
helpers. The old scan loop also visited every free address for a child
without a reg property even when the child was not a PHY. Reject that case
before scanning while preserving enumeration of valid PHY and generic MDIO
children.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/mdio/of_mdio.c | 66 ++++++++++++++++++++++++++++------------------
 1 file changed, 40 insertions(+), 26 deletions(-)

diff --git a/drivers/net/mdio/of_mdio.c b/drivers/net/mdio/of_mdio.c
index b8d298c04d3f..051e449bbe7c 100644
--- a/drivers/net/mdio/of_mdio.c
+++ b/drivers/net/mdio/of_mdio.c
@@ -77,6 +77,15 @@ static int of_mdiobus_register_device(struct mii_bus *mdio,
 	return 0;
 }
 
+static int of_mdiobus_register_child(struct mii_bus *mdio,
+				     struct device_node *child, u32 addr)
+{
+	if (of_mdiobus_child_is_phy(child))
+		return of_mdiobus_register_phy(mdio, child, addr);
+
+	return of_mdiobus_register_device(mdio, child, addr);
+}
+
 /* The following is a list of PHY compatible strings which appear in
  * some DTBs. The compatible string is never matched against a PHY
  * driver, so is pointless. We only expect devices which are not PHYs
@@ -136,6 +145,32 @@ bool of_mdiobus_child_is_phy(struct device_node *child)
 }
 EXPORT_SYMBOL(of_mdiobus_child_is_phy);
 
+static int of_mdiobus_scan_phy(struct mii_bus *mdio,
+			       struct device_node *child)
+{
+	int addr, rc;
+
+	if (!of_mdiobus_child_is_phy(child))
+		return -ENODEV;
+
+	for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
+		if (mdiobus_is_registered_device(mdio, addr))
+			continue;
+
+		dev_info(&mdio->dev, "scan phy %pOFn at address %i\n",
+			 child, addr);
+
+		/* -ENODEV means that scanning should continue. */
+		rc = of_mdiobus_register_child(mdio, child, addr);
+		if (!rc)
+			return 0;
+		if (rc != -ENODEV)
+			return rc;
+	}
+
+	return -ENODEV;
+}
+
 static int __of_mdiobus_parse_phys(struct mii_bus *mdio, struct device_node *np,
 				   bool *scanphys)
 {
@@ -164,10 +199,7 @@ static int __of_mdiobus_parse_phys(struct mii_bus *mdio, struct device_node *np,
 			continue;
 		}
 
-		if (of_mdiobus_child_is_phy(child))
-			rc = of_mdiobus_register_phy(mdio, child, addr);
-		else
-			rc = of_mdiobus_register_device(mdio, child, addr);
+		rc = of_mdiobus_register_child(mdio, child, addr);
 
 		if (rc == -ENODEV)
 			dev_err(&mdio->dev,
@@ -197,7 +229,7 @@ int __of_mdiobus_register(struct mii_bus *mdio, struct device_node *np,
 {
 	struct device_node *child;
 	bool scanphys = false;
-	int addr, rc;
+	int rc;
 
 	if (!np)
 		return __mdiobus_register(mdio, owner);
@@ -238,27 +270,9 @@ int __of_mdiobus_register(struct mii_bus *mdio, struct device_node *np,
 		    of_node_name_eq(child, "ethernet-phy-package"))
 			continue;
 
-		for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
-			/* skip already registered PHYs */
-			if (mdiobus_is_registered_device(mdio, addr))
-				continue;
-
-			/* be noisy to encourage people to set reg property */
-			dev_info(&mdio->dev, "scan phy %pOFn at address %i\n",
-				 child, addr);
-
-			if (of_mdiobus_child_is_phy(child)) {
-				/* -ENODEV is the return code that PHYLIB has
-				 * standardized on to indicate that bus
-				 * scanning should continue.
-				 */
-				rc = of_mdiobus_register_phy(mdio, child, addr);
-				if (!rc)
-					break;
-				if (rc != -ENODEV)
-					goto put_unregister;
-			}
-		}
+		rc = of_mdiobus_scan_phy(mdio, child);
+		if (rc && rc != -ENODEV)
+			goto put_unregister;
 	}
 
 	return 0;

-- 
2.53.0


