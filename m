Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8983AD3E78C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 09:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iLrRXXFqcwItg0lw31N6XVp0ETawlclPWtIL3rnRHeo=; b=hxXW0KIk8Corr6BscOjgEtUC+F
	kzYd1tyz0aw/cmeGPfxBWb8Vupq2sbHyP6738pY345LPZaQIVgY1MTbT99KO801m44ZT8KND2Qcwx
	jG1/n1Fv8tnjPL6yXKKz34DacHq9/fKVYTdcQ5ahM1ALxn2saZXwxr5yGBwVvcqeY18eW1KXjxS+d
	UE1Ri35yK430ZJJFELQCzOkTzVgOgFzkufIRD+fAN0FL3HRbqHvaWFl5s4U5ro95WI57sLbiF0KrG
	z251Rz7XPi53MglV8HCdPbIv4Fw7yhPIQudYyEkEnhwNEKuK/isZk9PEp/X9NQyQTTGY+kI7buMJs
	CmT/2fLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8ccQ-00000002bxu-0kDz;
	Wed, 06 Nov 2024 09:46:30 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8cAO-00000002TIM-3dHE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 09:17:34 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A69HD7B035681;
	Wed, 6 Nov 2024 03:17:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730884633;
	bh=iLrRXXFqcwItg0lw31N6XVp0ETawlclPWtIL3rnRHeo=;
	h=From:To:CC:Subject:Date;
	b=KcYzHBOzUEy/w4upgPzx/Y9kvkZgH+xmTlyNeAxaFzhQWQKVOHex6fmTAfCZPlPfL
	 TJHMWSpMtyCxZW6xyLYZ0bIFCM8qDJmEmp0+rfctHjuTutbZMKzH4ecJmsezU6d/ju
	 4+Ck0t5e32x98gspJ4Xg2RMmnHv0cmedvirsi6EI=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A69HDIb116843
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 6 Nov 2024 03:17:13 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 6
 Nov 2024 03:17:13 -0600
Received: from fllvsmtp7.itg.ti.com (10.64.40.31) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 6 Nov 2024 03:17:13 -0600
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by fllvsmtp7.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A69HDus081192;
	Wed, 6 Nov 2024 03:17:13 -0600
Received: from localhost (danish-tpc.dhcp.ti.com [10.24.69.25])
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 4A69HBXA020759;
	Wed, 6 Nov 2024 03:17:12 -0600
From: MD Danish Anwar <danishanwar@ti.com>
To: <geliang@kernel.org>, <liuhangbin@gmail.com>, <jiri@resnulli.us>,
        <w-kwok2@ti.com>, <aleksander.lobakin@intel.com>, <lukma@denx.de>,
        <jan.kiszka@siemens.com>, <diogo.ivo@siemens.com>, <shuah@kernel.org>,
        <horms@kernel.org>, <pabeni@redhat.com>, <kuba@kernel.org>,
        <edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net-next v3 0/4] Introduce VLAN support in HSR
Date: Wed, 6 Nov 2024 14:47:06 +0530
Message-ID: <20241106091710.3308519-1-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_011733_017940_BA8B6AB6 
X-CRM114-Status: GOOD (  10.90  )
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

Changes from v2 to v3:
*) Modified hsr_ndo_vlan_rx_add_vid() to handle arbitrary HSR_PT_SLAVE_A,
HSR_PT_SLAVE_B order and skip INTERLINK port in patch 2/4 as suggested by
Paolo Abeni <pabeni@redhat.com>
*) Removed handling of HSR_PT_MASTER in hsr_ndo_vlan_rx_kill_vid() as MASTER
and INTERLINK port will be ignored anyway in the default switch case as
suggested by Paolo Abeni <pabeni@redhat.com>
*) Modified the selftest in patch 4/4 to use vlan by default. The test will
check the exposed feature `vlan-challenged` and if vlan is not supported, skip
the vlan test as suggested by Paolo Abeni <pabeni@redhat.com>. Test logs can be
found at [1]

Changes from v1 to v2:
*) Added patch 4/4 to add test script related to VLAN in HSR as asked by
Lukasz Majewski <lukma@denx.de>

[1] https://gist.githubusercontent.com/danish-ti/d309f92c640134ccc4f2c0c442de5be1/raw/9cfb5f8bd12b374ae591f4bd9ba3e91ae509ed4f/hsr_vlan_logs
v1 https://lore.kernel.org/all/20241004074715.791191-1-danishanwar@ti.com/
v2 https://lore.kernel.org/all/20241024103056.3201071-1-danishanwar@ti.com/

MD Danish Anwar (1):
  selftests: hsr: Add test for VLAN

Murali Karicheri (1):
  net: hsr: Add VLAN CTAG filter support

Ravi Gunasekaran (1):
  net: ti: icssg-prueth: Add VLAN support for HSR mode

WingMan Kwok (1):
  net: hsr: Add VLAN support

 drivers/net/ethernet/ti/icssg/icssg_prueth.c | 45 ++++++++-
 net/hsr/hsr_device.c                         | 85 +++++++++++++++--
 net/hsr/hsr_forward.c                        | 19 +++-
 tools/testing/selftests/net/hsr/config       |  1 +
 tools/testing/selftests/net/hsr/hsr_ping.sh  | 98 ++++++++++++++++++++
 5 files changed, 236 insertions(+), 12 deletions(-)


base-commit: a84e8c05f58305dfa808bc5465c5175c29d7c9b6
-- 
2.34.1


