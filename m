Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32EB5C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 21:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ba7sBd79KvT0DgpIWK/dwQDT1LJYkzaju3LI4FWecw=; b=umf95BlAh4L+NC0PcLerw+3s8y
	8+T8/Ol8xjZPSOHREBdoqioX0a4qP3nTK15Mmpv3soKHaZiXH5hP6SvAXugakga7bJ0XJQt73O7wX
	54XKfQe8r72ZmBSwLEfzVZzuXoo3NjjsX51RYaCldodhldf/1r58NybxKUQeWwBtO8yZWCFq2bGMp
	kPyYkXTu7J/5jxYJhDYt6JCNX8apd5oBjksXte0Q9zXedENFnynJinNoF1z9XOoq7VqBuLGfxl20Q
	nRYLpw1J4OblYcOggV89enTq89SAKzIv+WYDMn6NMX80K8pEPnraTCT4r8YJeL3ZNUOyp9JQobmUd
	cyUoBPaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkrGd-0000000F4qo-0CDs;
	Wed, 19 Feb 2025 21:06:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkrDt-0000000F3vz-0I3f;
	Wed, 19 Feb 2025 21:03:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4ba7sBd79KvT0DgpIWK/dwQDT1LJYkzaju3LI4FWecw=; b=aPd+fkHIYCMn9nQth5Iv25N4vL
	J4we+eb/yB1LmmAoMmlm7yIlP6xp2MUEQ1ZkcMsaLR15tk3/kkivpA36Njmhs3bFTf9MQAtPY5snh
	Olchw5QxABooMi2aY4c1Rs3xo9so79My6vYnmzLCsNntQhsyBHLzLSWKjFJPTCr+jwItFrS4GjXgF
	oKcgi0qnaWzc/e73IhQmmBxa38/dAxWIZWSZiOGFu2qXFBmIhoZPdvTaumkvPYMr/qZr15fMMtiq/
	ZghDvknh5H+pwThDtprf1u5o4LDodTqWStY7m20h6W379ocDFd4aAQo6vyQdHR2bwXdo4yOsS5glH
	oUz4GnuA==;
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkrDp-00000002KdP-0xnB;
	Wed, 19 Feb 2025 21:03:11 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-abb7520028bso38365766b.3;
        Wed, 19 Feb 2025 13:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739998987; x=1740603787; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4ba7sBd79KvT0DgpIWK/dwQDT1LJYkzaju3LI4FWecw=;
        b=EngsbzWH3BQIBXx2ig4iT0eFeqbLAfPIrAipv3ZME4xs6DhfsCN+jn9F/hlzAb1FFC
         ikk0EsCnwM3/sxGNQovtTdPSbotl71eRIyLi9veZTZktlHBHZYy2m5qCaxYKfy+c8Dpv
         yPobhtd+i9bK2fySa6zW6jRbtW5lEwaxmrOlEEWWDSP3/qHnL0KTiYYe4w3FN4AANyOA
         /jMICh5Q0etMF24tiKQewA436vt6rjlV59hHL1hBCMRf8TGW5+uWVSpCvOiSRwKMRgQ1
         DoSAWoHTUkMSXX9GCrZeGk4tSTCSlUZMhQsdaPVzD/CEhlH6SkQSa4U8FCAFNLEmXHg0
         KByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739998987; x=1740603787;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ba7sBd79KvT0DgpIWK/dwQDT1LJYkzaju3LI4FWecw=;
        b=SIoZRsqRvKu3Vp7JMxUJBmn+Z351p+voudwlhlNfn2R2VC6CVHub9OBK+imHE8VCHJ
         ZU4BfWm+eWcN48be/NIN9qzHnkzPmKmXKNkYybGWPLOqUmbh9keiwvopSOffSKMytsZy
         /AJbTx7X1VSqsP5RN3xLRkKf+Fs0QgY3RERMtfKalpWvZtRk+yY86WhIg+BokDLNRPpw
         rn8HfDn59Ov4Nh8zdpjpQccoPEDQrINQlap1yHR1EeW2NsV8FOMx9dBwnqFOUAUo5HIL
         XrbgvzB7oOprVpSKWN9gb7PVfOvED/eA5SmAO49wkNdoUb5IgOiSOUs5HweIzHHbvOG8
         27tg==
X-Forwarded-Encrypted: i=1; AJvYcCW6VXVKMD34BkcyXEqy/3/QnCy4v1921jzIj/kjE6ztG1lkDUVb2l3dlQXy0mI8PzOoQ/W5liONjzx6fLGelvsY@lists.infradead.org, AJvYcCWJQ9+Mn1F4Afh6VAzqWm5iz7u73Danqx4tX8zMYB1hMq0Wx4XB+cIXF6+u2NnsqmtPMHGUtIvvvyvEIkvxFs8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwginNNelggC2aMhlUWeSOkHc8Gj9laTpQynFb410HtSgZaHhPa
	5dijAhRG68h0sx69n216OGYbfFj19HovLdHGQZ2+IrThI/yy2oq1
