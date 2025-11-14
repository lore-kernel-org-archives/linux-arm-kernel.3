Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6928ACDB462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 00:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OAEkeQ8lL8zgGt9X5ptAhWwpyBVXGyV+fHaoeQsAx0w=; b=rGuDVoKmjyl/IIRJ1Yi6eMp08/
	1FCZUjyM225kHjMPUUbZo6HHBpCbF99BMoIcrRURxpSDRv0CV6cr2j3yGTB9vs6Ar+4nRimekWkwN
	s4M/dnb4cjoFregxgIVSQGgG3VLudVLKGm30NWtqpUKDwJ71ngngH7Grh1WkPbDG9gVgPXbKAAo7X
	mFQE5s4cGPvzSd5vs/7i8cHu8KGP6hWVcKdqx0qoOadPrTrSzlcU8UgxZXJnoBjpde/rQBTbU1eXc
	XOQ8dsYEV46YXNU4nrIZgFu7Y3wuF5AoyUL3Zy9EZqqfq37EE8Xzw9r72UKB5/m56OG9QVF790t3w
	G6mQYvUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJhpr-0000000BLEu-3mF1;
	Fri, 14 Nov 2025 00:38:43 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJhpo-0000000BLD7-2b8Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 00:38:41 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-bc09b3d3b17so1182118a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 16:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763080720; x=1763685520; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OAEkeQ8lL8zgGt9X5ptAhWwpyBVXGyV+fHaoeQsAx0w=;
        b=KUajVVq56LYgVa3vMrsTdqBnuAKgqG6YrI+4aWySLrMLxEblS1ha9xJo7wMpN8wHW0
         xAGSKLULcXSBG+EUPNHxA4piAL4lzG4+HCHgRQ9c4HVLc9etI/Sa7982psRv7+ShFb2G
         PyVZVecjysOlZGRTbWvuwgEM3HAv9svvFPHiZEqxRYbzGDm+5RwBrF3Qa0Br7vqsP3ZX
         mfzB0vYYNIak79QqlpDjj6BgKArfyZKDDFwaa3YbRkB2HXAU2q1OVpArOhQTRvFAfHtM
         XrAZqvh3dGw+7eOryEiimawB7LV6HvSUx/LsMbz+n+QjTiiwoItdIiXHw8lKFXFLEE6L
         JfQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763080720; x=1763685520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OAEkeQ8lL8zgGt9X5ptAhWwpyBVXGyV+fHaoeQsAx0w=;
        b=MTW9t0ohniqRF2Yj2GklaDwJyo8ppaN8L4xLYwKzUwtsFDewEUZt9Pqv24ePTIYySB
         +npyl2ABpm9rTsN4mVRQatTAtzHWlT2Hafi1cRM6Hryq14Yo3CDcHMOIdM6JfDVBTv9l
         vPYi3vtzeFZvbvSuVWWujOMQonccT3mv7iS+CjCNm77OsnuntsFPdbZ2yIoUJltkke5E
         NzOXvRsTE9tx9LAY1QkXk5H17R+qL22gvZVGfSduGcQKqdQNdp2pnBInYV+BPGKA6dFD
         thCZE9HsxcS3PqLHkrY+kqcERbNOEcjTKxCUztUkt/ZlVj6H8a2QcoanrK+h70P0h9W3
         FfHw==
X-Forwarded-Encrypted: i=1; AJvYcCXct+dTXLvbOadqFiJKzD63gangBRhXFeW3+J6A0wlJpc3EmFwnCMwbTUbTsgU6DK910uokd0lSaHwWwMUz4C/C@lists.infradead.org
X-Gm-Message-State: AOJu0YwsizW5eW6osjCX91KLZtuIWNS1QA+4tpoXtKmzcAsrlHNPeQbk
	rhcN5zT93IRI0C3Cb0fqPym7w8QVOHDO7WhbONkJo+nBReQUwZ3J1XsX
X-Gm-Gg: ASbGncvP0jM/cPaNY7dDHKLGqHOxkw4yy4DcFL0XTYZUjUxJH1M1g6YitDDMCsvi1xH
	8Zauv6BjWA3W5/kPgpAzsSEcC8osiUyDXFa1S+LsoyhD3xDL3VrvkmQhLKU4UvbfvhlSmksnuK3
	jEjX9oOx4mZJk6RlXOFUiAMQBarYRqiDWo3BA3L+iyNA56kipgpJknfD5CKJ4GuE3TfEQxz1kOW
	V3ZQPz1GtjRq+3qjn7+8NMgwXTDudxbfsTssHbZ6+j1MFPQ+F+9oh41td8Pd4IUYADV1yyuZssC
	2Dp83a/yMlcUNE8HDRx3fudRaKQsvB4VPOiz3O6spodH70nRFGlU31In/LXYXd7Biy5pFf7M8Q4
	tijdd2Ig/um21bhYw6BjaZ8YbEQudKGDMLhbXObUDRo/lXfusvLKCasztyWgJkpx7il/EiUZOq9
	QYcY3iqkFCEw==
