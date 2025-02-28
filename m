Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22921C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 21:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h9qG8BT2xfz5J4kWG3W63aa1AkaaS0DpNQsWbgtOsUE=; b=i7plWSgwmG5fart0Jcp18z8BLX
	+LRlA1oDsCbFtV8m03j8Bls4OEnH79MfiIA+zaGdA16s5tyaugTbWjBdp8vavBuVQl2pIUp5HXeU2
	3cxKRiyghgus8O+/3yeQfW+VmyVp8HGJ93mUrHTdDxOcEaKAPczIitZwzhy0r5mhIrO4pEcyXsb2h
	DXjaPTIeoB4mYmB9GS5Ky3Ov3AhaJRp1BZAMsX/WJGuoRklNy59FKxIFBVRRp0GWto9LcE2vyT23e
	jzfSLIxjhvXXKq5y0i9rNAbgrKFBJNN9FId/8FCs4gwl1TQ2eRsnCN4Cd3C3kjIYKtMNL3GuTMWkj
	1VpwF0JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to8CD-0000000ClQu-1pI3;
	Fri, 28 Feb 2025 21:47:01 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to89z-0000000Ckuo-2O1O;
	Fri, 28 Feb 2025 21:44:44 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5e04861e7a6so4275326a12.1;
        Fri, 28 Feb 2025 13:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740779082; x=1741383882; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=h9qG8BT2xfz5J4kWG3W63aa1AkaaS0DpNQsWbgtOsUE=;
        b=DBoETrV7V16uZb9/GsFATzBdy+RAEh3/rcC2T5aQNeewTUoQgPXAEBir2jcdrt2GiR
         Rtm2TK815PaoPdMzP7J/BgObHu2wqcMEgzcghkPFzarsaZncW/6n/nX+scVSVx4bY8ry
         3qI2OtqrtcVw995OH9K5RI7qybc/sw6Yj+P02cmE68UKEAJf9euJ8pvfcRjLW4gNR5UM
         fNG05KfZlbc76tQoAqz5FVWA4cjzrgdNYU2vCXCK4AZWc9O4EzEgIRPItiucmS0+uIX6
         l2fEimEHUWzpZa9v5tBdWvZh5vgf46RK/w647Ppc1fL82+du6Od/vDu5Df4v7VT1k1qh
         Fhtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740779082; x=1741383882;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h9qG8BT2xfz5J4kWG3W63aa1AkaaS0DpNQsWbgtOsUE=;
        b=SKyRIj1DyD8lv00G4lQtvX6grT/imLsNz8ADgFycVgFZB1J0A9A+ypgQNfzhDZYMqR
         AkTq3mLUPiw8cMnblJ2buOIA8HTkMlBZ43b63R8YD2pLloFWE44og7TGRr06y8RjqVL6
         smdJK+PXmoT4jDJg1UFf2rDAdD19H+15//6zEeT+3x4eu5ELj1eblFpdYnPqLCQ+9Oey
         nifbswRjZrTTykyjk9GCCUp6Ie1bYbFgEt6Id5c7q+J5ZFHn6/WU6eX9v275WgNRw3BJ
         nOCrLaVnRlGmyN8SB7/YN717MRBWPx/h9UeHRJlC17PFL2MmzURD/+ASlOjUS8UCxdXw
         askw==
X-Forwarded-Encrypted: i=1; AJvYcCVdwJoYwHLKaiSeF28yOeiSrRzhNl2uhXvQrTk84ukyaKzIXxfPW9jN/TBnb+viLKHbgWwrtBbbU6hSU/ZyLz4=@lists.infradead.org, AJvYcCXgsvs7yHdYhPk6LO/2qck2kA4sv+fHQgyOFcYMdxSDbIhv7mUA/aaxwCa4QfMh782jnWEkWzL1Y4iAgNtRGaS0@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5NrGKm/wwz1RegOCEV6DiW0c/B1lgn/UhwOCiDhYwGNRrWMKk
	8KYdqsVFZyZ2wLO8g4kjCbFZvAeeeSTnm6qRU3WptZdaUmub/WlO
