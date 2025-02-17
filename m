Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3118FC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 13:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Qby0aoPNnBt4i5+trw4To2X5K9VRL9j+Kbe5uPwj0WE=; b=iDMkEeEv0aPo7x
	dGTIFJdqonJdu8EEnEz+0sZtiK5w3nmwwZ8NBmn0BCatGQDMxbDEYuxemnGl1fhLlPjGG6J0+LX0p
	4k6JYYSs1grF0v3QBV9ODb6pEBeNUs63IyCo+6n/FLMXGwo9nfVL3OpLh+jvmxPraNftGTifcwnkG
	itA1uwnUROPZyyJMPNom2Tvb4iEoyIvtf4KFMMqNfQj457142DijD3NdhP7dIZBW4Vkdfvy7pvH65
	8DSb5E/7tOdGJo1kHE3ohpWkGt6u8L6V9oOZ7E2pJtaf3L6BWpaF/YDB3t9d2k7Kl12mu2H4pl8lj
	vhIurPvysnEYJOQjQlOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk0mI-00000004ZH9-36XP;
	Mon, 17 Feb 2025 13:03:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk0kp-00000004YsL-3AfF;
	Mon, 17 Feb 2025 13:01:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B6E185C5459;
	Mon, 17 Feb 2025 13:01:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47AD1C4CED1;
	Mon, 17 Feb 2025 13:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739797302;
	bh=cIsjN3B35mwEc0W6aqmA+6Jm4OtwZullnYehkdZC3TI=;
	h=From:Subject:Date:To:Cc:From;
	b=XNfH6r6w8M1iO/YNWQcvOo7OofZZ6A4urZLbRAsLl+8WCpMjoxbjrZpB6PbyhI0hx
	 qOqPaGx6dBzT65ZCnMnw+dDf0fQIM+Pcxx0LW5Uj6P2bZveLAL8MhuoAJG/kx8BrfH
	 mZih2m7hBzMCPOgo/UqoN7HBu/tmOlV2oucxPZ/DQjm3lVXZOTCdAE2cMtevu29M4f
	 vk36NHAMzsnZcKe3N/7OhaqUnm18Nxb93BBq//uuiYsWuQbAi9SwbbfA6cl0sCBNay
	 LVMIGPMaqgnHmPix6FMwvqYM9HCaUN4wQD5mZhJgJE5ufV2SaqiiTTG6nRpantg7W+
	 bM+/6lJ1AbfaA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next v5 00/15] Introduce flowtable hw offloading in
 airoha_eth driver
Date: Mon, 17 Feb 2025 14:01:04 +0100
Message-Id: <20250217-airoha-en7581-flowtable-offload-v5-0-28be901cb735@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABAzs2cC/43OQW7DIBAF0KtErEMEMwZCV71H1cVgxjGqZSIcu
 a0i3704K0dZuLv5f/H+3MXEJfEk3g53UXhOU8pjDeZ4EG1P44VlijULUGAUKCMpldyT5NGZs5b
 dkL9vFAaWuas3RclIWgcM2FAUVbkW7tLPY+Hjs+Y+Tbdcfh+Ds17b/9uzlkpGtNB25F1Q+v2Ly
 8jDKZeLWPEZtqDbB6GCSADorQey7gXELej3QVw/DGQVO2OMxRew2YAa98GmgsH6lrSNronhCVy
 W5Q+ZQVkBwgEAAA==
X-Change-ID: 20250205-airoha-en7581-flowtable-offload-e3a11b3b34ad
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 "Chester A. Unal" <chester.a.unal@arinc9.com>, 
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 upstream@airoha.com, Christian Marangi <ansuelsmth@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_050143_889014_545084BB 
X-CRM114-Status: GOOD (  12.71  )
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

Introduce netfilter flowtable integration in airoha_eth driver to
offload 5-tuple flower rules learned by the PPE module if the user
accelerates them using a nft configuration similar to the one reported
below:

table inet filter {
	flowtable ft {
		hook ingress priority filter
		devices = { lan1, lan2, lan3, lan4, eth1 }
		flags offload;
	}
	chain forward {
		type filter hook forward priority filter; policy accept;
		meta l4proto { tcp, udp } flow add @ft
	}
}

