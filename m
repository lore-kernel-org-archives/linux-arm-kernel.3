Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A41CD98D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 19:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p5tT1YjAvTvWrCsOeSRhbBtFIja1NmzFI0pnmzPwbyQ=; b=xkb9NZpRgDFYDflxIbB0OJG2ZM
	R3rt9L4RERg9U3t6vjoKxp+ImDNWzVKHHccxvnJ83oixUlWt+W6af2IVLP2QqzBczbs1a/fNxIiUJ
	tLS570m9bVvCzDG1XBKLW39xkLJRmBelpmm+R/W/McEH4JG6C0L/aVNcKFivdLtGet9uWtGdxDXZ7
	Dn5rfCrXuPcQm+rCyJB378AOXhaNT0GxKwa1L6DOablSr+6Q5FeyuoJSopovYCI+7SQXLrpbOakPN
	gdHDFN7K7jg/b14FV5J6ZRjMWk8NroR9v1+acD1bf7kAAUlZjJDb4Bx2755mv8DLEB9POlBZKQZaY
	w0mSHm0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJcdT-0000000AyGj-28Ef;
	Thu, 13 Nov 2025 19:05:35 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJcdQ-0000000AyGK-1ATI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 19:05:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q2UjTnXTJaeHn7SG1wBRzS1K08xqoAiStVlfQpbi6mrDt906G6oaS3JN2qrZ0TC70+F5QFMIiyUcRKtHqyBnuTKOrA9Du8bhk/92NPiQtitkreLAtQ7WMn8BVpKtdiqlomfP5pJqfzCu/LYYT8n2ZsFYUeBYijzmqpw4PsVcrllyMRBqQqcKpvZUGItwNQ1hpw/LwaClz+S6p429Axbl5U5ABr55YJ2a/fKo2papNgeHiYDXtqgvctjTz16hFrJba1BIRL+SKP4brjRALXydlDMwzbsHuEb2jWFUBCd4DOhYdTv6wzGTf08Exh/GSnra5YPZYiO5G6An0gu0ws7Sww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p5tT1YjAvTvWrCsOeSRhbBtFIja1NmzFI0pnmzPwbyQ=;
 b=Uvj1MVlxtq7B8wukFqmE6XeICRS2OCUA4e5BhpYRa9yK6jqXieYcqSjCSF2gKCoa/oMus5Bh+QM9DLPFvYfmEUJDAdNtCzLOqh/FMkNFOlDmRgcu7UxR6FGtDNKc6AR+BQNd9G4MG4NAn1e9ebyHaJj5/dSwj+CfDLI4vkEJR8ZEJ9e8p1FOub5SUIGzPaUjzPl8XyukNDmKSFK87oxDcl+abTzrxdUj4Y9nePJ/SkWLexiDxkIUMJcBGRWuN9qb1r8xdskqRrsVES3qenl9Vy69fjujNfqJSdkPRwwwWMv00YHaDuZ4EkakzlPRoGd3/vSwur2uWKQjXfwepOFnEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5tT1YjAvTvWrCsOeSRhbBtFIja1NmzFI0pnmzPwbyQ=;
 b=LAhSY6LdF3p7L/I5hTEHTCL0jLnt2U0HL39qQ8NyQeY0K0j04ljNXlrGjUr3m0cfsegV/lzUpSxWdS0PGxdZaX8XYwtG6R+wWLGthiv/qSp94j+mrvnMxCH8T5lV0fe9lTd+bR95TPHqKCYvpO5ICwaMDuH0JYinSHN+p4yaoTE=
