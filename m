Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72FB5CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 07:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xZ8FZ9ndiKbk2AY99Rg8sCJxgkrvdvh82pIyrOJepIk=; b=O2oEbrTsAwVpt7sNkh8mXKq185
	zi7Ej9VR6tzfwIzbJVAEcheH5zxt2MflkUK7PCJ+flcf3hZAdhBw3VyebWB7k4TLJjfFXclJhJ6PX
	AdA5pn0jWoZwsc3AwGxrvZvxOGsw+wDRN4bH8KUW0IQlfsGMZkF7JdnJwywhWBvozwvjfmfzv12K5
	5QC2yN5UAQGWx1mD5KR+vdQSS2rJiuieBC5SNGw0udCHMRNWke60UebThNrdyjrZFMdgHpYyjXwxZ
	MCbi+hUmX4eOpOKpPfPR3V8pBzXSHumTpA/v7eS52UnCGcOFrTaCteh0zbfZkiOA1OlTYOpmI9KDh
	ALGeYtdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8vjw-00000000gpQ-0aFi;
	Wed, 15 Oct 2025 07:16:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8vjp-00000000gi5-1Loz;
	Wed, 15 Oct 2025 07:15:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E677241877;
	Wed, 15 Oct 2025 07:15:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 726DBC4CEF9;
	Wed, 15 Oct 2025 07:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760512556;
	bh=ztyA9W1K/1nlwkdJRr2NmB5/GYOpfXsTuWsxzmHDkkI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CfpM+RYt+NpoQ/CaIqAqAiPQOshqrOR9EbcpGMWx5+KSHiOe0BFHGmX/vhCEk6VTc
	 7okS5Fodz1DebVDPIIiXQw0YAX6NtCqgWacob2SDwdpyLiZ4Pbi0j8GZjlHFguRQuc
	 C8/Eoq4RI2+aLrC29HNmORpweDb7NpBQeI2D0HPTZhaJHS6CMh6mUMs8u0Op1sEDmf
	 3UM/R3yHBaJP3AvQiIs6MBCBD9KcLFJDs+D3c4rlfBeiNMm+yggCB30zAlITfwUOUU
	 JJRb+JxOWcsXLS03k7UK5ZnXVOLAfO74/KZjtz3WnQY272U7FNFAj95bkxY+IqZWbp
	 x6MIIiOvaq2lw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 15 Oct 2025 09:15:10 +0200
Subject: [PATCH net-next 10/12] net: airoha: Select default ppe cpu port in
 airoha_dev_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-an7583-eth-support-v1-10-064855f05923@kernel.org>
References: <20251015-an7583-eth-support-v1-0-064855f05923@kernel.org>
In-Reply-To: <20251015-an7583-eth-support-v1-0-064855f05923@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_001557_412851_6960145A 
X-CRM114-Status: GOOD (  10.83  )
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

Select PPE default cpu port in airoha_dev_init routine.
For PPE2 always use secondary cpu port. For PPE1 select cpu port
according to the running QDMA.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 38 ++++++++++++++------------------
 1 file changed, 16 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 99e7fea52c6db9c4686fcef368f21e25f21ced58..5f6b5ab52e0265f7bb56b008ca653d64e04ff2d2 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -531,25 +531,6 @@ static int airoha_fe_init(struct airoha_eth *eth)
 	/* disable IFC by default */
 	airoha_fe_clear(eth, REG_FE_CSR_IFC_CFG, FE_IFC_EN_MASK);
 
-	airoha_fe_wr(eth, REG_PPE_DFT_CPORT0(0),
-		     FIELD_PREP(DFT_CPORT_MASK(7), FE_PSE_PORT_CDM1) |
-		     FIELD_PREP(DFT_CPORT_MASK(6), FE_PSE_PORT_CDM1) |
-		     FIELD_PREP(DFT_CPORT_MASK(5), FE_PSE_PORT_CDM1) |
-		     FIELD_PREP(DFT_CPORT_MASK(4), FE_PSE_PORT_CDM1) |
-		     FIELD_PREP(DFT_CPORT_MASK(3), FE_PSE_PORT_CDM1) |
-		     FIELD_PREP(DFT_CPORT_MASK(2), FE_PSE_PORT_CDM1) |
-		     FIELD_PREP(DFT_CPORT_MASK(1), FE_PSE_PORT_CDM1) |
-		     FIELD_PREP(DFT_CPORT_MASK(0), FE_PSE_PORT_CDM1));
-	airoha_fe_wr(eth, REG_PPE_DFT_CPORT0(1),
-		     FIELD_PREP(DFT_CPORT_MASK(7), FE_PSE_PORT_CDM2) |
-		     FIELD_PREP(DFT_CPORT_MASK(6), FE_PSE_PORT_CDM2) |
-		     FIELD_PREP(DFT_CPORT_MASK(5), FE_PSE_PORT_CDM2) |
-		     FIELD_PREP(DFT_CPORT_MASK(4), FE_PSE_PORT_CDM2) |
-		     FIELD_PREP(DFT_CPORT_MASK(3), FE_PSE_PORT_CDM2) |
-		     FIELD_PREP(DFT_CPORT_MASK(2), FE_PSE_PORT_CDM2) |
-		     FIELD_PREP(DFT_CPORT_MASK(1), FE_PSE_PORT_CDM2) |
-		     FIELD_PREP(DFT_CPORT_MASK(0), FE_PSE_PORT_CDM2));
-
 	/* enable 1:N vlan action, init vlan table */
 	airoha_fe_set(eth, REG_MC_VLAN_EN, MC_VLAN_EN_MASK);
 
@@ -1756,8 +1737,10 @@ static void airhoha_set_gdm2_loopback(struct airoha_gdm_port *port)
 static int airoha_dev_init(struct net_device *dev)
 {
 	struct airoha_gdm_port *port = netdev_priv(dev);
-	struct airoha_eth *eth = port->qdma->eth;
-	u32 pse_port;
+	struct airoha_qdma *qdma = port->qdma;
+	struct airoha_eth *eth = qdma->eth;
+	u32 pse_port, fe_cpu_port;
+	u8 ppe_id;
 
 	airoha_set_macaddr(port, dev->dev_addr);
 
@@ -1770,16 +1753,27 @@ static int airoha_dev_init(struct net_device *dev)
 		fallthrough;
 	case 2:
 		if (airoha_ppe_is_enabled(eth, 1)) {
+			/* For PPE2 always use secondary cpu port. */
+			fe_cpu_port = FE_PSE_PORT_CDM2;
 			pse_port = FE_PSE_PORT_PPE2;
 			break;
 		}
 		fallthrough;
-	default:
+	default: {
+		u8 qdma_id = qdma - &eth->qdma[0];
+
+		/* For PPE1 select cpu port according to the running QDMA. */
+		fe_cpu_port = qdma_id ? FE_PSE_PORT_CDM2 : FE_PSE_PORT_CDM1;
 		pse_port = FE_PSE_PORT_PPE1;
 		break;
 	}
+	}
 
 	airoha_set_gdm_port_fwd_cfg(eth, REG_GDM_FWD_CFG(port->id), pse_port);
+	ppe_id = pse_port == FE_PSE_PORT_PPE2 ? 1 : 0;
+	airoha_fe_rmw(eth, REG_PPE_DFT_CPORT0(ppe_id),
+		      DFT_CPORT_MASK(port->id),
+		      fe_cpu_port << __ffs(DFT_CPORT_MASK(port->id)));
 
 	return 0;
 }

-- 
2.51.0


