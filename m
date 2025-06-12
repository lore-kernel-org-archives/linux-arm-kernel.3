Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3988C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 21:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4bgNZC8EZ+8YN8zYzWZFcyV2guT062DAzWNQyh77fkg=; b=U45KBgNGUePB9wiPSz6Y/ElSc4
	zzAMJK52DSWaDpCs9Y83eJH343SQxmbaWgRlWnCWDpZCHiFxG+qgFiGeImbOGxqSGwRW0Gb5KerME
	9VtLZJGWQHJG7uJ5JfzqoOMplqnSRLFLm/sn29b7zZeN+i4gB7eXzo4q6xhUI3xG5vTkcndY10GDd
	GMQqD5lqSD+pTrMEd0iKM4A4cj3/83QNVGCQ16xrz/EgoTB7pGlOtN5qTvJB544rNvL3MQt5+4GP6
	Eixxmj1uGhE0/YIyLplPvD0Pc13cl0di1LPAN08CuNoCN81LV94pwOxAT7mVZv2V+Qrr4+H3Gf2lg
	6u9XzVXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPpnm-0000000Eh3G-1yXw;
	Thu, 12 Jun 2025 21:49:38 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPpQv-0000000EeMZ-0iUC;
	Thu, 12 Jun 2025 21:26:02 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a4f379662cso1301263f8f.0;
        Thu, 12 Jun 2025 14:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749763560; x=1750368360; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4bgNZC8EZ+8YN8zYzWZFcyV2guT062DAzWNQyh77fkg=;
        b=X5xXZgWS9+IsiOzTK2BfJ32fzOZssBxocrrm54LvIDbEe86gAZqkjBIXrLXLGGc2LE
         V8CX52Z8MEd0kUHpehzE/VAWCduO7rNN657CUEWNVCBALSILP4uHc2RLQ0pbqKiODoRP
         yrS0cEHgP7ldOnMPrCj4+YELP09yW7wonuqQfxxDncaedKj16DTG4TUHqF57vFNhF0AW
         x+rnQTfa2Jy4cmQm/Fleu99CqGFPJThdSj4Kbme2BAZveq4+y8AfoKud/5eBBj//YOq3
         93rQampc0jTTi5jqwx3+/LoXPJqwHgEuYqkv8sGNnnYZvlSQ+ZSlQAEKe8sXxu4aTj62
         HNYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749763560; x=1750368360;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4bgNZC8EZ+8YN8zYzWZFcyV2guT062DAzWNQyh77fkg=;
        b=vI9M/GA0HpW20SFXoPQTXAwtAT2ZG73/p98RWlRfEoCV450xEmgWMlVDycyl+81CfM
         jQmB7jsHG9NHTOooWELCOlSBJsMidnbcrZKaIe6lMy6Jz32uDq0Wv01iZyBr3T25RBO+
         igUisjlb0PPt4gxCJspRTuMDl8RDy6lVg0g/ytbDuGz12z9sULPfVNY9wHU22LqDVt/e
         yj46Ari1pFwO3ue5J1+oHDrPqSjTtyi3AJ3lCufztPzHOJzEbfdoYKvTWxU5z7L00Sb1
         Uf0/B0c7aP5aVr3Mo8MAJpDpYhgnV5P/WB4gti3y79HJE4jBjsm9d6zsnNwg9tis0Kfd
         uvUA==
X-Forwarded-Encrypted: i=1; AJvYcCVfEPlp+OIPc284sXYO1PoiSu+99RZz7YpcXRcT1TVt4Ueky5xvsBijYqO2q30oCt9nFTsj4ba/srf99iqmiOng@lists.infradead.org, AJvYcCX4GHTdsr3EuSEJmllPh4WqOYfI/tPdqG/JXlFYnZY69A4ZCFV2l7fpa1gEBq/FAlG5k4V8REd9agDFimfUQJ4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3dzijjQ3xA1yEtMHw3ld/sQj+FcGq8zSHu8foUu0DmHeUoZqk
	YisMm/JoJ/0KeF6XxqNoe5FfwxD1+JQMUMmdYGssDUFqJ6aZFKzk+x28
