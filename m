Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F1D5CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 00:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/WcWCGcgNvS5Hv44YHDTwLTthjpcd05Gmj8wnblh/dE=; b=qhHhu9D/YqLgfIuXLRmLGR/ON3
	/iweHEX5EH7afQDxyc/JPRL0uREGbBXjNXxVnruoLTIh2hPbOqQRvFN6OCoXBFRXyFfLrzEpO6JrH
	J9TsaD1gEWBOy9wD4js8aswDXU/GEjVroM7LKAC4JS4NdBKCOc0hOrrPSG1Pmyao95hiC72HV+vNK
	qUtxcQOQqw3NY2rxBXzf9xjpS7KNZVBoay9Dt1Kxih6QuXa/VIYsQJEiwc0JYei2ItlEN/9wCYZtm
	U88/n4IieGAqW7XcinpSXwTZ+XBfH8kg7qHFLDpSFIL5e4lMRXVapVXUrCQ99m3hZpDhvaRxWpd0L
	7888t8QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDXk7-0000000F0Ny-2vd0;
	Tue, 28 Oct 2025 00:39:19 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDXk2-0000000F0LT-2Zc4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 00:39:15 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-33d7589774fso5133857a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 17:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761611954; x=1762216754; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/WcWCGcgNvS5Hv44YHDTwLTthjpcd05Gmj8wnblh/dE=;
        b=ENfSv+DW3Axl4a2ttIG0sOBeGTkZtslJnGCJZHtN14MsWjknXjXHOmHUAeRYNFvUeS
         DYAEY9YEgB09e4kY4hvWBZkbdBsJZUyYeO8vBcYgdsvqc0Syz2hzSfc/VTEuzIuV8EfX
         Q80JCmgGmUXCsI0fzymYMGWfSnhxvFZo2GWf8JlUMvXoTmEPSsExEgimq7Mn/E6eL67j
         RSrLOiYbiG/eS0iWv2dIFdAZipRq9xIcliwjqNx6kEGLqUhcLk4quDhJA85HEPxV3r2D
         tuu8gtANuDwS6q+TpliVOpKvQevxMJIJoUHeo9Yb2jUeX+FHOgowDf/j7rKTQFA7+pSK
         as2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761611954; x=1762216754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/WcWCGcgNvS5Hv44YHDTwLTthjpcd05Gmj8wnblh/dE=;
        b=Da5xjnYq6hpBKeUVRhdIzXH5ag5+BcI9R8UvyTKD5sSvJ5nc8oRk8uSSGEVOgRIwtv
         qZLdM0y+WfYS3d0PAkkMRPNm4jX4+c59BONWBWdpSXlsjdRg1E8R5zZfvWdjTn40nT+1
         P9BEIaO83mpZRIDDVb8DO+W6ZAZFXR2i977ztvVCsJjceF9F+l8pJ7WzaCb7oqUxqw82
         YLFP9Vl6O3NFZY5MAZrOvp4Q5ohQ2r0oJ4WOe+v5UmeRV0kNCVC5ELuawftZmxDaJM3T
         A+zsej4piF+y+CwApvjX3R8JvxQyg3rrYOMD+XlJd+b02ga+j0UpvRFAPnk8UvDUu9+y
         Tf7g==
X-Forwarded-Encrypted: i=1; AJvYcCVdQOXUi1qi3Ce1363AXckSkdRfVMhwIj/6+LRQiUmo1MkSQUb13K25IBhCVJRthcDwe4DEyEagSBcJeEh525Cc@lists.infradead.org
X-Gm-Message-State: AOJu0YyR8pIBuPR96yUquIhUvYGmhIORKxds/CUGb9GEuThjtInSoUW4
	hQVLMznO3WrExoAfWpIu5SW1JQ9SWm1n3xXkMPzTv28dovXldoeHG4DM
X-Gm-Gg: ASbGncv5Ki67+54/ub2amRJlBm7XD2JpmU9QUx1+vdNemP8DkQdHoNGFuYYvroapGuO
	U7XuFSknT3PmYJqwmSK717OMxnPdFb3P1RlU56noo1d7mKQWj7wcXwpqAKOqnQP8HhmL8BsZ2rb
	TTWKRsR4oqv3X2fZH4kB2QLijEo2/Ag/Ze4Egvt5Y+u0+Z5c9ARfPjHcyAkJWJBTmLwLgTU/GM0
	KrDXS47s0xI1qLAMKbDvWkF2gZbRGihAnoXmSX0orzC7UZMZFuR7yK5VsrGfHAnndu8JDj0wa4D
	pUl1HT9oGa8OcB4K8+Xy6fhx9uJ+IeojDnBGN1YT2qfOLweYBDHzvGK5es9JydJve8UxL1Ar7Hi
	ucTeewsDNS/aTeK9ituwRNMVhuJrhukryFMk1gwUZC4HB9Q5qATjMhP6sqyluMtNviiXAIwYCBz
	4YxN88/RT5IQ==
X-Google-Smtp-Source: AGHT+IGlGdHwoHvvWJbSfq7fs7gWWYLvmYXWrIA0qO3xj1Qshht6xEIpI7sww7p68LXdI3n1iXEunw==
X-Received: by 2002:a17:90b:3882:b0:32e:e18a:368c with SMTP id 98e67ed59e1d1-340279e3fa7mr2149486a91.7.1761611953610;
        Mon, 27 Oct 2025 17:39:13 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414034661sm9665148b3a.26.2025.10.27.17.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 17:39:13 -0700 (PDT)
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
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 2/3] net: phy: Add helper for fixing RGMII PHY mode based on internal mac delay
Date: Tue, 28 Oct 2025 08:38:57 +0800
Message-ID: <20251028003858.267040-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251028003858.267040-1-inochiama@gmail.com>
References: <20251028003858.267040-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_173914_658475_C3E07535 
X-CRM114-Status: GOOD (  14.58  )
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


