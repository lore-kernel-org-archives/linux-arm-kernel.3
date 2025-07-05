Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80678C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jul 2025 17:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iBKNF4JxOGh/wXnSPWOXI6ritVW5PzDqZKlBugIaW70=; b=yokBPaiWtWJcUUEGiGXyVCxzue
	fzYl2f5GB6qVnIWYwG490LkCIXBgZL82oKZx7GDq6+M/Tdgk0Y9RTterfNSOT7mRhX0L63wCSC7Ht
	IzmKBaYNCjtCTRRJCWaHy/hi95RckMd0g1/leoR2SWVBOZQdp18uaeClRqyj+YSw1rKLPSYx6/50Y
	/a8NVaT27CN/mU4G+42crlYQiKG7rt1VWih86qLXWwVh4zwi6Cio2yB0hPNf3vTpk3VJ0NcFmdJWJ
	66Ct8BWYK+akEBG9MayMJxslId/VXfAVtK1qYs2O4pq831jZEYgwuJo+BIca5PfKmFWPVlt3MmzsW
	XrJAExgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uY6Kx-0000000Gn3e-42y3;
	Sat, 05 Jul 2025 17:06:03 +0000
Received: from relmlor1.renesas.com ([210.160.252.171] helo=relmlie5.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uY6Id-0000000Gmvz-14re
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Jul 2025 17:03:41 +0000
X-CSE-ConnectionGUID: UIRvHSRsSVmKRx59j0yRyQ==
X-CSE-MsgGUID: cnHpFD2WTtap0SSiNRFArw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 06 Jul 2025 02:03:33 +0900
Received: from localhost.localdomain (unknown [10.226.92.32])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1D9304010E1B;
	Sun,  6 Jul 2025 02:03:28 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH net-next] net: stmmac: dwmac-renesas-gbeth: Add PM suspend/resume callbacks
Date: Sat,  5 Jul 2025 18:03:24 +0100
Message-ID: <20250705170326.106073-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_100339_411779_F0CCC705 
X-CRM114-Status: GOOD (  10.11  )
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

Add PM suspend/resume callbacks for RZ/G3E SMARC EVK.

The PM deep entry is executed by pressing the SLEEP button and exit from
entry is by pressing the power button.

Logs:
root@smarc-rzg3e:~# PM: suspend entry (deep)
Filesystems sync: 0.115 seconds
Freezing user space processes
Freezing user space processes completed (elapsed 0.002 seconds)
OOM killer disabled.
Freezing remaining freezable tasks
Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
printk: Suspending console(s) (use no_console_suspend to debug)
NOTICE:  BL2: v2.10.5(release):2.10.5/rz_soc_dev-162-g7148ba838
NOTICE:  BL2: Built : 14:23:58, Jul  5 2025
NOTICE:  BL2: SYS_LSI_MODE: 0x13e06
NOTICE:  BL2: SYS_LSI_DEVID: 0x8679447
NOTICE:  BL2: SYS_LSI_PRR: 0x0
NOTICE:  BL2: Booting BL31
renesas-gbeth 15c30000.ethernet end0: Link is Down
Disabling non-boot CPUs ...
psci: CPU3 killed (polled 0 ms)
psci: CPU2 killed (polled 0 ms)
psci: CPU1 killed (polled 0 ms)
Enabling non-boot CPUs ...
Detected VIPT I-cache on CPU1
GICv3: CPU1: found redistributor 100 region 0:0x0000000014960000
CPU1: Booted secondary processor 0x0000000100 [0x412fd050]
CPU1 is up
Detected VIPT I-cache on CPU2
GICv3: CPU2: found redistributor 200 region 0:0x0000000014980000
CPU2: Booted secondary processor 0x0000000200 [0x412fd050]
CPU2 is up
Detected VIPT I-cache on CPU3
GICv3: CPU3: found redistributor 300 region 0:0x00000000149a0000
CPU3: Booted secondary processor 0x0000000300 [0x412fd050]
CPU3 is up
dwmac4: Master AXI performs fixed burst length
15c30000.ethernet end0: No Safety Features support found
15c30000.ethernet end0: IEEE 1588-2008 Advanced Timestamp supported
15c30000.ethernet end0: configuring for phy/rgmii-id link mode
dwmac4: Master AXI performs fixed burst length
15c40000.ethernet end1: No Safety Features support found
15c40000.ethernet end1: IEEE 1588-2008 Advanced Timestamp supported
15c40000.ethernet end1: configuring for phy/rgmii-id link mode
OOM killer enabled.
Restarting tasks: Starting
Restarting tasks: Done
random: crng reseeded on system resumption
PM: suspend exit

15c30000.ethernet end0: Link is Up - 1Gbps/Full - flow control rx/tx
root@smarc-rzg3e:~# ifconfig end0 192.168.10.7 up
root@smarc-rzg3e:~# ping 192.168.10.1
PING 192.168.10.1 (192.168.10.1) 56(84) bytes of data.
64 bytes from 192.168.10.1: icmp_seq=1 ttl=64 time=2.05 ms
64 bytes from 192.168.10.1: icmp_seq=2 ttl=64 time=0.928 ms

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
This patch is tested with out-of tree patch for save/restore
ethernet OEN registers in the pinctrl block.
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
index 9a774046455b..df4ca897a60c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
@@ -136,6 +136,7 @@ static struct platform_driver renesas_gbeth_driver = {
 	.probe  = renesas_gbeth_probe,
 	.driver = {
 		.name		= "renesas-gbeth",
+		.pm		= &stmmac_pltfr_pm_ops,
 		.of_match_table	= renesas_gbeth_match,
 	},
 };
-- 
2.43.0


