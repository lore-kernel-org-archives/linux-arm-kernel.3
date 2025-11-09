Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFCACCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 06:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HLQSaZpfIAZkeUd+Aal3/ZYT0rAkX5Z/s/lUqOGG1sU=; b=DfLSGp/eWRffTGm1ZT+2xq2cOK
	bUnsMdjWjPENzp/me3qIWe7j/3fJie5urxHbbRqfs3xrDM13qXVKp8JUhS8wBDbmv0xPP7UHkkXBW
	5f9zUUhTnXhXGEmk8NmON+XC+PINkULXS6dxfal/lxIfw9dQakgYKfSYMQN+yNW1LEgosfs2FdpTp
	P8qhqp3m+mkqHlvEkuHdl6HkNW3qqR3XiX+QL+WRVNL+owcHXrLDOKPc/FlMpBgcMI74metqKTuYy
	mA8prxK05xQZ9tfm783KUhHFYCrCXBOrboky6M3sircTr2xQdAxPWyf/qP/OgIO9pPSUvqSTRgloG
	QbPHze6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHypV-00000003nJp-3WmC;
	Sun, 09 Nov 2025 06:23:13 +0000
Received: from mail-southcentralusazon11013061.outbound.protection.outlook.com ([40.93.196.61] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHypT-00000003nJB-1Am0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 06:23:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zGZeEYbn79f0tKcc0UTo5AGWx2wCwgaespijbh6mUGnINIMbuXSSqRayXwUNRg4VM4rDy9HSiod6Q/xcnfGM5VKS2KgSxQLYDwTi+iMfyAMWIKdgkxyZG8L4WF5ERcfqO6hAkfL7t8E09MqXW9dSiPR6YKdJB6Bmydu8JRtbn4EM5AngPM6duBTtSowxLMu4Rfy4BEVSWho2cmEseJsY+KoUKUZQt7xzuYO/gU6fa/s4xopGgiIMuvRy10rBqIY6HHWhl64DND/vjz5tv+8v5LHtJkwXIbP57imsVTS3hdjq28TnkVXvoboTDuUvQKQj1yjTn7bcKnMONVJjswqEYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HLQSaZpfIAZkeUd+Aal3/ZYT0rAkX5Z/s/lUqOGG1sU=;
 b=BdBdR183gUjkSNUySIUXdFIW9A5Yo345VoSbTUtRx1DAVZyzUxSNqPDm8CvFvPHAdm21hBH3zkvdqARbLS99j+NG/QXUw1FFEhD1nxDeVem2SABm7BA+UGDZDt7sKEWUBYv3eJhQMavbpS84E3qT0YTKl8QhWYN+ETNbesqI0cQlIZtXuc45Pa5nUDDb8+DYUQzTaLxQQc0JK9LSBMFvAvNWcRsKFrJc6pc9QPHHX7SicsiQzaTaav1SkZSJBydCllPtWpOjkNulf0SMJO6hojT5HIR5M80yRGyiiRI83iHQmTYqH08thGnpmZ8bZi7k+DRvRu/fsAz1OHXjBOCSDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLQSaZpfIAZkeUd+Aal3/ZYT0rAkX5Z/s/lUqOGG1sU=;
 b=jYcKKLZm2ASPINxdOCUPcChiIPuco/nf5gMLSRhRp0KuzhOoQQBoapp1cgvaU1ybnOTtIO0ODLDBmBVJHyvMeseLXE2IcVRRFf9jwg51tWfxybJE5qgyfBBdGeg+joFm+hcoElQUQ9zcloUJQasHEjxYLwQNj7LutV3UOrYYPF0=
Received: from SJ0PR03CA0177.namprd03.prod.outlook.com (2603:10b6:a03:338::32)
 by BN0PR10MB4838.namprd10.prod.outlook.com (2603:10b6:408:127::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Sun, 9 Nov
 2025 06:23:06 +0000
Received: from SJ5PEPF000001CF.namprd05.prod.outlook.com
 (2603:10b6:a03:338:cafe::f2) by SJ0PR03CA0177.outlook.office365.com
 (2603:10b6:a03:338::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Sun,
 9 Nov 2025 06:23:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001CF.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sun, 9 Nov 2025 06:23:04 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 9 Nov
 2025 00:23:03 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 9 Nov
 2025 00:23:03 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 9 Nov 2025 00:23:03 -0600
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A96MxO71442334;
	Sun, 9 Nov 2025 00:23:00 -0600
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Michael Walle <mwalle@kernel.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Udit Kumar <u-kumar1@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62p-j722s-common-main: move audio_refclk here
Date: Sun, 9 Nov 2025 11:51:24 +0530
Message-ID: <176266923842.19596.12911848015848660065.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251103152826.1608309-1-mwalle@kernel.org>
References: <20251103152826.1608309-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CF:EE_|BN0PR10MB4838:EE_
X-MS-Office365-Filtering-Correlation-Id: ccfa958e-1da6-4294-62e4-08de1f5870e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NXV1RjliOHMrc0RjbEVEcFBuWFJybHUxQm9pZ2MvVCtwdldWVDVLNThHYXMr?=
 =?utf-8?B?U2kvSUZSWkxyOWlhSVJIZU1FaG50ZUIxTUk4OU5JWmtOUURzSHY5WE5obGlJ?=
 =?utf-8?B?cGpsTEFYcitMMTVEVVlGSEdOa3FRcGZHc2RzR0JWR0ZPYzQ5YWR6cWg0Rk9W?=
 =?utf-8?B?T1g3Q0FTeGsxNkNvOTZlVmJMWW1wdFl0d1lNRGRGZEc0QzE1VmJRRll4OTNy?=
 =?utf-8?B?SStqaVhXNkkzVWluMTFQYXBmMzdNZFNuMXc1RE5nNzhTQUVxeFlhcldXdDNm?=
 =?utf-8?B?YmZYL3U2Q1Z6bUFJdUVLTER4ZzNaT0dxSWR6SFQ4Q0E1VG9BbnlzTnU5emw1?=
 =?utf-8?B?YXR0MjlLZzY1REV4b0FDNWhWRmIyOWpPZ3BvWXorZnhoQysyOXBEM0oxOUpz?=
 =?utf-8?B?L2ZPcSs1VVpVOHhqb1AzTVdBWDV3R2h4Mm5kcGVMNzdUSmxTQ20yQWFMdnJo?=
 =?utf-8?B?L1Z1clVWNWRMNjB6aDZISWRMVTR6dDliWU44djR5cUpSYkszcnRpWHAzVXdl?=
 =?utf-8?B?YjhiRzMyNVI4QUtSbXFXUE1jY3Myc01FZEUrNzBxbmhFQW4xVnJUZ1dWSm5M?=
 =?utf-8?B?R2JOMXhMQmNOOHdIcGs4UWZMK3E1dWNISDhKNHhzT1NEcEQvUTFQc2pWRzIv?=
 =?utf-8?B?M2tIYUV3dVlRdVltL0JMbXlYam13dHlqaGM1eUZ2RWxQV2s2L0Vod3dSWTND?=
 =?utf-8?B?Z0Z0YzNheWZkUktPaGJPUFFEUWNiMWtzanBobDRhZXp0ZXh2blFDZU4xbmFu?=
 =?utf-8?B?OUJhMlNGeDdOVzdwbWRLdllNbmFYUzZBN0JoSUxNM1EzbkN1TGRQOUg3OTRn?=
 =?utf-8?B?SlZ5N3dGVkxrR3VaeXZGcFo1a0FxZ3Q2aDZwa1NvUGZwck9TMkx3UStoOEZN?=
 =?utf-8?B?aURTNlRHdENCTTF5V3NmYnFGY1d4dWRHRTYzMndKSXNXaTY5bURnZXM5M1Vz?=
 =?utf-8?B?Z05GOU00Q1V2Q1RWa1JwT2RTRjNVQTg4MXpDRldFTEtKd0xTRU5YUkpRNEFR?=
 =?utf-8?B?STllcU45am1ZbHpBcFBUNkdVK2RhMjc0S0Y2QVRUbkhScFBCbWhMMm5ZYk9y?=
 =?utf-8?B?MWl4Z1RPQkE3MWZ2U0J4cEZna0FxZXJiWWFtSEcrcmhENEFTNm93VExCZkhX?=
 =?utf-8?B?UU9rRzNwVjRZejBxS2FpYWRWbEZQMmZZQU1JM3MvUTFmajdzTmhoTkFGK2JB?=
 =?utf-8?B?SUtlTE9wOHBjaEJIZGhUditIY29lcFBCZXdoSVRScmplYkY5ZkpqWEZCY21P?=
 =?utf-8?B?U3N3bGVqR1NOdkJuZkNrYTJKRC9QMWVQVG5SWkQ1VHJOV00rdGJKNEVndmFC?=
 =?utf-8?B?RTRLUExEWHRYaVpuY3dFN1NhWkUvWUMrV2p4aUVWVzZGQVpCdFhUeUllYU54?=
 =?utf-8?B?UGtSS1hyb3Q1eWdWZ3NUQTdmV3JvajBEOFNidHVGR29yYTUrQ05kTFRFUmhz?=
 =?utf-8?B?OUovNllTR1JXcnozTUN1b1A3UHVaV3JOcWlUSGNTeGl3QWlPWU94M2dLQTFo?=
 =?utf-8?B?aVVIWTVFVC9tK2xHWVBaR1RaNkRSOUJSdkl0UTlBQk9RUlludnJuSlcrMlJ6?=
 =?utf-8?B?N01LL2xnTkgyL215bHg2UGg1alF0YTRjVXNZOEFjUzhQY202cDRVSGdmNlBm?=
 =?utf-8?B?RzRNdm5FeTBoZTJmUWRnOGxHL3lsOFYySGdWQlJTQU43UlNzYmZpNzZLaWh5?=
 =?utf-8?B?QldOSksyQzV0U09wR2toMUcwZnFQTXZUOWFVUjhtVUNlT2wvWmZOTXdMSEE2?=
 =?utf-8?B?WW43VVVZY1kyS1VSM21QQ1BKaDdjVzVZRHQ1Y0VQOXhySGU4ZmRkeitaY2FC?=
 =?utf-8?B?K0xoazExa3JVVWxjSk92S3EvdDg0MjBhZ0dYWHlQN01LYjFXalNJSTJ6OFM4?=
 =?utf-8?B?VDFRaDgzb3dqT2hvb0o1WmN6SjBRNzUyVDI2Y3hUUFJrQWdzVWdodWtlUE9M?=
 =?utf-8?B?WFVoVzF2RjlYRlR6aU5kU2hHakwxVkRLcmJ6QTBxbmQxQ1lqRXJNOWNkTWh0?=
 =?utf-8?B?c3Q4dWhSWEE0MDBzODI2V3hRYW1PUVRBdjRRNDIwekpqTUJhWjJydC9OS3di?=
 =?utf-8?B?b0tGdlZYalV2ckQvM3B6QmkvcU04b0ovOGZmQUtLWW5kSStTM3lNZjYvajRq?=
 =?utf-8?Q?7o6Q=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2025 06:23:04.3947
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ccfa958e-1da6-4294-62e4-08de1f5870e4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4838
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_222311_322205_5AA7644A 
X-CRM114-Status: GOOD (  14.34  )
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

Hi Michael Walle,

On Mon, 03 Nov 2025 16:28:18 +0100, Michael Walle wrote:
> Since commit 9dee9cb2df08 ("arm64: dts: ti: k3-j722s-main: fix the audio
> refclk source") the clock nodes of the am62p and j722 are the same. Move
> them into the commit dtsi.
> 
> Please note, that for the j722s the nodes are renamed from clock@ to
> clock-controller@.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am62p-j722s-common-main: move audio_refclk here
      commit: 2fc9f6f112426dfcfcdc3bd63a90558a6acb99fb

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