X-Gm-Gg: ASbGnctISEg9GYg7/lHyMvv6qPFBQP1nIynfoNEL25RdtdmHVFCNQ+bBgxxrpycNflb
	I29FZhdTV5KCcMEWuQDSVHoHD4zeb+mCoF7n5mYwqoRhbGIHk6ETxJ/LBoKEz/IgJlueSvjygQb
	nNEIPM+9bO7RmHKiIobyeVJ913tkhbd3kmvsZB3fwR6t4UaPxne5WPl7+Nv4pV7/T+xP+l05jPh
	WyXxNbeeDMBaaURltphRkzbLnA+jZCUp4s6o2qF0oBMpR5h1D4kZ80yaseMY8FKMsdJiA16aG7Q
	jEhl+47UM/4ABXSxTv4JWmsLeSIyfj5Hdotr0t6vnkfdFqtY83gWd+yENt1EqHlJAsXbwZ2wAL5
	f1epWbDxt5XgMR5In0Iaq4wuv7YAktFHSKkdqalXDdG5EcVElxPD065z2VpZAEMPnFfkMRokDkj
	8re719fPM=
X-Google-Smtp-Source: AGHT+IFq4cWZ/GF6xGipbxkKRa+D7h6dWZTRsoGzCPuvbMMN2SzodAHuSFimNssepCWeypERBTC2Pw==
X-Received: by 2002:a17:906:f5a3:b0:ab7:eead:57f2 with SMTP id a640c23a62f3a-abbcd0bafefmr542280366b.48.1739998986742;
        Wed, 19 Feb 2025 13:03:06 -0800 (PST)
Received: from ?IPV6:2a02:3100:a982:e400:6dd0:628c:981b:2783? (dynamic-2a02-3100-a982-e400-6dd0-628c-981b-2783.310.pool.telefonica.de. [2a02:3100:a982:e400:6dd0:628c:981b:2783])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-abb86c9320csm836912266b.55.2025.02.19.13.03.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 13:03:06 -0800 (PST)
Message-ID: <ea0f203b-ee9a-4769-a27a-8dfa6a11ff01@gmail.com>
Date: Wed, 19 Feb 2025 22:03:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 2/8] net: phy: move PHY package related code from
 phy.h to phy_package.c
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>,
 Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
References: <c02c50ab-da01-4cfa-af72-4bed109fa8e2@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <c02c50ab-da01-4cfa-af72-4bed109fa8e2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_210310_246816_4D717938 
X-CRM114-Status: GOOD (  15.28  )
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

Move PHY package related inline functions from phy.h to phy_package.c.
While doing so remove locked versions phy_package_read() and
phy_package_write() which have no user.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/phy_package.c | 61 +++++++++++++++++++++++
 include/linux/phy.h           | 91 +++--------------------------------
 2 files changed, 68 insertions(+), 84 deletions(-)

diff --git a/drivers/net/phy/phy_package.c b/drivers/net/phy/phy_package.c
index 260469f02..9b9c200ae 100644
--- a/drivers/net/phy/phy_package.c
+++ b/drivers/net/phy/phy_package.c
@@ -6,6 +6,67 @@
 #include <linux/of.h>
 #include <linux/phy.h>
 