X-Gm-Gg: ASbGncvc61avJO7Je7dS7AZu8v8CcUnXAe0kbUqxRouOKm6RfCSWDe2IStyUOa4/laH
	83uGr6/YA2jgED864mwLXEZW6ksq0tHA+hTlPdAEUA7iJm9ZLvBiaqDsBVdiCdVv1Sb27I6ydHd
	n32jF0CZwuNIm0rEUpvoF1GJ9Hb4JBOgyF+bpEjf/RSbdfdfsFXLJ2wdiBkl1JxI2d2poczmxas
	ppGnnJJTyFjGHq1hLaq3mEiOlc/5MX/cJolMTrKLTlmrNU+frC4gVily8tTe0dB/zO1NlwleEoH
	GyWFn6bZ8uFt+Cgy96eDGw2WVxB25dygYEF5pZyhdTO/PaCGsdCD7H5lJcF225Y+RVvU8zI9iyf
	5iOmNmbg/rXSM9uv04O9z0Xriocl/DhluE95muC4GDjVPNNixPGcuknQPlEoe1JB434fxh2kQ59
	xFaf2TUgFMdY6IHxuT8of85yJJLJ0Vn3+y+MGs
X-Google-Smtp-Source: AGHT+IGBcgEMiwPY8YCRXtuxrPwnFNnVQ5EqgHMM+Ug3g7rZ8SkBAi89ELjyOgjFUMUWiF5mpkpeUQ==
X-Received: by 2002:a05:6402:40c7:b0:5e4:c532:d69d with SMTP id 4fb4d7f45d1cf-5e4d6926964mr4746542a12.0.1740779081645;
        Fri, 28 Feb 2025 13:44:41 -0800 (PST)
Received: from ?IPV6:2a02:3100:af43:5200:e57d:90a4:e6b5:1175? (dynamic-2a02-3100-af43-5200-e57d-90a4-e6b5-1175.310.pool.telefonica.de. [2a02:3100:af43:5200:e57d:90a4:e6b5:1175])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c43a668dsm3044721a12.70.2025.02.28.13.44.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 13:44:40 -0800 (PST)
Message-ID: <8c10c7ba-7398-4d15-8f34-37fb62ca0972@gmail.com>
Date: Fri, 28 Feb 2025 22:45:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next v2 1/8] net: phy: move PHY package code from
 phy_device.c to own source file
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>,
 Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, Robert Marko <robimarko@gmail.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>
References: <8b290ccf-ca0c-422f-b853-6fc7af045f99@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <8b290ccf-ca0c-422f-b853-6fc7af045f99@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_134443_686516_2577B18C 
X-CRM114-Status: GOOD (  27.42  )
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

This patch is the first step in moving the PHY package related code
to its own source file. No functional change intended.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/Makefile      |   3 +-
 drivers/net/phy/phy_device.c  | 237 ---------------------------------
 drivers/net/phy/phy_package.c | 244 ++++++++++++++++++++++++++++++++++
 3 files changed, 246 insertions(+), 238 deletions(-)
 create mode 100644 drivers/net/phy/phy_package.c

diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
index c8dac6e92..8f9ba5e82 100644
--- a/drivers/net/phy/Makefile
+++ b/drivers/net/phy/Makefile
@@ -2,7 +2,8 @@
 # Makefile for Linux PHY drivers
 
 libphy-y			:= phy.o phy-c45.o phy-core.o phy_device.o \
-				   linkmode.o phy_link_topology.o
+				   linkmode.o phy_link_topology.o \
+				   phy_package.o
 mdio-bus-y			+= mdio_bus.o mdio_device.o
 
 ifdef CONFIG_MDIO_DEVICE
diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index a38d399f2..b2d32fbc8 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1686,243 +1686,6 @@ bool phy_driver_is_genphy_10g(struct phy_device *phydev)
 }
 EXPORT_SYMBOL_GPL(phy_driver_is_genphy_10g);
 
