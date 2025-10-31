Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B609CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 01:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j4QTOT55+/ql6/pjv059GwSZ6Db5fZXYVpPWy9XubXk=; b=0lHxqsVACNeUd5ptVucwobB0Y/
	CmJQFvFcGtkhwxpkUi8fds0I+tJrHcDeMTyQwSqkfMPI8zfLWROv++X5fvbmVBtR8Krth+p8DoTV6
	aH5rnV4oCl/E/ptQBa/ovEplqG9R+szsi5EzopcTkZQymxkZCZt1pcMFrnbKDY0pj4NmDNCejs4Em
	PjL6Sr++1pG9UHcTDyKeYZ4lsh2GavWx+yx0nloj52L7pXR9Ebcixt9pMfwRjnqwJz4Izc794U6fb
	5j5T+K2WDt3SyMNJtEgDJB7OdIWG4JHqbJPOQZTawfcOk6soZ4k9u/fHCM9FHjuOI0Kc4RQx6/lDR
	fNDCM6eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEdt1-00000005DzN-2hjE;
	Fri, 31 Oct 2025 01:25:03 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEdsy-00000005DxV-0Y6f
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 01:25:01 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7a74b13f4f8so700585b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 18:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761873899; x=1762478699; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j4QTOT55+/ql6/pjv059GwSZ6Db5fZXYVpPWy9XubXk=;
        b=ms8tybfauMSUfwUhn3vwA0hn4PTlCa/wlBJZbhkpf8NRGzZekOA+sbwhgQuJ5nWqvM
         5r7ee+H15Us5+Laeh0lA7rcXX1ioVj8GO1nm1kNYEWofTB846tJLT3+mmAREp/GlHAlK
         Ndd88oRHB0ZXhHJW7bEwpnVciBJ4mrXky607/6DhBPOLamq1IRdJPSwKasec/kIxU/HP
         7I0PVheJdQZNwLr/UrGIDQs9Is5IWjAt5h6Mx+DkpUxFAp1JgsV+cTW1lIIiJaf+e3GT
         AY83zOE/36KquefkWV+YAbb7LQYfFugb6YFxAgpXbb6fWI4W4Pf7Fe9vHi8Mw9qmkVj0
         ysFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761873899; x=1762478699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j4QTOT55+/ql6/pjv059GwSZ6Db5fZXYVpPWy9XubXk=;
        b=ANLemreiTjZRViKacXFaE3WBch7qfTUR2mAQB6B4kiLcE0jUtFLj/UsJ/kFGSCJEPV
         31Jc8RrHX69YotIzZLqmdCX6vrqJ9aGW51I1oBBVLJOd0EzJpjWq2KyIOqBYUughk39H
         jlCcGaNkCJ6Dy25qzklNXlQg/sWzQkPG13YwhukKUuDr+NQHMKaUuXs6e7LaHimxSXGn
         VjKT/DLMla2ysKpifn0zBPTMmwwVN4rKSV/zUAT0ozPg5X9fg2vJTp+fxuw9Ryzaf1lt
         PJ/cfGFzqvsIBaPzHjGpNElDVAFTs5rV6VZG4uSmNHQMkauFDJta4B2nF3FRjTnD+/le
         Oeag==
X-Forwarded-Encrypted: i=1; AJvYcCVdrgZFUUysy9EdES41SdbO22tK/S/YfKW8fjSnYgIOPangCr4LwigRRoV9rBGMokedA3V1oFkxxlGSUty7wxpE@lists.infradead.org
X-Gm-Message-State: AOJu0YycykS9YWsP/VF+qwk4dyQWkcGpwHMKIXdX8XwRpJSi3PDNL0Ye
	LQfRwRyLH+DVrACvp9ChPpYGv+QmycAX1ScczWe9sPZObM0vcbIBCHP9
X-Gm-Gg: ASbGncsFRjeopGha49xEvMEShLUFoDFMmV2IgFSTR48uE2LGZq7qIkzbckGfZn9Egxe
	7P6VAGUKvzfarb7cM/FGf9sStDBrY1pDWebKGEap2KffPVzqZkaE2PEFh8VynIzgDUKG6Uyuswf
	WsY0hxhVz3E4Rpp1avAbVMwiRoPbRrOCuQNanN9pUC7JsAXBtdZHuxxsn69nByhoqE38cSRBr3I
	HENtzCvPSPznAI0Wf0P9zFFtueVKNaxq0x6XtJuVoXOWBi+27RjPZcNCc46FcqwK4Lxdlxn44M+
	3nj3PIMuqtVirp27Psbx5Cih1bZr+P5nLvyX76XJ9imueQvRM9x4Jodg8i+h5k663Eix9SKQ9No
	jlcQSJh9+a+GfOASU6gZdl49ULrgj/jE45DHHXqD8q7suXaRB8X76bmE5ROWM9H1XiygTKDaYFQ
	8=
X-Google-Smtp-Source: AGHT+IEs0RZ/akZQh/jHGALZ8vIdUFz+6rVbFCmA91u1uXmk0t+e8i/uOrvYZcU50yYSCbE6p+FSyQ==
X-Received: by 2002:a05:6a20:3d1c:b0:262:1611:6528 with SMTP id adf61e73a8af0-348cc8e455dmr2461008637.29.1761873899175;
        Thu, 30 Oct 2025 18:24:59 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b93b8c8cdc0sm228117a12.13.2025.10.30.18.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 18:24:58 -0700 (PDT)
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
Subject: [PATCH v5 2/3] net: phy: Add helper for fixing RGMII PHY mode based on internal mac delay
Date: Fri, 31 Oct 2025 09:24:27 +0800
Message-ID: <20251031012428.488184-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251031012428.488184-1-inochiama@gmail.com>
References: <20251031012428.488184-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_182500_242619_DB78E257 
X-CRM114-Status: GOOD (  13.99  )
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