X-Gm-Gg: ASbGncu1w9rZVs9DD6kdw9TcUzr5cvniEzIxehoTLU06h2Nplj3UZphVM/8QAryQ1Pi
	cnSOIhE3g+AEqEqF1beeWTb35vCieE1nXFRQl+HaM8UERYN4dVwQiTdiLlTuJdUfI+fHgsd7ZyO
	S5zwfPVQa4/E/gJAf+UH5UtGrQ1zqF4bpPSsfIFcsTyHR79wYKw1wyFSkxxWEq/CVYDP2uNAYq6
	uGBqL6hzaSH+U0RlnIchP25ayAWrYaJMKAnwb7WrUGI40+qerI/YZfjIo/dJZt8+0u8195dcy+E
	XsffoDX35SeWit5yea0ae6rCqxOyPOacgmdNZ7/NBoirudhtT4eRZpDNzkwKWmP9vcDx41Nm7B3
	qKkMFNgRvS5j1xpInzOzo8ukh592ORGZ/H8+UsUs9yA+TN2njBWmXbNyjv6Jr7iskovcDdhGYum
	Z1aqetML6Sz/qzGpflKYpJ9FMzR+FJGc/NkAy9
X-Google-Smtp-Source: AGHT+IHDrhuvDBNzi1HkVALmKY8HkCyd4dp7xmwD3CMCAlBZD/sd6lcRLB41MxGjbZLFJ5vPTfE4cg==
X-Received: by 2002:a05:6000:1ace:b0:3a4:f379:65b6 with SMTP id ffacd0b85a97d-3a56876c6ffmr585636f8f.46.1749763559385;
        Thu, 12 Jun 2025 14:25:59 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f22:3f00:7533:d8b1:ff14:6fe5? (p200300ea8f223f007533d8b1ff146fe5.dip0.t-ipconnect.de. [2003:ea:8f22:3f00:7533:d8b1:ff14:6fe5])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a568b28240sm404295f8f.72.2025.06.12.14.25.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 14:25:58 -0700 (PDT)
Message-ID: <8956fa53-3eda-4079-8203-a8fddcc17bf3@gmail.com>
Date: Thu, 12 Jun 2025 23:26:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 1/3] net: phy: move __phy_package_[read|write]_mmd to
 phy_package.c
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, David Miller <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org
References: <eec346a4-e903-48af-8150-0191932a7a0b@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <eec346a4-e903-48af-8150-0191932a7a0b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_142601_220375_81163E27 
X-CRM114-Status: GOOD (  18.35  )
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

Move both functions to phy_package.c, so that phy_core.c no longer
has a dependency on phy_package.c (phy_package_address).

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/phy-core.c        | 75 +++----------------------------
 drivers/net/phy/phy_package.c     | 68 +++++++++++++++++++++++++++-
 drivers/net/phy/phylib-internal.h |  6 ++-
 3 files changed, 78 insertions(+), 71 deletions(-)

diff --git a/drivers/net/phy/phy-core.c b/drivers/net/phy/phy-core.c
index e177037f9..27f183356 100644
--- a/drivers/net/phy/phy-core.c
+++ b/drivers/net/phy/phy-core.c
@@ -375,8 +375,8 @@ static void mmd_phy_indirect(struct mii_bus *bus, int phy_addr, int devad,
 			devad | MII_MMD_CTRL_NOINCR);
 }
 
