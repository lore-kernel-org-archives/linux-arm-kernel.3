Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D52CEA4FAE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 12:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rU/YVRDT8ordNLseqyKDx4Z7+/L56Zvdow76iPRjBlE=; b=W/ha0s71wgrmgXTttlm2JVEyAW
	D3d25CNDNzPQjjNMV1unoykU8O3BqikDpPvka8+ZtfD2mzPPNDs355iWjC8R08uxa0RqFG6p5snqu
	ZSZJkCFlHsvD6fuu/jUtgaKeb8Eoc5BF5uP4B7qd14DzrNMOEh3FyGgcIWa9vaeLQm5C8hkDPNZSx
	GRF+C5HYScKnhD0EF9dvhA4QES1+OaqJ+GIMp965AbIZd4Pauti+iDi+AuYpY848ammyqwI6bcoxh
	QuTU1MLcqChsBQ/gwcKmwt3MhQl08BeHni+63YaKK+npKR5sOyHokSkCwOeRMALfFacH19K6d3QEn
	cEFjfRjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuVFY-00000000IJg-08rv;
	Mon, 23 Feb 2026 12:41:20 +0000
Received: from relmlor1.renesas.com ([210.160.252.171] helo=relmlie5.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuVFV-00000000IId-0eYd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 12:41:19 +0000
X-CSE-ConnectionGUID: QlRjXNpSRbe8nAs7y3YahQ==
X-CSE-MsgGUID: SQtk8V6rSKWQyLhCQ8cViw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 23 Feb 2026 21:41:11 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.12])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3C08E41AB637;
	Mon, 23 Feb 2026 21:41:03 +0900 (JST)
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
	matthew.gerlach@altera.com,
	vee.khee.wong@intel.com,
	boon.leong.ong@intel.com,
	kim.tatt.chuah@intel.com
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 0/4] net: stmmac: Fix VLAN handling when interface is down
Date: Mon, 23 Feb 2026 12:40:58 +0000
Message-ID: <20260223124102.120432-1-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_044117_311373_8670BC9B 
X-CRM114-Status: UNSURE (   8.46  )
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

Patches 3-4 address this by deferring hardware writes when the
interface is down and reconfiguring the VLAN state on interface up.

Patches 1-2 fix some issues in the existing VLAN implementation.

Ovidiu Panait (4):
  net: stmmac: Fix error handling in VLAN add and delete paths
  net: stmmac: Improve double VLAN handling
  net: stmmac: Add write_hw parameter to VLAN filter operations
  net: stmmac: Defer VLAN HW configuration when interface is down

 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  6 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  1 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 62 ++++++++++++++++---
 .../net/ethernet/stmicro/stmmac/stmmac_vlan.c | 51 +++++++++------
 4 files changed, 90 insertions(+), 30 deletions(-)

-- 
2.34.1


