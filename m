Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB5BCD98D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 21:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6qBwSk+puYij3SlBze+P7GUqLUavspZMpeFrJqlN8VI=; b=iBcVu4fRi7/IXs
	ozK/1/Ah7lnMQdq2LO2RzvWIASUp9z8D0X7Xr47B+QGyRCyTfkcJ/8xV2np2mlnE9bQQO7n+neEDY
	HS6fPJtIvAdz6wOuaOYLkkANFJQh+QtAtkikiWF3oFYQZmps7qfjjbHMvIs5QXjWfkErGyyJUuWup
	+5TJj0urGpSBM2OBzpnU8fmm1pYwyxyNqLtipAFava2nAT8I9yDIvbFU4NC1f39z1OeuJ2mwK7/yY
	GA/+pCZAQFr6AYP+jUti2zhD63fOJ978gaaz4D4EhFEfjhEOkNmOETv7Fx9hO6taO5hBTXahiczr9
	1EI0cCCDmPG4JqeLSUhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXnNr-0000000A71u-3xrl;
	Thu, 11 Jun 2026 21:56:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXnNq-0000000A71f-0RLs;
	Thu, 11 Jun 2026 21:56:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3B4B46020C;
	Thu, 11 Jun 2026 21:56:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A1E81F000E9;
	Thu, 11 Jun 2026 21:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781214976;
	bh=6qBwSk+puYij3SlBze+P7GUqLUavspZMpeFrJqlN8VI=;
	h=From:Subject:Date:To:Cc;
	b=GTGJIjdI4H3BIetMRo453XUAHpueqIdJGGFOdwNQouxjmpudpfRjS522TN5tMKN/w
	 lAfjkyR781GvJQDp7BMIfe52Yn8Y9UBWiIuMrF54x3bFDgUQOnrs/WfeeVkhUNdrp8
	 +B5R6em9ijjgqaYE8DZGuzpvrlKx+WX9IOWVX5vth49R+1C7QljSme6ncOsiVJ0aR/
	 3HH2BYKtTwyKxQpzl6FzHyfK4GopAuv/LxVVJUMxJ9IurSOaGDm1r8uChFwaWahYyV
	 xSHi9mGV9efjNKQ6lH8Pr0bGPGVNjKIl45fZI8MK330Bz17z9YIGNzqOn8nMi0kVlK
	 h7gcLKPkeMQZw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next v5 0/3] airoha: add the capability to configure
 GDM3/GDM4 as WAN/LAN on demand
Date: Thu, 11 Jun 2026 23:55:50 +0200
Message-Id: <20260611-airoha-ethtool-priv_flags-v5-0-c11de08486d1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43N0YrDIBAF0F8pPu8UR9No9mn/Y1kWa8dENmhRk
 S4l/17JU0ohlIGBy2XO3Fmm5Cmzz8OdJao++xhaOH0cmJ1MGAn8pWUmuOh5GzA+xckAlanEOMM
 1+frrZjNmOPfGKG7b0py1+2si52+r/c0CFQh0K+ynNZPPJab/9WnFtX/DrwgIHcezsIOjweHXH
 6VA8zGmcWWr2FJqjxKNUp2wyhgk1OKFkltK71GyUZI0yYuVTuHpheo2FPI9qgMOPSc9WCe0I/N
 ELcvyAJD5Fv2uAQAA
X-Change-ID: 20260606-airoha-ethtool-priv_flags-b6aa70caa780
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Madhur Agrawal <madhur.agrawal@airoha.com>, 
 Alexander Lobakin <aleksander.lobakin@intel.com>
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
      net: airoha: use int instead of atomic_t for qdma users counter
      net: airoha: refactor QDMA start/stop into reusable helpers
      net: airoha: defer GDM3/GDM4 WAN mode and GDM2 loopback to QoS offload

 drivers/net/ethernet/airoha/airoha_eth.c  | 287 +++++++++++++++++++++++++-----
 drivers/net/ethernet/airoha/airoha_eth.h  |  15 +-
 drivers/net/ethernet/airoha/airoha_ppe.c  |   9 +-
 drivers/net/ethernet/airoha/airoha_regs.h |   1 +
 4 files changed, 262 insertions(+), 50 deletions(-)
---
base-commit: dad4d4b92a9b9f0edb8c66deda049da1b62f6089
change-id: 20260606-airoha-ethtool-priv_flags-b6aa70caa780

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


