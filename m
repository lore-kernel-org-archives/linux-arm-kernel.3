Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0402DC43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 08:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mFHD8RRGJkLeLGm/699c6/1NPhNrhPx5wfXpMOoTjPI=; b=Tqfm2kc1SFTXeS
	we+r90Eus5br1h0xXJVEYuEbdzKNpc+oRY/CCEWfMAMRIMHgxJHQeUt2Lkgl6fgAWsFKpbs3o0Wfn
	ZMEo6x9M3tdaI9ii6KkR0Utm6wtIDBCbhjtgijVR97NGvpAZENNqeIQITKxDPhEtmPwS7s97P0sqQ
	gmYzbw2UTbFAtqCHOXH0mT/++wXU9wLkXYf7WLK2dxbTthRpGutPkiJllws4Q1yItz1X7ix/ZIOpC
	SaO7uSP6x9EKYLMtc0uxzKjgjKYkhqKMmPmRjiexFWGNiw3rnTgynpkDTZEOefod5y9nCtBLqTM2n
	9Ebi9KyrBSkY3in5cDJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weq1E-00000000zC8-2Yuc;
	Wed, 01 Jul 2026 08:10:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weq1D-00000000zBz-1UTH;
	Wed, 01 Jul 2026 08:10:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 62AC2600AB;
	Wed,  1 Jul 2026 08:10:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90E1E1F00A3A;
	Wed,  1 Jul 2026 08:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782893402;
	bh=mFHD8RRGJkLeLGm/699c6/1NPhNrhPx5wfXpMOoTjPI=;
	h=From:Subject:Date:To:Cc;
	b=OC4rkXT8wZoc1FGaN/bsXZNkwylvmxM3DF3XkjnaolvmlcuodcpxThi+y0YIaEYRV
	 pY4K6TZXrU8vpjP0RZmurbpD2aJFJBvQWrEdZM3uPhr32XjZwjuooj1973nCOlVs6j
	 Wlqs/C6xcckOu3QwjKTkgqRIKkjU+PiSnYJLFvSyjld4LUOK6z0fDDIejGOcHBNETG
	 RWobs2SNwGY1H7AREqtOPRVC5gI5KNWsy55MJ4Ew03Vi6h4wxnQMdfONMKZBg1QJXa
	 kAwkRLv4IbGcK9Fko8C2L3j7dj8o3cymC5r3VBGfHhCSoeY2L08DX/t/64fG0PJefX
	 WBE4lZnysLhOQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next v7 0/3] airoha: add the capability to configure
 GDM3/GDM4 as WAN/LAN on demand
Date: Wed, 01 Jul 2026 10:09:24 +0200
Message-Id: <20260701-airoha-ethtool-priv_flags-v7-0-b4153bd44428@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43Q0WrFIAwG4Fc5eD1HolbtrvYeYwxrYysr9WBLO
 ePQd5/0ylEoIxD4CfkCebKFcqSFvd2eLNMWl5jmEszLjfnRzQPx2JfMBAgNpbiLOY2O0zquKU3
 8nuP2FSY3LLzTzhnwpVlgZf+eKcTHYX+wmVY+02Nln2UyxmVN+ec4uuEx/4e/IUeuADvh20Btw
 PdvyjNNrykPB7uJmjJXlCiUUcIb55DQihMla8peUbJQkizJ3stgsDlRqqIQrijFgWsg2/ogbCB
 3opqawiuqKZRH7Amssro//0pXlGivKF0oqzuvAXqJnf9D7fv+C1idWAdEAgAA
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

 drivers/net/ethernet/airoha/airoha_eth.c  | 239 ++++++++++++++++++++++++++----
 drivers/net/ethernet/airoha/airoha_eth.h  |  26 +++-
 drivers/net/ethernet/airoha/airoha_ppe.c  |   9 +-
 drivers/net/ethernet/airoha/airoha_regs.h |   1 +
 4 files changed, 233 insertions(+), 42 deletions(-)
---
base-commit: 1c664ec4b9ea827b609d296921ed5bad8a40a158
change-id: 20260606-airoha-ethtool-priv_flags-b6aa70caa780

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


