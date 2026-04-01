Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A6DD3514B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 07:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vdsRBne7ZdI0FgR+xlre3KE2bJa3IHcU/MUN327l770=; b=rd5DxZpOfJ7Q1ACXaMkT0kWoza
	oX/qM0hGUir4omcCYv27FplJUgZfW7blUNV/ix9gqZPvly23ZMICD5Mx1w7afbLH9YPdskmPb+NgX
	CvjNRqvCi6DCX2d/8YUXehqCu/lZJTxH+FmyV8juxztks+OT+Gp0ed9jw6/i4dO/xX0pu/r03WsrO
	zFciesgI9FZn02uGbQ4XTdgb1ffPtFuWWhstcZt5cTfz9e8bqEMVagp/vwjPpLM6mUWS7KUVz9YeL
	3leAhdf+VRYtP7v9e5K+P0Raz+YdzSMGirgmbdYXdHbm8zipAtvbijjfQYZ6lvG8hj0an543di6ui
	4x7Oo+tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7pZP-0000000E9ez-0TJ3;
	Wed, 01 Apr 2026 07:00:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7pYy-0000000E9Io-3dtQ;
	Wed, 01 Apr 2026 07:00:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 50C1C60120;
	Wed,  1 Apr 2026 07:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1414C19423;
	Wed,  1 Apr 2026 07:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775026828;
	bh=rKB6NCTfSJerwzXc5ECxtH/BIBNk91ILLJjYQp+2yD0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fDUitm7GNQQXzNA59nS9oQ+rekPMkYdaAJdlk+rW5KzJMn8YNH9JVc9b52qo5VCWB
	 gHLGKR10/qyIa93lVmODzSHZDVV+Qnk6H0SrOEJcaTFYkoGveO7//Alt/oTejIPjpb
	 CrgHbA+CRICMfq6kV+Qz/pzTzTRDpPrDVf/bYMd9OPwOe2pLwybIxFiBu9h0zfrPyL
	 RbicVHN6iKk9eFH5qwAct0lxLUJLE8dKNBbFKgvNAPQeJKJm5s+nFSiSTGjOAMowGA
	 dp24ZwjcShDukeiq0xqVRu8hSCYwafQ80ymlPdmA+okLe+Y8ilBM4Ii5oZA4gBSJTR
	 xqOA7iA9SJZTw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 01 Apr 2026 08:59:28 +0200
Subject: [PATCH net-next v2 10/11] net: airoha: Do not stop GDM port if it
 is shared
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-airoha-eth-multi-serdes-v2-10-ac427ae4beeb@kernel.org>
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
index 0780fb8aacfbc51fdd896de7be70fb34ee49e864..3f9bce8c537081756aff276009c77670ec5915f4 100644
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
index d641b648b7974db2d8f203639b987db03af1a603..337bb2d1b59fac6d7bed216e7d7dbbe1ca89d3c5 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -545,6 +545,8 @@ struct airoha_gdm_port {
 	struct airoha_gdm_dev *devs[AIROHA_MAX_NUM_GDM_DEVS];
 	int id;
 
+	atomic_t users;
+
 	struct airoha_hw_stats stats;
 
 	DECLARE_BITMAP(qos_sq_bmap, AIROHA_NUM_QOS_CHANNELS);

-- 
2.53.0


