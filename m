Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11EF0C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 13:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O9ohtHnmOIl7u93HcZyBYwH6Cqu/+kupWqZ4QCzt0ZI=; b=inoSYu0pQQHW76TgYtZCkSkwbJ
	oNcmM4Pj7WFV/VZfFN5g7vnqUjMAsaNSz28M6p6IQklT7vrG82q6p2SVbhyh2QBk3eR0QQEugSv46
	UthBi37/yJWbWxVxAxsSF33ukcURAvOHcY9LxcmKYlvA5LNGTHJbfxeexLJlDkww5D/Y7BJvqGVQf
	6nRP5skklKGzGUj37Ku+mboe1ruJHkeAoGvsc/xjvuYfUlPw+xhk/F5ZXsbDAxJ4rZVN9gsJLJ3ea
	s4hgfmMZhlimv2E63tliM/KjU3aYTO4l5qQe3XIRzNrpZ/7SV1O51zG/FLdlch5Telffxod+pxrXY
	1CFCjzDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAqcc-000000025FX-37s1;
	Fri, 02 May 2025 13:40:10 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAqYz-000000024d7-2o62
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 13:36:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=O9ohtHnmOIl7u93HcZyBYwH6Cqu/+kupWqZ4QCzt0ZI=; b=PvKh08TvSkmZOeHKvC5o+PCP2t
	vvyWSy67sqf3Ohw1yKQ//2g4/OC1xbqRyKYZMAFlv2OUcAmcKy1S3N6ezWl75mnQL1v6caf5ahTlC
	KoUaB9s3m+IMrnaXVoIwPh9Ieo/eW8yz8465JxXwVjxapXHrxRKEqeoRdAHyRPLhMdpRHn6hSEvi/
	Ey1O655njlSi9Py68eklClN1zqEGeyuESk3EXkUvTIRygNUIveeHjDywiB4qSvjXnMlwI+UzwEj+a
	N5mfR7mGVUWVYCahPku4mf3jD9GVCdwcOhOZ7So09bSX6VXqqdV1yWddqUX5RHJ+0KvX1hR5R4HiN
	9KS79M6w==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44032 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uAqYk-0001OV-02;
	Fri, 02 May 2025 14:36:10 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uAqY7-002D3e-R3; Fri, 02 May 2025 14:35:31 +0100
In-Reply-To: <aBTKOBKnhoz3rrlQ@shell.armlinux.org.uk>
References: <aBTKOBKnhoz3rrlQ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	bpf@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Thierry Reding <treding@nvidia.com>
Subject: [PATCH net-next v2 1/4] net: phylink: add ability to block carrier up
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uAqY7-002D3e-R3@rmk-PC.armlinux.org.uk>
Date: Fri, 02 May 2025 14:35:31 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_063625_708648_4E3525F5 
X-CRM114-Status: GOOD (  15.19  )
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

Network drivers such as stmmac need to quiesce the network device prior
to changing the DMA configuration. Currently, they do this by calling
netif_carrier_off() to stop the network stack pushing packets, but this
is incompatible with phylink.

Provide a pair of functions to allow the software link state to be
blocked and brought down if necessary, and restored afterwards.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phylink.c | 50 +++++++++++++++++++++++++++++++++++++++
 include/linux/phylink.h   |  3 +++
 2 files changed, 53 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 0faa3d97e06b..d522e12f89e8 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -26,6 +26,7 @@
 
 enum {
 	PHYLINK_DISABLE_STOPPED,
+	PHYLINK_DISABLE_CARRIER,
 	PHYLINK_DISABLE_LINK,
 	PHYLINK_DISABLE_MAC_WOL,
 
@@ -83,6 +84,7 @@ struct phylink {
 	bool mac_tx_clk_stop;
 	u32 mac_tx_lpi_timer;
 	u8 mac_rx_clk_stop_blocked;
+	u8 mac_carrier_blocked;
 
 	struct sfp_bus *sfp_bus;
 	bool sfp_may_have_phy;
@@ -2456,6 +2458,54 @@ void phylink_stop(struct phylink *pl)
 }
 EXPORT_SYMBOL_GPL(phylink_stop);
 
+/**
+ * phylink_carrier_block() - unblock carrier state
+ * @pl: a pointer to a &struct phylink returned from phylink_create()
+ *
+ * Disable the software link, which will call mac_link_down(). This is to
+ * allow network drivers to safely adjust e.g. DMA settings with the
+ * device idle. All calls to phylink_carrier_block() must be balanced by
+ * the appropriate number of calls to phylink_carrier_unblock().
+ */
+void phylink_carrier_block(struct phylink *pl)
+{
+	ASSERT_RTNL();
+
+	if (pl->mac_carrier_blocked == U8_MAX) {
+		phylink_warn(pl, "%s called too many times - ignoring\n",
+			     __func__);
+		dump_stack();
+		return;
+	}
+
+	if (pl->mac_carrier_blocked++ == 0)
+		phylink_run_resolve_and_disable(pl, PHYLINK_DISABLE_CARRIER);
+}
+EXPORT_SYMBOL_GPL(phylink_carrier_block);
+
+/**
+ * phylink_carrier_unblock() - unblock carrier state
+ * @pl: a pointer to a &struct phylink returned from phylink_create()
+ *
+ * All calls to phylink_carrier_block() must be balanced with a corresponding
+ * call to phylink_carrier_unblock() to restore the carrier state.
+ */
+void phylink_carrier_unblock(struct phylink *pl)
+{
+	ASSERT_RTNL();
+
+	if (pl->mac_carrier_blocked == 0) {
+		phylink_warn(pl, "%s called too many times - ignoring\n",
+			     __func__);
+		dump_stack();
+		return;
+	}
+
+	if (--pl->mac_carrier_blocked == 0)
+		phylink_enable_and_run_resolve(pl, PHYLINK_DISABLE_CARRIER);
+}
+EXPORT_SYMBOL_GPL(phylink_carrier_unblock);
+
 /**
  * phylink_rx_clk_stop_block() - block PHY ability to stop receive clock in LPI
  * @pl: a pointer to a &struct phylink returned from phylink_create()
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 30659b615fca..a48032561183 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -715,6 +715,9 @@ int phylink_pcs_pre_init(struct phylink *pl, struct phylink_pcs *pcs);
 void phylink_start(struct phylink *);
 void phylink_stop(struct phylink *);
 
+void phylink_carrier_block(struct phylink *);
+void phylink_carrier_unblock(struct phylink *);
+
 void phylink_rx_clk_stop_block(struct phylink *);
 void phylink_rx_clk_stop_unblock(struct phylink *);
 
-- 
2.30.2


