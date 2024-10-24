Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DD6D0BB7A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 10:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XpNsdjNUKmyHDq4lKpIhAEJl7hPe0UBSX8YCXzbXgEI=; b=Wa41e/cvpIVtTw3+IHKaIAUAam
	rFUt5/VHFI0LQ18xiNM1vTMZNfeX3wddV+FRQFcu9n0D+JlTlwFTaAlOo4HPt5+6L2DtkYlwRTyKf
	dD+gMB2VPIlV5CCK7V22thALShe4rPojGC2LtBYzUf+SSCmPLkOHSIZGCDIH0GFA35R8V6ka468FX
	P3OUpFItQtW7MH2Jk/Ba3zaBqJz0TYjG8Cx/nv3ZtEGO7tt7qDL3D6/H7r3xqjr2z4Gi0hsopub09
	z5Fwkml5MF/whLw9Vpr+Pw4N0xcJjd3kRPnFEoCyYe9iScs9w1nuZ0mSXIJHNgKuwQvpA2m1EaVPQ
	vPdsjWaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3vCD-000000005Sf-2eM5;
	Thu, 24 Oct 2024 10:36:01 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3v7c-000000004SO-12dj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 10:31:17 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49OAUweq053976;
	Thu, 24 Oct 2024 05:30:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729765858;
	bh=XpNsdjNUKmyHDq4lKpIhAEJl7hPe0UBSX8YCXzbXgEI=;
	h=From:To:CC:Subject:Date;
	b=Iegj9JI8GV7cVUgkk8VK6oEFNEWjg9qLG1uSjo6cKhbOE8QwkX3hLRyd3GCP4Mtb9
	 emv7tp6kVTVy+dYbOIUtHIOr4tZAFf8lK9XnJhF4kj9N4dKSgZBEPlrAb6OrHojIBA
	 h6lwEWVO5IVhHfW1Ok18OOO7JEUmKVFn115qcL7s=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49OAUw47002389
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Oct 2024 05:30:58 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 24
 Oct 2024 05:30:57 -0500
Received: from fllvsmtp8.itg.ti.com (10.64.41.158) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 24 Oct 2024 05:30:57 -0500
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by fllvsmtp8.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49OAUv5N082154;
	Thu, 24 Oct 2024 05:30:57 -0500
Received: from localhost (danish-tpc.dhcp.ti.com [10.24.69.25])
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 49OAUuPf024586;
	Thu, 24 Oct 2024 05:30:57 -0500
From: MD Danish Anwar <danishanwar@ti.com>
To: <geliang@kernel.org>, <liuhangbin@gmail.com>, <dan.carpenter@linaro.org>,
        <jiri@resnulli.us>, <n.zhandarovich@fintech.ru>,
        <aleksander.lobakin@intel.com>, <lukma@denx.de>, <horms@kernel.org>,
        <jan.kiszka@siemens.com>, <diogo.ivo@siemens.com>, <shuah@kernel.org>,
        <pabeni@redhat.com>, <kuba@kernel.org>, <edumazet@google.com>,
        <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>,
        <m-malladi@ti.com>
Subject: [PATCH net-next v2 0/4] Introduce VLAN support in HSR
Date: Thu, 24 Oct 2024 16:00:52 +0530
Message-ID: <20241024103056.3201071-1-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_033116_401790_47913B93 
X-CRM114-Status: UNSURE (   8.36  )
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

This series adds VLAN support to HSR framework.
This series also adds VLAN support to HSR mode of ICSSG Ethernet driver.

Changes from v1 to v2:
*) Added patch 4/4 to add test script related to VLAN in HSR as asked by
Lukasz Majewski <lukma@denx.de>

v1 https://lore.kernel.org/all/20241004074715.791191-1-danishanwar@ti.com/

MD Danish Anwar (1):
  selftests: hsr: Add test for VLAN

Murali Karicheri (1):
  net: hsr: Add VLAN CTAG filter support

Ravi Gunasekaran (1):
  net: ti: icssg-prueth: Add VLAN support for HSR mode

WingMan Kwok (1):
  net: hsr: Add VLAN support

 drivers/net/ethernet/ti/icssg/icssg_prueth.c | 45 +++++++++++-
 net/hsr/hsr_device.c                         | 76 ++++++++++++++++++--
 net/hsr/hsr_forward.c                        | 19 +++--
 tools/testing/selftests/net/hsr/config       |  1 +
 tools/testing/selftests/net/hsr/hsr_ping.sh  | 63 +++++++++++++++-
 5 files changed, 191 insertions(+), 13 deletions(-)


base-commit: 1bf70e6c3a5346966c25e0a1ff492945b25d3f80
-- 
2.34.1


