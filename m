Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D942C44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 04:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6rEgratXPkHrzLUZ+iQQe6Aan7ToTNCY1Ya8CtR6iZE=; b=bBSQ9WzPaxUjhfe/vGvmhu+jlt
	dczhIpCkl7tE2yhuzPyZyH24qxJyPBEMlwzXeUOIWo3LP0/CzuR22isMHD8B+f6gS2L1ZnnzHJjFU
	fR2PiAnUqFFr/aUbLoyJNTHTj8bf47GJOnMYywx8P+dppufdDJSwL0Ze997VTMehwPnI3PXKdAVDX
	/xhnLfPLMe3BbpiloADsxTLrnUFFhK1vKXx6bZ1M9jBT3yM8l8eRLFdeLv2OhiUm3DHktHS4Xko8W
	1JTJaMd9nLPzbBySNk1+DfXiT5Lri5vK73KV3sXMgrirQtWE5BKRaalryMcVeHa069RV/yfIz1dNi
	YNueso7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vimP1-00000006R9y-2QiY;
	Thu, 22 Jan 2026 04:34:39 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vimOy-00000006R9c-0PDN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 04:34:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rR1rTX6jahnvsLGZWKXybZCPwExXkYp87W/CKQQlYsLaDvxdWpCwV6hZe5DH9QK2L2USJWA5yf21ASeef7AoQFfUM4bSPYvGlNRDKoFf2RVOaSAZBGlpP1a8o1iUWzZtAGaN1WFKVMtneuFPkzysPcROo8MAJdBE/OD78yX4mW7Uh1S2VDE8PaN9uo61GVWrIdtz58FbJwFOxgVfbd145QUbuhezzDyxSVKvkvm+RfXBVcKi0j2tf7xgLdV+1IZLzUQsTSr23G+vPL+a6ab8H5ba34TfC7Le9n9CPQxTEnxC0j01J5NlJyR9ckyGn4lqQkSGDCWqdsLPYenwrnZtPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rEgratXPkHrzLUZ+iQQe6Aan7ToTNCY1Ya8CtR6iZE=;
 b=JqCH+j6BWUL2mjqDpJMTQXLVAAZqxO/94omd1UmIQ1BcrC17XNxVizbqys6DWSL9jEeRSA0MmclQNDqIKDxrgjzBi3na0B2U9cwIrwbcr8zzBs1H1OlMaccjdMnwwR4XmJymARC+iMlghEGzXKEH4xx3JXVszH05pTbZ+49TNXpEX5bCKFGP0xOflsgoEj7Q546vWAZQtbcoH6jc3or+emvl4P6SEobVVVAq2w2VUlSv4GMhPxcVIc1NRTRck4PBzLNq1iKaZGrnmU+ywZ7YV7/KiKG483TvrSRNig06O7C3jfrgIN03nQZzzXEgT0ZIsOmLLUx36ecSUs2JmcdKJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rEgratXPkHrzLUZ+iQQe6Aan7ToTNCY1Ya8CtR6iZE=;
 b=jV+kcK+87rY5HAmu78UhpSDsSOl2Ck/36fOTma3X91UDe6tmPAcPoTu7dqQ2V8xPRKg4j1xfhxPOMO82Yjqmobi3cMhhFzhrmuC8U1L7VzrhDVHPmC0buZmfPQLRK3udvMvix7Svlxs9/Bo5RArdCCVkDx4GW9BVorpqJbcl0aY=
