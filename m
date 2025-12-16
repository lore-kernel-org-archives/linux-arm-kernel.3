Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDEBD5E14E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 13:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uT6PB659ANABlLTv6sj+2I0b5PQnINAqunyYacWt+Uo=; b=hwwbcwERBaN900zWnUy7nCrXI8
	wvJyyOZIECVQPwJbZ5emG+fQFsF15CnHHFckBrRHyA59R0M2FCYKgXU4lkDpE1+JLUmJM1YjjChmV
	AQjFUD6m9jEp9YK0G4b2E9TLBp5Yd0VIqh+CgjLrryaSZ7ZhoS+jlT+uWlWC+oROy0haNcK2SYrte
	Hd+TRdoEBo1stnK5dHWemd+GF2cxjRlN0QD3FB6cYRlcEsTYtvRWWCO6oahGKBXQzM52uLwu5R0AJ
	0LZUAka2o76ijG30/FAfOfwpEb1fUD/UFcMTxfUpX1rCAW+vV721Bi3eGwOEQc8e13DmQxjM+pfFR
	G0myQRXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVV5n-00000005FWE-0cEJ;
	Tue, 16 Dec 2025 13:27:55 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVV5k-00000005FT1-1Dd8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 13:27:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=uT6PB659ANABlLTv6sj+2I0b5PQnINAqunyYacWt+Uo=; b=dPrtkwKRd5MmhuSRxiMfCqlRxx
	HstCCiiw4xtioxOOzgwe5NvnwJTm9cabwnDU8oDr/OixpphI30PsFQ62h89fLWYJ89c0f0SU6P//a
	B8Gr/D3B8DN+VASdIhb+oDBE89LjUHLyGM6bjR4LzJCORUygPMNkNGtjIBS4V7b9hyGxaVIbbkb7M
	O/K7rA4+vyARNFY54HiGukWrNtYYYlL0LKlI6a/wV0wPPAYLN8VcCXhjc1fav19VYBOzGK5O6yWho
	HbFAIIzEoBxoYrddDK2CHRWh6m7NODdTlaBV5Eyp2U32u29OpEhdOvV3gmD5Kpt5wn3u3SYRuuxy8
	LBdkTfeg==;
Received: from [122.175.9.182] (port=23594 helo=cypher.couthit.local)
	by server.couthit.com with esmtpa (Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1vVV52-0000000ENIL-3q2s;
	Tue, 16 Dec 2025 08:27:09 -0500
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
	alok.a.tiwari@oracle.com,
	horms@kernel.org,
	pratheesh@ti.com,
	j-rameshbabu@ti.com,
	vigneshr@ti.com,
	praneeth@ti.com,
	srk@ti.com,
	rogerq@ti.com,
	krishna@couthit.com,
	mohan@couthit.com
Subject: [RFC PATCH net-next v10 0/3] STP/RSTP SWITCH support for PRU-ICSSM Ethernet driver
Date: Tue, 16 Dec 2025 18:52:57 +0530
Message-ID: <20251216132641.1313026-1-parvathi@couthit.com>
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
X-CRM114-CacheID: sfid-20251216_052752_394414_27504898 
X-CRM114-Status: GOOD (  15.63  )
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

This patch series enhances the PRU-ICSSM Ethernet driver to support bridge
(STP/RSTP) SWITCH mode, which has been implemented using the "switchdev"
framework and interacts with the "mstp daemon" for STP and RSTP management
in userspace.

When the  SWITCH mode is enabled, forwarding of Ethernet packets using
either the traditional store-and-forward mechanism or via cut-through is
offloaded to the two PRU based Ethernet interfaces available within the
ICSSM. The firmware running on the PRU inspects the bridge port states and
performs necessary checks before forwarding a packet. This improves the
overall system performance and significantly reduces the packet forwarding
latency.

Protocol switching from Dual-EMAC to bridge (STP/RSTP) SWITCH mode can be
done as follows.

Assuming eth2 and eth3 are the two physical ports of the ICSS2 instance:

>> brctl addbr br0
>> ip maddr add 01:80:c2:00:00:00 dev br0
>> ip link set dev br0 address $(cat /sys/class/net/eth2/address)
>> brctl addif br0 eth2
>> brctl addif br0 eth3
>> mstpd
>> brctl stp br0 on
# STP to RSTP mode
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

[Interface up Testing](https://gist.github.com/ParvathiPudi/e95f6b38fda92feeb899ec5f8d4394f8)

[Ping Testing](https://gist.github.com/ParvathiPudi/4f7faf9f1fa82687e8d9c43f53a9e212)

[Iperf Testing](https://gist.github.com/ParvathiPudi/efc9e667a2a08589657ea3a9922c6c6c)

[1] https://lore.kernel.org/all/20250912104741.528721-1-parvathi@couthit.com/

This is the v10 of the patch series [v1]. This version of the patchset
addresses the comments made on [v9] of the series.

Changes from v9 to v10:

*) Added RFC tag as net-next is closed now.
*) Addressed applicable AI review warnings, including clearing the host lock before returning on
timeout, avoiding a race on hw_bridge_dev and adding a conditional check to avoid null
pointer dereferences.
*) Rebased the series on latest net-next.

Changes from v8 to v9:

*) Added RFC tag as net-next is closed now.
*) Addressed  Jakub Kicinski comments on patch 1 and 2 of the series.
*) Rebased the series on latest net-next.