-/**
- * phy_package_join - join a common PHY group
- * @phydev: target phy_device struct
- * @base_addr: cookie and base PHY address of PHY package for offset
- *   calculation of global register access
- * @priv_size: if non-zero allocate this amount of bytes for private data
- *
- * This joins a PHY group and provides a shared storage for all phydevs in
- * this group. This is intended to be used for packages which contain
- * more than one PHY, for example a quad PHY transceiver.
- *
- * The base_addr parameter serves as cookie which has to have the same values
- * for all members of one group and as the base PHY address of the PHY package
- * for offset calculation to access generic registers of a PHY package.
- * Usually, one of the PHY addresses of the different PHYs in the package
- * provides access to these global registers.
- * The address which is given here, will be used in the phy_package_read()
- * and phy_package_write() convenience functions as base and added to the
- * passed offset in those functions.
- *
- * This will set the shared pointer of the phydev to the shared storage.
- * If this is the first call for a this cookie the shared storage will be
- * allocated. If priv_size is non-zero, the given amount of bytes are
- * allocated for the priv member.
- *
- * Returns < 1 on error, 0 on success. Esp. calling phy_package_join()
- * with the same cookie but a different priv_size is an error.
- */
-int phy_package_join(struct phy_device *phydev, int base_addr, size_t priv_size)
-{
-	struct mii_bus *bus = phydev->mdio.bus;
-	struct phy_package_shared *shared;
-	int ret;
-
-	if (base_addr < 0 || base_addr >= PHY_MAX_ADDR)
-		return -EINVAL;
-
-	mutex_lock(&bus->shared_lock);
-	shared = bus->shared[base_addr];
-	if (!shared) {
-		ret = -ENOMEM;
-		shared = kzalloc(sizeof(*shared), GFP_KERNEL);
-		if (!shared)
-			goto err_unlock;
-		if (priv_size) {
-			shared->priv = kzalloc(priv_size, GFP_KERNEL);
-			if (!shared->priv)
-				goto err_free;
-			shared->priv_size = priv_size;
-		}
-		shared->base_addr = base_addr;
-		shared->np = NULL;
-		refcount_set(&shared->refcnt, 1);
-		bus->shared[base_addr] = shared;
-	} else {
-		ret = -EINVAL;
-		if (priv_size && priv_size != shared->priv_size)
-			goto err_unlock;
-		refcount_inc(&shared->refcnt);
-	}
-	mutex_unlock(&bus->shared_lock);
-
-	phydev->shared = shared;
-
-	return 0;
-
-err_free:
-	kfree(shared);
-err_unlock:
-	mutex_unlock(&bus->shared_lock);
-	return ret;
-}
-EXPORT_SYMBOL_GPL(phy_package_join);
-
-/**
- * of_phy_package_join - join a common PHY group in PHY package
- * @phydev: target phy_device struct
- * @priv_size: if non-zero allocate this amount of bytes for private data
- *
- * This is a variant of phy_package_join for PHY package defined in DT.
- *
- * The parent node of the @phydev is checked as a valid PHY package node
- * structure (by matching the node name "ethernet-phy-package") and the
- * base_addr for the PHY package is passed to phy_package_join.
- *
- * With this configuration the shared struct will also have the np value
- * filled to use additional DT defined properties in PHY specific
- * probe_once and config_init_once PHY package OPs.
- *
- * Returns < 0 on error, 0 on success. Esp. calling phy_package_join()
- * with the same cookie but a different priv_size is an error. Or a parent
- * node is not detected or is not valid or doesn't match the expected node
- * name for PHY package.
- */
-int of_phy_package_join(struct phy_device *phydev, size_t priv_size)
-{
-	struct device_node *node = phydev->mdio.dev.of_node;
-	struct device_node *package_node;
-	u32 base_addr;
-	int ret;
-
-	if (!node)
-		return -EINVAL;
-
-	package_node = of_get_parent(node);
-	if (!package_node)
-		return -EINVAL;
-
-	if (!of_node_name_eq(package_node, "ethernet-phy-package")) {
-		ret = -EINVAL;
-		goto exit;
-	}
-
-	if (of_property_read_u32(package_node, "reg", &base_addr)) {
-		ret = -EINVAL;
-		goto exit;
-	}
-
-	ret = phy_package_join(phydev, base_addr, priv_size);
-	if (ret)
-		goto exit;
-
-	phydev->shared->np = package_node;
-
-	return 0;
-exit:
-	of_node_put(package_node);
-	return ret;
-}
-EXPORT_SYMBOL_GPL(of_phy_package_join);
-
-/**
- * phy_package_leave - leave a common PHY group
- * @phydev: target phy_device struct
- *
- * This leaves a PHY group created by phy_package_join(). If this phydev
- * was the last user of the shared data between the group, this data is
- * freed. Resets the phydev->shared pointer to NULL.
- */
-void phy_package_leave(struct phy_device *phydev)
-{
-	struct phy_package_shared *shared = phydev->shared;
-	struct mii_bus *bus = phydev->mdio.bus;
-
-	if (!shared)
-		return;
-
-	/* Decrease the node refcount on leave if present */
-	if (shared->np)
-		of_node_put(shared->np);
-
-	if (refcount_dec_and_mutex_lock(&shared->refcnt, &bus->shared_lock)) {
-		bus->shared[shared->base_addr] = NULL;
-		mutex_unlock(&bus->shared_lock);
-		kfree(shared->priv);
-		kfree(shared);
-	}
-
-	phydev->shared = NULL;
-}
-EXPORT_SYMBOL_GPL(phy_package_leave);
-
-static void devm_phy_package_leave(struct device *dev, void *res)
-{
-	phy_package_leave(*(struct phy_device **)res);
-}
-
-/**
- * devm_phy_package_join - resource managed phy_package_join()
- * @dev: device that is registering this PHY package
- * @phydev: target phy_device struct
- * @base_addr: cookie and base PHY address of PHY package for offset
- *   calculation of global register access
- * @priv_size: if non-zero allocate this amount of bytes for private data
- *
- * Managed phy_package_join(). Shared storage fetched by this function,
- * phy_package_leave() is automatically called on driver detach. See
- * phy_package_join() for more information.
- */
-int devm_phy_package_join(struct device *dev, struct phy_device *phydev,
-			  int base_addr, size_t priv_size)
-{
-	struct phy_device **ptr;
-	int ret;
-
-	ptr = devres_alloc(devm_phy_package_leave, sizeof(*ptr),
-			   GFP_KERNEL);
-	if (!ptr)
-		return -ENOMEM;
-
-	ret = phy_package_join(phydev, base_addr, priv_size);
-
-	if (!ret) {
-		*ptr = phydev;
-		devres_add(dev, ptr);
-	} else {
-		devres_free(ptr);
-	}
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(devm_phy_package_join);
-
-/**
- * devm_of_phy_package_join - resource managed of_phy_package_join()
- * @dev: device that is registering this PHY package
- * @phydev: target phy_device struct
- * @priv_size: if non-zero allocate this amount of bytes for private data
- *
- * Managed of_phy_package_join(). Shared storage fetched by this function,
- * phy_package_leave() is automatically called on driver detach. See
- * of_phy_package_join() for more information.
- */
-int devm_of_phy_package_join(struct device *dev, struct phy_device *phydev,
-			     size_t priv_size)
-{
-	struct phy_device **ptr;
-	int ret;
-
-	ptr = devres_alloc(devm_phy_package_leave, sizeof(*ptr),
-			   GFP_KERNEL);
-	if (!ptr)
-		return -ENOMEM;
-
-	ret = of_phy_package_join(phydev, priv_size);
-
-	if (!ret) {
-		*ptr = phydev;
-		devres_add(dev, ptr);
-	} else {
-		devres_free(ptr);
-	}
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(devm_of_phy_package_join);
-
 /**
  * phy_detach - detach a PHY device from its network device
  * @phydev: target phy_device struct
diff --git a/drivers/net/phy/phy_package.c b/drivers/net/phy/phy_package.c
new file mode 100644
index 000000000..260469f02
--- /dev/null
+++ b/drivers/net/phy/phy_package.c
@@ -0,0 +1,244 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * PHY package support
+ */
+
+#include <linux/of.h>
+#include <linux/phy.h>
+
+/**
+ * phy_package_join - join a common PHY group
+ * @phydev: target phy_device struct
+ * @base_addr: cookie and base PHY address of PHY package for offset
+ *   calculation of global register access
+ * @priv_size: if non-zero allocate this amount of bytes for private data
+ *
+ * This joins a PHY group and provides a shared storage for all phydevs in
+ * this group. This is intended to be used for packages which contain
+ * more than one PHY, for example a quad PHY transceiver.
+ *
+ * The base_addr parameter serves as cookie which has to have the same values
+ * for all members of one group and as the base PHY address of the PHY package
+ * for offset calculation to access generic registers of a PHY package.
+ * Usually, one of the PHY addresses of the different PHYs in the package
+ * provides access to these global registers.
+ * The address which is given here, will be used in the phy_package_read()
+ * and phy_package_write() convenience functions as base and added to the
+ * passed offset in those functions.
+ *
+ * This will set the shared pointer of the phydev to the shared storage.
+ * If this is the first call for a this cookie the shared storage will be
+ * allocated. If priv_size is non-zero, the given amount of bytes are
+ * allocated for the priv member.
+ *
+ * Returns < 1 on error, 0 on success. Esp. calling phy_package_join()
+ * with the same cookie but a different priv_size is an error.
+ */
+int phy_package_join(struct phy_device *phydev, int base_addr, size_t priv_size)
+{
+	struct mii_bus *bus = phydev->mdio.bus;
+	struct phy_package_shared *shared;
+	int ret;
+
+	if (base_addr < 0 || base_addr >= PHY_MAX_ADDR)
+		return -EINVAL;
+
+	mutex_lock(&bus->shared_lock);
+	shared = bus->shared[base_addr];
+	if (!shared) {
+		ret = -ENOMEM;
+		shared = kzalloc(sizeof(*shared), GFP_KERNEL);
+		if (!shared)
+			goto err_unlock;
+		if (priv_size) {
+			shared->priv = kzalloc(priv_size, GFP_KERNEL);
+			if (!shared->priv)
+				goto err_free;
+			shared->priv_size = priv_size;
+		}
+		shared->base_addr = base_addr;
+		shared->np = NULL;
+		refcount_set(&shared->refcnt, 1);
+		bus->shared[base_addr] = shared;
+	} else {
+		ret = -EINVAL;
+		if (priv_size && priv_size != shared->priv_size)
+			goto err_unlock;
+		refcount_inc(&shared->refcnt);
+	}
+	mutex_unlock(&bus->shared_lock);
+
+	phydev->shared = shared;
+
+	return 0;
+
+err_free:
+	kfree(shared);
+err_unlock:
+	mutex_unlock(&bus->shared_lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(phy_package_join);
+
+/**
+ * of_phy_package_join - join a common PHY group in PHY package
+ * @phydev: target phy_device struct
+ * @priv_size: if non-zero allocate this amount of bytes for private data
+ *
+ * This is a variant of phy_package_join for PHY package defined in DT.
+ *
+ * The parent node of the @phydev is checked as a valid PHY package node
+ * structure (by matching the node name "ethernet-phy-package") and the
+ * base_addr for the PHY package is passed to phy_package_join.
+ *
+ * With this configuration the shared struct will also have the np value
+ * filled to use additional DT defined properties in PHY specific
+ * probe_once and config_init_once PHY package OPs.
+ *
+ * Returns < 0 on error, 0 on success. Esp. calling phy_package_join()
+ * with the same cookie but a different priv_size is an error. Or a parent
+ * node is not detected or is not valid or doesn't match the expected node
+ * name for PHY package.
+ */
+int of_phy_package_join(struct phy_device *phydev, size_t priv_size)
+{
+	struct device_node *node = phydev->mdio.dev.of_node;
+	struct device_node *package_node;
+	u32 base_addr;
+	int ret;
+
+	if (!node)
+		return -EINVAL;
+
+	package_node = of_get_parent(node);
+	if (!package_node)
+		return -EINVAL;
+
+	if (!of_node_name_eq(package_node, "ethernet-phy-package")) {
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	if (of_property_read_u32(package_node, "reg", &base_addr)) {
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	ret = phy_package_join(phydev, base_addr, priv_size);
+	if (ret)
+		goto exit;
+
+	phydev->shared->np = package_node;
+
+	return 0;
+exit:
+	of_node_put(package_node);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(of_phy_package_join);
+
+/**
+ * phy_package_leave - leave a common PHY group
+ * @phydev: target phy_device struct
+ *
+ * This leaves a PHY group created by phy_package_join(). If this phydev
+ * was the last user of the shared data between the group, this data is
+ * freed. Resets the phydev->shared pointer to NULL.
+ */
+void phy_package_leave(struct phy_device *phydev)
+{
+	struct phy_package_shared *shared = phydev->shared;
+	struct mii_bus *bus = phydev->mdio.bus;
+
+	if (!shared)
+		return;
+
+	/* Decrease the node refcount on leave if present */
+	if (shared->np)
+		of_node_put(shared->np);
+
+	if (refcount_dec_and_mutex_lock(&shared->refcnt, &bus->shared_lock)) {
+		bus->shared[shared->base_addr] = NULL;
+		mutex_unlock(&bus->shared_lock);
+		kfree(shared->priv);
+		kfree(shared);
+	}
+
+	phydev->shared = NULL;
+}
+EXPORT_SYMBOL_GPL(phy_package_leave);
+
+static void devm_phy_package_leave(struct device *dev, void *res)
+{
+	phy_package_leave(*(struct phy_device **)res);
+}
+
+/**
+ * devm_phy_package_join - resource managed phy_package_join()
+ * @dev: device that is registering this PHY package
+ * @phydev: target phy_device struct
+ * @base_addr: cookie and base PHY address of PHY package for offset
+ *   calculation of global register access
+ * @priv_size: if non-zero allocate this amount of bytes for private data
+ *
+ * Managed phy_package_join(). Shared storage fetched by this function,
+ * phy_package_leave() is automatically called on driver detach. See
+ * phy_package_join() for more information.
+ */
+int devm_phy_package_join(struct device *dev, struct phy_device *phydev,
+			  int base_addr, size_t priv_size)
+{
+	struct phy_device **ptr;
+	int ret;
+
+	ptr = devres_alloc(devm_phy_package_leave, sizeof(*ptr),
+			   GFP_KERNEL);
+	if (!ptr)
+		return -ENOMEM;
+
+	ret = phy_package_join(phydev, base_addr, priv_size);
+
+	if (!ret) {
+		*ptr = phydev;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(devm_phy_package_join);
+
+/**
+ * devm_of_phy_package_join - resource managed of_phy_package_join()
+ * @dev: device that is registering this PHY package
+ * @phydev: target phy_device struct
+ * @priv_size: if non-zero allocate this amount of bytes for private data
+ *
+ * Managed of_phy_package_join(). Shared storage fetched by this function,
+ * phy_package_leave() is automatically called on driver detach. See
+ * of_phy_package_join() for more information.
+ */
+int devm_of_phy_package_join(struct device *dev, struct phy_device *phydev,
+			     size_t priv_size)
+{
+	struct phy_device **ptr;
+	int ret;
+
+	ptr = devres_alloc(devm_phy_package_leave, sizeof(*ptr),
+			   GFP_KERNEL);
+	if (!ptr)
+		return -ENOMEM;
+
+	ret = of_phy_package_join(phydev, priv_size);
+
+	if (!ret) {
+		*ptr = phydev;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(devm_of_phy_package_join);
-- 
2.48.1



