Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3839E77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 17:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lGXo6iOaeIiwSHl5ozXwsyA28mb00cTSXuiV4cJArrM=; b=E++AXgriVStecVOI/4AuaJR7hR
	I8CuO2k2ndgC1+pvv0Rc3kSgA8duODC2BEGdZhKrk3djmzSV2qvCIV5T/Gidxdh81BL07TnZOvRYC
	/CKMPBlG8XOtf6HV86GQfZyh582ueB7LzMOZiFppAOePZy1LH4k6CuPn9P/xdxxHNT+388p8MVVLa
	biFesHQ5K3C+FZCKvgob2MuI9Mt4TSAp7CWOpeMRR61Y7JpU37RToHqhlmc5GikafVnIdR8TtDcE2
	r+9l0H5wAFFezFNd2zYAD36Q/Sa+1FffNxWMh0NJwATto/OX0f6e1HTi45HS2PCH4fqXZ+c19XtIo
	AWu9bwBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVZpR-00000009Nah-2g0K;
	Wed, 08 Jan 2025 17:26:49 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVZG4-00000009Fgn-3n8j
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 16:50:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lGXo6iOaeIiwSHl5ozXwsyA28mb00cTSXuiV4cJArrM=; b=Xx+nhyy3RsyqionMFc4LxEqzmJ
	KV6RnyfiNlm2Vtj5nxoh3B8MFZ7qt5ZPN6iM2wLjRvKjeu+Ev2fk2mDPC0/mOT61mqfhe1xJZEJ9Q
	J9KWZ54yzKEOyIo5w2LarprDA9R9zxu1mP3Jd7LzIexEOnuAvIM1O1v7o4YhFl26mnp2keB6xyZFE
	OxIWMfJMMNei8w3fNLJw4LFAIO63oa4NaYjLh92T6t7JlBKuGmtCLsBIQYf4PZMVLBUnp7Do9Nx1f
	b7vnArflTvrdLj1yWmLLNt6j/Tbr8MqRQerzAGrzS5/SyAvRyAcOBVhZYPXq6chUhIt7mRVgUtniX
	RNmfqySA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:47636 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tVZE0-0000v7-0Z;
	Wed, 08 Jan 2025 16:48:08 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tVZDh-0002K3-6y; Wed, 08 Jan 2025 16:47:49 +0000
In-Reply-To: <Z36sHIlnExQBuFJE@shell.armlinux.org.uk>
References: <Z36sHIlnExQBuFJE@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v4 04/18] net: stmmac: use unsigned int for eee_timer
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tVZDh-0002K3-6y@rmk-PC.armlinux.org.uk>
Date: Wed, 08 Jan 2025 16:47:49 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_085016_939560_1DCD2D49 
X-CRM114-Status: GOOD (  12.56  )
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

Since eee_timer is used to initialise priv->tx_lpi_timer, this also
should be unsigned to avoid a negative number being interpreted as a
very large positive number. Note that this makes the check for negative
numbers passed in as a module parameter redundant, and passing a
negative number will now produce a large delay rather than the
default. Since the default is used without an argument, passing a
negative number would be quite obscure. However, if users do, then
this will need to be revisited.

Reviewed-by: Simon Horman <horms@kernel.org>
Tested-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index afdf992cd91a..94cd58c636d9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -111,8 +111,8 @@ static const u32 default_msg_level = (NETIF_MSG_DRV | NETIF_MSG_PROBE |
 				      NETIF_MSG_IFDOWN | NETIF_MSG_TIMER);
 
 #define STMMAC_DEFAULT_LPI_TIMER	1000
-static int eee_timer = STMMAC_DEFAULT_LPI_TIMER;
-module_param(eee_timer, int, 0644);
+static unsigned int eee_timer = STMMAC_DEFAULT_LPI_TIMER;
+module_param(eee_timer, uint, 0644);
 MODULE_PARM_DESC(eee_timer, "LPI tx expiration time in msec");
 #define STMMAC_LPI_T(x) (jiffies + usecs_to_jiffies(x))
 
@@ -194,8 +194,6 @@ static void stmmac_verify_args(void)
 		flow_ctrl = FLOW_OFF;
 	if (unlikely((pause < 0) || (pause > 0xffff)))
 		pause = PAUSE_TIME;
-	if (eee_timer < 0)
-		eee_timer = STMMAC_DEFAULT_LPI_TIMER;
 }
 
 static void __stmmac_disable_all_queues(struct stmmac_priv *priv)
-- 
2.30.2


