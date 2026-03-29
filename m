Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 597ADF3D603
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 13:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IGlm4ZFk4AJmCB+SEBjHvDWGB0+hMqM+6zMY2rEtuRs=; b=tBh6bhSS8YwgJ7YwZRRb6xUcsg
	Aqp49J7u3FTEAzj7Ka7VLCNtt2dKfk3s6d4mb84JFiVWSutl3Zes5b4yoH7u11OSn7d4QwXimXnEj
	yvpRrv8ka4p9eo+ZzzUQiyQr1KAVlAX1w515G/qZyzk8s0yXh5+/hFHpirKG/yNiwaalaOnK6mfN3
	YLl86HkkhyjnguAuv3nokF+TS/VBYoInB5Qx5lPaI6J6gj/YeWUDUJlYNyz8OOpWO2ffVK61K45PD
	Z6SySPjWDhDf10Q6f9D0GFomI4ctLVrtfpxeVtQmofMsFiqe9cIpaAFfYFQw0u6t/n5jEWsm3o9Ee
	IGFNtq1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6pt6-00000009xMY-1hE2;
	Sun, 29 Mar 2026 13:09:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6psd-00000009wuI-087Z;
	Sun, 29 Mar 2026 13:08:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 76CF060121;
	Sun, 29 Mar 2026 13:08:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE146C19423;
	Sun, 29 Mar 2026 13:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774789718;
	bh=NtIVnwf+1fgtgeX/jdcQtNcD6iSxFVArk3xsGmRPJrk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lUr1td5zVcFVABKAHpPwbuSgT0Q5EXs0FY5tM0Xe72rJtrMpnJdVel69m0ukVJK5W
	 hIikSQWgRn1KU8aTCOQYSnhePPQNZtxWgGeHlk/JnxPzUibs+wkyGmqY92kDcJn+W0
	 H02TCwnIToQFncplcYvqNA0Adk/JkZpgGXJ5HRRlA/KF3L7dNbIOAnopZNpj+uFibh
	 GtUzbwwbNSt651xmMNTkPVTQktATmoGjKJnisDhXeyBmc0eZU9ks8oNQryHu+qp7oS
	 Whcbs5hU8u6jk1yRXCjxGkt9dL75lpJzNN503SQQbaAsYS1WIWvVimqnCzjdmBUu7R
	 L0GjRPu7JEBoA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 29 Mar 2026 15:07:59 +0200
Subject: [PATCH net-next 09/10] net: airoha: Do not stop GDM port if it is
 shared
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-airoha-eth-multi-serdes-v1-9-00f52dc360ca@kernel.org>
References: <20260329-airoha-eth-multi-serdes-v1-0-00f52dc360ca@kernel.org>
In-Reply-To: <20260329-airoha-eth-multi-serdes-v1-0-00f52dc360ca@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 Xuegang Lu <xuegang.lu@airoha.com>
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

Theoretically, in the current codebase, two independent net_devices can
be connected to the same GDM port so we need to check the GDM port is not
used by any other running net_device before setting the forward
configuration to FE_PSE_PORT_DROP.

Tested-by: Xuegang Lu <xuegang.lu@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 9 ++++++---
 drivers/net/ethernet/airoha/airoha_eth.h | 2 ++
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 11b6dbf3fa80c0c7620fc912b4db904eb5711b2c..3926866e711e51bb20665dfda464c5283b7616fa 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1662,6 +1662,7 @@ static int airoha_dev_open(struct net_device *netdev)
 	}
 	airoha_set_gdm_port_fwd_cfg(qdma->eth, REG_GDM_FWD_CFG(port->id),
 				    pse_port);
+	atomic_inc(&port->users);
 
 	return 0;
 }
@@ -1681,9 +1682,6 @@ static int airoha_dev_stop(struct net_device *netdev)
 	for (i = 0; i < ARRAY_SIZE(qdma->q_tx); i++)
 		netdev_tx_reset_subqueue(netdev, i);
 
-	airoha_set_gdm_port_fwd_cfg(qdma->eth, REG_GDM_FWD_CFG(port->id),
-				    FE_PSE_PORT_DROP);
-
 	if (atomic_dec_and_test(&qdma->users)) {
 		airoha_qdma_clear(qdma, REG_QDMA_GLOBAL_CFG,
 				  GLOBAL_CFG_TX_DMA_EN_MASK |
@@ -1697,6 +1695,11 @@ static int airoha_dev_stop(struct net_device *netdev)
 		}
 	}
 
+	if (atomic_dec_and_test(&port->users))
+		airoha_set_gdm_port_fwd_cfg(qdma->eth,
+					    REG_GDM_FWD_CFG(port->id),
+					    FE_PSE_PORT_DROP);
+
 	return 0;
 }
 
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 7549960fc37c68a5df73c49eace0aa57fda98030..c076e36b741ce691cf309850435c352fc1fd7986 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -546,6 +546,8 @@ struct airoha_gdm_port {
 	struct airoha_gdm_dev *devs[AIROHA_MAX_NUM_GDM_DEVS];
 	int id;
 
+	atomic_t users;
+
 	struct airoha_hw_stats stats;
 
 	DECLARE_BITMAP(qos_sq_bmap, AIROHA_NUM_QOS_CHANNELS);

-- 
2.53.0


