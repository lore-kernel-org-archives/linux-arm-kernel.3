Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FC3CAC58D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 11:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZcdrLaCnNH25sYEaywH83QHDAIUewsyAhEoNg4j62as=; b=fGY5XIlXLPUMUAucNrdq3K0JT8
	ODXyJ/Szml+k6LAdqHuHleKtBtowkaDj19cVs7RrfaEDOZp/TtWRUlWLt9XNkRyTR1r+sjnsUP3pa
	vw+Rit1wMH6/J+AeKSkeAGV9gsyU+WAzs4Q56ukFYi/DlGfFQsOVAT0kfMRb7Q7IwMfSLdMkaBRMf
	rBkyslFeQADenTOlFs+9ux+QfWYF9aQLxdE37bddvOn3CBfWIm9prdpbMuDPLWUhxgt4tcOudrbF/
	ncA/Li39LVS5DGQGD4ub2MPYvlyhNsPLzig0be67SEuF9Es+j9wOW1esygQMQU2MoB0otFD52XMKU
	w7csGe9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwfbg-00000002iaB-3lTk;
	Thu, 11 Sep 2025 11:36:52 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwfbe-00000002iXz-0XAT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 11:36:51 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58BBaHba282422;
	Thu, 11 Sep 2025 06:36:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757590577;
	bh=ZcdrLaCnNH25sYEaywH83QHDAIUewsyAhEoNg4j62as=;
	h=From:To:CC:Subject:Date;
	b=R+r5c8KVL73Yq7SMRIhTO3bFj+7ZphmTzXOxSCkz6sG7+AFWheKnG2UwwqJATjhx9
	 KzYTF4wGQgx0i2+330bllChMFBvvHnB67R4wSv8ez7cNzYjDOJqKM2fM0yUKKVw7PH
	 jNt5jULOCi0wyYJi5sxvAzsrslp5J+Yp1tAtUxM4=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58BBaGJd464575
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 11 Sep 2025 06:36:16 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 11
 Sep 2025 06:36:16 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Sep 2025 06:36:16 -0500
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58BBaGhk1015065;
	Thu, 11 Sep 2025 06:36:16 -0500
Received: from localhost (danish-tpc.dhcp.ti.com [172.24.231.152])
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 58BBaE16007136;
	Thu, 11 Sep 2025 06:36:15 -0500
From: MD Danish Anwar <danishanwar@ti.com>
To: "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet
	<corbet@lwn.net>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        MD Danish Anwar
	<danishanwar@ti.com>,
        Mengyuan Lou <mengyuanlou@net-swift.com>,
        Lei Wei
	<quic_leiwei@quicinc.com>, Xin Guo <guoxin09@huawei.com>,
        Michael Ellerman
	<mpe@ellerman.id.au>, Fan Gong <gongfan1@huawei.com>,
        Lorenzo Bianconi
	<lorenzo@kernel.org>,
        Parthiban Veerasooran
	<Parthiban.Veerasooran@microchip.com>,
        Lukas Bulwahn
	<lukas.bulwahn@redhat.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC: <netdev@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>
Subject: [PATCH net-next v4 0/7] Add RPMSG Ethernet Driver
Date: Thu, 11 Sep 2025 17:06:05 +0530
Message-ID: <20250911113612.2598643-1-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_043650_334912_4A929E12 
X-CRM114-Status: GOOD (  19.20  )
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

This patch series introduces the RPMSG Ethernet driver, which provides a
virtual Ethernet interface for communication between a host processor and
a remote processor using the RPMSG framework. The driver enables
Ethernet-like packet transmission and reception over shared memory,
facilitating inter-core communication in systems with heterogeneous
processors.

Key features of this driver:

1. Virtual Ethernet interface using RPMSG framework
2. Shared memory-based packet transmission and reception
3. Support for multicast address filtering
4. Dynamic MAC address assignment
5. NAPI support for efficient packet processing
6. State machine for managing interface states

This driver is designed to be generic and vendor-agnostic. Vendors can
develop firmware for the remote processor to make it compatible with this
driver by adhering to the shared memory layout and communication protocol
described in the documentation.

This patch series has been tested on a TI AM64xx platform with a
compatible remote processor firmware. Feedback and suggestions for
improvement are welcome.

Changes from v3 to v4:
- Addressed comments from Parthiban Veerasooran regarding return values in
  patch 4/7
- Added "depends on REMOTEPROC" in Kconfig entry for RPMSG_ETH as it uses a
  symbol from REMOTEPROC driver.

Changes from v2 to v3:
- Removed the binding patches as suggested by Krzysztof Kozlowski <krzk@kernel.org>
- Dropped the rpmsg-eth node. The shared memory region is directly added to the
  "memory-region" in rproc device.
- Added #include <linux/io.h> header for memory mapping operations
- Added vendor-specific configuration through rpmsg_eth_data structure
- Added shared memory region index support with shm_region_index parameter
- Changed RPMSG channel name from generic "shm-eth" to vendor-specific "ti.shm-eth"
- Fixed format string warning using %zu instead of %lu for size_t type
- Updated Documentation to include shm_region_index
- Added MAINTAINERS entry for the driver

v3 https://lore.kernel.org/all/20250908090746.862407-1-danishanwar@ti.com/
v2 https://lore.kernel.org/all/20250902090746.3221225-1-danishanwar@ti.com/
v1 https://lore.kernel.org/all/20250723080322.3047826-1-danishanwar@ti.com/

MD Danish Anwar (7):
  net: rpmsg-eth: Add Documentation for RPMSG-ETH Driver
  net: rpmsg-eth: Add basic rpmsg skeleton
  net: rpmsg-eth: Register device as netdev
  net: rpmsg-eth: Add netdev ops
  net: rpmsg-eth: Add support for multicast filtering
  MAINTAINERS: Add entry for RPMSG Ethernet driver
  arch: arm64: dts: k3-am64*: Add shared memory region

 .../device_drivers/ethernet/index.rst         |   1 +
 .../device_drivers/ethernet/rpmsg_eth.rst     | 424 ++++++++++++
 MAINTAINERS                                   |   6 +
 arch/arm64/boot/dts/ti/k3-am642-evm.dts       |  11 +-
 drivers/net/ethernet/Kconfig                  |  11 +
 drivers/net/ethernet/Makefile                 |   1 +
 drivers/net/ethernet/rpmsg_eth.c              | 653 ++++++++++++++++++
 drivers/net/ethernet/rpmsg_eth.h              | 294 ++++++++
 8 files changed, 1399 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/networking/device_drivers/ethernet/rpmsg_eth.rst
 create mode 100644 drivers/net/ethernet/rpmsg_eth.c
 create mode 100644 drivers/net/ethernet/rpmsg_eth.h


base-commit: 1f24a240974589ce42f70502ccb3ff3f5189d69a
-- 
2.34.1


