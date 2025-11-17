Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98EF0CEBF61
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 14:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:CC:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d6hTEmjcVBW5jTOhWh8piVYhgK6MkJlpuMDcxnEqSi0=; b=B/bi0R2Ynao0YifygBBLZ5KyNv
	vQG+W9TVteasIN0fQuJ9lEeA5Fy78hiF8hyykWH35GJEoThZOy1zYXGgZH1ZBDZXj8bKPQtO9UhkT
	dCrL5wsmH9lpliUnJ5jTdcLILsJS2+QBx5GIrKdjyyWrK5WEByBuSdHiSYulefNShPRCcP9lOUCEC
	hgb09C+irUZ1fS/dN8WUsZp4zYy/C8F+ozjzUTGcy47kpGgjyQ/uIPElFrh5I50WfgrPrBE0ayBKj
	uNm6suE02yZ4SHeqWnCj4ugBbEVeME3vra44oZHuulvu3ZAy6CpKxF3yhKbfafVRzz2g7CUMDoXkN
	QXM+TGcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL0E1-0000000GGI5-37Fc;
	Mon, 17 Nov 2025 14:29:01 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL0Dz-0000000GGHe-0i6p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 14:29:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dtNb+0GKf8EjbqfjZmNZyi+qOpXblG2O6DiepR7K4F8gnez1K/j9kmZoPMZLqHjJVkLIcUSfe0n4Dr4nxhub0QarH5WWQohbPXsnOyw1nslpZHGY/ecJ7+fIUbSoXm+f8Rm32D/f5oQfmudgvpJfCfUPXkXjzsPtjgPiSz2GhBOjGTH53vf8qIIuoc8G4YmkHAMEwMqv71NXg9pAOnfI/rdiQ4qBqy4jgQ/6Vr4xHUH4LyZfv90aZwgGOPxg0fpRsSY01kCbOoYyzVIeJK7vCJPOIVutMO8eUZ+WsfWaqxBPhBKQOGNtjqeCV69JP6xcvECCmDSZTRNh7EfMJ55icw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6hTEmjcVBW5jTOhWh8piVYhgK6MkJlpuMDcxnEqSi0=;
 b=D5pxo8qAuh6zSMTicG+fu+YUk7nrRgXgCRqSKbpiWgBJHglS9zl5RhKyabPuVhnsW36HCK1tCTqv2EMB+i8hosF/g14C9hWUw6VgzU2bbZU32+Q50vY2yawQVPZPul1NLewWu26tQcpvgQFFIzbuTT308p+cMjEM/p0CF/U+DlYDuA3kkF3oCCHSRVCAmSJdQvZR9np5B2sEcIIN69SSwbNFPjBzFnRzntqSUKd9M3+uzx4QYO1b9y6wrNI9oxZbPaIryav1q2djkxhSmVdE72xkzQ5K/y0NEDtwf6okRRBY+eh1jn5l4IN4jwToEgSIHQGp0r9HN4t8GOFkOrwzuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6hTEmjcVBW5jTOhWh8piVYhgK6MkJlpuMDcxnEqSi0=;
 b=NbKFe3NeUUXawnUF6kMWJCzjGAXoF3BoAqnuVk1jhwZfYwSApDsbV0lo28iZDKaRu3oZpBTZubAPcTjVFHA4+t2d+N7p7isHNwl1+V2RDiQjQprqSObH1hb1a75VBUap6YBNuA9UmDG3WWYr2WtuqsWvezF9xECG0JNTapwQ52g=
