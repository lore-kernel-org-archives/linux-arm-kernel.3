Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4246CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 14:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r16HOsdHrokCnygKXzJqFuEiJ7p0Vy0XUfBxLQB8xos=; b=MTXpasy5SHa7se5hVcHh5caTbG
	L2EWn+J3494iqgTZ7RBsUD9midkfvw5jFvVUDVHJjelDUaHvT2631ddruKLp6y4Y0EnNoHOPx6zpn
	G58d/mf6pqWk5j2+EAp+BHJl6sGGw9v3eneKiwS0YzBz4KbfS2bud3BVXUybS6Dj7RdD1/vfQJes6
	/AIudL8OQ8Npyw0EzsAcc5/3+XYNZleFyUOvVLQsX9VlA5iBtk/UXmMI6R7nkxjWqQDIJv1gNXun4
	O+VdwM9kcCGtmFeFQa/lGDc0hIpFPYExNittMQ9XUsequWEcd4UwN0RpwWN/gxW9LyaQeYM2vHuO8
	aaWpXK9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEqLh-00000006Fqf-0diq;
	Fri, 31 Oct 2025 14:43:29 +0000
Received: from mail-westus3azon11012039.outbound.protection.outlook.com ([40.107.209.39] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEqLI-00000006Fk0-2Tg5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 14:43:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GR4c06yPfE4xjCE+VeU+onGMRWRGRP1d+FoqRYHobhps5mamN0zcEST6sJ5V1gEnee0GZ9incb/hx8kqCWNWGDxkbnjY8lYyG5oL/feJPAxB94vJmxor09Zk8uY6Jikt3dtav/RrO5dLyFid8wowQrKvMW5J6qe3f5Zy1/X3gPoazIXNCLvNvOVQpmKL92wT8w/JaJ2Xc1/zgt6mHxCsACv7t95TGIc8lMXzd/wFlzedYpBnJYTUh3XyjCM3xJVKIX7GAOvZtTn4kFVR5mYY8yyPL+/7DD+ykpFrP/bxTVcB2TJ+oYpSVIpBYq0mp7j8EJ2suIgx0+JYmfhjLubEvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r16HOsdHrokCnygKXzJqFuEiJ7p0Vy0XUfBxLQB8xos=;
 b=w8vQYbh1DEm2fyThOjKtGvHGTVgNr7fRtemlTYnrE5Q0hW5WgKyGhIHWwTEOiQW6K24uChbG9ffcad59UePTM6AE1UnLiOH/jCc4ToWfZ5IwNaqrybXiIvF+NNaitmnjp+XDTsZTp/LFN408WuEj2OIGYl9USvbGndT5j4/t2ST/P641FbxgXSVH7EO3dLGYz534bMXCpjBvqgNdIbAibMyGK64KzhP7R0dqNHsndrVzy4YTJxDv9O13mjF5lYEmmRJ2NSRiURo5m/VWATNKcA6IsA5d31KbTuID09YrPzfawpWsoTs0ENYLUH7ur1/O327CfxnjViTfXcm5gxaWrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r16HOsdHrokCnygKXzJqFuEiJ7p0Vy0XUfBxLQB8xos=;
 b=lUhAPbpiUqB4IHsBAFoj2wt055we2XMvApnwx1GvXe9dTwqaaeZ0c34d4LWO3l2KYaJKdPFEnL74RPnBvuJPmS8PV1fh0e8TbGDuXXKzH+VilTetU74O7SMZJERkNWuRqLdTIbNvbZYrt0e1hn5eS/rXJwcd4h9QPtpura6efmU=
Received: from PH0P220CA0016.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:d3::19)
 by DM6PR10MB4316.namprd10.prod.outlook.com (2603:10b6:5:21d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 14:42:59 +0000
Received: from CY4PEPF0000FCC0.namprd03.prod.outlook.com
 (2603:10b6:510:d3:cafe::b1) by PH0P220CA0016.outlook.office365.com
 (2603:10b6:510:d3::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Fri,
 31 Oct 2025 14:42:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000FCC0.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Fri, 31 Oct 2025 14:42:58 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Oct
 2025 09:42:55 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Oct
 2025 09:42:55 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 31 Oct 2025 09:42:55 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59VEgf5Y4024498;
	Fri, 31 Oct 2025 09:42:52 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Michael Walle <mwalle@kernel.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/3] Initial Kontron SMARC-sAM67 support
Date: Fri, 31 Oct 2025 20:10:56 +0530
Message-ID: <176192142805.427883.17050945919190775595.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251017135116.548236-1-mwalle@kernel.org>
References: <20251017135116.548236-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC0:EE_|DM6PR10MB4316:EE_
X-MS-Office365-Filtering-Correlation-Id: ab6779dc-9a51-43de-3a4a-08de188bc919
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|34020700016|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?djJLb2w2V3ZUNElVSm9WdUp2M2xIM1BnZjBoT2ZyWHdzSHE4YlFqOTJEOUMw?=
 =?utf-8?B?MjU0dUNyblcvd255dzU3QS9Ocm1peHFsWjVkOWpuZjMrZXl5RlFQN1gzK0lR?=
 =?utf-8?B?ZTE3SnZSMkExYVo1ZmtFdlBvZ2tpUmtDU255Y0czNnFocFJiWWpwc281RDVN?=
 =?utf-8?B?YXN0UVJUK3liQmFtMXhzdmZFY3RmczdxM2Z0OUJ0REdkVU5tc0hkd003WDZx?=
 =?utf-8?B?M3EzOVZPbzM2SE5JcEVzRFZtSnFIOFBISGduS1RsN0k0UHJ4RUhmdW9KdWxm?=
 =?utf-8?B?cnVGV2x3NURnZG9mbWQ1dDBPcUF5cDV6RXp5QUJHWHhnYUJlNEk0aHFhL1Na?=
 =?utf-8?B?SHF6eTlEMUJneHY1QVV0Zit1RndmNzZJb0V6N3YveE9RQm9pNGt1a3dwM3hw?=
 =?utf-8?B?MWEycVVIRy80UzZQaGlMcmkyK3cxbFB1SkxCNTVxblNydFRrY2dxZHBXVzlp?=
 =?utf-8?B?Q2NGRTFNdHNVNlJwRzZlSHUrNTZFaHY2Y3ArTHRhdFpJYVV1aUxiemtvWFd4?=
 =?utf-8?B?RW5vVVY4OTlhekpPSU1MeHNSTFhSc0pFRGF1QmRGdU5DeHBIc08xQlJ5b1hH?=
 =?utf-8?B?eUJLTE5TeUh1dlIzVWFwdjB3WW9SZlVnd0xJNmdCOWdkVWJWbkQwZGtMVjdN?=
 =?utf-8?B?SUpMdTYvd1h2MEV4UUljUForMTBrd2VrN093QmV3b2RiTEtZTnk4UTl5SVcy?=
 =?utf-8?B?bFRrUll0L3pwTUtLUWpsMThqUmRCbUM3K1RaQkJJL3NqVm54VHRwYkFMbk9C?=
 =?utf-8?B?Q05JcUh4alBYMWhhbDNjUHlGY2F1WGo1S0hGWGp4KytUMXJOcmhERUcxNUt2?=
 =?utf-8?B?Q0JOSU41aUJUalhZdWtZS2tzSW13OGNRN0xuTzY4a0lYaTZIY1o0R25HQzd2?=
 =?utf-8?B?UG0yZktBMDhORlZSd25XS1diVnh5TU1MNk9SSHNEdGlFK3pxMXdtMVluOUVJ?=
 =?utf-8?B?WlVxSEVHTUQ5NGRmT0NIc2UrWE9qQkxKS3A2WXh6L2NJV2xuNVZJanN3YVp1?=
 =?utf-8?B?KzJjUjhpRlY4alFXMXc2a2JWVEhLcnR6cmdpU0E1VS9jYURDQUZ5ZXRJR1V1?=
 =?utf-8?B?TWdqNzJjaWI5aUlQSS9TZkpnb3R5ZllVZE1PM3QzR2hucG41NHRzK3hGNlJq?=
 =?utf-8?B?R3VZSzlBTUhCcmZ2ZnUzZVFrWWV4c3VGN3dqQmdsa3pxV0V0cHlOckprWFNy?=
 =?utf-8?B?WmViS1ArNEhJd1VoYWZZTkFndzV0bUgxbXJmbjc4aEdiandWeS80WThPU1Nx?=
 =?utf-8?B?OXZQcUsxTld2ZmxzSnNPK0R2aTE5OUh1WElEY2FHenFMNEl3ZGVMTGlPR0k5?=
 =?utf-8?B?c0NEamNVdkQwb25aMEk0RTRrMFZTRzA1a1d5Q2ROOU9qbnB4Nys3d0E3Q054?=
 =?utf-8?B?a2gyaGRXbWJZK0Q5WFhHSHZUK2RtTitXbWRQcWRIWENkNjNHTEhqblBOQ3pl?=
 =?utf-8?B?YldBemZScDR3OEUweWI4SUVIbkhKNUFxQ2x4aHc0aUkyVFNBUVRGdzZxa09o?=
 =?utf-8?B?ekZCWHorVm1NTDVCaFkrRCtwT09VL3VUSmVKeEZaaEt5SUgyVlphVFd0dE82?=
 =?utf-8?B?YmFMaHVIbFRHdU1Oam5pd0xFL0x2SzJ6RENwek1yVENhL3JFZzZYNDE2NWww?=
 =?utf-8?B?aVBFWTllZGF3dlBMU2o3QmJQVjBaWjRzZlgyZ2tRTWRrL05MeXA0YU1DQ1Vx?=
 =?utf-8?B?NFA1VmJTVGFXVDZkNWpKOHNrckd0VlAxamVpeXBIa1dLVHh4SmJoZEIvZE5O?=
 =?utf-8?B?V0M2b2tuQ1JWVFp4WmIzSDJrUVRVYno1Y00zeDh3QnN5bC83d2lEZUg0M3hJ?=
 =?utf-8?B?bU54R2RpUzJaWCtwK3ZGa1E3Z2FNSStVRDNaWmpINDFlMjIwODdRRE9lUEtt?=
 =?utf-8?B?QmplUHN0ZXl5ZWY0SCsxeDZndmNFakpNbFl2QUtHancrK3Y2OTlacldsY0tM?=
 =?utf-8?B?SEFlQlQyWXVtckdtdXNiV2ExMGNlOGIzNmwvUnc1RzJPN0VaTXRqN0tOUW9n?=
 =?utf-8?B?UE5EVzZEY0NlR3E4S1J2cmVnaHkwOGo4bzcxUjZ5K09iZW1oSFJGbGZORlZ1?=
 =?utf-8?B?dWN0L293ODdlTzRDekdzUDBBd3ZWaHcxd3VIR0FVdUlEckc2amk4bkRDZ0o2?=
 =?utf-8?Q?rEI0=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(34020700016)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 14:42:58.6119
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab6779dc-9a51-43de-3a4a-08de188bc919
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4316
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_074304_640352_8CCE45C8 
X-CRM114-Status: GOOD (  19.14  )
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

On Fri, 17 Oct 2025 15:50:43 +0200, Michael Walle wrote:
> This series contains the remaining (device tree) patches for the
> Kontron SMARC-sAM67 module.
> 
> v3:
>  - dropped all patches which were already applied
>  - add 'bootph-all' to the usb ctrl node to support DFU boot
>  - as all MFD bits are now merged, combine the patch which added the
>    system controller node into the main one again
>  - drop duplicate RTC node. This one was a left over before the rtc
>    node moved into it's own overlay
>  - add a new overlay for the Kontron SMARC 2.2 evaluation carrier
>  - add a new SMARC gpio overlay to configure the pinmux correct.
>    This is not integrated into the default device tree because it
>    will conflict with any device tree which will use the pins for
>    different purposes (they are multi function pins)
> 
> [...]

I have applied the following to branch ti-next on [1].
Thank you!

[1/3] dt-bindings: arm: ti: Add Kontron SMARC-sAM67 module
      commit: 22e1d0d8cda783bee95de578cbda3ad0da8a3eb4
[2/3] arm64: dts: ti: Add support for Kontron SMARC-sAM67
      commit: 1c3c4df06f9dee41bff60b93d9f0e67500f798f7
[3/3] arm64: dts: ti: sa67: add overlay for the ADS2 carrier
      commit: 0114330e7f92ae4f643fca62e6004631018f48d0

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


