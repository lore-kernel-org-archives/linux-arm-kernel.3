Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3572DE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 19:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FxFSWBvNwwzGpNauOKJOh690c9DKh5Hm6FAncQMyVDc=; b=TQz97zMU5j5hF/cfIYIYEALbGm
	0X9907xxNeZU1dLU9gL0w1/YmlPWivIFb1+ZkMUESzScchEEOUeYW887WD/9YRZlULkd0nCH7PhTy
	UsU1EaVRqcFKPuJP4pC5TmMP6trHog+QCAHI/mvnk+Qh7odU3D5q/3j1hzthkUOQilLMlzu5O8KsB
	POwEocCRDgjJObynIYkn8tMrk2jbjkAlSg4s8/p+PQE6cO2yC0KPK5hXuH21tfzFnj3jzGbKY+yCl
	SZ4HrOeBC6USKUkhRZe79+5OWPCjET54VNB5QUXDyzOUO3vFJ2T9FqVQh6Mi1IteMtpa00pXQ8znH
	HoNE4X+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWKfX-0000000GlDP-0sTx;
	Fri, 10 Jan 2025 19:27:43 +0000
Received: from out-176.mta1.migadu.com ([2001:41d0:203:375::b0])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWKeI-0000000Gks5-0fn0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 19:26:27 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736537182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FxFSWBvNwwzGpNauOKJOh690c9DKh5Hm6FAncQMyVDc=;
	b=GGKDDtacV4yf0lK6ELn1ocYpufe2by1H/DwGK/SqiiJuk0KQ/wG34ylMnBZ1SnQofYAL2/
	SZ7+uYXtWjP4W39fxdF+BHQ4WjGEyqISAZs6LwY306b3RJhG0hmXfUuYI3UvCyYzpkx1r1
	VkBuneSKfG79zdyLae0gtuNrh73i7Jc=
From: Sean Anderson <sean.anderson@linux.dev>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	netdev@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Shannon Nelson <shannon.nelson@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-kernel@vger.kernel.org,
	Sean Anderson <sean.anderson@linux.dev>,
	Heng Qi <hengqi@linux.alibaba.com>
Subject: [PATCH net-next v3 0/6] net: xilinx: axienet: Enable adaptive IRQ coalescing with DIM
Date: Fri, 10 Jan 2025 14:26:10 -0500
Message-Id: <20250110192616.2075055-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_112626_465481_0B7FE0E1 
X-CRM114-Status: GOOD (  11.24  )
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

This series depends on [1].

[1] https://lore.kernel.org/netdev/20250110190726.2057790-1-sean.anderson@linux.dev/

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


