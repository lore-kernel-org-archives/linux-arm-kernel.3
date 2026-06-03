Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B6BCD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 06:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iIDbnu+hln/EA7ynrMKJhtLipUKdalEJHgUvmnSOonw=; b=rqfcL8W0kceuaT
	cGqZann5fWXfsfMckyUUr0zAxDSZV1utvh7ljtvDdS/kewSpEDaIrWI33y15KGYt/zWhgy50EwfeB
	09RIUC2lMDhB/ujY7SstIa4bxv2F2dto7PmrwuuBT86Ljd66ctAxoMije1dlvKZDW5uAX4SfxSqDK
	G4HZo425Nv6WIl8XrXpKtkuYB63u0d182imYQrDeMpClKoxKEK9u5KJ/xC3LcYrDK3AqB69CBhFQR
	O4Xp2ElXH3PgAEl0GuydULmkFt/+o7K62JttcbyZR6VSEJmE3IJBUMH5JpDdI2kzgH6Cy0qkXZY7i
	H82VFG5LwF/qYivlCWFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUef3-0000000ELqr-0kho;
	Wed, 03 Jun 2026 06:01:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUeez-0000000ELq2-3wDl;
	Wed, 03 Jun 2026 06:01:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4FE7D43D73;
	Wed,  3 Jun 2026 06:01:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD51E1F00893;
	Wed,  3 Jun 2026 06:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780466461;
	bh=iIDbnu+hln/EA7ynrMKJhtLipUKdalEJHgUvmnSOonw=;
	h=From:Subject:Date:To:Cc;
	b=D4BWVMxyAgWppCpi4bvzqMJ4AIDUZxqBAU22i0RzX1a45PJPKzI5Ds+Ov9YJ4Rjwf
	 dTwpB4gOMSH28nKGKfZqLZ7YoXlf6Bz7cGFVUqxaJcuK6NaC1qwSaZThoy7EWt9tSn
	 D1srZz0Z+JtH+Ar/9iFyPUG217PLpTmPZa6IKSZpCookmaR6sXqrAFkCjnzrXoVTl4
	 fhAASpCyoqKqfwfymk+5Pv/IfCkBCPybMSwBh3CdwS8WDY6QYQwrUlWtrJN7UasygI
	 4dcLiOtPguoM/MFFziTZ6aAmQrkUeOflkdJYH1iwdlKPXevF5Tc3vD92+yP1FUUMQE
	 WLccJ2II+F3lA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next v9 0/6] net: airoha: Support multiple net_devices
 connected to the same GDM port
Date: Wed, 03 Jun 2026 08:00:14 +0200
Message-Id: <20260603-airoha-eth-multi-serdes-v9-0-5d476bc2f426@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33SS2rEMAwG4KsMXtdF8TPuqvcoXfghT0ynSXHSM
 GXI3esJhUkxyVIIfUI/upERc8KRvJxuJOOcxjT0pTBPJ+I725+RplBqwoAp4ExQm/LQWYpTRz+
 /L1OiBQg40uiEk1IhaqlImf7KGNN1ld9IjxPt8TqR99Lp0jgN+WddOTdr/083u/rcUKAAUbLgu
 QJvXz8w93h5HvJ5RWf2gAQ0+xArkPWCaYvCIboK4ltI7UP8DjmFVpggTYwVJB6QBL0PiTsUVcO
 daiwCqyC5hQ4ykgVqQSJvMXhm64zUBmoOMlIF8q0xQjEvopYVpLfQQUa6QMYggOEcONantVvo4
 LS2QMoFDVi+JET1D1qW5RcsUjGkyAIAAA==
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
X-CRM114-CacheID: sfid-20260602_230102_023909_05753F1E 
X-CRM114-Status: GOOD (  15.43  )
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
Changes in v9:
- Do not stop device probe if mac address are misconfigured but just
  report the warning
- Rebase on top of net-next main branch
- Remove redundant net_device pointer inside airoha_gdm_dev struct.
- Link to v8: https://lore.kernel.org/r/20260519-airoha-eth-multi-serdes-v8-0-6bd70e329df6@kernel.org

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
Lorenzo Bianconi (6):
      dt-bindings: net: airoha: Add GDM port ethernet child node
      net: airoha: Remove private net_device pointer in airoha_gdm_dev struct
      net: airoha: Support multiple net_devices for a single FE GDM port
      net: airoha: Do not stop GDM port if it is shared
      net: airoha: Introduce WAN device flag
      net: airoha: Support multiple LAN/WAN interfaces for hw MAC address configuration

 .../devicetree/bindings/net/airoha,en7581-eth.yaml |  56 ++-
 drivers/net/ethernet/airoha/airoha_eth.c           | 490 ++++++++++++++++-----
 drivers/net/ethernet/airoha/airoha_eth.h           |  25 +-
 drivers/net/ethernet/airoha/airoha_ppe.c           |  32 +-
 4 files changed, 480 insertions(+), 123 deletions(-)
---
base-commit: dfcc2ff12925d99e858eaf539eaa4aaaf81fe2a6
change-id: 20260324-airoha-eth-multi-serdes-fb4b556ee756

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


