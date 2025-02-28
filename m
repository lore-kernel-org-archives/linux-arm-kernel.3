Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98692C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 11:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+CvipCPFnQOohpxvW+AIGYY3NfzT6KeKeGgj3mAUTNI=; b=XQYmbBz0x1uPe+
	6v0x5HtwmU+xeMUdokdzieZmPVNpfNpHtd4O2riIqcxOfZjbi73DHeYQOhF4QhAM2d8pqC5NVdDTy
	OXB6KTtnBBglOHFvpRB4h4fXRtp9dpmBNGsV9j9J4xPyxplEiEDntSp+vwjM+iFyn9f9fOTVUY0Pf
	e4O295dy58I9o2OqsK7VdewOspmiWg9SDCs+bX9gIcAEbsygr/HuxDfNWgefdgiqH/pt5eqiHjqhg
	J5cufO+LRQw7yFloxB/SPoBYmca98oEYF40Vq2LErZVSAGf26plr09MV7iOyTbHQLyHudW7QjJoTr
	xf2uM7ur6lJvMYlnuWjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnySi-0000000Ak1q-0M9t;
	Fri, 28 Feb 2025 11:23:24 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tny0k-0000000Af5X-0Yuw;
	Fri, 28 Feb 2025 10:54:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A8D5C60008;
	Fri, 28 Feb 2025 10:54:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B7E9C4CED6;
	Fri, 28 Feb 2025 10:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740740068;
	bh=D378USUaujIOtk3JUxmuhX8B+XhE/CL+/pfeMthqgwk=;
	h=From:Subject:Date:To:Cc:From;
	b=hfeP8FLYk+uGh95AyYg6p7IDmqj2gw0NYL/h0yN6vOtfFGIVhx3r6vVR/ea07VsIs
	 i+vaF8ucj2/o/B9w7yCKjnfSd8YliktJyZwen/dMlI+M72KkKRkaBRt0BRbfAoAegi
	 9pqtKMOpFOt9NXon/4HC48K42i5QwfmArXtX5vujHF8UFrslfjSYzyuBGsBsJPeQC1
	 XctCWdacskBlHxuMChCsQTWzYDQK3nEf4hGck3kfmyX5F9ty6CWE9Q0qMF5FrwYbgW
	 jtUSEsOqvCktHTNBhWITvVkFywgCau6qSGw9tw28aICDUpiRTye8s0q/hahqJsdwqK
	 RwgsFMSdPI4xw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next v8 00/15] Introduce flowtable hw offloading in
 airoha_eth driver
Date: Fri, 28 Feb 2025 11:54:08 +0100
Message-Id: <20250228-airoha-en7581-flowtable-offload-v8-0-01dc1653f46e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANCVwWcC/43RTW7DIBAF4KtErEsFDD+mq96j6mIw4xg1MhGO3
 FaR716cFZUXzo7H4hvecGczlUQzezvdWaElzSlPNXQvJ9aPOJ2Jp1gzU0IZoYThmEoekdPkTCf
 5cMnfNwwX4nmoZ4ycAKUMEEBjZFW5FhrSz2PCx2fNY5pvufw+Bi5yu33eXiQXPIJV/YDeBSHfv
 6hMdHnN5cw2fFEt6I5BVUFApcBbr9C6HQgt6I9B2F4Y0ApyxhgLO1A3oIRjUFcwWN+jtNHpGHa
 gacEnKpsKqi6QF7IPDswOtA2o5DFot8rGAw6CvO72O3QtqI9Bt1XW9VcwdmA1/QPXdf0D9Faju
 LUCAAA=
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
 upstream@airoha.com, Sayantan Nandy <sayantan.nandy@airoha.com>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Changes in v8:
- Remove unnecessary GFP_ZERO flag in dmam_alloc_coherent()
- Fix 802.1q offloading support
- Link to v7: https://lore.kernel.org/r/20250224-airoha-en7581-flowtable-offload-v7-0-b4a22ad8364e@kernel.org

Changes in v7:
- Fix Coccicheck warnings
- Add missing request_module
- Introduce ops in airoha_npu struct
- Add missing wlan interrupt to airoha_npu binding
- Link to v6: https://lore.kernel.org/r/20250221-airoha-en7581-flowtable-offload-v6-0-d593af0e9487@kernel.org

Changes in v6:
- Fix Smatch errors.
- Remove unnecessary GFP_DMA allocating NPU buffers
- Remove wrong dma coherent mask
- Rely on skb_cow_head() instead of skb_ensure_writable() in
  airoha_get_dsa_tag()
- Unregister net_device before deallocating metadata_dst
- Link to v5: https://lore.kernel.org/r/20250217-airoha-en7581-flowtable-offload-v5-0-28be901cb735@kernel.org

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
 .../devicetree/bindings/net/airoha,en7581-npu.yaml |   84 ++
 drivers/net/dsa/mt7530.c                           |    5 +
 drivers/net/dsa/mt7530.h                           |    4 +
 drivers/net/ethernet/Kconfig                       |    2 +
 drivers/net/ethernet/Makefile                      |    1 +
 drivers/net/ethernet/airoha/Kconfig                |   27 +
 drivers/net/ethernet/airoha/Makefile               |    9 +
 .../net/ethernet/{mediatek => airoha}/airoha_eth.c | 1277 +++++---------------
 drivers/net/ethernet/airoha/airoha_eth.h           |  551 +++++++++
 drivers/net/ethernet/airoha/airoha_npu.c           |  520 ++++++++
 drivers/net/ethernet/airoha/airoha_npu.h           |   34 +
 drivers/net/ethernet/airoha/airoha_ppe.c           |  910 ++++++++++++++
 drivers/net/ethernet/airoha/airoha_ppe_debugfs.c   |  181 +++
 drivers/net/ethernet/airoha/airoha_regs.h          |  798 ++++++++++++
 drivers/net/ethernet/mediatek/Kconfig              |    8 -
 drivers/net/ethernet/mediatek/Makefile             |    1 -
 17 files changed, 3422 insertions(+), 1000 deletions(-)
---
base-commit: 56794b5862c5a9aefcf2b703257c6fb93f76573e
change-id: 20250205-airoha-en7581-flowtable-offload-e3a11b3b34ad

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


