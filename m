Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F817F3D603
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 13:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cThz0PXilHvIAEJ85wpR0H+ixDadyU8QdAUTBJ8DHJs=; b=1JUjZXv980Lw0oDeOQCg2pJDSW
	N+Jz0PimsA3FVMrO458ndgPjdGv8jguymFpedivk/mifU0CU6Iod0mC118lSGl3JwOujByG2de1Ml
	Si2+SjGDMywFlwXORrXuRLi8V006fbQHR7WiNwqXqjmZUjUkPsCoM3PK35XLXRYPVcsIBWsSe3uXK
	qTpFBuErfww6zoLTSTDLfhytMbyQhPRy/iQjntBfX/xkRHbpx5i3dTwRMFvrrcBFmJTxhGqhPxIfy
	FUJ/FMFr9LBmn3Y397Rswrd2E9CcR52al/aEiQThPpOf4Sz2nLi6CCkoZ63gWywyeTq2CiGMXnNAU
	/3UC48fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6ptD-00000009xTI-11q3;
	Sun, 29 Mar 2026 13:09:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6psf-00000009wwS-19p7;
	Sun, 29 Mar 2026 13:08:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DC8D2438CC;
	Sun, 29 Mar 2026 13:08:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 496F7C116C6;
	Sun, 29 Mar 2026 13:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774789720;
	bh=DCu61qQwebef9bBC33MEmi+w7rRTFLzdTPyfsR75YCM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=chMf4omYBPw++o6nbSsbeUK3lX+Awba0KdE4xck3wpTDuSE4ATjuBedOenfMK700a
	 xI01UHynFPK8T8iizR5vzaASCG0Nb526z5AuaBocgB2cLQx7h3CW/CvjSD1guXN8FV
	 vvGjJcIxARwKRM8hRz1dCpPpjjOW21b1ar91X7zsk0h1LB99/Agnw0p0y4ua95P5Lf
	 8RzV+THDKfR1BsvNNt1ExhVak1Kmfuem1Ws7FkG+9sWbgzr4JQJarIgX6OztbeePbF
	 DbQl6ikDiooHgAp1M4SH6QAUn8ZaTkThp0rzJXQM8G2DSRxfO6UhSrLmFW1SOnd//Z
	 IFdHvpNztMUvw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 29 Mar 2026 15:08:00 +0200
Subject: [PATCH net-next 10/10] net: airoha: Rename get_src_port_id
 callback in get_sport
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-airoha-eth-multi-serdes-v1-10-00f52dc360ca@kernel.org>
References: <20260329-airoha-eth-multi-serdes-v1-0-00f52dc360ca@kernel.org>
In-Reply-To: <20260329-airoha-eth-multi-serdes-v1-0-00f52dc360ca@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_060841_367213_314D2BFB 
X-CRM114-Status: GOOD (  12.55  )
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
index 3926866e711e51bb20665dfda464c5283b7616fa..5f5224838092abb1943e739733791a05b6f46526 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1751,7 +1751,7 @@ static int airhoha_set_gdm2_loopback(struct airoha_gdm_dev *dev)
 	airoha_fe_clear(eth, REG_FE_VIP_PORT_EN, BIT(AIROHA_GDM2_IDX));
 	airoha_fe_clear(eth, REG_FE_IFC_PORT_EN, BIT(AIROHA_GDM2_IDX));
 
-	src_port = eth->soc->ops.get_src_port_id(port, dev->nbq);
+	src_port = eth->soc->ops.get_sport(port, dev->nbq);
 	if (src_port < 0)
 		return src_port;
 
@@ -3227,7 +3227,7 @@ static const char * const en7581_xsi_rsts_names[] = {
 	"xfp-mac",
 };
 
-static int airoha_en7581_get_src_port_id(struct airoha_gdm_port *port, int nbq)
+static int airoha_en7581_get_sport(struct airoha_gdm_port *port, int nbq)
 {
 	switch (port->id) {
 	case AIROHA_GDM3_IDX:
@@ -3291,7 +3291,7 @@ static const char * const an7583_xsi_rsts_names[] = {
 	"xfp-mac",
 };
 
-static int airoha_an7583_get_src_port_id(struct airoha_gdm_port *port, int nbq)
+static int airoha_an7583_get_sport(struct airoha_gdm_port *port, int nbq)
 {
 	switch (port->id) {
 	case AIROHA_GDM3_IDX:
@@ -3349,7 +3349,7 @@ static const struct airoha_eth_soc_data en7581_soc_data = {
 	.num_xsi_rsts = ARRAY_SIZE(en7581_xsi_rsts_names),
 	.num_ppe = 2,
 	.ops = {
-		.get_src_port_id = airoha_en7581_get_src_port_id,
+		.get_sport = airoha_en7581_get_sport,
 		.get_dev_from_sport = airoha_en7581_get_dev_from_sport,
 	},
 };
@@ -3360,7 +3360,7 @@ static const struct airoha_eth_soc_data an7583_soc_data = {
 	.num_xsi_rsts = ARRAY_SIZE(an7583_xsi_rsts_names),
 	.num_ppe = 1,
 	.ops = {
-		.get_src_port_id = airoha_an7583_get_src_port_id,
+		.get_sport = airoha_an7583_get_sport,
 		.get_dev_from_sport = airoha_an7583_get_dev_from_sport,
 	},
 };
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index c076e36b741ce691cf309850435c352fc1fd7986..2a862be0a18d7df9589dd35935e92667c77961c9 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -586,7 +586,7 @@ struct airoha_eth_soc_data {
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


