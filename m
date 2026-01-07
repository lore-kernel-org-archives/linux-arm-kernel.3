Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF3DCF6BE3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 00:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i1MUXHd25FC+a2RvmYJ4/KaXizY38zHqhcZUTckdJcE=; b=x+DBayNsRYliFL
	i40/97qQULfZg9ec+aCep5HM2lL0FYtMonc5FvdTxofNmlcpoiQJkqFR8mb+xLUkg0G4Nk4Aow3ar
	nPoNgCtP0SFMqTSNiC8sn5WvxY9yOCq8cHtJLca0Oby+mwPQbgMvpYcBTos2cvOxx0lQM4E/JyvDm
	e4Pb2e3sSsALpVm30l2FXCab47Dndye6I/UgMcbUUEKnJweJdISYfszw9Q7QcN7lcs3llN4P5fCOD
	mTcMFlqqJHB+DGxX0ih2jaQpPnlwbl21psW1mJn/6lBvhMaWDP4tX16JbkgUg6KoGGKfXOICVa/Pl
	7JCpXD6gsVVxvSfekjAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdHdX-0000000DyWW-1G1H;
	Wed, 07 Jan 2026 00:42:55 +0000
Received: from mail-southcentralusazon11012008.outbound.protection.outlook.com ([40.93.195.8] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdHdS-0000000DyUw-35OY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 00:42:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yuoQ+dYn/lXDyQBY9CysNQTdRmEwMmpzdpvcm0j0ufR19H8fOAgXhCGse5cmnzO9pnD/NU35yQotEl6MIvnO12ZAyNiKPLVM9fOWDpC5dtYFAbaEU/Zea0BhJfdU6CztVdDcSbLlj2sy79a0msuIAANzoA9NitZ11Jk9/VF7krcPi0d9pjLWTtbAbGTSLd/69OXEHPMVk1IEsWLO6yxX8ihf60NQr9WFcypw2KIYVRElreAqiv8kKTovF2fdeHXloU0567QrNOKLPdBqE80Ypu7jVlL1DZvnDKAY3LxbpKsMBLLt3Ds2SoPTEWVe7/2Gem7sAhI44h5kdnvBVdaW3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i1MUXHd25FC+a2RvmYJ4/KaXizY38zHqhcZUTckdJcE=;
 b=e07hCPhsiDRYEbpIYbo0LIBV76nXX5B1LwL6pjSLuJTlP7rl6KoaIz3cLwdvCUj7OiHuh8NkSBbdkODYrR5JoCHrR7YZTe8V1p3eZfnOIb2iHslpDrZ/NWeDr9hgsrrFkV3e4duYLXs4R4qYP7PbR37SV5acS6Wp460xf3TV8HMckOShXjyuvQuL5/Qwl6oIEKNibB9dhHELqhi+XT24eVLwBP4L+vrL8Axv+XIf3dYSu4iKMgwPlehK1ngusaYMr/H2wIgles1poJvwS+tZP+fLwfsCMdgDcLeOSAD4RYA3vSoLtrF47M12TM3sMK9qDAUnS128PUkGJJdWoYeatA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i1MUXHd25FC+a2RvmYJ4/KaXizY38zHqhcZUTckdJcE=;
 b=gjtv7AyIKyvi5JcdxPKLyR+MYI1mWZwgTUfb9v+bIYS8u1x1Lw+9a6dRAh7LPAJzFXMMsatoGUQ4D78ibXGO9noZ4SWe3yv1ywXnAnHxMkDKIiDzve9ca/9ilfd6YHiiNft/aWJD0uPC83yX4y9YlSgXwQhSAQgYeJWKTCx4pN4=
Received: from SJ0PR03CA0245.namprd03.prod.outlook.com (2603:10b6:a03:3a0::10)
 by IA0PR10MB7602.namprd10.prod.outlook.com (2603:10b6:208:488::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 00:42:41 +0000
Received: from SJ1PEPF0000231A.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::ad) by SJ0PR03CA0245.outlook.office365.com
 (2603:10b6:a03:3a0::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Wed, 7
 Jan 2026 00:42:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF0000231A.mail.protection.outlook.com (10.167.242.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 00:42:39 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 18:42:26 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 18:42:25 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 6 Jan 2026 18:42:25 -0600
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6070gPrI3856461;
	Tue, 6 Jan 2026 18:42:25 -0600
From: Kendall Willis <k-willis@ti.com>
Subject: [PATCH v3 0/5] arm64: dts: ti: k3-am62: Support Main UART wakeup
Date: Tue, 6 Jan 2026 18:42:17 -0600
Message-ID: <20260106-b4-uart-daisy-chain-dts-v3-0-398a66258f2c@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOmrXWkC/4XOQQ6CMBCF4auYrh0ynbairryHYVGgyEQF01aUE
 O5uIdGtyz+Z+fImEZxnF8RxMwnvBg7cdynUdiOq1nYXB1ynFoRkJCmEUsPT+gi15TBCuuEO6hi
 gRmmtRrPDkkT6fnjX8HuVz0Xqxvd3iK139ufhATVJ2lOeqVyhkhokXOHFtxuHU+Ss6u8L1XKIv
 R/XjQMt4P85AwFCYw2Z3FVGl+XXK+Z5/gC0SNSF9gAAAA==
X-Change-ID: 20251230-b4-uart-daisy-chain-dts-d01aa40560b2
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<d-gole@ti.com>, <msp@baylibre.com>
CC: <vishalm@ti.com>, <sebin.francis@ti.com>, <khilman@baylibre.com>,
	<a-kaur@ti.com>, <s-kochidanadu@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Kendall Willis <k-willis@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767746545; l=3264;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=YbyAcZHoCJC1sioEFS+4N9K5pa2kOECmO2VEVZMXmQQ=;
 b=bmPGjh4t4vhZQM/EXgE/BIJ7HjH4epJH7LDCSu9aFYBWCiwId9HWdhNGyt2O9nSc9pcftYl8m
 FOSSC4GOhINBMUn0B49L0mZaA1+Nj8kBK9hK13FQjxBBEpDf88RC2SW
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231A:EE_|IA0PR10MB7602:EE_
X-MS-Office365-Filtering-Correlation-Id: d2d77c88-fe0a-409c-d534-08de4d85a8c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RDc2eDRvYUZKSHJHZ0lFVm5FUXdBUmM3QlBVWHJTUE4xM2d6ZnVZVU1XbUNB?=
 =?utf-8?B?dWpPVEZ3ZEpMSFFFUHJIYjNLYjlCbUtNUFR2eXNFNkhUUHhzaUwyZitLVUM5?=
 =?utf-8?B?MDVNTGdpVFlHb2xSbi9IMlE1WSsvOFFaK2ZUS2swbEZVQ0Nrd2llZTRnQXJG?=
 =?utf-8?B?cjcycER4YlJjVEltQStFc3dWeWZaamo1MzlPc0J3M3lqT3pKakRLNnY5VFRC?=
 =?utf-8?B?azlzUFdRdlVYdmFyaTYwNllhTVdpazdKenBnVU05QS9qek9QOVU5ak0xdGlG?=
 =?utf-8?B?Y05PR1RLaFVNUWttZlNTalZhUmlNUGRGdzBwdE1mYXVuN0FBZ1EzMWlFdWlE?=
 =?utf-8?B?TUV4U0JIczNnMGd2K3dMc04rckc1cjc2czlPSzdtK3dBS2tNRDFFeHY0RU0r?=
 =?utf-8?B?ZTJGTVpEbXdTejkrS0hCZC9raEJOQmpqSnp5R1plNW9qNFNMV3BRVzc0QXd6?=
 =?utf-8?B?TkxRMGIzSDdRR3VLRWpKTHZxUmhxOTBLcGh2aE94cmFscW10K0d2SXkreDJU?=
 =?utf-8?B?L1pXdzl4andnUTJnOHVtOC91RVZkTkJMckNJY1UrZ0o0MVpQRlZaY2oyZFJG?=
 =?utf-8?B?L3pXVlNNTy9pbXZPckQxZnJPMHZSMzhIM09NMjAxbTJGQUJFM3lXN1FxNmo1?=
 =?utf-8?B?KzNEU2FNK0xnOUpsWTdERXJIclgwdFN3Wm5wZkM3WTZtZEVnZmZ1MXduUkJY?=
 =?utf-8?B?R255Zmc1NFA2NjVhNVU1UUNBUVA0UzU2M2toNjNoOEpzajJDTndIR1NyM3lv?=
 =?utf-8?B?TUtDbFp5czdCZUNBRHJuZ1hFOHFjYXdpdWlzaXBOZjJ6cExzRmR6NktEWktE?=
 =?utf-8?B?OXQyaGVWbTBLWmxGUlB4Mmd5ZTVnSHorYW5QSEx2WEp4WHVSTHVkZnFtRE5O?=
 =?utf-8?B?TElEL2VjTVAzOHJrWUJsOS82RkZsQzVjNWlFRExJV2s3SFl1cXU2ZHRPUmNp?=
 =?utf-8?B?bnBtU2oyMU9vQ0hQcVJLYkhXd2krNENZQy9HWlpTZ1R5cHJXL3pkWUx4Q210?=
 =?utf-8?B?NldWOTI4YlowZ2FHSWdpZEZaL0hyTU5FLzVzYXR0eHM4ZHlSaUZMblVrcmJR?=
 =?utf-8?B?dWxEM3RXU04xWGg1ak95Q05kL0FZNmRMb1lVS2NURU5yQklkTEdEK1Jtd25W?=
 =?utf-8?B?ZnJDWTNEakhvWHh2NlZ0cW93aHJRUVBQbVBlbnBxZUc1M1M3TFRFQ1hjdi9j?=
 =?utf-8?B?eTR0Y29GZkFSUFJ1SkpRZEpsWGxJRWQrMEVKbnpUcy9DUXh2OTZTcFBvT1dU?=
 =?utf-8?B?MXRINXM0QTRwdDJWUjdDcDZaVkVXbTUwOEVKTGZUVHBjNFJHcmxvNHB3L2Y3?=
 =?utf-8?B?NFFGR1JCbUJTSzhlcGNiL0x5ancxYWQ2M294NkQrUHlqUDRGYmc1cEhJaFVT?=
 =?utf-8?B?a1JadTd4RnQ5VWptbktvQlBHOVZ4RHg3VG8zR1ErSUdNL3c3aFdGdnZUOXpo?=
 =?utf-8?B?TVRNeHk0aW1DL2ZnYVhBRk5sL2ZGZ2wrOUlxRC9ZZ3VnRTlxZEtQanNnS2lG?=
 =?utf-8?B?UFlOMkVmbzBQeEk2YjZ4dStac0J1ZVYyMVZrYlRySWZJVkcrM0lXcnpVWW1r?=
 =?utf-8?B?RlRGUU1kUDIzV2ZkZ3NLSjZYb3lDdmh1cU9ZOVlrM3hES01TWVBucndISkNU?=
 =?utf-8?B?a3JmVmxObUhJL0JueVkxc1U2ekRpSGVEM29lWXlOK1FhZDBES2FjOXpsc04v?=
 =?utf-8?B?bVdYOVpxd3JjRXJtRXJDK0g2L0h1czE1Sk8rcU11Lyt5VHFmRlVZdXRiS21k?=
 =?utf-8?B?bEx3bDBPejUzZE1keXJIVHI3dm5EZFFYMmdSbmV2M3JpcC92ZXJrTzhaREdv?=
 =?utf-8?B?SWh5TDlyckxrWXdybXVZaHBuTWpkR2RwQ3NKRzdrVlNidmgzV0VRVWcwMmRv?=
 =?utf-8?B?elYyMVBKQjgrci9Memw3c2hhT1BxZk1SeHkrSzRCaDhSZ3ZUNWFCNzc5ZmNS?=
 =?utf-8?B?QmxVclUzdnVrQ1ZPRWYxTGxLZFdhNUlLck5ybmdta2xMS1ZqTnNQNk0vdWVE?=
 =?utf-8?B?V2pqcGl2SiswUUR3ZzZHWW1LUEFHYXdtRnhRRlQrQW9JS3l1UFR6M2J3Uklt?=
 =?utf-8?B?bTFEeHhvZnMrbUppL2ZJanBPanN3QXJZNFN1QnJpbGRMeGovQ3NjNEo0Y1ZL?=
 =?utf-8?Q?GvbM=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 00:42:39.0247
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2d77c88-fe0a-409c-d534-08de4d85a8c8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF0000231A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7602
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_164250_789064_92DE3298 
X-CRM114-Status: GOOD (  11.35  )
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

This series adds wakeup support for the Main UART in the device tree of
the TI AM62 family of devices. It defines the specific pins and pinctrl
states needed to wakeup the system from the Main UART via I/O
daisy-chaining. The wakeup-source property is configured to describe the
low power modes the system can wakeup from using the Main UART.

Implementation
--------------
This series is intended to be implemented along with the following
series:

1. [MERGED] "pmdomain: ti_sci: handle wakeup constraint for out-of-band
   wakeup" [1]: Skips setting constraints for wakeup sources that have
   out-of-band wakeup capability.

2. "serial: 8250: omap: set out-of-band wakeup if wakeup pinctrl exists"
   [2]: Implements out-of-band wakeup from the UARTs for TI K3 SoCs.

3. "arm64: dts: ti: k3-am62: Support Main UART wakeup": (this series)
   implements the functionality to wakeup the system from the Main UART.

Testing
-------
Tested on a AM62P SK EVM board and a AM62L EVM board with all the above
mentioned series implemented. Suspend/resume verified with the Main UART
wakeup source by entering a keypress on the console.

This github branch has all the necessary patches to test the series
using v6.19-rc1:
https://github.com/kwillis01/linux/tree/v6.19/uart-daisy-chain/all

[1] https://lore.kernel.org/all/20251230-pmdomain-v1-1-3a009d1ff72e@ti.com/
[2] https://lore.kernel.org/all/20251230-uart-wakeup-v1-1-13f1bb905f14@ti.com/

---
Changes in v3:
- Reword commits to include the logic of how the "default" and "wakeup"
  pinctrl states are used.
- Revert pin logic so that main_uart0_pins_default and uart0_pins_default
  are untouched.
- Remove main_uart0_rx_pins_default and uart0_rx_pins_default.
- Combine main_uart0 RX wakeup pin and main_uart0 TX pin into one group of
  pins called main_uart0_pins_wakeup or uart0_pins_wakeup.
- Revert pinctrl-0 to only include main_uart0_pins_wakeup or
  uart0_pins_wakeup.
- Change pinctrl-1 to only include main_uart0_pins_wakeup or
  uart0_pins_wakeup.
- Link to v2: https://lore.kernel.org/r/20251230-b4-uart-daisy-chain-dts-v2-0-fa5257ec54bb@ti.com

Changes in v2:
- Define AM62L system idle states
- Enable Main UART wakeup for AM62L SoC
- Rebase to v6.19-rc3
- Link to v1: https://lore.kernel.org/all/20250904212827.3730314-1-k-willis@ti.com/

---
Kendall Willis (5):
      arm64: dts: ti: k3-am62l: Define possible system states
      arm64: dts: ti: k3-am62x-sk-common: Enable Main UART wakeup
      arm64: dts: ti: k3-am62a7-sk: Enable Main UART wakeup
      arm64: dts: ti: k3-am62p5-sk: Enable Main UART wakeup
      arm64: dts: ti: k3-am62l3-evm: Enable Main UART wakeup

 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts        | 13 ++++++++++++-
 arch/arm64/boot/dts/ti/k3-am62l.dtsi           | 12 ++++++++++++
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts       | 11 ++++++++++-
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts        | 13 ++++++++++++-
 arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 13 ++++++++++++-
 5 files changed, 58 insertions(+), 4 deletions(-)
---
base-commit: 6cd6c12031130a349a098dbeb19d8c3070d2dfbe
change-id: 20251230-b4-uart-daisy-chain-dts-d01aa40560b2

Best regards,
-- 
Kendall Willis <k-willis@ti.com>


