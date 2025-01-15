Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA8CC02185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 20:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yqNVbj3MVpY+7D9FsZ5FX3gjtvbIvX8GZPT80w1IszY=; b=CPUldvoiSvHQmQEUNB6OVzbcmC
	AglNIESskmidGeGt3wCNskGCvRzOkRQSTpNlVhBfr+6sWHs56QCdhspB2HxR+Y3U406JXaM0qjGPW
	o6+Z9R9zDR9onKB6LEdHJykfIuyF0ObbhNJzBmFWdn5M4zcxf4qFUlNOzyTp79Y5yIN2sFr6zMsrv
	20oFvT79CJFHAX2wOoWQYAAcCIfhFT4ie2waTZseXYZDGEKzaF9ioGijX8QUez/mrbnRMCWIuutMR
	GXrt1nTzE5hZnhjkIPtkftLXcjQY152gzuRvfZ0+2h2+pVHRRl8yApmcYj5QenanwchfmTPxaOoja
	3/gfwfRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYAJk-0000000D2mF-2Qj4;
	Wed, 15 Jan 2025 20:48:48 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYAE1-0000000D1jC-0sv7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 20:42:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yqNVbj3MVpY+7D9FsZ5FX3gjtvbIvX8GZPT80w1IszY=; b=xCN7L5XJ6uub0u6KMFY1SWhBIs
	6s8VwiAooMvZHkNqlFBdKZ71XEWRVPTcsP55BGfBn+BDYCf70+KgiCCDUmfl0fVzFNFXgztKlGhZJ
	UrHRHSDnFjnaL9kWsba1jiGRAdn7r+aco9UuY6UlwlCiWq7WlqZ/8KrPebvHS3NiPLHO+gFd9Nfqy
	aEg+4akv1FVWcCTX3QljcAAEiS8EMTI24I++dScnsFKGz3/MjxIN4+iI5nxUz+7zK8aNzN56BL2Uk
	3A0dM0CdhphEnLuwhKau1R0sXIb85KDpEHbRv9JTbsLUi6h074G7kuBrqXQJ3rTuxIEy9b6hGKT94
	2yXQhmEg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:59884 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tYADu-0001iD-0k;
	Wed, 15 Jan 2025 20:42:46 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tYADb-0014PV-6T; Wed, 15 Jan 2025 20:42:27 +0000
In-Reply-To: <Z4gdtOaGsBhQCZXn@shell.armlinux.org.uk>
References: <Z4gdtOaGsBhQCZXn@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bryan Whitehead <bryan.whitehead@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	UNGLinuxDriver@microchip.com
Subject: [PATCH net-next 1/9] net: mdio: add definition for clock stop capable
 bit
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tYADb-0014PV-6T@rmk-PC.armlinux.org.uk>
Date: Wed, 15 Jan 2025 20:42:27 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_124253_241518_D7589693 
X-CRM114-Status: UNSURE (   9.54  )
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

Add a definition for the clock stop capable bit in the PCS MMD. This
bit indicates whether the MAC is able to stop the transmit xMII clock
while it is signalling LPI.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
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