Packet Processor Engine (PPE) module available on EN7581 SoC populates
the PPE table with 5-tuples flower rules learned from traffic forwarded
between the GDM ports connected to the Packet Switch Engine (PSE) module.
airoha_eth driver configures and collects data from the PPE module via a
Network Processor Unit (NPU) RISC-V module available on the EN7581 SoC.
Move airoha_eth driver in a dedicated folder
(drivers/net/ethernet/airoha).

---
Changes in v5:
- Fix uninitialized variable in airoha_ppe_setup_tc_block_cb()
- Rebase on top of net-next
- Link to v4: https://lore.kernel.org/r/20250213-airoha-en7581-flowtable-offload-v4-0-b69ca16d74db@kernel.org

Changes in v4:
- Add dedicated driver for the Airoha NPU module
- Move airoha npu binding in net
- Link to v3: https://lore.kernel.org/r/20250209-airoha-en7581-flowtable-offload-v3-0-dba60e755563@kernel.org

Changes in v3:
- Fix TSO support for header cloned skbs
- Do not use skb_pull_rcsum() in airoha_get_dsa_tag()
- Fix head lean computation after running airoha_get_dsa_tag() in
  airoha_dev_xmit()
- Link to v2: https://lore.kernel.org/r/20250207-airoha-en7581-flowtable-offload-v2-0-3a2239692a67@kernel.org

Changes in v2:
- Add airoha-npu document binding
- Enable Rx SPTAG on MT7530 dsa switch for EN7581 SoC.
- Fix warnings in airoha_npu_run_firmware()
- Fix sparse warnings
- Link to v1: https://lore.kernel.org/r/20250205-airoha-en7581-flowtable-offload-v1-0-d362cfa97b01@kernel.org

---
Lorenzo Bianconi (15):
      net: airoha: Move airoha_eth driver in a dedicated folder
      net: airoha: Move definitions in airoha_eth.h
      net: airoha: Move reg/write utility routines in airoha_eth.h
      net: airoha: Move register definitions in airoha_regs.h
      net: airoha: Move DSA tag in DMA descriptor
      net: dsa: mt7530: Enable Rx sptag for EN7581 SoC
      net: airoha: Enable support for multiple net_devices
      net: airoha: Move REG_GDM_FWD_CFG() initialization in airoha_dev_init()
      net: airoha: Rename airoha_set_gdm_port_fwd_cfg() in airoha_set_vip_for_gdm_port()
      dt-bindings: net: airoha: Add the NPU node for EN7581 SoC
      dt-bindings: net: airoha: Add airoha,npu phandle property
      net: airoha: Introduce Airoha NPU support
      net: airoha: Introduce flowtable offload support
      net: airoha: Add loopback support for GDM2
      net: airoha: Introduce PPE debugfs support

 .../devicetree/bindings/net/airoha,en7581-eth.yaml |   10 +
 .../devicetree/bindings/net/airoha,en7581-npu.yaml |   72 ++
 drivers/net/dsa/mt7530.c                           |    5 +
 drivers/net/dsa/mt7530.h                           |    4 +
 drivers/net/ethernet/Kconfig                       |    2 +
 drivers/net/ethernet/Makefile                      |    1 +
 drivers/net/ethernet/airoha/Kconfig                |   27 +
 drivers/net/ethernet/airoha/Makefile               |    9 +
 .../net/ethernet/{mediatek => airoha}/airoha_eth.c | 1273 +++++---------------
 drivers/net/ethernet/airoha/airoha_eth.h           |  553 +++++++++
 drivers/net/ethernet/airoha/airoha_npu.c           |  518 ++++++++
 drivers/net/ethernet/airoha/airoha_npu.h           |   29 +
 drivers/net/ethernet/airoha/airoha_ppe.c           |  898 ++++++++++++++
 drivers/net/ethernet/airoha/airoha_ppe_debugfs.c   |  175 +++
 drivers/net/ethernet/airoha/airoha_regs.h          |  798 ++++++++++++
 drivers/net/ethernet/mediatek/Kconfig              |    8 -
 drivers/net/ethernet/mediatek/Makefile             |    1 -
 17 files changed, 3383 insertions(+), 1000 deletions(-)
---
base-commit: 0784d83df3bfc977c13252a0599be924f0afa68d
change-id: 20250205-airoha-en7581-flowtable-offload-e3a11b3b34ad

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


