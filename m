Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035B9CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 10:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/YHAzXy1A1+gYGIdyDJ4FvpphIpEOFqBuMFIoEJ28Sg=; b=LE19NtE5reiSvuTodjeDxbi5ak
	r5HTeGkl6TPdBMSy3mE/ch3OmSUy2+TFlXSH9fUTOHEfRLYHGqszXw65fEO/vJLYh0WR0FgsXbuls
	K1t3fPvA1O0GyRhELyWIlfUtqxxMJxmPcuIle5yiTC7bA8LNVlnvBh+hsniKZ412paKmD7L14IdK1
	7jjfkqane+f573exgV3I85MnNSC8t1+lxk6CGuvzXqLRJjXwlHhzWy7GhGF1W8OcAhdBU+/dOI46n
	ZYlZq2KvHx9sfkErsjrbS5hhHvO1Y+qZksQds6v+z/M9k9JC3kET4vulF3uCbaq7YNHg0q+G2GZrA
	Y3BGA0Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3Jv-00000000iQJ-2dew;
	Wed, 29 Oct 2025 10:22:23 +0000
Received: from mail-centralusazon11011052.outbound.protection.outlook.com ([52.101.62.52] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3Js-00000000iN1-1K9M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 10:22:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P6u8+t+mB3IKdlMS2fj9cM27lVQCOsHfVfxFxHv3xpB/os1ny3dwJP+MVLw2XnIv76IuzPd7QVtuD+QjLW1OrMnpsOSsXjPWik3rPKm3sVl1WzZ/kYP6ZfP5vGtXRbbfwSFQaho+rDbm+QX8GSqUhEHM0LfZc3X2kUE4nFGI43sgt7iesrc54XB4Ie1G/30pD+w9DQTAX6i56Mrm+FzmY3lbQnY+3G/jltd8icpVjYsHakFmzrmuMDQEKEM8Z4kejzKaJFWUi9b+3j1BdKnnCn1/tbbmx7Mw7OgIQduskaqSOzmbo2ZJTWLChTKgCLOihx1xyAmfb29yv98xmV9G6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/YHAzXy1A1+gYGIdyDJ4FvpphIpEOFqBuMFIoEJ28Sg=;
 b=QfjZ0EA4y98v1HslNQPV2HefU06rdf5rKqZS9IeWmVF1b8HZoP53KZ7PdcGKuXUYsRpO3Ht3sUiQfqmFrmWazyaSPzV18vCR8OjHPBQZLcF3HT5NRCStQqq3QFvClfqvjrvUJp5MYFNOQFZnjp/LG1c0ekEXxDAOKU3eDQnM4D3afJ9gSiD2xWOspPfi9xfvSsTrgT0aWEkkFk7JHrj+H5T0JsvLNmyWxw9AXSQuNCW6cVkVfnScvZFLOQVvWTtzliB7JKYrcfYokWYr4N+gH9P5L+r5qSI+4s1xyBG2SpP0q15DQu+Kq/GnZhnt7OFgbDG/6GQuZnR4NnCPCb59wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gondor.apana.org.au smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/YHAzXy1A1+gYGIdyDJ4FvpphIpEOFqBuMFIoEJ28Sg=;
 b=N3tPPdimxtHMYgu6k0EF3Qx6KZ0v1DiaP2b7nhvn6VIX0QfckEN+J7xo4E6SEqLosDdLp0aMqVln71KDo3KVpRzoBmGn/i66RgRiVSkWNgj/X7jCOHQj4mKuWDIZYJsDI7TE7hMnAu7PS14742fKeR4MwKVWf55Qf7BkulDyXZA=
Received: from BL1P221CA0002.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::32)
 by DM6PR12MB4465.namprd12.prod.outlook.com (2603:10b6:5:28f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Wed, 29 Oct
 2025 10:22:14 +0000
Received: from BL6PEPF0002256F.namprd02.prod.outlook.com
 (2603:10b6:208:2c5:cafe::2) by BL1P221CA0002.outlook.office365.com
 (2603:10b6:208:2c5::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.12 via Frontend Transport; Wed,
 29 Oct 2025 10:22:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF0002256F.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 10:22:13 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 29 Oct
 2025 03:22:13 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 29 Oct
 2025 05:22:12 -0500
Received: from xhdharshj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 29 Oct 2025 03:22:09 -0700
From: Harsh Jain <h.jain@amd.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
	<linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<mounika.botcha@amd.com>, <sarat.chand.savitala@amd.com>,
	<michal.simek@amd.com>, <linux-arm-kernel@lists.infradead.org>,
	<jay.buddhabhatti@amd.com>
CC: Harsh Jain <h.jain@amd.com>
Subject: [PATCH 00/15] crypto: zynqmp-aes-gcm: Bug fixes and aes-gcm support for Versal
Date: Wed, 29 Oct 2025 15:51:43 +0530
Message-ID: <20251029102158.3190743-1-h.jain@amd.com>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: h.jain@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256F:EE_|DM6PR12MB4465:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e272ab1-9469-4dee-e917-08de16d50717
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|13003099007|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fOrP8FkWaTlGgTgEaNI0c5H8wBrh14Bu3/bx6+3SrrSdm7HirH4bU6zPu5F2?=
 =?us-ascii?Q?Thlbs6Mak08in1f2faMgtsTNg7OHWkBhpiYCKHyaR0qsViPsF4iPmckfYIto?=
 =?us-ascii?Q?lxVptNCFW/IhpO27S+yR70mgAA3PSR6IX7Bge5LWxyvszYsRKy2r74BjKBy7?=
 =?us-ascii?Q?TVy0YMHFK7J5eXG166BxN9d34rFOVydj2yuDyPotpWHyVoxx6qV5TwFqpE/9?=
 =?us-ascii?Q?DLChBv1GKpNW1+3J5B6chyNR2zKUW2Vy4vLT/UiOAHWMOwNOr7FUjIKb6Nf8?=
 =?us-ascii?Q?4R77x9VHxvs007HOPQDp8opSDI14L7euYib12gu5c0MwGYVH7PSz7eKINu3P?=
 =?us-ascii?Q?ewF9aBEEsPqRKGfFMsiiM9crDTZCgUgN61mz0TXGhpNqw8bEFXuPa5x2LPi3?=
 =?us-ascii?Q?H5RysU/PPCTEgIyBcnkLa46ud2lFl18zzRJ7YjjDPGFfapJuvdSKCDhI6EdX?=
 =?us-ascii?Q?ccIPpYNn1oBOtPOLw2ICUtZITBdIiP/CTGUhTe7K50uDfoFdZWdkXdPECHqa?=
 =?us-ascii?Q?WQ+EcZh6RKClODYj7ddbI6neayELjlYwcqfc6PYB+hiu5KpLXBlMr/S0D5Al?=
 =?us-ascii?Q?4UyB8KcSG0xvsXqNWR2F3IhujBkdLxWKXu3JboyFjtY+U6kcZrY0BgfCXelJ?=
 =?us-ascii?Q?IiL8UC6svd+1MwCyaO7TVwnmF9bh0SiO0RU8j5XVsa3nqkrp6n5C7+Nc6dD5?=
 =?us-ascii?Q?EpGN9ynHO/rfq+/hb8tXAGBMMTpArBTS0B2Lxtm0FSI270gk6BevXXj4F1BW?=
 =?us-ascii?Q?5hlLZuZy6fWg0zEsl/OuOO4tDiY30SiQHv74IIxqMTYU6yrnZY6R4mUh6mvG?=
 =?us-ascii?Q?CxXaFJFwrivTJ3DVMJfO0CQeZ+cu8808Dqw8Ypg/K7W/OtgOZEyoDfUHo+Wo?=
 =?us-ascii?Q?TIA1KSnHd+X8OiYrZ3OffXb0OQiI39z8kqJab29blVZxwNNIibXRCYaurJ2+?=
 =?us-ascii?Q?DSl6lZR1URiZN/FFymM8kUMX0ddX6A5QCZonajWhwBI1A+mfpciBlVwroi8X?=
 =?us-ascii?Q?czuguEs73J/oJRY4ySX5mJgeqAWaxAwNb1wbEc4BbPAOGtqt7AZp7uzTZ4FW?=
 =?us-ascii?Q?mlhfR/djdokxSTcyiaV2MjBW4fmvDNWnySxTpfVYaUOVNEWkieSUhpBYdx4K?=
 =?us-ascii?Q?InCpX0FW8Zx3DbTHfN4C0wMKbdFVHTKIxli0SLRz8OnmmPrPNjjQ9X3Jhqfr?=
 =?us-ascii?Q?w8FEZM6qErOQHR2kKLfTsPk73h9RtbREJ30rdPLUisJmJARiHcMsdjJ+XgrU?=
 =?us-ascii?Q?fcP5bETK74H0W+mLMZ/wjwVmygyRDYbD8ubSbYe084BuOTHnvM5GHNQy3/Iw?=
 =?us-ascii?Q?h//199zUVRaK2o83/48zXdUQhDC3flQMy8S+0Xk9HaC2XZxD7+6dvR+43vpz?=
 =?us-ascii?Q?ANiuhJpsumKw2JBSSAn+N126pMe1UCzHXAoEzRpWr1eueSiUD3lmIiWDuHvF?=
 =?us-ascii?Q?vg5hVdEiCQr58xGZzCLVstm/j5O89p2HQy/fGRDsAqlU6ssZJqh0S2KWWTvj?=
 =?us-ascii?Q?IxXqawfVEVYW4jTXPaK0qM0VPfjhKh8ZyXdYyEPjBYTfiBT4f7jBM09Qtp5G?=
 =?us-ascii?Q?1oR+wSOGnSQK+jjjyyDX3OqTo0YHKNIXIUk6RRjE?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(13003099007)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 10:22:13.5593
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e272ab1-9469-4dee-e917-08de16d50717
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0002256F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4465
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_032220_666942_B45C4C45 
X-CRM114-Status: GOOD (  11.77  )
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

This series includes bug fixes and adds aes-gcm support for Versal device.
It is based on
https://github.com/Xilinx/linux-xlnx/commits/for-next/

because of dependency on below patches
Link: https://lore.kernel.org/r/20250701123851.1314531-2-jay.buddhabhatti@amd.com

Harsh Jain (15):
  firmware: zynqmp: Move crypto API's to separate file
  crypto: zynqmp-aes-gcm: cleanup: Remove union from zynqmp_aead_drv_ctx
  firmware: zynqmp: Add helper API to self discovery the device
  dt-bindings: crypto: Mark zynqmp-aes as Deprecated
  crypto: zynqmp-aes-gcm: Update probe to self discover the device
  crypto: zynqmp-aes-gcm: Return linux error code instead of firmware
    error code
  crypto: zynqmp-aes-gcm: Avoid Encrypt request to fallback for authsize
    < 16
  crypto: zynqmp-aes-gcm: Avoid submitting fallback requests to engine
  crypto: zynqmp-aes-gcm: Fix setkey operation to select HW keys
  crypto: zynqmp-aes-gcm: Change coherent DMA to streaming DMA API
  firmware: xilinx: Add firmware API's to support aes-gcm in Versal
    device
  crypto: xilinx: Replace zynqmp prefix with xilinx
  crypto: xilinx: cleanup: Remove un-necessary typecast operation
  crypto: zynqmp-aes-gcm: Save dma bit mask value in driver context
  crypto: xilinx: Add gcm(aes) support for AMD/Xilinx Versal device

 .../bindings/crypto/xlnx,zynqmp-aes.yaml      |   2 +
 .../firmware/xilinx/xlnx,zynqmp-firmware.yaml |   1 +
 drivers/crypto/xilinx/zynqmp-aes-gcm.c        | 820 ++++++++++++++----
 drivers/firmware/xilinx/Makefile              |   2 +-
 drivers/firmware/xilinx/zynqmp-crypto.c       | 239 +++++
 drivers/firmware/xilinx/zynqmp.c              |  49 --
 include/linux/firmware/xlnx-zynqmp-crypto.h   | 119 +++
 include/linux/firmware/xlnx-zynqmp.h          |  14 +-
 8 files changed, 1005 insertions(+), 241 deletions(-)
 create mode 100644 drivers/firmware/xilinx/zynqmp-crypto.c
 create mode 100644 include/linux/firmware/xlnx-zynqmp-crypto.h

-- 
2.49.1


