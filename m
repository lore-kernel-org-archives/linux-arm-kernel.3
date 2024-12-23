Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4FCAE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 09:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9bpx0lCCmv5pmkfeEr0posXIsEvx66W2A+erLgVfVs8=; b=G1mlig75XkhMnh+4qRaqpXor/T
	WIupn9SG8TeI8nYiR/5MJmIyQtkpgEDWq5/Q+Y9p10HbVFe64ZWfSbWskUGkZbjVf/0sK+juOeDOu
	b3TC0cQ9PFxdmXATt7R/n+jxBorP9sCahSJN4wtH8W5ZnkvIsaJaiYUdO938btDNY9P67LW+fOgfm
	tJRImjeBHkO2L/SkZ0GRahuNnjC81JkqcdoW20aVq84SdW3sUo2vTi7f6hms3wkDtpL3nxQHfBzAw
	CQGUbolLa0iauw0NZCgyJDAnQg5bzLUrf4gJtH2DpB77wDM5QTVUyo/JSeP5Qs7r7HKbftJbU7H+J
	xHAVkh9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPek1-00000009eQH-14ly;
	Mon, 23 Dec 2024 09:28:45 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPehh-00000009e74-0gpO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 09:26:22 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BN9Q1ue102780;
	Mon, 23 Dec 2024 03:26:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734945961;
	bh=9bpx0lCCmv5pmkfeEr0posXIsEvx66W2A+erLgVfVs8=;
	h=From:To:CC:Subject:Date;
	b=OyXSi7ZLnNnJ/ooqUOaDgBg7tqDnHc3fX7pJptEXxCaRSlDb3AH6Ii36cgIMCXbDE
	 xrVPGMaQ+b+vkVPC3LPljCJunH3YwmMw/tq49YOOOZiNSchIz2cLgFNn0gfh1vd25q
	 5Z9anWQ3XjQZnh0tM9dKpZfIV3iAtpVJXXngMvGE=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BN9Q1Db013408
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Dec 2024 03:26:01 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 23
 Dec 2024 03:26:00 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 23 Dec 2024 03:26:00 -0600
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BN9Q0o1127786;
	Mon, 23 Dec 2024 03:26:00 -0600
Received: from localhost (danish-tpc.dhcp.ti.com [10.24.69.25])
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 4BN9PxKk006688;
	Mon, 23 Dec 2024 03:25:59 -0600
From: MD Danish Anwar <danishanwar@ti.com>
To: <wojciech.drewek@intel.com>, <n.zhandarovich@fintech.ru>,
        <aleksander.lobakin@intel.com>, <lukma@denx.de>, <m-malladi@ti.com>,
        <diogo.ivo@siemens.com>, <horms@kernel.org>, <pabeni@redhat.com>,
        <kuba@kernel.org>, <edumazet@google.com>, <davem@davemloft.net>,
        <andrew+netdev@lunn.ch>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>,
        Larysa Zaremba <larysa.zaremba@intel.com>,
        Michal Swiatkowski
	<michal.swiatkowski@linux.intel.com>
Subject: [PATCH net-next v2 0/3] Add Multicast Filtering support for VLAN interface
Date: Mon, 23 Dec 2024 14:55:54 +0530
Message-ID: <20241223092557.2077526-1-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_012621_301194_DFDEB028 
X-CRM114-Status: GOOD (  11.03  )
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

Patch 1/3 - Adds support for VLAN in dual EMAC mode
Patch 2/3 - Adds MC filtering support for VLAN in dual EMAC mode
Patch 3/3 - Adds MC filtering support for VLAN in HSR mode

Changes from v1 to v2:
*) Changed netdev_err to netdev_dbg in emac_ndo_vlan_rx_del_vid() in patch 1/3
as suggested by Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
*) Dropped patch [1] from previous version as the patch created issue [2].
Will send out a separate patch to set HSR=m in arch/arm64/configs/defconfig.
Once the defconfig patch gets merged, I will add `depends on HSR` in Kconfig
for TI_ICSSG_PRUETH as suggested by Larysa Zaremba <larysa.zaremba@intel.com>

[1] https://lore.kernel.org/all/20241216100044.577489-2-danishanwar@ti.com/
[2] https://lore.kernel.org/all/202412210336.BmgcX3Td-lkp@intel.com/#t
v1 https://lore.kernel.org/all/20241216100044.577489-1-danishanwar@ti.com/

MD Danish Anwar (3):
  net: ti: icssg-prueth: Add VLAN support in EMAC mode
  net: ti: icssg-prueth: Add Multicast Filtering support for VLAN in MAC
    mode
  net: ti: icssg-prueth: Add Support for Multicast filtering with VLAN
    in HSR mode

 drivers/net/ethernet/ti/icssg/icssg_prueth.c | 175 ++++++++++++++-----
 drivers/net/ethernet/ti/icssg/icssg_prueth.h |   8 +
 include/linux/if_hsr.h                       |  18 ++
 include/linux/netdevice.h                    |   3 +
 net/core/dev_addr_lists.c                    |   7 +-
 net/hsr/hsr_device.c                         |  13 ++
 net/hsr/hsr_main.h                           |   9 -
 7 files changed, 174 insertions(+), 59 deletions(-)


base-commit: ae418e95dd930df6543107521c5ce55e379a9530
-- 
2.34.1


