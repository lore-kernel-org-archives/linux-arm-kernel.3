Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E87CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 20:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AXs6Wovbj8ZphBmWGiIV9aU/XQauolR/VSCjMZPVhRA=; b=Lbcljd23D63w49clF6bLsC2G3y
	sqMO9KswLtdTQC3egehTgm95WLGXJRnXr5m0kOovwo6T52PqWlovs+et0PF1S+T7L5ge/SBEoIIrs
	YJWlrysU6b0jEf5truKsEgmLOrq8wjxmIkEdjMHtF6RyVe+Iu/0wWFJ0VxdBOY1YYpkvePTh8Le+6
	4zV4Vf15T37fJlSFluefSOuUT5pNNZPW0Gb1g7mr/4Gi4WyI/KnGf676gFIxwFUOY5zKpZbYo7+dz
	3alQE7GmuqF0vqSFU0N1jrHQ+Lf+r/rhTyt72q0950GPKkvyc6vZVU480B94C5F8dPq+qlZPlEAAb
	XKa0szfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGjhY-0000000ELbL-0USG;
	Wed, 05 Nov 2025 20:01:52 +0000
Received: from mail-westusazon11010002.outbound.protection.outlook.com ([52.101.85.2] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGjhU-0000000ELay-3ykc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 20:01:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HfR0LGoyfgq/245fOi+Q4YoUCRiPPm8qc6rEMd/1lKu4fNmu2o3Oq7GdCUSevavYIbO7avIwT7aIJiwCyx+ccl62jOEeMqgonec0zEfmu8Vpbv76p/LHLXMU6Cv+eh/4GkZnNvcnzdm/dYRzfLBRQ+Su7qEOpg82jbNQulfD3Uuk8i7CJZBTqo3HFCqjYpghoT7WwWlxSkR1e0CDiI+Af3Hk+Cms6it4gXuAnsaa5LHxSEi02u/8PCgH8bmV5LwTjCSd0UCfg9I0eN3/DmUuBlz8PBNn85vRouh7Bj/8AsP8wjNmV3V6Ak7Wpqv1uZw2/UTHF5/db2EeIpheb8RuFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AXs6Wovbj8ZphBmWGiIV9aU/XQauolR/VSCjMZPVhRA=;
 b=n4v1YH/NrN0L170O9/gzpyMYWCNoBGjaodzrYm9tJb7Fo7ri+926a+VYLwCA+6O9/xnLZwEc3Q50zAOwqA9BZcYIyQ0juq2EMYyeSx6SjRVBZQ5QE3+1N+rmHNbFLUca6+okF+pXF5FBRpOhurugWDYgnKXJUNRnPx4ruPBCn5IM5v43o2xr3fnreKW7ctsH8LhhdK8bQllCG5C58mns0xodv/MGqUIK15H+S64halEdIdoR0zbfGxy33HXR+3LzE4vHpx3Bt4q/Vyq1Xr4yONNBDfYBOBdlyyV8QYwyS2pf5U/5rqs6sbBfSlSA0jIs2cV2+0wfmy9MaUaJlga72g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=toradex.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AXs6Wovbj8ZphBmWGiIV9aU/XQauolR/VSCjMZPVhRA=;
 b=HyiC742G+Cwae5N8mYoMrESGU+rcqDUCO5GklaZwz/rDw6KbOb/wDVk3YojtztjEge09MKEGZ7R4SFO114sPj5uSKprp03Q198xWxLRp7qilsDrj+oq172M+cn5tHTW3H7bFZe9zNgdhP89cZy0JxOV9Lmlcg67TqO37VXblCFo=
Received: from PH7PR13CA0004.namprd13.prod.outlook.com (2603:10b6:510:174::25)
 by MW4PR10MB6439.namprd10.prod.outlook.com (2603:10b6:303:218::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 5 Nov
 2025 20:01:39 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:510:174:cafe::5a) by PH7PR13CA0004.outlook.office365.com
 (2603:10b6:510:174::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.5 via Frontend Transport; Wed, 5
 Nov 2025 20:01:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Wed, 5 Nov 2025 20:01:38 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 14:01:36 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 14:01:36 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 5 Nov 2025 14:01:36 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A5K1ZrG025535;
	Wed, 5 Nov 2025 14:01:36 -0600
Message-ID: <7024f4b3-00a0-4618-8bf9-53e305fcc982@ti.com>
Date: Wed, 5 Nov 2025 14:01:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] arm64: dts: ti: Add Aquila AM69 Support
To: Francesco Dolcini <francesco@dolcini.it>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Parth
 Pancholi" <parth.pancholi@toradex.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Emanuele Ghidoli
	<emanuele.ghidoli@toradex.com>, Ernest Van Hoecke
	<ernest.vanhoecke@toradex.com>, =?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?=
	<joao.goncalves@toradex.com>, Francesco Dolcini
	<francesco.dolcini@toradex.com>
References: <20251104144915.60445-1-francesco@dolcini.it>
 <20251104145240.61219-1-francesco@dolcini.it>
 <20251104145240.61219-2-francesco@dolcini.it>
 <d77bf3dd-4501-4f17-a776-3353f96f4fb1@ti.com>
 <20251105115335.GA14157@francesco-nb>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20251105115335.GA14157@francesco-nb>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|MW4PR10MB6439:EE_
X-MS-Office365-Filtering-Correlation-Id: 49239e2f-ceb0-43c3-af69-08de1ca621aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700013|34020700016|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cjBScGlIRlQ3S00wa0ZGV0ZaY1hCb3QxNFM2bTBOdVIweE80QTlVZHJtUlV4?=
 =?utf-8?B?ZllYdms1Rk9VZnEwUjY0NEtCZUkrQ1BzK1FWN1Y3MnVCU3cyaG4xTjJSQjFY?=
 =?utf-8?B?eXVGOTlHTWtybGE0d0t5dk5Ib1NYZGUxZ2RpTENiTjRZWE43OGI0ZVVVWXlJ?=
 =?utf-8?B?VlVwbU52V3pPdnVBMmRzWS9lYVlnZzIrN0t5RXZMeC9kdnU4Z1M0VVYzVWsx?=
 =?utf-8?B?WmlOQlNNZFlqOGVsdDFYOVFwRHphOVNQYW9FSTZid0xobkdod3VZRlVtTE1Y?=
 =?utf-8?B?V2VLQndtWnAxOWQxTm8wWHNzYUtocnJZNTVXMjlrYnV4SmdsRC9uVGdYRlhT?=
 =?utf-8?B?QllwRjJlcUJCVUZ5SEdpdW5WZ25iSGs3YUxXS3luQmtRSkVGbTZlejRCVWVU?=
 =?utf-8?B?ekxhQ2FldmY1cmd3cFMvUDk4MitVSWxzUzVUMUx5TlQ4dWw3TXY3THZWK0Ni?=
 =?utf-8?B?TC9NWk5MbzVmMTZCZ1phMFVqQ0pwMEtkbk9mc1A5TndmTjkwZW90WmtveWZT?=
 =?utf-8?B?OVFKeGU0SHozd1RVamlhQ1I3cmMrV1ZEK3pLeXlCZDA5UWNmMHp3dWp4b3dM?=
 =?utf-8?B?V01lRGoyZ3YzVUtRNDZydU1KazhySGtxU00rM1BlS1R3aDdWRjhrZndZblVU?=
 =?utf-8?B?cDZBRVpNMDNhTG9wd0wzaC9Famc3SUNOaFZNNnJoL3dXVFpYSi95QTRDcVZS?=
 =?utf-8?B?OGxDZDF0Sm9ScFRQNytKV3Q4YUYvdk9ldU93RlNPRVZMK29DTlJpcUdNWVVv?=
 =?utf-8?B?bFF0NXMxdGJ5YW1iYXJQN0V6N0RQS21WVnROWXIyMWRHeW95b28raDVSdnpR?=
 =?utf-8?B?YlN3dlRJRmpFT1BKaFJBTEh2ZEczc1p1VG5uN1YxMlFuWVZpTEZIZjRrdEhL?=
 =?utf-8?B?Z2FZRDgwTlU2c3ArNHN3ZXBlTklJZkFrbGhWNjJsYUNWTWRINi9FWnFzSHh1?=
 =?utf-8?B?QVkxUUtjaGdNeHhoVmw5RjZneUZMK1V1WFZRVGIzYW1SZXRSa3EyZDUrM2NL?=
 =?utf-8?B?RGpnRkFGZzN2TTdjN2xEVHZwOEdKM1BCaXJ4NFdYT2Yrdmtad2hSY1JJRkhU?=
 =?utf-8?B?Q0ZzeTFZVmg3TXpWS0gzeTJWMDlkVFZaaDJEWldFMk5seXMrMlNPZjNVRnFK?=
 =?utf-8?B?SUVYdEdlODlZWFhGYm12bURqbE1XK0lBTjEzMWJHRHFaZklXeGxubnl2Ykgy?=
 =?utf-8?B?OHkxS2ZpRWpKUlUzSE5naUc2UkgwRnNySTBlU1pDSjY4MXFTYlZWZ2grcFlY?=
 =?utf-8?B?RTNIdFR6SFBvZ1BRYnZIK0haaHR1ZjJ2ZnB2SmZXd2lwUjk0aUU5eVdnb2dE?=
 =?utf-8?B?ZEI5NzJIYkpsQVBaWjErTHlxUlFYQkdHUE5SQi80VnlzRDBsd3E5cytNb3FC?=
 =?utf-8?B?WnNJVThKbnlWVytoUEJkRk9CZUxVY0ZUV055dkhaRDN4eXhFMkt0Y1VONHR2?=
 =?utf-8?B?U0ZTM3U4WkZtTWJDaG93NEhRMlV4SkJ0S2VJeG9NSUdTNFdwSVk5OUg0LzdP?=
 =?utf-8?B?eFMxSTZmRlZVS0QwUnUyVVFhNHRmSUlBMTVXR0dRQWpDNXpJdkJIVTdIVDFv?=
 =?utf-8?B?K2ttWmI3YnR1bno2SmNNRzVFdE1UUjZCbkcyS3o1d0x5Y2RQVDlpMDNsaytY?=
 =?utf-8?B?R3BrQUJJYmJLR2k0Tm9rZzg1K0xsUVJ2aUdFcXFWOGNLQW5Bc0sxczRoUTNl?=
 =?utf-8?B?QzZBdXpDZGRyVitySlNjVWE4dVQrMThiSWVFNEROYWlYZWFWR1J6NGpjaERO?=
 =?utf-8?B?YnduOVNocm9BZWs2UUdSUUpPUEp0aXpkZ1p5MHF4R3RoL0pBV3IxaDRTWGsv?=
 =?utf-8?B?R2hlKzdBYUx4UnVnZGVTU09hYXJGeUhZUm5EWm9Tc2dSL1p2OXdXdzBhdWlv?=
 =?utf-8?B?WjBieTJTTjNzdXZmb1J5b1VlZDIxZUtyejZLWW5sUkczWktibUxBMW5EbUZO?=
 =?utf-8?B?b1dtOTBMSm90dTErUWtSZWQvYytMcGkxS0MrUHRiRjN2MVNHTU1nbngwS2VE?=
 =?utf-8?B?TXRjUlBEZGg4WlNWYnJPMVBaTXJCcVV6YU8xOEphN2xXRGZJdEowTVRySFNa?=
 =?utf-8?B?bWEzNjNZNFc1bzJtMzNKNkxvcFFHVWlRbzJKdkFvUW5sdmdWYUl3SlUrdHh3?=
 =?utf-8?Q?GlIg=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013)(34020700016)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 20:01:38.7689
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49239e2f-ceb0-43c3-af69-08de1ca621aa
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6439
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_120149_123584_22529E4E 
X-CRM114-Status: GOOD (  28.45  )
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

