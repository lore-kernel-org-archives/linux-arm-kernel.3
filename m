Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4132AE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 18:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qS6c8Pdx25r4EnN1vDITQVt+AZX2ld0kI0zHZeByfGM=; b=R+jk/U8NhWWpn1wMtmaEXztVlK
	P7z4lxoNcuvyCMAKxIL2T4TAbqYxIvjl4dL4PaT/a7qgv3OMceA+3AZX06b6p8ENV5/J1dAm/PbLs
	DWUVilWvLJ81DKswvjRug8UmIqF+OsfUaYWSGh4JpPdZUaPP8N+82RU+GOMzLDvkVyyUOODtIczoX
	ti09qeV63w0MGjIc3CFh1B3fE4LezsO6azvtkPg+Nz6SB4JJe5Iam/m7cSb5jSwFa5IA4e9loRs8a
	UMcnmOIjNKFzwGCKZDJQ+QntqVRKqk3ZbfPSZGw34EJmsWwb/lUi+pVV38guGdauHCKwE0mFYyA2Y
	UgN8tnIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVxTq-0000000D0cZ-2rnL;
	Thu, 09 Jan 2025 18:42:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVxQX-0000000CzhD-05sD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 18:38:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1736447921; x=1767983921;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=J2M9/MtCDlgYilNahaNA6XZPwjCl15h2CgtaBcerqow=;
  b=qVHtkHAF10v7oQR8R5zyKG8Q4B0E1nhEb4+AStkNKLkDrdhL9R/avzcJ
   gy4Er96MxFBweipKY16YDOPB9bjeEUDLoeE9RJ5cPpDa+sH18Crd0U1Si
   WOWgVcmxZcaYSfJ2LM+6rkKonjfkWwJTMXha5ggnnbkrissIiaJrgITND
   3CPUi/kQK3OLBkQtSFiIj62JzQRpEIbbmHm/F0dHIbGaQ5FUIq8J5J4s9
   k6/On44lSuV/u1x+nCT3x/A8kO/buDOXcPUCjA76AELExp/TshXVAF2gg
   Jmt8prsN9Gnvk+JX9KmesJVxBVh4MVo9aGMZyXFvgWLb8Q65EZ8xIHz7o
   g==;
X-CSE-ConnectionGUID: EEpZxm35SCOeNwgRklSfsQ==
X-CSE-MsgGUID: STyF79YdRnO4h5Bqofx8pw==
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="36007571"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Jan 2025 11:38:40 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 Jan 2025 11:38:12 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 9 Jan 2025 11:38:09 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Thu, 9 Jan 2025 19:37:54 +0100
Subject: [PATCH net-next 2/6] net: sparx5: split
 sparx5_fdma_{start(),stop()}
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250109-sparx5-lan969x-switch-driver-5-v1-2-13d6d8451e63@microchip.com>
References: <20250109-sparx5-lan969x-switch-driver-5-v1-0-13d6d8451e63@microchip.com>
In-Reply-To: <20250109-sparx5-lan969x-switch-driver-5-v1-0-13d6d8451e63@microchip.com>
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Andrew Lunn
	<andrew+netdev@lunn.ch>, Lars Povlsen <lars.povlsen@microchip.com>, "Steen
 Hegelund" <Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>,
	Richard Cochran <richardcochran@gmail.com>,
	<jensemil.schulzostergaard@microchip.com>, <horatiu.vultur@microchip.com>,
	<jacob.e.keller@intel.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_103841_126589_6C0EBE90 
X-CRM114-Status: GOOD (  15.95  )
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

The two functions: sparx5_fdma_{start(),stop()} are responsible for a
number of things, namely: allocation and initialization of FDMA buffers,
activation FDMA channels in hardware and activation of the NAPI
instance.

This patch splits the buffer allocation and initialization into init and
deinit functions, and the channel and NAPI activation into start and
stop functions. This serves two purposes: 1) the start() and stop()
functions can be reused for lan969x and 2) prepares for future MTU
change support, where we must be able to stop and start the FDMA
channels and NAPI instance, without free'ing and reallocating the FDMA
buffers.

Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 .../net/ethernet/microchip/sparx5/sparx5_fdma.c    | 44 +++++++++++++++++-----
 .../net/ethernet/microchip/sparx5/sparx5_main.c    |  7 +++-
 .../net/ethernet/microchip/sparx5/sparx5_main.h    |  2 +
 3 files changed, 41 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
