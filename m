Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E54FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 10:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gA61Qgd412YVnbWRnsA8Xz+iZMRyWVXVVtbVH2xqtkA=; b=IKdwCEOkL+odWlQvB8fPZO4eYo
	1hcn6wOVB79Uhlyytp007AHe7o1AKztL6zbTFucsyGKZAVQnt28hiZNh+LIks00XyePzfnxImMmEw
	QP6bgB9eqD7GNxxkyR3BGLWyJJZxxNXS9UX/Dp58eknJrNAtComzIBPLavUMkccL3glFf9bqGIjw7
	kCikBu5o2HVbGICvbYGSnVypNxstTW7WIzkEpiPI/fN0nRp6rjIOX/130+MPErAHpvbu8fnHaIUJW
	N07aiwQ5ZfVYZr3imBM0/G5wkUIb+W86w68uQpfonNiUprh1Xbj3tZxey7AvSEVrDeJLzAXjLbeiA
	azRCgFYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTesw-0000000CiyM-2VpV;
	Fri, 03 Jan 2025 10:26:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTdre-0000000Caaq-2Pf5
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 03 Jan 2025 09:21:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=gA61Qgd412YVnbWRnsA8Xz+iZMRyWVXVVtbVH2xqtkA=; b=G+sLvKH99lAubR7nOW3P/RkUiP
	ZceEqU9XTHLgbbOkZ2ILliHoQ9a4AQedn5pjRL//EeUp6jo83dSjJeeQlxwI/jUP6yMebwCyg0+HO
	GqPXb1qzrNZeDm5LRSDxmT/ovXEtsWFQaZ9v2H/XIksefK3V8CmEqhZ5faVpNGIC42hvJUWRgyN4E
	RedhgMknRGkCxaj2nGUM8hzsPdOhon5eVqV7UWCDUYmewy6AcBBjLeI0aogtqfHDChyX9TYhNHZHJ
	X+hyDdFvmZIEJ8RU8Qj1It/rSQJflbATe1fpScnuwGslwrCtpKYLcXpsDGkwFA3IoHZkZKYSwFoe8
	Y24gS95A==;
Received: from [198.47.19.246] (helo=fllvem-ot04.ext.ti.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTdra-00000008LTO-3A4r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 09:21:05 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5039Kc6H2301473
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 3 Jan 2025 03:20:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735896038;
	bh=gA61Qgd412YVnbWRnsA8Xz+iZMRyWVXVVtbVH2xqtkA=;
	h=From:To:CC:Subject:Date;
	b=KlcVJOAaKpfdGiGRYON3Cgv1SSVJLX/XGLJodR2ax+zpccgD2cIm6DJ4Mxxhhgpk/
	 BIA+Td8iZAVcOryDUQFSfpNN+Q6Zpa4dd9rrnW+eKLmvttCUKDqGx/GlIoIUOmZ684
	 GCaCO8J9RyKa77W3eJYUoYZKBbj7vK9mjaT+9aig=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5039KcwK004083
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Jan 2025 03:20:38 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Jan 2025 03:20:38 -0600
Received: from fllvsmtp7.itg.ti.com (10.64.40.31) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Jan 2025 03:20:37 -0600
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by fllvsmtp7.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5039KcAL069359;
	Fri, 3 Jan 2025 03:20:38 -0600
Received: from localhost (danish-tpc.dhcp.ti.com [10.24.69.25])
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 5039Kard016890;
	Fri, 3 Jan 2025 03:20:37 -0600
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
Subject: [PATCH net-next v3 0/3] Add Multicast Filtering support for VLAN interface
Date: Fri, 3 Jan 2025 14:50:30 +0530
Message-ID: <20250103092033.1533374-1-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_092103_502559_1B752CED 
X-CRM114-Status: GOOD (  12.75  )
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
v1 https://lore.kernel.org/all/20241216100044.577489-1-danishanwar@ti.com/
v2 https://lore.kernel.org/all/20241223092557.2077526-1-danishanwar@ti.com/

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


base-commit: 94c16fd4df9089931f674fb9aaec41ea20b0fd7a
-- 
2.34.1


