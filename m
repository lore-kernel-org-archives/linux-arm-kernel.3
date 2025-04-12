Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFBEC369A1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 08:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KLYAQmm0EdRBLRzzdd3lLjh/IOTbvjXhFDeOUE0zWgY=; b=t2nnK8sL/436jdtvEarm9YXfV1
	yPsp9PhLOJ6TisvD+XKnig3B2T8bY6r7rt3DJXIGgBvR0a4B3JRlGnVMTjRKRwPRBmR4SXPli2Q5t
	zK0u32apD8j6k4ssTQV36tk+nqMlLJ2XRR60OB2MEMKR5VzutKLjgcEwIhjMUVzU6ftRYJ72Da3ln
	aCJ1Ihz0PPbfyl3kaY9gKkkXOYLJrgklFv0oVBll+3DtolrlEU8+AVXheu/IK4+vUvVAu8Idr+8fu
	1pPuXC5YXxJiPmmaopUuCrgB/grJ8ntVrS58sZFAKhUbJShC9vfN6tSS1zyXYjY6nfzwFMl13Qq+B
	JJHIU7Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3W4n-0000000Fdqx-253j;
	Sat, 12 Apr 2025 08:18:57 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Vvh-0000000FdFh-1Cv1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 08:09:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KLYAQmm0EdRBLRzzdd3lLjh/IOTbvjXhFDeOUE0zWgY=; b=lxnIHExPZpx7rC9L0Q6P+pHgGW
	7Chlw2h2JegOWClBM4xpicZd9J+lOMTfPqCyJdWB6qtsLjaQBYm1B14xm+P2s8uzYnXdTe86vTyNN
	b1hWgIWDVPtYP/PreB3Me1uk8DOCClo2q21GRD/CvBKvVpDvIpmizOKHzDXBUGV1ZpQceuFKFy5kI
	le/eMXpJ4waVYpxsvT0obbx+3kZoaRzioJSbDz7qnyQ0gOPsm17B9tIEL4ZSb5/SWaelBs5pK2WA1
	tAnhZ6mWQMPl5WyL/qR7Am9Wg18CnrM4YjwuooRBIf1fCf046tjsjAklXwphB/8kkHNnt0hTzh9ge
	UP2mWU2A==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:33820 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1u3Vvc-0004My-0B;
	Sat, 12 Apr 2025 09:09:28 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1u3Vv0-000E87-DQ; Sat, 12 Apr 2025 09:08:50 +0100
In-Reply-To: <Z_oe0U5E0i3uZbop@shell.armlinux.org.uk>
References: <Z_oe0U5E0i3uZbop@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Richard Cochran <richardcochran@gmail.com>,
	Thierry Reding <treding@nvidia.com>
Subject: [PATCH net-next v2 5/5] net: stmmac: remove GMAC_1US_TIC_COUNTER
 definition
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1u3Vv0-000E87-DQ@rmk-PC.armlinux.org.uk>
Date: Sat, 12 Apr 2025 09:08:50 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_010933_326816_3BEBA749 
X-CRM114-Status: UNSURE (   8.63  )
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

GMAC_1US_TIC_COUNTER is now no longer used, so remove the definition.
This was duplicated by GMAC4_MAC_ONEUS_TIC_COUNTER further down in the
same file.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
index 42fe29a4e300..5f387ec27c8c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
@@ -31,7 +31,6 @@
 #define GMAC_RXQ_CTRL3			0x000000ac
 #define GMAC_INT_STATUS			0x000000b0
 #define GMAC_INT_EN			0x000000b4
-#define GMAC_1US_TIC_COUNTER		0x000000dc
 #define GMAC_PCS_BASE			0x000000e0
 #define GMAC_PHYIF_CONTROL_STATUS	0x000000f8
 #define GMAC_PMT			0x000000c0
-- 
2.30.2


