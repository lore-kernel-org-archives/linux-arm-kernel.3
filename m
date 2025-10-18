Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67120CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 18:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0kl3Mx2HvT/QoI67STS3Sg7DwvWfAvzZyZD001INcdE=; b=2K8ykotP6J7/GXwf15yv33cXjt
	6FF7UOGALTD8gXLhDh8nC9QLrGVxmwwpypl4I8SfefO7E9//QDHA3qzYcObKMZSj4/XyFxuemT16X
	re4EJl7ahVkQ/Nj4g58jQ163DbEC7NptzcjQimyKq0TvY1xeKVEX5muOwhNtLwOzP7Q+w996Dpa8c
	ZlPkzZ6nMuhKQ3xkv8pY4/tQcBTbh319T7Fb2Zf0hVpLp2B/sAObVnqaMOIv+Uvp/sVjYbirtuKU8
	TySqK/KpgMQklZBHyTOIO5RYptoaesl+w8Oo/yc8RS5YjPdTX3IDB/+6hq9JkDux7puctOFUWq6LM
	JHM7w3Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vABy1-0000000AJlM-06Zz;
	Sat, 18 Oct 2025 18:47:49 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vABxx-0000000AJl2-32YG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 18:47:46 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3f0ae439b56so2224645f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Oct 2025 11:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760813263; x=1761418063; darn=lists.infradead.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0kl3Mx2HvT/QoI67STS3Sg7DwvWfAvzZyZD001INcdE=;
        b=ZIloAzPBpzWDqamLaKq/VzcSKEomk7LGcZ1HOM3ytmQKJ31NW2OnoCkxqVHq+z87vl
         emQ8QX0Bvaw0ahhmfmMexs31wyY/VZxRaEQtKE1/aQpdYR+6tJEyaeLnhKd8pCARlDy0
         HHMzHYYjT4r8tjcRrywAbYcVO6+gvPMEBNvCKrgRDAQ37rrgqW2PQDpIDCucUoYzXtPk
         JqkT3cs9jsjyghpYbKZUvmQmTsWs/kMreS+z2w5uki8jOzOdzX6xfUc8KJHXTQS0kUwT
         ukMjbkCsBIkMTyHxQyu3fwU5U2V7F6cw4KP0VSyod2wQTdJcYN3mGeg4JK5B2md6MhYD
         bheg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760813263; x=1761418063;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0kl3Mx2HvT/QoI67STS3Sg7DwvWfAvzZyZD001INcdE=;
        b=Lzmst+OQ2sZ1ff4qHy7Yj/0ooRpcrz1F2j2FYHka8sdUDQMF29cz0zosuVi3b4TZwQ
         HWDLz5fejSE8Mnv1tJDsv/q68+am5P5sfy72PcpW/8DqZGraCjD2OEipEJn4NoQtiE7z
         LwPiNLFSSzAOaYYc0irjD5OCFaS+mDdkAOZQvM6sH1v80agsfu+wklzcZ5WXdzrhbPxo
         q3qMEsjZ5J3OwntNmIH7xDcVmpkmbgKB9ItTQWMy5BckTeN0dIr6PUbWWYWBgRrFoqVM
         CAbrZ93UqjZv0qdpCp4SpS0NjBJVp6v+9rwVAJYoR25xiJouIjEq9cLm1DMRT4RWM0IU
         QoWw==
X-Forwarded-Encrypted: i=1; AJvYcCWavkij5RmFBh5X9OMUD82ef1oulB5R+HmU5hpecfbL4jOw15gBfvnVqvaZ8mtezYK+lt2g92llIh+Bv9o9hKMP@lists.infradead.org
X-Gm-Message-State: AOJu0YxVshC8k+s/n6TSqX4RVz9ccWFrac1f65A6RmkL5G8wacdGFqi7
	a8HTV/jKkIBElIJTzffQruCALOzRHrZY6TeKnaiNn9vH0IsgxxBSIGnF
