Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5BA5CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 14:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Csmx5SMDLLlNrmYWFllgKqVZ7T6KuRkk9eFLswmWBU0=; b=qSERf51tF2bRRIvIQ/lq7J1qyx
	pc1BHVWBPvhY9fPuF4+wA8N24ewNQiYu1tZgfOCuaUpxv9qUKxNHw+m8uQ0pEPxqkdRTiaPNbNJ76
	Ud8+EO7+L+U4KO4bF/Rx9biZXFZh0+wylkIqQCzoNV7wrqbvq9iZDxYrsKbEBJ1wj+Dq0p4uyLa7I
	WN1O5CIDX1QoT0/Pxi5q1dlzWXhUkliHZjTQbqGWTaF4dmohrYDB5UhTxnwtxvRN8XqQpLMe6FoFD
	t4jngaAmf7iC2t/2sYGlcv0mHrit4iIc1zi5Sl4mzNZ9TbsXyJI4/QMYiefX1EnNoW/FQapO7j5m4
	tg1uzY7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEqLF-00000006Fim-13Ya;
	Fri, 31 Oct 2025 14:43:01 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEqLB-00000006Fhe-30GB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 14:42:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qiUtoJSTnoaLNK/dJVhHjFG+JzlLYcE64R5+OkHIt+NUf7AD1WJhK1piEcjqPFyORmaw8fn52GDxrCPg9TNVoIYJzZ5sQY6KrQSZemNYaZ8jI9TfnwCrQv8TF28KyGV9KTnyOyqA61Xkw408FwCHbGAXAMtGBcUGYumT6zLWaCnWVb1m7YWbHmA2/0A0dU44KNek0eV0o46x/oqB/x7ckE81buMf5feRHm5zluM6g/X/atsiKR+zgrkJqvdFwHB3zprbuEtaIMlScnIX0sNWqe8AyEitFriHie3KLnEEgrviKCr5wkW0tjmOWe5dCOLFtKO3QQvmnNx24qTAOf4Jqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Csmx5SMDLLlNrmYWFllgKqVZ7T6KuRkk9eFLswmWBU0=;
 b=K5GWrAKkyRIk+BehXPKlecJ7rHgZxflyRcY7qpSZ5wQQibS45I4G4CnSh0LC8rtw5lZDMPl5EkJJCABfrVLXirgcovmJu2ahUO/le4/X5DWthL/BvIDmBFqxKCegm8KW0e5evqFwopY3wKmKeTd9gxhBKc7VlNknn0t6Lyh0PaSHXwEAl5EeK4qL5b11TTPVxo6BP2Ge5J9+0xjLUc09YxJzdIxyekM0i+jDtskvD+NVjuiAWUsY3XZwBMe4qYUMmilZ1uZIwx9Q6PAESIxLShsKe/+c2JcDy15TfDwOp5GRL9J23FU0ZaEtgW2bnpT6JIpLeSwls0jKXf7N43iuiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Csmx5SMDLLlNrmYWFllgKqVZ7T6KuRkk9eFLswmWBU0=;
 b=ZPCFVcp83cOMGRGKvCIBzvcYkKkVGZHk942wDjxoUdYI/PNSzNMHLxjjD99bZB7AiMf6y7Fr/zR+3kummR/CgT8PuDRhYNJu4e70BLZIAmvoUPUoubhDZH59VIe+Hyo0Y9wQkrbuMZf+FPZnqp/WHledD3G6IrcgN4Qp/jy1Zp0=