X-Google-Smtp-Source: AGHT+IHhHMFOgdJTCCj2iz3xbNhHIo9j6lyjGd6SR7Dx1GmoSljn6NAypb01axUm/7zVz96HeKqrgg==
X-Received: by 2002:a05:7022:6608:b0:11a:4b72:35e8 with SMTP id a92af1059eb24-11b40e81abamr546686c88.6.1763080719556;
        Thu, 13 Nov 2025 16:38:39 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b06088625sm3368287c88.8.2025.11.13.16.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 16:38:39 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Han Gao <rabenda.cn@gmail.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Yao Zi <ziyao@disroot.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH v8 2/3] net: phy: Add helper for fixing RGMII PHY mode based on internal mac delay
Date: Fri, 14 Nov 2025 08:38:04 +0800
Message-ID: <20251114003805.494387-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114003805.494387-1-inochiama@gmail.com>
References: <20251114003805.494387-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_163840_670120_98ABD9BA 
X-CRM114-Status: GOOD (  14.09  )
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

The "phy-mode" property of devicetree indicates whether the PCB has
delay now, which means the mac needs to modify the PHY mode based
on whether there is an internal delay in the mac.

This modification is similar for many ethernet drivers. To simplify
code, define the helper phy_fix_phy_mode_for_mac_delays(speed, mac_txid,
mac_rxid) to fix PHY mode based on whether mac adds internal delay.

Suggested-by: Russell King (Oracle) <linux@armlinux.org.uk>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/phy-core.c | 43 ++++++++++++++++++++++++++++++++++++++
 include/linux/phy.h        |  3 +++
 2 files changed, 46 insertions(+)

diff --git a/drivers/net/phy/phy-core.c b/drivers/net/phy/phy-core.c
index 605ca20ae192..0c63e6ba2cb0 100644
--- a/drivers/net/phy/phy-core.c
+++ b/drivers/net/phy/phy-core.c
@@ -101,6 +101,49 @@ const char *phy_rate_matching_to_str(int rate_matching)
 }
 EXPORT_SYMBOL_GPL(phy_rate_matching_to_str);
 
+/**
+ * phy_fix_phy_mode_for_mac_delays - Convenience function for fixing PHY
+ * mode based on whether mac adds internal delay
+ *
+ * @interface: The current interface mode of the port
+ * @mac_txid: True if the mac adds internal tx delay
+ * @mac_rxid: True if the mac adds internal rx delay
+ *
+ * Return: fixed PHY mode, or PHY_INTERFACE_MODE_NA if the interface can
+ * not apply the internal delay
+ */
+phy_interface_t phy_fix_phy_mode_for_mac_delays(phy_interface_t interface,
+						bool mac_txid, bool mac_rxid)
+{
+	if (!phy_interface_mode_is_rgmii(interface))
+		return interface;
+
+	if (mac_txid && mac_rxid) {
+		if (interface == PHY_INTERFACE_MODE_RGMII_ID)
+			return PHY_INTERFACE_MODE_RGMII;
+		return PHY_INTERFACE_MODE_NA;
+	}
+
+	if (mac_txid) {
+		if (interface == PHY_INTERFACE_MODE_RGMII_ID)
+			return PHY_INTERFACE_MODE_RGMII_RXID;
+		if (interface == PHY_INTERFACE_MODE_RGMII_TXID)
+			return PHY_INTERFACE_MODE_RGMII;
+		return PHY_INTERFACE_MODE_NA;
+	}
+
+	if (mac_rxid) {
+		if (interface == PHY_INTERFACE_MODE_RGMII_ID)
+			return PHY_INTERFACE_MODE_RGMII_TXID;
+		if (interface == PHY_INTERFACE_MODE_RGMII_RXID)
+			return PHY_INTERFACE_MODE_RGMII;
+		return PHY_INTERFACE_MODE_NA;
+	}
+
+	return interface;
+}
+EXPORT_SYMBOL_GPL(phy_fix_phy_mode_for_mac_delays);
+
 /**
  * phy_interface_num_ports - Return the number of links that can be carried by
  *			     a given MAC-PHY physical link. Returns 0 if this is
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 3c7634482356..0bc00a4cceb2 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -1813,6 +1813,9 @@ static inline bool phy_is_pseudo_fixed_link(struct phy_device *phydev)
 	return phydev->is_pseudo_fixed_link;
 }
 
+phy_interface_t phy_fix_phy_mode_for_mac_delays(phy_interface_t interface,
+						bool mac_txid, bool mac_rxid);
+
 int phy_save_page(struct phy_device *phydev);
 int phy_select_page(struct phy_device *phydev, int page);
 int phy_restore_page(struct phy_device *phydev, int oldpage, int ret);
-- 
2.51.2