X-Gm-Gg: ASbGncvj1x/WQ73XXvhlKFobWSP83Ch1UwnKCWjhROh7sFSAkAksRfAq933AxJzlDWa
	03/ENqFrisjbcObXRgOm129458hSg2i4Zw/k3KNNFN9gfqVgzCjz0Oikt6THM5nQgs5jjyGDDup
	l5GJxf59oTKiNAzJOr5WWUkU4cZJvi6Kzv+zIE/Z0cwS9rckhftxYXWamutP+IFjJPi+Dgyd06i
	AOCGeckpwRi5Lf82UbjU05CrQEBD+Vh0ZkCEGRXq918+pn9VgatniLUSxfwBEAD2vdryjDYZhVF
	5woKdrFU7vzoFBegS5C93oIgrqUZEQ4uFtu0mwesjhoks98ku7MKmRS8FuIekOJPVoKaXc3OB+h
	p1Z3IN2BkDWKw7fSrEvUplLlSAuJMK42x9/OQ38/LLcmYOYXuuudh5D816TGTNkBlyAMTqUODhU
	vJNjBnTckVPCCvN7S07IBtlSxfEaYMNnmNrAWw3bkTprrojcwRpc1j4yofZxwQIoBNO7SM5jonk
	9gcMd9hMYfLTCEyExS7+8/muezXQJabchOOiXnmUZugxWQp
X-Google-Smtp-Source: AGHT+IEbAa/zOXLabrZ+qh6MAEL5ItK4Yz5rziepaw1JNz6ok3iwkgjKZoHptDm8DDaa0bcutQjnVw==
X-Received: by 2002:a05:6000:22c6:b0:3ff:d5c5:6b0d with SMTP id ffacd0b85a97d-42704d497eemr4599806f8f.4.1760813263349;
        Sat, 18 Oct 2025 11:47:43 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f04:d100:f060:eb:b826:a912? (p200300ea8f04d100f06000ebb826a912.dip0.t-ipconnect.de. [2003:ea:8f04:d100:f060:eb:b826:a912])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4710ed57cedsm76762975e9.2.2025.10.18.11.47.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Oct 2025 11:47:42 -0700 (PDT)
Message-ID: <20ca4962-9588-40b8-b021-fb349a92e9e5@gmail.com>
Date: Sat, 18 Oct 2025 20:48:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2 net-next] net: stmmac: mdio: use phy_find_first to simplify
 stmmac_mdio_register