Changes from v7 to v8:

*) Modified dev_hold/dev_put reference to netdev_hold/netdev_put in patch 2 of the series.
*) Rebased the series on latest net-next.

Changes from v6 to v7:

*) Addressed Jakub Kicinski comments on patch 2 of the series.
*) Rebased the series on latest net-next.

Changes from v5 to v6:

*) Addressed Simon Horman comments on patch 1, 2 and 3 of the series.
*) Rebased the series on latest net-next.

Changes from v4 to v5:

*) Addressed ALOK TIWARI comments on patch 1 of the series.
*) Rebased the series on latest net-next.

Changes from v3 to v4:

*) Addressed Andrew Lunn comments on patch 1 and 2 of the series.
*) Rebased the series on latest net-next.

Changes from v2 to v3:

*) Dropped the RFC tag.
*) Addressed  MD Danish Anwar comments on patch 3 of the series.
*) Rebased the series on latest net-next.

Changes from v1 to v2 :

*) Added RFC tag as net-next is closed now.
*) Updated the cover letter of the series to generalize and indicate support for
both STP and RSTP along with subject change as per Andrew Lunn's suggestion.
*) Addressed the Andrew Lunn's comments on patch 1 of the series.
*) Rebased the series on latest net-next.

[v1] https://lore.kernel.org/all/20250925141246.3433603-1-parvathi@couthit.com/
[v2] https://lore.kernel.org/all/20251006104908.775891-1-parvathi@couthit.com/
[v3] https://lore.kernel.org/all/20251014124018.1596900-1-parvathi@couthit.com/
[v4] https://lore.kernel.org/all/20251110125539.31052-1-parvathi@couthit.com/
[v5] https://lore.kernel.org/all/20251113101229.675141-1-parvathi@couthit.com/
[v6] https://lore.kernel.org/all/20251124135800.2219431-1-parvathi@couthit.com/
[v7] https://lore.kernel.org/all/20251126124602.2624264-1-parvathi@couthit.com/
[v8] https://lore.kernel.org/all/20251126163056.2697668-1-parvathi@couthit.com/
[v9] https://lore.kernel.org/all/20251205123146.462397-1-parvathi@couthit.com/

Thanks and Regards,
Parvathi.

Roger Quadros (3):
  net: ti: icssm-prueth: Add helper functions to configure and maintain
    FDB
  net: ti: icssm-prueth: Add switchdev support for icssm_prueth driver
  net: ti: icssm-prueth: Add support for ICSSM RSTP switch

 drivers/net/ethernet/ti/Makefile              |    2 +-
 drivers/net/ethernet/ti/icssm/icssm_prueth.c  |  529 +++++++-
 drivers/net/ethernet/ti/icssm/icssm_prueth.h  |   20 +-
 .../ethernet/ti/icssm/icssm_prueth_fdb_tbl.h  |   76 ++
 .../ethernet/ti/icssm/icssm_prueth_switch.c   | 1065 +++++++++++++++++
 .../ethernet/ti/icssm/icssm_prueth_switch.h   |   37 +
 drivers/net/ethernet/ti/icssm/icssm_switch.h  |  103 ++
 .../net/ethernet/ti/icssm/icssm_switchdev.c   |  333 ++++++
 .../net/ethernet/ti/icssm/icssm_switchdev.h   |   13 +
 .../ti/icssm/icssm_vlan_mcast_filter_mmap.h   |  120 ++
 10 files changed, 2275 insertions(+), 23 deletions(-)
 create mode 100644 drivers/net/ethernet/ti/icssm/icssm_prueth_fdb_tbl.h
 create mode 100644 drivers/net/ethernet/ti/icssm/icssm_prueth_switch.c
 create mode 100644 drivers/net/ethernet/ti/icssm/icssm_prueth_switch.h
 create mode 100644 drivers/net/ethernet/ti/icssm/icssm_switchdev.c
 create mode 100644 drivers/net/ethernet/ti/icssm/icssm_switchdev.h
 create mode 100644 drivers/net/ethernet/ti/icssm/icssm_vlan_mcast_filter_mmap.h

-- 
2.43.0


