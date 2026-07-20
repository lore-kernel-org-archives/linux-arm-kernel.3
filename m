Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1446C44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 22:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PSplD8jI6MkBmStKJ+eF0cm33f9ueBjexlK28SjZ7v8=; b=j1CoSpNtpyan2W
	ucW9Imxt9lgGUTqkgJajQgAUbF+hQE4TsC9fqj552HnKX9ggT2/t7RljqxY9fgN6/e928l+ymoENI
	p+psxCdIb9fHSFJb65Mcfw4mavns07Nfgpoz5jgPfES6RgLXIB2766TQDUqDEyaApvyZWvFg29mUt
	AWtE02CvrSoxXdE7fb1ENvr459U4YuibCkZlQPWgWAxk4A7WuGT2/hxA3kjuCGXIEko2kFYtdTkew
	1+i9QguV+PCqu04NBPZ6ByIsV+ugpf9AkwC9oD8tsNBa1SuVnGnT4YjUjjxgECuGyLIZDX3jICnda
	1lSMNqzoMCaKwTEOze+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlw63-0000000805t-2wTJ;
	Mon, 20 Jul 2026 22:04:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlw62-0000000805Q-0uQe;
	Mon, 20 Jul 2026 22:04:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E623060A7A;
	Mon, 20 Jul 2026 22:04:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2051B1F000E9;
	Mon, 20 Jul 2026 22:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784585060;
	bh=PSplD8jI6MkBmStKJ+eF0cm33f9ueBjexlK28SjZ7v8=;
	h=From:Subject:Date:To:Cc;
	b=Mpj3oC9I/pGmmUm3s105UxPf7olm+f5Sj+2D4WBVVVQu6MYpsc2w6zmhInodSJEWk
	 7Uuzfka4d/J22TwLgSI3fo/eVYW10vYUlsqWoxRAvAtPQFIvKRD2YxRHHGiuhiL1Bs
	 z65F+qkKD4t/k2JMBdRKUUowonunioS4vQgCIC2tvtsxvonZfd7+pURXEUTj+JmLYl
	 K8rPooghUkcXEY9Divg2OFMaEyBPqcIHUMhV8D3lmY2/fuVONWgYKM/4wzZjEMpC6Y
	 GoGtndU0jKdw62P80HDKmFynepwEqYYf4wQrytF+KX7KsdXCdnNuiclP9/JiuxTd3l
	 vAurCAOfihfbw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next v9 0/3] airoha: add the capability to configure
 GDM3/GDM4 as WAN/LAN on demand
Date: Tue, 21 Jul 2026 00:03:34 +0200
Message-Id: <20260721-airoha-ethtool-priv_flags-v9-0-9c15d8b71a56@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43QUWvEIAwA4L9y+DxHolbtPe1/jDHUxlZ2tIct5
 cbR/z7pyzoKMgKBEPIl5Mlmyolmdr08WaY1zWkaS9G+XFgY3NgTT12pmQChoQR3KU+D47QMyzT
 d+D2n9TPeXD9zr50zEEqywMr8PVNMj91+ZyMtfKTHwj5KZ0jzMuXvfemKe/8f/oocuQL0IrSR2
 ohvX5RHur1Oud/ZVRwpU6NEoYwSwTiHhFacKHmkbI2ShZJkSXZBRoPNiVIHCqFGKQ5cA9k2RGE
 juRPVHCmsUU2hAmJHYJXV3flX+kCJtkbpQlntgwboJPpwoswvZaB6lSmUV9hI3ymlhD1R9kjJG
 mULBdh417hgW6I/1LZtP3rqGYHaAgAA
X-Change-ID: 20260606-airoha-ethtool-priv_flags-b6aa70caa780
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Simon Horman <horms@kernel.org>, 
 Alexander Lobakin <aleksander.lobakin@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, Madhur Agrawal <madhur.agrawal@airoha.com>
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

Add the capability to configure GDM3/GDM4 as WAN/LAN on demand when QoS
offload is created or destroyed.
Make dev->qdma an RCU pointer so the TX path can safely dereference it
without holding RTNL.
Introduce airoha_qdma_start() and airoha_qdma_stop() helpers.