+int phy_package_address(struct phy_device *phydev, unsigned int addr_offset)
+{
+	struct phy_package_shared *shared = phydev->shared;
+	u8 base_addr = shared->base_addr;
+
+	if (addr_offset >= PHY_MAX_ADDR - base_addr)
+		return -EIO;
+
+	/* we know that addr will be in the range 0..31 and thus the
+	 * implicit cast to a signed int is not a problem.
+	 */
+	return base_addr + addr_offset;
+}
+EXPORT_SYMBOL_GPL(phy_package_address);
+
+int __phy_package_read(struct phy_device *phydev, unsigned int addr_offset,
+		       u32 regnum)
+{
+	int addr = phy_package_address(phydev, addr_offset);
+
+	if (addr < 0)
+		return addr;
+
+	return __mdiobus_read(phydev->mdio.bus, addr, regnum);
+}
+EXPORT_SYMBOL_GPL(__phy_package_read);
+
+int __phy_package_write(struct phy_device *phydev, unsigned int addr_offset,
+			u32 regnum, u16 val)
+{
+	int addr = phy_package_address(phydev, addr_offset);
+
+	if (addr < 0)
+		return addr;
+
+	return __mdiobus_write(phydev->mdio.bus, addr, regnum, val);
+}
+EXPORT_SYMBOL_GPL(__phy_package_write);
+
+static bool __phy_package_set_once(struct phy_device *phydev, unsigned int b)
+{
+	struct phy_package_shared *shared = phydev->shared;
+
+	if (!shared)
+		return false;
+
+	return !test_and_set_bit(b, &shared->flags);
+}
+
+bool phy_package_init_once(struct phy_device *phydev)
+{
+	return __phy_package_set_once(phydev, 0);
+}
+EXPORT_SYMBOL_GPL(phy_package_init_once);
+
+bool phy_package_probe_once(struct phy_device *phydev)
+{
+	return __phy_package_set_once(phydev, 1);
+}
+EXPORT_SYMBOL_GPL(phy_package_probe_once);
+
 /**
  * phy_package_join - join a common PHY group
  * @phydev: target phy_device struct
diff --git a/include/linux/phy.h b/include/linux/phy.h
index e36eb247c..a8f39e817 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -353,10 +353,6 @@ struct phy_package_shared {
 	void *priv;
 };
 
-/* used as bit number in atomic bitops */
-#define PHY_SHARED_F_INIT_DONE  0
-#define PHY_SHARED_F_PROBE_DONE 1
-
 /**
  * struct mii_bus - Represents an MDIO bus
  *
@@ -2135,66 +2131,11 @@ int __phy_hwtstamp_set(struct phy_device *phydev,
 		       struct kernel_hwtstamp_config *config,
 		       struct netlink_ext_ack *extack);
 
-static inline int phy_package_address(struct phy_device *phydev,
-				      unsigned int addr_offset)
-{
-	struct phy_package_shared *shared = phydev->shared;
-	u8 base_addr = shared->base_addr;
-
-	if (addr_offset >= PHY_MAX_ADDR - base_addr)
-		return -EIO;
-
-	/* we know that addr will be in the range 0..31 and thus the
-	 * implicit cast to a signed int is not a problem.
-	 */
-	return base_addr + addr_offset;
-}
-
-static inline int phy_package_read(struct phy_device *phydev,
-				   unsigned int addr_offset, u32 regnum)
-{
-	int addr = phy_package_address(phydev, addr_offset);
-
-	if (addr < 0)
-		return addr;
-
-	return mdiobus_read(phydev->mdio.bus, addr, regnum);
-}
-
-static inline int __phy_package_read(struct phy_device *phydev,
-				     unsigned int addr_offset, u32 regnum)
-{
-	int addr = phy_package_address(phydev, addr_offset);
-
-	if (addr < 0)
-		return addr;
-
-	return __mdiobus_read(phydev->mdio.bus, addr, regnum);
-}
-
-static inline int phy_package_write(struct phy_device *phydev,
-				    unsigned int addr_offset, u32 regnum,
-				    u16 val)
-{
-	int addr = phy_package_address(phydev, addr_offset);
-
-	if (addr < 0)
-		return addr;
-
-	return mdiobus_write(phydev->mdio.bus, addr, regnum, val);
-}
-
-static inline int __phy_package_write(struct phy_device *phydev,
-				      unsigned int addr_offset, u32 regnum,
-				      u16 val)
-{
-	int addr = phy_package_address(phydev, addr_offset);
-
-	if (addr < 0)
-		return addr;
-
-	return __mdiobus_write(phydev->mdio.bus, addr, regnum, val);
-}
+int phy_package_address(struct phy_device *phydev, unsigned int addr_offset);
+int __phy_package_read(struct phy_device *phydev, unsigned int addr_offset,
+		       u32 regnum);
+int __phy_package_write(struct phy_device *phydev, unsigned int addr_offset,
+			u32 regnum, u16 val);
 
 int __phy_package_read_mmd(struct phy_device *phydev,
 			   unsigned int addr_offset, int devad,
@@ -2212,26 +2153,8 @@ int phy_package_write_mmd(struct phy_device *phydev,
 			  unsigned int addr_offset, int devad,
 			  u32 regnum, u16 val);
 
-static inline bool __phy_package_set_once(struct phy_device *phydev,
-					  unsigned int b)
-{
-	struct phy_package_shared *shared = phydev->shared;
-
-	if (!shared)
-		return false;
-
-	return !test_and_set_bit(b, &shared->flags);
-}
-
-static inline bool phy_package_init_once(struct phy_device *phydev)
-{
-	return __phy_package_set_once(phydev, PHY_SHARED_F_INIT_DONE);
-}
-
-static inline bool phy_package_probe_once(struct phy_device *phydev)
-{
-	return __phy_package_set_once(phydev, PHY_SHARED_F_PROBE_DONE);
-}
+bool phy_package_init_once(struct phy_device *phydev);
+bool phy_package_probe_once(struct phy_device *phydev);
 
 extern const struct bus_type mdio_bus_type;
 
-- 
2.48.1



