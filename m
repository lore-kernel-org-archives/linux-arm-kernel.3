Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3790D69104
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 12:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=noavx6PZ/oVwRRxrHaJIk2XW7aikczxx+lo0NYI5Ov4=; b=2x2k/e5NIVPASfN/9kodhjeSAu
	93GItJiPAVCraH2PISkZF6Jf2ac8a9GWLELPE89BW9z1H05E2Sx18OycLinmVp+iReA1fm03lgsMZ
	sNK67MUk8s/j1nO3KcInuoIq8gKgElRC4FVTQV4fNn3kB1BMwppvjScmqh2D212wDFwXirQ4GHyfe
	CraoCspKxUO77PfAXflUIEUs2Ditvir8Si2hSjuxEUoqdL0e557aAQpyetB80ttcFAkP0K3PjLZJ6
	MEbFuWd0W3IgafMPv/i2AxdrYdMRUYWPzAXT1wGjFAnQJcimQ/IanhlfOy+RX1HMqPadPmfH574Cf
	44q0unWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGdff-0000000FU1O-1E92;
	Thu, 28 Nov 2024 12:30:59 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGdef-0000000FTor-2avj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 12:29:58 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4ASCTh2Y1097675
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 28 Nov 2024 06:29:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1732796983;
	bh=noavx6PZ/oVwRRxrHaJIk2XW7aikczxx+lo0NYI5Ov4=;
	h=From:To:CC:Subject:Date;
	b=RoNn7aZw5ab9cUJTmftgh0FvcVUTVfghtjty+pInJMH28Kf7r0kOXvfUXEhmQmHXz
	 CQp6HLQItthpc7NHrBeLCIQrjnN7jVab1A+KZ6HOr1MmtNFaflH0ey8+PfKNrMjAC+
	 rkmIZClLkAo9RGyvMQ0jIn4I3+NNa4/f5UrdrX2o=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4ASCThHi107006;
	Thu, 28 Nov 2024 06:29:43 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 28
 Nov 2024 06:29:42 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 28 Nov 2024 06:29:42 -0600
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4ASCTgVM042252;
	Thu, 28 Nov 2024 06:29:42 -0600
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 4ASCTfA3028118;
	Thu, 28 Nov 2024 06:29:42 -0600
From: Meghana Malladi <m-malladi@ti.com>
To: <lokeshvutla@ti.com>, <vigneshr@ti.com>, <m-malladi@ti.com>,
        <javier.carrasco.cruz@gmail.com>, <diogo.ivo@siemens.com>,
        <jacob.e.keller@intel.com>, <horms@kernel.org>, <pabeni@redhat.com>,
        <kuba@kernel.org>, <edumazet@google.com>, <davem@davemloft.net>,
        <andrew+netdev@lunn.ch>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net v2 0/2] IEP clock module bug fixes
Date: Thu, 28 Nov 2024 17:59:29 +0530
Message-ID: <20241128122931.2494446-1-m-malladi@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_042957_739382_5602E9C4 
X-CRM114-Status: UNSURE (   9.22  )
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

Hi All,
This series has some bug fixes for IEP module needed by PPS and
timesync operations.

Patch 1/2 fixes firmware load sequence to run all the firmwares
when either of the ethernet interfaces is up. Move all the code
common for firmware bringup under common functions.

Patch 2/2 fixes distorted PPS signal when the ethernet interfaces
are brough down and up. This patch also fixes enabling PPS signal
after bringing the interface up, without disabling PPS.

MD Danish Anwar (1):
  net: ti: icssg-prueth: Fix firmware load sequence.

Meghana Malladi (1):
  net: ti: icssg-prueth: Fix clearing of IEP_CMP_CFG registers during
    iep_init

 drivers/net/ethernet/ti/icssg/icss_iep.c     |   9 ++
 drivers/net/ethernet/ti/icssg/icssg_config.c |  45 ++++--
 drivers/net/ethernet/ti/icssg/icssg_config.h |   1 +
 drivers/net/ethernet/ti/icssg/icssg_prueth.c | 150 ++++++++++++-------
 drivers/net/ethernet/ti/icssg/icssg_prueth.h |   3 +
 5 files changed, 142 insertions(+), 66 deletions(-)


base-commit: dfc14664794a4706e0c2186a0c082386e6b14c4d
-- 
2.25.1


