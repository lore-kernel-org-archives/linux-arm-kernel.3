Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEAF4CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 08:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2qW7o3LVJGgieBa+itk05bZh5dh2nrS6LKR2/Vn7mlI=; b=ShWDhp4AeZohqK
	c5DHJ0mjKHVYMygzj7NPXcxCxMWfvkbPcS9tHvOC+0hGis7ZGWisREfUPl42RzSHv3RGAKlCT8spK
	7Uj+jHgi7dt8vlg4EGP5nBzJHPMQ7OMXOpXVHlT5bOBi4uPFmD0+y3N26m1k3xHFZw1PGVb/S3VeW
	fsqYBkIRCGlMKTIQ74mQXSpdVPndNZlrNe0/SuomrT2hdJt1CMM4zjar/ZLDzM1cuxEkT+jiOAuFW
	0lomgSyuHhKAZJNox/F8cy96rqwfDPeSAeUGSqaRESc1IDHkJvC2IV0gZ3XTTTxR3aDWbjK1GvCbA
	k5UjLrKKWrbM0gyv4eVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGHN-00000000mDh-0hps;
	Tue, 19 May 2026 08:58:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGHM-00000000mCj-1uaL;
	Tue, 19 May 2026 08:58:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9C06D60208;
	Tue, 19 May 2026 08:58:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 006ADC2BCC6;
	Tue, 19 May 2026 08:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779181099;
	bh=Klu9x/Jv2kB18rShot8JT/954KOo6KDVE2s8WukpTUU=;
	h=From:Subject:Date:To:Cc:From;
	b=VWScUoueqTDmD1dqBWCwMZt7XMyrIS/Ki2YYM9IhtmDOdF2Y1jmeLyT/lONzRLdAn
	 C77NB3CEdYbp8FcJ/ao7x7NiDI4xr3vRDNTf9cz5ayS04+BlOd60QerobORLZgXLRm
	 S5ElckmTYoODsIXkcy8loxbUaBnBE0DHzHo3u0O1eG2ZP/T3XGlF1k2TE3sunxc6ZE
	 pFwnIpoWX4gcTG4WLPbVQjr7mCHLW4IrmMVTz6T/5h0nW88qSoGEzrvx7ejaiEIpEG
	 eD6Ly+M5veW76u8E5epO1TUYn8Zhp+2tFrTJIQzQ13beZrssUZexCcM4QpnqP1O0Dh
	 lEtSr2VaCURoA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next v8 00/10] net: airoha: Support multiple
 net_devices connected to the same GDM port
Date: Tue, 19 May 2026 10:57:43 +0200
Message-Id: <20260519-airoha-eth-multi-serdes-v8-0-6bd70e329df6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33QTWrDMBAF4KsErasy+re66j1KF5I8ikVTuciuS
 Qm+exVTiIuxl8NjvmHejQxYEg7k5XQjBac0pD7XoXk6kdC5fEaa2joTDlyD4JK6VPrOURw7+vl
 9GROtQIsDjV56pTSiUZrU7a+CMV0X+Y1kHGnG60jea9KlYezLz3JyYkv+p9tdfWIUKEBUvA1CQ
 3CvH1gyXp77cl7QiT8gCWwf4hVyQXLjUHpEv4HEGtL7kLhDXqOTtlU2xg0kH5ACsw/JOxQ1E14
 zh8A3kFpDBx2pCjWgUDTYBu62HekVxA460hUKjbVS8yCjURvIrKGDjkyFrEUAKwQI/P/aPM+/J
 7B45n8CAAA=
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
Changes in v8:
- Fix dts schema issues reported by sashiko.
- Fix possible NULL-pointer dereference in patch 2/10.
- Fix max mtu computation in airoha_dev_change_mtu().
- Link to v7: https://lore.kernel.org/r/20260516-airoha-eth-multi-serdes-v7-0-99e0093303e2@kernel.org

Changes in v7:
- Fix dma_sync_single_for_cpu() size in airoha_qdma_rx_process().
- Fix hw stats reset.
- Fix typos.
- Add fix for airoha_tc_remove_htb_queue queue index.
- Fix dts schema issues.
- Remove hw stats patch from the series.
- Link to v6: https://lore.kernel.org/r/20260511-airoha-eth-multi-serdes-v6-0-c899462c4f75@kernel.org

Changes in v6:
- Reconfigure REG_GDM_LEN_CFG() whit max 'running' MTU in
  airoha_dev_stop().
- Fix port staring MIB counters in airoha_update_hw_stats().
- Fix regression in TC_HTB_NODE_MODIFY command.
- Fix length check in airoha_qdma_rx_process().
- Fix dts schema.
- Link to v5: https://lore.kernel.org/r/20260509-airoha-eth-multi-serdes-v5-0-805e38edc2aa@kernel.org

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
Lorenzo Bianconi (10):
      dt-bindings: net: airoha: Add GDM port ethernet child node
      net: airoha: Introduce airoha_gdm_dev struct
      net: airoha: Move airoha_qdma pointer in airoha_gdm_dev struct
      net: airoha: Rely on airoha_gdm_dev pointer in airoha_is_lan_gdm_port()
      net: airoha: Move qos_sq_bmap in airoha_gdm_dev struct
      net: airoha: Move {cpu,fwd}_tx_packets in airoha_gdm_dev struct
      net: airoha: Support multiple net_devices for a single FE GDM port
      net: airoha: Do not stop GDM port if it is shared
      net: airoha: Introduce WAN device flag
      net: airoha: Support multiple LAN/WAN interfaces for hw MAC address configuration

 .../devicetree/bindings/net/airoha,en7581-eth.yaml |  56 +-
 drivers/net/ethernet/airoha/airoha_eth.c           | 833 +++++++++++++++------
 drivers/net/ethernet/airoha/airoha_eth.h           |  47 +-
 drivers/net/ethernet/airoha/airoha_ppe.c           |  43 +-
 4 files changed, 702 insertions(+), 277 deletions(-)
---
base-commit: 7a348a95f696d20f15c776de4df8b4415bcf3d77
change-id: 20260324-airoha-eth-multi-serdes-fb4b556ee756

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


