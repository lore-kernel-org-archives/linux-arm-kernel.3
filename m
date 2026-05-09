Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F147BCD37B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 13:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BuPgtfusERwVOwdY16wmHN4v/NNCzf8gJD5HJ0gFsc8=; b=saE+6IQZAsb+CC
	1LKBwoL7SxBlsaQSPzx/mII84l7iKtAAL8Y2R+sVoInKNs6ohtODb+9CA6mfYypmyzbk4bZx5zPqz
	DMx2KJfl+GTD/VEA9IbDlmnFdQDLN72oI0bOIrQufNR+aDHZ1Lfxxpa1Nv2CzTl1O+3xras/Te6cu
	VPEzuEzBsjBXhrQsiIddOfs3UF9rotXvcYoGUbKDX//TrEDr4KCIei9JtKmNho8u7M3/hucsYKLP2
	yRL68h9L7zhxIKnFtPq0zU2ci/XDDPlSWr7ykGR+umpH1dR/ztXZISLTatLEpiIzDP4WbqdG5wAdL
	LxWiuKs4zae3NbVftLkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLhNU-00000008yGQ-41lt;
	Sat, 09 May 2026 13:05:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLhNT-00000008yG8-0Un1;
	Sat, 09 May 2026 13:05:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4EC226024D;
	Sat,  9 May 2026 13:05:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DFFEC2BCB2;
	Sat,  9 May 2026 13:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778331954;
	bh=gb7mGI1ybcfQRhKJ1hSBPApVKm8A4ms+Frof0TyZ92w=;
	h=From:Subject:Date:To:Cc:From;
	b=fllg43zzCJHEgKEch5dg4knY0W8RVzvBnjM4GCM3VZz0+AbQDdqgwbFrJicN9jvDG
	 dk+5esMVT6MdZfVuY+iDAGSM3EgGDT4eJPQEdgi0Hw4MPrmTNr7LETZfoGJwDaSzRL
	 bxNI9h1mTI9d4srcka0rI2QjQYzOCgmCloKTaC/fYeMm7tF0Kcjq2os/GMM5wNaUAi
	 +VkRW3wDt2ScyMB+4dLRZf2J6//00i6PQsTE580htayBu/DpJBZrHGvvSuFJo2D6wk
	 LE8u6TsWddccpQxt8vMGdf15IsoPJARokO3AOrEvgLyiz77QmYy6bIwT3GFEas0aM/
	 YG6+erAiDYXEg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next v5 00/12] net: airoha: Support multiple
 net_devices connected to the same GDM port
Date: Sat, 09 May 2026 15:05:25 +0200
Message-Id: <20260509-airoha-eth-multi-serdes-v5-0-805e38edc2aa@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNS2rDMBgE4KsEravy62ncVe9RupDsUSyaykFST
 Urw3auYQlqCl8Mw31xZQY4o7OVwZRlLLHFOLZinAxsml47gcWyZSZKWlNTcxTxPjqNO/PPrVCN
 vwIjCg9feGAt0xrK2PmeEeNnkN5ZQecKlsvfWTLHUOX9vl4vY+l+939UXwYkTBSPHQVka3OsHc
 sLpec7HDV3kHdIk9iHZIDdo2TloD/gHSP2F7D6kbpC3cLofTR/CA6TvkKFuH9I3KFihvBUOJP9
 B67r+AChiZAykAQAA
X-Change-ID: 20260324-airoha-eth-multi-serdes-fb4b556ee756
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, 
 Benjamin Larsson <benjamin.larsson@genexis.eu>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 Xuegang Lu <xuegang.lu@airoha.com>, 
 Madhur Agrawal <madhur.agrawal@airoha.com>
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

EN7581 or AN7583 SoCs support connecting multiple external SerDes (e.g.
Ethernet or USB SerDes) to GDM3 or GDM4 ports via a hw arbiter that
manages the traffic in a TDM manner. As a result multiple net_devices can
connect to the same GDM{3,4} port and there is a theoretical "1:n"
relation between GDM ports and net_devices.

           ┌─────────────────────────────────┐
           │                                 │    ┌──────┐
           │                         P1 GDM1 ├────►MT7530│
           │                                 │    └──────┘
           │                                 │      ETH0 (DSA conduit)
           │                                 │
           │              PSE/FE             │
           │                                 │
           │                                 │
           │                                 │    ┌─────┐
           │                         P0 CDM1 ├────►QDMA0│
           │  P4                     P9 GDM4 │    └─────┘
           └──┬─────────────────────────┬────┘
              │                         │
           ┌──▼──┐                 ┌────▼────┐
           │ PPE │                 │   ARB   │
           └─────┘                 └─┬─────┬─┘
                                     │     │
                                  ┌──▼──┐┌─▼───┐
                                  │ ETH ││ USB │
                                  └─────┘└─────┘
                                   ETH1   ETH2

