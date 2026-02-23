Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11E6EA4FA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 10:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pjtV7NOpnvh6b6ppIzaJjj0Y0M4TgOAsyTov92b8GZM=; b=s9xJrYQ+8x2i2X/Z60WxnOCTdb
	k9nCHSsaPVhMUktEvcwSiqdv6Al6HvOBBahzgxBkvlm3jSMtRv0lyRXDtYWdw7ue8Nv+CVH/on9rj
	ZbFQ3OwvkUZbkYR7NtrpV5cHw9jHsFv7EyWs7+zZxmShhIWZaxtCC/UXZBrD2d5UZEQhzFVkOoHYd
	rbxrCZqM1oFO/OW2OyqkM11Ce3g65DvVjHTAAcfVsv9Qle8g2gpdD0qS1rseUVqhQYuziWVaGMVzz
	MqKeakRhnk2727KK29r1lq94YkYnW2xVKcWbqCDEg5M0ig9XFZCFt4d2qDHI3N5c+ACU5FDIuceNA
	K8iPdpOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTdm-000000006vh-0wmG;
	Mon, 23 Feb 2026 10:58:14 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTdj-000000006un-0QMe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 10:58:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FPTomsDavbHF5OAqPWZN1asQQPYqyT17Sr27pxpEB9bjQuyM2QlvssNuzcB7ZbcbFiXzX5ycRN/7ytty0k97GOcfnZ1u61991vtcRjf/hM7Dd1fl1NjzBE/o6WbPEPKi7KG4wNg9/DhoEFiN+gEaNZlOGa1gol0HbkACtC/hwlNkdDSK+dacl+9jyooLC31B3XElolQNCFrp2SFivrgh5ETtH9Lj9peiqkvHYQpiz5h+xLnemlfP68jC5X8HhJQbYxki6J06c28I1C/gJYEPUUQeCMizXhQ3qedDMAorCnZjIsMqfjtW0G7Yj7FTxA+6OIQuZbCkw2tp75k8mwHv3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pjtV7NOpnvh6b6ppIzaJjj0Y0M4TgOAsyTov92b8GZM=;
 b=QPrlfjTJ8aL3Ukt6dKyTMY/aRRI2d3vpcjvm+9Md2ZOofBHyytgT+SflHJ6bvO4FKuLAvpTGcTLBBrw4pWoEiqEpyUGyat4Gmqz01me1v8eXqSNz4YQmgWGacAOWIn+HuLK7UpLFeLsjD2u6TRr6IFvVsxPy3LQ57StKXiGl4lDCv46uvVqbWU4diMOaQnJuSsZtun/qnYXbM7T7Nw83BVfQLGTBajDwY8Z8LPj5CCfR/t6lCZqZiFxP/azSpEjNtYPPBlvsU9hj2QluvyvhPuxk2PW+N/z3lPeuuIcCwXEaxXekbYZISN93vM9kWUG8fMo9VOtxFE0koAnK1rPfBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjtV7NOpnvh6b6ppIzaJjj0Y0M4TgOAsyTov92b8GZM=;
 b=W+1CwZIgNKvcVJKm/0zYXQp/p784thRbWqFaBInExrhDxV8MFQoLcOFvXHIEZ72u6g4KV8CL1QhmccZsdEl6lNGT2oV9He/kIJRONdydyl4TQs4ZixfC0owdnfT9hh5V5CV41jUP7GE9TzQHVP5zfj4ZRlTY7NahMsAM87A5FFk=
