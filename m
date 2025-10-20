Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8FB2CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 09:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NAetlB1rfruY8L6GWaLiiP+AhNOGwi30zR6SQ1TQ+GY=; b=r4G2CfdRW71/9CZnrG5ctSsgPM
	VYLzhx7US01nYqHYTbjOjcTgtJDc8iMHlIj8HqrcruPMv9mEPm5g6OE99Uj8XZ5pXLfCOZAhGfAnb
	hdjJ5YuQ0xm5Dj2jXe1mWaLS91fszi3eRKdt+eMiQuEHysAD9tu4uUU5jHFHUIY7ZNjRXGxdub161
	OcIGq3chtQzzDy7yH1AQDzhCtRB7wT7docfN5Jb1/DVPnHnFrgo7k+K3AfUnxI2kNW+/RaCE+qZX9
	VcTc1gRn5aycLHbhD6jWCiOiv8tUxKAoGClq61D/IUKuXp2yDPk7BTtN4wDW2QAtkmWvIqSB/iLNe
	sln+UaVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmct-0000000Cg5a-0dMA;
	Mon, 20 Oct 2025 09:56:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmcr-0000000Cg4Q-2e5n
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Oct 2025 09:56:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=NAetlB1rfruY8L6GWaLiiP+AhNOGwi30zR6SQ1TQ+GY=; b=HaHqAH5Lpsvr4OGipgIRVHpvEv
	7ictgwEXjml0q0QOkPU7yOG7HsX1hTrFbO/2Pvno417YkGMOMJCMajNWaQVlc/g+HumX2CFGBFBD9
	V+J+B2zHFou3wnldt/n54ZqhXvKGPCAvlSZ4lWwEOD6JjCus9Wj8yq+HAOqLTXZ0y8RDbae4jyrEj
	aXI/WkXDxFsjEAWxisBGWAqXqcIPjOc5eA4/VHM5kTKUBRn9YzDfEXvA2+EoHV8C0LMC00tW+vPPc
	FYW9mGxgKvxtZeoU6hoyzjeNbYpS/NX5nf5FDOVwXj4dI8JsRCG31wH7T0W1JPK1dalaLIZ08bPfe
	kXPHqyOQ==;
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmcj-00000009h2Z-0Opu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 09:56:23 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-339d53f4960so4197871a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 02:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760954173; x=1761558973; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NAetlB1rfruY8L6GWaLiiP+AhNOGwi30zR6SQ1TQ+GY=;
        b=jpv/7g4xur3437kWfrPIoMcuWPfkO3dHkAWhv4C0ohaXkjP/tHBRck7aUVdYr7sLr2
         LmiPm9ETLRJ2+U6BEHPp1anpGCStCBMcI/wLDfOTI8O55q0wvShnp9IqAhpZ5dt4lw4T
         IocasyzwTJrrfk03S37IoWhd0i9y00P1S0t6PKYtmBzdmFGj0PRWWOwFCoFhUCr3PCtn
         a96dfxA4UHAyKWVFbQkzXgnroVdZQAnXT27VUkgoRx9I6KHsDzIciAezRwASm0RzpYK2
         6SQi/IPJNc8wswSIYxCVWT4hmd48gAcJZEZOGVLmw5nK87LSemlGXocUV1z3pyOXZMEf
         ZMZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760954173; x=1761558973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NAetlB1rfruY8L6GWaLiiP+AhNOGwi30zR6SQ1TQ+GY=;
        b=EfjqXr/QZEGPQqeT6/rOUiL9g3o/Tmn+K7ww5HZ4XKTlL2WCUFSDqKf/I3F6hPAHQ5
         7WQJrm78nT8zE3XKcT03c8oxTYthEudgWvaKAVIOgKBPBHXzUYzuqBPvmLtoFjkOuZDv
         v3znDq+rmzACn3H7pDfdEiHiBbMQxAaDsLqoH3J6tFIgXLGJxVd8oARkiRnX85+FhKAk
         jBX8ksGanbqmAW2JicRCTMp249iKj5pE/fWMt0zqmD+jwaStt7wXZmPa4fzbcH4YgWCQ
         7/DpA3uedfiXo3mD9KIacyhwaW6yOQ+sLK5c07SMd12NW9k44bDjTk5KHE1vR+ntJsWt
         UAFw==
X-Forwarded-Encrypted: i=1; AJvYcCUvV5oSHSgGA3H1VVFdGMKfy1NBd2H8k0Ds27nJaeC/omC+R7If2q1cSMkiEy6Q1JQddeb3M/4q5+DhixTznlKm@lists.infradead.org
X-Gm-Message-State: AOJu0YyEkNB8ibyqfIsgCN19P4NrfGa7vSgL8CT8aMXcfEbkRDPiHRfZ
	o7cVPN6boOTEG/eyijAa6nyeqxIoekKA1W2yCJgHxDvcYvA1BoLhcmeZ
X-Gm-Gg: ASbGncturEfqCGXXBBd/Ybbnmf6eQzoyWZglcE6itWX2cTMfpVN26lM57mBFeNtE7fc
	HVT41oyx+2w3fC2qRyOCFy4VJuW74zzpGM7SSSFL2b1dxSl4wbjY4oe/jeXt11BWDdtYni/+PrK
	5tfeX0hVcaYurlYyA/3k1YsGfogTEfvFPDTL6OMC4i2jP2LimmcHZJ/iT2QW8dQ/67g0X2ys5Cz
	Clln1SI93XxHeZO8samdGHObmpP74BIUJPnlgm/m50tpysVIjmnJyoLmztixxupFCYuR65jVcBv
	Et3iN6PFD9U5XjC9wKX8pRziz23xXvdAQz3xXEMM6ag8a5eIOUsARWyCg/bRKmtAl4TiC46R0nw
	oET4lg+yxXJ4bcIiKsRxeLtczVcy0BodtWBtN9MGlO+7IRrG+Q+EcFJSbNBDMR2ANshHBGFOcf6
	dWkIHpaE8wFg==
X-Google-Smtp-Source: AGHT+IE7zVwzQMhb5BY4ayD1uNx5wi44qB2+5gan5ZQtQHTnM1ourkvH3ZfDn2OiMchcyVMlnamnPg==
X-Received: by 2002:a17:90a:ec8b:b0:32b:6145:fa63 with SMTP id 98e67ed59e1d1-33bcf860229mr19877507a91.4.1760954172663;
        Mon, 20 Oct 2025 02:56:12 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a76b33bf3sm7265996a12.19.2025.10.20.02.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 02:56:12 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Han Gao <rabenda.cn@gmail.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Yao Zi <ziyao@disroot.org>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 2/3] net: phy: Add helper for fixing RGMII PHY mode based on internal mac delay
Date: Mon, 20 Oct 2025 17:54:58 +0800
Message-ID: <20251020095500.1330057-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251020095500.1330057-1-inochiama@gmail.com>
References: <20251020095500.1330057-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_105620_471658_F7EEF402 
X-CRM114-Status: GOOD (  14.88  )
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

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
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
2.51.1.dirty


