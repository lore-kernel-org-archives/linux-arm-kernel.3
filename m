Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43BDACCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 19:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fpFmHR4jfTSEaAikPpuoscXSDm/TM6wyuINg2NcI21k=; b=ECSCIGU09a28q3BqJIlAbUU/QW
	gY50p4pQIfVa7TPvv+yjN6sEOIzuchYJ69aEE4oL+VWrBEcHLlG4zsYxLlUVCnT9sFHN3EqPrmJdF
	lQJiL0U6HWPCsqXZ/AyS64YmkEUNwiwFS0ec6QDhjcz3KRDEUrz7vErGbmfSgFVcRY6Hc5gd+cP6x
	FxAtRkHnv5sLTygEg+MhnPI2yKj7PZFs2VAD8Di/bwtvJCe18WCLBqGCjZTmOCYuVMligmE3YpQIi
	hxI2RrMxY72KbnKXcdYlqKo3WL+5TP9mHjI2d3HS7s7YZqDyqZPtoJzI9Kot6tlCWQ+kZYe9RT09e
	j4+knc3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9qPt-00000008rBC-0USX;
	Fri, 17 Oct 2025 19:47:09 +0000
Received: from mail-wm1-f52.google.com ([209.85.128.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9qPq-00000008rAP-3hRK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 19:47:08 +0000
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47106fc51faso25284745e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 12:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760730424; x=1761335224; darn=lists.infradead.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fpFmHR4jfTSEaAikPpuoscXSDm/TM6wyuINg2NcI21k=;
        b=hNBUAZHB2MO56ivzsSkwr5JurhrxAfk5YiXgwy54hL4BS2v9XJo/1tTZ/Tz/WnaC0A
         PaIx642ypt54fzQboFJDcvhHaFyYjEo6Qnl23XHU9zwOvtU+8Fr0wU6l/svq3GVRpQoj
         aeiAgrnzoeaq1qktauoewdDbhSKdbnMu9RPAKMxwArt2a8aT2uU+K2gfpn7WSxSnlGbv
         4U0ULBAl9C2nHIzEC7MpcWCUBfq6CcXn2Qp+6TsDUe+rUkffYsI/XxFEa0IYg9YoKHEX
         xaoLhi5SjraVJ+hNhm9iqPj0jEyxP21CPSH9xyEUx3KwL07UJ95yI3aVvKnjC7736SJ2
         irwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760730424; x=1761335224;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fpFmHR4jfTSEaAikPpuoscXSDm/TM6wyuINg2NcI21k=;
        b=ghqRmS4zmMQBckBEugFLB5Ivo5Ot0WSsTJMw0AoGq/wzVwA/ZoRzPcBRoLvG3WCgRM
         42VoOqAlb5NrgkrcH3NvrhKurxUuug+J3sxc+3V00+cSXyHSPyARWlr6+6zSajNh+x49
         utqOPjqVHicNnpmX+ImgMQiPnnpMN9pq2B7+fQmCYpBJEebpEQ4NyUzRJrzr+9OgoEDH
         uHpdkqnPSz6aqLPDapwXLpNHIysMK4+thbjK5dYMHtAT+b2wrTLyIRtL8K1YVJ40dSg8
         eu/BGimMYFp/bkg9UA/7ct95kckFXGGoHwaJindpLXiHSXKpwDiIMxeB+spqjoAq/MpS
         R0WA==
X-Forwarded-Encrypted: i=1; AJvYcCXCWpgdzNeYNLpBBJKAhv59F/k2E0olWYnXCtiqm5Lro69ZCNrCbzssWfSH3uovvPMmOybXOP3vEweG+LrhQE+W@lists.infradead.org
X-Gm-Message-State: AOJu0YwS+15d7iyJXS4jPasIg5RIp8TG3rhZF1F6R07G2pNaH9qsA/2h
	xUzPg351+/46pN1bDcYLo2OptNWM6DQUWQCkFTgihJfbRWUt+C/oJbvD
X-Gm-Gg: ASbGncv/S+H6cJoSyZM6Lu2TWZVctUGNFhOHr0TonQWtuh2G8IUAaHTgGLBZCAvSnyK
	B45vT3Tak3hd3Y0G0s/XiwzGzf12NXbZOBSyb17GncWZWOL3DHDaponHo5kaWWAC9NCx3cqL3eK
	M8JEqyWKe0ZggOOqDTsBwU2vcHvX31z7pf4nrxkuZTyuU6wyRQ6hRsoOyBf/7NDYUk81DqGZpNs
	Nw/132Ovke5Ur7QzJ9VahP/d/TTHco3ahr4SUa4jMK2eVgFP3jnIPxywnZpEQ8cylN3bMekdLna
	GFdI0+oLnu+mgXe6BhfsKjrLKj8kK1BHEe9N6JibVeZujl28MXA4GnjXLokWl2mHhPCtKIedZXf
	rgcuNodMrlg5Sha69QzAU+xJfyCVOikBuqiUDuw2bmoNwg3ZI0f9RzyNTAjOfGq+YOPz5roXTpr
	/qia1H3kgLSc5G26NAUvnbfGiMcWEYVXydOSTS7repV/NOE/oNBeIXiMpdNxqYia4QEjbm82E+W
	sPOj/YyZKs980yUqVZqFxLW0ugC+6vEihs8jWIdvQoq2qiG3x4rCSiBUg3eIQ==
X-Google-Smtp-Source: AGHT+IFgYFTAf0MzqjYma1mkQBE9Le8kxiaOfctfqcBza24VOcsw2PISP6F4yTTlo7gRo9UJKpOB6Q==
X-Received: by 2002:a05:600c:3ba1:b0:46e:47cc:a17e with SMTP id 5b1f17b1804b1-47117870544mr42375215e9.1.1760730424307;
        Fri, 17 Oct 2025 12:47:04 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f33:9c00:f581:27c5:5f61:b9b? (p200300ea8f339c00f58127c55f610b9b.dip0.t-ipconnect.de. [2003:ea:8f33:9c00:f581:27c5:5f61:b9b])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-427f00b985esm845193f8f.34.2025.10.17.12.47.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 12:47:03 -0700 (PDT)
Message-ID: <2a4a4138-fe61-48c7-8907-6414f0b471e7@gmail.com>
Date: Fri, 17 Oct 2025 21:47:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
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
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next] net: stmmac: mdio: use phy_find_first to simplify
 stmmac_mdio_register
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
X-CRM114-CacheID: sfid-20251017_124706_953663_DE1DFE90 
X-CRM114-Status: GOOD (  16.88  )
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
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c | 53 ++++++++-----------
 1 file changed, 22 insertions(+), 31 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index f408737f6..860ed4aa6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -584,7 +584,8 @@ int stmmac_mdio_register(struct net_device *ndev)
 	struct device *dev = ndev->dev.parent;
 	struct fwnode_handle *fixed_node;
 	struct fwnode_handle *fwnode;
-	int addr, found, max_addr;
+	struct phy_device *phydev;
+	int addr, max_addr;
 
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
+	if (!phydev || phydev->mdio.addr >= max_addr) {
 		dev_warn(dev, "No PHY found\n");
 		err = -ENODEV;
 		goto no_phy_found;
 	}
 
+	/*
+	 * If an IRQ was provided to be assigned after
+	 * the bus probe, do it here.
+	 */
+	if (!mdio_bus_data->irqs && mdio_bus_data->probed_phy_irq > 0) {
+		new_bus->irq[addr] = mdio_bus_data->probed_phy_irq;
+		phydev->irq = mdio_bus_data->probed_phy_irq;
+	}
+
+	/*
+	 * If we're going to bind the MAC to this PHY bus, and no PHY number
+	 * was provided to the MAC, use the one probed here.
+	 */
+	if (priv->plat->phy_addr == -1)
+		priv->plat->phy_addr = addr;
+
+	phy_attached_info(phydev);
+
 bus_register_done:
 	priv->mii = new_bus;
 
-- 
2.51.1.dirty


