Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93EDDCCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 14:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zUfSphfviGvLBdo4m8BZs8qMrHk1cfi3jP4pMsQr4Jw=; b=qiWp4jyUdutFKVb6XLwf72MIDf
	bTMsdRfaLWT1ocWlr5azKB/G3PZm6pby64ARCTt2/R9/ILWEdBwD0SigsvBVFhiacbKbX3bzA0uKC
	0bC+FHOg30OVG8kF3kUtT7+mI9T2a/4pMRWNMWTizw6zWPDQyx0D2qlmixQKiem6eSG+qrxkpBIHd
	I+T5dWxtSFCtx9RFMsun1ilOvEEtQEoLAjJKiwSvLmFDIRWjye+bIfWwfWG9b83XhvQu3tgG2hSr3
	FgIEt8BHO+3wSBB0rJO4ScIlG/CQ4szP96e7VV1VsyTFleXtEDO7jRdg1Lp1I0SiBXX6Ifm6H5Jwp
	zyGOv2Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEqMX-00000006GLI-26c7;
	Fri, 31 Oct 2025 14:44:21 +0000
Received: from mail-westcentralusazon11010052.outbound.protection.outlook.com ([40.93.198.52] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEqLl-00000006FvI-2TEI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 14:43:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YpCoeUoWcOkkph5vNtooDreZfMmLT5oXAZx+rqJ/tm/qq+nCxwn8uQ1WxGSkjeXzBA+XOvnIof0VJGVmAbI8HzC0JQd42DzvY9nJSfH5g/FGinbwfGpr+xJh0OgBd5SZNlqsWaadAqWFQPCaOOzHDm+Ujp+30459+WyOpavOc7zyrbeDoIOBP8XWtoDkyuGfcK5ElY3hHR925rsaAuQX3FtsN8s4NohrGiU7fLIygoq9mDvqpic606Gf7FJdEQSk5NCWOU0H7Lv/nQxdborNFkDdZlVPdH6io63D7wzleIc3uImHyj+/wfyP0HfVTmGMjfMSqum93f+d7G0OtizPQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zUfSphfviGvLBdo4m8BZs8qMrHk1cfi3jP4pMsQr4Jw=;
 b=fF4szcaZRpBQG/CIWe0spepnM7eSuW7Vxda68xVMuYGmzlYUiKRTklBmMkj5tgJAPYvyiamyZ0kvLguRTvKvvJfZoieSfCqPOZHktSuqx8hdxqkBRsSe3y56mWcLSAKqLdNNKRYwfeuuyhQm4GhYdmDC38L7/bS4YTKbINssoTVO6wfOauwZZ0hy5z2/u6VVRgTP08ETWiINaQUmajmlQZ89k2/IL6r8Kbmgt8zMQMME35gcDrq2rnWmx8lX35ieA9oSz68+5ItJpJX7m05S8+NFclBSAZq+HEdvaNXp1rQn04DKUOSLOLefV4BioiBwq29s+moP9pRwc10sCbkgXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUfSphfviGvLBdo4m8BZs8qMrHk1cfi3jP4pMsQr4Jw=;
 b=PxV/h2Xk3O6XKC3Q8FDGjY5Rgpvz0bDV0vix4iYNVjSVGp4R9Cnu3GXhpXnhJh0kQaM1Mj9xXL/PZzDp9hOb24gTlP+Kz1WrqxM8kvaHGqS8q7ou4FXjiINoeiWgqpA60lFgRtKCNyecXMkUAs4a3PBHAk7VBGd0296FGpBteOg=
Received: from BL1P223CA0023.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::28)
 by SA3PR10MB7022.namprd10.prod.outlook.com (2603:10b6:806:317::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Fri, 31 Oct
 2025 14:43:29 +0000
Received: from BL02EPF00021F6F.namprd02.prod.outlook.com
 (2603:10b6:208:2c4:cafe::fd) by BL1P223CA0023.outlook.office365.com
 (2603:10b6:208:2c4::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.12 via Frontend Transport; Fri,
 31 Oct 2025 14:43:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF00021F6F.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Fri, 31 Oct 2025 14:43:28 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Oct
 2025 09:43:25 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Oct
 2025 09:43:25 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 31 Oct 2025 09:43:25 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59VEgf5f4024498;
	Fri, 31 Oct 2025 09:43:21 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <nm@ti.com>, <praneeth@ti.com>, Shiva Tripathi <s-tripathi1@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <kristo@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <kamlesh@ti.com>, <t-pratham@ti.com>,
	<vishalm@ti.com>, <k-malarvizhi@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62: Add RNG node
Date: Fri, 31 Oct 2025 20:11:03 +0530
Message-ID: <176192142804.427883.14958763557860405096.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250926100229.923547-1-s-tripathi1@ti.com>
References: <20250926100229.923547-1-s-tripathi1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6F:EE_|SA3PR10MB7022:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d10677b-dd74-4ce1-1ea6-08de188bdb28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|34020700016|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dWl0d1dQRHNVck5DNFcyRFBMd0UvYXNCMXhmdmtSdldkQm1WVlFTb0c4Rzdl?=
 =?utf-8?B?VndFYU55TUFTR3JhSUVIdXdkb0JHczEvTEI5d3NVeXkxL3pHZlBsVmQ4Zkh3?=
 =?utf-8?B?azRwZXVPczdRTlF3VS9RdG01QVozNEFWTDZyYTV6UmtXVU1QR25iUFdKVnQv?=
 =?utf-8?B?UjlUVnRnT2FHTFUxaGxUYk9jU3piUU1MM1g3UkgzNFJubDZZZ0dDRHhtbzM1?=
 =?utf-8?B?ZXd4bExsSGM1MEs3NXpWMThYVlFpbWp4RVYrVDE1bWE0VEFrRmx4dW1oaWNz?=
 =?utf-8?B?OHk4MjFUWnhhc283ZUR5MVVkUnpXQVgvSGViRm9oZTgrZHBJY0JNWGkyaHg5?=
 =?utf-8?B?ZFA0S3YyWXFHVCtLejkzcTY4MVEvTW5vNnkxd1J2M3VlNDZzSXluRnVPN0lH?=
 =?utf-8?B?VmpDWE9MK2UzZFJkRU9IL3g1SW9CMzd3REd2YXNyeXM3WWNJbkZtS05nVWlW?=
 =?utf-8?B?TnBFdHBQMG52KzJYSU9NODQ0QjNwdTNhaTlGSVRCM3cxVnJOLytBakRNSXVF?=
 =?utf-8?B?YjBxTXJxMy80WVd1R0pZZ2ZvOGZsNDMwVHpZekdybi9yUW9aK0JUUU8zWjN1?=
 =?utf-8?B?UzJ0M2FNK05tSVBuQXpYT3dlWHg4UEpjRDBqeGZqYlQ1K0p6TXNzWWxKTlVi?=
 =?utf-8?B?SFNycnFSSDl3Tk16eVJRcUtnL3FXaDFMa3pUeHcwSHhqbVdKQWF2Y0J6ZXBx?=
 =?utf-8?B?TXR6M1o3dHZnVmg0aGczSVRORjRQaXBSdkFuVnl4SmJMV0pWVTExTWlQeERE?=
 =?utf-8?B?U3NRR3QrdWVZd2ZiSmVZbmdhNGxaVlJuWEVURFg4SGV6VVBnSUZBNmVFQ1BW?=
 =?utf-8?B?dFU0enAwVnd5MUpPUVBXV3B0UXVUY1cwRzRqekdtcTlSQ1hyTHRTaVhCQlVj?=
 =?utf-8?B?UTAvQllvaXE3ZHZJZlh6MVRXaDFOVmtobG8ySnJ1TkZKaUJ1dzhMR05mM2kx?=
 =?utf-8?B?T1lHN21JenN2MG1PdzhmWWp5ZExRN25yeUxTSjF0RHhhNllpQVpvZFQwZk9u?=
 =?utf-8?B?dnpTSFBSR2EvZ3FuMlEyRjdsSmNPU2pmQnBCQ0pDNWtDUWdpZTl1cldzVXdD?=
 =?utf-8?B?RWVGMXBzeHZiUGdnTlpGOFZFQjZBUm13TFhmd3F1RlRpNkFCQ3ZSbWwrd0x5?=
 =?utf-8?B?TnJtakdWbE5RalkwejVWcXEwd3RQdEFlakw3M29CaHpuR2NTSlVUQXNaVklX?=
 =?utf-8?B?NjlIa3pPOHdwTjhFNHhTSEF0aHdRM1EyR0FJMTlyaGIzM25iZDkzVnMrN3Zi?=
 =?utf-8?B?eFNlNjlGUFB6dC9vdUsxdEVtL0ZPWi8rNVJyUDY2K1BRRmFvc0x1T0tvRFlS?=
 =?utf-8?B?R005eUF1MGlHS3lxenducnczZUN2R2taYjFqUk1zcHRNb3FRek42TG55NXVw?=
 =?utf-8?B?cGRFaEEralhCVm5jT0R6S1o3bE9Ta2xUdnJOZEpzT05PN1JhUmMzd3E2NWhC?=
 =?utf-8?B?eHd2ZkduL1BOaVoydEIwNExROC9CandIQVBSTWhCc3hrZnBEa200dytKVi9E?=
 =?utf-8?B?WjU4clpZTmZIbklLTHFIekwwVE52Vzd1NmdkRHRXNGtSRnp4R3diSnFGQ0dq?=
 =?utf-8?B?UW41VEtlaDM1Uk1KbndBWkYycXpiTGNmU0hOTVJtVU5kSlpwOGcvd3Yyd0lv?=
 =?utf-8?B?Ly96ejV0TXJVN1Niam50cFVKS2RLNTNBcld5UHU5Tzc5YWpnNGtxMlJDMCtR?=
 =?utf-8?B?RDl0dFNlS3NXMG1nVm1CeVp6eTJ0N2ZFUy9IUXNOMWo5VnRMUHFQcTNIU2pl?=
 =?utf-8?B?SU5pNDUwYVpmTC92TC95TGQwQ05yN3F5Y0JwcWh2MzJZK1g3ZXlkYk5BSDFD?=
 =?utf-8?B?MzlWL3VXbjFxWHhsZjlSdTdhVXVyVm1IQ0k0RUxkQ1RBdnRnMW1wTGJGT0l3?=
 =?utf-8?B?OUE4WVBJSVJrR2JrYTdvNERSaE0wU0g2NTQzeDhKcm5jV2ZJcDJwSDh0bEJN?=
 =?utf-8?B?RzRPNlExeWlicmE3MTJETURZRjZvUjd2WEJRUW83bnBsb1FKT2N5bXJWYkVs?=
 =?utf-8?B?RFpqRGNNTUZZRnF1RmRRbTN1S3pvSisrQ0NvRHNrdnl5VjBaY1JIQk9JZDBN?=
 =?utf-8?B?SkVGdGNUV1k4NTJQK0h2UmxaaGFZZUJqODdLVGpVVXpJQ2tGaUtuOXJhaEIx?=
 =?utf-8?Q?B2fU=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(34020700016)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 14:43:28.8379
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d10677b-dd74-4ce1-1ea6-08de188bdb28
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB7022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_074333_663547_B823E867 
X-CRM114-Status: GOOD (  13.44  )
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

Hi Shiva Tripathi,

On Fri, 26 Sep 2025 15:32:29 +0530, Shiva Tripathi wrote:
> Add EIP76 Random Number Generator (RNG) node within crypto engine for
> AM62 and AM62A SoCs. The RNG hardware is integrated in crypto
> subsystem at address 0x40910000.
> 
> Mark the RNG node with status "reserved" as it is intended for use by
> OP-TEE for secure random number generation. If required, this hardware
> can also be used through Linux kernel by enabling this node.
> 
> [...]

I have applied the following to branch ti-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am62: Add RNG node
      commit: 67106d217170161383b22c964192448a46fd13fc

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