-static int mmd_phy_read(struct mii_bus *bus, int phy_addr, bool is_c45,
-			int devad, u32 regnum)
+int mmd_phy_read(struct mii_bus *bus, int phy_addr, bool is_c45,
+		 int devad, u32 regnum)
 {
 	if (is_c45)
 		return __mdiobus_c45_read(bus, phy_addr, devad, regnum);
@@ -385,9 +385,10 @@ static int mmd_phy_read(struct mii_bus *bus, int phy_addr, bool is_c45,
 	/* Read the content of the MMD's selected register */
 	return __mdiobus_read(bus, phy_addr, MII_MMD_DATA);
 }
+EXPORT_SYMBOL_GPL(mmd_phy_read);
 
-static int mmd_phy_write(struct mii_bus *bus, int phy_addr, bool is_c45,
-			 int devad, u32 regnum, u16 val)
+int mmd_phy_write(struct mii_bus *bus, int phy_addr, bool is_c45,
+		  int devad, u32 regnum, u16 val)
 {
 	if (is_c45)
 		return __mdiobus_c45_write(bus, phy_addr, devad, regnum, val);
@@ -396,6 +397,7 @@ static int mmd_phy_write(struct mii_bus *bus, int phy_addr, bool is_c45,
 	/* Write the data into MMD's selected register */
 	return __mdiobus_write(bus, phy_addr, MII_MMD_DATA, val);
 }
+EXPORT_SYMBOL_GPL(mmd_phy_write);
 
 /**
  * __phy_read_mmd - Convenience function for reading a register
@@ -485,71 +487,6 @@ int phy_write_mmd(struct phy_device *phydev, int devad, u32 regnum, u16 val)
 }
 EXPORT_SYMBOL(phy_write_mmd);
 
-/**
- * __phy_package_read_mmd - read MMD reg relative to PHY package base addr
- * @phydev: The phy_device struct
- * @addr_offset: The offset to be added to PHY package base_addr
- * @devad: The MMD to read from
- * @regnum: The register on the MMD to read
- *
- * Convenience helper for reading a register of an MMD on a given PHY
- * using the PHY package base address. The base address is added to
- * the addr_offset value.
- *
- * Same calling rules as for __phy_read();
- *
- * NOTE: It's assumed that the entire PHY package is either C22 or C45.
- */
-int __phy_package_read_mmd(struct phy_device *phydev,
-			   unsigned int addr_offset, int devad,
-			   u32 regnum)
-{
-	int addr = phy_package_address(phydev, addr_offset);
-
-	if (addr < 0)
-		return addr;
-
-	if (regnum > (u16)~0 || devad > 32)
-		return -EINVAL;
-
-	return mmd_phy_read(phydev->mdio.bus, addr, phydev->is_c45, devad,
-			    regnum);
-}
-EXPORT_SYMBOL(__phy_package_read_mmd);
-
-/**
- * __phy_package_write_mmd - write MMD reg relative to PHY package base addr
- * @phydev: The phy_device struct
- * @addr_offset: The offset to be added to PHY package base_addr
- * @devad: The MMD to write to
- * @regnum: The register on the MMD to write
- * @val: value to write to @regnum
- *
- * Convenience helper for writing a register of an MMD on a given PHY
- * using the PHY package base address. The base address is added to
- * the addr_offset value.
- *
- * Same calling rules as for __phy_write();
- *
- * NOTE: It's assumed that the entire PHY package is either C22 or C45.
- */
-int __phy_package_write_mmd(struct phy_device *phydev,
-			    unsigned int addr_offset, int devad,
-			    u32 regnum, u16 val)
-{
-	int addr = phy_package_address(phydev, addr_offset);
-
-	if (addr < 0)
-		return addr;
-
-	if (regnum > (u16)~0 || devad > 32)
-		return -EINVAL;
-
-	return mmd_phy_write(phydev->mdio.bus, addr, phydev->is_c45, devad,
-			     regnum, val);
-}
-EXPORT_SYMBOL(__phy_package_write_mmd);
-
 /**
  * phy_modify_changed - Function for modifying a PHY register
  * @phydev: the phy_device struct
diff --git a/drivers/net/phy/phy_package.c b/drivers/net/phy/phy_package.c
index c738f76e8..5dd5db7e8 100644
--- a/drivers/net/phy/phy_package.c
+++ b/drivers/net/phy/phy_package.c
@@ -52,7 +52,8 @@ void *phy_package_get_priv(struct phy_device *phydev)
 }
 EXPORT_SYMBOL_GPL(phy_package_get_priv);
 
-int phy_package_address(struct phy_device *phydev, unsigned int addr_offset)
+static int phy_package_address(struct phy_device *phydev,
+			       unsigned int addr_offset)
 {
 	struct phy_package_shared *shared = phydev->shared;
 	u8 base_addr = shared->base_addr;
@@ -90,6 +91,71 @@ int __phy_package_write(struct phy_device *phydev, unsigned int addr_offset,
 }
 EXPORT_SYMBOL_GPL(__phy_package_write);
 
+/**
+ * __phy_package_read_mmd - read MMD reg relative to PHY package base addr
+ * @phydev: The phy_device struct
+ * @addr_offset: The offset to be added to PHY package base_addr
+ * @devad: The MMD to read from
+ * @regnum: The register on the MMD to read
+ *
+ * Convenience helper for reading a register of an MMD on a given PHY
+ * using the PHY package base address. The base address is added to
+ * the addr_offset value.
+ *
+ * Same calling rules as for __phy_read();
+ *
+ * NOTE: It's assumed that the entire PHY package is either C22 or C45.
+ */
+int __phy_package_read_mmd(struct phy_device *phydev,
+			   unsigned int addr_offset, int devad,
+			   u32 regnum)
+{
+	int addr = phy_package_address(phydev, addr_offset);
+
+	if (addr < 0)
+		return addr;
+
+	if (regnum > (u16)~0 || devad > 32)
+		return -EINVAL;
+
+	return mmd_phy_read(phydev->mdio.bus, addr, phydev->is_c45, devad,
+			    regnum);
+}
+EXPORT_SYMBOL(__phy_package_read_mmd);
+
+/**
+ * __phy_package_write_mmd - write MMD reg relative to PHY package base addr
+ * @phydev: The phy_device struct
+ * @addr_offset: The offset to be added to PHY package base_addr
+ * @devad: The MMD to write to
+ * @regnum: The register on the MMD to write
+ * @val: value to write to @regnum
+ *
+ * Convenience helper for writing a register of an MMD on a given PHY
+ * using the PHY package base address. The base address is added to
+ * the addr_offset value.
+ *
+ * Same calling rules as for __phy_write();
+ *
+ * NOTE: It's assumed that the entire PHY package is either C22 or C45.
+ */
+int __phy_package_write_mmd(struct phy_device *phydev,
+			    unsigned int addr_offset, int devad,
+			    u32 regnum, u16 val)
+{
+	int addr = phy_package_address(phydev, addr_offset);
+
+	if (addr < 0)
+		return addr;
+
+	if (regnum > (u16)~0 || devad > 32)
+		return -EINVAL;
+
+	return mmd_phy_write(phydev->mdio.bus, addr, phydev->is_c45, devad,
+			     regnum, val);
+}
+EXPORT_SYMBOL(__phy_package_write_mmd);
+
 static bool __phy_package_set_once(struct phy_device *phydev, unsigned int b)
 {
 	struct phy_package_shared *shared = phydev->shared;
diff --git a/drivers/net/phy/phylib-internal.h b/drivers/net/phy/phylib-internal.h
index afac2bd15..ebda74eb6 100644
--- a/drivers/net/phy/phylib-internal.h
+++ b/drivers/net/phy/phylib-internal.h
@@ -7,6 +7,7 @@
 #define __PHYLIB_INTERNAL_H
 
 struct phy_device;
+struct mii_bus;
 
 /*
  * phy_supported_speeds - return all speeds currently supported by a PHY device
@@ -20,7 +21,10 @@ void of_set_phy_timing_role(struct phy_device *phydev);
 int phy_speed_down_core(struct phy_device *phydev);
 void phy_check_downshift(struct phy_device *phydev);
 
-int phy_package_address(struct phy_device *phydev, unsigned int addr_offset);
+int mmd_phy_read(struct mii_bus *bus, int phy_addr, bool is_c45,
+		 int devad, u32 regnum);
+int mmd_phy_write(struct mii_bus *bus, int phy_addr, bool is_c45,
+		  int devad, u32 regnum, u16 val);
 
 int genphy_c45_read_eee_adv(struct phy_device *phydev, unsigned long *adv);
 
-- 
2.49.0



