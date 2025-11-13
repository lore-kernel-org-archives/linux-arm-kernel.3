Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA20CD5BCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 11:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S7qnMNAsUFRcY5M3aU/khCk8rF92aPPuVkcTeLEs58s=; b=q7T+55r3woJ0L5W+ECWRZiaCNZ
	jwPIKhHHXZrutvxeSK9gB0DfnvS0YndxPaKsV3kJ3T5WkCC3bSBexkKkLsvvBnmQa870QHBRTWJpz
	gl9TI/3ZmRpFc6xF8Ted42mLzXcdM9wEvdST93cXWYrYywK5FeVxHDyWWnEnrmtg+AxuRAryl1k9U
	Mia3j6ygRkWRASztqR0Zwfui2s4638Y5Vx6h2moQT/vJ2LuhUA0jFV+9Re0JTsnGpPsMTfWpYISRN
	/KATdVJKeiC7UjMZH+r53VvFDnPnbpws3jK8r+I4MlA42QUBMRYz0+ri2gcRT2J8nW/RWCJ8pxQ27
	CQHdS8Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJVUH-0000000AO4Z-2Ch8;
	Thu, 13 Nov 2025 11:27:37 +0000
Received: from relmlor1.renesas.com ([210.160.252.171] helo=relmlie5.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJVUD-0000000AO3O-42ng
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 11:27:36 +0000
X-CSE-ConnectionGUID: yahheH1SRiuOOQtMT8/IWA==
X-CSE-MsgGUID: Df5RvJB/RFamhu+4zrneHQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 13 Nov 2025 20:27:27 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.175])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 084A2428B0E9;
	Thu, 13 Nov 2025 20:27:22 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk,
	maxime.chevallier@bootlin.com,
	boon.khai.ng@altera.com
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 0/2] net: stmmac: Disable EEE RX clock stop when VLAN is enabled
Date: Thu, 13 Nov 2025 11:27:19 +0000
Message-ID: <20251113112721.70500-1-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_032734_137605_D92BCA1F 
X-CRM114-Status: GOOD (  11.42  )
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

This series fixes a couple of VLAN issues observed on the Renesas RZ/V2H
EVK platform (stmmac + Microchip KSZ9131RNXI PHY):

- The first patch fixes a bug where VLAN ID 0 would not be properly removed
due to how vlan_del_hw_rx_fltr() matched entries in the VLAN filter table.

- The second patch addresses RX clock gating issues that occur during VLAN
creation and deletion when EEE is enabled with RX clock-stop active (the
default configuration). For example:

    # ip link add link end1 name end1.5 type vlan id 5
    15c40000.ethernet end1: Timeout accessing MAC_VLAN_Tag_Filter
    RTNETLINK answers: Device or resource busy

The stmmac hardware requires the receive clock to be running when writing
certain registers, including VLAN registers. However, by default the driver
enables Energy Efficient Ethernet (EEE) and allows the PHY to stop the
receive clock when the link is idle. As a result, the RX clock might be
stopped when attempting to access these registers, leading to timeouts.

A more comprehensive overview of receive clock related issues in the
stmmac driver can be found here:
https://lore.kernel.org/all/Z9ySeo61VYTClIJJ@shell.armlinux.org.uk/

Most of the issues were resolved by commit dd557266cf5fb ("net: stmmac:
block PHY RXC clock-stop"), which wraps register accesses with
phylink_rx_clk_stop_block()/unblock() calls. However, VLAN add/delete
operations are invoked with bottom halves disabled, where sleeping is
not permitted, so those helpers cannot be used.

To avoid these VLAN timeouts, the second patch disables the EEE RX
clock-stop feature when VLAN support is enabled. This ensures the receive
clock remains active, allowing VLAN operations to complete successfully.

Best regards,
Ovidiu

v2:
- Added comment mentioning that EEE RX clock stop is disabled to allow
  access to VLAN registers.
- Added "Reviewed-by" tag from Russell.

Ovidiu Panait (2):
  net: stmmac: Fix VLAN 0 deletion in vlan_del_hw_rx_fltr()
  net: stmmac: Disable EEE RX clock stop when VLAN is enabled

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 +++++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c | 3 ++-
 2 files changed, 7 insertions(+), 2 deletions(-)

-- 
2.51.0


