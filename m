Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F28ECD37AD
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 21:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D7mdw0i20xwLCBOvAyK6W6onF9sOAoFiQDQjaZJ1aZo=; b=CnDHK2mm3g+70i
	wBcmGRYRjBB7XrdF/K7yp+eBo9r0rvruqu/BaQ6OihEs9pGhO730aZaavbc8dGZWt6vRrtcgZgZwo
	7LwccHICpYcY0BZjEIjnJKE7q+AlLM98PUmmzuFq0/9+UhMexerc7tP5/AgUoEns21EtgGGYC5RfB
	NiVSJ4qY0yoiICfVbKtRjBgItsx9FFsflGwHDnUN0yijY4HxL16R2Cc9VptdeL/zAbfMTnzCuvS+x
	O491N5WUFyN0rCrIVThuwH9XkphMpnD+QqxDmZ/XhYcI2iuMheIzZOVliKyhcgG3PRJIYTeChoS/8
	kFjzo3vqSODvGU1DUSEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL6Av-00000004uAV-2ULF;
	Thu, 07 May 2026 21:22:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL6As-00000004u9t-3Mez;
	Thu, 07 May 2026 21:22:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CB3EF41853;
	Thu,  7 May 2026 21:22:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57670C2BCB2;
	Thu,  7 May 2026 21:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778188944;
	bh=9Qkz2j3X3AVE5xUl1I1i/UnZtoIDDxtFoq42XBa7rus=;
	h=From:Subject:Date:To:Cc:From;
	b=nRxW+dNcVfpGoABOch1yxf0L9akX1LXhl7pZ78+WApcZtdUDK7EBPgyifWHJIHfGp
	 XbS3OdeRLhh5eYpSmlS5A29/fGuD6UtYyj+ve/LEkOj5DM4+ymq2SNY7lbtChRYP7D
	 +MFLScsUNWsSoxXUmyxyAYy0ECCUVhkeOceJIF1Fp8i52GTaQr04VzT/tlylFeTG3o
	 bfEl37hXUbo36U7TUPpFP2ry32OKQd4Vcnp5YKQyhZsl2CtMvf5/vUU4M1poNCxPfM
	 x4T2VQ4Dgh2cc/kgCu9UwUA9oemXpW7fCF6s1tYxA//od0987uIKkuGlLJOdBjyHV7
	 GEShFFCrGI7qQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next v4 00/10] net: airoha: Support multiple
 net_devices connected to the same GDM port
Date: Thu, 07 May 2026 23:21:43 +0200
Message-Id: <20260507-airoha-eth-multi-serdes-v4-0-af613b61ae02@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNwYrDIBgE4FcpnvsXY9SQnvoeSw+ajIls1xR1Q
 0vJu68bCu2y5DgM882DJUSPxI67B4uYffJTKEHud6wbTRhAvi+ZCS40r4Uk4+M0GkIe6ev7kj0
 VoEciZ6VVSgON0qysrxHO31b5gwVkCrhldi7N6FOe4n29nKu1f+rtpj5XxIlzp0Tf1Zp35vSJG
 HA5THFY0Vm8IMmrbUgUyHRSNAbSAvYfVL9DehuqfyGrYWTbq9a5P9CyLD/Po1kBWwEAAA==
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_142226_887033_82BC42AE 
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
Lorenzo Bianconi (10):
      dt-bindings: net: airoha: Add EN7581 ethernet-ports properties
      net: airoha: Introduce airoha_gdm_dev struct
      net: airoha: Move airoha_qdma pointer in airoha_gdm_dev struct
      net: airoha: Rely on airoha_gdm_dev pointer in airhoa_is_lan_gdm_port()
      net: airoha: Move qos_sq_bmap in airoha_qdma struct
      net: airoha: Move {cpu,fwd}_tx_packets in airoha_qdma struct
      net: airoha: Support multiple net_devices for a single FE GDM port
      net: airoha: Do not stop GDM port if it is shared
      net: airoha: Introduce WAN device flag
      net: airoha: Support multiple LAN/WAN interfaces for hw MAC address configuration

 .../devicetree/bindings/net/airoha,en7581-eth.yaml |  52 +-
 drivers/net/ethernet/airoha/airoha_eth.c           | 778 +++++++++++++++------
 drivers/net/ethernet/airoha/airoha_eth.h           |  49 +-
 drivers/net/ethernet/airoha/airoha_ppe.c           |  45 +-
 4 files changed, 657 insertions(+), 267 deletions(-)
---
base-commit: 6a4c4656b0d2d4056a1f0c35442db4e8a5cf8021
change-id: 20260324-airoha-eth-multi-serdes-fb4b556ee756

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


