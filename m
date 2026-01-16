Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0342C982C7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 14:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+9NRpbvQCNztzQ2xj2XPfo9/bTLvtflNFxyTZi1mPEQ=; b=j9LQaGYRWAN6GMG4eegFFxiBKp
	4+4egq1l5mb8NmHKM25BcwQnGuMa0T03gnnmMM1uPqew7SfwJRc3qbBUyJoW6LU23LJyZ5yxQpM9N
	zQ2sRq/UXs29ifNLLoGB4KoUMAl3Vm++vk75Fr1qaAId7RxQ6YHI3/aFmnKmL2EIy6GrMJL6WAMjS
	b/LR32VBEBCYJ0tnm3SNv1j6hwf1swBLZRaMqRP3x0YHU4r389mhTazHM+AS991WTXQDOUrOlNu+4
	UddX754bA3zCMTCH3osPoay9hyITnoAaM35ohpQzXFpp18PFqU5FMsjrZ3NeF3R5v3v84c1wiHsQa
	xuPsFK/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgkzR-0000000EH2J-3Eah;
	Fri, 16 Jan 2026 14:39:53 +0000
Received: from mail-eastus2azon11010048.outbound.protection.outlook.com ([52.101.56.48] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgkzO-0000000EH1t-3soh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 14:39:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x4ayaUPq6d3Tqht1va2hHpULCvP1yarGTinO97F95cetuvLepFOX7H5XJK5D6b/97rCQmnyeIHJTK2PfsUyZ1tywn+s7Dm1RMVfsdjvgUgG5bvmEWedmnAwBjUYQGsXi1LyfeDTOq7BhFJyhLC0OYFUKwis7oxQMj5ynU2bNn3nJ91eL3/roPX4JDKjs3aCjpzpAAD0UnwNIKBdl3rUGIWpkJL/bUaaxPKPvM2wQp0FVGQQIlk4PqRajtFSLKVhRdkA7eaYYSGsZQL0iKan+FuugGQIbtDqVuKc265UlpUFSYmLmaVcMdRNK0OjCqMn8ftPUxjCXrgjQWaGSTd65Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9NRpbvQCNztzQ2xj2XPfo9/bTLvtflNFxyTZi1mPEQ=;
 b=pN7ayKaKWpA2mrGkxiBjZZn6td4u7YzUH1r62K8jhGYm3P9gMJ09kZ2PNIqonUfWA3okiY6Z5Q/mQUoN5GjW02hpUrbJkBJRILJN68EX5mockCqk6/WS0IYELH3542iAJ/vyfVOwZT5hW7xycBMCxLsXVBudREEEhFwtKCO66dP0sAihlCZyoa7ALCNoK8N74gW5YVyaVpqeS0OhSyrxO597hUGs8DPHV8FUYc65xhZnon86JxMLTUd52PqpS0rNA22TXaPO35Km9lKXYxwrXX4TTCNNO14KmT+mZfLieDCJIad7PYBUyaFGVllKmaP989saMK5i1CNKEvK0KNemQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9NRpbvQCNztzQ2xj2XPfo9/bTLvtflNFxyTZi1mPEQ=;
 b=Qt84IgXouGLjOkSmc1eJVjCk832UM2ecV2rZGJM/jMQqwpULTkPuObTMh2nxhB1hBJ+8qE0U/egs7u/JABQKDHrLQQ3ecAVPpNLZePbGL/phePxBrlh9f7dLjLlpc/Td/8GsRIpAThIkc1hZ60jitkH35HyrKSjTvbDgefRBSoU=
Received: from BN9PR03CA0864.namprd03.prod.outlook.com (2603:10b6:408:13d::29)
 by BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Fri, 16 Jan
 2026 14:39:46 +0000
Received: from BN2PEPF00004FC0.namprd04.prod.outlook.com
 (2603:10b6:408:13d:cafe::54) by BN9PR03CA0864.outlook.office365.com
 (2603:10b6:408:13d::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.6 via Frontend Transport; Fri,
 16 Jan 2026 14:39:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF00004FC0.mail.protection.outlook.com (10.167.243.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 14:39:46 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 08:39:45 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 08:39:45 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 16 Jan 2026 08:39:45 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60GEdjbu3419686;
	Fri, 16 Jan 2026 08:39:45 -0600
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
	Michael Walle <mwalle@kernel.org>
CC: Nishanth Menon <nm@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] arm64: defconfig: enable Kontron SMARC-sAM67 support
Date: Fri, 16 Jan 2026 08:39:43 -0600
Message-ID: <176857429244.3703601.340857575047572204.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260115132558.1522169-1-mwalle@kernel.org>
References: <20260115132558.1522169-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC0:EE_|BLAPR10MB5138:EE_
X-MS-Office365-Filtering-Correlation-Id: f3c1cb0e-099a-4991-3c59-08de550d1828
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|34020700016|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WEV2MUQ0aExVNmFZVjVNcXJDTVNubER5RTB6aDYxYytXN0JBaHVtV2NXYng2?=
 =?utf-8?B?S3ZFZkVHTWdJamdPRVdoYTNFVHhkK1psdWl6MzhJNWtVajhib3I1eDVHUXRE?=
 =?utf-8?B?b0JneFpxS3ZacE84dkluNkhZd3p4SjJwVEQ5VlBNSXVoS2NBYVhKbXJvOTJL?=
 =?utf-8?B?VldHT3pWSjRtNndKU3pFSWxsZEF1NWtLNXJmdW9ETWlBcURkdm5OQUNuL1h3?=
 =?utf-8?B?YVNrcDROclVlQlE4blJHTnY1WWxBcnRPWlRFdmx2MjBoMXp0WnJaSStjNll2?=
 =?utf-8?B?M3QyTlhXYmFnWGVkTkhOM1I2UUdWamZOZEFnMk5DZkJVK0ZNdFplUkI4VHg3?=
 =?utf-8?B?Mnd5V0RtdUpKeEE4K21VZHN6U0UyVWxIOGxCREczNjF3UFBHa2VxdWc4OElu?=
 =?utf-8?B?QmNUT2lkcElySW5ERUVLR1NRNmwxcTJvQkl5SVNGdTVJUlBSVExiMFc1V0N2?=
 =?utf-8?B?VllEdlNiVE54VitqRkNaRS9ERVh1Zi9iQzgyaFNSUUR4T3dzNG5OY2NxWlJY?=
 =?utf-8?B?SWU3bnAzK0RnZmVJcHZoc2xJOXZ2ZTV2QWRBRy92aldvNGhhUS9VT1VsM0J2?=
 =?utf-8?B?aDFsNE1FQTZ3Zk16Wno0SFVwbi95b1c5MUdYUmlSaVhHMTJLbmthSTFmU1pn?=
 =?utf-8?B?MnVLbnZJZTlGQUw1Uk1OMmwyaVdzU2g1QmJWTndZeXR0QjJLRUxkY3NqM3dB?=
 =?utf-8?B?VFpyL2dOa2NVRXhMbWhsZjdEdk9tbmN2ellUZzJHR25OdkhySEgrMThrcUd1?=
 =?utf-8?B?aE1scnhadExPV2laTGg0L0pmQkhRSEJCZ3FFalNsUXpHNWxHMkF4bXpVTVJx?=
 =?utf-8?B?M25WelRXWCswWW42WURyWTNRZ01Fei96cm5oR2FxNjZxT2JlNXFIYUd2TCtl?=
 =?utf-8?B?ejdCdzFNdUJRRG5kTzgxVmNNVVBEUzNVN09aRXd5Wi9JNk9weEt0OXAzWmlv?=
 =?utf-8?B?QjNoblUvbXdPcmJnSEJ5aWRrdHhQeVlTcVhVaVFSNkV2L1RwYlVyaXQycnFB?=
 =?utf-8?B?NE1oQmJwUUU5OENYaEZRWkM3Q2M3M3lxTXh0cjdlWDlvZExxS1hCb2pFbUh5?=
 =?utf-8?B?aE1mSWRicWxKeGl6UDRMT2poU0JEdGRRb3h2UmdpbUdjYjdndG05dkV3b2VU?=
 =?utf-8?B?eUFrMUVVUWVGWWduMGttWDdXTWFlRkFLZysyQlVHdzJxNGFXZWIzQis4VWJB?=
 =?utf-8?B?aUJxdEFCNGxnQWZMdlZKbHNiMm54M2VzeEFUd1pYcjY4ekQvU0tvcERqekRU?=
 =?utf-8?B?eTZyeW1OUXpwQ0lwM2VMWitkZlozdFFRRDY3cnVWaFdyZmQzWkpvK2RzS1Y5?=
 =?utf-8?B?TlpTU09WMThLd3c3WSttU3dqL1BzMXlYNzV6WExlNXlFK29FNVlXdlVleGdC?=
 =?utf-8?B?dVR4cWkyK0dyR3FsQll1MDRNVkYwTDdSVEo5UnZwSnVxM2dEaW1TYzNUcENS?=
 =?utf-8?B?ajU4eFRpNHh0OGlKbndsRnk3RzlZRVlqMkJxVWp2Q2Q5V05XYWdmZ3NLRnJ3?=
 =?utf-8?B?a1V6aGJtck02NTRHeGNiRUllUHAzYktUVkJ5S0xYMXpjb3FVVEpOU0hGZVhj?=
 =?utf-8?B?Mlhqa3dVSCtGSmwvNXdacDE5cXpKc21hSHRFNStmcThKdjBhN1dRc0duNXVL?=
 =?utf-8?B?RnBTZC9JOFNVbGlqVDNXaFNSM28wcFR5WDdaK3VaYnlka3hheTFQcG5SL3VO?=
 =?utf-8?B?UXdmNXJuSU5oUUdHblVLNEh5aDRvU0V4YnBUQkdxSkNZVWpqRFYybFBNUzR2?=
 =?utf-8?B?Z1gvMloyTkJMTWV3d0p2eERGMUtnUjZaZ3RMdjZmcVBrWDhOcWUvaXVjTUJR?=
 =?utf-8?B?V1NxenpVcUhIblllMmxvcHhjMnJzb0t4eVJlWkZyWjRyTWhpSDM4QkhPUXhY?=
 =?utf-8?B?WmJVWmdtY2lrSTBnanM1WTNoNHNoQ2xvcnFxSnNtallYT0hVYXc1RTArNStE?=
 =?utf-8?B?cUNpK1NCWXJoem5NNHdXaGkwZHl3U2JpbWdjQ1c5UU5JdzVKUStSSWM3N1gz?=
 =?utf-8?B?eDdIR3BxVUFtVks1VVNLbWdsTCt3cmM3UGlrQlRscGl1VzgxNnhFZHRqMDFU?=
 =?utf-8?B?alg1SmpLcmxLcThiVnFTeGRreXdNSitwM3Q0b1NjWkpIWkg5QmlEaStiYW9p?=
 =?utf-8?B?OGFud3NzOHQyNTF6OGhJWk1XNTQ3VkxyM3cvaVYzd1JITHhiamp2aFhlaHVN?=
 =?utf-8?B?T0wyLzhEWnNlYmd5WkVCQktkOWRwUWpLK0NXVlVEdkpERk96RG85eHUxRHRI?=
 =?utf-8?Q?T2h7ecyZ0eKtcTPlRMmQ+hTDFBSRzj8NUPk/jPXSOQ=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(34020700016)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 14:39:46.0271
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3c1cb0e-099a-4991-3c59-08de550d1828
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_063950_967073_580FFC6F 
X-CRM114-Status: GOOD (  16.57  )
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

On Thu, 15 Jan 2026 14:24:41 +0100, Michael Walle wrote:
> Enable the modules required to make the sa67 module function
> properly. It is planned to add this module to KCI.
> 
> Michael Walle (3):
>   arm64: defconfig: enable the J721E PCI host driver
>   arm64: defconfig: enable TPS6594 power button module
>   arm64: defconfig: enable sa67mcu sensors
> 
> [...]

I have applied the following to branch ti-k3-config-next on [1].

I had minor cosmetic fixups in the series (in addition to rebasing to
v6.19-rc1 as it needs to be for pull-requests), do report if i need to
drop the patch series if the changes I have done is not ok.

Thank you!

[1/3] arm64: defconfig: enable the J721E PCI host driver
      commit: f69f88211c84d00d469ad6b9e2f7788be4644d0d
[2/3] arm64: defconfig: enable TPS6594 power button module
      commit: cf6a123141e1498a9249b21c629958400bcaa580
[3/3] arm64: defconfig: enable sa67mcu sensors
      commit: 3aae37fb967b0158f928c85e9c1965dd01e826c1

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
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource


