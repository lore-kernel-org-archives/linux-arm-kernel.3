Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85D2D3B98B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 13:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4+/h+G+UZmcLpKhAAeUc1gCUmuIP7h4zUAThZbIDIwU=; b=ULjB0waoyOde0hgnoFK+8OZKDR
	1gAG2v5jHkb2jlyjXK6fUqAetDrjTtCBwAuclndH6qCmEqk6Venz4JLzzKCAyR6K+sUFtSwMS96S0
	hfEoHE1mId4mxnzqMCmew0B2n7U03HH1X3+pMC7HadcIHs1ucu/MGrY3JigVUG5fZPIlDnidhiy5K
	lF185ScB6m3dew3810Oe8j0BK5UOr5OrUtiV4lHWaW7aUufHJayj4HLYYC1HTCc2Kmta1BTQbYULf
	IE1Eff67MZMHmf4LN+LSjM3T6W2JQWIbRQUXSiTrugGGtKxVgMY2qJmazq6rWkZASMvfBgroVCsPF
	mjG5gceQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFvCE-0000000AdsJ-1M1L;
	Tue, 26 Nov 2024 13:01:38 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFv3o-0000000Abym-20jo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 12:52:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4+/h+G+UZmcLpKhAAeUc1gCUmuIP7h4zUAThZbIDIwU=; b=1mIxpqoAoFisMNMn11GMy+5cnR
	ohJgIwSgsqReB+QUQ35N7RT4b7vvZ9RnOeGjjLwcPz/1LzQ62REBrnlaYYSU+ug85kq2y7fdTkm4V
	vBpYThK63VxRMi/ISMhi/VBoOZ46nPDgx/Vdvy8pc72Fc5uYf+PyPEYmLhDA6NwHBvQ+S9EdQX7pY
	tf5Inb/igj2paGv6ldTMjDl/l5mBFcyV1DfDhzbb7GEZLS0BxNg8AXsg6WLctEmmZ7/Bcs5CVLBVC
	Pg+WDIw5Pb+K+a+zZ3/0eQOSdkq7Sb43f1nVOHNmGsJwixWfycqKbCZHaRYD490RzHZKpjI0MVBGP
	zPEjnZJg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58798 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tFv3g-0006tH-0B;
	Tue, 26 Nov 2024 12:52:48 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tFv3e-005yhx-SV; Tue, 26 Nov 2024 12:52:46 +0000
In-Reply-To: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
References: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bryan Whitehead <bryan.whitehead@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
	UNGLinuxDriver@microchip.com
Subject: [PATCH RFC net-next 07/23] net: mdio: add definition for clock stop
 capable bit
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tFv3e-005yhx-SV@rmk-PC.armlinux.org.uk>
Date: Tue, 26 Nov 2024 12:52:46 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_045256_529336_20E5F1FA 
X-CRM114-Status: GOOD (  10.00  )
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

Add a definition for the clock stop capable bit in the PCS MMD. This
bit indicates whether the MAC is able to stop the transmit xMII clock
while it is signalling LPI.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 include/uapi/linux/mdio.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/mdio.h b/include/uapi/linux/mdio.h
index f0d3f268240d..6975f182b22c 100644
--- a/include/uapi/linux/mdio.h
+++ b/include/uapi/linux/mdio.h
@@ -125,6 +125,7 @@
 #define MDIO_STAT1_LPOWERABLE		0x0002	/* Low-power ability */
 #define MDIO_STAT1_LSTATUS		BMSR_LSTATUS
 #define MDIO_STAT1_FAULT		0x0080	/* Fault */
+#define MDIO_PCS_STAT1_CLKSTOP_CAP	0x0040
 #define MDIO_AN_STAT1_LPABLE		0x0001	/* Link partner AN ability */
 #define MDIO_AN_STAT1_ABLE		BMSR_ANEGCAPABLE
 #define MDIO_AN_STAT1_RFAULT		BMSR_RFAULT
-- 
2.30.2