---
Changes in v9:
- Rebase on top of next-next main branch
- Link to v8: https://lore.kernel.org/r/20260703-airoha-ethtool-priv_flags-v8-0-015ba5ac89ee@kernel.org

Changes in v8:
- Rebase on top of next-next to fix conflicts.
- Link to v7: https://lore.kernel.org/r/20260701-airoha-ethtool-priv_flags-v7-0-b4153bd44428@kernel.org

Changes in v7:
- Fix ETS stats accounting in patch 2/3
- Reset ETS stats accounting in airoha_dev_set_qdma().
- Link to v6: https://lore.kernel.org/r/20260629-airoha-ethtool-priv_flags-v6-0-86bc600d31bc@kernel.org

Changes in v6:
- Rebase on top of next-next
- Add patch 1/3: "rename airoha_priv_flags to airoha_dev_flags"
- Drop patch 2/3: "refactor QDMA start/stop into reusable helpers"
- Link to v5: https://lore.kernel.org/r/20260611-airoha-ethtool-priv_flags-v5-0-c11de08486d1@kernel.org

Changes in v5:
- Add patch 1/3: use int instead of atomic_t for qdma users counter
- Protect dev->flags with flow_offload_mutex mutex.
- Introduce AIROHA_PRIV_F_QOS in order to handle better WAN/LAN
  switching.
- Link to v4: https://lore.kernel.org/r/20260610-airoha-ethtool-priv_flags-v4-0-60e89cf28fea@kernel.org

Changes in v4:
- Move back QDMA TX/RX DMA enable to airoha_dev_open()/airoha_dev_stop().
- Configure GDM3/4 as WAN if GDM2 is not available in ndo_init()
  callback.
- Protect qdma pointer in airoha_gdm_dev struct using RCU.
- Rely on rtnl_dereference() to access qdma pointer in the control path.
- Add airoha_qdma_start() and airoha_qdma_stop() utility routines in
  patch 1/2
- Link to v3: https://lore.kernel.org/r/20260608-airoha-ethtool-priv_flags-v3-1-3e8e3dc3f715@kernel.org

Changes in v3:
- Do not introduce ethtool private flags support to configure LAN/WAN
  for GDM3/4 and rely on tc qdisc offload for it instead.
- Set GDM3/4 ports as LAN by default.
- Move QDMA TX/RX DMA enable from airoha_dev_open() to airoha_probe()
  and the corresponding disable from airoha_dev_stop() to airoha_qdma_cleanup().
- Link to v2: https://lore.kernel.org/r/20260607-airoha-ethtool-priv_flags-v2-1-742c7aa1e182@kernel.org

Changes in v2:
- Rework airoha_dev_set_wan_flag routine
- Enable GDM_STRIP_CRC_MASK in airoha_disable_gdm2_loopback()
- Do not always reset REG_SRC_PORT_FC_MAP6 in
  airoha_disable_gdm2_loopback() but use the same condition used in
  airoha_enable_gdm2_loopback().
- Link to v1: https://lore.kernel.org/r/20260606-airoha-ethtool-priv_flags-v1-1-401b2c9fe9f1@kernel.org

---
Lorenzo Bianconi (3):
      net: airoha: rename airoha_priv_flags to airoha_dev_flags
      net: airoha: fix ETS QoS stats counter underflow and cross-channel corruption
      net: airoha: defer GDM3/GDM4 WAN mode and GDM2 loopback to QoS offload

 drivers/net/ethernet/airoha/airoha_eth.c  | 253 ++++++++++++++++++++++++++----
 drivers/net/ethernet/airoha/airoha_eth.h  |  26 ++-
 drivers/net/ethernet/airoha/airoha_ppe.c  |   9 +-
 drivers/net/ethernet/airoha/airoha_regs.h |   1 +
 4 files changed, 246 insertions(+), 43 deletions(-)
---
base-commit: 298bb2b8903323f6ef2eab4819a2e477765f0ff1
change-id: 20260606-airoha-ethtool-priv_flags-b6aa70caa780

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