This series introduces support for multiple net_devices connected to the
same Frame Engine (FE) GDM port (GDM3 or GDM4) via an external hw
arbiter. Please note GDM1 or GDM2 does not support the connection with
the external arbiter.

---
Changes in v5:
- Move qos_sq_bmap bitmap in airoha_gdm_dev struct.
- Unregister netdevice before running of_node_put().
- Move stat MIB counters in airoha_gdm_dev struct.
- Fix airoha_ppe_init_upd_mem() mac address configuration.
- Do not return -EBUSY if we try to decrease configured MTU of a shared
  GDM port, just skip hw configuration.
- use int instead of atomic_t for GDM port users.
- Add patch "net: airoha: Reserve RX headroom to avoid skb reallocation"
- Fix typos.
- Link to v4: https://lore.kernel.org/r/20260507-airoha-eth-multi-serdes-v4-0-af613b61ae02@kernel.org

Changes in v4:
- Make ethernet-port property available just for GDM3 and GDM4 in DTS
  specification
- Move cpu_tx_packets, fwd_tx_packets qos_sq_bmap fields in airoha_qdma
  struct
- Fix of_node leak removing the net_device in airoha_remove() or
  airoha_probe() error path
- Fix nbq backward compatibility
- Link to v3: https://lore.kernel.org/r/20260406-airoha-eth-multi-serdes-v3-0-ab6ea49d59ff@kernel.org

Changes in v3:
- Fix MTU and VIP configuration when the GDM port is shared between
  multiple net_devices.
- Add sanity check for nbq parameter.
- Add missing of_node_get() for net_device np node.
- Check if GDM port is shared before decresing device MTU.
- Move port forward configuration in airoha_dev_stop() before
  configuring DMA tx/rx engine.
- Introduce PRIV_FLAG_WAN parameter.
- Link to v2: https://lore.kernel.org/r/20260401-airoha-eth-multi-serdes-v2-0-ac427ae4beeb@kernel.org

Changes in v2:
- Rename multiplexer in arbiter in the commit logs.
- Rebase on top of net-next main branch.
- Add missing PPE cpu port configuration for GDM2 when loopback is
  enabled.
- Link to v1: https://lore.kernel.org/r/20260329-airoha-eth-multi-serdes-v1-0-00f52dc360ca@kernel.org

---
Christian Marangi (1):
      net: airoha: Better handle MIB for GDM with multiple port attached

Lorenzo Bianconi (11):
      dt-bindings: net: airoha: Add EN7581 ethernet-ports properties
      net: airoha: Reserve RX headroom to avoid skb reallocation
      net: airoha: Introduce airoha_gdm_dev struct
      net: airoha: Move airoha_qdma pointer in airoha_gdm_dev struct
      net: airoha: Rely on airoha_gdm_dev pointer in airhoa_is_lan_gdm_port()
      net: airoha: Move qos_sq_bmap in airoha_gdm_dev struct
      net: airoha: Move {cpu,fwd}_tx_packets in airoha_gdm_dev struct
      net: airoha: Support multiple net_devices for a single FE GDM port
      net: airoha: Do not stop GDM port if it is shared
      net: airoha: Introduce WAN device flag
      net: airoha: Support multiple LAN/WAN interfaces for hw MAC address configuration

 .../devicetree/bindings/net/airoha,en7581-eth.yaml |  52 +-
 drivers/net/ethernet/airoha/airoha_eth.c           | 997 ++++++++++++++-------
 drivers/net/ethernet/airoha/airoha_eth.h           |  48 +-
 drivers/net/ethernet/airoha/airoha_ppe.c           |  43 +-
 4 files changed, 785 insertions(+), 355 deletions(-)
---
base-commit: 8b2feced65cd3aa0597d596ed5733a1abd4c4d78
change-id: 20260324-airoha-eth-multi-serdes-fb4b556ee756

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


