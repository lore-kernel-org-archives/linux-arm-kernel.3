Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C1E8C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 12:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pd9Mb9EGjiorJmqfD3xt+UhIpKbj2X3/flEfWMUs8j4=; b=PC4D2Se4m3EmNop9GvXE0pnUgl
	DtTzKfaW+bbLAlg8r5svwSUeIvuoSh+N5Hzun/JvhlxiOy4FXZaEJLIyuDm5COJU/RA9tIfTh5PiM
	FONy5QIea/14hkiyVNNeOdUhwl6DH+Yd4juMTSV6mMa7oD+NcfxdocOtDJQYF+agsGTNtRdGwk++4
	QO2x5/gngk0cA/NOK/lc4tyvvwvU+S6pDb/4X5kvu5W0l31hlVZ30VIT4v110VkeVjfPENhM4pCSP
	cI0gsw8piwJen1ebTCY5/YoPdPouO0gAAlGdkU3HSRygTwxXoF8t1juvg3lU8lnzZK/fxEoCFa2nu
	tvarDS9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx2yf-00000005izH-0nJp;
	Tue, 25 Mar 2025 12:01:53 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx2vD-00000005iDM-2kuz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 11:58:21 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F1137102F66FF;
	Tue, 25 Mar 2025 12:58:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1742903894; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=Pd9Mb9EGjiorJmqfD3xt+UhIpKbj2X3/flEfWMUs8j4=;
	b=fdCItleRY1ScOnEWpELgucVdXlUxLkQHTIfzCcdGcfmnKj9LIP5nqvDTQUjO46Act2J8NC
	D3TshBfu8viiqbsirGHG+tzbX4JjgHHVWY3k87i/TeAFBWlMGtiEKIs+CLp79iOhOQaorq
	DSbttWnBdJgrBX1HYkpTo0joXGpUA4wICUColKwuVWy+/kDTClinxRHbgOecQz/gxyFuSK
	d79YH9ol4ywqqkHip+Dhvl9DGl2qCSbQgAggPHfEr2LZD7nJQD2e6pnbck6pxWcjEP896U
	O++eo3dIRIAVVuv9FXLyYIHwuMxHyifWZTr1LcQ14iMhj6weVQz04GziUWr+og==
From: Lukasz Majewski <lukma@denx.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	davem@davemloft.net,
	Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Richard Cochran <richardcochran@gmail.com>,
	netdev@vger.kernel.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Lukasz Majewski <lukma@denx.de>
Subject: [PATCH 0/5] net: mtip: Add support for MTIP imx287 L2 switch driver
Date: Tue, 25 Mar 2025 12:57:31 +0100
Message-Id: <20250325115736.1732721-1-lukma@denx.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_045819_989240_A6D349B5 
X-CRM114-Status: GOOD (  21.00  )
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

This patch series adds support for More Than IP's L2 switch driver embedded
in some NXP's SoCs. This one has been tested on imx287, but is also available
in the vf610.

In the past there has been performed some attempts to upstream this driver:
1. The 4.19-cip based one [1]
2. DSA based one for 5.12 [2] - i.e. the switch itself was treat as a DSA switch
   with NO tag appended.
3. The extension for FEC driver for 5.12 [3] - the trick here was to fully reuse
   FEC when the in-HW switching is disabled. When bridge offloading is enabled,
   the driver uses already configured MAC and PHY to also configure PHY.

All three approaches were not accepted as eligible for upstreaming.

The driver from this series has floowing features:

1. It is fully separated from fec_main - i.e. can be used interchangeable
   with it. To be more specific - one can build them as modules and
   if required switch between them when e.g. bridge offloading is required.

   To be more specific:
	- Use FEC_MAIN: When one needs support for two ETH ports with separate
	  uDMAs used for both and bridging can be realized in SW.

	- Use MTIPL2SW: When it is enough to support two ports with only uDMA0
	  attached to switch and bridging shall be offloaded to HW. 
	
2. This driver uses MTIP's L2 switch internal VLAN feature to provide port
   separation at boot time. Port separation is disabled when bridging is
   required.

3. Example usage:
	Configuration:
	ip link set lan0 up; sleep 1;
	ip link set lan1 up; sleep 1;
	ip link add name br0 type bridge;
	ip link set br0 up; sleep 1;
	ip link set lan0 master br0;
	ip link set lan1 master br0;
	bridge link;
	ip addr add 192.168.2.17/24 dev br0;
	ping -c 5 192.168.2.222

	Removal:
	ip link set br0 down;
	ip link delete br0 type bridge;
	ip link set dev lan1 down
	ip link set dev lan0 down

4. Limitations:
	- Driver enables and disables switch operation with learning and ageing.
	- Missing is the advanced configuration (e.g. adding entries to FBD). This is
	  on purpose, as up till now we didn't had consensus about how the driver
	  shall be added to Linux.
	
Links:
[1] - https://github.com/lmajewski/linux-imx28-l2switch/commits/master
[2] - https://github.com/lmajewski/linux-imx28-l2switch/tree/imx28-v5.12-L2-upstream-RFC_v1
[3] - https://source.denx.de/linux/linux-imx28-l2switch/-/tree/imx28-v5.12-L2-upstream-switchdev-RFC_v1?ref_type=heads



Lukasz Majewski (5):
  MAINTAINERS: Add myself as the MTIP L2 switch maintainer (IMX SoCs:
    imx287)
  dt-bindings: net: Add MTIP L2 switch description
    (fec,mtip-switch.yaml)
  arm: dts: Adjust the 'reg' range for imx287 L2 switch description
  arm: dts: imx287: Provide description for MTIP L2 switch
  net: mtip: The L2 switch driver for imx287

 .../bindings/net/fec,mtip-switch.yaml         |  160 ++
 MAINTAINERS                                   |    7 +
 arch/arm/boot/dts/nxp/mxs/imx28-xea.dts       |   56 +
 arch/arm/boot/dts/nxp/mxs/imx28.dtsi          |    4 +-
 drivers/net/ethernet/freescale/Kconfig        |    1 +
 drivers/net/ethernet/freescale/Makefile       |    1 +
 drivers/net/ethernet/freescale/mtipsw/Kconfig |   10 +
 .../net/ethernet/freescale/mtipsw/Makefile    |    6 +
 .../net/ethernet/freescale/mtipsw/mtipl2sw.c  | 2108 +++++++++++++++++
 .../net/ethernet/freescale/mtipsw/mtipl2sw.h  |  784 ++++++
 .../ethernet/freescale/mtipsw/mtipl2sw_br.c   |  113 +
 .../ethernet/freescale/mtipsw/mtipl2sw_mgnt.c |  434 ++++
 12 files changed, 3682 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/fec,mtip-switch.yaml
 create mode 100644 drivers/net/ethernet/freescale/mtipsw/Kconfig
 create mode 100644 drivers/net/ethernet/freescale/mtipsw/Makefile
 create mode 100644 drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
 create mode 100644 drivers/net/ethernet/freescale/mtipsw/mtipl2sw.h
 create mode 100644 drivers/net/ethernet/freescale/mtipsw/mtipl2sw_br.c
 create mode 100644 drivers/net/ethernet/freescale/mtipsw/mtipl2sw_mgnt.c

-- 
2.39.5


