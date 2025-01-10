Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6429E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 08:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ksMxIna2SYfvVoK6NlK93Su5ZIo00BAOeJb0FMLTUt0=; b=NomqSFe02/j8uW3i2IeE/AQ/R1
	JHaAHtge6R26f7OVpm7r03ZzT9QpalSHeZC8GXl4ODk3RuJPHQY3wQ8DBx/OInJjOKiLw118J6f84
	E/OUViDEbMmtlr7a8kfNFvAZiJOjRfS48yK+g0457aNP8vA1kROWYZBka54LdM6k9b+p1aEZC8d5L
	GOrG8V2De39Vy+IzS+jOA0TMxBsBUsJGiZ2xseTtWS0q5CpvH2G+DvIrFqRWMHbSlM5O92sApyDWm
	iMXA+cAxxGiwdTFtqXakSAqWlgzZzYpLWYTtbxTNsNmPeqn0aAI0iHEIQO9ahGmsEkbJ+AjPINDx+
	BNvwXk+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWAQk-0000000EXUZ-1zuf;
	Fri, 10 Jan 2025 08:31:46 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWAOK-0000000EWqt-1sye
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 08:29:17 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50A8T0853390410
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 10 Jan 2025 02:29:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736497740;
	bh=ksMxIna2SYfvVoK6NlK93Su5ZIo00BAOeJb0FMLTUt0=;
	h=From:To:CC:Subject:Date;
	b=MjWBKejDOVQI7xUmJ3Ww28SS1uSe96O+/URvW/VseL39W4IeUgCnE+bYI3rN6B2Z/
	 5LaRAgoW7YNjHiB03FBSYH4scRoxsVio1j2JgsQYRaeUHlE7rWoqdNdmd2TkuL9wk8
	 9j9Tf3a/CMXyI292+PgRi4JRR90hV3bGYVw8dFmU=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50A8T0li023404;
	Fri, 10 Jan 2025 02:29:00 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 10
 Jan 2025 02:28:59 -0600
Received: from fllvsmtp8.itg.ti.com (10.64.41.158) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 10 Jan 2025 02:28:59 -0600
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by fllvsmtp8.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50A8Sx4Y012643;
	Fri, 10 Jan 2025 02:28:59 -0600
Received: from localhost (danish-tpc.dhcp.ti.com [10.24.69.25])
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 50A8SvEo021265;
	Fri, 10 Jan 2025 02:28:57 -0600
From: MD Danish Anwar <danishanwar@ti.com>
To: Jeongjun Park <aha310510@gmail.com>,
        Alexander Lobakin
	<aleksander.lobakin@intel.com>,
        Lukasz Majewski <lukma@denx.de>, Meghana
 Malladi <m-malladi@ti.com>,
        Diogo Ivo <diogo.ivo@siemens.com>, Simon Horman
	<horms@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Eric Dumazet <edumazet@google.com>,
        "David S. Miller"
	<davem@davemloft.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        Roger Quadros
	<rogerq@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>, <danishanwar@ti.com>,
        Michal Swiatkowski
	<michal.swiatkowski@linux.intel.com>,
        Larysa Zaremba
	<larysa.zaremba@intel.com>
Subject: [PATCH net-next v4 0/4] Add Multicast Filtering support for VLAN interface
Date: Fri, 10 Jan 2025 13:58:48 +0530
Message-ID: <20250110082852.3899027-1-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_002916_574388_E763C764 
X-CRM114-Status: GOOD (  15.73  )
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

This series adds Multicast filtering support for VLAN interfaces in dual
EMAC and HSR offload mode for ICSSG driver.

Patch 1/4 - Adds support for VLAN in dual EMAC mode
Patch 2/4 - Adds MC filtering support for VLAN in dual EMAC mode
Patch 3/4 - Create and export hsr_get_port_ndev() in hsr_device.c
Patch 4/4 - Adds MC filtering support for VLAN in HSR mode

Changes from v3 to v4:
*) Added RB tag of Roger Quadros <rogerq@kernel.org> to patch 1/4 and addressed
his comment on the same patch.
*) Created a separate patch (Patch 4) for hsr core changes in Patch [3] as
suggested by Roger Quadros <rogerq@kernel.org>.
*) Added details on why __hw_addr_sync_multiple() is used and exported instead
of using __hw_addr_sync() in the commit message of Patch 2/4 as suggested by
Paolo Abeni <pabeni@redhat.com>
*) Added details on why __hw_addr_sync_dev() is used on the local list instead
of using __dev_mc_sync() on the vdev, in the commit message of Patch 2/4 as
suggested by Paolo Abeni <pabeni@redhat.com>

Changes from v2 to v3:
*) Rebased on latest net-next and re-spun the series as net-next is now open.
*) No functional change.

Changes from v1 to v2:
*) Changed netdev_err to netdev_dbg in emac_ndo_vlan_rx_del_vid() in patch 1/3
as suggested by Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
*) Dropped patch [1] from previous version as the patch created issue [2].
Will send out a separate patch to set HSR=m in arch/arm64/configs/defconfig.
Once the defconfig patch gets merged, I will add `depends on HSR` in Kconfig
for TI_ICSSG_PRUETH as suggested by Larysa Zaremba <larysa.zaremba@intel.com>

[1] https://lore.kernel.org/all/20241216100044.577489-2-danishanwar@ti.com/
[2] https://lore.kernel.org/all/202412210336.BmgcX3Td-lkp@intel.com/#t
[3] https://lore.kernel.org/all/31bb8a3e-5a1c-4c94-8c33-c0dfd6d643fb@kernel.org/
v1 https://lore.kernel.org/all/20241216100044.577489-1-danishanwar@ti.com/
v2 https://lore.kernel.org/all/20241223092557.2077526-1-danishanwar@ti.com/
v3 https://lore.kernel.org/all/20250103092033.1533374-1-danishanwar@ti.com/


MD Danish Anwar (4):
  net: ti: icssg-prueth: Add VLAN support in EMAC mode
  net: ti: icssg-prueth: Add Multicast Filtering support for VLAN in MAC
    mode
  net: hsr: Create and export hsr_get_port_ndev()
  net: ti: icssg-prueth: Add Support for Multicast filtering with VLAN
    in HSR mode

 drivers/net/ethernet/ti/icssg/icssg_prueth.c | 175 ++++++++++++++-----
 drivers/net/ethernet/ti/icssg/icssg_prueth.h |   8 +
 include/linux/if_hsr.h                       |  17 ++
 include/linux/netdevice.h                    |   3 +
 net/core/dev_addr_lists.c                    |   7 +-
 net/hsr/hsr_device.c                         |  13 ++
 net/hsr/hsr_main.h                           |   9 -
 7 files changed, 173 insertions(+), 59 deletions(-)


base-commit: 25cc469d6d344f5772e9fb6a5cf9d82a690afe68
-- 
2.34.1


