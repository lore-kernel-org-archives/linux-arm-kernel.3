Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6DCD0BB41
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 22:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I2Wf0AdoYXK4o4bTYIw8LQr7jBWITrws4jbbsIp9Vdk=; b=fxXgHTaujjGR9qkiCpNBwI+HUN
	NCThHld2y6wV3iPR5vmug02oV4yARy7neBTfIMG5vZlxsgm272Bwjr8dN/9FJ8ZYO7+PoifAG7LS/
	mY/mwmdRNNC2GP2miOxhH5UeLqfBViLGts8fA2plFt/4OOm+1KftTM8lsho6lMp1XEaqx2qXV4aWf
	gJvj60V4nzAa6hzSbA4z4nAC/v9ntaDv3HIG7j+4jRDj3GAgTVGD8G7egKpY/rg5yqNaFJSZ9T0BC
	6FaLJlRHhTLODRoKjfBt7RCdwmiuftO5f21LRhdeZGkMQmMQ+Pcs/aacT3jPXD+YzvzgbqvECg/Dk
	nYmbg58A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3jgu-0000000G4ji-2z4H;
	Wed, 23 Oct 2024 22:18:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3jRB-0000000G2Es-3Rbd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 22:02:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1729720961; x=1761256961;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=ZKiUv9DzB/srjyB0nOslYiyXDW2kxgFTeso+UmXKlj8=;
  b=bUcp+TkCx45YMwBoKEFOSHmuccTVMx3diJgeeVI1im3Ny4jsbHfFAkoz
   2nkvxoVca6RsYnlIwW/xtuO9o0nu91rAqpqojJMslh3jQvb51YK2xdEV2
   WIY4UlAKk5DbzwzQBkckY6SQ2WGg7FpsA5x9+oQKDw+PP6I83i8nWOEH6
   Mj+3829xq1D9ki90kiqL6jebXIORgnZoKq21qbtGDYpW52dO7R9ZghFMh
   582/E73Eg2JOSyGEjA5dbZQx0qyL/9QTip+VEiQoKbklg4iHUreIlTmVS
   FCTsGdMJYobq33GqZZk/Zd/cGt5IJgpfbfp6Q6fVfAqfquy3rcdfZEfsx
   Q==;
X-CSE-ConnectionGUID: wd8IJW4NTJ64cR86gqDN2Q==
X-CSE-MsgGUID: vbpVIdD/Q2+PXaOWlN1TYg==
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="200831272"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Oct 2024 15:02:37 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 23 Oct 2024 15:02:21 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 23 Oct 2024 15:02:17 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Thu, 24 Oct 2024 00:01:29 +0200
Subject: [PATCH net-next v2 10/15] net: lan969x: add PTP handler function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241024-sparx5-lan969x-switch-driver-2-v2-10-a0b5fae88a0f@microchip.com>
References: <20241024-sparx5-lan969x-switch-driver-2-v2-0-a0b5fae88a0f@microchip.com>
In-Reply-To: <20241024-sparx5-lan969x-switch-driver-2-v2-0-a0b5fae88a0f@microchip.com>
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Lars Povlsen
	<lars.povlsen@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>,
	<horatiu.vultur@microchip.com>, <jensemil.schulzostergaard@microchip.com>,
	<Parthiban.Veerasooran@microchip.com>, <Raju.Lakkaraju@microchip.com>,
	<UNGLinuxDriver@microchip.com>, Richard Cochran <richardcochran@gmail.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, <jacob.e.keller@intel.com>,
	<ast@fiberby.net>, <maxime.chevallier@bootlin.com>, <horms@kernel.org>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Steen Hegelund
	<steen.hegelund@microchip.com>, <devicetree@vger.kernel.org>
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_150242_016046_586109C3 
X-CRM114-Status: GOOD (  20.02  )
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

Add PTP IRQ handler for lan969x. This is required, as the PTP registers
are placed in two different targets on Sparx5 and lan969x. The
implementation is otherwise the same as on Sparx5.

Also, expose sparx5_get_hwtimestamp() for use by lan969x.

Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/lan969x/lan969x.c   | 90 ++++++++++++++++++++++
 .../net/ethernet/microchip/sparx5/sparx5_main.h    |  5 ++
 drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c |  9 +--
 3 files changed, 99 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/microchip/lan969x/lan969x.c b/drivers/net/ethernet/microchip/lan969x/lan969x.c
index 2c2b86f9144e..a3b40e09b947 100644
--- a/drivers/net/ethernet/microchip/lan969x/lan969x.c
+++ b/drivers/net/ethernet/microchip/lan969x/lan969x.c
@@ -201,6 +201,95 @@ static int lan969x_port_mux_set(struct sparx5 *sparx5, struct sparx5_port *port,
 	return 0;
 }
 
