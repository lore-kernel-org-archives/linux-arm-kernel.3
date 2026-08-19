Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EFAC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 07:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4YhGcHDU7MuqsVaCi5M0htl2NqBnc8Xb53Bnk4fCFVI=; b=Qa1R2qQrEMi/0HF72uywQM6JOZ
	I5nh4PGDzDsAGRTuE5GSW61MyKZiPZ/bwSHVYXC1KXATAXdjyfadRV8OK36eydrzTVPIOLcWGJBhB
	WjvbdXpYs9QszCBpV1zOFFA4NCDGXFt6IO40WpTf2kqlhQtF4Ve+MI9pP+p6llBAVemslIQAROhkx
	1/IX8+CDxn+koJYP5EEaLdvTo7WgqY+Qz5vRn80w/Z8ytUGuvwscN17mqT76oYejEvEMiioVJhVXu
	liC1E7G8U2rPvAMscaAnitjBShROs0NPyb+qkPQtllidnQw+HbnsEbMiA9l+7/oey4rG4RnfY1wCy
	SiCLVFCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwanU-00000009CdL-10qN;
	Wed, 19 Aug 2026 07:33:16 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwanQ-00000009CbC-3bbZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 07:33:14 +0000
X-UUID: 378973889ba011f19a56ed5b684f684d-20260819
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:0a6e9b6d-14cb-4732-99d6-28735b2b9678,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:7db8b62,CLOUDID:fec5f4ffb56ea27f3049a3cd8128a57b,BulkI
	D:nil,BulkQuantity:0,SF:102|136|850|865|898,TC:nil,Content:0|15|50,EDM:5|-
	100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 378973889ba011f19a56ed5b684f684d-20260819
X-User: gonglinkai@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <gonglinkai@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 429724535; Wed, 19 Aug 2026 15:33:05 +0800
From: Linkai Gong <gonglinkai@kylinos.cn>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Joao Pinto <Joao.Pinto@synopsys.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	gonglinkai@kylinos.cn
Subject: [PATCH] net: stmmac: platform: fix of_node leak when breaking RX queue loop
Date: Wed, 19 Aug 2026 15:32:58 +0800
Message-Id: <20260819073258.467604-1-gonglinkai@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_003313_218513_4751EF71 
X-CRM114-Status: GOOD (  10.60  )
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

for_each_child_of_node() on the RX queues breaks once enough queues are
parsed, which leaves the current child referenced. The TX loop then
overwrites q_node, so that reference is never dropped.

of_node_put() the child before breaking. The TX loop already drops its
last reference via the of_node_put(q_node) at the out label.

Fixes: d976a525c371 ("net: stmmac: multiple queues dt configuration")
Signed-off-by: Linkai Gong <gonglinkai@kylinos.cn>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index dc5f951a311d..66a048ecadb0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -170,8 +170,11 @@ static int stmmac_mtl_setup(struct platform_device *pdev,
 
 	/* Processing individual RX queue config */
 	for_each_child_of_node(rx_node, q_node) {
-		if (queue >= plat->rx_queues_to_use)
+		if (queue >= plat->rx_queues_to_use) {
+			of_node_put(q_node);
+			q_node = NULL;
 			break;
+		}
 
 		if (of_property_read_bool(q_node, "snps,dcb-algorithm"))
 			plat->rx_queues_cfg[queue].mode_to_use = MTL_QUEUE_DCB;
-- 
2.25.1

