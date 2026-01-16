Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233FFD48986
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 11:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TrVZ6rt6hHLeU5kqkgbOZO0j1P+WhGW4jgL9YKUJ7Yk=; b=U6qaUVwTSVlRzIQwCzqtAMdswH
	18WBoynM9vLRwvCX1otfThYmxvJIwNgVTPYhyB8guXBKtuSfstw5CBLDY0mFBA2ugRJecc3uwLsTM
	3CQ/R5v0b9KWOWPUQTRiEVf1aF8Y3sPwQIpaNg4ucl+6CW+dQyLSvuWNy75LDnH9vmrWwgOb39JgP
	VDcSu/I0cv6xFpNLMtRzSlv4Pn6ODzSBUN30hVPNCH8Ua9oPJpcWt+CfFejDxT3sOWcv3xmNVs8rI
	154o936+Bo+vTgtbfCG/0AX9KMmSGJkehrJXKHTVQKG0pHlwAqRhLIOX8Y40tC+OYnw7M2hzM0F77
	mtgKrJXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgiO3-0000000E4X0-3PNa;
	Fri, 16 Jan 2026 11:53:07 +0000
Received: from mail-centralusazon11010001.outbound.protection.outlook.com ([52.101.61.1] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgiO1-0000000E4VX-16Z7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 11:53:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XcEnrXdENd2CfgDLDBrdBxzWdcyQtGAZEYcZcq9PbYr9EEnXpEnLb1C4dpLbnD/zrj/vEQLvgsAf4DOxO4sPJWjNY0CDw2bV3k/+jJpIDcH1q6tmVOGCQEOBHAzZLGoUEjR1MsULDIDbEZZtRse3HhpkQuEvQAkdHtwqZpEIcDXGW5I6IJXos2o042CVvGPQ/y6/0L3FA8wfM6nrgf99dAmduRdbMPAXj8JGj64w4mevn2SoOgxiJPs4vqRiIttknerH3AQz1x1l4O13LmcKS2jwRzPyOUN8yzsSFQRpnIlBV3Kkl/zwOah4hBCBiUrwXmpeBFaWSrDNxxJ0a0cz8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TrVZ6rt6hHLeU5kqkgbOZO0j1P+WhGW4jgL9YKUJ7Yk=;
 b=YsgZr2b5+hXjwlX0XWNGIoKcBfoDamXGWJXH+2K0WPhzOemwr4RCrdzWc7xkd7xjFnfmC7ZD2R5tcObbn7BScbbxyIo9ZAudeHPxEfOtDWHH0wxEPjlFIbea7Wl2QtDj3k2MJ0JqTl+RU3KTkUFOxLzaX+SjITrHzutgJOSDP4PAkmlZY1pbG84yyNk7X8G5gjYwkAR9p9E1AiFk9GvpKn7NqPpMcjFQMKWZ0nJFUZP2K6QdKKJYVW644fL9ooEUgz4N0QKURrB8z9xMmL5qE/FXOk3WYfVCricY6WuyCYFw1b5ojJHEXOiLnq/Y63wDcGSV2QS260s9NyincsXkkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TrVZ6rt6hHLeU5kqkgbOZO0j1P+WhGW4jgL9YKUJ7Yk=;
 b=okw/ctr8RsmvlGg+kc35R5FjWMGmYogjxqT+nuTs50/bKtkhD/ByKjK/YjJXW5KqJatdfBF+2KLUsavz7GYzXT+xVFhl73oh1xutynKGr+nuTx4M3+s3QENPQmd8BEVs2AvuV4OHU9b4pm6DT/cyJ51//raQpJT+FSjcbg6CnZo=
Received: from BN9PR03CA0391.namprd03.prod.outlook.com (2603:10b6:408:111::6)
 by SJ0PR10MB5765.namprd10.prod.outlook.com (2603:10b6:a03:3ed::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 11:52:58 +0000
Received: from BN3PEPF0000B076.namprd04.prod.outlook.com
 (2603:10b6:408:111:cafe::dd) by BN9PR03CA0391.outlook.office365.com
 (2603:10b6:408:111::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.8 via Frontend Transport; Fri,
 16 Jan 2026 11:52:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN3PEPF0000B076.mail.protection.outlook.com (10.167.243.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 11:52:56 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 05:52:52 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 05:52:51 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 16 Jan 2026 05:52:51 -0600
Received: from [172.24.235.213] (gehariprasath.dhcp.ti.com [172.24.235.213])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60GBqlDv3228308;
	Fri, 16 Jan 2026 05:52:48 -0600
Message-ID: <4a46cbb7-f1b7-4509-8bd1-ffb192d1e2e9@ti.com>
Date: Fri, 16 Jan 2026 17:22:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: ti: k3-j721s2-common-proc-board: Enable
 analog audio support
To: Moteen Shah <m-shah@ti.com>, <krzk+dt@kernel.org>, <robh@kernel.org>,
	<conor+dt@kernel.org>, <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, <y-abhilashchandra@ti.com>
References: <20260112104536.83309-1-m-shah@ti.com>
 <20260112104536.83309-4-m-shah@ti.com>
Content-Language: en-US
From: Hari Prasath <gehariprasath@ti.com>
In-Reply-To: <20260112104536.83309-4-m-shah@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B076:EE_|SJ0PR10MB5765:EE_
X-MS-Office365-Filtering-Correlation-Id: 51ca4319-d7d2-4240-7e53-08de54f5c9d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700013|34020700016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NCtKaU4rZlBiaXF5VlV5T1FHdmhzZlpLWFB0RVBHWkVGRDJwNlp3MmRtTXVI?=
 =?utf-8?B?aFkxVGx6akwrZ3Qva29vZ1pJbk5DNDAxWW5Yb3lTNzArTVBSV3F6eksxV2w4?=
 =?utf-8?B?THhiNmM4dkIvT3pEZXZjK3hGVnFmLyt3N1pyV3ZkcUFTakJnRVpXNGVZOGo3?=
 =?utf-8?B?a3VMN3NKREZjWnlSY0c4b1UwWXpHbHdZUGM1Y2dQQVFVNXlzSmh1ckRwdFBR?=
 =?utf-8?B?WW44ajM3S1ZiMnI2cEwweC9pSCt0V2hyYnF3WEFoTlkvTGlQcW4zR0tCSWJo?=
 =?utf-8?B?YlhQaWEwdTRKUDJZMnlUK25lZldjRWpNaFplWWxSQ1lGVWhVaTJNN1FIUjAv?=
 =?utf-8?B?TW05bXZMRnZoTkdjeWM5ZDhFL3plVndNNENVSGhmdXFGb0gzNHZFb1J5WWRl?=
 =?utf-8?B?WHBUL1BCVFZ1VmN5aDBlS3ZDUjhVaTV3VGJoT1ZGdGdhMVU1clZsTnpHempX?=
 =?utf-8?B?N3RvWjFhQTlwVWI0T1lqMnVVVVVzeEFuVm8zUFdjbjRDbVhvV0o1Q3J1ZTVM?=
 =?utf-8?B?VXdOZG1UNy96eFlyMW5tV3JMbnRvdDNvR0ZLMmNtMWp6M0xDUVV4SDh6UTI1?=
 =?utf-8?B?Y0I0VEFUdlhPdnhqcVdncWJKZ3ZEanB1bytzRzhhWmNPelFmSCt5Y2kwcUN0?=
 =?utf-8?B?OUF4TGx4UUlxemxVRU55UTNHYmM4K0x3MHhzR0pUVS9wbEZ5a1FOMU0rNkRL?=
 =?utf-8?B?c3RNV1hMOUFDM0ZoUkJ1eUovaXpMb2FVMFVaOHRqQTZkbW11c1VSSG1TVmhH?=
 =?utf-8?B?S09oMklialdXS3VaWG9DcjR2N1BoZEsreDgzZ0p6Q092ZG9aVmZsbVUvQUx5?=
 =?utf-8?B?OVNYaWQyckxES1UwYmZtdGVDY2dLcGtpRDE2YW1Ld3FLeXM3YW1ScnBxZGlw?=
 =?utf-8?B?bGcrYld2RVp1bm9sZjJJQkJZOXFxUno1ZUQ3Z1V2b0Y3ZXlnL1MyZEZyU2RR?=
 =?utf-8?B?YmRSVXovUERLNUg5MVhsL3krRGxaNEFRb2lLWHg3ZVBLUks4L2Y2a2hJdEUz?=
 =?utf-8?B?MUp3a29RN1M3ZVMzcXo5ZnVkZDRwQXRUbkM3WUZRWmpNTStCNDFaeUs5MlM5?=
 =?utf-8?B?cVVUaWExRmZwVFV1dkdPbW9NVTVUU0I0WUcyQjRReDFldUVQdUIwU0J3NjdT?=
 =?utf-8?B?eCtuZXdNQll5U1dJOWJYQ2RUS21LZXV1U1VMVjJZcXRhZnNsOTdjQVpDb2Mz?=
 =?utf-8?B?bUs2YXV0LzJYWU9BVzROb2VYWDYwUDdTTlhYMzljdUhVVEJyNFEwZzFwQUJj?=
 =?utf-8?B?YWxtSzhGdENjOVhJUUU5a2RTaGJFeGZ4SnFwOUhzTnhCYTVwQU1iVkJ0RUhR?=
 =?utf-8?B?RUlRUVNUeTh2M0huUnZodkQ1a1N1dE0vSUJ3V2NScmQ3MGFZT2lteW1kS1VL?=
 =?utf-8?B?b0NjaWhSS3JDWVBuM1AyeFFjZEpKQ1k1elJ0M3doazVpbXpRNW8yVHJJNjAx?=
 =?utf-8?B?Ylk4L2h0WWNSVDM5WkdRT3FTQ0o1L1UyK2czM1pMVnplVUV3WWdEUHNuMEpo?=
 =?utf-8?B?YjEwVjVEMDdHOXVOOEFUWEpGSE1TTGl1dzFBRUpCK0ZCU3ZQakhYdTcra1Rq?=
 =?utf-8?B?M1o4OTlCQ0lTdVloNVZiZGwrdUxQUEZOblpPejVsNlVGQ3kxbnJleTk5by93?=
 =?utf-8?B?YytmUVRuczd6ZUFjdjYvcE5tOFJkNWVwWWx5cXRHNjBvZ0tKcXhPOUNZa3dG?=
 =?utf-8?B?djBBck5nb3hETDhWSWEvV1laQXVkemdwWGdMeVB6MHFOT2VJbVZ6K2lOM255?=
 =?utf-8?B?MkJwalByWlBZQ1RpWWhCV3E2RjJ2VVNBNTB5T3hFbEg3NGgvT3JienpqRklI?=
 =?utf-8?B?MTRQOFVCVHdXVWQvWWpGcC9hYVR6NnpteDRSdkNHT29xTCt5VXgxNkpXZitq?=
 =?utf-8?B?STIxWERsTE56bGJzS29lMTIwbVY5S0dGcXZpQVZ3ZGpxOGtnM0xlRjNQU0k0?=
 =?utf-8?B?QUNlOEhJYTZQK3lROEMrcXRDcDU5M3V6aTV4NHQ3TUMwZ3BvWTdIM0E2aFBL?=
 =?utf-8?B?bWN5SkRUTzZTT0xZcCt1TG5VakhkWVR2YWlPYkNXTXJYQStMZ1RtZUtTSjZ2?=
 =?utf-8?B?cUxIRmh6TmdmSU9ramxnR0FpeW55Qk1kWGJVc2ZicFJUaHViS24vZnlWMTdr?=
 =?utf-8?B?NWdOSGN3ZTZRQytXOGcxOTRaRDE1Vk14TURNK21QaTRnME11UHFFOWRyS2kz?=
 =?utf-8?B?UDlCejRmd21MNlNwRjFtZWsxMTZvMkFtV21Bc2VqVzZXWkdpcG1DTHNreU4v?=
 =?utf-8?B?QS9zZlpHdWVDNXZsUEZLSTFIRVBBPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(34020700016)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 11:52:56.1944
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51ca4319-d7d2-4240-7e53-08de54f5c9d5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B076.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5765
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_035305_314600_9DE1AEDA 
X-CRM114-Status: GOOD (  17.73  )
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

On 12/01/26 4:15 pm, Moteen Shah wrote:
> From: Jayesh Choudhary <j-choudhary@ti.com>
> 
> The audio support on J721S2-EVM is using PCM3168A codec
> connected to McASP4 serializers.
> 
> - Add the nodes for sound-card, audio codec, MAIN_I2C3 and
>    McASP4.
> - Add pinmux for I2C3, McASP4, AUDIO_EXT_REFCLK1 and
>    WKUP_GPIO_0.
> - Add necessary GPIO hogs to route the MAIN_I2C3 lines and
>    McASP serializer.
> - Add idle-state as 1 in mux0 and mux1 to route McASP signals
> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> Signed-off-by: Moteen Shah <m-shah@ti.com>
> ---
Looks good,
Reviewed-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>

>   .../dts/ti/k3-j721s2-common-proc-board.dts    | 131 ++++++++++++++++++
>   1 file changed, 131 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
> index 4fea99519113..d9269a16956c 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
> @@ -150,6 +150,28 @@ transceiver4: can-phy4 {
>   		standby-gpios = <&exp_som 7 GPIO_ACTIVE_HIGH>;
>   		mux-states = <&mux1 1>;
>   	};
> +
> +	codec_audio: sound {
> +		compatible = "ti,j7200-cpb-audio";
> +		model = "j721e-cpb";
> +
> +		ti,cpb-mcasp = <&mcasp4>;
> +		ti,cpb-codec = <&pcm3168a_1>;
> +
> +		clocks = <&k3_clks 213 0>, <&k3_clks 213 1>,
> +			 <&k3_clks 157 299>, <&k3_clks 157 328>;
> +		clock-names = "cpb-mcasp-auxclk", "cpb-mcasp-auxclk-48000",
> +			      "cpb-codec-scki", "cpb-codec-scki-48000";
> +	};
> +
> +	i2c_mux: mux-controller-2 {
> +		compatible = "gpio-mux";
> +		#mux-state-cells = <1>;
> +		mux-gpios = <&wkup_gpio0 54 GPIO_ACTIVE_HIGH>;
> +		idle-state = <1>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&main_i2c3_mux_pins_default>;
> +	};
>   };
>   
>   &main_pmx0 {
> @@ -224,6 +246,22 @@ J721S2_IOPAD(0x03c, PIN_INPUT, 0) /* (U27) MCASP0_AFSX.MCAN5_RX */
>   			J721S2_IOPAD(0x038, PIN_OUTPUT, 0) /* (AB28) MCASP0_ACLKX.MCAN5_TX */
>   		>;
>   	};
> +
> +	mcasp4_pins_default: mcasp4-default-pins {
> +		pinctrl-single,pins = <
> +			J721S2_IOPAD(0x0c8, PIN_OUTPUT_PULLDOWN, 1) /* (AD28) MCASP4_ACLKX */
> +			J721S2_IOPAD(0x06c, PIN_OUTPUT_PULLDOWN, 1) /* (V26) MCASP4_AFSX */
> +			J721S2_IOPAD(0x068, PIN_INPUT_PULLDOWN, 1) /* (U28) MCASP4_AXR1 */
> +			J721S2_IOPAD(0x0c4, PIN_OUTPUT_PULLDOWN, 1) /* (AB26) MCASP4_AXR2 */
> +			J721S2_IOPAD(0x070, PIN_OUTPUT_PULLDOWN, 1) /* (R27) MCASP4_AXR3 */
> +		>;
> +	};
> +
> +	audio_ext_refclk1_pins_default: audio-ext-refclk1-default-pins {
> +		pinctrl-single,pins = <
> +			J721S2_IOPAD(0x078, PIN_OUTPUT, 1) /* (Y25) MCAN2_RX.AUDIO_EXT_REFCLK1 */
> +		>;
> +	};
>   };
>   
>   &wkup_pmx2 {
> @@ -321,6 +359,12 @@ J721S2_WKUP_IOPAD(0x104, PIN_INPUT, 0) /* (N26) MCU_ADC1_AIN6 */
>   			J721S2_WKUP_IOPAD(0x108, PIN_INPUT, 0) /* (N27) MCU_ADC1_AIN7 */
>   		>;
>   	};
> +
> +	main_i2c3_mux_pins_default: main-i2c3-mux-default-pins {
> +		pinctrl-single,pins = <
> +			J721S2_WKUP_IOPAD(0x038, PIN_OUTPUT, 7) /* (B27) WKUP_GPIO0_54 */
> +		>;
> +	};
>   };
>   
>   &wkup_pmx1 {
> @@ -396,6 +440,22 @@ exp2: gpio@22 {
>   				  "MLB_MUX_SEL", "MCAN_MUX_SEL", "MCASP2/SPI3_MUX_SEL", "PCIe_CLKREQn_MUX_SEL",
>   				  "CDCI2_RSTZ", "ENET_EXP_PWRDN", "ENET_EXP_RESETZ", "ENET_I2CMUX_SEL",
>   				  "ENET_EXP_SPARE2", "M2PCIE_RTSZ", "USER_INPUT1", "USER_LED1", "USER_LED2";
> +
> +		p09-hog {
> +			/* P09 - MCASP/TRACE_MUX_S0 */
> +			gpio-hog;
> +			gpios = <9 GPIO_ACTIVE_HIGH>;
> +			output-low;
> +			line-name = "MCASP/TRACE_MUX_S0";
> +		};
> +
> +		p10-hog {
> +			/* P10 - MCASP/TRACE_MUX_S1 */
> +			gpio-hog;
> +			gpios = <10 GPIO_ACTIVE_HIGH>;
> +			output-high;
> +			line-name = "MCASP/TRACE_MUX_S1";
> +		};
>   	};
>   };
>   
> @@ -657,3 +717,74 @@ &dphy_tx0 {
>   &dsi0 {
>   	status = "okay";
>   };
> +
> +&mux0 {
> +	idle-state = <0>;
> +};
> +
> +&mux1 {
> +	idle-state = <0>;
> +};
> +
> +&exp_som {
> +	p03-hog {
> +		/* P03 - CANUART_MUX_SEL1 */
> +		gpio-hog;
> +		gpios = <3 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "CANUART_MUX_SEL1";
> +	};
> +};
> +
> +&k3_clks {
> +	/* Confiure AUDIO_EXT_REFCLK1 pin as output */
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&audio_ext_refclk1_pins_default>;
> +};
> +
> +&main_i2c3 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&main_i2c3_pins_default>;
> +	clock-frequency = <400000>;
> +	mux-states = <&i2c_mux 1>;
> +
> +	exp3: gpio@20 {
> +		compatible = "ti,tca6408";
> +		reg = <0x20>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +	};
> +
> +	pcm3168a_1: audio-codec@44 {
> +		compatible = "ti,pcm3168a";
> +		reg = <0x44>;
> +		#sound-dai-cells = <1>;
> +		reset-gpios = <&exp3 0 GPIO_ACTIVE_LOW>;
> +		/* C_AUDIO_REFCLK1 -> MCAN2_RX (Y25) */
> +		clocks = <&audio_refclk1>;
> +		clock-names = "scki";
> +		VDD1-supply = <&vsys_3v3>;
> +		VDD2-supply = <&vsys_3v3>;
> +		VCCAD1-supply = <&vsys_5v0>;
> +		VCCAD2-supply = <&vsys_5v0>;
> +		VCCDA1-supply = <&vsys_5v0>;
> +		VCCDA2-supply = <&vsys_5v0>;
> +	};
> +};
> +
> +&mcasp4 {
> +	status = "okay";
> +	#sound-dai-cells = <0>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mcasp4_pins_default>;
> +	op-mode = <0>;          /* MCASP_IIS_MODE */
> +	tdm-slots = <2>;
> +	auxclk-fs-ratio = <256>;
> +	serial-dir = <	/* 0: INACTIVE, 1: TX, 2: RX */
> +		0 2 1 1
> +		0 0 0 0
> +		0 0 0 0
> +		0 0 0 0
> +	>;
> +};


