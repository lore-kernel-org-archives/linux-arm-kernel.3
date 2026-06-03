Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBEFCD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2py4VN/SLkkGeOA08kiZdzCaySm5ENHonwciiqcC1DM=; b=0mfUdBSaBv+OPdCK10dqEWMoTB
	hXFdG8LNtRS7rf0ZdFI26uAKL03hY/OXpph5QvwiWSQ6eaNfyHRFU0dwnefUZ3wh2ey8VDwhtmI9m
	JN06xdh6rN4v0JaLJoazhMiayieIEnWBSRCj6I0NmUaVyDEDYBMOreIaOjUFLKlLtKPTImx4Gf4Ua
	T5sqyKDtmgE3OqAn0+ykve6EoycbWHW1se/1hZ3brm6pl564AI3oildtQtkUhQBBuVoiYXEDjoybV
	k8q8s29ECji/8p8OO7tfnwR/47lQ38yz3hk5MQj5qyNfW+epm6yzTnHz1rg3up8dmauphf2xxVuL+
	K9pz60YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUniX-0000000FRDo-3NXI;
	Wed, 03 Jun 2026 15:41:17 +0000
Received: from mail-westusazon11012059.outbound.protection.outlook.com ([52.101.43.59] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUniV-0000000FRD5-0T7u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:41:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bvkh7TsKCRjsJWj2qKRuJU1JM8cRJgssKOcvCQ2KWbm2/z5R/z5QCevhcaD3FqM1D0P1zGElKijF/+LHWC90X5Xm3+2tjkikxB3jUVsDVZkvcUtLtG9gAMOOSWYqnipjkZdbl/FtbulmjG49H939VYWNwyh/CALDkBdGkgCQQf+vl1ZeUPfgPCmhTnt3sDAQJxW75oEzhGfCTTaXDKi6HoHE2waXH77r4Kt7nf7+QRgryOPN6+JPyQ35EFubcLIJeTdcqzwDCvW14875I2v2fgW+iyJHW/fNqR7+yAqhhC6Fm5OlqRjpQMFqu5mUlOvozNsdEKTmdprG8QH85xbdEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2py4VN/SLkkGeOA08kiZdzCaySm5ENHonwciiqcC1DM=;
 b=IcOfuh4FGxIO90nvarEvv4C7Tntyc/LPlOHnJT/F4GWtDppfsgy4nnpxm2SYXu/a3UgL/r326hi8vu54yIBUYbFZteprBAL1p7RrBVoNokRGVS2T5KS0cf+PxtmaMi/yoQgTkLTwHCeG741yDIlDrJ0WmiwdmXyGx/0/eeMcXy7eJ9MG1Rb9AFymET26JJyguooi3rIgpOGKEY5iD7yjKVyDyc9pmL5aJRuD/PD6nlbBnpI8+siddTlkgILzeDmVHDEJXH+zmkMk9DGw7EMMA3VCcO4aNXKgaXfQLQM3KkZ0Ibv4VqMwCwxK6pH3frM+WjnZP+Wz5aerqB68PtRYzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2py4VN/SLkkGeOA08kiZdzCaySm5ENHonwciiqcC1DM=;
 b=o9Ie56xrgXzOYsel1+OujQBTR6YBvx1RUrCkcW03ESU1HYJjih9Kq7K7tmLDq0un50/qnt5bD9hYLR2Uwl/pa1TjFv5k4Ko60vsqYnP8Qo8SvKCMQZ0o3D+rw6vvyPJLpzxn+TGK0iHTRmqvfEcN8swenjFku/Oj6kr84OuAXtI=
Received: from PH8P223CA0017.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:2db::9)
 by BLAPR10MB4913.namprd10.prod.outlook.com (2603:10b6:208:307::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 15:41:08 +0000
Received: from CY4PEPF0000FCC0.namprd03.prod.outlook.com
 (2603:10b6:510:2db:cafe::a9) by PH8P223CA0017.outlook.office365.com
 (2603:10b6:510:2db::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 15:41:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000FCC0.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Wed, 3 Jun 2026 15:41:08 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 10:40:41 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 10:40:41 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 3 Jun 2026 10:40:41 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 653Fee142030698;
	Wed, 3 Jun 2026 10:40:41 -0500
Date: Wed, 3 Jun 2026 10:40:40 -0500
From: Nishanth Menon <nm@ti.com>
To: SoC <soc@kernel.org>, <arm@kernel.org>
CC: SoC list <soc@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
	Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Tony Lindgren
	<tony@atomide.com>, Santosh Shilimkar <ssantosh@kernel.org>
Subject: [GIT PULL 2/2] arm64: dts: ti: K3 updates for v7.2
Message-ID: <20260603154040.ma5wevf3zwxdbkeb@requisite>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pdhvyw5r3guyaws3"
Content-Disposition: inline
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC0:EE_|BLAPR10MB4913:EE_
X-MS-Office365-Filtering-Correlation-Id: 43c02c96-9e0a-4858-6b61-08dec18687e4
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|18002099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: yHYnqW876mFcpSM51OIXDviBl5qO744Cywoqx6lHKrARAkqENF4MKSRqzZ7Suun/YBsi/PaYq1L4mhTfv3J9YHkW6Nldo1wvtlqaV14JppuUHzGNzoiimDAI3/Ad75bsDjsnvYAeHeTzY/VeZpOowyDyYnCc79xlP8RRQi+cwJNihxgef9yen65UyQ9Pb5znJr+rsQSTqTFD2UUjqHNC11FhUhHv1ve4h2DTCy8PlfUjz/waYjYHNcLv1LKKMxaHBGYfdIhzGSlsirDIqn2Behtx9+EvttNrLKG6/gj1AUAaaxUiZ2K+oIN/oRvppAaK3+CdhGEWMfGwq7sznRXgOq9LwpChwzvUDn7aGwWFHBNFGazpFdlN1HeXqxNeN0vVCVJSeKkpx1qlgqa5kIYHYye9Nhx7zVX7yPY2BRQsjR0gB66ld8Yi2EhsR5ZdLiZZ6BAxOQjUtOUMwa7ykD/iICny9TTq3a7wHmXR+FGReSugaz5kh53Ep5AtLFkzFYTcTgXEduB2gnCFdf/eaxxuKhaQryHiYM48aWFdks0S0+drzI5U59cZS5UbZmwy0wbzF12Hr0sfZJBZKqO96Z5k4++8PVa2j+20YOq1lvlrVLIMn0MWAvwRRjPx1Tj2R4svcsCFJJf8lx44ZEFKq7atuTodDc+NKpvssQqnpKVJdoHQb+Cxbpt3q4fFuYJLqPNNBMZjGf+S05uNm139o7mJp4+IXvFfwBxVVuO1HeXwVkI=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(18002099003)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9JoYv/AA7wqQmL4hmvmN970ULl6E8UuiG0c8tkHNLyJsHlFPO37NSAgm0x2ctEiBoi7NNkbQLOJpfNcR9ysNNoIU3mqIjZBdTeUhrjAprAZd3krNmFak80dCNawj+dqFLQXGVLldISDGFSjkjyKSYoBkgcNxghg56703Vpf9rZpc/At/HKPbP2eBIkzTPa2O6NJLYvaCo6NogUbdfwkURfrgjz70q5LdAwJ7bXXqE/ocIybO6xgwhtVyRgd3I7uV2mAGw0BGSbKQuSyEyGi3taqAYpkl0ZBypn9sn/xY3Ui9WQqoqC+0EJfsvnwBmoIdrFoczr61fwPmBsVyBEt10r2jgEI+senEAHnof74qiWUNT63Nn5ixMHqfvx1mY/EY5bLIDAxz7Kza7VfvOqBxA1qxRF1JWC4CM3DaPNlfclS0lB4iF7wHBUSCFlHRaFuM
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 15:41:08.1958
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43c02c96-9e0a-4858-6b61-08dec18687e4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4913
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_084115_161352_F0CB5AED 
X-CRM114-Status: GOOD (  14.93  )
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

--pdhvyw5r3guyaws3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi ARM SoC maintainers,

checkpatch and dtbs_check reports the following on v7.1-rc1
ti,j722s-wiz-10g ti,j722s-phy-gmii-sel usb424,2514 st,24c02
riverdi,rvt101hvlnwc00

I picked those up in the interest of the community and these are clean
on dtbs_check on next-20260602, while the usb424,2514 and st,24c02
seem to be the usual regex artifact of checkpatch.

Please pull:

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3-d=
t-for-v7.2

for you to fetch changes up to 837c7dbc5bee260768333c1f985dd0688b5aff8a:

  arm64: dts: ti: k3-am62-verdin: Add Mezzanine with Toradex Display 10.1" =
LVDS (2026-05-29 14:59:32 -0500)

----------------------------------------------------------------
TI K3 device tree updates for v7.2

SoC Specific Features and Fixes:

J722S:
- Use ti,j7200-padconf compatible for pad configuration
- Add MCU and wakeup domain peripherals specific to J722S
- Use J722S-specific compatibles for WIZ, gmii-sel and CPSW3G nodes

Board Specific Features and Fixes:

AM62x (Toradex Verdin):
- Add display overlays: DSI-to-HDMI adapter, DSI-to-LVDS adapter with 10.1"
  panel, capacitive touch displays in 7" DSI, 10.1" DSI and 10.1" LVDS
  configurations, and Mezzanine with 10.1" LVDS display
- Add NAU8822 Bridge Tied Load audio support
- Add OV5640 CSI camera overlays
- Add Verdin Mezzanine CAN overlay
- Reserve UART_4 for Cortex-M4F use

AM625:
- Add support for TQ-Systems TQMa62xx SoM and MBa62xx carrier board,
  including new dt-bindings compatible strings

AM62x (phyBOARD-Lyra):
- Add DT overlay for Lincoln LCD185-101CT OLDI panel

AM62-LP SK:
- Add system-power-controller node

AM62A7 SK:
- Add bootph-all tag to vqmmc regulator for proper boot sequencing

J721S2-som:
- Add bootph-pre-ram property to PMIC-B for proper early boot sequencing

----------------------------------------------------------------
Abhash Kumar Jha (1):
      arm64: dts: ti: k3-j722s: Use ti,j7200-padconf compatible

Akashdeep Kaur (1):
      arm64: dts: ti: k3-am62-lp-sk: Add system-power-controller

Judith Mendez (1):
      arm64: dts: ti: k3-am62a7-sk: Add bootph-all tag to vqmmc

Nora Schiffer (3):
      dt-bindings: arm: ti: Add compatible for AM625-based TQMa62xx SOM fam=
ily and carrier board
      arm64: dts: ti: Add TQ-Systems TQMa62xx SoM and MBa62xx carrier board=
 Device Trees
      arm64: dts: ti: k3-j722s-main: use J722S compatibles for WIZ, gmii-se=
l and CPSW3G

Richard Genoud (TI) (2):
      arm64: dts: ti: k3-j722s: Add mcu domain peripherals specific to J722S
      arm64: dts: ti: k3-j722s: Add wakeup domain peripherals specific to J=
722S

Thomas Richard (TI) (1):
      arm64: dts: ti: k3-j721s2-som-p0: add bootph-pre-ram property to PMIC=
-B

Vitor Soares (10):
      arm64: dts: ti: k3-am62-verdin: Add DSI to HDMI adapter overlay
      arm64: dts: ti: k3-am62-verdin: Add Toradex DSI to LVDS adapter with =
10.1" display
      arm64: dts: ti: k3-am62-verdin: Add Toradex Capacitive Touch Display =
10.1" LVDS
      arm64: dts: ti: k3-am62-verdin: Add Toradex Capacitive Touch Display =
10.1" DSI
      arm64: dts: ti: k3-am62-verdin: Add Toradex Capacitive Touch Display =
7" DSI
      arm64: dts: ti: k3-am62-verdin: Add NAU8822 Bridge Tied Load
      arm64: dts: ti: k3-am62-verdin: Reserve UART_4 for Cortex-M4F
      arm64: dts: ti: k3-am62-verdin: Add Toradex OV5640 CSI Cameras
      arm64: dts: ti: k3-am62-verdin: Add Toradex Verdin Mezzanine CAN
      arm64: dts: ti: k3-am62-verdin: Add Mezzanine with Toradex Display 10=
=2E1" LVDS

Wadim Egorov (1):
      arm64: dts: ti: am62-phyboard-lyra: Add DT overlay for Lincoln LCD185=
-101CT panel

 Documentation/devicetree/bindings/arm/ti/k3.yaml   |    7 +
 arch/arm64/boot/dts/ti/Makefile                    |   67 ++
 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts           |    1 +
 .../dts/ti/k3-am62-phyboard-lyra-oldi-lcd185.dtso  |  185 ++++
 .../boot/dts/ti/k3-am625-tqma62xx-mba62xx.dts      | 1033 ++++++++++++++++=
++++
 arch/arm64/boot/dts/ti/k3-am625-tqma62xx.dtsi      |  360 +++++++
 .../dts/ti/k3-am625-verdin-dev-mezzanine-can.dtso  |   28 +
 ...-dev-mezzanine-panel-cap-touch-10inch-lvds.dtso |   98 ++
 .../dts/ti/k3-am625-verdin-dev-nau8822-btl.dtso    |   14 +
 .../boot/dts/ti/k3-am625-verdin-dsi-to-hdmi.dtso   |   94 ++
 ...-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso |  124 +++
 .../boot/dts/ti/k3-am625-verdin-ov5640-24mhz.dtso  |   17 +
 arch/arm64/boot/dts/ti/k3-am625-verdin-ov5640.dtsi |   71 ++
 arch/arm64/boot/dts/ti/k3-am625-verdin-ov5640.dtso |   18 +
 ...k3-am625-verdin-panel-cap-touch-10inch-dsi.dtso |  132 +++
 ...3-am625-verdin-panel-cap-touch-10inch-lvds.dtso |  120 +++
 .../k3-am625-verdin-panel-cap-touch-7inch-dsi.dtso |  132 +++
 .../boot/dts/ti/k3-am625-verdin-uart4-mcu.dtso     |   13 +
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts            |    2 +
 arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi       |    1 +
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi          |   32 +-
 arch/arm64/boot/dts/ti/k3-j722s-mcu.dtsi           |   15 +
 arch/arm64/boot/dts/ti/k3-j722s-wakeup.dtsi        |   18 +
 arch/arm64/boot/dts/ti/k3-j722s.dtsi               |    2 +
 24 files changed, 2564 insertions(+), 20 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62-phyboard-lyra-oldi-lcd18=
5.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-tqma62xx-mba62xx.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-tqma62xx.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-ca=
n.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-pa=
nel-cap-touch-10inch-lvds.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dev-nau8822-btl.=
dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dsi-to-hdmi.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dsi-to-lvds-pane=
l-cap-touch-10inch.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-ov5640-24mhz.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-ov5640.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-ov5640.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-=
10inch-dsi.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-=
10inch-lvds.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-=
7inch-dsi.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-uart4-mcu.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-mcu.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-wakeup.dtsi

--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5=
 849D 1736 249D
https://ti.com/opensource

--pdhvyw5r3guyaws3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAmogSu8ACgkQ3bWEnRc2
JJ1CDhAAgJPqPrEMnt3PnQcrNskB8aX8puiRUGISW1vFno3Hh1dMhKsI5WMt7W8S
8BG6Exah3fmXTiToQFpQojf1IC8w5vwKuvJw/Afn5cIIVQYSsfZ0AD+PszU9CqTP
6o1RTY6oKAdbKZAgBsrIMC6sV9anyGvfrn5Rq4gQThp/D654PWe5PoQ4UuEcDJbI
KjiexsanXsT7YDjNpayXsbcxrUY8v4pXq8s8d1L3eOi1dmz6Sp6fAZnPClyr/2Y/
B3Xzk+kM0c00w1/PWUAmyZ+JyZ0462alcI0z2l/LAiFqg1gmbyvpbaS5ptvSrLYN
nehO3B6C2ud5Hc96KbDsZwiQXuImuz4SW0wuX2CJoLySJ9HEkQ6s1CSi2iMeBpVZ
SBxXJmDkPDs3cZNJZpFUKRvIxFMxu6LRRXc3TIOMCjomDZBQG2n0Qa7LFG5ST2vY
eDWPIQ3abvDAh6aF6z6L0fldSwExp05vzDs7xEqFq6TG2B7Tznx6PHDUv/4KOz9S
Cg8Ab6rNS8wdD9Yk2Y8YGoUUtUUgRcxTFC/lzQDSZAiyahPFiKDM4T+zqOeMsYEK
VSJ9Fmb80rKag+GTKtyvYFL5NYed5AjgehKFzGBvTYbbUMJY2BbfnwVxmsFXPg1P
u0IfxVPeF4jYgXg1mCE6+WpRZ8V1D5pXz0vw1dXJf0AR/zr+kpE=
=s1D7
-----END PGP SIGNATURE-----

--pdhvyw5r3guyaws3--

