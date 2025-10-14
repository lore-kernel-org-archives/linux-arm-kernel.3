Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 830B4CCD18D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 12:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fwnL1dYUrHPYp56+itQPzN3eL5apeTjNNjkin9I1MtQ=; b=rHIavIRyEsmHWbhk5eK4CF62eX
	Npytct98nJhsNlB17+3NdSRaLbOr1ql5HAJO14ZnoSkH96qkVaQefH3Lznq1kUwd3BjSgEV19uwCn
	6s8IM+RjS7D4QlRVrudiB6tM1rvufPIr0R5ycBT2HHDEdNHPzdR/ce1Yv4diTAJwexCSjqjqXXd+U
	puq/Tg9VaTduaa56U9yY8BkN3wBOT0s8DB1cipOTM8KcxxYI2PuvJ2nCkKrZe/VMiVSpxLcgbMwnD
	xlbdxjcFqStPKOWJiqirJQCWOg0Hk2Zx9VGGJCKjKA8vxNx9fKKWDngNm13c73q8wjEE7Vp6exYJC
	9QiGwoUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8eLX-0000000GHXf-0nEr;
	Tue, 14 Oct 2025 12:41:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8eLV-0000000GHWo-0yHb
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Oct 2025 12:41:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=fwnL1dYUrHPYp56+itQPzN3eL5apeTjNNjkin9I1MtQ=; b=K75oG1P0K3bEE83a/b/R+RGrp8
	4WUxdnNJmdbSvQsFMvbozGL627vfmpT4i78pCAL/Dn7EHA1Qz14YOGG8tpI12QfbYVbl8Kymt0yhd
	8R3MfEHoe00aYbUdV9Qy0lNF7N4mF5koD7hw7NUWaq2NN0oFk0xBE2IHo2YLfFaWcXRoHA+7m3jmw
	mn4HB52MCUFK63GY33XPtzs9ULsMaP7ZFez4u8ooMb7w0/lOwHGu7ekvNW3W2xieJPvAsmvsRQVB7
	gUFZhStf4jYC6m00js0oeF80lumEEmQCeBfkz3/bxJATuOgf9h7sFf7OIrm/oQXSA7SXb+uB7TpUI
	FYxepwiQ==;
Received: from server.couthit.com ([162.240.164.96])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8eLJ-000000059bK-3Roa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 12:41:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=fwnL1dYUrHPYp56+itQPzN3eL5apeTjNNjkin9I1MtQ=; b=bIZ2M2B4k55EN+rjPJlZBM4VpW
	DofdY3sEi9OL/7qV/we68yhbhNbyIFaIXQhJUCUG66mxuznaQX4OZdvGWV7j8gnjACgiS9SGhpBjL
	sgDN51AO0AWZsDiVxJxyktXAQMbVHIu9tJsgbY0X+q1LuQd5lCnD46iHx19oaqVHma5Vamf819oOX
	6pzCw31+wje53//nkhH8cvHSyBbKSGP+bEWR15La2LYBJk9pLkgIg1bEJud+NzVXYxJ3TNEqi9A5E
	50oW/8DgmcU3RPODixdsF3HG08KBiHdLWBzLSbNDQybfupJ9KRfc3fpiUSc8aju/NIR35KEIi/Sff
	8pf0gJtQ==;
Received: from [122.175.9.182] (port=2147 helo=cypher.couthit.local)
	by server.couthit.com with esmtpa (Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1v8eKU-00000005NDu-31l2;
	Tue, 14 Oct 2025 08:40:40 -0400
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
Subject: [PATCH net-next v3 0/3] STP/RSTP SWITCH support for PRU-ICSSM Ethernet driver
Date: Tue, 14 Oct 2025 18:08:58 +0530
Message-ID: <20251014124018.1596900-1-parvathi@couthit.com>
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
X-CRM114-CacheID: sfid-20251014_134130_586257_9EDC83BD 
X-CRM114-Status: GOOD (  13.83  )
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

[Interface up Testing](https://gist.github.com/ParvathiPudi/0c4f86a62efe0a1c092487eb8025fa4f)

[Ping Testing](https://gist.github.com/ParvathiPudi/38940d4df692a3cfb7fed7939c9e2919)

[Iperf Testing](https://gist.github.com/ParvathiPudi/1b156bdeb5d19bb800186ede196678c1)

[1] https://lore.kernel.org/all/20250912104741.528721-1-parvathi@couthit.com/

This is the v3 of the patch series [v1]. This version of the patchset
addresses the comments made on [v2] of the series.

Changes from v2 to v3:

*) Dropped the RFC tag.
*) Addressed MD Danish Anwar comments on patch 3 of the series.
*) Rebased the series on latest net-next.

Changes from v1 to v2 :

*) Added RFC tag as net-next is closed now.
*) Updated the cover letter of the series to generalize and indicate support for
both STP and RSTP along with subject change as per Andrew Lunn's suggestion.
*) Addressed the Andrew Lunn's comments on patch 1 of the series.
*) Rebased the series on latest net-next.

[v1] https://lore.kernel.org/all/20250925141246.3433603-1-parvathi@couthit.com/
[v2] https://lore.kernel.org/all/20251006104908.775891-1-parvathi@couthit.com/

Thanks and Regards,
Parvathi.

Roger Quadros (3):
  net: ti: icssm-prueth: Adds helper functions to configure and maintain
    FDB
  net: ti: icssm-prueth: Adds switchdev support for icssm_prueth driver
  net: ti: icssm-prueth: Adds support for ICSSM RSTP switch

 drivers/net/ethernet/ti/Makefile              |    2 +-
 drivers/net/ethernet/ti/icssm/icssm_prueth.c  |  537 ++++++++-
 drivers/net/ethernet/ti/icssm/icssm_prueth.h  |   27 +-
 .../ethernet/ti/icssm/icssm_prueth_fdb_tbl.h  |   64 ++
 .../ethernet/ti/icssm/icssm_prueth_switch.c   | 1004 +++++++++++++++++
 .../ethernet/ti/icssm/icssm_prueth_switch.h   |   37 +
 drivers/net/ethernet/ti/icssm/icssm_switch.h  |   82 ++
 .../net/ethernet/ti/icssm/icssm_switchdev.c   |  332 ++++++
 .../net/ethernet/ti/icssm/icssm_switchdev.h   |   13 +
 .../ti/icssm/icssm_vlan_mcast_filter_mmap.h   |  120 ++
 10 files changed, 2195 insertions(+), 23 deletions(-)
 create mode 100644 drivers/net/ethernet/ti/icssm/icssm_prueth_fdb_tbl.h
 create mode 100644 drivers/net/ethernet/ti/icssm/icssm_prueth_switch.c
 create mode 100644 drivers/net/ethernet/ti/icssm/icssm_prueth_switch.h
 create mode 100644 drivers/net/ethernet/ti/icssm/icssm_switchdev.c
 create mode 100644 drivers/net/ethernet/ti/icssm/icssm_switchdev.h
 create mode 100644 drivers/net/ethernet/ti/icssm/icssm_vlan_mcast_filter_mmap.h

-- 
2.43.0


