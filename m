Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08705CCFA07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 03:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j4QTOT55+/ql6/pjv059GwSZ6Db5fZXYVpPWy9XubXk=; b=rJMeiTiec8t5v9rg1CltJQf4ap
	E16++RWYmtD8rp8XYhPVxg4R12N7wAA7kDCZ+eso+CPqmaktmjcCkxjdmIdr6sV0k5CibWW/ebZLF
	NyM1b5XOcxWgx2EQ+Nd+EA6shtXK492br27cW/L44OHOfcIDX0tmg20GfAORR+cX5nRnzIg2kRjpN
	p+eo/g7qtwFcP18dzluYEOXnKT7z4o8+2SzUGl9aRuveNxbql2UrO1TTMBaLADdWanCCLozaHeI4U
	MnDtXMhEZELfBgyO57chvwBKJU9XBGBa8bVbD0dC6Kck6NKSrD8VebpFx/rjxcYcxRQCMtnEU0o0z
	HIcPvpQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFktI-000000096Df-0fSH;
	Mon, 03 Nov 2025 03:05:56 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFktC-000000096C9-1206
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 03:05:54 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso424503b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Nov 2025 19:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762139150; x=1762743950; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j4QTOT55+/ql6/pjv059GwSZ6Db5fZXYVpPWy9XubXk=;
        b=W1tzYtBqmB6W1veD8VtKNjKUtF8uJ+hG943Zg+UtzT/2tr5YPfJf34B2sf4Q0UQmNq
         ha8yp0OwNZpDWvPKd5qDmBj/Y5w4YO8iCjzl/HJf6xufMueK00uGdbXHApRPb4ZcwQAG
         lodRX1uzCC6SZy0uDaAeMZQXhiIv+nRCgemV04mN6f6JnVXh+vqU/FYN9vQCMDHhQl1m
         MuCMdfRKU7HOGJaDvC/N7vw54VU0aT001R80xJq/HAoPxlbe4dByVi+lePV2FbGqmaG5
         /YHV/xR9/7vbSTMtqEaSEs1K4Dzvrgcr/q8gJ7wtn5koRlH/fXRFqMWACuHfoY2IESyA
         7mCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762139150; x=1762743950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j4QTOT55+/ql6/pjv059GwSZ6Db5fZXYVpPWy9XubXk=;
        b=k0XS+67JQ5+Tb9AMFooMBXstkRHN2QvPDf0msn/DTieKe/Qbk5RN9r5eg8K6a88cyz
         p51lNBw0cQ0k5XFpRLG3PfUevuQa+49x5uBnq9jiEjkch66nZnSkrof0WJcHomcf3AFJ
         jiMuVKbqup5viR5qunMId9TEzBTfsSEB7Rln4kBMvMccL0OkeGiXNWXYfChYoF2m7xNM
         vDGTsJdIFhmsRciuzjZCgrJ4FfxB9ZIAQVPJlQYWy3aEtrfqAyAt8h+Nn82Ux2bKxJVR
         qkhIEVnQCuRqpUwoKXyQ/SuoHVtkx71nth/aDXhsZJOlanGBtR4Z1DhYM+rC8qcWn9el
         Llfw==
X-Forwarded-Encrypted: i=1; AJvYcCXI90Mh9jqSmlWJKg67ug5kX4dqYXp4/Olvfu4YJxV+p6E/rOKknMYkRPy0+5eBZtzvuv8iiF3nE+RGUG6TWpSX@lists.infradead.org
X-Gm-Message-State: AOJu0YwMKjuWGzLWyPnssGBb03y1z7YuJoYFOTNum5P4PXHK+XC7sksS
	Rswvb8gE9pkGOX59CKcj9KkjXIBzUSm9JEonp/xQaH+qkYBqQUi6bQh7
X-Gm-Gg: ASbGnctE0TZ5ETO4AI0/YytMaD453YXhMGFDJD9KGNNOCaYNphmI7n5EPgLaNUdSFAp
	MkMWR5q1Us3whIfUGBdn88gphINN9+J/81Wyv06wgp5BsVT2gpC+ya0MMdQBRwxd4TcedBBv0bT
	SSCD992/JNd28rgr/3tgpkobSM3mN7Ohoy3gTVl3m+dEHYqY7l/m42PIu8m5XWv5Bs1Ug49Dpub
	8SvEekT1OR4t00571TywxyHkdBOtN3eS6llWxTPJ9anv/NrmnE59cPROTZYuJyxDdheQLRjOO87
	VFTAN4khz0HxYhQA0Sjxm6gaz932W+VD9ChYnSC777Jjnew8MW2UmqqfJNHby9nBjiYesMKzYjs
	VrxJ2G8kjCO8UBjd6G6hG9s8f62wqDhkIura4rhCB7mIm3SK9qbIMT1poSdbtEMNu7cm8U/mEdS
	8=
X-Google-Smtp-Source: AGHT+IHUj0n47h7V6n+yPrS3AH7Tk+MT/zDMbn/+1x+Z1nt4DmkG8sgKVizJiB0cJZx6/5G2TiyAow==
X-Received: by 2002:a05:6a00:398e:b0:776:1c49:82f8 with SMTP id d2e1a72fcca58-7a777a489f7mr12266459b3a.8.1762139149548;
        Sun, 02 Nov 2025 19:05:49 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7db197335sm9410788b3a.47.2025.11.02.19.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 19:05:49 -0800 (PST)
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
Subject: [PATCH v6 2/3] net: phy: Add helper for fixing RGMII PHY mode based on internal mac delay
Date: Mon,  3 Nov 2025 11:05:25 +0800
Message-ID: <20251103030526.1092365-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251103030526.1092365-1-inochiama@gmail.com>
References: <20251103030526.1092365-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_190553_455786_87832A59 
X-CRM114-Status: GOOD (  14.27  )
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
index 605ca20ae192..4f258fb409da 100644
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
+ * Return fixed PHY mode, or PHY_INTERFACE_MODE_NA if the interface can
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


