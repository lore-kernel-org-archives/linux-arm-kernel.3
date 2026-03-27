Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A8910BA429
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 04:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I57nSt7qEib0APE4gzC8X2YSV4rD359X3mflzfR6E38=; b=u28SHr1ZD1jqyx1DPZb8fpJI+z
	jp52ktjK5Xfij0TO+5s5zvuqKEIJiF9YCODbQIq3wT25PTmc/u9iiKfN/iudiYoOf2BvBjKre5vzU
	1x8E/8HLlGRxYdIAkygyGsdt0uOIeGizi6KkF3vziTZX9Gsim/r2LEd1hJKJaPVjyp0xGUwdSqtIY
	U5HQiDaZQfK4TGSoD3OZKpeyWyedk62DsjgdooNfGZu5bdh9uV55/GDdEDEWnvZCp9GGf6knj23uB
	rBj6Fcx8cWvbP899eekFP5YH5NdOSCgwe8DoCUh76OUTFbvgoMQj1ipiZjYqrLDEAuiKTtfXzW8ta
	YX4AWMbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5zAV-00000006g8d-24Zq;
	Fri, 27 Mar 2026 04:51:35 +0000
Received: from mail-northcentralusazon11010016.outbound.protection.outlook.com ([52.101.193.16] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5zAS-00000006g88-1562
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 04:51:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZEFcpiAal32NJghGksgpGLaX8h5Xt7OMcqEw0KyjVOwt+iQQxRJaveS+wm3nL1VEiwwgmkj2PR6hm/TR40U397Tds7H7Zy8cR5Ma1uiVkkqZisJKjBngxMqu4BrKWFpSPLnSoenXf11cw/2FLyv3O8hCN3Ku7EwpW0n8US4GmY4Nfv/uvXW7mhyC8J9r8SZerB01b9QKcL9XFMWkhC6OrToeDk4AF6M+yWJpZ2IdH0Um8yqGcxppk66JnluZ8X24ZdepwneZPcGuVoiOZn/VAG9Il3li1ZPrqLF1wD5ZiktXTB8QNy1Z0Qj5mZd5uu7IVSZPvgOVvC/6wrL5mitt2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I57nSt7qEib0APE4gzC8X2YSV4rD359X3mflzfR6E38=;
 b=ku+OrQP3RElCkzZ3kzkFo99NGKecR5THABx4llVp0xPtMUDB3H+9b4VxvGfsj9z44BNwwuTA2cyPw2o7Xmx5LudloPSsvifW8VraRt4MyNIYSAIZQrDWk5rT/wzXH+QCBhUuP1dvimgDX2CsK7fJU8XKOj3PSQwDZIhleFBSSDCj5r+3AlA5hvmDTbvjsZ3px1Tbmc5HRIJQyPLKIfySCIZ1td+ka6M2n2qddBmP0e1tJS2xLKsIUfkhyRt7GwINdCB1KXY8XeV8t1q+/dZzdTndvRP9D4PwGz2MWiniYHvaLqjp5/6DJUkN6bdjbiQGIQQihAS/MzZmhFK5eJIrmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I57nSt7qEib0APE4gzC8X2YSV4rD359X3mflzfR6E38=;
 b=so8hlH3YE4T9CYbzFgcAfVFSZTqCnWpGa8ElhU8wMnLoJNl73qSzF3C8PsQwUcsX2k8lT6XfdZOoq9DXu8KUHjmc08yvP+yRvwUO69f4PuOVnand7tKeaEJnfg6Uln9908slTOr29+boTBWUNm2XC6GpEymK5cNLSqgeeqd0UT0=
Received: from BY3PR04CA0021.namprd04.prod.outlook.com (2603:10b6:a03:217::26)
 by LV0PR10MB997613.namprd10.prod.outlook.com (2603:10b6:408:345::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.22; Fri, 27 Mar
 2026 04:51:26 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:a03:217:cafe::61) by BY3PR04CA0021.outlook.office365.com
 (2603:10b6:a03:217::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.32 via Frontend Transport; Fri,
 27 Mar 2026 04:51:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Fri, 27 Mar 2026 04:51:25 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 23:51:25 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 23:51:25 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Mar 2026 23:51:25 -0500
Received: from [127.0.1.1] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62R4pKEd3360289;
	Thu, 26 Mar 2026 23:51:21 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Kendall Willis <k-willis@ti.com>
CC: <vishalm@ti.com>, <sebin.francis@ti.com>, <khilman@baylibre.com>,
	<d-gole@ti.com>, <msp@baylibre.com>, <a-kaur@ti.com>, <s-kochidanadu@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <20260212-b4-uart-daisy-chain-dts-v5-0-26c7f534e567@ti.com>
References: <20260212-b4-uart-daisy-chain-dts-v5-0-26c7f534e567@ti.com>
Subject: Re: [PATCH v5 0/5] arm64: dts: ti: k3-am62: Support Main UART
 wakeup
Message-ID: <177458707055.423823.16619477832108847768.b4-ty@b4>
Date: Fri, 27 Mar 2026 10:21:10 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2041; i=vigneshr@ti.com;
 h=from:subject:message-id; bh=gOF03ui1vQU1iX4m4Jt2dbvwp+rhuid/T6nK7000API=;
 b=owGbwMvMwCHG7GTPG/5e9jrjabUkhsxjPCdmnbl2oyOs4Xbw7m+2ojcmCy+c/dP0+ZXGcx+6L
 7+r/jb/f0cpC4MYB4OsmCJLANuuWVYpFo8jKhK3wsxhZQIZwsDFKQATWVrJ8E+5rnR7J//ysFxn
 m2LV55OKjvdxZHCVZhQGdWlpuQef/MTwi0n4S/MR9WsbKjaGVMV1PyjneXGlNTYmff0OO40XV/7
 /ZwQA
X-Developer-Key: i=vigneshr@ti.com; a=openpgp;
 fpr=4A5A711E8E7E44F9F12F2CFAF903332F551A78E9
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|LV0PR10MB997613:EE_
X-MS-Office365-Filtering-Correlation-Id: 52605f8f-9326-45e4-ffc6-08de8bbc8090
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: AG61I4473wDsZKwE9h/gQnjN+qskT5M5aMz+mLTlkhJVIF3pEpK8XZQdL+DRFUQdMyA9Wyc/stGq5IaG9aed6WXrZZBQTcZQPSjy2Fdyxa7SMJ2AsEt9QIByYiTCg2rvQQQlzfSxlmeBwAhzOT5P4MLqolyCkmtETnYvIzyHSppqhOks3ljnkgA2APEL5NYiFDYN64Be19LP7S5ffVo+16eUR/LpAtFJp0DM9RKX+xrw/Tl9/tEhzL88fgpoctLvMKdbpzxTYzKitk89SRVlgw4t/UOTpuGy+0TXylpGqlm/ilR5gAaTuWjkc18KzESLBlfnNWQWdGqQoKcIkjyQLKhJ2Nd8umD/I4Xdvo9nsJHpbs1oT0YtTGdNxW6Wt2gQv8k5gvzrj8abuwTSZp/PVo6LpOnhNw1j2UIy4Mo5vb24WOCWmGs4xpdWRAArGiy/3Op9Q7JHVGYBga9qPh3M5YVlUBzjw/1qgYyWwjkv5hFSzLddIBsFeSvVA1TtamTyweW3PcB4YDvM/A+egcsxbB59ebHRc3AEX2muWsg5qgbc68xUdDSLZgpzZWWnEe+VKWQO16TQEWbwtAKWh8yXxVbNAAk5phTCt5FWBv77M6vFfsDVRit4ZjGf14DZ5+QRjGr+4YMcJzkex97PUegN1P84AgiDQSIco7Ud93f+ekSXYfliPEhsM01XQNA6/hs6EXJMVPcqKJ/ETdJe5rf+pGPBLdkvr8iBH8NxFFsmuXPA4W5RqHk/toaW6PwHGcLXen3vTOeoFmrRVQwDUQcffw==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: hIWDfLkmOWtLLbEygmWscd4b0OULTMwpsJalT1zbBYUfuYlwVEHrBdDyrYgZD5DXhRm0pfXGYqNranEWpFihZtp9QHrwTECJg96aif2PwL9tb1C0apj8iJx93d0Yb8uSq5T3HcuhjJQb8Dl/5hdXnTIWGWxqgXo5IoQBJH8kJlCtwrOV8etBhHTwORF9z3+DtVBGHZEopptKrtpuFi+IUuXfDLzkGt1dZdH3a7MRUoGnDXSe27i6ejP4ekSS4IYYtqsjRKR8x4BbjToERzEU/JAalUDC8Fvtj90dlN13TKG1BW4v3myulRVh81/U8nyUIJXVQyVv2s5pWgEpG1tkTlWetw9j639OHR8PqEouX0FXgmhGDRWSCe6Bq71tHp/GVSLQYTFqpVsVkOJr6ZqY4OL49I7liUsIYiphq0I86R0b/DmjHdMsRCJTjsaCLIds
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 04:51:25.8971
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52605f8f-9326-45e4-ffc6-08de8bbc8090
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR10MB997613
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_215132_306856_C9CE767E 
X-CRM114-Status: GOOD (  13.13  )
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

Hi Kendall Willis,

On Thu, 12 Feb 2026 11:27:19 -0600, Kendall Willis wrote:
> arm64: dts: ti: k3-am62: Support Main UART wakeup
> 
> This series adds wakeup support for the Main UART in the device tree of
> the TI AM62 family of devices. It defines the specific pins and pinctrl
> states needed to wakeup the system from the Main UART via I/O
> daisy-chaining. The wakeup-source property is configured to describe the
> low power modes the system can wakeup from using the Main UART.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/5] arm64: dts: ti: k3-am62x-sk-common: Enable Main UART wakeup
      commit: ab16e17f6f4d216831a0736cf0f8d59b12b1d102
[2/5] arm64: dts: ti: k3-am62a7-sk: Enable Main UART wakeup
      commit: 809c32b708c5e085c2c63fb05d2c6260c233a3ba
[3/5] arm64: dts: ti: k3-am62p5-sk: Enable Main UART wakeup
      commit: 32ddcdde224a19a8c3cf9e0c9b7d6d9eced8db22
[4/5] arm64: dts: ti: k3-am62l3-evm: Enable Main UART wakeup
      commit: abdec802da403a7ba0af5f87e8ab9671b71a00e4
[5/5] arm64: dts: ti: k3-am62d2-evm: Enable Main UART wakeup
      commit: dbe21aa940f482fe3bba9d4731b6863ab85e8f55

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
--
Vignesh



