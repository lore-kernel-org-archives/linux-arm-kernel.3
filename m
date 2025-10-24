Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FD7CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 01:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/WcWCGcgNvS5Hv44YHDTwLTthjpcd05Gmj8wnblh/dE=; b=hZkPO0yLGF3/6Ts+CdWBTAlweq
	SrcGozghOG8trBYdIoOBo98Y3CXFIjodybqIKHsYkQaiM5ygjNAE+8L/WN4/+AazcJmrX9GQ93b9W
	jWHFCGz5U5NJ9K4W0hgMxQKgjWt6Jvdp6R+6f+5nfiFI71NDDQ3LcioxRW7EkV5mfqPP5E+pyiTyK
	Q+Wg7EERuB1QAFfEGOUO/BLWWI34ivsD9fRVOkKAkDLmJzYLHPEr0sGto4niV1dUCo2L7uV8woBFE
	eGrUIV/z4WExhVtGh80Cti0sHU8uZfRtMwvdoLaLwulubNBfcQUiZzBy2lgvFDYx+J2Vif59zeH9i
	GKJ4sjgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC71x-00000007zDl-3ZUQ;
	Fri, 24 Oct 2025 01:55:49 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC71s-00000007zAY-1L03
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 01:55:45 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-b6cfffbb1e3so818065a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 18:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761270943; x=1761875743; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/WcWCGcgNvS5Hv44YHDTwLTthjpcd05Gmj8wnblh/dE=;
        b=P0FwCDZG021LCN2YwWf1pY6BoCsQAKLvGrk+GhGWIG1DJCnw1ffcJZatfGt49H4bCC
         TEkWmPLGepGYS6QuxECG+i9367RQEUtWOPf+khazHxGrbIppU6hSezv8T9cCJ/vOv9/Y
         9d0wJMMVAP6b75UwMQMUqKZbF0/75+/w0UxAvwsjYUps9pqomub6ker73MWtjvTEm5Zz
         b0mTPvgTO2MCgWG6d6+k9eWYKXy/fxliorCxxdaoMiPAQCx3PFUXbspomFSk9LDbHpzh
         9GXcXrURYrXkOxzI5vAEfTaDL91ZFpAHCVkw3gVK2XIeIFzc4dJYsxn20gBPZgsZng6T
         BnQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761270943; x=1761875743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/WcWCGcgNvS5Hv44YHDTwLTthjpcd05Gmj8wnblh/dE=;
        b=Cew58XFQU+ieMEvE9yCksN6Bu4oHsCHZ75OI/Ffzy89ad+0iAUIAyoKP9Cdq1L/APl
         EdpsG1WlWEi1md/4cufS2KSdSHHCRacwY1D4vgmsExrsz0VZFeTGlc4fmmIX3pLDVBlv
         +oakFzEU13zLcjEg8u5Uw59b/070Uwl69IxG4RsWFlOnXAjDFlmrd6/uRUxwduzKZxV4
         xqfI1L5b9lmqZxPSP2tsQ/dqm9jGwqWuSWNQShKFzYRgrwoWmyp29TzspNL7QHD+ErOv
         3RGZ4FlrQU7YDuu3/0r2/UF+ikdkZaG3heMiDcj8IU7LS1Wj1mCAvOR6AuMygvfuPwzY
         RSiw==
X-Forwarded-Encrypted: i=1; AJvYcCXTo8zEO78Jae2jdhw98WV4L5WY0YxaSDRSd23NHM7mhcColrgWPagjbjclync7SovLnPHsH05KA7uB9pNn93BQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwlBOxI9gByxmMzgRxfZgTIlDzzqxs+bCNJXhUnToTZiysKguRI
	YasnNRXs9zdNNHrYcyHeCA5CUONh2chyqXR3GLvMttP4OfhJtz+ZtYlL
X-Gm-Gg: ASbGncuqrE+QE326+ZgyK7yIhEpvUbbgaAA5tim76IOHtRPnOyMFBd+37TxDxBlmYkW
	z+9coFkyv+rZa/+fwRi1zJlXd8AI5gn5hUfXD0UY0B2o7QBVBl5geyaGctNszFHPiedlKqEzDw9
	Sc/hkrepFMYkoCRHcdXr8zVrdONAbFX2olzNIrEqPMfq1zChbHEF+AZOoSz1k3Ir6hVnppGwrn3
	UjXwt3RI5FapndNqFdsovZu/+eM4rdPcRNQhD3FsqUPj900MqXfRUnAs3D6twYr/RBjvwHNXglQ
	vuAwrXZKg5mj+SYeIkJcnUwrwwDtDUIcG+//qlFuR4+WiR3JJudDayXPAPaMRKaRbljUwD7CJP9
	uwjWz4knyo73ubyPLanYO/dJ1eU/tNpMCYMXXbVfpSZAD5ybhVmsIBEeRTG9MzieSdkrNahj0Og
	8=
X-Google-Smtp-Source: AGHT+IHkeRksmcYTcot27my+cABGgXJy6A76mmDUaCFMyxR7nPEFIYROl81koFxsnVclUBArcvfVMw==
X-Received: by 2002:a17:902:d2d0:b0:254:70cb:5b36 with SMTP id d9443c01a7336-290c9cf37b2mr241881045ad.8.1761270943405;
        Thu, 23 Oct 2025 18:55:43 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946ddec426sm37638255ad.34.2025.10.23.18.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 18:55:43 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 2/3] net: phy: Add helper for fixing RGMII PHY mode based on internal mac delay
Date: Fri, 24 Oct 2025 09:55:23 +0800
Message-ID: <20251024015524.291013-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251024015524.291013-1-inochiama@gmail.com>
References: <20251024015524.291013-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_185544_362733_1BC7C54E 
X-CRM114-Status: GOOD (  14.35  )
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
2.51.1


