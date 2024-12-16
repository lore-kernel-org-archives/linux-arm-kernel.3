Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C6BE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 10:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FM+sFYYI3tmGu4yC2JB04a6Mv0fiDAJYTqw7+y8rEa8=; b=1JJmEASq9XZtXBw7+KJxeWN/1v
	sxU3VVuvy3FWpxiOP5+cpHZrhQi7Fo3bNAFWyZgdTmcGlb/Qus8hUAAX5M6suXnOdHWAx91JzGVRk
	Cz5g5GSsrXqAmS54EnEFKdAq7Kps5IjJpeQpH9tJG8T9KfeVhXrgzz2DsbZtF+glc12JTI42YRZ+q
	HI0gZfUbgt5GcacqiGP1yF4XSEsYa5gwpdU8UhpfckdVsQq3JBNrv2MQB8aVjuYQOFZRIEXDOvRtF
	MOEpMrz/PN4sEqdWc1nTjLrtLsKdHiCcknxRBKtHh/gx8zfB2z5sfzuax66E+vP3vyZC6BnpTT9om
	mUHBYVrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN7vi-00000009cal-3gkO;
	Mon, 16 Dec 2024 10:02:22 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN7uc-00000009cMy-43lb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 10:01:16 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BGA0ttb3459834
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Dec 2024 04:00:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734343256;
	bh=FM+sFYYI3tmGu4yC2JB04a6Mv0fiDAJYTqw7+y8rEa8=;
	h=From:To:CC:Subject:Date;
	b=JpVUHUmncbTgTioMByyUBFTroeUoXkgK47p+wDCIeY8w/TuGWw08H00sZ7q83Frxa
	 4lhI0Zfl3wjSii8tA5FecphH2lVQL5FqvKGXKPO1Ji91alH4Uh8QMbqNI+WWwK/Hsh
	 W+di/8d4l/jkz0xDh0MxctI9mMBKBOAlqyA9ObnY=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BGA0tXN058748
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Dec 2024 04:00:55 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 16
 Dec 2024 04:00:55 -0600
Received: from fllvsmtp7.itg.ti.com (10.64.40.31) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 16 Dec 2024 04:00:55 -0600
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by fllvsmtp7.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BGA0tSl079558;
	Mon, 16 Dec 2024 04:00:55 -0600
Received: from localhost (danish-tpc.dhcp.ti.com [10.24.69.25])
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 4BGA0sde000609;
	Mon, 16 Dec 2024 04:00:55 -0600
From: MD Danish Anwar <danishanwar@ti.com>
To: <aleksander.lobakin@intel.com>, <lukma@denx.de>, <m-malladi@ti.com>,
        <diogo.ivo@siemens.com>, <rdunlap@infradead.org>,
        <schnelle@linux.ibm.com>, <vladimir.oltean@nxp.com>,
        <horms@kernel.org>, <rogerq@kernel.org>, <danishanwar@ti.com>,
        <pabeni@redhat.com>, <kuba@kernel.org>, <edumazet@google.com>,
        <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <srk@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH net-next 0/4] Add Multicast Filtering support for VLAN interface
Date: Mon, 16 Dec 2024 15:30:40 +0530
Message-ID: <20241216100044.577489-1-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_020115_085199_55544C62 
X-CRM114-Status: UNSURE (   9.86  )
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

This series adds Multicast filtering support for VLAN interfaces in dual
EMAC and HSR offload mode for ICSSG driver.

Patch 1/4 - Selects symbol HSR for TI_ICSSG_PRUETH. Changes NET_SWITCHDEV
from 'depends on' to 'select' as keeping it as 'depends on' results in
below error

  *** Default configuration is based on 'defconfig'
  error: recursive dependency detected!
    symbol NET_DSA depends on HSR
    symbol HSR is selected by TI_ICSSG_PRUETH
    symbol TI_ICSSG_PRUETH depends on NET_SWITCHDEV
    symbol NET_SWITCHDEV is selected by NET_DSA
  For a resolution refer to Documentation/kbuild/kconfig-language.rst
  subsection "Kconfig recursive dependency limitations"

Patch 2/4 - Adds support for VLAN in dual EMAC mode
Patch 3/4 - Adds MC filtering support for VLAN in dual EMAC mode
Patch 4/4 - Adds MC filtering support for VLAN in HSR mode

MD Danish Anwar (4):
  net: ti: Kconfig: Select HSR for ICSSG Driver
  net: ti: icssg-prueth: Add VLAN support in EMAC mode
  net: ti: icssg-prueth: Add Multicast Filtering support for VLAN in MAC
    mode
  net: ti: icssg-prueth: Add Support for Multicast filtering with VLAN
    in HSR mode

 drivers/net/ethernet/ti/Kconfig              |   3 +-
 drivers/net/ethernet/ti/icssg/icssg_prueth.c | 170 ++++++++++++++-----
 drivers/net/ethernet/ti/icssg/icssg_prueth.h |   8 +
 include/linux/if_hsr.h                       |  16 ++
 include/linux/netdevice.h                    |   3 +
 net/core/dev_addr_lists.c                    |   7 +-
 net/hsr/hsr_device.c                         |  12 ++
 net/hsr/hsr_main.h                           |   9 -
 8 files changed, 168 insertions(+), 60 deletions(-)


base-commit: 92c932b9946c1e082406aa0515916adb3e662e24
-- 
2.34.1


