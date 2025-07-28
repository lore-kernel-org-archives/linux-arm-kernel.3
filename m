Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C6F8C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 22:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RoBkZ5QUGz1TAZ0kZZyxij8ERJRPO6rkWOERhOGR4E4=; b=4xP5UK1++bOidZJCF7XqxH4xqM
	iy5T7fcPekcad6dYxR5enew/egTxFNDvPXZ+MeMrrPcEbsqhqzIJHB6hH4JaaImMa+JfG+iAnByPS
	2GXuteZB4I/Vw72hiftsuxWA/IOyVoDsEd5aBpXPE6Ug4PsdaHP46rm1khuECsz5esAkAFdwENefs
	q1iXMvyevrTE9RO1ysWc1YrFVWyZ4Wgsi2RymgjDJKLVmAAyc59AQz9LJhAeBTKgp0hi20VympPna
	rEdB0J04kx7btL9FHy1v0Aw3AF41KxZPk3pjvQZGjf79vxROvXswkhJ5DUnYnYJXFwkEOxpRMurjM
	sWN6T5TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugWDT-0000000FWIV-3sp5;
	Mon, 28 Jul 2025 22:21:07 +0000
Received: from out-181.mta1.migadu.com ([95.215.58.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugWB0-0000000FVpE-44ld
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 22:18:36 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753741110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RoBkZ5QUGz1TAZ0kZZyxij8ERJRPO6rkWOERhOGR4E4=;
	b=RCRhzBwWB66EFMEUo4+SlMC8Wf8eO3Ct6LmhikouZYnDrwGVRTBN39NDKZUtC2PGZLvUoP
	o37D2sNdjPLPrTPsgw4uY7JEXYbQg7ciI+aqjdEL9DG6NJelWJ0vD+9m6uCcNuoy9Xk7vH
	ysbM2DLWFBMnjef8LnqeK/K2O6NXsnE=
From: Sean Anderson <sean.anderson@linux.dev>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	Leon Romanovsky <leon@kernel.org>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH net-next v3 0/7] net: axienet: Fix deferred probe loop
Date: Mon, 28 Jul 2025 18:18:16 -0400
Message-Id: <20250728221823.11968-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_151835_445472_FB0EA1ED 
X-CRM114-Status: UNSURE (   8.34  )
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

Fix a deferred-probe loop by splitting the MAC and MDIO functionality
into separate drivers. Please refer to the last patch for an extended
look at the problem this series is attempting to solve.

This is a rather large fix for a rather rare bug, so I have sent it
for net-next. The first patch is a smaller fix, however, and could go
via net.

Changes in v3:
- Use ioread32/iowrite32 directly in MDIO
- Use MDIO bus device in prints
- Use device variable to probe
- Rework to use a separate axienet_common structure, as netdevs cannot
  be reused once registered.
- Use ida_alloc for aux id

Changes in v2:
- Fix building as a module
- Expand commit message with much more info on the problem and possible
  solutions

Sean Anderson (7):
  net: axienet: Fix resource release ordering
  net: axienet: Use ioread32/iowrite32 directly
  net: axienet: Use MDIO bus device in prints
  net: axienet: Simplify axienet_mdio_setup
  net: axienet: Use device variable in probe
  net: axienet: Rearrange lifetime functions
  net: axienet: Split into MAC and MDIO drivers

 drivers/net/ethernet/xilinx/Kconfig           |   1 +
 drivers/net/ethernet/xilinx/xilinx_axienet.h  |  45 +-
 .../net/ethernet/xilinx/xilinx_axienet_main.c | 383 +++++++++++-------
 .../net/ethernet/xilinx/xilinx_axienet_mdio.c | 158 ++++----
 4 files changed, 350 insertions(+), 237 deletions(-)

-- 
2.35.1.1320.gc452695387.dirty


