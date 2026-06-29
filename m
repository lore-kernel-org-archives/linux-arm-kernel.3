Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B52C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 16:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VGY/3EzI62yFaI09WF4nYhkRMXoCQ4SWEaDV21wSZvE=; b=FZTtfAfVsav9pH
	Ki6DTJtvRbHdMqT5kfzg7UrX0nqjUTOpXEa28zTdQvyHHljZlKV6a28r8n+cvBzlIa3TEnXqBf8di
	yoOGQquVrGFdbaqTWVivHdudByd2uwgPjInMPdPsbBPU6m1QkwNoD8B/gxJV/sqFqZtkZG2u9jsSw
	nCT60RVKZgtU1Bcwv/km99xFXQjfMWGE6mxLsVPgOg65cIICgwRWCTuSllPc5p1G1N6/3I5RmKbIt
	pF+uHUzYQ8gGLNLLxPspk/FcZBFxiJCf9xOf2rEW4fCxLP/cUWSUwvyRP0EwPsey0HTirRW9VoxhV
	itE/vx5TgBrSCPgw1Rhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weEgD-0000000FBSv-1yzQ;
	Mon, 29 Jun 2026 16:17:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weEgB-0000000FBSh-34Uj;
	Mon, 29 Jun 2026 16:17:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 255C2435EA;
	Mon, 29 Jun 2026 16:17:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D47C1F000E9;
	Mon, 29 Jun 2026 16:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782749871;
	bh=VGY/3EzI62yFaI09WF4nYhkRMXoCQ4SWEaDV21wSZvE=;
	h=From:Subject:Date:To:Cc;
	b=fueaL2uSLEFm8xGRg+6kNXydNXBZ3jt5Dkw/8CoZxSIIzgEAalHhudEgU14lJCe6N
	 +oyh7CK2gK8o2Re/1A93HVCvhyQZXyxFuJkfbhAxlvXzgDrMW0PWp4m4CoZ8nRjyfY
	 lWr5+mPfRxx8+P2vpHoOu/FgkagKOChxuBAEgobRuFOmeIMCNEJpcIXvpL7QBG6rKz
	 JcA5XX5L4yMWOc+LKhTGr+OuySXGiXRP1vY4R408DO9n5XKJw8+GzTerAzQ7fHJG4T
	 fUS2XesV3+wGKD9pTgyoOwp5BRR+plec1XuUH6foSVjc+uHKj6bc/7WbCce9YemvCx
	 Xj/eOVjwkoTxg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next v6 0/2] airoha: add the capability to configure
 GDM3/GDM4 as WAN/LAN on demand
Date: Mon, 29 Jun 2026 18:17:28 +0200
Message-Id: <20260629-airoha-ethtool-priv_flags-v6-0-86bc600d31bc@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43QwWrEIBAG4FdZPNfiaKKmp75HKYtrxkQadFGRX
 Za8eyWnlEAoAwM/w3wD8yIZk8dMPi4vkrD67GNoQb5diJ1NmJD6sWXCGZesFTU+xdlQLHOJcaH
 35OvVLWbK9CaNUcy2phlp+/eEzj82+4sELDTgo5DvNpl9LjE9t6MVtvk//AoUaMfgxu3gcHDw+
 YMp4PIe07Sxle8pdUbxRqmOW2UMIGh+oMSe0meUaJRAjWK0winoD1S3o4CdUR1lVDLUg3VcOzQ
 Hqt9TcEb1jbIAIzLdaTn+/dW6rr+RN8Re+QEAAA==
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
Lorenzo Bianconi (2):
      net: airoha: rename airoha_priv_flags to airoha_dev_flags
      net: airoha: defer GDM3/GDM4 WAN mode and GDM2 loopback to QoS offload

 drivers/net/ethernet/airoha/airoha_eth.c  | 231 ++++++++++++++++++++++++++----
 drivers/net/ethernet/airoha/airoha_eth.h  |  19 ++-
 drivers/net/ethernet/airoha/airoha_ppe.c  |   9 +-
 drivers/net/ethernet/airoha/airoha_regs.h |   1 +
 4 files changed, 223 insertions(+), 37 deletions(-)
---
base-commit: 805185b7c7a1069e407b6f7b3bc98e44d415f484
change-id: 20260606-airoha-ethtool-priv_flags-b6aa70caa780

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