index 0027144a2af2..56cd206bd1af 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
@@ -260,10 +260,6 @@ static int sparx5_fdma_rx_alloc(struct sparx5 *sparx5)
 	fdma_dcbs_init(fdma, FDMA_DCB_INFO_DATAL(fdma->db_size),
 		       FDMA_DCB_STATUS_INTR);
 
-	netif_napi_add_weight(rx->ndev, &rx->napi, sparx5_fdma_napi_callback,
-			      FDMA_WEIGHT);
-	napi_enable(&rx->napi);
-	sparx5_fdma_rx_activate(sparx5, rx);
 	return 0;
 }
 
@@ -410,7 +406,7 @@ static void sparx5_fdma_injection_mode(struct sparx5 *sparx5)
 	}
 }
 
-int sparx5_fdma_start(struct sparx5 *sparx5)
+int sparx5_fdma_init(struct sparx5 *sparx5)
 {
 	int err;
 
@@ -443,24 +439,52 @@ int sparx5_fdma_start(struct sparx5 *sparx5)
 	return err;
 }
 
+int sparx5_fdma_deinit(struct sparx5 *sparx5)
+{
+	sparx5_fdma_stop(sparx5);
+	fdma_free_phys(&sparx5->rx.fdma);
+	fdma_free_phys(&sparx5->tx.fdma);
+
+	return 0;
+}
+
 static u32 sparx5_fdma_port_ctrl(struct sparx5 *sparx5)
 {
 	return spx5_rd(sparx5, FDMA_PORT_CTRL(0));
 }
 
+int sparx5_fdma_start(struct sparx5 *sparx5)
+{
+	struct sparx5_rx *rx = &sparx5->rx;
+
+	netif_napi_add_weight(rx->ndev,
+			      &rx->napi,
+			      sparx5_fdma_napi_callback,
+			      FDMA_WEIGHT);
+
+	napi_enable(&rx->napi);
+
+	sparx5_fdma_rx_activate(sparx5, rx);
+
+	return 0;
+}
+
 int sparx5_fdma_stop(struct sparx5 *sparx5)
 {
+	struct sparx5_rx *rx = &sparx5->rx;
+	struct sparx5_tx *tx = &sparx5->tx;
 	u32 val;
 
-	napi_disable(&sparx5->rx.napi);
+	napi_disable(&rx->napi);
+
 	/* Stop the fdma and channel interrupts */
-	sparx5_fdma_rx_deactivate(sparx5, &sparx5->rx);
-	sparx5_fdma_tx_deactivate(sparx5, &sparx5->tx);
+	sparx5_fdma_rx_deactivate(sparx5, rx);
+	sparx5_fdma_tx_deactivate(sparx5, tx);
+
 	/* Wait for the RX channel to stop */
 	read_poll_timeout(sparx5_fdma_port_ctrl, val,
 			  FDMA_PORT_CTRL_XTR_BUF_IS_EMPTY_GET(val) == 0,
 			  500, 10000, 0, sparx5);
-	fdma_free_phys(&sparx5->rx.fdma);
-	fdma_free_phys(&sparx5->tx.fdma);
+
 	return 0;
 }
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
index 340fedd1d897..a60f6a166522 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
@@ -792,8 +792,11 @@ static int sparx5_start(struct sparx5 *sparx5)
 					       sparx5_fdma_handler,
 					       0,
 					       "sparx5-fdma", sparx5);
-		if (!err)
-			err = sparx5_fdma_start(sparx5);
+		if (!err) {
+			err = sparx5_fdma_init(sparx5);
+			if (!err)
+				sparx5_fdma_start(sparx5);
+		}
 		if (err)
 			sparx5->fdma_irq = -ENXIO;
 	} else {
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
index 3ae760da17e2..7433a77204cd 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
@@ -436,6 +436,8 @@ int sparx5_manual_injection_mode(struct sparx5 *sparx5);
 void sparx5_port_inj_timer_setup(struct sparx5_port *port);
 
 /* sparx5_fdma.c */
+int sparx5_fdma_init(struct sparx5 *sparx5);
+int sparx5_fdma_deinit(struct sparx5 *sparx5);
 int sparx5_fdma_start(struct sparx5 *sparx5);
 int sparx5_fdma_stop(struct sparx5 *sparx5);
 int sparx5_fdma_xmit(struct sparx5 *sparx5, u32 *ifh, struct sk_buff *skb);

-- 
2.34.1


