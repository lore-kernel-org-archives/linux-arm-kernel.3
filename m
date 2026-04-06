Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5DEEF4ECD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 10:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lQvLl3xmXTudXH4KmDhO0iBLnK0m4L8kweIt4onxX4o=; b=zd2SSUse2ImVCy
	34kN7lEOXncXTiV3LVpI6h3O59wcXwGWGIAZxK2a0zPCVAoZiBIx2VR47cXDtFWeZBhu9PZaTX4W9
	RcU84Djktrg3AWWU3kQ06uJtWvaX4Gphc5GOpWTuAYkozcUuyS2Pu8hkQcSGrJ5udQqhqkMcQJMOU
	yjeJ4uw7W3OBek/aAXYmHcYCxG7aqGhJ0kHKF5bTf85xcPYLFgRdhzb78GOsdRlxXsalU/6fngShM
	jDvk5G8TzayuxvX36StLROvIr+l8hVOs2YWAIfA5FH+VFFbL0NpxODgZdb8zA2IiU9jZPAVNoZK/D
	uh5HD80pQIbbnftBk9FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9hIE-0000000513R-1Wko;
	Mon, 06 Apr 2026 10:34:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9hIC-0000000513I-28hP;
	Mon, 06 Apr 2026 10:34:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B90C8600AC;
	Mon,  6 Apr 2026 10:34:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B2A5C4CEF7;
	Mon,  6 Apr 2026 10:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775471691;
	bh=k7JJlwi84yGGOLofZzS7mPP1hD0WkiobHK3wyYJGTnc=;
	h=From:Subject:Date:To:Cc:From;
	b=LxDMv5uoiDF75CnKZwgbub7t23mOm4GYDxsxuY7wEaJJv1/eFCq10Stqvm3nHQZMN
	 HRwXMycW4z0aeKno8BH0SjSP23fHYmAYv5cZYi/9+jGjBIAcKW1UoXNN7BbglQ+xTs
	 mAew6Ar3rRjqaRXc58RW1MgIO9Q4ucREXgj2w32bo/bEY9BH6X5u1/Qh6X749cN94M
	 g3AKBb5eL28nI74G10pE6U4Ro8ZnqVn9QrrHkWPYNOLirxIIGtwBo4gCtj5pTtDFhp
	 P4yRU2lSlw7BQFx4Ce5pPwBImTkI7DnDP6iDR32Bp3MtBwUAf8rQ/bKkQkqe4EdV4b
	 bMDjh4JZCafAg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next v3 00/12] net: airoha: Support multiple
 net_devices connected to the same GDM port
Date: Mon, 06 Apr 2026 12:34:05 +0200
Message-Id: <20260406-airoha-eth-multi-serdes-v3-0-ab6ea49d59ff@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNQQ6CMBQE0KuQrv2mlBaiK+9hXJTyoT9ia9pKM
 IS72xAT44LlZDJvFhYxEEZ2LhYWcKJI3uVQHQpmrHYDAnU5M8FFzSshQVPwVgMmC4/XmAgy0GG
 EvpWtUjVio2qW18+APc2bfGUOEzicE7vlxlJMPry3y6nc+q9+2tWnEjhw3ivRmarmRl/uGByOR
 x+GDZ3ED5K83IdEhrSRotEoW8T2D1rX9QOihXylEgEAAA==
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
 Xuegang Lu <xuegang.lu@airoha.com>
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
Lorenzo Bianconi (12):
      dt-bindings: net: airoha: Add EN7581 ethernet-ports properties
      net: airoha: Set PPE cpu port for GDM2 if loopback is enabled
      net: airoha: Rely on net_device pointer in airoha_dev_setup_tc_block signature
      net: airoha: Rely on net_device pointer in HTB callbacks
      net: airoha: Rely on net_device pointer in ETS callbacks
      net: airoha: Introduce airoha_gdm_dev struct
      net: airoha: Move airoha_qdma pointer in airoha_gdm_dev struct
      net: airoha: Rely on airoha_gdm_dev pointer in airhoa_is_lan_gdm_port()
      net: airoha: Support multiple net_devices for a single FE GDM port
      net: airoha: Do not stop GDM port if it is shared
      net: airoha: Introduce WAN device flag
      net: airoha: Rename get_src_port_id callback in get_sport

 .../devicetree/bindings/net/airoha,en7581-eth.yaml |  44 +-
 drivers/net/ethernet/airoha/airoha_eth.c           | 725 ++++++++++++++-------
 drivers/net/ethernet/airoha/airoha_eth.h           |  39 +-
 drivers/net/ethernet/airoha/airoha_ppe.c           |  45 +-
 4 files changed, 585 insertions(+), 268 deletions(-)
---
base-commit: 3741f8fa004bf598cd5032b0ff240984332d6f05
change-id: 20260324-airoha-eth-multi-serdes-fb4b556ee756

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


