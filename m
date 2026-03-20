Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF36110987B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 16:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1t19Dgh3hZYr0qQ3zdBg1bnVpGadg1ouWN+kqUkJjKA=; b=EIvUYv7zTZqgAUsHfaWgiqtQHe
	qdyqMGiVV96koCIZf1LiEpXbGOZR8vP0TFK0CDWq8PHjSEXKxJrhtUQzXyLiO2XXdxGa1uEE3xTQh
	eJ3e7uNW9rTmMK6TPY6WBgCAhTUlQmWjSurBU2QmtkdMLJ71G3TRlII7jNKuvLpVfqNf11IW4fKvS
	MVC3uTqNqTbevyqr67nX2JlfDZMq/QMR680JxVoYwvdCbF6TM6KXoqufQ6g0Ns++9ns/Q1/bS3Y0o
	B5P1O4cW7u8lQuvD8qAgJwDjdcJVIfyVuV0wGMqMN5tfIryWv776Vlv1SBfEwep6YAGbpVL6piNMr
	/qQg+4+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3d12-0000000DBtz-0AWB;
	Fri, 20 Mar 2026 16:48:04 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3d0d-0000000DBWH-3tBA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 16:47:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1t19Dgh3hZYr0qQ3zdBg1bnVpGadg1ouWN+kqUkJjKA=; b=Vo1TvmbOo1kLdibuiUbgt8CJ1L
	ZxLccNiofwKrkaqJprtLHH3MQFI6HcL7Z5CvLhNUkPptJJJTcWZkGRkd2Rdka4RzdZdgYY0boGV6Q
	zmHSYaGezFowEQRWQV1H6pQD0vLvSa/bko8ko5qStuag4OyNSGU9G085LCBYcqsqRxj00at0+Z4eW
	Hy4kUa4r7nvmq1vWabHxjTuSL6qQarnjGkqBKLSH/AEbOhRZl09apabX7IrmY7e/tgVSOkbrZEspq
	3RmR0VsDuttunP0/4E2Em33ShisPrE9fjYx+oxl3mEiLqFfvf3TzSCmy1iBP2ouR2YwmDncDeKQgp
	VHiouLAg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:34176 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w3d0X-000000006MM-1eGE;
	Fri, 20 Mar 2026 16:47:33 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w3d0W-0000000DfM7-2BMA;
	Fri, 20 Mar 2026 16:47:32 +0000
In-Reply-To: <ab15_JvLGFtUH_3x@shell.armlinux.org.uk>
References: <ab15_JvLGFtUH_3x@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 5/6] net: stmmac: use first_desc for TBS
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w3d0W-0000000DfM7-2BMA@rmk-PC.armlinux.org.uk>
Date: Fri, 20 Mar 2026 16:47:32 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_094739_972465_361E3F41 
X-CRM114-Status: GOOD (  12.35  )
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

Rather than freshly getting a pointer for the TBS descriptor (because
we want to access its enhanced fields) convert the existing first_desc
basic descriptor to a pointer to the enhanced descriptor.

Add a comment explaining why it is safe to convert from the basic
descriptor pointer to the enhanced descriptor pointer.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 95da2940cc3d..a733249c3f9b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4801,10 +4801,15 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	if (priv->sarc_type)
 		stmmac_set_desc_sarc(priv, first_desc, priv->sarc_type);
 
+	/* STMMAC_TBS_EN can only be set if SYMMC_TBS_AVAIL has already
+	 * been set, which means the underlying type of the descriptors
+	 * will be struct stmmac_edesc. Therefore, it is safe to convert
+	 * the basic descriptor to the enhanced descriptor here.
+	 */
 	if (tx_q->tbs & STMMAC_TBS_EN) {
 		struct timespec64 ts = ns_to_timespec64(skb->tstamp);
 
-		tbs_desc = &tx_q->dma_entx[first_entry];
+		tbs_desc = dma_desc_to_edesc(first_desc);
 		stmmac_set_desc_tbs(priv, tbs_desc, ts.tv_sec, ts.tv_nsec);
 	}
 
-- 
2.47.3


