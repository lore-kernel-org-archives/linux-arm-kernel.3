Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B63B3D3514B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 07:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7xRrqKsMUNLfTRInkBJ/FobkXs7k6wmq7ioaLYEIWlY=; b=t8bJuq/ePCwimJ5H8TwqYHtFRd
	AdOK0yVE/MGFC5tXNf7wMzAcL3O0oQRtRDQOt+GZdNuBLVSqImN9e1KAs34hDFa5mL72E007rj6Zf
	NnCO9EOKVLxAwUZ/4AvzeAxqh7X5hiwj6DzTINRKW+3j3DFYPDCMN8cWBt9NhqFt4WESEiQOXQIC6
	Q/ci5yYofXK2NZrc3WwdX7doQwg8YMAg5FT8Ix81huZVFAuYOALzvgjRXgTYHIZa0kidun02gEHNV
	Evh3GYQSYPMHEEHYe+jUIDD8+7y+U5ie3ZPvIocQtOB1AUxbSW+59GsWpBnQUt/OjkVBR2t4hiiRJ
	rUa28OrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7pYo-0000000E961-1RQ8;
	Wed, 01 Apr 2026 07:00:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7pYd-0000000E90x-2tdG;
	Wed, 01 Apr 2026 07:00:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CF0E5404DB;
	Wed,  1 Apr 2026 07:00:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E36FC2BCB2;
	Wed,  1 Apr 2026 07:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775026806;
	bh=LoKILA/pw4fFDtdnNkPqQt1xHR87BfHMh1ltAx29UpA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=l2DVLH+m2w+jJIBfF9rERoSA2bH2lYnGH+BRnaawtv6O+HvhlFFTepw3wsd6YY2Dj
	 Qqt/oDz98nHlPQ3TUJXTRFBC2upB9L0Emr7/hIPy+4CtMOtvqxIAwlPMdasj4dsBdH
	 p0S70Fnhy/hmq78FpsWt/RK+7hFn+QXzsAKMvuAUHBWEBaEi8oGo6nx0e++nHOpPAx
	 fiU4jnqqLYQAexT2Emh/9/aU9HjBrhb2jxhY0KU+ZRMCPUWEKl2P944VQf4TjXAStm
	 kn6qIVGDqf2Jk5omMHeDByFfrxtAioy6R/HTSCjKztYCIfYOH0VOIgsqa8Ts5latyX
	 q1O7svsE1c7ag==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 01 Apr 2026 08:59:20 +0200
Subject: [PATCH net-next v2 02/11] net: airoha: Set PPE cpu port for GDM2
 if loopback is enabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-airoha-eth-multi-serdes-v2-2-ac427ae4beeb@kernel.org>
References: <20260401-airoha-eth-multi-serdes-v2-0-ac427ae4beeb@kernel.org>
In-Reply-To: <20260401-airoha-eth-multi-serdes-v2-0-ac427ae4beeb@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, 
 Benjamin Larsson <benjamin.larsson@genexis.eu>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_000007_785692_68028BDE 
X-CRM114-Status: GOOD (  15.61  )
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

Add missing PPE cpu port configuration for GDM2 if QoS loopback is enabled
for GDM3 or GDM4 ports. Similar to commit 'f44218cd5e6a ("net: airoha:
Reset PPE cpu port configuration in airoha_ppe_hw_init()"), this patch is
fixing an issue not visible to the user (so we do not need to backport it)
since airoha_eth driver currently supports just the internal phy available
via the MT7530 DSA switch and there are no WAN interfaces officially
supported since PCS/external phy is not merged mainline yet (it will be
posted with following patches).

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 8 ++++++--
 drivers/net/ethernet/airoha/airoha_eth.h | 3 ++-
 drivers/net/ethernet/airoha/airoha_ppe.c | 6 +++---
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 2beba017e791d20f142e754edafcd402d8cc496f..ff5fc852d7dc3960fdcf6ae7465896340c3f43a0 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1713,7 +1713,7 @@ static int airoha_set_gdm2_loopback(struct airoha_gdm_port *port)
 {
 	struct airoha_eth *eth = port->qdma->eth;
 	u32 val, pse_port, chan, nbq;
-	int src_port;
+	int i, src_port;
 
 	/* Forward the traffic to the proper GDM port */
 	pse_port = port->id == AIROHA_GDM3_IDX ? FE_PSE_PORT_GDM3
@@ -1757,6 +1757,9 @@ static int airoha_set_gdm2_loopback(struct airoha_gdm_port *port)
 		      SP_CPORT_MASK(val),
 		      __field_prep(SP_CPORT_MASK(val), FE_PSE_PORT_CDM2));
 
+	for (i = 0; i < eth->soc->num_ppe; i++)
+		airoha_ppe_set_cpu_port(port, i, AIROHA_GDM2_IDX);
+
 	if (port->id == AIROHA_GDM4_IDX && airoha_is_7581(eth)) {
 		u32 mask = FC_ID_OF_SRC_PORT_MASK(nbq);
 
@@ -1795,7 +1798,8 @@ static int airoha_dev_init(struct net_device *dev)
 	}
 
 	for (i = 0; i < eth->soc->num_ppe; i++)
-		airoha_ppe_set_cpu_port(port, i);
+		airoha_ppe_set_cpu_port(port, i,
+					airoha_get_fe_port(port));
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 7df4dbcd8861856c54c2a38bc89c69180ac2f6dc..f04b8d8cfc09f74f288c347d03e18b4f4f3aa893 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -650,7 +650,8 @@ int airoha_get_fe_port(struct airoha_gdm_port *port);
 bool airoha_is_valid_gdm_port(struct airoha_eth *eth,
 			      struct airoha_gdm_port *port);
 
-void airoha_ppe_set_cpu_port(struct airoha_gdm_port *port, u8 ppe_id);
+void airoha_ppe_set_cpu_port(struct airoha_gdm_port *port, u8 ppe_id,
+			     u8 fport);
 bool airoha_ppe_is_enabled(struct airoha_eth *eth, int index);
 void airoha_ppe_check_skb(struct airoha_ppe_dev *dev, struct sk_buff *skb,
 			  u16 hash, bool rx_wlan);
diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 58b14aea7c2f33ebce11c51d892eefff692378ca..0f42247a2ef3d67b7dadb6201079ff2c2defbf0d 100644
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
@@ -174,7 +173,8 @@ static void airoha_ppe_hw_init(struct airoha_ppe *ppe)
 			if (!port)
 				continue;
 
-			airoha_ppe_set_cpu_port(port, i);
+			airoha_ppe_set_cpu_port(port, i,
+						airoha_get_fe_port(port));
 		}
 	}
 }

-- 
2.53.0


