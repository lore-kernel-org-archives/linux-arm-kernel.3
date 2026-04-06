Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E6AEF4ECD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 10:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=77yFOdaXUTaqkj5JQcxywG/dnz7QnSEmk3PZTAME1uI=; b=UXWXMhIv/R1U+R61YqPFXbpUOF
	QVWsqNZM9m0zFOT10KTXnZB0e8qKYOTmvqwLCdiuoEsMxw1ZaJ3+2c/6pH4LVnA9ajtfxi55UkAi5
	9K8TzKr8AOmX4TTNdm0l+1+8glpgeH4wjXi0rwnkBRKEuzRIpHu2DfDVXfRkPBwn6f1epUsioNuRX
	rsKMS4/el/J4vy0qPJWT5HsEmYV3w7dM/iXn8sKQTGU0QR+FxbQXe03eo+02wg/zlvCPelvLYhsKR
	DlnuQH9jMBhajOla4BTotusDclc94rHC56vsu7XTtel1eqa2TzGFOk/gPfh1Vg3wf1JDW7al7VI3V
	c52867gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9hJl-000000051tr-164M;
	Mon, 06 Apr 2026 10:36:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9hIg-000000051QO-3owK;
	Mon, 06 Apr 2026 10:35:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5B484600AC;
	Mon,  6 Apr 2026 10:35:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2E03C4CEF7;
	Mon,  6 Apr 2026 10:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775471722;
	bh=8Mrg0yy4Xk/C/etY2AlCJfZSISnYqkitJZWt4ANfVg4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XSraxYjCgU2J0H4fZt2UrtpCMSvrd0BINn2NKUnixlTRwQKX3841/yr6APDsyWLhr
	 qYgkshMMezsdYHobUf81wY5fFSjqQTaewACtRnMgJ6scHoIX2+tr5ZSJo/s//gjICG
	 q1uU0mnBMVPK1i3T+zKIykv0yOvtg5O31Ltw951gBX51lKatP6kUYxapsnUw7ygBlv
	 gjk6KvkTLO66flsBbZ9MyEL/ElXTFRIPjB6ta+ENDmCF6qlWJnHrv68SyGcDhm7EqA
	 YpHzGjTlTm7qKmAlwJvGvfH/uguzDOKctnxeewYD7T5o/qfiofwAiAWw4k5s52qaET
	 C6G5fFO+CfpOg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 06 Apr 2026 12:34:17 +0200
Subject: [PATCH net-next v3 12/12] net: airoha: Rename get_src_port_id
 callback in get_sport
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260406-airoha-eth-multi-serdes-v3-12-ab6ea49d59ff@kernel.org>
References: <20260406-airoha-eth-multi-serdes-v3-0-ab6ea49d59ff@kernel.org>
In-Reply-To: <20260406-airoha-eth-multi-serdes-v3-0-ab6ea49d59ff@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, 
 Benjamin Larsson <benjamin.larsson@genexis.eu>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
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

For code consistency, rename get_src_port_id callback in get_sport.
Please note this patch does not introduce any logical change and it is
just a cosmetic patch.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 12 ++++++------
 drivers/net/ethernet/airoha/airoha_eth.h |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 9988011dca53..c14dee3c9bfb 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1770,7 +1770,7 @@ static int airoha_set_gdm2_loopback(struct airoha_gdm_dev *dev)
 	airoha_fe_clear(eth, REG_FE_VIP_PORT_EN, BIT(AIROHA_GDM2_IDX));
 	airoha_fe_clear(eth, REG_FE_IFC_PORT_EN, BIT(AIROHA_GDM2_IDX));
 
-	src_port = eth->soc->ops.get_src_port_id(port, dev->nbq);
+	src_port = eth->soc->ops.get_sport(port, dev->nbq);
 	if (src_port < 0)
 		return src_port;
 
@@ -3102,7 +3102,7 @@ static int airoha_alloc_gdm_port(struct airoha_eth *eth,
 
 		/* Verify the provided nbq parameter is valid */
 		nbq = be32_to_cpup(nbq_ptr);
-		err = eth->soc->ops.get_src_port_id(port, nbq);
+		err = eth->soc->ops.get_sport(port, nbq);
 		if (err < 0) {
 			of_node_put(node);
 			return err;
@@ -3309,7 +3309,7 @@ static const char * const en7581_xsi_rsts_names[] = {
 	"xfp-mac",
 };
 
-static int airoha_en7581_get_src_port_id(struct airoha_gdm_port *port, int nbq)
+static int airoha_en7581_get_sport(struct airoha_gdm_port *port, int nbq)
 {
 	switch (port->id) {
 	case AIROHA_GDM3_IDX:
@@ -3373,7 +3373,7 @@ static const char * const an7583_xsi_rsts_names[] = {
 	"xfp-mac",
 };
 
-static int airoha_an7583_get_src_port_id(struct airoha_gdm_port *port, int nbq)
+static int airoha_an7583_get_sport(struct airoha_gdm_port *port, int nbq)
 {
 	switch (port->id) {
 	case AIROHA_GDM3_IDX:
@@ -3431,7 +3431,7 @@ static const struct airoha_eth_soc_data en7581_soc_data = {
 	.num_xsi_rsts = ARRAY_SIZE(en7581_xsi_rsts_names),
 	.num_ppe = 2,
 	.ops = {
-		.get_src_port_id = airoha_en7581_get_src_port_id,
+		.get_sport = airoha_en7581_get_sport,
 		.get_dev_from_sport = airoha_en7581_get_dev_from_sport,
 	},
 };
@@ -3442,7 +3442,7 @@ static const struct airoha_eth_soc_data an7583_soc_data = {
 	.num_xsi_rsts = ARRAY_SIZE(an7583_xsi_rsts_names),
 	.num_ppe = 1,
 	.ops = {
-		.get_src_port_id = airoha_an7583_get_src_port_id,
+		.get_sport = airoha_an7583_get_sport,
 		.get_dev_from_sport = airoha_an7583_get_dev_from_sport,
 	},
 };
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 8dec25fa0478..ec31a3b5efc3 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -591,7 +591,7 @@ struct airoha_eth_soc_data {
 	int num_xsi_rsts;
 	int num_ppe;
 	struct {
-		int (*get_src_port_id)(struct airoha_gdm_port *port, int nbq);
+		int (*get_sport)(struct airoha_gdm_port *port, int nbq);
 		int (*get_dev_from_sport)(struct airoha_qdma_desc *desc,
 					  u16 *port, u16 *dev);
 	} ops;

-- 
2.53.0


