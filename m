Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B884C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 16:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y5cgNoeJdpoM4VQYvEYC5EosBRNndPbA0Cc9v1Wuchs=; b=L3sSbAyiO/LXR4054P5MbxovMX
	2Vlbmu9bNyO5DNAMDT6QgXy5YwyXBjQTB+uWOZjYmSQnbzUwf+espGDNr5UFaBXsFviHjCnrinnnW
	n7X8PFf/FTLSama83WYxyyGAfJDvs9kxsvV7FmZlYbj4BcZYz2SVmjYPdlmf7ZIyZgThFUcjNtLOT
	JxsMIRQBeGKHUpGOf0zg+4iCGlxUGsibrPkbxB7ioRTFcyqD4fMdplqOH9W5FYBNTyE/qS5uzY8q8
	DTErvmXHu63j++va4kh0vUoRUQExdJMrzTpV/IPWOUZ/QgXCasZCE5FgFyxjJ8flHY+bjVozhmoat
	MFCf+gow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujKgD-0000000DJtO-2TVy;
	Tue, 05 Aug 2025 16:38:25 +0000
Received: from out-184.mta0.migadu.com ([91.218.175.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujJh4-0000000D9di-2Bjy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 15:35:16 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754408111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Y5cgNoeJdpoM4VQYvEYC5EosBRNndPbA0Cc9v1Wuchs=;
	b=j9QuLMVWNdNp8fd20wM7ipE8AXgk2H2WC2QLVVLF1CsNmsIriCxjnzFuiB1wfzSeK3WsDK
	iEInsfRhVUTAT/D2aaTAkija6ws6ieD0Rw06ZYf8XwUisHb8oM8WV65w6Uxg/3piu7LjT9
	T1yJmG8kkphlJixzWR/kWl9Bss7NbqM=
From: Sean Anderson <sean.anderson@linux.dev>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Simek <michal.simek@amd.com>,
	Leon Romanovsky <leon@kernel.org>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH net-next v4 0/7] net: axienet: Fix deferred probe loop
Date: Tue,  5 Aug 2025 11:34:49 -0400
Message-Id: <20250805153456.1313661-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_083514_709875_45B13643 
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

Fix a deferred-probe loop by splitting the MAC and MDIO functionality
into separate drivers. Please refer to the last patch for an extended
look at the problem this series is attempting to solve.

This is a rather large fix for a rather rare bug, so I have sent it
for net-next. The first patch is a smaller fix, however, and could go
via net.

Changes in v4:
- Fix documentation for axienet_mdio_enable
- Fix platform_driver_register in exit

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


