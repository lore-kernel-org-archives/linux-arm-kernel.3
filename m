Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 970C5CF2599
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 08:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vS1ru0kTV0BRYTaVhgBvxQuKP+ULdUtTbLTJ1v9KTVM=; b=W6VzKXVzJmte8HwJdq5F/8IORP
	V65P/joXgqH220kUUPzpFwd+wLEeWwABp+HXz4BpgDBlza/aUTxZva4GvcEDc+5uoiM+JCrd1H2il
	aCV96Sf4ujLgq80VAoVTwMUsP+QRoOEb0UbwG2eo/HRTsU56MhF5xzH6cKHSvmYtPu5RQJR0ZpuMJ
	MvsMMF8omqWgoUWxG8Nj0c/5Mvm6+UQZ62BE4xbLKVMgD4RZO3nCJ2+B//MTwec+ohD2GyBIjxIuI
	Wv0yJhkBkSeV6jNSS3x7TNY3efIB2dlSziCFhPML+mBg235Ec/5niA/svh0b+iHA7larf9lxJhowj
	3CgDwPuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLdFO-00000002lWv-0dzZ;
	Wed, 19 Nov 2025 08:09:02 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLdFL-00000002lW7-3KIR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 08:09:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UJt7YiqWTehg7BDiq5DLQsjOIXXHGH8EGc2TL32VqdsXijEzNN8CMXfLX/wg2g5tn3HiaAtxftDRmCDwHX67sY7RhiIdfkXVy15/fYxJuho5U+wjrYWtVnECSFU4fxj5r4+KA8i2ZjCNODcq7wF4Z8nF25EGeiNgTvgvmwKn3FU+qI7hHZkDXd5D15hBlwIpbUMTVHSeUKamSAGsCna47sVwbKffok2h4OgOKYYljiJuy1W/7+3bbQqkvb8NtpcnXtLnaONuHBaqY/DXTkZnUxU7oz1TMUpnSK8p0At3t/KLnNIEF7Km78Uw2xm/qiew1DBQ+sD/C1y+2spcLc/Vug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vS1ru0kTV0BRYTaVhgBvxQuKP+ULdUtTbLTJ1v9KTVM=;
 b=GK+zc/RvWm4cMZ7hzCX+9E/12QscKr1fThU8noYYYO6aV/pwVgmm4Cej8Dtk/7T+ZIdFQxBuegUVQbiegidsrlCx07zoZ6b6xQPGnXdEw5ReQpHMSCFpCmADsKwyZTMwNZxqHrR9bGl/ZvLzgmK75aD+YjJ35I15yVuavXAa6hJze6jeJ3cJBPkL1rxyXYYXWcQWT+ozpApKmX2kSE7I1U1c1uLJZOPyZD0qeVgdN2Iq+QsIx19hHSZzdCeIYtnCW4mY/tBfF1DSsiljiV8Q3XU5c9xfuExu6OZK0Q4p2XwluhPEaAkp2he5A5oS/qqro7Jkp+iXFV1AYRb40/L9yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vS1ru0kTV0BRYTaVhgBvxQuKP+ULdUtTbLTJ1v9KTVM=;
 b=n40gNkVGqddIkHkWLzP6M6TvgGxNP/1wzKYOv+TmZ7iZCO8iKpHTOnzqxa2shVXjxyc9JPzUgWRRqqwIy2yk6C9nlpjCJDktgjF96rw2eZdxTVzdULWuK72+ajD4Yr2pt0T+z+tHssFubwWTTiJ70uXh1F6o0MbaMKYFCi1DQpM=
