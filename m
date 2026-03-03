Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B5B3E67A9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 14:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aXnceo8fp+RQdhLmjh0H1Xk2pOs+LurT8zcbqeV6/qE=; b=jN9wJ5Yqci1rPeTPKGosB3W8w7
	R1Yo36HlRRF3W/5c8F10q3RzOPUWPWVojDtslRkKUxUyG1bt9Zde84GDPORJXDDhi1H5XM8KX42lk
	dl511LrtgVOqpH7lIcvYzg239JKb5rV87gGpl5cXQHZ4gm/auylMP1HClg7V9oFCkcZTBlvI4JzYP
	kyJUg6C6vQId7rzjacZF5r79q6wuu1hHIQrclupyiB1b/t4j6tcYPico2sysIVg8T+DQGeoaTNZyY
	U+4M2Cww0gF+YvJI8nEYucmgxaIooIPzoSoWAr8IJ4B8cD93zKfvMib1YuIbc9sd8DzBF5HDyKNOs
	sXL9j/qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRCv-0000000FMo7-0S07;
	Tue, 03 Mar 2026 14:58:45 +0000
Received: from relmlor1.renesas.com ([210.160.252.171] helo=relmlie5.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRCr-0000000FMmy-0S3v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 14:58:43 +0000
X-CSE-ConnectionGUID: d2zDeClzQZKRKlwPLpq6Rw==
X-CSE-MsgGUID: AMrbHGahT+ehlb7rchE76w==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 03 Mar 2026 23:58:36 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.15])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 013F2400D0EA;
	Tue,  3 Mar 2026 23:58:29 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux@armlinux.org.uk,
	rmk+kernel@armlinux.org.uk,
	maxime.chevallier@bootlin.com,
	boon.khai.ng@altera.com,
	rohan.g.thomas@altera.com,
	vladimir.oltean@nxp.com,
	hayashi.kunihiko@socionext.com,
	boon.leong.ong@intel.com,
	kim.tatt.chuah@intel.com
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 0/4] net: stmmac: Fix VLAN handling when interface is down
Date: Tue,  3 Mar 2026 14:58:24 +0000
Message-ID: <20260303145828.7845-1-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_065841_268500_804568A6 
X-CRM114-Status: UNSURE (   9.89  )
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

VLAN register accesses on the MAC side require the PHY RX clock to be
active. When the network interface is down, the PHY is suspended and
the RX clock is unavailable, causing VLAN operations to fail with
timeouts.

The VLAN core automatically removes VID 0 after the interface goes down
and re-adds it when it comes back up, so these timeouts happen during
normal interface down/up:

    # ip link set end1 down
    renesas-gbeth 15c40000.ethernet end1: Timeout accessing MAC_VLAN_Tag_Filter
    renesas-gbeth 15c40000.ethernet end1: failed to kill vid 0081/0

Adding VLANs while the interface is down also fails:

    # ip link add link end1 name end1.10 type vlan id 10
    renesas-gbeth 15c40000.ethernet end1: Timeout accessing MAC_VLAN_Tag_Filter
    RTNETLINK answers: Device or resource busy

Patch 4 fixes this by adding checks in the VLAN paths for netif_running(),
and skipping register accesses if the interface is down. Only the software
state is updated in this case. When the interface is brought up, the VLAN
state is restored to hardware.

Patches 1-3 fix some issues in the existing VLAN implementation.

v3:
- Dropped the 'write_hw' approach and added checks for netif_running() directly
  in the VLAN paths, to avoid passing attributes around.

v2: https://lore.kernel.org/all/20260225142414.130144-1-ovidiu.panait.rb@renesas.com/
- Added a new commit that fixes VLAN restore on the resume and open paths.

v1: https://lore.kernel.org/all/20260223124102.120432-1-ovidiu.panait.rb@renesas.com/

Ovidiu Panait (4):
  net: stmmac: Fix error handling in VLAN add and delete paths
  net: stmmac: Improve double VLAN handling
  net: stmmac: Fix VLAN HW state restore
  net: stmmac: Defer VLAN HW configuration when interface is down

 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  1 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 53 ++++++++++++++--
 .../net/ethernet/stmicro/stmmac/stmmac_vlan.c | 60 ++++++++++---------
 3 files changed, 79 insertions(+), 35 deletions(-)

-- 
2.51.0