To: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, David Miller <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 xsFNBF/0ZFUBEAC0eZyktSE7ZNO1SFXL6cQ4i4g6Ah3mOUIXSB4pCY5kQ6OLKHh0FlOD5/5/
 sY7IoIouzOjyFdFPnz4Bl3927ClT567hUJJ+SNaFEiJ9vadI6vZm2gcY4ExdIevYHWe1msJF
 MVE4yNwdS+UsPeCF/6CQQTzHc+n7DomE7fjJD5J1hOJjqz2XWe71fTvYXzxCFLwXXbBiqDC9
 dNqOe5odPsa4TsWZ09T33g5n2nzTJs4Zw8fCy8rLqix/raVsqr8fw5qM66MVtdmEljFaJ9N8
 /W56qGCp+H8Igk/F7CjlbWXiOlKHA25mPTmbVp7VlFsvsmMokr/imQr+0nXtmvYVaKEUwY2g
 86IU6RAOuA8E0J5bD/BeyZdMyVEtX1kT404UJZekFytJZrDZetwxM/cAH+1fMx4z751WJmxQ
 J7mIXSPuDfeJhRDt9sGM6aRVfXbZt+wBogxyXepmnlv9K4A13z9DVLdKLrYUiu9/5QEl6fgI
 kPaXlAZmJsQfoKbmPqCHVRYj1lpQtDM/2/BO6gHASflWUHzwmBVZbS/XRs64uJO8CB3+V3fa
 cIivllReueGCMsHh6/8wgPAyopXOWOxbLsZ291fmZqIR0L5Y6b2HvdFN1Xhc+YrQ8TKK+Z4R
 mJRDh0wNQ8Gm89g92/YkHji4jIWlp2fwzCcx5+lZCQ1XdqAiHQARAQABzSZIZWluZXIgS2Fs
 bHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPsLBjgQTAQgAOBYhBGxfqY/yOyXjyjJehXLe
 ig9U8DoMBQJf9GRVAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHLeig9U8DoMSycQ
 AJbfg8HZEK0ljV4M8nvdaiNixWAufrcZ+SD8zhbxl8GispK4F3Yo+20Y3UoZ7FcIidJWUUJL
 axAOkpI/70YNhlqAPMsuudlAieeYZKjIv1WV5ucNZ3VJ7dC+dlVqQdAr1iD869FZXvy91KhJ
 wYulyCf+s4T9YgmLC6jLMBZghKIf1uhSd0NzjyCqYWbk2ZxByZHgunEShOhHPHswu3Am0ftt
 ePaYIHgZs+Vzwfjs8I7EuW/5/f5G9w1vibXxtGY/GXwgGGHRDjFM7RSprGOv4F5eMGh+NFUJ
 TU9N96PQYMwXVxnQfRXl8O6ffSVmFx4H9rovxWPKobLmqQL0WKLLVvA/aOHCcMKgfyKRcLah
 57vGC50Ga8oT2K1g0AhKGkyJo7lGXkMu5yEs0m9O+btqAB261/E3DRxfI1P/tvDZpLJKtq35
 dXsj6sjvhgX7VxXhY1wE54uqLLHY3UZQlmH3QF5t80MS7/KhxB1pO1Cpcmkt9hgyzH8+5org
 +9wWxGUtJWNP7CppY+qvv3SZtKJMKsxqk5coBGwNkMms56z4qfJm2PUtJQGjA65XWdzQACib
 2iaDQoBqGZfXRdPT0tC1H5kUJuOX4ll1hI/HBMEFCcO8++Bl2wcrUsAxLzGvhINVJX2DAQaF
 aNetToazkCnzubKfBOyiTqFJ0b63c5dqziAgzsFNBF/0ZFUBEADF8UEZmKDl1w/UxvjeyAeX
 kghYkY3bkK6gcIYXdLRfJw12GbvMioSguvVzASVHG8h7NbNjk1yur6AONfbUpXKSNZ0skV8V
 fG+ppbaY+zQofsSMoj5gP0amwbwvPzVqZCYJai81VobefTX2MZM2Mg/ThBVtGyzV3NeCpnBa
 8AX3s9rrX2XUoCibYotbbxx9afZYUFyflOc7kEpc9uJXIdaxS2Z6MnYLHsyVjiU6tzKCiVOU
 KJevqvzPXJmy0xaOVf7mhFSNQyJTrZpLa+tvB1DQRS08CqYtIMxRrVtC0t0LFeQGly6bOngr
 ircurWJiJKbSXVstLHgWYiq3/GmCSx/82ObeLO3PftklpRj8d+kFbrvrqBgjWtMH4WtK5uN5
 1WJ71hWJfNchKRlaJ3GWy8KolCAoGsQMovn/ZEXxrGs1ndafu47yXOpuDAozoHTBGvuSXSZo
 ythk/0EAuz5IkwkhYBT1MGIAvNSn9ivE5aRnBazugy0rTRkVggHvt3/7flFHlGVGpBHxFUwb
 /a4UjJBPtIwa4tWR8B1Ma36S8Jk456k2n1id7M0LQ+eqstmp6Y+UB+pt9NX6t0Slw1NCdYTW
 gJezWTVKF7pmTdXszXGxlc9kTrVUz04PqPjnYbv5UWuDd2eyzGjrrFOsJEi8OK2d2j4FfF++
 AzOMdW09JVqejQARAQABwsF2BBgBCAAgFiEEbF+pj/I7JePKMl6Fct6KD1TwOgwFAl/0ZFUC
 GwwACgkQct6KD1TwOgxUfg//eAoYc0Vm4NrxymfcY30UjHVD0LgSvU8kUmXxil3qhFPS7KA+
 y7tgcKLHOkZkXMX5MLFcS9+SmrAjSBBV8omKoHNo+kfFx/dUAtz0lot8wNGmWb+NcHeKM1eb
 nwUMOEa1uDdfZeKef/U/2uHBceY7Gc6zPZPWgXghEyQMTH2UhLgeam8yglyO+A6RXCh+s6ak
 Wje7Vo1wGK4eYxp6pwMPJXLMsI0ii/2k3YPEJPv+yJf90MbYyQSbkTwZhrsokjQEaIfjrIk3
 rQRjTve/J62WIO28IbY/mENuGgWehRlTAbhC4BLTZ5uYS0YMQCR7v9UGMWdNWXFyrOB6PjSu
 Trn9MsPoUc8qI72mVpxEXQDLlrd2ijEWm7Nrf52YMD7hL6rXXuis7R6zY8WnnBhW0uCfhajx
 q+KuARXC0sDLztcjaS3ayXonpoCPZep2Bd5xqE4Ln8/COCslP7E92W1uf1EcdXXIrx1acg21
 H/0Z53okMykVs3a8tECPHIxnre2UxKdTbCEkjkR4V6JyplTS47oWMw3zyI7zkaadfzVFBxk2
 lo/Tny+FX1Azea3Ce7oOnRUEZtWSsUidtIjmL8YUQFZYm+JUIgfRmSpMFq8JP4VH43GXpB/S
 OCrl+/xujzvoUBFV/cHKjEQYBxo+MaiQa1U54ykM2W4DnHb1UiEf5xDkFd4=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_114745_825041_7646847D 
