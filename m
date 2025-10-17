Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C8ECCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 12:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gl3RH1/grBVvpYgYxo1wR1jFGKFoqkxGDgHmjqc0K1Q=; b=iiQIW9OBnWEPQnwl8IrhG56Wci
	p5cS/UKRKtkvexgwZa2m6W4IyI18I2wsiCn/Rn+G68XP3nxJ5kLtKdjuGF9d9yY71j5odjNwoltRw
	sKkp2v5pMef1KYw3GMNCJDIyKNCyM2G2EZD37D1PXaSPD68QVleZQedC77lSGch5GMyS9TNqUtdTM
	PW0Ztrr9yHmQKd6i7uqZth2oXHaMdqrQqxFLobgpjqmz+POM23GOuIJ/IMmlnTIMp3uCno+aNRj5n
	VRN7hX7wDclmA6hnYmuhqgNNpY1XrHyMRMnQmKgDHFpPcYPy+adfI9AI+ixkBm7m/KKJE5P3eO5w5
	VOUwQdIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9jCU-00000007kzB-2dIu;
	Fri, 17 Oct 2025 12:04:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9jCT-00000007kyV-16ez
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Oct 2025 12:04:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=Gl3RH1/grBVvpYgYxo1wR1jFGKFoqkxGDgHmjqc0K1Q=; b=OBUy6tCu0iIAfvV7GUsEk1+VdZ
	ak71ZSm/W5676KjQ6HgrZ4ThWqexdHxiHK+xqQzA+s5HuglT6Jb88vk34fffBRZRb0F/j9duomkZU
	Cv1iBOpu4B+fGodEfszvWfTESn2htPe883hgMwRWhn/EnHSTF7I6H5r//NrwjbfgGahUAYc7kp8vD
	TvsmtuPY1PNiQOGpjiRBdyULB9/ElEiR57qYlj0+HRcEJ0K7VcC/zq/8J7j4z5QoZvBFBl4iB0I/1
	G7wCijD9t7hLeTdm9JqHxcrnZ6nWpS3uMfPzAoPvlQPA0GQemGiHFrH08je6yPSQ7iKtRjd2T58Np
	HR5hdMgw==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9jCP-00000007Yco-2xoY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 12:04:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Gl3RH1/grBVvpYgYxo1wR1jFGKFoqkxGDgHmjqc0K1Q=; b=dkIpJJYw0arrj6Gttb6BXMlBnj
	kntmuu++ry799y+xXC+mwWmhlPxgm34m252FsCqFh6SR6/TpneUPdHfwzYHH8HvYgDcSl/73CeBCO
	hTEmgDZLLhLv23GQ+H3NTI0lv3G2tdyv/dYLLOHovI3aUncrO+KcVs9tFwn7JyTm0Vb3QrN24MGH9
	XLcvuHKO5rkeN02K8+N1xQCHttv8Kyqk/R9Fjw4HWCmMWq2YwP4G/10ruVdXfcRawbcnrfBwSBV5Y
	HkM2HtRP5EKH/GZCMChxETvoFUe9Zo+vu3eb3eueg/dp/nvsMwV98GtZGZVKBgUy8X6FvcYTBVFZq
	tCNcN3fQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44984 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1v9jCK-000000007pX-0SjI;
	Fri, 17 Oct 2025 13:04:40 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1v9jCJ-0000000B2NQ-0mhG;
	Fri, 17 Oct 2025 13:04:39 +0100
In-Reply-To: <aPIwqo9mCEOb7ZQu@shell.armlinux.org.uk>
References: <aPIwqo9mCEOb7ZQu@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 1/6] net: phy: add phy_can_wakeup()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1v9jCJ-0000000B2NQ-0mhG@rmk-PC.armlinux.org.uk>
Date: Fri, 17 Oct 2025 13:04:39 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_130445_832710_755B1F03 
X-CRM114-Status: UNSURE (   8.18  )
X-CRM114-Notice: Please train this message.
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

Add phy_can_wakeup() to report whether the PHY driver has marked the
PHY device as being wake-up capable as far as the driver model is
concerned.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 include/linux/phy.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/phy.h b/include/linux/phy.h
index 3c7634482356..3eeeaec52832 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -1379,6 +1379,18 @@ static inline void phy_disable_eee_mode(struct phy_device *phydev, u32 link_mode
 	linkmode_clear_bit(link_mode, phydev->advertising_eee);
 }
 
+/**
+ * phy_can_wakeup() - indicate whether PHY has driver model wakeup capabilities
+ * @phydev: The phy_device struct
+ *
+ * Returns: true/false depending on the PHY driver's device_set_wakeup_capable()
+ * setting.
+ */
+static inline bool phy_can_wakeup(struct phy_device *phydev)
+{
+	return device_can_wakeup(&phydev->mdio.dev);
+}
+
 void phy_resolve_aneg_pause(struct phy_device *phydev);
 void phy_resolve_aneg_linkmode(struct phy_device *phydev);
 
-- 
2.47.3


