Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9ACD35144
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 07:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UrkFsLKIX2f88NcAiZCmJmcVyJyMz8+p7lKis3Rh/9Q=; b=Vwbzmn2Vgz3pWe1c3F0sjl6uyf
	ATp7YWaGQN6GLsZyXR2cw/OSIAClFW0i6aST1t0dsjJEd6AeOfAkVzPtthHUKldyfOsBoKJKfXW5+
	twzxoKeV22tewO2rbru2pIEawW/loLxMVGwHp+PMvFRj7fwdPHRVXjovyFW7L0/6WN/A24MHn+N3a
	WV7amrENVwcOXGmdTwDiSKk9cDPNUh5lLAgScoMcx/WQBH5GAH1AwFBTWQo8WV1JE5dViSvsOfYs0
	Gqx+P4d6eZuXf/j5lc2YIBLUP/T34seAxmmekkHlzw3j0Q17ezAcSsW9GDGFoBAchmmi1A+Z3Qeot
	XZWiUk4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7pZP-0000000E9fq-4Abu;
	Wed, 01 Apr 2026 07:00:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7pZ1-0000000E9L4-2hz7;
	Wed, 01 Apr 2026 07:00:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1375E60121;
	Wed,  1 Apr 2026 07:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FDF1C2BCB2;
	Wed,  1 Apr 2026 07:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775026830;
	bh=zot45+s4jeVdAguxss4LYuLtmhR3y6kpT1CAA1uASco=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rm4zgsjp66OmWKDxKb+cbYUgPP6BpbKod/CPq8WZDAtuGd2VjljIsq+jW79GCyRL0
	 bJLxHgxybJXdGsRcffN5m5QC2HdH1rWtg/JqZxCkceA2mSnUuK7XRsOqp9vlIrn0vi
	 Hp97akhbi/2WvCKGdeo6rOfQ3W2rWeoV2D3TrIN3BD0ViGMKgYTh0rGPW7jOBSyZ+/
	 kjf8ikAnYIRK3tOVvbfwK5FPGqVtOGUsn0AhaT++CGdVvjcm+mHB1QdSF4X1R3cGaG
	 PUnRv87zg1Y99EzrRnGquoyw3q0NG4cL8n8r13s8ot/dwN+C4g3sUhYsKkuevgjLxH
	 dRI0zeEng9b9w==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 01 Apr 2026 08:59:29 +0200
Subject: [PATCH net-next v2 11/11] net: airoha: Rename get_src_port_id
 callback in get_sport
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-airoha-eth-multi-serdes-v2-11-ac427ae4beeb@kernel.org>
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
 drivers/net/ethernet/airoha/airoha_eth.c | 10 +++++-----
 drivers/net/ethernet/airoha/airoha_eth.h |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 3f9bce8c537081756aff276009c77670ec5915f4..5fe48601bb623f9dba9d3a4d2c1fd6c8276aba88 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1751,7 +1751,7 @@ static int airoha_set_gdm2_loopback(struct airoha_gdm_dev *dev)
 	airoha_fe_clear(eth, REG_FE_VIP_PORT_EN, BIT(AIROHA_GDM2_IDX));
 	airoha_fe_clear(eth, REG_FE_IFC_PORT_EN, BIT(AIROHA_GDM2_IDX));
 
-	src_port = eth->soc->ops.get_src_port_id(port, dev->nbq);
+	src_port = eth->soc->ops.get_sport(port, dev->nbq);
 	if (src_port < 0)
 		return src_port;
 
@@ -3228,7 +3228,7 @@ static const char * const en7581_xsi_rsts_names[] = {
 	"xfp-mac",
 };
 
-static int airoha_en7581_get_src_port_id(struct airoha_gdm_port *port, int nbq)
+static int airoha_en7581_get_sport(struct airoha_gdm_port *port, int nbq)
 {
 	switch (port->id) {
 	case AIROHA_GDM3_IDX:
@@ -3292,7 +3292,7 @@ static const char * const an7583_xsi_rsts_names[] = {
 	"xfp-mac",
 };
 
-static int airoha_an7583_get_src_port_id(struct airoha_gdm_port *port, int nbq)
+static int airoha_an7583_get_sport(struct airoha_gdm_port *port, int nbq)
 {
 	switch (port->id) {
 	case AIROHA_GDM3_IDX:
@@ -3350,7 +3350,7 @@ static const struct airoha_eth_soc_data en7581_soc_data = {
 	.num_xsi_rsts = ARRAY_SIZE(en7581_xsi_rsts_names),
 	.num_ppe = 2,
 	.ops = {
-		.get_src_port_id = airoha_en7581_get_src_port_id,
+		.get_sport = airoha_en7581_get_sport,
 		.get_dev_from_sport = airoha_en7581_get_dev_from_sport,
 	},
 };
@@ -3361,7 +3361,7 @@ static const struct airoha_eth_soc_data an7583_soc_data = {
 	.num_xsi_rsts = ARRAY_SIZE(an7583_xsi_rsts_names),
 	.num_ppe = 1,
 	.ops = {
-		.get_src_port_id = airoha_an7583_get_src_port_id,
+		.get_sport = airoha_an7583_get_sport,
 		.get_dev_from_sport = airoha_an7583_get_dev_from_sport,
 	},
 };
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 337bb2d1b59fac6d7bed216e7d7dbbe1ca89d3c5..bbd83d7b6453ae5e45b2e324bbee47883978675f 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -585,7 +585,7 @@ struct airoha_eth_soc_data {
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


