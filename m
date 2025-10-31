Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C0FCCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 14:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jkVi1XJLrnKEBuqvjZ9+PabCPbBs1GKWW2AZKsCiY2U=; b=uFwYVK8FQfgC/uKuOzCXtTySqc
	ZlkhLxXoaLXI9Lw+eaEL1QVQRccX7cMKb1WUBxjNqM0+CaqvCvw9PDv0K+F7O7gc6uCLY6dZ8kAsX
	doNUo2WuDHsdeDWmh23us6XWpGGrFBEd8xIvHXsKzw+P5zGPFTJD19e3XGE1zUvIagwIMHmk1ExAg
	DgEp96BDt/nibZ1bsteEMML1I83c0bdsaOpAun7rpa11kx7EIQM7aa4u4WW7k3+eLD40hRZ8uDOxw
	uLyYCx8ReUBssUTTWe3EE9/WY4yUmk9jN5PKtcqX2wLuMJ2M/rQWxt9COvur0BLWUL0TGoB9eAGXd
	7BvJNRgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEqMX-00000006GKp-0RUv;
	Fri, 31 Oct 2025 14:44:21 +0000
Received: from mail-westcentralusazhn150130000.outbound.protection.outlook.com ([2a01:111:f403:d911::] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEqLj-00000006FsD-0120
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 14:43:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VcLj1fAil0NqrY4+0RYZCdxY3QYgBJWEBWgSLjihDGt76QBDxrcKAtsgaZ7IIBlmW0pd97qM0aMuzimCYk8R0Zt598PagpLHlmHz//NS2KOEq29J6XpOExlLUaxcmjrIwz5R8KDGd7dsGmPkAEF3teAxer2+6Vbi+BwyhV1KbMajvZ3FBLCJHiCbLvfLYknhn63D6eE6Da7PN71iD8VM72l3P5b5J2E69C007GndyJkX2jxmm0FwHSy0qjbbJ6IJdHmx3JxiKzJ/lp/7qY7utNH4UuNey9ErXXhJjSKHuYCg2SXc21vwBsTGidj+TqmEL/oHyvNup7rhj0RrFkyINA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jkVi1XJLrnKEBuqvjZ9+PabCPbBs1GKWW2AZKsCiY2U=;
 b=YUTNHEvuqDWl3Mlqd63M+nA9yNiFDm9U/csY1ZzCizbKR261DmHPK8FuEwvUCBA5Zt/iyru1g++y+jKS2Afq8e4vaeo+6Mr7j6RZcrTMdoJESzK967JWxxcdWqQ0OsFU1wSFxjLNO1RVBTAjppvPOeWzPRIlpcUzXeXReHsEnnwWdvZY2smN/Xpd5OvDwujp/f202yrDNvF1vQmu+g4dn4tGE575jEiYKH9hg87nf3RuPHikjWsuTqpY5pSMKGxwX2tZykZmAx2QaeBgCNS+z9XDE5S5c6bHT7jIBdBK4PMCnyzn/BSuB/OUtQDJoJmxyiGyGI/JUHTc46ydtrAOMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jkVi1XJLrnKEBuqvjZ9+PabCPbBs1GKWW2AZKsCiY2U=;
 b=R2ec9n9+xIr/EpJijs97fL7PPNwbIige+A85FYFGPpN/lKlZfpACylYHinMY8dfvPmrvhYUT93PT3tc7x84BfVB2s4HARhhl8/pa8YkxQ4EuhRX9iSxnbN+mQpGZSoDCIrSd12oHCOQPOQnwCRQMJ8WSycK337K619tmNiGeQoA=
Received: from BL1PR13CA0433.namprd13.prod.outlook.com (2603:10b6:208:2c3::18)
 by MN2PR10MB4254.namprd10.prod.outlook.com (2603:10b6:208:199::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Fri, 31 Oct
 2025 14:43:25 +0000
Received: from BL02EPF00021F68.namprd02.prod.outlook.com
 (2603:10b6:208:2c3:cafe::27) by BL1PR13CA0433.outlook.office365.com
 (2603:10b6:208:2c3::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.4 via Frontend Transport; Fri,
 31 Oct 2025 14:43:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF00021F68.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Fri, 31 Oct 2025 14:43:24 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Oct
 2025 09:43:21 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Oct
 2025 09:43:21 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 31 Oct 2025 09:43:21 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59VEgf5e4024498;
	Fri, 31 Oct 2025 09:43:18 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Stefano
 Radaelli" <stefano.radaelli21@gmail.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon <nm@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v1 0/3] arm64: dts: ti: Refactor and alignment of VAR-SOM-AM62P
Date: Fri, 31 Oct 2025 20:11:02 +0530
Message-ID: <176192142806.427883.3758940649937563092.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251003125031.30539-1-stefano.radaelli21@gmail.com>
References: <20251003125031.30539-1-stefano.radaelli21@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F68:EE_|MN2PR10MB4254:EE_
X-MS-Office365-Filtering-Correlation-Id: 2467af20-0fbb-468c-a5c9-08de188bd8bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|34020700016|12100799066;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?STRGTkc0NHN0dHArQnpoSXAydlFuOEdhVnUvTTVZRXkrc0FTQ2g0MS94TnpK?=
 =?utf-8?B?bHJ3NDZ5ZXkweURGR0Z3bjE4VmZHV05VUlFiNkFkYXV5YW1DbjZPR3FISmhj?=
 =?utf-8?B?S3djQ1FiOWdib3NVTzRIeGRLS0Z0emI3c0FXemRRMkZMUi9IaEI1TG5hT1F4?=
 =?utf-8?B?MUthTlEvUGt4UjVyS1B6d0dwVWtVOTc4YkFlVFdwUDB0SHE5UUFpdEE1S0JD?=
 =?utf-8?B?RTV0cE9MNmY2bnpaNTllbkhkRVF4Y3dDVlFMUHVRK2FNNmkyK1VhZkRvV0Iw?=
 =?utf-8?B?cndKKzEzc0pUMi9kQ094L1RCdGdtc0ZscDE4c3k2VVg1ai9pOE1pODJFTGpn?=
 =?utf-8?B?eG5mK09YZ3lreFVnczNEN1JHcDlXTnNDU2NrbFZWeGMwVGtJWUlJUVZvdjVL?=
 =?utf-8?B?RG4ra1gvNHk2NXRUemErQzAwR1hDdWNDN3BqdEVBcFlpcUh5SDlnL09xVER6?=
 =?utf-8?B?Wm5SL0k4NU8wQ1FiSkdDV2lnYUl2YmJsR09KaGFqVUpjZ1JXQlU1cEhCd0Nx?=
 =?utf-8?B?L1ZYZU85N2RoSVBGQm5QVnZaSFNlVWVOVzZFZ1FRUXlhVXdJejFoWnBjZWlp?=
 =?utf-8?B?dHJHUEVlek9uZkNqWVQwUk1MU0V5UVcxcmJTeG1yKzY0Qmd4UGtOVWxZR0xJ?=
 =?utf-8?B?cXVxUFJOaTIxc1NxZExpYWY1WVZZNFd2UzA3Q0NveExzK0VLWGNVMXluWU54?=
 =?utf-8?B?dGxGOGxkMWJiV3o3VkRXcnVkbUZCVk9JOWNxZHlIb2JiZXFoY2Nsclc4SHVw?=
 =?utf-8?B?Rm5uUEdQczVxZ3NOQk0xTi9GZVB4OW83MDU4YnAxN3FGMk14WFFhY3JXNTVX?=
 =?utf-8?B?RTNna2JlYXpTWSs3bGJyd2RkcUR1bVkya01XK2cyNzFaVjBDZ2NnUFZUSkxJ?=
 =?utf-8?B?YTRTS3BPL3JhdFkzaXNkOTJoL2dFRmdVVVd3eTAvTGVGcW5wRkFWSlFHWisx?=
 =?utf-8?B?ZE54NzRzT2c5MHVnR2tWS3RjR2JTc1hPcDNTTU5hYmRGZ0JCMXN5U1dzVnRX?=
 =?utf-8?B?N2xVdlhiVk4xaDRreXFvTC9sdEJWTVBUWFVadzhtYWRZLzR0OGQ0VC9UU05k?=
 =?utf-8?B?OEFUNUQzZk9lOWQzT1J1VDNXSXdodnpKL1R1alJ3Tm0zY0I0RS9YL29NUGlZ?=
 =?utf-8?B?QW9lckQzYittbGFDU0VlVS9QeHNvZEUxdVBkQlo5ZU9PeExKM0VNTzF3VFp1?=
 =?utf-8?B?VWVTcE5NOUJaRCtBaUIwRkFnZGtjeU9yOUFQZkRGVS9yYjNKTVIwVmt5TG1Y?=
 =?utf-8?B?Q0xFT29TMTRVQlFiYjlXMHMzZDFvcXZjanR1cGgzMW9pOTZnUHVpMmprWVgr?=
 =?utf-8?B?UGFpelFFQ3ZBZGFONUp0VmQzZWhCRDJDMi9LMWtuS3FaeG10by84M1hQSm9V?=
 =?utf-8?B?UUdJOE9rUG55alA1TVpOR2tLeDJTcFZXVHBEKzJEVFhudHNQdFc0dENoSlZH?=
 =?utf-8?B?SUJEWTJCT28wTVZwYXRrV2tqbDc2UGJSWmdHd25XUFlDRm5IRUF0R3BKQVla?=
 =?utf-8?B?eHIyOFo2MDB2V0lUYUd3SUdTc1htM3VOd212TFFhMUpwQU0xcTYxRXpTWE84?=
 =?utf-8?B?TU1qWXJ0OEVTWFZFTXY5TmJCV3BoaHpsWmFHVmp1VTJpb3UxQnh0eUdhSXpi?=
 =?utf-8?B?Ni9JZjg4N1gxQW0zblVNcFJQVUhwamwva09ENGVBaTgrbWhwL3pzTHBFWENE?=
 =?utf-8?B?eTdsVlNyRlRtVEllUkpncEsvSjZka0d2dDJOWnQrZ3FROE4rZm9PYWZXZTF2?=
 =?utf-8?B?YjdjT0I5OW9WbVkxajUwc2cvVkhWaWRxQlA5VXFjcVlsRmtWMjhqRjlSZmVU?=
 =?utf-8?B?NU55M0ZlbDVXQ3RmVTRhY0V4RU8zSGpURzU4WmlXcFNveFcrTUVkZWo0dDQ5?=
 =?utf-8?B?dFZwSmxyQy84L1QxK2tsbHl1R3ZRdUtpSy9MZ3FPVVpvRm9YM1VCR3Bsa292?=
 =?utf-8?B?ZnJCN2Rrb1dqT24wa2puZndEdXNIMHFSZm90REdRMWZGQnRtbGRjQ1E5ejkr?=
 =?utf-8?B?R2hYSmd3ZHZoSEZKTXRZeEQwdkQ3VTFDb1ZLelkvb0ZCTVpEWnpLQ2lIK1lO?=
 =?utf-8?B?QS92dUcwTnZuQUt2bHVFc1JDVkw0RytwNzVZZjdVVjcvNzZ4VWFpdHdHTVNF?=
 =?utf-8?Q?P06Y=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(34020700016)(12100799066);DIR:OUT;SFP:1501;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 14:43:24.8208
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2467af20-0fbb-468c-a5c9-08de188bd8bb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F68.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4254
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_074331_093572_9F1E8163 
X-CRM114-Status: GOOD (  15.79  )
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

Hi Stefano Radaelli,

On Fri, 03 Oct 2025 14:50:26 +0200, Stefano Radaelli wrote:
> This patch series introduces updates to the VAR-SOM-AM62P device tree:
> 
>  - Patch 1 refactors the IPC configuration to align with upstream changes
>    by including the new common k3-am62p-ti-ipc-firmware.dtsi.
>  - Patch 2 adds support for the WM8904 audio codec, enabling audio
>    playback and capture.
>  - Patch 3 adds support for the ADS7846 touchscreen controller available
>    on the SOM.
> 
> [...]

I have applied the following to branch ti-next on [1].
Thank you!

[1/3] arm64: dts: ti: var-som-am62p: Refactor IPC configuration into common dtsi
      commit: 1d10e0e78c2eb91ea62e0a497de1d29f535351f9
[2/3] arm64: dts: ti: var-som-am62p: Add support for WM8904 audio codec
      commit: 6f41007cf80d94b689fe4d7e07535dcd427802e7
[3/3] arm64: dts: ti: var-som-am62p: Add support for ADS7846 touchscreen
      commit: 397dae3cecd7bfa8e77fa18edc38a69b9459811c

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