Received: from PH7P221CA0066.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:328::29)
 by SA1PR10MB7829.namprd10.prod.outlook.com (2603:10b6:806:3ab::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 14:28:51 +0000
Received: from CY4PEPF0000FCC5.namprd03.prod.outlook.com
 (2603:10b6:510:328:cafe::a3) by PH7P221CA0066.outlook.office365.com
 (2603:10b6:510:328::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Mon,
 17 Nov 2025 14:28:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000FCC5.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 14:28:49 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 08:28:47 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 08:28:47 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 17 Nov 2025 08:28:47 -0600
Received: from [172.24.233.103] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AHESj6W2596310;
	Mon, 17 Nov 2025 08:28:45 -0600
Message-ID: <a07364c1-5a4c-474f-be21-96f38bfe9130@ti.com>
Date: Mon, 17 Nov 2025 19:58:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
Subject: [GIT PULL] arm64: dts: ti: K3 updates for v6.19
To: arm-soc <arm@kernel.org>, SoC <soc@kernel.org>
CC: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, <soc@lists.linux.dev>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------dtNL3jqcK4DD96wqKk3SL0Kp"
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC5:EE_|SA1PR10MB7829:EE_
X-MS-Office365-Filtering-Correlation-Id: d6dfd7bf-2816-4f31-d8bd-08de25e5a025
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WU5scmNtWlhLQVJtWWxkY0dxN1NFN0taRkVSNnRDT2ZwdXlXUzdRNkcyRVVh?=
 =?utf-8?B?WjYvWFBuMTdrQm1qa0QwWFk0dUNKQ2pHZjBpRkRCWjRnc1RURWZIQkg0VWhS?=
 =?utf-8?B?ZWVHbnp4TGIzejMrMnhIN1ZsNUM3d3h5d0JQWVJVMm5laGNYRW1xYURrYTVx?=
 =?utf-8?B?aW10RFZIcnY5emVRMXFsUVdEVUxacHVkME1LS2ZCbDk2MXkxWkJMdWRNRFk4?=
 =?utf-8?B?dFBxTlRGZXI3TUo2d3F2RlUzY2ZDalYxWnFCR3VlUjhvcXBTOFJ1RDhCUFY5?=
 =?utf-8?B?YWJEaXVWU0FBUDcvM21NV2RNUS83a0lDVUE5VHZWNzIzeE9YU3ZWT1dkZlNj?=
 =?utf-8?B?WVRwQ1hvZVZDeDVmQmJ5WVpTM2ZkRFBUQ3VUcDNzTWI5bFpWNGdFOUI0ZjJp?=
 =?utf-8?B?V3VRdnE1dGVNempoYjFUczNqckNFcHVxa2huWFdXdmFGZ1FwT21DaW5WVGxP?=
 =?utf-8?B?QVk1U1pHSXM4U1EvbGk0dUFzaU9aWmN2MmxyUWxoZU1sOURPQXJqTWtqSWdq?=
 =?utf-8?B?bHJUckpoRkdlT1FJQndBbjN2Q3hTUHh5TzRQNHpGQ29vRU9UZUxjeDVwSFRZ?=
 =?utf-8?B?aEgwTnlpL2tFcHhyc29ZNVhTT2lxbTlreTZaRWhuZ1hHZjd1UTNTdmhqZlh2?=
 =?utf-8?B?c1hSZDJsc29KWmo4SXhwRHk1RXRJU0g2emRjSHF4QmY4RGp0cUtuWWdyYlNW?=
 =?utf-8?B?NHorc3ArMTRiMzRKQkE5YWRNTW5DN2doai9jTVB2cWZ0ZHFhWGhQTEpMa1RY?=
 =?utf-8?B?dllEcGNUa1d1SVRCUDgxT1BXREk2R0VTMWYwOW5WeXk1TkFNeVFGUTcrVUtl?=
 =?utf-8?B?Vld6bmgxRGR6Nk03YXgwTjRHSDlqdi8xTzJNaWlKbEd1YVF4aiszRVJDSUpU?=
 =?utf-8?B?VWxDaXA5YmZ1S2E5TVRhV2c3dkdsclVzZzFrWStGYmdsOGsyVzNBbDllWVdn?=
 =?utf-8?B?dC9MQTRON0tXUFlkbitNN3Jtc1laQmxFcFgvejg4eHMzRU02K0x1MVk3MVlz?=
 =?utf-8?B?R0dWNlRWSlZUUGpnS05FQXRkdFc1ZFB5czlsbnd6elFtem9oa2djWG9UbUtZ?=
 =?utf-8?B?alkyQ3dIbEVSYXpGWXZjdVJCNGtOOVZncjEwQWZ5MityZzZwcU1HcG5NTytq?=
 =?utf-8?B?L3NFK2V5Q2VQdGgwS2Nobnhra1VqWVBYc0ZzZkRzNmJac2dnK2tsaTcvZmxU?=
 =?utf-8?B?aURSRnJSbzE1dFd1WVJMbGpSSU1sOHh4S1Y2WUdUdGg1MWRROXJaQWdubEFC?=
 =?utf-8?B?YTdnRlJOaHo0ZjJ1UmZzOWVtRFgwZUJwc1ZNZ2ROWXhtZzM3dGJXRVdDL29Z?=
 =?utf-8?B?bjltQ01QVG44dnlMemxrdGVhNHNlUlJ3STdFRHo5NzVEeXFlMW1QcitLMWRW?=
 =?utf-8?B?ZzNXWnpRRzlqMlVrR1BXaThRdWJUUWg2c0hJZHRpRzNwamp0VHFMUnN3Zmsw?=
 =?utf-8?B?bXRraDBJalZtc251a1pqVy9JRkpCenZNYURwcW9SQURhT0VFUi9YU0Z2eVNI?=
 =?utf-8?B?R2JKODRKc3RPR3RFYXhOTCtGY2ZrcEl5OVdHMHNSclR0SjM0SkFlTFhzWXpz?=
 =?utf-8?B?cGpIVUgrTTdTRXIrVnpNOVVwSGRDSkhXemNyS1NtL3FKTXB5UWJ1K3NkY2wr?=
 =?utf-8?B?cVNKcG1EdERLN3owemJNdmxVZkNYSlFoQ1dkS1FvVlRsL2N1cjdDT3lWeGlP?=
 =?utf-8?B?REdlYXBFeHJGeG1kT3ZHblNFcm5qU09vR2JIdlZLTjFjb0pOUWdFdXpjSU04?=
 =?utf-8?B?bUxzb3FuZkRVck5zRndxMUxMQkpkVmxhVmwyK2ZNUlI5dkQ0cHhlUThkazJK?=
 =?utf-8?B?QVhOSldZb3o2KzNHVzNFd3gxQmJ5Q2UvYW4rTlYyNWU5d0Q1V3lWS0x3elNj?=
 =?utf-8?B?UzhJTXJ1Yk1aMUM4SjVmOWhpeEtoNEM0d0xCVjNMOWNSU2FWcE9hZ0M2TFEr?=
 =?utf-8?B?T2JMMDVGRU5yTTR0NC9wWnZHNkhzUkRRL0QyRkZQK3BreWZwak8reDZKdFh2?=
 =?utf-8?B?MU1oWGEyS2NER2QwV2VVeVVaRnlQcTBPM2RSYmVPWmIzOUVFMTRQbVVQdDJ1?=
 =?utf-8?B?SldSWmJ0anByUWMwU2s5UHlGY2YrYVdzU2I0YjNTS01ZZFA5aS9nb2RuOENX?=
 =?utf-8?Q?4ZIo=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 14:28:49.6914
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6dfd7bf-2816-4f31-d8bd-08de25e5a025
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7829
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_062859_270679_C163A4CD 
X-CRM114-Status: GOOD (  10.49  )
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

--------------dtNL3jqcK4DD96wqKk3SL0Kp
Content-Type: multipart/mixed; boundary="------------mxb51hmjg1uoDvUuS2fG0T0t";
 protected-headers="v1"
From: Vignesh Raghavendra <vigneshr@ti.com>
To: arm-soc <arm@kernel.org>, SoC <soc@kernel.org>
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, soc@lists.linux.dev
Message-ID: <a07364c1-5a4c-474f-be21-96f38bfe9130@ti.com>
Subject: [GIT PULL] arm64: dts: ti: K3 updates for v6.19

--------------mxb51hmjg1uoDvUuS2fG0T0t
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df567=
87:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3=
-dt-for-v6.19

for you to fetch changes up to 00fb4c73b67d36783c5ab95a830f0cf0142b9fc3:

  arm64: dts: ti: k3-am62l: add initial reference board file (2025-11-13 =
22:01:07 +0530)

----------------------------------------------------------------
TI K3 device tree updates for v6.19

Generic fixes and cleanups:
* Multiple SoCs: Disable CPSW in SoC files and
  enable them in board files for better board-level control
* Replace rgmii-rxid with rgmii-id for CPSW ports across multiple boards

New Boards/SoM:
* AM62L SoC and basic support for EVM
* Toradex Aquila AM69 board support
* Kontron SMARC-sAM67 module and ADS2 carrier board support

Platform wide:
* Define possible system states amd wakeup-source (AM62/AM62A/AM62P)

SoC/EVM specific changes:
AM62:
* Add RNG node
* Add OLDI support

AM62P:
* Move audio_refclk to common main dtsi (k3-am62p-j722s-common-main)
* Fix memory ranges for GPU

AM62D2:
* Enable PMIC support on EVM
* Misc fixes

AM64:
* Add DMA support for TSCADC on EVM

AM69:
* Add Aquila board support with Clover variant

J722S:
* Fix audio refclk source in main dtsi
* Explicitly use PLL1_HSDIV6 audio refclk for EVM

J784S4/J742S2:
* Add bootph-all tag to support PCIe boot

Variscite VAR-SOM-AM62P:
* Add support for ADS7846 touchscreen
* Add support for WM8904 audio codec

----------------------------------------------------------------
Aniket Limaye (1):
      arm64: dts: ti: k3-j784s4: Fix I2C pinmux pull configuration

Aradhya Bhatia (2):
      arm64: dts: ti: k3-am62: Add support for AM625 OLDI IO Control
      arm64: dts: ti: k3-am625: Add OLDI support

Bryan Brattlof (1):
      dt-bindings: arm: ti: Add binding for AM62L SoCs

Dominik Haller (1):
      arm64: dts: ti: k3-am68-phycore-som: Add pmic label

Hrushikesh Salunke (3):
      arm64: dts: ti: k3-j784s4-evm-pcie0-pcie1-ep: Add boot phase tag to=
 "pcie1_ep"
      arm64: dts: ti: k3-j784s4-j742s2-evm-common: Add bootph-all tag to =
SERDES0
      arm64: dts: ti: k3-j784s4-j742s2-evm-common: Add bootph-all tag to =
"pcie1_ctrl"

Jo=C3=A3o Paulo Gon=C3=A7alves (2):
      dt-bindings: arm: ti: add Toradex Aquila AM69
      arm64: dts: ti: am69-aquila: Add Clover

Markus Schneider-Pargmann (TI.com) (6):
      arm64: dts: ti: k3-am62: Define possible system states
      arm64: dts: ti: k3-am62a: Define possible system states
      arm64: dts: ti: k3-am62p: Define possible system states
      arm64: dts: ti: k3-am62-lp-sk: Set wakeup-source system-states
      arm64: dts: ti: k3-am62a7-sk: Set wakeup-source system-states
      arm64: dts: ti: k3-am62p5-sk: Set wakeup-source system-states

Matthias Schiffer (1):
      arm64: dts: ti: k3-am642-tqma64xxl: add boot phase tags

Michael Walle (6):
      arm64: dts: ti: k3-j722s-evm: explicitly use PLL1_HSDIV6 audio refc=
lk
      arm64: dts: ti: k3-j722s-main: fix the audio refclk source
      dt-bindings: arm: ti: Add Kontron SMARC-sAM67 module
      arm64: dts: ti: Add support for Kontron SMARC-sAM67
      arm64: dts: ti: sa67: add overlay for the ADS2 carrier
      arm64: dts: ti: k3-am62p-j722s-common-main: move audio_refclk here

Paresh Bhagat (4):
      arm64: dts: ti: k3-am62d2-evm: Fix regulator properties
      arm64: dts: ti: k3-am62d2-evm: Fix PMIC padconfig
      arm64: dts: ti: k3-am62d2-evm: Enable PMIC
      arm64: dts: ti: k3-am62d2-evm: Remove unused ospi0 chip select pins=


Parth Pancholi (1):
      arm64: dts: ti: Add Aquila AM69 Support

Randolph Sapp (1):
      arm64: dts: ti: k3-am62p: Fix memory ranges for GPU

Sai Sree Kartheek Adivi (1):
      arm64: dts: ti: k3-am642-evm: Add DMA support for TSCADC

Shiva Tripathi (1):
      arm64: dts: ti: k3-am62: Add RNG node

Siddharth Vadapalli (6):
      arm64: dts: ti: k3-*: Replace rgmii-rxid with rgmii-id for CPSW por=
ts
      arm64: dts: ti: k3-am62: disable "cpsw3g" in SoC file and enable in=
 board file
      arm64: dts: ti: k3-am65: disable "mcu_cpsw" in SoC file and enable =
in board file
      arm64: dts: ti: k3-j7200: disable "mcu_cpsw" in SoC file and enable=
 in board file
      arm64: dts: ti: k3-j721e: disable "mcu_cpsw" in SoC file and enable=
 it in board file
      arm64: dts: ti: k3-j721s2: disable "mcu_cpsw" in SoC file and enabl=
e in board files

Stefano Radaelli (3):
      arm64: dts: ti: var-som-am62p: Refactor IPC configuration into comm=
on dtsi
      arm64: dts: ti: var-som-am62p: Add support for WM8904 audio codec
      arm64: dts: ti: var-som-am62p: Add support for ADS7846 touchscreen

Vignesh Raghavendra (2):
      arm64: dts: ti: k3-am62l: add initial infrastructure
      arm64: dts: ti: k3-am62l: add initial reference board file

 Documentation/devicetree/bindings/arm/ti/k3.yaml             |   15 +
 arch/arm64/boot/dts/ti/Makefile                              |   15 +
 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts                     |   64 +
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi                     |   64 +
 arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi              |    3 +-
 arch/arm64/boot/dts/ti/k3-am62-verdin-dev.dtsi               |    2 +-
 arch/arm64/boot/dts/ti/k3-am62-verdin-ivy.dtsi               |    2 +-
 arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi                   |    2 +-
 arch/arm64/boot/dts/ti/k3-am62.dtsi                          |   22 +
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts               |    3 +-
 arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi               |    4 +-
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi                    |   10 +
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi             |    2 +-
 arch/arm64/boot/dts/ti/k3-am62a.dtsi                         |   27 +
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts                      |   71 +-
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts                     |  103 +-
 arch/arm64/boot/dts/ti/k3-am62l-main.dtsi                    |  580 +++
 arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi                  |  141 +
 arch/arm64/boot/dts/ti/k3-am62l.dtsi                         |  118 +
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts                     |  361 ++
 arch/arm64/boot/dts/ti/k3-am62l3.dtsi                        |   67 +
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi       |   18 +
 arch/arm64/boot/dts/ti/k3-am62p-main.dtsi                    |   20 -
 arch/arm64/boot/dts/ti/k3-am62p-verdin-dev.dtsi              |    2 +-
 arch/arm64/boot/dts/ti/k3-am62p-verdin-ivy.dtsi              |    2 +-
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi                  |    2 +-
 arch/arm64/boot/dts/ti/k3-am62p.dtsi                         |   29 +-
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts                      |   73 +-
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi                |  148 +-
 arch/arm64/boot/dts/ti/k3-am62x-phyboard-lyra.dtsi           |    2 +-
 arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi               |    2 +-
 arch/arm64/boot/dts/ti/k3-am64-phycore-som.dtsi              |    2 +-
 arch/arm64/boot/dts/ti/k3-am642-evm.dts                      |    7 +-
 arch/arm64/boot/dts/ti/k3-am642-sk.dts                       |    4 +-
 arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts       |   20 +-
 arch/arm64/boot/dts/ti/k3-am642-tqma64xxl.dtsi               |   15 +-
 arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi           |    4 -
 arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi                      |    2 +
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts               |    3 +-
 arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts               |    2 +-
 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-ads2.dtso       |  146 +
 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts        | 1091 ++++=
++
 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gbe1.dtso       |   26 +
 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gpios.dtso      |   61 +
 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-rtc-rv8263.dtso |   31 +
 arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts             |    3 +-
 arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi              |    4 +-
 arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts             |    3 +-
 arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts             |  451 +++
 arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts                |  576 +++
 arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi                   | 1840 ++++=
++++++
 arch/arm64/boot/dts/ti/k3-am69-sk.dts                        |   10 +-
 arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts        |    3 +-
 arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi              |    2 +
 arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts           |    3 +-
 arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts        |    3 +-
 arch/arm64/boot/dts/ti/k3-j721e-evm-gesi-exp-board.dtso      |    8 +-
 arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi              |    2 +
 arch/arm64/boot/dts/ti/k3-j721e-sk.dts                       |    3 +-
 arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts       |    3 +-
 arch/arm64/boot/dts/ti/k3-j721s2-evm-gesi-exp-board.dtso     |    2 +-
 arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi             |    2 +
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts                      |    7 +-
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi                    |   18 -
 arch/arm64/boot/dts/ti/k3-j784s4-evm-pcie0-pcie1-ep.dtso     |    1 +
 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi      |   18 +-
 arch/arm64/boot/dts/ti/k3-pinctrl.h                          |    2 +
 67 files changed, 6203 insertions(+), 149 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62l.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62l3.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-ads2.dts=
o
 create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts=

 create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gbe1.dts=
o
 create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gpios.dt=
so
 create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-rtc-rv82=
63.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila.dts

--=20
Regards
Vignesh
https://ti.com/opensource


--------------mxb51hmjg1uoDvUuS2fG0T0t--

--------------dtNL3jqcK4DD96wqKk3SL0Kp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRQBrqaOmQ441h4YbUDQj8NV+8d1wUCaRsxHAUDAAAAAAAKCRADQj8NV+8d1xFv
AP0Xvo0MSNNX4H88goSGgCaKXlaapSzkVq2hcdljOU5XywD9GR0SeA4wI60lZl+Qd9jfZFl3ET5A
ZGKamUqca7zIbgE=
=1Quq
-----END PGP SIGNATURE-----

--------------dtNL3jqcK4DD96wqKk3SL0Kp--

