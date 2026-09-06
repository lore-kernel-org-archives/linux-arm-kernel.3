Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DD9C79F91
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 03:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xla/JA8zdMSQaY1h966vrateHhpYdu5ftLHdq3sp/qM=; b=KVzeSURhpCquONkpdTVvadeAL5
	AFuDkoYOoUftWB1oFph6vs6PdDfzqNeHgTfKevRy85KX2tCZUJqnZCaZb0l8f9QLPFENtkQTr8PqK
	TwjIvW3BdMavS5sYOt8eqwpRvCJpfdTP6PZVxHeOYJDcTUf6dPiOpAzFV7IgzHqE9zcxwTB3wD9i/
	SIbAdz3Itwngr74ATYmYpgvILMefBSzk7pxowNam9KVyNxXNXLBrHx+rWOpNpD7oTDFRsnmNhxdHV
	z6f5296yLtrN+xn0RQbxAw4ZoSVPXxqOJsDXFnFLdPWV5t0dApleCcKFhOANQDpBFbCg546MGFfyB
	DdDYXUsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x33Ut-00000004cBo-1DYg;
	Sun, 06 Sep 2026 03:24:47 +0000
Received: from mail-japanwestazon11022094.outbound.protection.outlook.com ([40.107.75.94] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x33Uq-00000004cBJ-3sJu;
	Sun, 06 Sep 2026 03:24:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AGHfKhkI53P/F5dDXu3fTKukWlBtoWr92R31axdQWMJlb0o0jFpBlBPU787yQfl75IG9Z9kqoe65ssOx9CrXXh8OZILzuksQIhSMbVwsVJClScEhLhp63xt5SrD++J/+1ll1ZLP1cvANawhYzfRFb2UYWoA5m1b1/MTrqvTfTGFth2QM9ledlq/tHx835lqZ9/uEgceHiQ9ELdZ1Twlmn393sgUhXOE+E1TImSBCtTkhA4AoVk2T9giErtpILBdjyT9a439WqgmF55LnC6YzM8C9qm0ppAl8InZhmp2r74ICUgVZUJINXurgE+htHgxj28i9YJ1rBP8qLNf1PEgbWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xla/JA8zdMSQaY1h966vrateHhpYdu5ftLHdq3sp/qM=;
 b=fAf12G1l7rQ20LNzziQENcZLnlm1EpEfvcBIu/tekiehPYhZ/dau5+hAPH0zZqog3dXSzE/FLcgL1/OgbfVVlqoklASNtVrR85UVdpKq4t7sujtDm5jUvY132iOOnM1lj4Tw+rlpP5iJnlyjtRezXWsXAGwfYrNw1hKyduljlju3rZF2Z7fQUJMKPCUlsmYf1L+krOZ1IggXVlsb2Ll3Ds8NvahzmTuHElfYFTR4jPz2Eg56LICKFEGGItoJs6Hzst88qAY3NFyiZtujKeiXFOzg173jWhQKnabTLPXdiDq+ON0a9jl+fKx0Ols7egWwtrOfqgwmIvKNYJik7x6yAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from OS7PR01CA0039.jpnprd01.prod.outlook.com (2603:1096:604:257::13)
 by SEZPR06MB5341.apcprd06.prod.outlook.com (2603:1096:101:7d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.14; Sun, 6 Sep
 2026 03:24:34 +0000
Received: from OSA0EPF000000C6.apcprd02.prod.outlook.com
 (2603:1096:604:257:cafe::9e) by OS7PR01CA0039.outlook.office365.com
 (2603:1096:604:257::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Sun, 6
 Sep 2026 03:24:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C6.mail.protection.outlook.com (10.167.240.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Sun, 6 Sep 2026 03:24:33 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 05D28409210C;
	Sun,  6 Sep 2026 11:24:31 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: peter.chen@kernel.org,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org,
	krzk@kernel.org
Subject: [PATCH v4 0/3] Add CIX Sky1 USB3 PHY support
Date: Sun,  6 Sep 2026 11:24:28 +0800
Message-ID: <20260906032431.470744-1-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C6:EE_|SEZPR06MB5341:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 88844792-68b2-4d5d-8692-08df0bc65f1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|7416014|10067099003|56012099006|18002099003|921020;
X-Microsoft-Antispam-Message-Info: uztLkdxoNL/Qu+dLEAuuPvp0EUBmhy+HyoOF8gorMjE/QKiAeYJ+T9cNi00i06L0N3IiXwaCsCUu2i3csP228GNZ9GaBJt4AYNDiVvVouiGOF2zE0W+5M5SchYq9E5lY2PGa3rmP0mQx913LIzsU4F67hGa9VLuVGGKny7jHoeMzUHSJTNSaVGTcUJdhFU8IV/i5oSxVQfMD8VfXfCNjVpas41SdzCjulZoqjQsMnZkHdWdRQE7f96iQpBgKtmlXcnTmRP1Yw4pslnDRk3UFyNH23om49ZjPJylzT45g2OaZGfD+4EHO/mDGKlrY7scVZEs8AQqYjxRj/y+4ZL8uUyBMBoavmT6kcfL4l/V+jJ5cS1ZrageL+CPoeRfQxpZOtSYry0cpu2m8xkBt7zdTdPgqeU4I/8UDEafW+t8LGiRzeHmTYDKvIoZL5i7DAgPFmfe7oCZig6SEisixEEDjVgCHA1AMwJw2AXRjgO0z6O5wrv+V4TSqI+KhRaf+8Vq+bHhTc8W/oVNd/PgwCIe3UJnZkx2Ic05WtgI8XjBvPG28Xma7jk5PBx7R54QieZvemLwF9JbU5lMkZ0d9peZwKVc7fVe5R0+gAn5jELdtdaXIV9ApCoRS+zp6i8HsyYs5EZ4wc6iAWhxexsJvcdirRmb50/XUgwj/+689KmPzstMtPaAGrX//DjcnqB04e1eN0ktgUk7uc44NTUDiogK8W4SIRm/VNtA/eEnXv5kTYtA+WDpVDVBn5bod+b0zcKhF
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(7416014)(10067099003)(56012099006)(18002099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: zrV9AlU9VA/rL2wVOACxoDII48DIP12hMpBrvXP1h1INYME6uToHnr3PvHOB/Md9cuKeBRhpbu4+47YAH9ZNESmp/4tJq+cf7dio2voiZFEWwO/XCvLd4YyZ0CzTigkpjeSuDcmKCtukbFRnMrla5PXLEb25xl1+45Oqp0QShCbUEq0yPp4H6vawRegVkqfz1Nvc5UNgxwq0wuMdPgAGOkbDmGVyGFBqYbjX7qyhcsSl+7Ip+B/hp302quHAprTwQSyI+TEOQW3yC0tLJ7H1wODygGAFgdW0+m8KsXGXbqOG1YV0jotSXsr4kgbk8lT/q5SErpin8lTSoWMwMRjutzrAbSOu79iNvXs38LaXguXOQoZFKcMgiWLIrHaAsKwwehN+3/v/OfdMvi+dped2B4OfKFPAkcAki+lJDajIQM/uM+mIUauvbypnr64IHCot
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2026 03:24:33.2834
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88844792-68b2-4d5d-8692-08df0bc65f1a
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5341
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_202444_965571_F38765F5 
X-CRM114-Status: GOOD (  12.14  )
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

This series adds support for the multi-port USB3 PHY found on the
CIX Sky1 SoC: the devicetree binding, the PHY driver, and the device
tree node covering the PHY block that serves the USB4 and USB5
controllers.

This is the first of two series; the USBSSP controller (Cadence DRD
glue) series that consumes this PHY follows separately and depends on
this one.

Changes in v4:
- Split the combined USB series into two: this PHY series and a
  separate USBSSP controller series that depends on it.

USB3 PHY driver:
- Assert the hardware resets before registering the PHY provider, so a
  consumer cannot race with the probe-time assertion.
- Disable the clocks in LIFO order (ref before apb) in phy_exit().
- Reorder the error unroll path of phy_init() to assert the resets
  before disabling the clocks, matching the teardown sequence, and fix
  the goto targets so clocks that were never enabled are not disabled.
- Check fwnode_get_name() for NULL and only match "usb-port@" child
  nodes exactly, instead of any name with a "usb-port" or "USB" prefix.

Hongliang Yang (3):
  dt-bindings: phy: Add CIX Sky1 USB3 PHY
  phy: cix: Add CIX Sky1 USB3 PHY driver
  arm64: dts: cix: Add USB3 PHY node for Sky1

 .../bindings/phy/cix,sky1-usb3-phy.yaml       | 107 +++++
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts     |  12 +
 arch/arm64/boot/dts/cix/sky1.dtsi             |  31 ++
 drivers/phy/Kconfig                           |   1 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/cix/Kconfig                       |  20 +
 drivers/phy/cix/Makefile                      |   6 +
 drivers/phy/cix/phy-cix-usb3.c                | 413 ++++++++++++++++++
 drivers/phy/cix/phy-cix-usbdp.h               | 289 ++++++++++++
 9 files changed, 880 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/cix,sky1-usb3-phy.yaml
 create mode 100644 drivers/phy/cix/Kconfig
 create mode 100644 drivers/phy/cix/Makefile
 create mode 100644 drivers/phy/cix/phy-cix-usb3.c
 create mode 100644 drivers/phy/cix/phy-cix-usbdp.h

-- 
2.54.0