On 11/5/25 5:53 AM, Francesco Dolcini wrote:
> Hello Andrew,
> thanks for the review
> 
> On Tue, Nov 04, 2025 at 11:41:54AM -0600, Andrew Davis wrote:
>> On 11/4/25 8:52 AM, Francesco Dolcini wrote:
>>> From: Parth Pancholi <parth.pancholi@toradex.com>
>>>
>>> Add support for the Toradex Aquila AM69 and its Development Carrier
>>> Board.
>>>
>>> The Aquila AM69 SoM is based on the TI AM69 SoC from the Jacinto 7
>>> family and is designed for high-end embedded computing, featuring up to
>>> 32GB of LPDDR4 and 256GB eMMC storage, extensive multimedia support (3x
>>> Quad CSI, 2x Quad DSI, DisplayPort, 5x Audio I2S/TDM), six Ethernet
>>> interfaces (1x 1G, 4x 2.5G SGMII, 1x 10G), USB 3.2 Host/DRD support, and
>>> a Wi-Fi 7/BT 5.3 module, alongside an RX8130 RTC, I2C EEPROM and
>>> Temperature Sensor, and optional TPM 2.0 module.
>>>
>>> Link: https://www.toradex.com/computer-on-modules/aquila-arm-family/ti-am69
>>> Link: https://www.toradex.com/products/carrier-board/aquila-development-board-kit
>>> Signed-off-by: Parth Pancholi <parth.pancholi@toradex.com>
>>> Co-developed-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
>>> Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
>>> Co-developed-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
>>> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
>>> Co-developed-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
>>> Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
>>> Co-developed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
>>> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
>>> ---
>>>    arch/arm64/boot/dts/ti/Makefile               |    1 +
>>>    arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts |  576 ++++++
>>>    arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi    | 1840 +++++++++++++++++
>>>    3 files changed, 2417 insertions(+)
>>>    create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts
>>>    create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi
>>>
>>> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
>>> index 361248dcfff4..6ce652fe98fa 100644
>>> --- a/arch/arm64/boot/dts/ti/Makefile
>>> +++ b/arch/arm64/boot/dts/ti/Makefile
>>> @@ -153,6 +153,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
>>>    dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
>>>    # Boards with J784s4 SoC
>>> +dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev.dtb
>>>    dtb-$(CONFIG_ARCH_K3) += k3-am69-sk.dtb
>>>    dtb-$(CONFIG_ARCH_K3) += k3-am69-sk-pcie0-ep.dtbo
>>>    dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm.dtb
>>> diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts b/arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts
>>> new file mode 100644
>>> index 000000000000..c7ce804eac70
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts
>>> @@ -0,0 +1,576 @@
>>> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
>>> +/*
>>> + * Copyright (C) 2025 Toradex
>>> + *
>>> + * https://www.toradex.com/computer-on-modules/aquila-arm-family/ti-am69
>>> + * https://www.toradex.com/products/carrier-board/aquila-development-board-kit
>>> + */
>>> +
>>> +/dts-v1/;
>>> +
>>> +#include <dt-bindings/pwm/pwm.h>
>>> +#include "k3-am69-aquila.dtsi"
>>> +
>>
>> [...]
>>
>>> +/* Aquila SPI_2 */
>>> +&main_spi0 {
>>> +	status = "okay";
>>> +};
>>> +
>>> +/* Aquila SPI_1 */
>>> +&main_spi2 {
>>> +	status = "okay";
>>
>> Why enable this with nothing connected to it?
> 
> It's a development carrier board, the SPI pins go to a pins header,
> accessible to the user, where anything can be hooked up for
> prototyping/testing.
> 

Sure, and when a device is attached to that pin header it will need
described in DT with a node for that attached device and in that
node/overlay is where you enable the nodes you make use of.

> One use case would be to just bind this in userspace to spidev for some
> prototyping/testing.
> 

But you are not adding a spidev node here, you are attaching nothing
but enabling the node anyway.

> 
>> [...]
>>
>>> +/* Aquila SPI_1 */
>>> +&main_spi2 {
>>> +	pinctrl-names = "default";
>>> +	pinctrl-0 = <&pinctrl_main_spi2>, <&pinctrl_main_spi2_cs0>;
>>> +	status = "disabled";
>>
>> This is already disabled by default in the SoC dtsi file.
> 
> Yes, known. Is this an issue?
> 
> This node must be disabled, no matter what is present in any included
> dtsi file, it's a deliberate decision.
> 
> This dtsi file describes a SoM, the used pins/functions are defined on
> the pinout, but this node cannot be enabled unless the SoM is mated with
> a carrier board that is exposing it.

Same as my point above, you shouldn't enable nodes that are not used
or have anything attached. The SoM only has some edge connectors so
it should not be enabled at the SoM level, that we seem to agree, but
the carrier board doesn't connect those lines to anything either. They
just run to a pin header with nothing attached, how is that header
any different than the pins on the edge of the SoM?

Anyway, the right spot to enable would be when you bind a device to
the SPI, which it seems you do in overlays[0], so that would be were
you set status = "okay" and all the pinmux info for that SPI device
and carrier board combination.

Andrew

[0] https://developer.toradex.com/torizon/os-customization/use-cases/device-tree-overlays-on-torizon/#spidev

> 
> Francesco
> 