Received: from SN7P222CA0016.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::16)
 by IA3PR10MB7994.namprd10.prod.outlook.com (2603:10b6:208:50b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 08:08:54 +0000
Received: from SA2PEPF00003AE7.namprd02.prod.outlook.com
 (2603:10b6:806:124:cafe::ff) by SN7P222CA0016.outlook.office365.com
 (2603:10b6:806:124::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 08:08:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF00003AE7.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 08:08:53 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 02:08:48 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 02:08:47 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 19 Nov 2025 02:08:47 -0600
Received: from [172.24.233.103] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AJ88hYW1548624;
	Wed, 19 Nov 2025 02:08:44 -0600
Message-ID: <f4d38392-a019-4061-9ef0-d95506766027@ti.com>
Date: Wed, 19 Nov 2025 13:38:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-j721e-sk: Fix pinmux for power
 regulator
To: Siddharth Vadapalli <s-vadapalli@ti.com>, <nm@ti.com>,
	<kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <y-abhilashchandra@ti.com>, <u-kumar1@ti.com>
CC: <stable@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<srk@ti.com>
References: <20251118114954.1838514-1-s-vadapalli@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20251118114954.1838514-1-s-vadapalli@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE7:EE_|IA3PR10MB7994:EE_
X-MS-Office365-Filtering-Correlation-Id: 175e8367-8cf4-442c-127b-08de2742e17d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGgrMVZkRHNnelhnSG1ja3ZZLzl4c1RIMG9UYUE1V3JRcGJ0SFdOMmU0QWRr?=
 =?utf-8?B?UlZnUXNUaGxTc3FVOUFOTFpQZDhhd29ieEJBZE1MNVo5cWhzMFZoamZ1WmQz?=
 =?utf-8?B?TTBiL3IrcVlGRXd6U0Z2QVNFNWhLdUtUQW0zZGFXNUpNenl6R1llTUtVd0FS?=
 =?utf-8?B?MTRYTDQ5RGI2RXI1MDc4SFFoMTlFdTh1TXdnVEV0aTNMUXRXd3AxYlR3OTB1?=
 =?utf-8?B?TTl3QlllTlNiOFkwYTNXdDh4eVh3eURTQ3RDWGRmMEhxWEFyZHpOa3dLcVV1?=
 =?utf-8?B?d2VZTXZiaUxWeHJZK28rN01vWmZ2Y2x4WlZlK2hNazVFSWN4ZlljYWFVVlFu?=
 =?utf-8?B?Uk53TWJnemVqb2Y2QjhEUURCM2dwdDRpMXFZVzk5M3Ivc1EyWVJKL3hxM1lF?=
 =?utf-8?B?SmlEWnNqL3ZjMUNDSElUcmtUNWM0dUpwcW5oUXNsdmlqUmR3R0x6UFRmUTZn?=
 =?utf-8?B?eXYvS0pMaFo3ZnhVL3NDdkpnamxzb0x0LzVFTkppQXhveTNubGFRM1pxM3p3?=
 =?utf-8?B?OG1GQ3d1MzI3RHM0ZmxQL08ydFNiTDBGd3l0K042TnVscEJrMmZaTVJTTjFq?=
 =?utf-8?B?QjRleW9QZVdwL1pPZ0xMcU9DNStVVnlSSi9VK2VQNHZQaTltajhhVjBadDV4?=
 =?utf-8?B?aU5oUUVqQ2Vub29qWTQvSzJqVXFubUdSL2IvTVdEbndsVjlsNFY0Si9vY25r?=
 =?utf-8?B?Mjc1enhrRUZuN2FyL3NwblFCWWZES1Z0WUZUUUxXWDR0aDdMSHFkWWcybCtX?=
 =?utf-8?B?NUJuUkFoM1BLcnNMd2R2OWNlcmlabGtkcnRZdFdYbDMzcC9nQ3lVcmo0TDRq?=
 =?utf-8?B?bDRvRU9VeWJuOStmakRuZ2NNWWgybHp2VjdGNjJHeHkyQ3RJdllaSmFOR2JX?=
 =?utf-8?B?TWtMaWlhTWVqQ2YxOGxaT3FOZENOS2IrWDZCT25wNWRjS2E0MHB0Vk1zWnRu?=
 =?utf-8?B?bFh6Q3JnTHhuUkpOUzFqY3FPQllnZnNFenkrcFF1STg1UCtnaE8wWSs4UlBR?=
 =?utf-8?B?anlPaXhBaWR4VEptOUJFUHhFVTJjRklmdStXN2NOK2RuK3h1MVFPMGhOUSt0?=
 =?utf-8?B?VmxJL3NvbGlSemxwMkh2ZkIxTHhjeUJBVkxqMCsxYzh1Z21UUmlDbmtXVVZt?=
 =?utf-8?B?SzM0OVpTM1BScFRZQW1zd0JZNUZlNHhXbE92eDB1K0VvemNFTHdaaGJiY2Fi?=
 =?utf-8?B?ZjhGYkN5ckpmR2pLWkczSHhQblpXNDBPdGFkOWdCYjc0VFJ2cWFxazl5R0Rz?=
 =?utf-8?B?UU1kQ0FZTWZneUlmZWRZbVNPV1Q4akNOaEVOMVNDWWxlSFI3eWRNN0szWjhq?=
 =?utf-8?B?ejR5aWtldldhaDk2bTgyL1BKR1pKQmJDdDhWUjZWODgzSVlOVUJkczFhYnBO?=
 =?utf-8?B?TDdaZkNVN2VoaTN3bURpdW5Zb2o4L2tMU3Qwam1aQktKbHNac3ZvZnRaWXFn?=
 =?utf-8?B?MFFNT2h6Q2YyWlZKRWJtYytNcVV2REUyYkhRQ0NDVDJ5dHl3NDNaMEZ6b2NK?=
 =?utf-8?B?ejFVU0c4Vmpyekd1ZzRLVjRTczJldm5KSGxMQUp4UWVUa3B6UjNQMWFhUkcv?=
 =?utf-8?B?RDVsbFJUMVJOOWlnY2l0dU5HSlNoREd6V1p1b0NiRUhNVWViNjNxdEZJSXd4?=
 =?utf-8?B?bURxSm5sZTNYaFM1bXdHQWZlUUJBOVd6dDl5dXBQZGZwTFNrY3MyK3NoazRV?=
 =?utf-8?B?eXdkRythSVNvaHhlRkpxK2g2aWlEUDM5L3pXY1NyRkNVZ2xUNW12Tm5uUTNl?=
 =?utf-8?B?ckx1K3BnVW8rSG5rWmZSSkVZKzlUY0pYUTZTcm9mYTJ6eVQwc0V2R2dDbisv?=
 =?utf-8?B?eHMrVTBNY2ZDWUMzN2FyZ2tFeit3YWV4Y3I0MkY2eUkyVkxCRHJ0MGNpOVhB?=
 =?utf-8?B?MVJ1TU9sN0pROUJJemxUOXQvZklKaU54ZG12TkNhRy96QkdBdHl3dWZuRGNn?=
 =?utf-8?B?Q21kUnR1VnovZVh2K1BZR2hyRnpUNzZKWTV5bEpYK2Y3SjhrRWJhTWRVY3Bw?=
 =?utf-8?B?dkVVVk45SzE2OWNGYkc3U2I5UTdRbjRyWEZKYjZqMW5leXBVejBWSGkyNndl?=
 =?utf-8?B?WmdRbGZadmIxSU4vd1BlNzdQWGpiN2xZNzBzalhXRDJrOFpLZ1FIek9LVDNZ?=
 =?utf-8?Q?7Qzl4Q69UVi2+3m4ZCRfZ/u1h?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 08:08:53.6865
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 175e8367-8cf4-442c-127b-08de2742e17d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB7994
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_000859_843251_37E9A87F 
X-CRM114-Status: GOOD (  21.00  )
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



On 18/11/25 17:19, Siddharth Vadapalli wrote:
> Commit under Fixes added support for power regulators on the J721E SK

^^^ not the right way to quote a commit. Should follow commit SHA
("$subject") format. Moreover this paragraph can be simply be stated as
node is under wrong pmx region (wakeup) and instead should be moved to main

> board. However, while doing so, it incorrectly assigned a non-existent
> pinmux within the WKUP Pinmux region (pinctrl@4301c000) instead of using
> the MAIN Pinmux region (pinctrl@11c000). This leads to the following
> silent failure:
> 
>     pinctrl-single 4301c000.pinctrl: mux offset out of range: 0x1dc (0x178)
> 
> The datasheet for the J721E SoC [0] specifies on page 142 that the
> pinmux of interest which is Ball Y1 is PADCONFIG119 and the address
> corresponding to it is 0x00011C1DC which belongs to the MAIN Pinmux
> region.
> 
> Hence, fix this.
> 
> [0]: https://www.ti.com/lit/ds/symlink/tda4vm.pdf
> Fixes: 97b67cc102dc ("arm64: dts: ti: k3-j721e-sk: Add DT nodes for power regulators")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
> 
> Hello,
> 
> This patch is based on commit
> e7c375b18160 Merge tag 'vfs-6.18-rc7.fixes' of gitolite.kernel.org:pub/scm/linux/kernel/git/vfs/vfs
> of Mainline Linux.
> 
> Regards,
> Siddharth.
> 
>  arch/arm64/boot/dts/ti/k3-j721e-sk.dts | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
> index 5e5784ef6f85..77dcc160eda3 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
> @@ -474,6 +474,12 @@ rpi_header_gpio1_pins_default: rpi-header-gpio1-default-pins {
>  			J721E_IOPAD(0x234, PIN_INPUT, 7) /* (U3) EXT_REFCLK1.GPIO1_12 */
>  		>;
>  	};
> +
> +	vdd_sd_dv_pins_default: vdd-sd-dv-default-pins {
> +		pinctrl-single,pins = <
> +			J721E_IOPAD(0x1dc, PIN_OUTPUT, 7) /* (Y1) SPI1_CLK.GPIO0_118 */
> +		>;
> +	};
>  };
>  
>  &wkup_pmx0 {
> @@ -536,12 +542,6 @@ J721E_WKUP_IOPAD(0xd4, PIN_OUTPUT, 7) /* (G26) WKUP_GPIO0_9 */
>  		>;
>  	};
>  
> -	vdd_sd_dv_pins_default: vdd-sd-dv-default-pins {
> -		pinctrl-single,pins = <
> -			J721E_IOPAD(0x1dc, PIN_OUTPUT, 7) /* (Y1) SPI1_CLK.GPIO0_118 */
> -		>;
> -	};
> -
>  	wkup_uart0_pins_default: wkup-uart0-default-pins {
>  		pinctrl-single,pins = <
>  			J721E_WKUP_IOPAD(0xa0, PIN_INPUT, 0) /* (J29) WKUP_UART0_RXD */

-- 
Regards
Vignesh
https://ti.com/opensource