X-CRM114-Status: GOOD (  17.49  )
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

Simplify the code by using phy_find_first().

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- remove variable addr and use phydev->mdio.addr
---
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c | 53 ++++++++-----------
 1 file changed, 22 insertions(+), 31 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index f408737f6..76a87e42e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -584,7 +584,8 @@ int stmmac_mdio_register(struct net_device *ndev)
 	struct device *dev = ndev->dev.parent;
 	struct fwnode_handle *fixed_node;
 	struct fwnode_handle *fwnode;
-	int addr, found, max_addr;
+	struct phy_device *phydev;
+	int max_addr;
 
 	if (!mdio_bus_data)
 		return 0;
@@ -668,41 +669,31 @@ int stmmac_mdio_register(struct net_device *ndev)
 	if (priv->plat->phy_node || mdio_node)
 		goto bus_register_done;
 
-	found = 0;
-	for (addr = 0; addr < max_addr; addr++) {
-		struct phy_device *phydev = mdiobus_get_phy(new_bus, addr);
-
-		if (!phydev)
-			continue;
-
-		/*
-		 * If an IRQ was provided to be assigned after
-		 * the bus probe, do it here.
-		 */
-		if (!mdio_bus_data->irqs &&
-		    (mdio_bus_data->probed_phy_irq > 0)) {
-			new_bus->irq[addr] = mdio_bus_data->probed_phy_irq;
-			phydev->irq = mdio_bus_data->probed_phy_irq;
-		}
-
-		/*
-		 * If we're going to bind the MAC to this PHY bus,
-		 * and no PHY number was provided to the MAC,
-		 * use the one probed here.
-		 */
-		if (priv->plat->phy_addr == -1)
-			priv->plat->phy_addr = addr;
-
-		phy_attached_info(phydev);
-		found = 1;
-	}
-
-	if (!found && !mdio_node) {
+	phydev = phy_find_first(new_bus);
+	if (!phydev || phydev->mdio.addr > max_addr) {
 		dev_warn(dev, "No PHY found\n");
 		err = -ENODEV;
 		goto no_phy_found;
 	}
 
+	/*
+	 * If an IRQ was provided to be assigned after
+	 * the bus probe, do it here.
+	 */
+	if (!mdio_bus_data->irqs && mdio_bus_data->probed_phy_irq > 0) {
+		new_bus->irq[phydev->mdio.addr] = mdio_bus_data->probed_phy_irq;
+		phydev->irq = mdio_bus_data->probed_phy_irq;
+	}
+
+	/*
+	 * If we're going to bind the MAC to this PHY bus, and no PHY number
+	 * was provided to the MAC, use the one probed here.
+	 */
+	if (priv->plat->phy_addr == -1)
+		priv->plat->phy_addr = phydev->mdio.addr;
+
+	phy_attached_info(phydev);
+
 bus_register_done:
 	priv->mii = new_bus;
 
-- 
2.51.1.dirty