Received: from DS7P220CA0068.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:224::23) by
 PH5PR10MB997710.namprd10.prod.outlook.com (2603:10b6:510:39d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 04:34:31 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:8:224:cafe::5b) by DS7P220CA0068.outlook.office365.com
 (2603:10b6:8:224::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Thu,
 22 Jan 2026 04:34:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 04:34:30 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 22:34:30 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 22:34:29 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 22:34:29 -0600
Received: from [10.24.73.74] (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60M4YPkF4026212;
	Wed, 21 Jan 2026 22:34:25 -0600
Message-ID: <40720ca3b3b8676aaec55605a70f055418dcb4de.camel@ti.com>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am62d2-evm: Fix missing RX delay
 for DP83867 PHY
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <bb@ti.com>, <afd@ti.com>,
	<p-bhagat@ti.com>, <gehariprasath@ti.com>, <stable@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, <s-vadapalli@ti.com>
Date: Thu, 22 Jan 2026 10:05:45 +0530
In-Reply-To: <32265181-6a16-4cb3-9cc8-52d4265c6646@lunn.ch>
References: <20260121054552.1650926-1-s-vadapalli@ti.com>
	 <32265181-6a16-4cb3-9cc8-52d4265c6646@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|PH5PR10MB997710:EE_
X-MS-Office365-Filtering-Correlation-Id: be4a9e5d-9b6c-4312-295f-08de596f8914
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WnF0dkFUWjRwQmF5aTNNV0xpMHowV0dGbWNqemh1MHgwNVBZdXhEMVBkUitk?=
 =?utf-8?B?VTkwZU5lVy81M1g3YTZOMlE3N1IxZkpTQThmVHpMWEdxWENBUXZTR3ExcGpL?=
 =?utf-8?B?YjFjVkNISVAzd0pEYkVod0ZJaHNLNU1uemhUSHJUV1V2SjA4KzVGVVVqdUdJ?=
 =?utf-8?B?MDVCRm5vQnd2WDBnN21wTnFoM3I1RG4rNWVUYm5rK3FINkJ2SHVEczBTWERv?=
 =?utf-8?B?T0xVQ0w3ZUxGejFVMVNNNHZOazNvZi8wR0N6c0FnOTUvMGxEVTRjWTdEUzlm?=
 =?utf-8?B?dHBTZ1BmQXYxeXZsTUt0bEJNa09aRTk5Zm9STlo2c21VYjlvaThaRHVHR1lY?=
 =?utf-8?B?MWhWdExubDlnaWM3NDFLdzZjQkt2TXhjWTNpWG9RWlorQ2lRTG1XQy9RbmZB?=
 =?utf-8?B?Yk1zRzRldDdYeDZYMHFkTGVlUnBueDh0Umplb3NrTFM3dFdoTkliZ3VHUFRR?=
 =?utf-8?B?WUJxMnhhVkV2V2tFeTRDRVlSdzFYdHhMTDdpeDRWdmd4MmxEaFdxYXVNTmJj?=
 =?utf-8?B?Tk1WTVlRaVVkaSt2d0NkemVSYTd3M3dFZG51NnkvMEZ6cUV3cnJlRm0wV0ti?=
 =?utf-8?B?SkxLT3RTbnp3aExHRUFxSXRBMUtqdHhqSnZ3T1drQnUzczZLVTlXc1FBY3Y3?=
 =?utf-8?B?Vmczb0NFU28waVM2R3BFZ1VlaVF4alg0cHlPeDhCRXI4Z0NYWDhkSkw4L2FG?=
 =?utf-8?B?bG9nOURsQ04yOEVPR3NsT3UyOUZFWWRNMW1tUExnOURBMnJVbi80MGIyQ2gv?=
 =?utf-8?B?bEdORmcvOU5iamdLckdKREhkYmlPMjFSU0RVeTJzOERxcW9FVDRWdFE2Vm9i?=
 =?utf-8?B?ODd2Z1VsN3N0bFgxdGs2TVEvdXoxdnVHY1hoS3lsTnpRZ3A2YWdyeEVaaUZh?=
 =?utf-8?B?UVBmUXhjcnoySkE0MUVkeTBiMTNvWDVPbnZ6dlFWNDI5Wlh5MGwzMzFUb3Bo?=
 =?utf-8?B?M1lnOEtaSmxCK2dMYVg2OVBxZVlMNXNpTTYyeFA0SmtrL2F4UHVveXZrUndY?=
 =?utf-8?B?T1RKaVlQNHExY1FwT3dLZEVDbjEzRWwvLzhJanQvbThyVStmZzV2RE53aVBx?=
 =?utf-8?B?WEtLZ0UxYkZGOE92ZGxJZElPaFQwRjJDTUp4Nno5dWNaYVdsemVOb2I3Qjhz?=
 =?utf-8?B?RTczMkdUaEtoQTdnRzVnWkFpd1pqcFJGNzRXaHJwcWVPNUxNMldybzNlejhr?=
 =?utf-8?B?TjhrUWNybzFJODBnaEsveU9QTEthRHU0ZmxsaEYzR1NSV1paM1RaaDN1NFdT?=
 =?utf-8?B?WWpUajhzay9mRkRVanVRY29UM296SHhmRTJBODBMbVRBaVJhZmlYTVhPMkhi?=
 =?utf-8?B?L2VvL1JOamhUbFpQQlQwOHBhTFRxMmMvKzZBSFcybTJuUWY0MEhRcHpySTBp?=
 =?utf-8?B?b2VtS3MxK3NVVmVnZ0hDb0VsRklmWHUvUnFURjBLNFVGUlFyRTd5SkM1MDhu?=
 =?utf-8?B?MGYwKzI1SVdycWpPckt5Z2h4QWo5c3NHZTROM0M4T1FRWXluNS9VUDc1WFdI?=
 =?utf-8?B?Tmhob1dyeTFUMFJBV3VIUEdRQlRrSmJEa3d5bnRBNzZrejdzRFdaRE1BaFpN?=
 =?utf-8?B?NGZSRGdabVA4aUZLQjdRYlNNOGVwNzhqQ0FOejlSTDRnVUlMS2NQOXZHS2Fv?=
 =?utf-8?B?WkpoaUVTMGFrV01pY0NhOVhZUG1sVnUvb0ZHNkp2ZkQ5cGxhWlZJTmQ0Q01B?=
 =?utf-8?B?c05SZHJ3djJwcHJWVE51TlRNeWh1dkd4TmdrQ0FnWUdPK3hWS0U3bGxUVGlY?=
 =?utf-8?B?MWlRK1M0bC83blp6anMzVzlyUi9ZWEdiWnI2L1NVZEFTVkJ5UFZvV3NhcEZF?=
 =?utf-8?B?bzlvRThmMk5QWGxRaUVpaTdIR3podXBwOUFWRFQ1K0RBTHM3bFBUZ2JZdjBk?=
 =?utf-8?B?T3F1WTBBb0c4L3dNUU9TWXNQc1l6OFdQL0Q3cFdmQWtzcy8vOWNEQTl5N0Fx?=
 =?utf-8?B?YVZRc05sWkwvRHVmRzNsWVR2MWNodnYwdWxxaHYwMG4xazhiUHAwZUloa2RL?=
 =?utf-8?B?aDUvZU9FUmNMS3hTV2NCNmVWeTJPbDd2cm5ReVA0SUZFYTB0YTZnR0JXOHNM?=
 =?utf-8?B?bm9xblpXWHhwK2swZGhqMy9HaUlPbGhwU01KTGo5VTBjWnR5ZTRiaE5nMjh1?=
 =?utf-8?B?bkZPM2RxSlRWbC9KYlpJL082S1ZNbWNFRnFyWkZIWDFmbnI4WVRxVVZvRGFM?=
 =?utf-8?B?bW5hY0xJOUR6VWdtRk5xK24zQVlCdlN2TXc5NFBnMkRWM2J2MDdvc0ZhSTFG?=
 =?utf-8?B?cmRQZGtxcGRSY1lsTVExRjcwRm5BPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 04:34:30.8179
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be4a9e5d-9b6c-4312-295f-08de596f8914
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR10MB997710
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_203436_311467_10D8214E 
X-CRM114-Status: GOOD (  34.03  )
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

On Wed, 2026-01-21 at 14:22 +0100, Andrew Lunn wrote:
> On Wed, Jan 21, 2026 at 11:15:50AM +0530, Siddharth Vadapalli wrote:
> > MAC Ports 1 and 2 of the CPSW3G Ethernet Switch in the AM62D2 SoC are b=
oth
> > connected to different instances of the DP83867 Ethernet PHY on the AM6=
2D2
> > EVM, with the 'phy-mode' set to 'rgmii-id'. The DP83867 Ethernet PHY ha=
s to
> > add a 2 nanosecond delay on receive (from wire) based on the EVM design=
.
> >=20
> > Since the device driver for the DP83867 Ethernet PHY coincidentally ass=
umes
> > that a 2 nanosecond receive delay has to be added in the absence of the
> > 'ti,rx-internal-delay' property, Ethernet is functional.
> >=20
> > However, since the device-tree is intended to describe the Hardware, an=
d,
> > the device driver for the DP83867 Ethernet PHY may change in the future=
,
> > add the 'ti,rx-internal-delay' property and assign it the value
> > 'DP83867_RGMIIDCTL_2_00_NS' which corresponds to a 2 nanosecond
> > delay.
>=20
> The driver will not change. Doing so will break boards, causing

Ok.

> regressions. Also, passing PHY_INTERFACE_MODE_RGMII_ID to the PHY
> means the PHY should add 2ns, or the closet it can achieve. The PHY
> driver does not coincidentally assumes that a 2 nanosecond receive
> delay is required, it is required a 2ns delay is added.

A default of 2ns is chosen and is overridden by the value specified in the
device-tree via the
'ti,rx-internal-delay' property. So it is ultimately what is described in
the device-tree that dictates the Hardware and the configuration that the
driver should perform. I agree that in this case the 2ns delay
doesn't have to be described in the device-tree for functionality. But my
question is whether it is wrong or unexpected to specify the delay in the
device-tree when it is simply describing the Hardware?

For further context, U-Boot (Bootloader) uses the Linux device-tree. The U-
Boot PHY driver relies
on the device-tree to specify the delay. Is it incorrect to rely on the
device-tree description for configuring the Hardware? Unlike Linux PHY
driver, the U-Boot PHY driver doesn't assign a default of 2ns. Instead, it
asks for the delay to be specified in the device-tree. While this may seem
like a 'bug' in the U-Boot PHY driver, given that a proper and complete
description of the Hardware is all that the driver expects, wouldn't the
proper 'fix' be to simply describe the same in the device-tree?

Please let me know what you think.

>=20
> So this patch is pointless.
>=20
> Please drop it.

This is required for U-Boot as pointed out above. The reason I didn't
mention it in the commit message earlier is because the patch is simply
describing the Hardware which is what the device-tree does. Mentioning U-
Boot would have taken the conversation in a different direction where the
reader starts questioning why U-Boot PHY driver can't have a default the
way Linux PHY driver does. That would be a valid point if the patch was
violating the device-tree convention or doing something unexpected. Since
that isn't the case, I have kept the description simple, positioning this
patch as a 'fix' in terms of explicitly describing the Hardware through the
device-tree, rather than depending on the driver defaults.

Regards,
Siddharth.

