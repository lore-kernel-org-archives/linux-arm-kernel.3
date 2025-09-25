Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C66CAC5B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 14:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I0t7ozr8R0y7L7Ia/qOG5GKnLAJmLy1UlDO9kkxmSJw=; b=OaabqIM8TbEpA7QgZCAGzgzoBZ
	21XSMyJhF60OG6qkUD87ltdAMZt9jwsBjf1z/wj6hinh4QVYcGFgEqAojvv/ObTX+VSVj7j6MGi0e
	WwU46myGDux5iqTSduwbUZgLhA48BPllrMhn1LCWq81SPxQW//o3Kz8ZYDs6mzmdT14zmWQs7U6sk
	n+I6sKUAfGfSkX7DrHeDhlYTdopHKt8VCADcHi0Y4IToRLZkSyU5NiLrAYGasjUjdLUFaG160wS8W
	p38B4aYavppL9MaI4bGW7axVdl9CkP9XTSX/cjV1RBwLCkvin+1X9U56i5umibegh+tmYt/WO8+2i
	VnWQInUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1mjl-00000009sgK-2bAh;
	Thu, 25 Sep 2025 14:14:21 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1mjj-00000009s5b-2FEY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 14:14:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=I0t7ozr8R0y7L7Ia/qOG5GKnLAJmLy1UlDO9kkxmSJw=; b=FBqAIEjfEYjB7gCRJfZ/zgmY87
	mDOE39iI2LRBclqTdgQT8ldj1khf6g/FtegjZwMwBmxWPg3NWSBPyQcLNdqfLHPLXfePo1xaAHkY9
	KfmAG1sJ/aY5STKe7z/qdgv+mkX4jlHWJqmjOnvzV6poZBfgZ8E61G6plgkdEUcruFyq0izcToLpA
	s2q6bw8X1ZiL0bt16WdLnmnB8BbX/cyg6vjVaULT/Hc6blqANh6c9GxC6n8P9l5foJ1z7KZPj6gRc
	HrUteKtA3XlO17gu+R0q7g0yT3w51lN8TqEiTuXdcv5F85OEPR6YWXCG9y5xr6xH6IqFx1MbnKfyT
	LQz9WM8A==;
Received: from [122.175.9.182] (port=9537 helo=cypher.couthit.local)
	by server.couthit.com with esmtpa (Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1v1mj2-00000005fRb-1Afp;
	Thu, 25 Sep 2025 10:13:36 -0400
From: Parvathi Pudi <parvathi@couthit.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	danishanwar@ti.com,
	parvathi@couthit.com,
	rogerq@kernel.org,
	pmohan@couthit.com,
	basharath@couthit.com,
	afd@ti.com
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	pratheesh@ti.com,
	prajith@ti.com,
	vigneshr@ti.com,
	praneeth@ti.com,
	srk@ti.com,
	rogerq@ti.com,
	krishna@couthit.com,
	mohan@couthit.com
Subject: [PATCH net-next 0/3] RSTP SWITCH support for PRU-ICSSM Ethernet driver
Date: Thu, 25 Sep 2025 19:32:09 +0530
Message-ID: <20250925141246.3433603-1-parvathi@couthit.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.couthit.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.couthit.com: authenticated_id: parvathi@couthit.com
X-Authenticated-Sender: server.couthit.com: parvathi@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_071419_655861_934AFD88 
X-CRM114-Status: GOOD (  11.17  )
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

Hi,

The DUAL-EMAC patch series for Megabit Industrial Communication Sub-system
(ICSSM), which provides the foundational support for Ethernet functionality
over PRU-ICSS on the TI SOCs (AM335x, AM437x, and AM57x), was merged into
net-next recently [1].

This patch series enhances the PRU-ICSSM Ethernet driver to support
RSTP SWITCH mode, which has been implemented based on "switchdev" and
interacts with "mstp daemon" to support Rapid Spanning Tree Protocol
(RSTP) as well.

Once the RSTP SWITCH mode is enabled, forwarding of Ethernet packets using
either the traditional store-and-forward mechanism or via cut-through is
offloaded to the two PRU based Ethernet interfaces available within the
ICSSM. The firmware running on the PRU inspects the STP port states and
performs multiple checks before forwarding a packet. This improves the
overall system performance and significantly reduces the packet forwarding
latency.

Protocol switching from dual EMAC to RSTP SWITCH mode can be done as follows.

Assuming eth2 and eth3 are the two physical ports of the ICSS2 instance:

>> brctl addbr br0
>> ip maddr add 01:80:c2:00:00:00 dev br0
>> ip link set dev br0 address $(cat /sys/class/net/eth2/address)
>> brctl addif br0 eth2
>> brctl addif br0 eth3
>> mstpd
>> brctl stp br0 on
>> mstpctl setforcevers br0 rstp
>> ip link set dev br0 up

To revert back to the default dual EMAC mode, the steps are as follows:

>> ip link set dev br0 down
>> brctl delif br0 eth2
>> brctl delif br0 eth3
>> brctl delbr br0

The patches presented in this series have gone through the patch verification
tools and no warnings or errors are reported.

Sample test logs obtained from AM33x, AM43x and AM57x verifying the
functionality on Linux next kernel are available here:

[Interface up Testing](https://gist.github.com/ParvathiPudi/ee90d6f7778f01660eec714d128ee224)

[Ping Testing](https://gist.github.com/ParvathiPudi/ea7fc58da454b9c1d15517f84a502ae2)

[Iperf Testing](https://gist.github.com/ParvathiPudi/505d8c6e9de231098215c59b66dee20b)

[1] https://lore.kernel.org/all/20250912104741.528721-1-parvathi@couthit.com/

Thanks and Regards,
Parvathi.

Roger Quadros (3):
  net: ti: icssm-prueth: Adds helper functions to configure and maintain
    FDB
  net: ti: icssm-prueth: Adds switchdev support for icssm_prueth driver
  net: ti: icssm-prueth: Adds support for ICSSM RSTP switch

 drivers/net/ethernet/ti/Makefile              |   2 +-
 drivers/net/ethernet/ti/icssm/icssm_prueth.c  | 554 +++++++++-
 drivers/net/ethernet/ti/icssm/icssm_prueth.h  |  27 +-
 .../ethernet/ti/icssm/icssm_prueth_fdb_tbl.h  |  66 ++
 .../ethernet/ti/icssm/icssm_prueth_switch.c   | 999 ++++++++++++++++++
 .../ethernet/ti/icssm/icssm_prueth_switch.h   |  37 +
 drivers/net/ethernet/ti/icssm/icssm_switch.h  |  82 ++
 .../net/ethernet/ti/icssm/icssm_switchdev.c   | 332 ++++++
 .../net/ethernet/ti/icssm/icssm_switchdev.h   |  13 +
 .../ti/icssm/icssm_vlan_mcast_filter_mmap.h   | 120 +++
 10 files changed, 2209 insertions(+), 23 deletions(-)
 create mode 100644 drivers/net/ethernet/ti/icssm/icssm_prueth_fdb_tbl.h
 create mode 100644 drivers/net/ethernet/ti/icssm/icssm_prueth_switch.c
 create mode 100644 drivers/net/ethernet/ti/icssm/icssm_prueth_switch.h
 create mode 100644 drivers/net/ethernet/ti/icssm/icssm_switchdev.c
 create mode 100644 drivers/net/ethernet/ti/icssm/icssm_switchdev.h
 create mode 100644 drivers/net/ethernet/ti/icssm/icssm_vlan_mcast_filter_mmap.h

-- 
2.43.0