Received: from BL0PR02CA0074.namprd02.prod.outlook.com (2603:10b6:208:51::15)
 by DM4PR10MB7390.namprd10.prod.outlook.com (2603:10b6:8:10e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 10:58:05 +0000
Received: from BL02EPF00021F6B.namprd02.prod.outlook.com
 (2603:10b6:208:51:cafe::6a) by BL0PR02CA0074.outlook.office365.com
 (2603:10b6:208:51::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 10:58:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF00021F6B.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 10:58:03 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 04:58:03 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 04:58:02 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Feb 2026 04:58:02 -0600
Received: from [10.24.73.74] (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61NAvwf2656113;
	Mon, 23 Feb 2026 04:57:58 -0600
Message-ID: <6f4deec493f86a7731616d2f2846657ac1ba2b6c.camel@ti.com>
Subject: Re: [PATCH] arm64: defconfig: Enable the Keystone PCIe host and
 endpoint driver
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Aksh Garg <a-garg7@ti.com>
CC: <krzysztof.kozlowski@oss.qualcomm.com>, <geert+renesas@glider.be>,
	<bjorn.andersson@oss.qualcomm.com>, <arnd@arndb.de>, <nm@ti.com>,
	<ebiggers@kernel.org>, <michal.simek@amd.com>, <luca.weiss@fairphone.com>,
	<sven@kernel.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	<kuninori.morimoto.gx@renesas.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <danishanwar@ti.com>, <s-vadapalli@ti.com>
Date: Mon, 23 Feb 2026 16:29:28 +0530
In-Reply-To: <20260223104650.876632-1-a-garg7@ti.com>
References: <20260223104650.876632-1-a-garg7@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6B:EE_|DM4PR10MB7390:EE_
X-MS-Office365-Filtering-Correlation-Id: ea2edef2-63eb-4ed2-bb96-08de72ca6ae6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QnFadkFZUEZEMU1yMjVycE9lTUJ5TXhRL1pkcVlJREthaDh3VmtSSzhlZ3dP?=
 =?utf-8?B?QjJ2b3FyV0JwdUs2em9yNVRrckNHa0ZTWjYyTm1PQ0RtVVdlVW5mdVlsMkRH?=
 =?utf-8?B?TlZiSmNnbllQdjhRdlY3Z2ZVZ0c3Tldwak5zNCt3d09lMzVhL09uMDcwTGFt?=
 =?utf-8?B?QTNsaHlrcVlVQ1J4NGVEQWNQdHdSRm05M25lVXdWdHluQXo5SEhTK0Nnbi9P?=
 =?utf-8?B?Wmh4SCsvZEI2Q2JZNVB5bDA1TDlVTDVSVzhSMTNzSTBqb1NWZHR5c2liYVg4?=
 =?utf-8?B?cUdiTkczYytzREtVOTYzMzcyVkpYVytVQjBDV3ZpS2RoR01tZko0T2x2cnRT?=
 =?utf-8?B?bWNDT1E0eWdIYmM2eEVFdFBTbkgzSjZqcVlibmkxWmFEQ0FPcUVkR1ozeGJp?=
 =?utf-8?B?Y3daTkxiWmYvWm9yK3k1YXlZLzBMRGtNeUJmNTRESTBzWUMzbEFsWXY4Vzc3?=
 =?utf-8?B?dkhKbmRwVkZtWTR0b1ZOTEhTTWZSNmdLNU5EV3liVXEyTlFqaEJwS1VWcDhK?=
 =?utf-8?B?ckxOSmRVR3p2c1Rwa3hNQXVBY28zTGRuS3pjKzRjUUY4a0Uva1VnR1BFVnI5?=
 =?utf-8?B?VzNCZjJ2SDgxRUg5aHF1M3dWUU9OVjhjZUlDYzdnOURqN3lMaWgvVTlwOTdx?=
 =?utf-8?B?SmFUNDd2bUdIVkVqZUhJMTZVc1hDN1l6eGVQTGJWbkcxS1Jib0ptMGlpbXRY?=
 =?utf-8?B?SlJwTzV5Q2VpQ3FCVlpyLzlhbEs0WnJHSXY0R3pIU296djRINlUyMy9ZZjlQ?=
 =?utf-8?B?V3NHd3V4R3lnK2pRQ1FnM2hTNEpjNGsrYkVKUElHT1JUWmFlazZFYnJ1TTZk?=
 =?utf-8?B?NUNNV0ZqdUw2TmtGaW1TT05hYTRTWitvaWpvS3E0NWVGeTE4OVpOZmNQUDE1?=
 =?utf-8?B?b0taL0ZJZFBGS0czSVlvTXU3cTVVU09SdjVqUVFrS2JFTEhDVjEvNUFEZjR2?=
 =?utf-8?B?MU1VZnBCNlJFbFU1RkNwMlJKWldFY0JXSWNMTGRoRDM4NzVSaHQxVkEvVXBs?=
 =?utf-8?B?ZVllNGZhbFNTR2tnYXhOQWdVUk9nRUlidVBDRld2L1FVVGhPZ1ZRRFZhdzFr?=
 =?utf-8?B?aUZPUkJ4VUR0Q3dWMkZyYnhzQkt2TStBTWdBWTl6R0lnYTdIOFAyTFQwYmVO?=
 =?utf-8?B?U1NsSXZ3ODNINk11ZE9SMzdqZHZ6Y3Zhd1o2MEl5WnlxeTJRN1d5WWZPaldk?=
 =?utf-8?B?WkloTDE1dTVLNUgxZmVheHB1T1J2RW02RE41Q0pTL3JQS3RUbSswSDAwZWY2?=
 =?utf-8?B?dk5TaWxva1BFN3JTdUg3T2Uvc0RlbHRnaW42Rmt0SVJ2WUdrejNjZ0RsemhV?=
 =?utf-8?B?NHI0RUZqdXg5dDFkeDd5OERHR1FmRTBPMC92RkNVLzhnQ1B0TlNJOHduNEFj?=
 =?utf-8?B?U0VadlJHOGpBaXlnVTFSU2ZZRFdrMWNwZjNRZ082NFVsb3h6SG9IMHozVGZV?=
 =?utf-8?B?SllaL294MWxhZms2eU1oTXQ3VVhmM21UeHpBTk5FSm5ScjlLUGMvOFlNZkFG?=
 =?utf-8?B?K2JZazN3SFNvTGlMcG9sU1ZDNTVicGhVMjc1aUVzTFF2eGpsRUo4cWdqRExM?=
 =?utf-8?B?SW5DQ0ZNNXdSU1ZmakdUWkF4OS90cmtuZmVtM0NkN20rbHpmYncyUjVHUE1C?=
 =?utf-8?B?L3Z1YkFBUHJucFN4Q05xdS9MdFhOb1piQ3hzMEpsSW5LV2g1bThxUkw1U1kx?=
 =?utf-8?B?R05hdC9SM0ppUUNuN3JpbnNGSU9kdmh6SU9QbGdNTUVUTnRXNmpSNzhPVVp0?=
 =?utf-8?B?UjlDOExtamlwQ3ExclFYVE14aFkwcHpkZUdSSHUwRFZieG8zeVpSMGdPeEQy?=
 =?utf-8?B?eVR4OGMyT0VTTUY4SnhFUFlLVVJjekw4UmVZOGpzUWVLR1h5dmt0R0c5SjJq?=
 =?utf-8?B?NWdqN1R4WW1kTGxWeWgzQWFRRk44WG9mS0prbjFTV1p4SUs5MEgwRkFuc3NH?=
 =?utf-8?B?Tjl0RG0zRWlLaGlJT1pmMGllT25MOHRxcllUdGV4V2dLYkNVcFhJcDIyYVZL?=
 =?utf-8?B?QnZuYVFSek5SdVBFS2xWM25jT2RsRVQzYlJ1RmVuQ3VpNEdmS2VVdEtlWGlj?=
 =?utf-8?B?UFJoeFpqS2JuUk8reG55M3JINmFJYU80bytlcWZIR2RCUERpaEFZaXFDbDVL?=
 =?utf-8?B?cmFjMll3N0IvclhoL21oQzNJWWx4VFhSUFUxNHZSUXlMd1hIek5WSUFaZ3lB?=
 =?utf-8?B?cGpLQ0IwTzF5cWRLcXZYaFBpRVZtcGZuazlXc1pmRE5ubzNrU1U1N1AvTnZp?=
 =?utf-8?B?YXc0RGE2UVlTc1Vvd2d6UjZzK29RPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: lv71PfAJGnYtZ8gzgzScbZIm7rktZBGsLYPrDlvTcqBcam/grcX1PBSISFSCh+7kn2Lrd3Qgjwg66cLGkJ3noQ/gg6g4U9s56Wg1EcM0sWMb/ZyFKALah0yiSy8DY3Ub5gyofR1fMvvwdSMjiklpx357IVhouBhCLbe4aIf7knylW2oOD5TrSjfA+QPJYqOE/AisqFZSTAQlJB+1eQlb9KzbyYVUIu1yz2HSHWybukv+tsakVPpYXS4InwRKiczY4PAKxTUwwy1KGPWss8LCppTr1YhCdVscwwcrCSuqgWIgpBFwgEx3p+TTUwUOV7On4fRGKG6arq6eQVTRGZEvEDw46P+59A7Gb8zEoQQ9ndiB98T/YYTjdS7eGZ09cSKHcXQU9rq4CcOo9OBLNf5Aj6b69LFrJdvsw8f8UeeQS0JKAmv96QbTjMbMHLE4m6vz
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 10:58:03.4480
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea2edef2-63eb-4ed2-bb96-08de72ca6ae6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7390
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_025811_140398_0150907E 
X-CRM114-Status: GOOD (  11.17  )
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

On Mon, 2026-02-23 at 16:16 +0530, Aksh Garg wrote:
> Enable the PCIe Glue driver for Host and Endpoint mode of operation of
> the Designware PCIe controller in the Texas Instruments AM65 SoC.
>=20
> Signed-off-by: Aksh Garg <a-garg7@ti.com>

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

> ---
>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 103f4763b88f..81bc9882afee 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -229,6 +229,8 @@ CONFIG_PCIE_BRCMSTB=3Dm
>  CONFIG_PCI_HOST_THUNDER_PEM=3Dy
>  CONFIG_PCI_HOST_THUNDER_ECAM=3Dy
>  CONFIG_PCI_HOST_GENERIC=3Dy
> +CONFIG_PCI_KEYSTONE_HOST=3Dm
> +CONFIG_PCI_KEYSTONE_EP=3Dm
>  CONFIG_PCIE_MEDIATEK_GEN3=3Dm
>  CONFIG_PCI_TEGRA=3Dy
>  CONFIG_PCIE_RCAR_HOST=3Dy

Regards,
Siddharth.

