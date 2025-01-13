Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4854E7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 09:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=1SSTzS99BYsiM+oBx4byfpdIc4HV6ye8QqH1Uy/uwK8=; b=Mw/
	FrDLRtXuyBs9O7FAjBIH/6wltmcKlZRH1lQdS9L9Sm6ZOVuC0AvLWYQTJCY88w3lFqiTMhXDRLjJp
	ipLPyv+O1hJCmx/87iPh8UU1VjMOeBU45IuTvf9TzgvDwAcKusaUnCbPJYVEJXlxBqq5JBHRSimVN
	nr15w646XSAeWaHbNzo4u1HnZ60VM6oUGtFolW4WHmu+KQ/4P2R+FilV+xFaZTME3jDVd/M8MAMec
	RgcdWhfyWJOI/1B1/9VzraWDUdLHBDHjUvj+rrl+QGH1HnE5LZa3R2OzOF7ldYhMX/m6iP9bt/gfZ
	leUeNofLI5hylwPnA/z263Y9GDT3N6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGjh-00000004bRd-2ejk;
	Mon, 13 Jan 2025 09:27:53 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGeZ-00000004aPi-2Nif;
	Mon, 13 Jan 2025 09:22:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1SSTzS99BYsiM+oBx4byfpdIc4HV6ye8QqH1Uy/uwK8=; b=K8tRoCVJfkJt7W2gytM69jIGf/
	Gz64VZncA/sGPlbhvj1/9oweCp1qnssyN7RjRgH/XPCctSUnnehRbmUPlc8UMMSjKOeHs9CNaVpAH
	YxEEG1tAd666wMhmENCY+XFQCAiCR0zZG6zNDxWlUdphtmAJ+lEmVVFboqg8PZTZJfgdofnwTl/Pa
	C4PIaL7HYfOpd/9jJxC7cIR/fTVvVuCG24CntUYuuV+gV5nrTf2fQGHHIyZgC0/l7QGulyQvHiQiN
	dFSWcTiG5B44xAfXYuCz/X31z9PCbYZ5RY8BRzqn8yhv6eDEKpixnQc5a6syw1i2zjxrhg0Jd8k9M
	yOEzjByQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49066)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tXGeJ-0006GN-1P;
	Mon, 13 Jan 2025 09:22:19 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tXGeF-0003x7-2h;
	Mon, 13 Jan 2025 09:22:16 +0000
Date: Mon, 13 Jan 2025 09:22:15 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next v2 0/5] net: phylink: fix PCS without autoneg
Message-ID: <Z4TbR93B-X8A8iHe@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_012235_598742_C8C0714B 
X-CRM114-Status: GOOD (  15.40  )
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
Cc: Taras Chornyi <taras.chornyi@plvision.eu>, Marcin Wojtas <marcin.s.wojtas@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Alexander Duyck <alexanderduyck@fb.com>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Sean Anderson <sean.anderson@seco.com>, Steen Hegelund <Steen.Hegelund@microchip.com>, Lars Povlsen <lars.povlsen@microchip.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jose Abreu <Jose.Abreu@synopsys.com>, Sean Wang <sean.wang@mediatek.com>, Daniel Machon <daniel.machon@microchip.com>, kernel-team@meta.com, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, UNGLinuxDriver@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>, Eric Woudstra <ericwouds@gmail.com>, Alexander Couzens <lynxis@fe80.eu>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

Eric Woudstra reported that a PCS attached using 2500base-X does not
see link when phylink is using in-band mode, but autoneg is disabled,
despite there being a valid 2500base-X signal being received. We have
these settings:

	act_link_an_mode = MLO_AN_INBAND
	pcs_neg_mode = PHYLINK_PCS_NEG_INBAND_DISABLED

Eric diagnosed it to phylink_decode_c37_word() setting state->link
false because the full-duplex bit isn't set in the non-existent link
partner advertisement word (which doesn't exist because in-band
autoneg is disabled!)

The test in phylink_mii_c22_pcs_decode_state() is supposed to catch
this state, but since we converted PCS to use neg_mode, testing the
Autoneg in the local advertisement is no longer sufficient - we need
to be looking at the neg_mode, which currently isn't provided.

We need to provide this via the .pcs_get_state() method, and this
will require modifying all PCS implementations to add the extra
argument to this method.

Patch 1 uses the PCS neg_mode in phylink_mac_pcs_get_state() to correct
the now obsolute usage of the Autoneg bit in the advertisement.

Patch 2 passes neg_mode into the .pcs_get_state() method, and updates
all users.

Patch 3 adds neg_mode as an argument to the various clause 22 state
decoder functions in phylink, modifying drivers to pass the neg_mode
through.

Patch 4 makes use of phylink_mii_c22_pcs_decode_state() rather than
using the Autoneg bit in the advertising field.

Patch 5 may be required for Eric's case - it ensures that we report
the correct state for interface types that we support only one set
of modes for when autoneg is disabled.

Changes in v2:
- Add test for NULL pcs in patch 1

I haven't added Eric's t-b because I used a different fix in patch 1.

 drivers/net/dsa/b53/b53_serdes.c                   |  4 +-
 drivers/net/dsa/mt7530.c                           |  2 +-
 drivers/net/dsa/mv88e6xxx/pcs-6185.c               |  1 +
 drivers/net/dsa/mv88e6xxx/pcs-6352.c               |  1 +
 drivers/net/dsa/mv88e6xxx/pcs-639x.c               |  5 +-
 drivers/net/dsa/qca/qca8k-8xxx.c                   |  2 +-
 drivers/net/ethernet/cadence/macb_main.c           |  3 +-
 drivers/net/ethernet/freescale/fman/fman_dtsec.c   |  4 +-
 drivers/net/ethernet/marvell/mvneta.c              |  2 +-
 drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c    |  2 +
 .../net/ethernet/marvell/prestera/prestera_main.c  |  1 +
 drivers/net/ethernet/meta/fbnic/fbnic_phylink.c    |  2 +-
 .../net/ethernet/microchip/lan966x/lan966x_main.h  |  2 +-
 .../ethernet/microchip/lan966x/lan966x_phylink.c   |  3 +-
 .../net/ethernet/microchip/lan966x/lan966x_port.c  |  4 +-
 .../net/ethernet/microchip/sparx5/sparx5_phylink.c |  2 +-
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c  |  3 +-
 drivers/net/pcs/pcs-lynx.c                         |  4 +-
 drivers/net/pcs/pcs-mtk-lynxi.c                    |  4 +-
 drivers/net/pcs/pcs-xpcs.c                         |  7 +--
 drivers/net/phy/phylink.c                          | 60 ++++++++++++++++------
 include/linux/phylink.h                            | 11 ++--
 22 files changed, 87 insertions(+), 42 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