+static irqreturn_t lan969x_ptp_irq_handler(int irq, void *args)
+{
+	int budget = SPARX5_MAX_PTP_ID;
+	struct sparx5 *sparx5 = args;
+
+	while (budget--) {
+		struct sk_buff *skb, *skb_tmp, *skb_match = NULL;
+		struct skb_shared_hwtstamps shhwtstamps;
+		struct sparx5_port *port;
+		struct timespec64 ts;
+		unsigned long flags;
+		u32 val, id, txport;
+		u32 delay;
+
+		val = spx5_rd(sparx5, PTP_TWOSTEP_CTRL);
+
+		/* Check if a timestamp can be retrieved */
+		if (!(val & PTP_TWOSTEP_CTRL_PTP_VLD))
+			break;
+
+		WARN_ON(val & PTP_TWOSTEP_CTRL_PTP_OVFL);
+
+		if (!(val & PTP_TWOSTEP_CTRL_STAMP_TX))
+			continue;
+
+		/* Retrieve the ts Tx port */
+		txport = PTP_TWOSTEP_CTRL_STAMP_PORT_GET(val);
+
+		/* Retrieve its associated skb */
+		port = sparx5->ports[txport];
+
+		/* Retrieve the delay */
+		delay = spx5_rd(sparx5, PTP_TWOSTEP_STAMP_NSEC);
+		delay = PTP_TWOSTEP_STAMP_NSEC_NS_GET(delay);
+
+		/* Get next timestamp from fifo, which needs to be the
+		 * rx timestamp which represents the id of the frame
+		 */
+		spx5_rmw(PTP_TWOSTEP_CTRL_PTP_NXT_SET(1),
+			 PTP_TWOSTEP_CTRL_PTP_NXT,
+			 sparx5, PTP_TWOSTEP_CTRL);
+
+		val = spx5_rd(sparx5, PTP_TWOSTEP_CTRL);
+
+		/* Check if a timestamp can be retrieved */
+		if (!(val & PTP_TWOSTEP_CTRL_PTP_VLD))
+			break;
+
+		/* Read RX timestamping to get the ID */
+		id = spx5_rd(sparx5, PTP_TWOSTEP_STAMP_NSEC);
+		id <<= 8;
+		id |= spx5_rd(sparx5, PTP_TWOSTEP_STAMP_SUBNS);
+
+		spin_lock_irqsave(&port->tx_skbs.lock, flags);
+		skb_queue_walk_safe(&port->tx_skbs, skb, skb_tmp) {
+			if (SPARX5_SKB_CB(skb)->ts_id != id)
+				continue;
+
+			__skb_unlink(skb, &port->tx_skbs);
+			skb_match = skb;
+			break;
+		}
+		spin_unlock_irqrestore(&port->tx_skbs.lock, flags);
+
+		/* Next ts */
+		spx5_rmw(PTP_TWOSTEP_CTRL_PTP_NXT_SET(1),
+			 PTP_TWOSTEP_CTRL_PTP_NXT,
+			 sparx5, PTP_TWOSTEP_CTRL);
+
+		if (WARN_ON(!skb_match))
+			continue;
+
+		spin_lock(&sparx5->ptp_ts_id_lock);
+		sparx5->ptp_skbs--;
+		spin_unlock(&sparx5->ptp_ts_id_lock);
+
+		/* Get the h/w timestamp */
+		sparx5_get_hwtimestamp(sparx5, &ts, delay);
+
+		/* Set the timestamp in the skb */
+		shhwtstamps.hwtstamp = ktime_set(ts.tv_sec, ts.tv_nsec);
+		skb_tstamp_tx(skb_match, &shhwtstamps);
+
+		dev_kfree_skb_any(skb_match);
+	}
+
+	return IRQ_HANDLED;
+}
+
 static const struct sparx5_regs lan969x_regs = {
 	.tsize = lan969x_tsize,
 	.gaddr = lan969x_gaddr,
@@ -242,6 +331,7 @@ static const struct sparx5_ops lan969x_ops = {
 	.get_hsch_max_group_rate = &lan969x_get_hsch_max_group_rate,
 	.get_sdlb_group          = &lan969x_get_sdlb_group,
 	.set_port_mux            = &lan969x_port_mux_set,
+	.ptp_irq_handler         = &lan969x_ptp_irq_handler,
 };
 
 const struct sparx5_match_data lan969x_desc = {
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
index 15f5d38776c4..3f66045c57ef 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
@@ -114,6 +114,8 @@ enum sparx5_vlan_port_type {
 #define SPX5_DSM_CAL_LEN               64
 #define SPX5_DSM_CAL_MAX_DEVS_PER_TAXI 13
 
+#define SPARX5_MAX_PTP_ID	512
+
 struct sparx5;
 
 struct sparx5_calendar_data {
@@ -499,6 +501,9 @@ void sparx5_ptp_txtstamp_release(struct sparx5_port *port,
 				 struct sk_buff *skb);
 irqreturn_t sparx5_ptp_irq_handler(int irq, void *args);
 int sparx5_ptp_gettime64(struct ptp_clock_info *ptp, struct timespec64 *ts);
+void sparx5_get_hwtimestamp(struct sparx5 *sparx5,
+			    struct timespec64 *ts,
+			    u32 nsec);
 
 /* sparx5_vcap_impl.c */
 int sparx5_vcap_init(struct sparx5 *sparx5);
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c b/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c
index a511f14312f1..1c2903700a9c 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c
@@ -11,8 +11,6 @@
 #include "sparx5_main_regs.h"
 #include "sparx5_main.h"
 
-#define SPARX5_MAX_PTP_ID	512
-
 #define TOD_ACC_PIN		0x4
 
 enum {
@@ -275,9 +273,9 @@ void sparx5_ptp_txtstamp_release(struct sparx5_port *port,
 	spin_unlock_irqrestore(&sparx5->ptp_ts_id_lock, flags);
 }
 
-static void sparx5_get_hwtimestamp(struct sparx5 *sparx5,
-				   struct timespec64 *ts,
-				   u32 nsec)
+void sparx5_get_hwtimestamp(struct sparx5 *sparx5,
+			    struct timespec64 *ts,
+			    u32 nsec)
 {
 	/* Read current PTP time to get seconds */
 	const struct sparx5_consts *consts = sparx5->data->consts;
@@ -305,6 +303,7 @@ static void sparx5_get_hwtimestamp(struct sparx5 *sparx5,
 
 	spin_unlock_irqrestore(&sparx5->ptp_clock_lock, flags);
 }
+EXPORT_SYMBOL_GPL(sparx5_get_hwtimestamp);
 
 irqreturn_t sparx5_ptp_irq_handler(int irq, void *args)
 {

-- 
2.34.1


