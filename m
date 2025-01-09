Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B44E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 18:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LwMqfIikvd/1dQrt3XsrQU9t1SYzasmjzdcObwnCwxg=; b=I1DC9EtPtVYbz0
	dVhykP4YUGUP1RI6Bij23EnQVUNUARsfQ6774XmMOiCTWyNjYHl35aWx+RzrQLqtsEr+uUmCOJnGl
	tmO7gTe2D3m5KPv9hSDXiKxMLdWUrrxuM5O4Xo5/7Zwkdinr/neediK+MEarGV/FoX7qWlhJCeMyE
	ZGmSNq/FDhUOiT114Hs4jWsBAyhlvEETvQ9Xwj3LGlbfZoOgUIedZLbAffITqqXlxONAPRVdc7GjI
	U9EfyPNzZ80KXQl3F3thKTjvMKcJmlnhSk/JA/wIe7eGWBdt3pBYSPCQY1jHuDFha2LcI4RVFgnGh
	xDk6GQhNW34V9CE07TmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVxRT-0000000Czuw-17CX;
	Thu, 09 Jan 2025 18:39:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVxQF-0000000CzcX-3E1a
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 18:38:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1736447903; x=1767983903;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=3beYjMhSJaOr4cvKfxRV0js+xV1+RIWvdMPbZLdkq1c=;
  b=S8Z2Ac2xw/KgN4lHVe90+qYx1B6yh/AlODgA5o5TwyTKf56sJic3QTPO
   VH5rM9fAV0Q1eCF1Hu4SuqgbSovxUD/Ttxf+nyxM+Dl+34qtUqlaAoaWp
   UAskdaEO9ShfwvQzh7kipbOFvpJoz0EctQp6cehkM6VrxenRkUAZ5ijcP
   zO0Vi5PzL731vCsrFRU9uXxW+SrIPJ+ybNbbsrBIHiBCXyJ95aJYWWjf4
   sOjsCvx7i4niXtWDNaqllLixB2a1hx7P+dM0kwM84Hep30MN/7BrxZqv4
   KDwaMM3xg8gyG0iIDJDnBZ3L3cilCaS6CGLWBSg8zNpZB1Tx4UdFR2Skc
   A==;
X-CSE-ConnectionGUID: lYxo9VQwQ0yequjZYTYLoQ==
X-CSE-MsgGUID: XJ3zDsrzR7OJpunoJAADUA==
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="36007556"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Jan 2025 11:38:20 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 Jan 2025 11:38:05 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 9 Jan 2025 11:38:02 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Subject: [PATCH net-next 0/6] net: lan969x: add FDMA support
Date: Thu, 9 Jan 2025 19:37:52 +0100
Message-ID: <20250109-sparx5-lan969x-switch-driver-5-v1-0-13d6d8451e63@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIAXgGcC/x2N0QqDMAwAf0XyvICKFd2vjD2kNVsDWyZp0YL47
 +v2eBzcHZDYhBNcmwOMN0ny0QrdpYEQSZ+MslSGvu1d27UjppWsOHyRzuNcMO2SQ8TFZGNDh66
 nYeTg3TBNUCOr8UPKf3AD5YzKJcO9Gk+J0RtpiL/Bm0ThPL9aG0HOkQAAAA==
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Andrew Lunn
	<andrew+netdev@lunn.ch>, Lars Povlsen <lars.povlsen@microchip.com>, "Steen
 Hegelund" <Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>,
	Richard Cochran <richardcochran@gmail.com>,
	<jensemil.schulzostergaard@microchip.com>, <horatiu.vultur@microchip.com>,
	<jacob.e.keller@intel.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_103823_886320_9B806897 
X-CRM114-Status: GOOD (  14.98  )
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

== Description:

This series is the last of a multi-part series, that prepares and adds
support for the new lan969x switch driver.

The upstreaming efforts has been split into multiple series:

        1) Prepare the Sparx5 driver for lan969x (merged)

        2) Add support for lan969x (same basic features as Sparx5
           provides excl. FDMA and VCAP, merged).

        3) Add lan969x VCAP functionality (merged).

        4) Add RGMII support (merged).

    --> 5) Add FDMA support.

== FDMA support:

The lan969x switch device uses the same FDMA engine as the Sparx5 switch
device, with the same number of channels etc. This means we can utilize
the newly added FDMA library, that is already in use by the lan966x and
sparx5 drivers.

As previous lan969x series, the FDMA implementation will hook into the
Sparx5 implementation where possible, however both RX and TX handling
will be done differently on lan969x and therefore requires a separate
implementation of the RX and TX path.

Details are in the commit description of the individual patches

== Patch breakdown:

Patch #1: Enable FDMA support on lan969x
Patch #2: Split start()/stop() functions
Patch #3: Activate TX FDMA in start()
Patch #4: Move consumption of SKB's to xmit()
Patch #5: Ops out a few functions that differ on the two platforms
Patch #6: Add FDMA implementation for lan969x

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
Daniel Machon (6):
      net: sparx5: enable FDMA on lan969x
      net: sparx5: split sparx5_fdma_{start(),stop()}
      net: sparx5: activate FDMA tx in start()
      net: sparx5: move SKB consumption to xmit()
      net: sparx5: ops out certain FDMA functions
      net: lan969x: add FDMA implementation

 drivers/net/ethernet/microchip/sparx5/Kconfig      |   1 +
 drivers/net/ethernet/microchip/sparx5/Makefile     |   3 +-
 .../ethernet/microchip/sparx5/lan969x/lan969x.c    |   4 +
 .../ethernet/microchip/sparx5/lan969x/lan969x.h    |   6 +
 .../microchip/sparx5/lan969x/lan969x_fdma.c        | 408 +++++++++++++++++++++
 .../net/ethernet/microchip/sparx5/sparx5_fdma.c    |  67 ++--
 .../net/ethernet/microchip/sparx5/sparx5_main.c    |  19 +-
 .../net/ethernet/microchip/sparx5/sparx5_main.h    |  28 +-
 .../net/ethernet/microchip/sparx5/sparx5_packet.c  |   6 +-
 9 files changed, 510 insertions(+), 32 deletions(-)
---
base-commit: 3e5908172c05ab1511f2a6719b806d6eda6e1715
change-id: 20250106-sparx5-lan969x-switch-driver-5-52a46ecb5488

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>


