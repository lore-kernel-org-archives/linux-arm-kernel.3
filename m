Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 989EED3514D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 07:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=le+EgAUwDVQurs9zi9zKKtauIBjk9pzxlau65VU9EC0=; b=AESLviDrrrv1H4
	bbcmL8QS1oaIfa6vuSftzUW8RN2zQx0O8V0/qrw8gjPjFXPZRhoBOukCiTUV9D+gGMsMvMcyq2xvY
	age8RKDsRKht6MrOlehO4REp7Ft61qGGSy5+efvFVZnS0hXamj+wsRLeJp26JXXQgBLqwY//ASJlv
	9cQ0hhlhLLztyomR5YUBKLrNfLCm7shs7q0EmUCfE4YwrYF2iwIZWmeVccaZuyccDNO4IXk8+sJy7
	hsedknXyRrI5QBkmbWdjQ//hj5pLlc2bjYzVueNoKf67KeDiONbxM8TLHbVIusfdvuQnfs95RTm0n
	W3ABaIs84ErOVdczvDXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7pYa-0000000E8zU-0FzB;
	Wed, 01 Apr 2026 07:00:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7pYY-0000000E8zL-3RWS;
	Wed, 01 Apr 2026 07:00:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 848DC600AD;
	Wed,  1 Apr 2026 07:00:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DFC6C4CEF7;
	Wed,  1 Apr 2026 06:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775026801;
	bh=4HoH/phdBrc8oyL9BAmfrv1hLzyLn1XUdnpO9xKGt0A=;
	h=From:Subject:Date:To:Cc:From;
	b=KMHR94DgfRfOsfxuCdVVQP2+x0xQMgUCkKVaQ81WrDYnarnEtMItaUpDVYAYil9tF
	 DXanx74oixguSoHPe8XgMxIpsWv2hz/L2eckJm7zW7r9couPmi8qJL4Uw1zdhDnuM9
	 mdk/l2Lcw9gvPUrS+6JKCltA/PSW+2AERYiHyy87dq0ynJvZ7aLB5JIjJHWpaYYDoB
	 bFHTu4EHd+hnpXEHWdQ2rSdyURSpvJV3l2I4zuMqmysnGKIaBRzrUYO/oqN6bGkXeH
	 W4B3k5YSUEQaFzD1fbzdsVQiYsYETySEdt3NsD4tHAfrFRpXx434u71PxTmv9pc4p9
	 aCrfz3qi1Wh8A==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next v2 00/11] net: airoha: Support multiple
 net_devices connected to the same GDM port
Date: Wed, 01 Apr 2026 08:59:18 +0200
Message-Id: <20260401-airoha-eth-multi-serdes-v2-0-ac427ae4beeb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CMBBFr0Jm7ZhSaI2uvIdhUWCgE7ElbSUYw
 t1tiFuXLy///Q0iBaYIt2KDQAtH9i6DPBXQWeNGQu4zgxRSi0rWaDh4a5CSxdd7Sow50FPEoa1
 bpTTRRWnI6znQwOtRfoCjhI7WBE02lmPy4XNcLuXhf/Xr3/pSokAhBiX7rtKiM/cnBUfT2YcRm
 n3fv5vISCTJAAAA
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
X-Mailer: b4 0.14.2
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
Changes in v2:
- Rename multiplexer in arbiter in the commit logs.
- Rebase on top of net-next main branch.
- Add missing PPE cpu port configuration for GDM2 when loopback is
  enabled.
- Link to v1: https://lore.kernel.org/r/20260329-airoha-eth-multi-serdes-v1-0-00f52dc360ca@kernel.org

---
Lorenzo Bianconi (11):
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
      net: airoha: Rename get_src_port_id callback in get_sport

 .../devicetree/bindings/net/airoha,en7581-eth.yaml |  44 +-
 drivers/net/ethernet/airoha/airoha_eth.c           | 631 +++++++++++++--------
 drivers/net/ethernet/airoha/airoha_eth.h           |  30 +-
 drivers/net/ethernet/airoha/airoha_ppe.c           |  43 +-
 4 files changed, 502 insertions(+), 246 deletions(-)
---
base-commit: f1359c240191e686614847905fc861cbda480b47
change-id: 20260324-airoha-eth-multi-serdes-fb4b556ee756

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


