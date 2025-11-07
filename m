Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E43CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 11:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OAEkeQ8lL8zgGt9X5ptAhWwpyBVXGyV+fHaoeQsAx0w=; b=f62cZrjYMxuUiKER5YOYdlqSG2
	cWC4wlvl4nBFEedqHPbF5vHe8Iy9F1yrE5/c9JA/En1u4YRF+E8YTXFvacXyTZLaxZoi3zWbboKXm
	CEvJSkZuxoL+kE5dt9kNK+zmulmdDfvTMmi6jAdYd6x92r2AhXtNAojbISJh3pqrfC6Xi0NI0z6Sj
	YxBMmqTsz75FcrEErlj70XJHN2usLwdEK2Wa+obEfM3R5XfbxQSC0eyWx5HrUQqWksFJRQ01PMR+g
	pV89Q01Mngjp3D51ethLG9m3qIILK9E3X7Hf1wJxaLAFqC8tPxpE8W2FwngbNhczayUPRZJiSPZC4
	2ewq0+RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHKTS-0000000HBcH-2Ui8;
	Fri, 07 Nov 2025 11:17:46 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHKTQ-0000000HBb5-2uYg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 11:17:45 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b55517e74e3so590433a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 03:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762514264; x=1763119064; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OAEkeQ8lL8zgGt9X5ptAhWwpyBVXGyV+fHaoeQsAx0w=;
        b=MhWllON4tvB9fU3J+KfbobGsnt6WcWbQusEa5iQw0As2Th5DqFO18G+8qOOB+Ri4fw
         zrlOZSn2+X1820rJsIF5twf/pccKSYMIVkktU5Tq3rlyR//bVj8F+dcTPvNnBRwcPOMx
         zdd2FScZSthka8AEuYy/TkCOx+e5RFHYM9kw8Y7dlPVtI5nvbsxL/XGisUln/hy5+Kk7
         +pKKgFgUF89eRlOPFpUI34nXUyRSoSaUrV4c7wgmRTtznO02pjhMMRek26N9Ukx9T+39
         eUnVXvjlb+9qYmpzn7+BlpQzQVyfFKHBv93i/VgIRoUXAzN2lYoxqWUrYFZBnedggr02
         pnPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762514264; x=1763119064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OAEkeQ8lL8zgGt9X5ptAhWwpyBVXGyV+fHaoeQsAx0w=;
        b=BoXcr3ZYxmCum/akfcWrMOz+N9yZT5YOzn6KpQ4GEEP5zJedEPfJ05KHW9dhak98Yh
         1z9HxyMrbPQSGkK+8fWGc5Vw6yCR7kALZG5Pns8L4GN9XAKxk2wwcsNRh8X4MELe9zaq
         0aDtzqMUSBkiIFade3kLhbKUVQEuj5u/vYEQB9e4aA83divqCTcFa4n0+9Nu1PN0M0M5
         rZl/UPmefTq81yDUSgLY7O2U2OORrVSX1TuZK+vaPWwTg09WUJLurtfxla4tqpWGiTHG
         vaT7gx37oIQxF1IPkEmtRfMtNkG/Bg+jFLhxrylXHelSurD3Gv0vRld0TntNfO9Vepmx
         zT1Q==
X-Forwarded-Encrypted: i=1; AJvYcCW6Ud6Hdd5ndTee1KPnvQw2tXcdadpk8HHWHZBwtNlRPND5BgGRK2tLOuAuU8oo1iXeRhlaBVCE7hjjMFEKJ/om@lists.infradead.org
X-Gm-Message-State: AOJu0YwFrjuyBvs3CC2SPcUX0/g4vAe/Ix76G7V4LYVAcG50q22881AC
	/weQ2hYLhWlHes5XJe9LbpcZ1uc7cqW7HbwHzM9Khi2n8D1CzevJMWrW
X-Gm-Gg: ASbGncvdm7/Vlwp/gOQhpJRgz95uGCuO9DFpC/IlOcPHufxYFZYhZaPZT07PNVBkAo+
	0D+G4YmV8qAbIGR1oQQ2QiIbY+Uu9NBrbCs1Jsr+q+joh3YJIfLW7SB+xr1i57rKGdsxier4ILo
	SfE70TXBMEZ+ww1SlIzPHw4ywBrvua2wnIhxzXnwPTpHRYjLTKOCE6joqWIzQymCd1GC4fjg57e
	bcXZydS0ve6AYGWZ5bPaB/fkE2WHBeg1a7DDiRqQhz8CD4wleKJR6ue0J4HJXAGxozTVHf280yd
	OBKPxObsgr4l0Enj2wd9lrV5gEjRGch8vUAYJzQOfZo7q921up/JQPiwFnlkHUDDY4Hb45mWMxS
	7r7B0J5VXJysuxs27qBeAwSklpNKUX0MJPkjk0hEJIsa9PWb9XfPYzNU+PKcltqsQK+Sg3G4ExG
	Q=
X-Google-Smtp-Source: AGHT+IGmhW4l2QYXug4vN9BCUJXlqsiwbMW15g9DF995bQ1tw6dyuhIw+sFYeLzZjXJTBAXyKbUeTA==
X-Received: by 2002:a17:903:1aee:b0:295:9db1:ff2b with SMTP id d9443c01a7336-297c048e371mr36463155ad.57.1762514263694;
        Fri, 07 Nov 2025 03:17:43 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-297d766efe6sm5186215ad.49.2025.11.07.03.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 03:17:43 -0800 (PST)
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
Subject: [PATCH v7 2/3] net: phy: Add helper for fixing RGMII PHY mode based on internal mac delay
Date: Fri,  7 Nov 2025 19:17:14 +0800
Message-ID: <20251107111715.3196746-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251107111715.3196746-1-inochiama@gmail.com>
References: <20251107111715.3196746-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_031744_739376_FF7FE693 
X-CRM114-Status: GOOD (  14.17  )
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


