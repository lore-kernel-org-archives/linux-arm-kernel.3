Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3473CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 09:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I+OEYV3P6RAdn9e+dnjp6V6LTEnzQUTTg6OwU4gAIao=; b=G4FZImWVMByagIG50rNrIgKEwo
	fQj9pdaLxulW17GtzGLLzEdYxZc4p0oVCivBuSYPpDjvc8hNe3FyPNHDxowM1uJfAS5SEaoOB1tug
	wraDFSa+6Zs3yQ2gykvAZXRGrq9bL4xTzkYUCojXKuoDmBg3FlfrQyVRNhaNYLquhMefFhM+Ij9Nm
	21qGLl8VThjW2UfV0Kmf84W7CTEWnhhjxRCwdIGWjJW0iE05Rw4lVXwEsnAVbcGpFloXanSB30XLU
	xymzxTGCbKeDBZDBiIkE07Yp6VrWbONz9asx5a5Ci4y0YLaYGxrpOECOvkCKGPl9VVBhbkcNfGTKl
	eIixwC9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvYX8-0000000GAm0-02YP;
	Mon, 08 Sep 2025 09:51:34 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvXrM-0000000Fuwf-1lok
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 09:08:27 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58897qN5071816;
	Mon, 8 Sep 2025 04:07:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757322472;
	bh=I+OEYV3P6RAdn9e+dnjp6V6LTEnzQUTTg6OwU4gAIao=;
	h=From:To:CC:Subject:Date;
	b=QX6HnDSFstWjhl3Na2VLK5e1msp0nT0IBOdbNL8iAp8VW5uZV6DmBaoiriOzjmoKo
	 /PKypUrv28UApFjGZ7N5lP1yiKcwc4uqjbhq0GHCIORj5Fz+/T6tnWcuKiSr8KpPVf
	 Sclh8z15/11XDoOhtS3JPoNZeM4H9qD4ZAd3GE6U=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58897q372856541
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 8 Sep 2025 04:07:52 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 04:07:51 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 04:07:51 -0500
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58897p2J2355770;
	Mon, 8 Sep 2025 04:07:51 -0500
Received: from localhost (danish-tpc.dhcp.ti.com [172.24.231.152])
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 58897o8E023014;
	Mon, 8 Sep 2025 04:07:50 -0500
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
        Luo Jie
	<quic_luoj@quicinc.com>, Fan Gong <gongfan1@huawei.com>,
        Lei Wei
	<quic_leiwei@quicinc.com>,
        Michael Ellerman <mpe@ellerman.id.au>, Lee Trager
	<lee@trager.us>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Parthiban Veerasooran
	<Parthiban.Veerasooran@microchip.com>,
        Geert Uytterhoeven
	<geert+renesas@glider.be>,
        Lukas Bulwahn <lukas.bulwahn@redhat.com>
CC: <netdev@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>
Subject: [PATCH net-next v3 0/7] Add RPMSG Ethernet Driver
Date: Mon, 8 Sep 2025 14:37:39 +0530
Message-ID: <20250908090746.862407-1-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_020824_548334_883A2B5C 
X-CRM114-Status: GOOD (  18.73  )
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

v2 https://lore.kernel.org/all/20250902090746.3221225-1-danishanwar@ti.com/
v1 https://lore.kernel.org/all/20250723080322.3047826-1-danishanwar@ti.com/

MD Danish Anwar (7):
  net: rpmsg-eth: Add Documentation for RPMSG-ETH Driver
  net: rpmsg-eth: Add basic rpmsg skeleton
  net: rpmsg-eth: Register device as netdev
  net: rpmsg-eth: Add netdev ops
  net: rpmsg-eth: Add support for multicast filtering
  MAINTAINERS: Add entry for RPMSG Ethernet driver
  arch: arm64: dts: k3-am64*: Add rpmsg-eth node

 .../device_drivers/ethernet/index.rst         |   1 +
 .../device_drivers/ethernet/rpmsg_eth.rst     | 424 ++++++++++++
 MAINTAINERS                                   |   6 +
 arch/arm64/boot/dts/ti/k3-am642-evm.dts       |  11 +-
 drivers/net/ethernet/Kconfig                  |  10 +
 drivers/net/ethernet/Makefile                 |   1 +
 drivers/net/ethernet/rpmsg_eth.c              | 639 ++++++++++++++++++
 drivers/net/ethernet/rpmsg_eth.h              | 293 ++++++++
 8 files changed, 1383 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/networking/device_drivers/ethernet/rpmsg_eth.rst
 create mode 100644 drivers/net/ethernet/rpmsg_eth.c
 create mode 100644 drivers/net/ethernet/rpmsg_eth.h


base-commit: 16c610162d1f1c332209de1c91ffb09b659bb65d
-- 
2.34.1


