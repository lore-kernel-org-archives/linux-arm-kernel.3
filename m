Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B455CCF65D9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 10:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XQgy/gqXOYj94r+JKw2+t1DDizO2slSW2W9L6xQSj1E=; b=F58GeMngv6Zax1bt0Tl7xsFDBb
	QVH/CInvhmMGAgY3EjCcnF3stJLYXAizGthiQSJwPOLmz5Eun0unG43NMVNteBUBALu+st1CnHRvW
	QNB/7pNzPiUtOSEHg0H9H5U9Kw2+mDGnJIhLeubHzjXUmI9SdjVfs8RxjmKMQpyQ9D8OmktedYE1S
	kW57+wWlrHZC0GQBVfnfJc/r4HvCXLLaR9435vGjIM8QaPL3T+rg+YMN35WC7KDUU21+giw12bc9P
	9QnhEBAGPRhV/DBO9hHN2qQrSCgwX6NQyO6qYUxuGhjskN43M5V4/tjhOth2EgQS5BU9re+myEGbG
	ml+HHZbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJvy-0000000CIb1-1YQV;
	Mon, 26 Jan 2026 10:35:02 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJvv-0000000CIYg-31Lo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 10:35:01 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4f04fW53cWz9sk9;
	Mon, 26 Jan 2026 11:34:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1769423683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XQgy/gqXOYj94r+JKw2+t1DDizO2slSW2W9L6xQSj1E=;
	b=hEauLtti+Ly3CEdg3PB7c9YQ62isImXVd/Vaura3ZvX8kfQvgjEwL9OUQTH443ZH0xSs2C
	yv7IP3forGyA8LMQ1GBFH+Dmv29uXPsP68OIXNM1tDRUdsrOVgYNpZo6ESQcLcZi9F6eVA
	3mUeU5DtsK2T7L5/1PhGUFgE1Fv4Ghh+agqJmqF8A7pNt8DWoEEBaaIIfEK2iEcNXIEaQU
	mXxYI3dCMGZX2Xc8od4MzsIfKrLkJ+rzERTnDs80HhMbDqVDLWuKR6Joa3iXy2Ns7giTQQ
	ENrjaCN3syNmGJzCaR7/Bw0kaOnJuCSJ+Ab0ZTvvdVGLtIfI1dDGyveSWGjWAg==
From: Lukasz Majewski <lukasz.majewski@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1769423677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XQgy/gqXOYj94r+JKw2+t1DDizO2slSW2W9L6xQSj1E=;
	b=t4OfXgO5oz4DrbkGNt4wwmw7F9AWzsCKdrMTKGsMowIFrmcPmxqlCVn9Zk6gk6698Hfp9K
	6wdQJWmJvgLkjbZMW3umWWgQqmkv8wS04pLZpltL8XIlfRY49nyYeUw2tP+XDuw6IHwUaP
	4WSnYN+rqODAzbSDuqDWBRnxmqN0DK5xjaXXpusOXQ9fDAay9Lgp9uw0Dphue+mtXZziZV
	89dEhoxIWKblIZ4qD2n9i8wikGueiaBf/hCQtl1YwIapoddgYhR4n2RuXe+pBSBUSZPiZK
	iArSCuHZemhNzz2Yj+e2W/b2W6cFz+kmNRC6ed9PjULmUYwv3b7CHz2yv0r+Fg==
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>,
	Simon Horman <horms@kernel.org>,
	Lukasz Majewski <lukasz.majewski@mailbox.org>
Subject: [net-next v20 0/7] net: mtip: Add support for MTIP imx287 L2 switch driver
Date: Mon, 26 Jan 2026 11:33:53 +0100
Message-Id: <20260126103400.1683125-1-lukasz.majewski@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: x865gi14jsshirwxxo1hicjtm4nkecf7
X-MBO-RS-ID: a2654ea3b3aa8cc6253
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_023459_900152_D8562C28 
X-CRM114-Status: GOOD (  21.50  )
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

The driver from this series has following features:

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
          However, on top of this patch set the code with SWITCHDEV support (v6.6.
          PREEMPT_RT enabled) has been implemented in [4].

