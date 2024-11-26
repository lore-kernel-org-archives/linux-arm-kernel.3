Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AEFCD3B7C1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 09:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=el0rVY+c9CrkRzaGqbcKkhlZC6FhAlwE6EzSElpENZM=; b=Vps5slJVpODzgRxBBNMaVEiPTl
	d+30LJx5ugUyu6FoCgBY56r1+D2S1zrp7Ruk+0FVHbPyI7uGgqFgmuFZbv/MJRpaSN2/nEicupD60
	S1xk+Sv2rqvqI45q8UNMj7DseeOsNGEUPItgpkObOeqnjid3cZwW4ndhII2NTCqH8VHM6claX9xpa
	KzvTpyICWF0ivLzZl88Jg+cBgGGOOthc4zVywXK9YhohQy3ixNniR2kK4yHygIZ9JzxYLPOukr/bb
	h43CHcILgnWzHuJCJxtDgnu05UrFPCpec7wFMbtXa/v/O4QyWMS9HPVGnFADjoYWLh9EEuXbD50rn
	8if6cf3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFrvO-0000000AA4p-2EBD;
	Tue, 26 Nov 2024 09:32:02 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFroT-0000000A8Rw-31Rh;
	Tue, 26 Nov 2024 09:24:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=el0rVY+c9CrkRzaGqbcKkhlZC6FhAlwE6EzSElpENZM=; b=c2PLDRGD9Ssf7ZkhiapQYuPPQS
	1ZD+o4FDtCpKZMI0SUXyUFVJKP5Ogvjyi22GEnxGLvO0sDt9H/xOKqq0sXVUWQJ4uftakUuC0MzOc
	zth8l3K944nGdgSpHcrGLg4lsgoBMqE8+gYwjh5g9/siPz6crxx+xPoYS960XDIGeEJvgwMTZHvCE
	5J2/vCaS7XRZo7/g95CpNu173tEzl04U14HmM4MM4R9FJBrFcibMNF+4/9JfUeiZEJbcfTQAZd3He
	eDTmvQmiFq26nr7vG8a9cRabNsjHwe0LwL93jUbHTX70bMlROERn58bIaNK3/TP97ZdZWg9hK3rml
	ejlf7Qyw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:46098 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tFroI-0006Sz-1A;
	Tue, 26 Nov 2024 09:24:43 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tFroH-005xQ2-2v; Tue, 26 Nov 2024 09:24:41 +0000
In-Reply-To: <Z0WTpE8wkpjMiv_J@shell.armlinux.org.uk>
References: <Z0WTpE8wkpjMiv_J@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexander Couzens <lynxis@fe80.eu>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH RFC net-next 05/16] net: phy: bcm84881: implement
 phy_inband_caps() method
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tFroH-005xQ2-2v@rmk-PC.armlinux.org.uk>
Date: Tue, 26 Nov 2024 09:24:41 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_012453_754061_2C46C398 
X-CRM114-Status: GOOD (  10.99  )
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

BCM84881 has no support for inband signalling, so this is a trivial
implementation that returns no support for inband.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/bcm84881.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/phy/bcm84881.c b/drivers/net/phy/bcm84881.c
index 97da3aee4942..47405bded677 100644
--- a/drivers/net/phy/bcm84881.c
+++ b/drivers/net/phy/bcm84881.c
@@ -235,11 +235,21 @@ static int bcm84881_read_status(struct phy_device *phydev)
 	return genphy_c45_read_mdix(phydev);
 }
 
+/* The Broadcom BCM84881 in the Methode DM7052 is unable to provide a SGMII
+ * or 802.3z control word, so inband will not work.
+ */
+static unsigned int bcm84881_inband_caps(struct phy_device *phydev,
+					 phy_interface_t interface)
+{
+	return LINK_INBAND_DISABLE;
+}
+
 static struct phy_driver bcm84881_drivers[] = {
 	{
 		.phy_id		= 0xae025150,
 		.phy_id_mask	= 0xfffffff0,
 		.name		= "Broadcom BCM84881",
+		.inband_caps	= bcm84881_inband_caps,
 		.config_init	= bcm84881_config_init,
 		.probe		= bcm84881_probe,
 		.get_features	= bcm84881_get_features,
-- 
2.30.2