Received: from CH0PR03CA0012.namprd03.prod.outlook.com (2603:10b6:610:b0::17)
 by SJ0PR10MB6424.namprd10.prod.outlook.com (2603:10b6:a03:44e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 19:05:27 +0000
Received: from CH2PEPF00000099.namprd02.prod.outlook.com
 (2603:10b6:610:b0:cafe::88) by CH0PR03CA0012.outlook.office365.com
 (2603:10b6:610:b0::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 19:05:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF00000099.mail.protection.outlook.com (10.167.244.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 19:05:27 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 13:05:25 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 13:05:25 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 13 Nov 2025 13:05:25 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ADJ5PCl718123;
	Thu, 13 Nov 2025 13:05:25 -0600
From: Nishanth Menon <nm@ti.com>
To: Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
	"Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
CC: Nishanth Menon <nm@ti.com>, Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman
	<khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, Sebin Francis
	<sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, Akashdeep Kaur
	<a-kaur@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: (subset) [PATCH v10 0/3] firmware: ti_sci: Partial-IO support
Date: Thu, 13 Nov 2025 13:05:23 -0600
Message-ID: <176306068723.2202307.3840954671097155528.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20251103-topic-am62-partialio-v6-12-b4-v10-0-0557e858d747@baylibre.com>
References: <20251103-topic-am62-partialio-v6-12-b4-v10-0-0557e858d747@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000099:EE_|SJ0PR10MB6424:EE_
X-MS-Office365-Filtering-Correlation-Id: a76d023e-6c92-4b0f-d516-08de22e79b57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y2pTWTU5dTVtdDFiQUdybzJyc0s4RDl5am41SU5Ub2t3NXZ4R0Qrazc5SXFK?=
 =?utf-8?B?WnIvcCs2Tll6elZJblB3RW5od3o1SnFiMjIwSDIrU1NjSDBXaXBZTVJIMEV1?=
 =?utf-8?B?aGpvRVV6ZEpNTVhmT293RWMzR0k2azJ1ell0NWEyamRYV1RpZjdvdUxGSWR0?=
 =?utf-8?B?Z25LVi9iTzl1aFZ6VDVMSW1YNm1QcXJxZEpld1QveC83UEJPY2h4ajBScC8x?=
 =?utf-8?B?cmNmNENwM1lTdFY5ZE54RFhkOGgrSVVGUkZqYjB2YzBLcVpNczc3UlZpdjQ2?=
 =?utf-8?B?T2VRL2Fid1J4SlF1WFh5a00rQk9CSFhyYXVCK2ZhZzNQZlFsd0lJWHI3Vk13?=
 =?utf-8?B?ZHVXcG1mdGRjZzFnaDFkQ0VERHlwMzVDREszdWxVcnFRTGFIQlJwaVgxdlE2?=
 =?utf-8?B?ZWxISlpCRVBjOFN0MVJkaHZyM3EvMHJoWi9aR3JYUy9ieWtmNlluVnZGQ2hJ?=
 =?utf-8?B?NEhJY2pTUE5Za0VNVnNzUjFvSk5idFV4WHM4aXp4aWNoN1lQcjFWTU9sMEJs?=
 =?utf-8?B?SndZM3IxRmtwbmpZT1M3OHd4NDlPc1FDVGRFUUdXMjlNZ2xNaDBVci9CUDNK?=
 =?utf-8?B?WVJnQkJtOHBWcXdTVnVtL1cyQXBlU0NHT3FqdVNWU2RnMzN0VHlteGRqU2FR?=
 =?utf-8?B?Rk9odDFMajEzWm5aNHBvdDVBalZTdVFQbFhEMTI3U1lCQXdFVVZzNy9FYUMy?=
 =?utf-8?B?aWNwUEZrMmRFWlVtV1dFVWg0aFhLNysxbzF4YmFJMU1DeWFBSytmaTk4Q0tC?=
 =?utf-8?B?MUxOVkpZaTVGV2haV3NkWXlkVWtubi9WLzhZMU13Wm9aNW15S2lTR3l2NnRt?=
 =?utf-8?B?K2JIMDlMRGU4Mkp2SGRJN0plYW1vT0FVWDNRSzJsRC9oTC9vQ05hemp3dVFD?=
 =?utf-8?B?YkhlNDJDS2U1b0FWSTBhdmlJQm1jM3cwTW5JOWU4aU40YmJibTVDT3ZnTFh2?=
 =?utf-8?B?UTEzZnJpcGZUVlJIb01EWlh3NVF2MyswRkpaaXhWcTc0UDd0TERoV0lzRFZw?=
 =?utf-8?B?Wm9qMzlkUDRiRktlempiOVR4OHdjMU91cmlYRERWY0k3T3dSUVZVY0ZuWDk1?=
 =?utf-8?B?NHl0ZGlyZEIxU1h1VlIyMDZwTlg1M1FmRFpFMWR5K1JTWWpRNzVSL3ZOdTds?=
 =?utf-8?B?KzJ2RE9HeFB0ZTFMdzN4V0srUU9iVGJMUElXRVkyZW9TMHRZVzMxNjk1L0lP?=
 =?utf-8?B?dlpBV2ZYOTF0WUx5T0dKd3drVGQwd2kwTDFFd1FzbjNZTzdpN0t2SVd0VW0x?=
 =?utf-8?B?V3JkdTFHQTF4V2tNUk1BZ2VhdHZDczRMZElVVFlLQ2gwMzd4VTFvVkNUQ0dF?=
 =?utf-8?B?Ykk5VG43djUyelhKY2g3MnpKaEJiT3NVNjlsbDU2WGtYSmIvTER1Szl1akxL?=
 =?utf-8?B?YlRzcEtjYktKWklrb1NTc2NVUWhxNHhFWXF6clhIaERzUzV5Wit1Y3FRSmdB?=
 =?utf-8?B?dS9VZjZ5eHB1bzJvTG9CaCsvYVYxaDRoRll6dlV4OGJOTWF1dXBFM0Z1Zk9Q?=
 =?utf-8?B?aEN3aWVtRjFCdzVXdUpWNnRIVDNyMTMvRXBDQmZZaXlDZ3FBQWdNZnhiTlFx?=
 =?utf-8?B?YU5oRDdkb1drV3UvcVgzdmxGTHJzRWRTbjRPdC9FSUM3SDBIWmRDbndYQmkz?=
 =?utf-8?B?QVFJSzFJSFNmOHEwRGZKQVRON0t6bnJGek02NS9DdWwrSG9MZ3cvL0FoVGZU?=
 =?utf-8?B?WEl2SzJDZmZvRVBWL1lNTUtTZk5KS0ZhQ3ZRall1UTBhRVZyM0VWRVZGRkU0?=
 =?utf-8?B?NENEbS9sSHVPczVyY3JldFVpdE0xOE1qbzRQNGs1c0ROK2cvOFN0eUFybVc4?=
 =?utf-8?B?RWlKVU9LMCtzOURYaitnZ3IwbHgvNzhDckFKLzJXS3dtUDd3ZVhPd1F6WlVy?=
 =?utf-8?B?eTdUbzhNZVhIelV5c1BQd0xwTWduck9DTld4dzJrV1BON0E4UWs2alhlWm9H?=
 =?utf-8?B?bWwwbDZsNGtndFlKZ2wzVkNyUDJ0WlFHNHE1NS9oamZVVGFGWW92amxnT2Rx?=
 =?utf-8?B?MWR6TkUwdzVrSFpiaFBpYlM0REpwbjlUWTJhT1YxZ3crZnVhYlRWajhuNmFT?=
 =?utf-8?B?bVM2K2VSS1g4OVFvM1BFdm5tMlRrMDA4aWhUQVNjeTM2N3B6aWpOaEMxd2Mr?=
 =?utf-8?Q?kzag=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 19:05:27.0735
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a76d023e-6c92-4b0f-d516-08de22e79b57
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000099.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6424
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_110532_544080_A1D22C81 
X-CRM114-Status: GOOD (  16.64  )
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

Hi Markus Schneider-Pargmann (TI.com),

On Mon, 03 Nov 2025 13:42:18 +0100, Markus Schneider-Pargmann (TI.com) wrote:
> This series adds support for Partial-IO to the ti-sci driver,
> implementing the firmware interface necessary to enter this low power
> state. It processes the wakeup-source properties from the devicetree and
> communicates with the system firmware to enter Partial-IO mode when
> appropriate wakeup sources are enabled.
> 
> Partial-IO Overview
> ------------------
> Partial-IO is a low power system state in which nearly everything is
> turned off except the pins of the CANUART group (mcu_mcan0, mcu_mcan1,
> wkup_uart0 and mcu_uart0). These devices can trigger a wakeup of the
> system on pin activity. Note that this does not resume the system as the
> DDR is off as well. So this state can be considered a power-off state
> with wakeup capabilities.
> 
> [...]

I have applied the following to branch ti-drivers-soc-next on [1].
Thank you!

[1/3] firmware: ti_sci: Support transfers without response
      commit: 170a3ef6052cfa2462b3bb572a6bb985bf83d21e
[2/3] firmware: ti_sci: Partial-IO support
      commit: e0431ff998bd32dcc1e591a45b4e156fcb0325a3

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