5. Clang build:
	make LLVM_SUFFIX=-19 LLVM=1 mrproper
	cp ./arch/arm/configs/mxs_defconfig .config
	make ARCH=arm LLVM_SUFFIX=-19 LLVM=1 W=1 menuconfig
	make ARCH=arm LLVM_SUFFIX=-19 LLVM=1 W=1 -j8 LOADADDR=0x40008000 uImage dtbs

        make LLVM_SUFFIX=-19 LLVM=1 mrproper
        make LLVM_SUFFIX=-19 LLVM=1 allmodconfig
        make LLVM_SUFFIX=-19 LLVM=1 W=1 drivers/net/ethernet/freescale/mtipsw/ | tee llvm_build.log
        make LLVM_SUFFIX=-19 LLVM=1 W=1 -j8 | tee llvm_build.log

6. Kernel compliance checks:
	make coccicheck MODE=report J=4 M=drivers/net/ethernet/freescale/mtipsw/
        make allmodconfig; ~/work/src/smatch/smatch_scripts/kchecker drivers/net/ethernet/freescale/mtipsw/

7. GCC:
        make mrproper
        make allmodconfig
        make W=1 drivers/net/ethernet/freescale/mtipsw/

        
        [source OE/Yocto SDK build environment]
        CROSS_COMPILE=arm-poky-linux-gnueabi- ARCH=arm make mrproper
        cp ./arch/arm/configs/mxs_defconfig .config
        CROSS_COMPILE=arm-poky-linux-gnueabi- ARCH=arm make menuconfig
        CROSS_COMPILE=arm-poky-linux-gnueabi- ARCH=arm make -j8 LOADADDR=0x40008000 uImage dtbs

8. DT_SCHEMA checks:
        source ~/.venv/bin/activate
        source /opt/poky/3.1.31/environment-setup-armv5e-poky-linux-gnueabi
        make dt_binding_check DT_SCHEMA_FILES=nxp,imx28-mtip-switch.yaml
        make CHECK_DTBS=y DT_SCHEMA_FILES=nxp,imx28-mtip-switch.yaml nxp/mxs/imx28-xea.dtb


Links:
[1] - https://github.com/lmajewski/linux-imx28-l2switch/commits/master
[2] - https://github.com/lmajewski/linux-imx28-l2switch/tree/imx28-v5.12-L2-upstream-RFC_v1
[3] - https://source.denx.de/linux/linux-imx28-l2switch/-/tree/imx28-v5.12-L2-upstream-switchdev-RFC_v1?ref_type=heads
[4] - https://github.com/lmajewski/linux-imx28-l2switch/commits/vf610-linux-6.6.y-mtipl2sw

Lukasz Majewski (7):
  dt-bindings: net: Add MTIP L2 switch description
  net: mtip: The L2 switch driver for imx287
  net: mtip: Add buffers management functions to the L2 switch driver
  net: mtip: Add net_device_ops functions to the L2 switch driver
  net: mtip: Add mtip_switch_{rx|tx} functions to the L2 switch driver
  net: mtip: Extend the L2 switch driver with management operations
  net: mtip: Extend the L2 switch driver for imx287 with bridge
    operations

 .../bindings/net/nxp,imx28-mtip-switch.yaml   |  150 ++
 MAINTAINERS                                   |    7 +
 drivers/net/ethernet/freescale/Kconfig        |    1 +
 drivers/net/ethernet/freescale/Makefile       |    1 +
 drivers/net/ethernet/freescale/mtipsw/Kconfig |   13 +
 .../net/ethernet/freescale/mtipsw/Makefile    |    4 +
 .../net/ethernet/freescale/mtipsw/mtipl2sw.c  | 1997 +++++++++++++++++
 .../net/ethernet/freescale/mtipsw/mtipl2sw.h  |  648 ++++++
 .../ethernet/freescale/mtipsw/mtipl2sw_br.c   |  132 ++
 .../ethernet/freescale/mtipsw/mtipl2sw_mgnt.c |  443 ++++
 10 files changed, 3396 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nxp,imx28-mtip-switch.yaml
 create mode 100644 drivers/net/ethernet/freescale/mtipsw/Kconfig
 create mode 100644 drivers/net/ethernet/freescale/mtipsw/Makefile
 create mode 100644 drivers/net/ethernet/freescale/mtipsw/mtipl2sw.c
 create mode 100644 drivers/net/ethernet/freescale/mtipsw/mtipl2sw.h
 create mode 100644 drivers/net/ethernet/freescale/mtipsw/mtipl2sw_br.c
 create mode 100644 drivers/net/ethernet/freescale/mtipsw/mtipl2sw_mgnt.c

-- 
2.39.5


