Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC7FCA601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 11:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mzSp49/wgTWBWB/X6PVOTRfy8Mqe6lgyzjL/LzFwb1U=; b=j3TalEGryqW7gS
	ulKy7EktxPO7TpGhFOgjNESFFtJv6eY910u0qxGnGwWsmjYx59QVYN6C/NkWempWG+TLYbx8+G6FT
	v7i/vJNMb8m1CDhC9l+aFhNqcMfLhKfoxIHjzf3qtdjBTL91JIYd9/9L8L0dfUi17TKg+8R5jlUIM
	fR2u0hs9/OoDCwxjDr/y+M0jt9jIfeGKL5otxbtZL7o+XbREgs0m2ob02ZfTPJgrhPbBU/jkPmJcv
	ybIdE8vZoJ0zwoR0v+PQshYQkRzNMrbe5XSXLXaHz1PhrF685UuCPgww0Js3YB2oSDRJyPewKgMou
	iBc47+Z44MLkb9PZ1BRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF9Aq-00000006EwL-3MPM;
	Fri, 09 Oct 2026 11:54:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF9An-00000006EvL-1t5x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 11:54:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1791546841; x=1823082841;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=taFyZ5t12GbWm2zzYISSWlCvN0RZfDZunnQWmHBdvZM=;
  b=dTjYwyiP/H7U3C3oCdMRTggzp4vPscalcXt5rCzY6pvbjGqYc8XPPNN3
   zLnmvfZItP4v1R2d+2jGymqrIc3kzQdFS4f9emE4ec5Td5cDIiG4qiKck
   CLr9n/yxDA4Zk8w2xbCornQSN2uAFiM/Bdp8uam4vibdv8OByM6kgrQSe
   Ox8d6P3oRApwhu1l4z27oJyELlfabBtRkfD59jGB9gGPnTD3o19lhwfvW
   /rGKgDDk5ThwencH+KTTPpYStsFDz20vl2zbYyx5KaW8+T4CYFYxGH8PD
   18escbGlVyQuSHJoMNRrfsFuYcJjepsyHaeYu7Jmz8UXWTxi0itVhM5nZ
   g==;
X-CSE-ConnectionGUID: GPvI4pCYQRmkWyhqC5R3CA==
X-CSE-MsgGUID: G1G6WGXmSJCr5loWVLf/2w==
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="231901784"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2026 04:53:59 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 9 Oct 2026 04:53:59 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 9 Oct 2026 04:53:57 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Subject: [PATCH net-next 0/5] net: sparx5: add tc matchall port policer
 offload
Date: Fri, 9 Oct 2026 13:52:00 +0200
Message-ID: <20261009-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v1-0-4916708a7ea2@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGDVyGoC/yWNQQqDMBBFryKz7kC0cSS9SnGRxrEdsDFMQgmId
 29oNx/eW7x/QGYVznDrDlD+SJY9NugvHYSXj09GWRrDYAYy7mrwYXHz0RFVTEFwXd4ec/Jax79
 3ze9a2mwSWDPayVJvppF4IGjZpLxK/V3eIXLByLXAfJ5fc0ZWVowAAAA=
X-Change-ID: 20260930-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-474610756e26
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Daniel Machon <daniel.machon@microchip.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_045401_523400_30CFE5A2 
X-CRM114-Status: GOOD (  10.89  )
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

This series adds offload of tc matchall filters with a police action to
the ingress port policers of Sparx5 and lan969x, which are both served
by the sparx5 driver.

In hardware, each ingress port has four single-rate leaky bucket
policers. A policer drops the frames that exceed its rate and burst.
The four policers of a port share the pass and drop statistics counters
of the port.

The driver uses one policer per port, because with more than one, the
statistics reported to tc could not be attributed to the right policer.
This matches lan966x and ocelot. The policer meters each frame
including 20 bytes of preamble and inter-frame gap, so the configured
rate is a line rate, also as on lan966x and ocelot.

Since the policer meters all ingress frames on the port, only filters on
chain 0 with protocol all are offloaded, and filters on shared blocks
are rejected. Only drop is supported as the exceed action, and the
police overhead parameter is not supported.

Patch #1 drops a redundant prefix from the existing POL_UPD_INT_CFG
register macros.

Patch #2 adds the registers used by the port policer.

Patch #3 tracks whether the ingress block of a port is shared, and adds
the per-port policer state.

Patch #4 adds the hardware programming of the port policer.

Patch #5 adds the tc matchall offload.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
Daniel Machon (5):
      net: sparx5: Drop redundant POL_ prefix from POL_UPD_INT_CFG
      net: sparx5: Add registers used by the port policer
      net: sparx5: Track shared tc blocks and per-port policer state
      net: sparx5: Add hardware programming for the port policer
      net: sparx5: Offload tc port policers via matchall

 .../microchip/sparx5/lan969x/lan969x_regs.c        |   7 +
 .../net/ethernet/microchip/sparx5/sparx5_ethtool.c |   1 +
 .../net/ethernet/microchip/sparx5/sparx5_main.c    |   6 +-
 .../net/ethernet/microchip/sparx5/sparx5_main.h    |  36 +-
 .../ethernet/microchip/sparx5/sparx5_main_regs.h   | 117 +++++-
 .../net/ethernet/microchip/sparx5/sparx5_police.c  | 404 ++++++++++++++++++++-
 drivers/net/ethernet/microchip/sparx5/sparx5_qos.c |   4 +
 .../net/ethernet/microchip/sparx5/sparx5_regs.c    |   7 +
 .../net/ethernet/microchip/sparx5/sparx5_regs.h    |   7 +
 drivers/net/ethernet/microchip/sparx5/sparx5_tc.c  |  14 +-
 .../ethernet/microchip/sparx5/sparx5_tc_matchall.c |  38 ++
 11 files changed, 627 insertions(+), 14 deletions(-)
---
base-commit: d8674294aefef02266c4d47ad10131f1bffbe534
change-id: 20260930-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-474610756e26

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>


