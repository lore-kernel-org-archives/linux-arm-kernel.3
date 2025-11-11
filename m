Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8EF2CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 09:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ugxc4SUdIIbBR/gqPQEQBPKWt4wcIFuWK7Q3RWmiBjM=; b=PIS+8HhG7pPwrlAaCkfEUaaxBz
	wLSIMYbiu45H12lJ6Zm13aQf9fP4Dtl//EZzbT5drLu7fsb6nOKhFalYHvW7ETtFGK8IskflbR+D7
	Ha+P4gUyZIVJFYgU16QCxguVbpzhva5Yb78WBjRf5gDRb+yAw2Vd6G6lP6QLcogFafrvGWVhSkLZ6
	hkg8jI4pMfPNsU6WQ1fewVWH6/L5105sKENzrahcRngPVqzhXXB6+p99E3VUQJjDNPvtKnACl3BQ5
	vIf6CK2Al1oxRk3B/E+oO7NlLJH39clPJW2XgSUGkagE/8CLgUOZd2WLgDz8yCHkX1Pj4duCjjsZs
	ye7LoxjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIkhe-00000006qXA-3JDu;
	Tue, 11 Nov 2025 09:30:18 +0000
Received: from relmlor2.renesas.com ([210.160.252.172] helo=relmlie6.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIkhY-00000006qUq-0z46
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 09:30:18 +0000
X-CSE-ConnectionGUID: E3I0E2d4TqSO7bwA5HLWIA==
X-CSE-MsgGUID: frTPyOc3SIakwotc26WU2g==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 11 Nov 2025 18:30:05 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.93.46])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7D2904172C38;
	Tue, 11 Nov 2025 18:30:01 +0900 (JST)
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
Subject: [PATCH net-next 0/2] net: stmmac: Disable EEE RX clock stop when VLAN is enabled
Date: Tue, 11 Nov 2025 09:29:58 +0000
Message-ID: <20251111093000.58094-1-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_013012_386624_A28BE42D 
X-CRM114-Status: GOOD (  11.41  )
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

Ovidiu Panait (2):
  net: stmmac: Fix VLAN 0 deletion in vlan_del_hw_rx_fltr()
  net: stmmac: Disable EEE RX clock stop when VLAN is enabled

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

-- 
2.51.0


