Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEECC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 18:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VQ3470r1lLta6MKqo3Ln0hyGKyFHzizMUGcFm21+ydc=; b=By63Xgqzbt5sk6
	vaGjXeTxxRdGzwlMdyc0T/txoQJ3tbQ/qMOWizzO0/PzNOrLEoakI3N8bj5KdJVU7UQeTLJlqz+zO
	6mAw9m/24Ed6wubP+2kqDgvXH1z61reAoWndlTrAgBBQeuSFd2altln3qwsa11TWX6fib/kPYSYAP
	7Z3+2uPF92LAfMBIvVSWidXPabJGQXsRFxRhKyQnL0aDgb3AMknX5prZsO0zK8rTuColtQl9lg5gw
	G3PUWyE6V6h/pmwVDEEVfBWuaPWjE7Pu4Plw1eCt8oDpwkhsMHXpti57n4PirvG5/HbPr7SUlvP2r
	1MtgzqWkmSO5r9envrOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfk3d-00000004Ent-0zjM;
	Wed, 05 Feb 2025 18:23:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfk2F-00000004EWD-490n;
	Wed, 05 Feb 2025 18:22:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3FE1A5C077F;
	Wed,  5 Feb 2025 18:21:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 366EDC4CED1;
	Wed,  5 Feb 2025 18:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738779722;
	bh=SqMKmdlV8li1b5GqGJ7nzzQ4TW5jigeCPr1xbGk1wJA=;
	h=From:Subject:Date:To:Cc:From;
	b=AKr7Bwohk7fQ2NjKiLGD4FDOIFn52qFzErjfd4iCCrBiIX2QR5DBLQwuOnPVi8hdd
	 uUq1kTBY0k+Nm6KxBoUVngwzzzcc6vS625mPd8ZUHYZje51sVBLTYC2QFtPLKqWpt4
	 kqxCh2RhTAgzySGmSBwUQSM61FXnik9dt7m6o1Ka3hvOuklQ9oQyTjgNrdYGUjsCKD
	 lSGFiXgqPog17icF6a5f4PEz7TRYHWMwkMxKEWc1QJSHo4Q4YXgnucojc49H3iqqBt
	 woK4BO3ejsCMkLrivCiesSqYUddLy9b5z794MqM/cHDlwS3q/MVYZxButCV/9/4w4d
	 fltVqqII4Xkdw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next 00/13] Introduce flowtable hw offloading in
 airoha_eth driver
Date: Wed, 05 Feb 2025 19:21:19 +0100
Message-Id: <20250205-airoha-en7581-flowtable-offload-v1-0-d362cfa97b01@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB+so2cC/x2NywqDMBAAf0X27EIehpb+SvGwaTZ1QRJJihaC/
 27wNnOZaVC5CFd4DQ0K71Ilpy56HOCzUPoySugORhmnjHJIUvJCyOnhnhrjmo8f+ZUxx84UkC1
 p7a23EwXola1wlP99eM/neQHYrpJ4cQAAAA==
X-Change-ID: 20250205-airoha-en7581-flowtable-offload-e3a11b3b34ad
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 upstream@airoha.com, Christian Marangi <ansuelsmth@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_102204_118381_E9B80E3A 
X-CRM114-Status: UNSURE (   9.16  )
X-CRM114-Notice: Please train this message.
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
Lorenzo Bianconi (13):
      net: airoha: Move airoha_eth driver in a dedicated folder
      net: airoha: Move definitions in airoha_eth.h
      net: airoha: Move reg/write utility routines in airoha_eth.h
      net: airoha: Move register definitions in airoha_regs.h
      net: airoha: Move DSA tag in DMA descriptor
      net: airoha: Enable support for multiple net_devices
      net: airoha: Move REG_GDM_FWD_CFG() initialization in airoha_dev_init()
      net: airoha: Rename airoha_set_gdm_port_fwd_cfg() in airoha_set_vip_for_gdm_port()
      dt-bindings: net: airoha: Add airoha,npu phandle property
      net: airoha: Introduce PPE initialization via NPU
      net: airoha: Introduce flowtable offload support
      net: airoha: Add loopback support for GDM2
      net: airoha: Introduce PPE debugfs support

 .../devicetree/bindings/net/airoha,en7581-eth.yaml |    8 +
 drivers/net/ethernet/Kconfig                       |    2 +
 drivers/net/ethernet/Makefile                      |    1 +
 drivers/net/ethernet/airoha/Kconfig                |   23 +
 drivers/net/ethernet/airoha/Makefile               |    9 +
 .../net/ethernet/{mediatek => airoha}/airoha_eth.c | 1263 +++++---------------
 drivers/net/ethernet/airoha/airoha_eth.h           |  625 ++++++++++
 drivers/net/ethernet/airoha/airoha_npu.c           |  500 ++++++++
 drivers/net/ethernet/airoha/airoha_ppe.c           |  812 +++++++++++++
 drivers/net/ethernet/airoha/airoha_ppe_debugfs.c   |  175 +++
 drivers/net/ethernet/airoha/airoha_regs.h          |  793 ++++++++++++
 drivers/net/ethernet/mediatek/Kconfig              |    8 -
 drivers/net/ethernet/mediatek/Makefile             |    1 -
 13 files changed, 3217 insertions(+), 1003 deletions(-)
---
base-commit: 135c3c86a7cef4ba3d368da15b16c275b74582d3
change-id: 20250205-airoha-en7581-flowtable-offload-e3a11b3b34ad

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


