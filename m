Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085FBCE8D44
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 15:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3r9VUXikyV6de7PaLfY3kpgLTq1QMxYWUfuS+c81/nY=; b=zIlIZWdoCMpuzKBucDnLCnysPW
	qnBgXJokN1mzkSUzmisZwRHw22jPbQzu7MB4rjaJBkmLf6B1JZspSDTB8kZxmZwSWB52lUwNS70Z2
	qGFsiFUei3T4Cg2ldg5Y2SimFYDfyvztJKhM7Sw3RxG2Xob1NFBx1FGHlWM6ggvYo1p2H+cdtMs59
	RWGPy5wJNBGTHJqDpFOcM/gL5Xdgc2CUZnpFmmRe+u1Wn9tAVKLTeYptELF6qNo4z3Qj9xaDMqfOk
	Bcpe1qp1BCaX2JV29lNYLNuqz4iJeuCpakefr/YRrp4XIYiCwvjifU6UkUgup3+bgRiOlbs94VgyY
	tCk+8ZmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvjp-0000000CZ8w-2vkI;
	Fri, 14 Nov 2025 15:29:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvjo-0000000CZ7B-0qy3
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Nov 2025 15:29:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=3r9VUXikyV6de7PaLfY3kpgLTq1QMxYWUfuS+c81/nY=; b=k4J/rIpj4lMhmwkUI/PoaSzHBk
	mDJGsi9SeKlcwgeJX7kXzGDso6C8cc3Z+aqTOVyoHDU+slx8UzPDazWe+q1Oi9MN6ESLqKsCuDaW5
	SeNeMMRDt7R9+xVLktD0K8NpDGKpxQ28k1GQ8+pWyqPfFAZ9RemEBXdpYhPd2TEEXgyX+dW2Ui/ed
	+uUYHLd9tAYdbWCHwMFAzs/tR2LVvCZlKG2A8oEdthE5NmsxxhIzBmOUNdWH2GRXHfSZwemFMEh1W
	4UTf05yZSL2YCKoyZRFbur8pt9kHuWIUmammZLNsnpSbN8+qgQPBR2H90BBnTtNP/mNlnW7tcAYYm
	a9cD5+OA==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJus5-00000002pLD-2kp7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 14:33:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3r9VUXikyV6de7PaLfY3kpgLTq1QMxYWUfuS+c81/nY=; b=yn6gjF/IAbqHZZ6uk0OkX+GYqx
	ghXigzEXPu7VHnf4AHSZz9vOeruq9dDP/t73D6SzdxBv5a78aYbsJXB9Ir0viHPGVPoUk9cyUuatO
	sLXNGfyv/p5NRr39/bndki+29q7yq/Bg3hEJ93bVNfhBrKVJVcdvg41QLUxEmamZPgTMVHs4VFecA
	KKIhwwoWFLXXX+V9nHXC7qfzPZBGkFGJhIc04lUewWmas/lRl7P701qhqjE7kEdfQucFBmNgKcDu2
	uGkJycM3xOwIQu9cy48ys0lGXuHWFhyti9G/t17yX5dXTsKzwr1tBhwDCWs38ruWTWsRHwQ0ttUpu
	eFppM5fw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58386 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vJvjc-00000000795-2RTO;
	Fri, 14 Nov 2025 15:29:12 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vJvja-0000000EVkI-0zUH;
	Fri, 14 Nov 2025 15:29:10 +0000
In-Reply-To: <aRdKVMPHXlIn457m@shell.armlinux.org.uk>
References: <aRdKVMPHXlIn457m@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Chen Wang <unicorn_wang@outlook.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	sophgo@lists.linux.dev
Subject: [PATCH net-next 10/11] net: stmmac: remove unnecessary .prio queue
 initialisation
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vJvja-0000000EVkI-0zUH@rmk-PC.armlinux.org.uk>
Date: Fri, 14 Nov 2025 15:29:10 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_143353_805025_D1450680 
X-CRM114-Status: GOOD (  10.96  )
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

stmmac_platform.c explicitly sets .prio to zero if the snps,priority
property is not present in DT for the queue. However, as the struct
is allocated using devm_kzalloc(), all members default to zero unless
explicitly initialised, and of_property_read_u32() will not write to
its argument if the property is not found. Thus, explicitly setting
these to zero is unnecessary. Remove these.

$ grep '\.prio =' *.c
stmmac_platform.c: plat->rx_queues_cfg[queue].prio = 0;
stmmac_platform.c: plat->tx_queues_cfg[queue].prio = 0;

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 4750843cf102..e769638586fe 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -181,12 +181,9 @@ static int stmmac_mtl_setup(struct platform_device *pdev,
 				     &plat->rx_queues_cfg[queue].chan);
 		/* TODO: Dynamic mapping to be included in the future */
 
-		if (of_property_read_u32(q_node, "snps,priority",
-					&plat->rx_queues_cfg[queue].prio)) {
-			plat->rx_queues_cfg[queue].prio = 0;
-		} else {
+		if (!of_property_read_u32(q_node, "snps,priority",
+					  &plat->rx_queues_cfg[queue].prio))
 			plat->rx_queues_cfg[queue].use_prio = true;
-		}
 
 		/* RX queue specific packet type routing */
 		if (of_property_read_bool(q_node, "snps,route-avcp"))
@@ -257,12 +254,9 @@ static int stmmac_mtl_setup(struct platform_device *pdev,
 			plat->tx_queues_cfg[queue].mode_to_use = MTL_QUEUE_DCB;
 		}
 
-		if (of_property_read_u32(q_node, "snps,priority",
-					&plat->tx_queues_cfg[queue].prio)) {
-			plat->tx_queues_cfg[queue].prio = 0;
-		} else {
+		if (!of_property_read_u32(q_node, "snps,priority",
+					  &plat->tx_queues_cfg[queue].prio))
 			plat->tx_queues_cfg[queue].use_prio = true;
-		}
 
 		plat->tx_queues_cfg[queue].coe_unsupported =
 			of_property_read_bool(q_node, "snps,coe-unsupported");
-- 
2.47.3


