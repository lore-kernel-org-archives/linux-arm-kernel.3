Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBD6D38FE3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 16:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QJ34d7EE/7MmbnNFKmVpgLbB39MFLZIRFVEQ/Sx446A=; b=XAURqQ3MLIgIbFSZcdLzKs+ZAl
	FII9EWUK41VexdZwyQfwzXwEFOMX3/w7lUPF9UPdNvMX9EabxMaWk13tYz1UVRSIa3/oH+edUD+HD
	RTxcwKCNlFe/LXkyKAnwoBkqK56FkRxa4NFvs1FEVNUVNkFXi/nZ5O7mvONrzle4UTtHjegjrnes3
	XkMyBKHZR/mWwiyKQlvQgxBra9evEiSS3PlEJX7H6ObrFymZu3088vI+dw5Z73bo6bxhQFTl62JHV
	qMfDh9D/6JtjdAomToou8smr0uidcCvmgibYYFp5zmQV+4+fWS34Tq+BUsMdPEj0AyX1sz06pklFN
	r3scUfvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3mc-00000009w4q-3jqg;
	Wed, 14 Jan 2026 16:31:46 +0000
Received: from mail-westus3azon11012025.outbound.protection.outlook.com ([40.107.209.25] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3ma-00000009w4K-0dlZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 16:31:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=myYlM/strRFjZO9gSiimNgnMTP1eefpxWpHhPOVdw6gfKo7mNvc0qXNkMPh1kgtjzW24qt2mLzv8VR9s+TYbCmpoVGAf07+WYeI5e2/HEnJN+GiNbWSuzfKtY53D6QCU+iSvEzJai6yHYhebmTgQRJbwbdlEgqp4zDJT3OKy3b6HTiCzgTgB4enIc+Ov/L1rhOP1XpZdV+OGNiUa3kW/m1N4Xcmcvbb6E26iouVZdDHf0Y5EqGeiHh9oMCMMxbg4eJ8Rq+Mtf9O2cr/imlIXQQ7hq84TTSPMk0yzrtHWoxtKMtYA638p91CXJSMd0JxiE+tIVPtZWEA/PTntxldfpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJ34d7EE/7MmbnNFKmVpgLbB39MFLZIRFVEQ/Sx446A=;
 b=q68/X3QVawP2IfdWrZGIwetBqXi4phHsZ/T63bVOXL/NJ9Dgu37pBFY3yXqsIAqx8PnApXFE4Irye2HiS0XYfBg6g9ecIJ1RQXPDRaMSMIORwL6SO8On9RwgG1u3rkyk1WoPabSTmv32ruRZC3VLLNs9E2W/5OmVXLL9gyJbdjBM3nKO4GoOeIa6w71IJJlqzUHxeFC3nmlyBaOZB+ppu8ho9diblfG7sNAC9ZtSt+cTXF6TmRFJxTXawZSOxQw272kcyZVnwF+NrV/WMptUVx1fNAcnwp8KeiiqetqxCnGEx7HwN6PB4u9ddwNjidqRjMftQF0D6PP5VoX72rihIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJ34d7EE/7MmbnNFKmVpgLbB39MFLZIRFVEQ/Sx446A=;
 b=JsfCsCUDSlnLsoaYJrXIvWZc1zehCYqo45nU7+Dv4wfskUiDLkbzD/SocYD3Amx2+m/wgBJaU1QyUgzmo7JmvAsBmOsuWDYz6qYDlGIqFOAaZw3x6ireOgxuIik3cPsboBg8wXGJmu6kehJUyERzO7hoL8QZroGSOMM4hxeQHN0=
Received: from MN2PR05CA0061.namprd05.prod.outlook.com (2603:10b6:208:236::30)
 by CH4PR10MB8049.namprd10.prod.outlook.com (2603:10b6:610:240::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Wed, 14 Jan
 2026 16:31:36 +0000
Received: from BL6PEPF00020E65.namprd04.prod.outlook.com
 (2603:10b6:208:236:cafe::6) by MN2PR05CA0061.outlook.office365.com
 (2603:10b6:208:236::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Wed,
 14 Jan 2026 16:31:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF00020E65.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Wed, 14 Jan 2026 16:31:35 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 10:31:12 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 10:31:12 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 14 Jan 2026 10:31:12 -0600
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60EGV7df081923;
	Wed, 14 Jan 2026 10:31:08 -0600
Message-ID: <2e377a8f-d0d3-43ec-98e1-ffe27bbeb3fe@ti.com>
Date: Wed, 14 Jan 2026 22:01:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] arm64: dts: ti: k3-j784s4-main.dtsi: Sort the
 nodes in appropriate order
To: Abhash Kumar Jha <a-kumar2@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
	<kristo@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<krzk+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <p-mantena@ti.com>, <m-chawdhry@ti.com>
References: <20260112085113.3476193-1-a-kumar2@ti.com>
 <20260112085113.3476193-2-a-kumar2@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20260112085113.3476193-2-a-kumar2@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E65:EE_|CH4PR10MB8049:EE_
X-MS-Office365-Filtering-Correlation-Id: 859ef99e-44d1-420e-a812-08de538a6238
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|34020700016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y01BSGI0VUJ2ZlJJU2pkKzF2KzNxdkVXOGVtKzJEakRPV1I2NjRGblFUZXdk?=
 =?utf-8?B?dGpIbEVZdmtldVdidngzbGFlUHRTT00rTzJYeXpoUThsUHFacmJENkU3L0Ft?=
 =?utf-8?B?OWJnTkJjWXhGcHpJcG1GMjYwcFFhT2V6NHp5b3h2TUhWNjF1VkhUUm9rZDFK?=
 =?utf-8?B?NUVCU0VESk1TUWxmT084SlNzbGh3N3ArLzVZMDAyOXEzZk16azB1RGQ0REs0?=
 =?utf-8?B?bDdSek9rN3FrNVI0dmRkcXFITTByNFNoajhKc0plM2tTR2s4NVVpczZHTSto?=
 =?utf-8?B?SitrTlpvT3VaNnVoOGJMVC8xVncrV1VMREgzK1JCYWYrWTBya1ZRZXM5SjJi?=
 =?utf-8?B?ZFltajJNRUJwdlhpemR5ekFSdWF3K2QzV1FhZTlCWm9BWHNFbXRNem9TVjFF?=
 =?utf-8?B?ZWFYREVzS0dvTE5UbEh1WUVxd0dTdmlQQVRWeWhLRzdzUzQzSkZIZG9EUkJP?=
 =?utf-8?B?eEtiSVk2ZUoyVlBBRHFOZWVZOTFoa21EWTJvdDFvY01xcXBGWEU3QUZOWTFM?=
 =?utf-8?B?cGhHcXp5M1U5ZllIek1DUW1rMnJLZ0VRdGUyY0t2bHJOVEdaeXNjN3pOY1Ey?=
 =?utf-8?B?UjhaRnVLemIzWmcwRHNkR0JodWZVdGZWa3hhYUdPdzFiaVREYXNkQkFibEJn?=
 =?utf-8?B?elUwekNoWU1aOUViWDdZMDg4bWxOeFlMUVl2c3RXN2VHRGwvYXF1L1l2TG93?=
 =?utf-8?B?azBwMUZNYVVwWmhFV0QxS1BkV2NkZUdweG9DRG5CSXVpc3RySUVWMm9zeEtT?=
 =?utf-8?B?c1J2ZzlRVloyYVBqU3ZzTHB3M2dUT2lhdHozMHRtcmFBTWVVZDZTYUZUVjRV?=
 =?utf-8?B?MCthQk93WXhPZUNZLzYyL1IwYkZndG01L2dYZGx6NFA2VEUyMFI4UGFHUWZ5?=
 =?utf-8?B?cWFaN2FKM05rTlJub1MwK2ZtNG82dkc1eFV1RFVlOUs1RFFlN0Z6YnpyUWs3?=
 =?utf-8?B?VENySWR0aVgxN1lnb2dQbUFYQVV2RVVKZm52dVo3b0F4eTgzQVBwVG1qaTJ6?=
 =?utf-8?B?L25xMFcyOW40ZlpUQm1SaHFJK0doemcwMlV2M0lOZ1dmYkhRb2R6Q2xPQ2Zq?=
 =?utf-8?B?QzBnbFFVUkFmaTRjYThSNjNYQTVodFhkc2IwZmVHL2lrZytMcU9SSUFkRk5p?=
 =?utf-8?B?OHJxVkdzRnJOVXd1L1RweEJJUXh1cUMxYjNlNDFQbXRSMlIzVkIwOHlCZlNV?=
 =?utf-8?B?UmUrQ1Y4dUJMak9TemdQQWY2UEViWkw4QSt5MEw0YUlaSFNnYi9wOE5ReW0w?=
 =?utf-8?B?MS9XUzAzemlVZ1JTcGtCejhKMHVwaVpheXd1Rm9SQnBJZzByNnMyODAyT29r?=
 =?utf-8?B?SkVtaU9VOUh4ZWJBcjJpZXhMUGJBUnJLZ2JtRHY0SjZZdzdRV041cit4VkI3?=
 =?utf-8?B?RlNQRU5yWHRKblk5TkJOVjFzbE4wS1RwbWpqVVFocUd4bXVtS3lwRXpMbC9r?=
 =?utf-8?B?T01JUnRjTWZVdGxBTE9xZnRqNVQ3OGRPQ2RuZ2V4NDRTK00yYUo2cVFpLys0?=
 =?utf-8?B?RDM5eFA0ZjRZaTc2ME9pMkxLU0doUGNzNmxpb1NPNXdTOTRPaExpelVoaWF4?=
 =?utf-8?B?ZjhNWjlYdzV5MENVZVdNS05YemFXK0dJQ0xIV0V1WUY3VFFvYUNEQ25SZnFm?=
 =?utf-8?B?UzdFR01GemVoWUxQVFJtcDR4YzFIUmRmVm9oMUxkdmhKVTcvenpwczVIZERv?=
 =?utf-8?B?NWpIVXdXY1ZEdjZMWkFOK1JJaFJMV1RGakNOUkVKMy9ZUmNYVUpsTWJXTTFB?=
 =?utf-8?B?QzQ3K3Q1VlJSM25mVjlXMFh2aVdCZ1hXU28veGF2TzAwSC9Ld1c2QmdBakVJ?=
 =?utf-8?B?WTNPUCtYdFVXRjN6ejZ3WXVzY3hsdC8vNGt1SDI0QnhaT3lONkRjVVhzdmhK?=
 =?utf-8?B?amtNMjVMOU5pMkw3WTgxTEhjMU83bC9ab1J5ZjlYQXdBRGp6M0twY0hwcHF6?=
 =?utf-8?B?ekM3ZXozMlJDNXlvMFl3NngrbXNBTjBQOHNHWVJoRW5TUll5aGxodzNFelN6?=
 =?utf-8?B?bWk4S2JjTFEyeU8rQUdodnpOcm5hOFJNenRhMmlUSzJSNmpBVGxnWVU2S1Na?=
 =?utf-8?B?MzY1Qjl5Y044ODd0TUY2cGNtVUVROFErVDUyZC96bnYrS2JaenhVczdNbmRC?=
 =?utf-8?B?UVZWYXdTYW9vS1ZHVnd3Wk1iQk83czQ0ZjRNMUVmTXgrT1NWWUtQNkEvZFJN?=
 =?utf-8?B?V2VmZG1HLzJ0a0xuSml0UTA3ZHlzVXVWaW0yd2MxL2ZZZWY1Y2JYQVlxY3lo?=
 =?utf-8?B?bDArWTBiZUlIc1dKbzdFZHhIdlFRPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(34020700016);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 16:31:35.0497
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 859ef99e-44d1-420e-a812-08de538a6238
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_083144_324056_99DAD48D 
X-CRM114-Status: GOOD (  14.95  )
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


On 1/12/2026 2:21 PM, Abhash Kumar Jha wrote:
> The device tree nodes should be ordered by unit addresses in ascending
> order.
>
> Correct the order by moving the dsp node at the end as it has a higher unit
> address.
>
> Signed-off-by: Abhash Kumar Jha <a-kumar2@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi | 26 +++++++++++-----------
>   1 file changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
> index 0160fe0da983..5b7830a3c097 100644
> --- a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
> @@ -6,19 +6,6 @@
>    */
>   
>   &cbass_main {
> -	c71_3: dsp@67800000 {
> -		compatible = "ti,j721s2-c71-dsp";
> -		reg = <0x00 0x67800000 0x00 0x00080000>,
> -		      <0x00 0x67e00000 0x00 0x0000c000>;
> -		reg-names = "l2sram", "l1dram";
> -		resets = <&k3_reset 40 1>;
> -		firmware-name = "j784s4-c71_3-fw";
> -		ti,sci = <&sms>;
> -		ti,sci-dev-id = <40>;
> -		ti,sci-proc-ids = <0x33 0xff>;
> -		status = "disabled";
> -	};
> -
>   	pcie2_rc: pcie@2920000 {
>   		compatible = "ti,j784s4-pcie-host";
>   		reg = <0x00 0x02920000 0x00 0x1000>,
> @@ -113,6 +100,19 @@ serdes2: serdes@5020000 {
>   			status = "disabled";
>   		};
>   	};
> +
> +	c71_3: dsp@67800000 {
> +		compatible = "ti,j721s2-c71-dsp";
> +		reg = <0x00 0x67800000 0x00 0x00080000>,
> +		      <0x00 0x67e00000 0x00 0x0000c000>;
> +		reg-names = "l2sram", "l1dram";
> +		resets = <&k3_reset 40 1>;
> +		firmware-name = "j784s4-c71_3-fw";
> +		ti,sci = <&sms>;
> +		ti,sci-dev-id = <40>;
> +		ti,sci-proc-ids = <0x33 0xff>;
> +		status = "disabled";
> +	};


Reviewed-by: Udit Kumar <u-kumar1@ti.com>


>   };
>   
>   &scm_conf {

