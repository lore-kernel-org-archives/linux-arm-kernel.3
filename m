Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99AE4FEFB4E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 13:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FDL3Xll34IaRtQkm/l2bA9I7lsn9lChZiouT+lFWH14=; b=Oo6NkL9LNXaOQjRSBjiLl8z2sN
	hHdVUWJNjZJEBC3AKtsApcA8DcW8cwF1lyHDmk050lXNXoc+6bGdbOtBqQQMmC0W8GyiA7tX6tLeR
	kxLkMKsRCWx2OfquGezPdv2ulCOwv5ThnEAwaloQ1I3FcU5RkRSfM6qVDtGLQt8Zzk+jm/GT0RA4U
	1i+hjrnhzMYEJx1ubMhMMAnF6CiT+zNMOA+vXbYPmTJrx+GV3H6jjAiAxrF1IAsoqA8NPDgygWBf4
	KnCphKwGRJuOiEl1eJqPHkTguINInLC8PiaG6yOiBjkKfyT6+fSYcVPmKMTm7DelG00hAX/sfK6Hp
	CvlrpAqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvxya-00000008NZa-1hik;
	Fri, 27 Feb 2026 13:33:52 +0000
Received: from mail-westeuropeazon11023102.outbound.protection.outlook.com ([52.101.72.102] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvxyX-00000008NZ7-307X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 13:33:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nmj1oRLTYSkSioun65At5N5UjPLvz3D3vHnDj8Pafx7Kn10R47WfcIDxalA591LKTbG+FAVckIlVnjI3DAcl3iFXqMPd1lc5v0Vu2VNS4NzfpYT6E0I+cNvwihpH9pPpA/IgvO7Ou93h7S1bSJtT8BM4vfQYTmvKKMHHVU4L88+MDwM6Pg5YE0aXNbzV9aPQHtGi8t0bac1bsC1hBo5H1nrxP0a8dj9X30EEazFz3WUCji7lDZPiwJa7KcaQ96Z4oC8Pf/QBFhU7owHA9JzrEmIUj0sOO72ZITm8KZJPLT8E2DJ7dw5b9uVGdf/a2xM4S0bBydQK9ANkNC3BNTlkcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FDL3Xll34IaRtQkm/l2bA9I7lsn9lChZiouT+lFWH14=;
 b=KKemMl6rog40LAUU0sQS6CMsw56X05v1xR9qs5mcLYp05EAr0ylPaboW1v/tDMWRne338m0QPAlPspfawZ+lEYj1ausuIFp2IwNNtFeF8OiJdmuL3ExtiAbsFl+j20RcE/xBkld9IhH0lWwpCMYwaCEnBr/UiF0vuNZVe9dkuF9Gm1IPu6/lnKgWHDxpVqW3tF6cTnfpWuuBo9Ps37o7CAtGYDKU8l+sD+wF1r47qU82wbBPqouSCUM6omYJJaoRyNw46KBoN+WWpg0f//CR1qTEKSTWQ38PP9VDCOFdVqjTjQiRRT3NaSmgYiSb907F4ldLecJZJ++NR/naZYZljA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDL3Xll34IaRtQkm/l2bA9I7lsn9lChZiouT+lFWH14=;
 b=2dKehdVJKqoifzx9oYWxpGCJ4tIfHTV5GXuZO+lX9CboH3iqitYuN5Tpm+jYBVNNBiVKdv+xi44rdxGD4voA+/CQP5UrFpNwQI9MSGDQJFQRIWgy0oQMMxj/qi6/OBAjCykpJtZ8WgDu2oBpQ8mpWM1RJqqzpkIvPwjTP6kY9PYTFtHaIU7kufPSFlmNALHLvSR6zUkYHUNw0J9T09SEesDLcSNbQCt0rUjHIDoHebR+P6FDYdd8ayB+N1pzrTa576Ku6yDIh79NW/Vopnw5aAoW2KP+TredADZFzh1upt0Lhmy9apLb6nKqTBgmhTCX4hPmystTIMWgzI4/ftcYQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
Received: from AMBPR04MB11741.eurprd04.prod.outlook.com (2603:10a6:20b:6f3::7)
 by DU4PR04MB10719.eurprd04.prod.outlook.com (2603:10a6:10:580::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Fri, 27 Feb
 2026 13:33:45 +0000
Received: from AMBPR04MB11741.eurprd04.prod.outlook.com
 ([fe80::ee70:7a62:e9f:12b7]) by AMBPR04MB11741.eurprd04.prod.outlook.com
 ([fe80::ee70:7a62:e9f:12b7%7]) with mapi id 15.20.9632.017; Fri, 27 Feb 2026
 13:33:45 +0000
Message-ID: <9f2b7b20-fa00-4bcf-b7e0-5f2365d780bc@gocontroll.com>
Date: Fri, 27 Feb 2026 14:33:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] arm64: dts: imx8mp-frdm: Use symbolic macros for
 IOMUXC_SW_PAD_CTL_PAD
To: Daniel Baluta <daniel.baluta@nxp.com>, Frank.Li@nxp.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260227130242.1702329-1-daniel.baluta@nxp.com>
 <20260227130242.1702329-3-daniel.baluta@nxp.com>
Content-Language: en-US
From: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <20260227130242.1702329-3-daniel.baluta@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0059.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::39) To AMBPR04MB11741.eurprd04.prod.outlook.com
 (2603:10a6:20b:6f3::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR04MB11741:EE_|DU4PR04MB10719:EE_
X-MS-Office365-Filtering-Correlation-Id: a17d99eb-4574-4286-272e-08de7604d461
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: yqUm3mKgV4q2x2xi6YwEU+a2WkDN3fBEJdqm7yvxtEHd9qoDJi9VzcEWFnTG+/Sd+N1EUhTBNbM/BuZRMDUmRQcxlKmcWUq5XgHnEOt0OGUH7rxYCKNqL9sWAE/C0Dtq/iC1LKnLXYsNvmoRd3Hyhz5ThMpKyVrgmYDCVziT7TI8cMTjLikpOB4lsb0L9oa8uTdwu6TZ9eu7lqQYBWpoDXUdQ4GHkNeMLMEAeunnOhgwxEutLl9z+Qbq2xb3sj0HezapJczeqiSwtt4wyFBb5HC2PcWZuzOwW1suUpKPawOuvn0ub0KkKoAAlKIqL9rdlk6iwA9QOPLQ1MucSMg1+09oNDUaE23Nf8GUFr9A6btKA8Bjp5wNE4HO3eINWXrnANRR9HArA4681Z0G2wigul2mYTQnhKFkpQDGDxlqkrCMs9UPoxGuhYQLg/lZgBTncWoqOEUsI7ecb/A/XSfD5EN1IWuIoe+9RCwRPrXEUcszMIeNw2h/fjKP9IbHmBMkCSMXHRlNyn+YXjmNaP79QUpnYxvg80bToKxQEaCumXr5xxDkobB8PnkVOTrxcFP5XyOQwpHasrzhKy0onCHPp6p4Oh/30t6qVejtYQ2XC0bjT+wT+UQukGcaqt73E+odA077zhWrkHFtpUPIEqFQTaYcS2J025xf2H/seYLDPMg+N12FyJBgTXii/3S8Hoxf2nH2pVXZEHz1K6nW7kGceOyAOX7WZc1jpFU88GIvYYM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB11741.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVladlVPNmNqWU9GczVaSWg2OTNZL1lvSTl3eThxRUI3SlFUbko1Y0NzWEt2?=
 =?utf-8?B?ZHlrbjlVa0pwNUxqVWFSYW44VmpCZmhmUGFIRjd0QWl0aTF1L053Yy9nUDBr?=
 =?utf-8?B?MFlGQkNDeVBnait6czJMOEVncTdYOWtzUUpNUW1KMVdNUUVGQVZIbVA4cnVS?=
 =?utf-8?B?Vk9LOGNpVlpoSUk3NG9HZ3ZDVEcxdUNndTBrTlB0R1VhMTIzOEZuMkREaEF0?=
 =?utf-8?B?aEJaakc0RGY1cEszMEgxdjVFekhVQTJreTA0enFKL3BQV1J4bUY5c0lHcmE1?=
 =?utf-8?B?OXUrMnd0UjlZV1cwb1M5ZjdRUW13bEtMK01hdlYxaWwvZzlaZ2Y4VDBFd0E0?=
 =?utf-8?B?UDd0akV0SmUzSGxvajRZZzMvWGZtZjFPSk5sRlkxN3R1Y1prUngwRlRKNDN3?=
 =?utf-8?B?WENOM3dqQnY0L1JLU1N1ZHl1TS9KdE5XOW9DTzdkWk95Q3dtNlhhell5N21X?=
 =?utf-8?B?NWQ4YmpmQThyUmMzc0lJQmhXSEZzY3RwOHNNbHdya1BydmpuNzMzcHRNMTY0?=
 =?utf-8?B?SU85cVY1TlhrMnpWbXRlVkVlclNmZlNRbFBZc0FTQVA2UDB4VWJkVlVCdG5v?=
 =?utf-8?B?ekU3cnd1UUdQRm5oWFpTK085UlVnc2pNQk9hNUxIUk94TVhoYTl6cUV6djVZ?=
 =?utf-8?B?VjJCYW4zcVhHT3FlZVo2WEFCeUk0NjBBRDVZb3Y3bHd3Ly9LZ3A1dlFTakhr?=
 =?utf-8?B?a1NscDRiNEIxaVg0T29qdi9NL2Q5L0hLMFZtcTRNT3kyem9GdHlkTEV2MHkv?=
 =?utf-8?B?dzlXWlppWUNoQ1M0VXMrOWdoUjFPYlV4Tmg5MGFQVEFrVkdzT2FjN2dJbXRo?=
 =?utf-8?B?aUU0K29QS1dQS2JwY3hoM3NObTZoYlJJNHRuM3VtUVZ3YXhrRWhtWE5mUFRX?=
 =?utf-8?B?dm5zWld5M0Jvc2FvNXowZlNTRC9LZWcwYXk2WFl5T3d1bTRzV2FmdGNSakpq?=
 =?utf-8?B?K2kwNlBUMlo0Z2VTQVk1RFZFNVJRNGs2Tld4TFV4YWVNZTZWTkhHbnhRMENX?=
 =?utf-8?B?Z2Eydjk5UG4zeVBPR3dkOTJISTBVaEg5aURZM3lVV2hRZzlER1A4UnlWZ0ZQ?=
 =?utf-8?B?MGY2VjVsYU9jTEhSWnJsSjcvQ0tFUjF6U2JpdHhWZUdneTZwdHJkWklIN3FS?=
 =?utf-8?B?Mkt3ODdxcTF1dkpqRUlLekdZcWsvcWgxQzNXNkRpWGxnUUVNZ2paN21Jdm50?=
 =?utf-8?B?ZWs1eUpnZUlCdmNjcE1nRHl1Z1lVM2pvQUd5MitycDNUVkpXdjFYTmxvM1Fx?=
 =?utf-8?B?SmY3WUZ3cktRQ3JBR29rRXkxWVZUemtncWZIRjg4bVhSUGNRMGpJbTkvOUZX?=
 =?utf-8?B?WURKa0VNMWdyN1Y4VFJ4S3pOMEUyREFzUkR4SWVXbzlhck5GcVBoOHpZWlNR?=
 =?utf-8?B?cHFNU0N0VHdCeFU1b2FqQ1dvK2hENlhzUjNjRWlNT0ZLY1JaL1RyVUpnM1hm?=
 =?utf-8?B?UWl6LzRWMStpSERwdHhDZUM3blJmVk5EVnc3YXV6VnN4ak1BdTZ2OTByeUs0?=
 =?utf-8?B?UTlCNXc0Z2Fkb2psL0lIM0VkNndHa05HUkNtUVpvQVZiZ0R6aXJ3Z3ZST0Fa?=
 =?utf-8?B?azRSV3RTNkY1V3NGZ2JCaW1vYkRPRG93bWpPSjJoMFBxWUJlSnk0R2hMaVo5?=
 =?utf-8?B?TmlVZVdpYzZ3aHZZRGplTFJHS0hyN2xxUWFCWHNoWmxXZjBtejltTENOUlJQ?=
 =?utf-8?B?MTNiN0dHQVlNNTg1YXI5SGcvTENkd2x4NExqOEM5cUxNcVRHaGlhaWRzZGdv?=
 =?utf-8?B?d3dDUmJCQlFtUHFraisxekkrRitDcU41SDR3Wm9LZUdab0llNkZBTGhhblJE?=
 =?utf-8?B?SDQzY09BV3ZXZzVJSUFsNjNqaWRJWFlHc1oxYnFBRG5STHVNV2RRN2FGcWR1?=
 =?utf-8?B?S0NrV3kyekpnUVVJVzBrLzc4WEhSV3R3TmZzWjRJOTBYS3JQcmZRd0JlMjln?=
 =?utf-8?B?dCtYV1ZIU2wzeWIvcmo4Tjdwd0FzZjM3UEl5b1BPZlZsQktMVWEwMzVlSVpj?=
 =?utf-8?B?K093eEZndnRRakVmdkxLaXh1SWlacDBBZXpTVVNRVzRmQzNlcnpwUnVnM3N2?=
 =?utf-8?B?MG5kTXRvNkMySUN5NmQ2ekVYOWdMazVyY2N3THE1UDFidlB4bzFTVFdpSVZM?=
 =?utf-8?B?V0dRL3Rvano3amxCYjZYSXZocTFTSWNVSTVXUE9LUnBVSnUzUHFEdVgrWnZP?=
 =?utf-8?B?a3M0NWZoZXZCWGFGYWt4WWdNcHVxTDlBNkZqcGJOQU5ZdE5MMzFxNUk2SUc1?=
 =?utf-8?B?ajFmTng2TVU2ckVZTnJjS1VxcHR4VG1oeVUreTBIOTlYWXdDaUNBY21ocUZu?=
 =?utf-8?B?d0lGQllyb2xEWG1EbS9LeDFJNVorZDA1TjA3RlZ5dVB5aGpLR2NqeS83bXdu?=
 =?utf-8?Q?U+OfAp/Rq+RdDQc53ssBxu4q7CUCbDhZB2wAI+LejtQrx?=
X-MS-Exchange-AntiSpam-MessageData-1: d2SapXTNuc51MEtTst5nMTcR2OesMEo6AhA=
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a17d99eb-4574-4286-272e-08de7604d461
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB11741.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 13:33:44.9183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J09Nu2lkhISxMBy0Kwq+Z8Hu8kkf6bIvpTrxopfdr7Ug2taYs4Xg/k0gx/s5dr2YqPRIx0Sh6tSnbAFmPz5InoPNcCr+OvNASzpwuuRJC8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10719
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_053349_781030_FEDB3093 
X-CRM114-Status: GOOD (  14.37  )
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

Hi Daniel,

On 2/27/26 14:02, Daniel Baluta wrote:
> Currently, in order to configure IOMUXC_SW_PAD_CTL_PAD a magic raw value
> is written in this register. This makes code not obvious to read and
> modify.
> 
> So, to help with code readability instead of the magic values use
> symbolic macros.
> 
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>   arch/arm64/boot/dts/freescale/imx8mp-frdm.dts | 132 +++++++++++-------
>   .../arm64/boot/dts/freescale/imx8mp-pinfunc.h |   2 +
>   2 files changed, 86 insertions(+), 48 deletions(-)

[snip]

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h b/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
> index 26e7a9428c4c7..c963913e3c626 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
> @@ -38,6 +38,8 @@
>   				  MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
>   #define MX8MP_I2C_DEFAULT (MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | \
>   			   MX8MP_PULL_ENABLE | MX8MP_SION)
> +#define MX8MP_NAND_DATA_DEFAULT (MX8MP_FSEL_FAST | MX8MP_PULL_UP | \
> +				 MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)

Isn't this the same as the USDHC default that is above the i2c one?

Kind regards,
Maud