Received: from DM5PR08CA0027.namprd08.prod.outlook.com (2603:10b6:4:60::16) by
 DS0PR10MB6917.namprd10.prod.outlook.com (2603:10b6:8:134::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.13; Fri, 31 Oct 2025 14:42:50 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:4:60:cafe::10) by DM5PR08CA0027.outlook.office365.com
 (2603:10b6:4:60::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.15 via Frontend Transport; Fri,
 31 Oct 2025 14:42:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Fri, 31 Oct 2025 14:42:49 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Oct
 2025 09:42:49 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Oct
 2025 09:42:49 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 31 Oct 2025 09:42:49 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59VEgf5W4024498;
	Fri, 31 Oct 2025 09:42:46 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Dominik Haller <d.haller@phytec.de>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <upstream@lists.phytec.de>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-am68-phycore-som: Add pmic label
Date: Fri, 31 Oct 2025 20:10:54 +0530
Message-ID: <176192142808.427883.13302707913583517689.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251014002240.85045-1-d.haller@phytec.de>
References: <20251014002240.85045-1-d.haller@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|DS0PR10MB6917:EE_
X-MS-Office365-Filtering-Correlation-Id: 9020e109-09be-4b1f-b735-08de188bc3ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|34020700016|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aEtlWmNDSklsMHJsYUdjL2JsZHZCUUo2TU1IcjlPUXBrUDV5T2t5aFpIOVJQ?=
 =?utf-8?B?VVpZQmo3eFEveDY5MGIrb3cyaWNITFhhWFhnNC9PYlNnQ0Uya04zcG05RndM?=
 =?utf-8?B?ZUp0YkxjWk42Ym5uMU9tZDNWTlpwVVR3WjdMQ3VBWnhjWjR4Z0RZTnNPK2Zu?=
 =?utf-8?B?S1VablJ3dFQ4U2cvNS9TRFJhRU5lZVdEelpJQWhBa1VBNDZNekNKR3lyeTNr?=
 =?utf-8?B?ZFY4c3NTemI5QnhhV0Q2QmJsS3NTKy9BUFlNTStQdXlIQm00czcvQmNtZUJx?=
 =?utf-8?B?MFJVK3BHOStWUTFMVzJMdGZ4R0lKUy9ZT0xhbXpKRlhhWVgvcVdtS2F6MDMz?=
 =?utf-8?B?M0o5WkNlcEwrY2ZBNG9WQmMyVzN2K3JZTjhpUldNQStwb1M3Q1JYc2xxT0hB?=
 =?utf-8?B?YVUvNnZ2S1ZEZDNEeDIzNWR0eG9MK0dodjNVV1RMdmE0ZWM4MzZ3KzFWSjNH?=
 =?utf-8?B?b1cwUy9OeUVJYi9WaUNnaGVvemNLdTN5b09SY3pWTkJNZDhYQXhmdVV4b3hl?=
 =?utf-8?B?anVVcHRDMlp2MDVUM0hpVU1wdkZMMEgvQTlvaEVtUkZDeThhYXBITTloeTV5?=
 =?utf-8?B?Q0g0b3RCcWZqdEhsQVlMZU1RWDlzajl1RVNxVzVnbUVYTTdSV1hTRDE2R0c3?=
 =?utf-8?B?OVBFU21NK2poQkV4YS9BSVNqNEx2SmhtSnUwZm5FeGFWZDhtR25OaTUwc05s?=
 =?utf-8?B?ZmNTK2FXSnNLTHcrVnNsRVZLYnhaeThhejNBcXA0TmFBYnprSlo1REwxbENn?=
 =?utf-8?B?RExmVEl6dStOaUpDemFxeldQcHNCQjFYUU1mTU9sVlh2R1FoZnpCNjgyaVF3?=
 =?utf-8?B?QW1raHN4RTB6NWNpRlB6OXp3N0hIQTlCRDU3Z0trRDBmWUVtelo5SElyUVh2?=
 =?utf-8?B?QjJsNmlaSkJRWlJBck9Xb0hHL0IxTTZ2Z0NEYkVjWkVsU0JuV1p2Z2tNUlE5?=
 =?utf-8?B?bmIvZjJEKzF3bmxvQ2VlVTNadVA2N09rRE80NFY2M25tN3lKajJwWEJnaUt6?=
 =?utf-8?B?Y0xYVDZJSE14eGoxVzZ5WktXSFlXQUp2WTdRN2VUUi96bFhxL2VoQjFRbmhs?=
 =?utf-8?B?ek90WGp0NDVnbTlIcEFsWjBzSlUxSml0M21xNDVtS1dWTWxvWlRGaWVyYUZC?=
 =?utf-8?B?NHNmMitBVDJ2MmdzM0o3OVhvV1IvOUNoVVZHUWxzTUI3Zkp5OTNXYVNpeVI5?=
 =?utf-8?B?MFVHejFTRzduSlBSR2hYSFgyQkp3a2FONFZiUFIvL1Q4SHU1MFc3OGluMW50?=
 =?utf-8?B?ZENFb0VwYU5qMmNTYTl6Ujd0bmw2WWhTc3dmSko5SmM4UUJQRzQ0QmVPVVdB?=
 =?utf-8?B?YUFubDk5aWFXaUJ6MG9QUjhUMjZ2K1NqcXUxRmpzeEtMZktDUmRXT0JxKzNO?=
 =?utf-8?B?Rm5FSUxsT25rV1liRUg0UENsTTA2Tk9wei93K1gwWnFJdkJJSFBiaFVGQjh3?=
 =?utf-8?B?c00yblp2dkVndnF2dkprekNKcWRWTERJMnJPSVRNeUFGZjBQK2VENmd6ajdZ?=
 =?utf-8?B?K0ZOQUZ3Nm9MUlM4ODE5aEYwNStsSVQzM2h2Z3lNNnVpNlJ3WEl5VVdVd1J6?=
 =?utf-8?B?TW5sZll5YjVrTi9BMWtpWEVnSTFmdTVLYlhBNmlhQTdaOFkybS9YSW91ekRk?=
 =?utf-8?B?NVJna1QrUzdHUkxaRjhPbTBXTHhIUTZSRDBtMThBaDRqcWRrVTZDWWpaaDZ5?=
 =?utf-8?B?Q3RjVm41SDZHNDhHUzQ1Y0UrVFRvUmhLQ09EZGhsOGxyd0RIelZoZHJkbzhR?=
 =?utf-8?B?OU55Rk41b1p4SFRNNjczamNSZjNMNlp5S2k1L0VHc3F4dXpUSy8wR3BSMktG?=
 =?utf-8?B?MkgrZ0djVk9QV0g1eXRXcVYvQW5iTEZRU1B2ekZRSmNtWWZVWXlPSGxoSEVY?=
 =?utf-8?B?QTVQMlF6TDh4T1h0UDBObW5aZXZjcHV2ZEwrM0dXekVJNzJGUVY1SDdsczNL?=
 =?utf-8?B?UjcvNTFWV0dkZndic1BvNDg0RFVOd3ZYMHFlN3ZNUEQyNFpjNXVYZ1BUSXpJ?=
 =?utf-8?B?by8wdGFuSXloajdkVjdjcW9yWWg2dXRVanhyTzlFOGtaWHR5eGhMNmhyWVFu?=
 =?utf-8?B?T1NZblpvNVVPaGJPTWNJV21wOERZMTZIVG55UHJJRHdnZHN4b1RjUzU5VW9s?=
 =?utf-8?Q?+ICI=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 14:42:49.6954
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9020e109-09be-4b1f-b735-08de188bc3ce
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6917
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_074257_752513_4564F3C8 
X-CRM114-Status: GOOD (  12.76  )
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

Hi Dominik Haller,

On Mon, 13 Oct 2025 17:22:40 -0700, Dominik Haller wrote:
> Add a label to the pmic node which is necessary to configure the pmic
> esm in the spl devicetree.
> 
> 

I have applied the following to branch ti-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am68-phycore-som: Add pmic label
      commit: 33a2c98caba8a45d2da0c7678f14b036b5d8d750

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


