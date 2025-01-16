Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65DA4C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 23:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+1pCZCYTxd9JIXQBkYmreH5OVS2P9P4SJ14S/oIDWYo=; b=FoqQtoSKROMp6gpm2lm1x8Xdsc
	QxTXdhlrTLwDkCE0CFAWEbeltLw8q66jydvxZ8QKVr4yXHUlcfMwxMWrkmYTn8PDEAzWShI3IYzi5
	dlyO7VR11wuCY7f3uP0qf6CQYZTLZMh8TEL69e0bHiALGlxAh7jKnsjQrX+kQOjNu9zUs7p4IbhcF
	jOIGhuJ9wbmLeiLkEnYvrC/0ngAU5zJd74w9UBSkROf70en8R0maonImHmQ/xzswJ+oCeG6VGmQwC
	oYW4SbiBMiLJFKyBdfUfDA9fqeN3DJYaa5q3XPg1uTR/8xBYRyX3NtrMQtXBAAezLBfbhZiQzgHyR
	SJJUePLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZTo-0000000GZEQ-1WgQ;
	Thu, 16 Jan 2025 23:40:52 +0000
Received: from out-172.mta1.migadu.com ([95.215.58.172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZJK-0000000GSvx-3gkY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 23:30:05 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737070200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+1pCZCYTxd9JIXQBkYmreH5OVS2P9P4SJ14S/oIDWYo=;
	b=G0nM/EMKXh83jcV/sMw08ZNJ53XFyCQpN+/KzNrSt42f49uDqtqaMaySZu7cK0q6n0b5EB
	bFVXz6oTPBWBKdVprlBwEXdgadrXaupusr/c4aGBiJpIwXJa/El3kKYZiT/SUmtyP0xSO1
	7BbbxBvtCRCbovZiUN0oM6w36ZBK814=
From: Sean Anderson <sean.anderson@linux.dev>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	netdev@vger.kernel.org
Cc: Michal Simek <michal.simek@amd.com>,
	linux-kernel@vger.kernel.org,
	Shannon Nelson <shannon.nelson@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	Sean Anderson <sean.anderson@linux.dev>,
	Heng Qi <hengqi@linux.alibaba.com>
Subject: [PATCH net-next v4 0/6] net: xilinx: axienet: Enable adaptive IRQ coalescing with DIM
Date: Thu, 16 Jan 2025 18:29:48 -0500
Message-Id: <20250116232954.2696930-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_153003_071623_6A8BE1B8 
X-CRM114-Status: GOOD (  10.45  )
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

To improve performance without sacrificing latency under low load,
enable DIM. While I appreciate not having to write the library myself, I
do think there are many unusual aspects to DIM, as detailed in the last
patch.

Changes in v4:
- Fix incorrect function name in doc comment for axienet_coalesce_params
- Rebase onto net-next/master

Changes in v3:
- Fix mismatched parameter name documentation for axienet_calc_cr
- Integrate some cleanups originally included in
  https://lore.kernel.org/netdev/20240909230908.1319982-1-sean.anderson@linux.dev/
- Move spin (un)locking in IRQs inside the if condition of
  napi_schedule_prep. This lets us hold the lock just for the rmw.
- Fix function name in doc comments for axienet_update_coalesce_rx/tx
- Adjust axienet_local doc comment order to match the members
- Rebase onto net-next/master

Changes in v2:
- Add some symbolic constants for IRQ delay timer
- Report an error for bad coalesce settings
- Don't use spin_lock_irqsave when we know the context
- Split the CR calculation refactor from runtime coalesce settings
  adjustment support for easier review.
- Have axienet_update_coalesce_rx/tx take the cr value/mask instead of
  calculating it with axienet_calc_cr. This will make it easier to add
  partial updates in the next few commits.
- Get coalesce parameters from driver state
- Don't take the RTNL in axienet_rx_dim_work to avoid deadlock. Instead,
  calculate a partial cr update that axienet_update_coalesce_rx can
  perform under a spin lock.
- Use READ/WRITE_ONCE when accessing/modifying rx_irqs

Sean Anderson (6):
  net: xilinx: axienet: Add some symbolic constants for IRQ delay timer
  net: xilinx: axienet: Report an error for bad coalesce settings
  net: xilinx: axienet: Combine CR calculation
  net: xilinx: axienet: Support adjusting coalesce settings while
    running
  net: xilinx: axienet: Get coalesce parameters from driver state
  net: xilinx: axienet: Enable adaptive IRQ coalescing with DIM

 drivers/net/ethernet/xilinx/Kconfig           |   1 +
 drivers/net/ethernet/xilinx/xilinx_axienet.h  |  32 +-
 .../net/ethernet/xilinx/xilinx_axienet_main.c | 330 ++++++++++++++----
 3 files changed, 280 insertions(+), 83 deletions(-)

-- 
2.35.1.1320.gc452695387.dirty


