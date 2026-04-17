Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD74F436B8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 15:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kR/IuqR4zpU+dmtxH2bcLYT3gUoL/56LmGEsd7GJzmE=; b=J7H9XOkSbDRFBH+4yG5xd8cAkP
	lKbh8lqLfnOh7jVfrw/HdwthxeL70LmmnljgkDB5ZjZUUGLqqIw3kAUcOEVd3f4vYhQ0KiUIHeFXP
	SmPiM/e1B3BqRL0S171xtrWQPQz0bcq0Tf4pm0k6OLuX/DYnSWCeh5CcA3g9jWDiserVY62dF2fPe
	99hjCQFB+mM0goyNvbaaqqHJYf720HHDl0oFIZYNqeE+T8y4P7c5OfjZnZOdu42gkSXreeTc/GHS5
	kenvdwzt7Zeqh3JOrnXZCYDjGDUgLvMnVGe3I7CL/2frSMjpcpkP1yQSfLv4r7iQjDOlqLisE2SeY
	JilgswqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDl4N-00000004CwP-2IIW;
	Fri, 17 Apr 2026 15:25:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDl4K-00000004Cvk-3Qd6;
	Fri, 17 Apr 2026 15:25:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0025843E78;
	Fri, 17 Apr 2026 15:25:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27025C19425;
	Fri, 17 Apr 2026 15:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776439519;
	bh=MoXDICb71/sK4BHUlXqttpDfMwpW49pJQj3fKijhdDA=;
	h=From:Date:Subject:To:Cc:From;
	b=SMvjzMljAZHauG6gD0bNqhWYyjuipEdsveuZypTmI1dB586xX3HPhKbRGExqAPnjg
	 L2eDN+HgK4QL40hNV4HtfgrhHUPxxBTmbBx8DkQuBbvox6JYfVjVEQ2GCHxRSF5Fr2
	 Wb5MGyM48jRrLEBquhS5lPSNTaLdwg9AU0+9dAAfWbByfKfefKQcNy7IGzEOXD7U6M
	 IB41S0mMZFiu4vxHqPTv1uSrc+LNEKgwIIGeNP9IxC94fAdzwbPUOuciqJZ8bu+ALw
	 ZE575ZLkwfNdzg2qYGkrnKapWAsP0pir1swtq4RFLzhQ+v4ntTAeXLlFKQ2eUT1UMM
	 Xa/4lVdPNTegQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 17 Apr 2026 17:24:41 +0200
Subject: [PATCH net] net: airoha: Fix PPE cpu port configuration for GDM2
 loopback path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-airoha-ppe-cpu-port-for-gdm2-loopback-v1-1-c7a9de0f6f57@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NwQrCMAyA4VcZORtYi27UVxEPbZdtQW1COkUYe
 3eLx+/y/ztUMqYK124How9XltLgTh3kNZaFkKdm8L0f+rMbMbLJGlGVMOsbVWzDWQyX6eXxKaI
 p5geGIYV08W4M2UFrqdHM3//nBoU2uB/HDzmgfZB8AAAA
X-Change-ID: 20260417-airoha-ppe-cpu-port-for-gdm2-loopback-96b9b52179c1
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Simon Horman <horms@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_082520_902053_506C7008 
X-CRM114-Status: GOOD (  14.07  )
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

When QoS loopback is enabled for GDM3 or GDM4, incoming packets are
forwarded to GDM2. However, the PPE cpu port for GDM2 is not configured
in this path, causing traffic originating from GDM3/GDM4, which may
be set up as WAN ports backed by QDMA1, to be incorrectly directed
to QDMA0 instead.
Configure the PPE cpu port for GDM2 when QoS loopback is active on
GDM3 or GDM4 to ensure traffic is routed to the correct QDMA instance.

Fixes: 9cd451d414f6 ("net: airoha: Add loopback support for GDM2")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 8 ++++++--
 drivers/net/ethernet/airoha/airoha_eth.h | 3 ++-
 drivers/net/ethernet/airoha/airoha_ppe.c | 6 +++---
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index e1ab15f1ee7d..d2b7c437a782 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1727,7 +1727,7 @@ static int airoha_set_gdm2_loopback(struct airoha_gdm_port *port)
 {
 	struct airoha_eth *eth = port->qdma->eth;
 	u32 val, pse_port, chan;
-	int src_port;
+	int i, src_port;
 
 	/* Forward the traffic to the proper GDM port */
 	pse_port = port->id == AIROHA_GDM3_IDX ? FE_PSE_PORT_GDM3
@@ -1769,6 +1769,9 @@ static int airoha_set_gdm2_loopback(struct airoha_gdm_port *port)
 		      SP_CPORT_MASK(val),
 		      __field_prep(SP_CPORT_MASK(val), FE_PSE_PORT_CDM2));
 
+	for (i = 0; i < eth->soc->num_ppe; i++)
+		airoha_ppe_set_cpu_port(port, i, AIROHA_GDM2_IDX);
+
 	if (port->id == AIROHA_GDM4_IDX && airoha_is_7581(eth)) {
 		u32 mask = FC_ID_OF_SRC_PORT_MASK(port->nbq);
 
@@ -1807,7 +1810,8 @@ static int airoha_dev_init(struct net_device *dev)
 	}
 
 	for (i = 0; i < eth->soc->num_ppe; i++)
-		airoha_ppe_set_cpu_port(port, i);
+		airoha_ppe_set_cpu_port(port, i,
+					airoha_get_fe_port(port));
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 95e557638617..715aa26cbac8 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -653,7 +653,8 @@ int airoha_get_fe_port(struct airoha_gdm_port *port);
 bool airoha_is_valid_gdm_port(struct airoha_eth *eth,
 			      struct airoha_gdm_port *port);
 
-void airoha_ppe_set_cpu_port(struct airoha_gdm_port *port, u8 ppe_id);
+void airoha_ppe_set_cpu_port(struct airoha_gdm_port *port, u8 ppe_id,
+			     u8 fport);
 bool airoha_ppe_is_enabled(struct airoha_eth *eth, int index);
 void airoha_ppe_check_skb(struct airoha_ppe_dev *dev, struct sk_buff *skb,
 			  u16 hash, bool rx_wlan);
diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 859818676b69..5c9dff6bccd1 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -85,10 +85,9 @@ static u32 airoha_ppe_get_timestamp(struct airoha_ppe *ppe)
 	return FIELD_GET(AIROHA_FOE_IB1_BIND_TIMESTAMP, timestamp);
 }
 
-void airoha_ppe_set_cpu_port(struct airoha_gdm_port *port, u8 ppe_id)
+void airoha_ppe_set_cpu_port(struct airoha_gdm_port *port, u8 ppe_id, u8 fport)
 {
 	struct airoha_qdma *qdma = port->qdma;
-	u8 fport = airoha_get_fe_port(port);
 	struct airoha_eth *eth = qdma->eth;
 	u8 qdma_id = qdma - &eth->qdma[0];
 	u32 fe_cpu_port;
@@ -182,7 +181,8 @@ static void airoha_ppe_hw_init(struct airoha_ppe *ppe)
 			if (!port)
 				continue;
 
-			airoha_ppe_set_cpu_port(port, i);
+			airoha_ppe_set_cpu_port(port, i,
+						airoha_get_fe_port(port));
 		}
 	}
 }

---
base-commit: 82c21069028c5db3463f851ae8ac9cc2e38a3827
change-id: 20260417-airoha-ppe-cpu-port-for-gdm2-loopback-96b9b52179c1

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


