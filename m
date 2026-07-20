Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 068CAC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 05:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g8x/x6wj1EIFH9JMaE6eiwXWpPDi9GJ0kCiBgWEdhTM=; b=BGpqlEWoWLoa9p2DJaDtXYdJcO
	YJ2zU2C1xiP92VKt31FKiFn8eUz1vMnbF1inz62X+m0hf/MlnHwVo7sQhTLmvObVvAxqKtMqaBPHN
	ikVP8B7YhQ2S64lCWcrxsm181+M98wn9OXX/TnC3Mxfp1t1lbxKkFPmutCXazi5Y1dMFa4Risojw4
	W3ma9jRMLXvo5CwM0YVBthFaj2UofxbPp5MSR4GEZLJBD3i7fTJX/wZxBkAC0AD0GpPPeq3MFEVig
	homA1tymc9geHQbGj00VnNr3aMnqUnpDV0PozbUAZ79lYUBSALUmkzk/eZg+fGWu3MJqf0f5IOw2a
	KQTK+f3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlgve-00000005u0C-2d9I;
	Mon, 20 Jul 2026 05:52:38 +0000
Received: from mail-southcentralusazon11012024.outbound.protection.outlook.com ([40.93.195.24] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlgvb-00000005tz2-0l0g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 05:52:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RAMyGmT1NT9JyNQ2bt22SRk6VOguFzhMe8YKwqt3eotOXfm+U8A8SonMVpUBtkKIuPm0uanZG2IZr2BIhZAmbVqBLe27gb1gP7gzf/QaxbBRF8YPGNllTxovFSyEYCz26wiKpbNRk+xUE8BCxawtdmFt68Ak5N5Y184Ebv6el2XNA/wTN+54Wt44arX47fxVO1G0tAWfWro7aXlSxZwXbdK7LCRrTdh7/2UYiD7VjlOJAuIdlyPfvcJd8A4oOKATVlchUSgGMkNOmVrhq2UcaNiDxx2VxkR4mOAWN0L/tPPbLDUqnJ69UmQfkUFQsoyxd+rPLLaftq8Buv7vtfpDRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g8x/x6wj1EIFH9JMaE6eiwXWpPDi9GJ0kCiBgWEdhTM=;
 b=SrD1Otp8w/tKWnN+yayhV+go2XumtnM/6ibwbUj/2F+vW5VAz/wDgF6bEn18rPZLj4ooFswuoT2P4RktWS4ssyrZ4D7pHV+UjY+hFI/rIrR/Hqm+ApN5zh4yA3exvkiW7GbQErJRGVDjeQP8exrF21fgdDCTJOPe+BbMJgaTUKxOEOmOtPI/oEKBGQOKrMM5LwgVcvCQdN7oXrcMaQyt65hzyGyKLzjNsiCnBx79hdPi4hqnGKnwstERR4pWz15Kwqo+CLU6ZP8uOijoQy2y43QPmXrUKelP2zaLLT5aB9n5ZltlKxSCDWz/WElOgwtbj2nKxsQWg2AFjz8RDGqhKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8x/x6wj1EIFH9JMaE6eiwXWpPDi9GJ0kCiBgWEdhTM=;
 b=f00FGQA0wwil9SLxilYTdp0PtFwd700MHPAKw0NvlV8pU9K2KweWQ4JXGCp/ONOdzBLwe70BkGyZDO4yZ5ZY0ORRdEoKRR1J0W4gNex0WDvvSmbHwa9IQa31VGIhZeNEeTjh6v1i+olXwLCPpAw7n2umJ+i8DWe1nD3y5mCce9A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8847.namprd12.prod.outlook.com (2603:10b6:a03:546::19)
 by SA0PR12MB7463.namprd12.prod.outlook.com (2603:10b6:806:24b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.15; Mon, 20 Jul
 2026 05:52:28 +0000
Received: from SJ2PR12MB8847.namprd12.prod.outlook.com
 ([fe80::a5b3:669b:dfa5:14ca]) by SJ2PR12MB8847.namprd12.prod.outlook.com
 ([fe80::a5b3:669b:dfa5:14ca%3]) with mapi id 15.21.0223.011; Mon, 20 Jul 2026
 05:52:28 +0000
Message-ID: <9e8d97b3-8c21-497b-9d02-39a21834493e@amd.com>
Date: Mon, 20 Jul 2026 11:22:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] MAINTAINERS: Replace maintainer for Xilinx CAN driver
To: Harini T <harini.t@amd.com>, mkl@pengutronix.de, mailhol@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 michal.simek@amd.com
Cc: linux-can@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260717021415.2234865-1-harini.t@amd.com>
 <20260717021415.2234865-2-harini.t@amd.com>
Content-Language: en-US
From: "Rao, Appana Durga Kedareswara" <appana.durga.kedareswara.rao@amd.com>
In-Reply-To: <20260717021415.2234865-2-harini.t@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0047.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:279::9) To SJ2PR12MB8847.namprd12.prod.outlook.com
 (2603:10b6:a03:546::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8847:EE_|SA0PR12MB7463:EE_
X-MS-Office365-Filtering-Correlation-Id: c2238144-665d-4bc9-176f-08dee62314b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|18002099003|22082099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: /yeJvRb3eGjZ5vxHp5n8oErG22iHCrh9r+M0QFzjT0H7Vie5R8Y04D2LvAjPXKuDfaFJF3bJ+UudOq4b/wBDYbOvzWZPFtqKpJ1BwRFpNz1iGMuA0VjsFoiimsp1S6O+9xBoSsX5AadOvvTKXenyY4NgLTwv7gR0T5xZIFM5L+lbK5oHOt1z9h4LWup4sUwrLIrZyqnXVxTHTy2ZSEW74auzOodlU+BBUlhXgyMK3T8BEDK3jWVEnPxPft6Estc/4yQkTMNmlMiBI2pui8O/PTfpZ+6FfQ0vhwGaSPtG4gi8Ow5jhcpgZYfiaA2DHNHCCko/0x8AGHgqfKjtifnpoQ/Y0y/VLqvOqeABnNaGev80NTorO6vaRzvg2YDrPqB3ypyx8YkjUx/mwNPJjMgoctFxwSvBX0/k3upUJ4HC9IqIA3ypC3+Htx9MdDZ2Fsfoqbssj7/1u0x6xCktzcxXw3l3EEdBMNCFyLGBxxMPoab8DIUNW/xlAoDOfoD6S1blYQhcTfFZjC8mh8kYNYXGH+bdKp6PlD2e/ibmW4kkS2exksAjcnggJ3YvfopIhCm+6WqPaXUoTohI8AKcYsbU9N7AwAPbLDN0SXfFKV17NNtqo12cM+MSdTPkeH/yftASYW7X9EfI49jyb4l4PXK80HRl6UBYZSSFUS1Hma0lMzs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8847.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3RieEVGTUxROXNXRlhMN0Jrc013akVOZENXUnowNkcwRFNzOHYrczZZVE1U?=
 =?utf-8?B?czlabTVwWGpGMWpOMElmL2RPL3UxU3hXb0hYMXoxQmttSWhqd2dFVUVlVGx0?=
 =?utf-8?B?TlhJaUtpRWhMWGNWK2krc0ZaYlhTTkRwZFdDMTRGSG11TkNnbUl6TTNzVURy?=
 =?utf-8?B?dndGWllEOFpqbk9vdmJqMUJnUHR4bmRBNERQMEJEM3pWTkVEUjlMK1lnZjJj?=
 =?utf-8?B?Nm5aTCsyU3I5RzdzQklTSlA2MjM4UXdOSmFmTjliSEdOUGJxTEM5cnpKZVB5?=
 =?utf-8?B?ZU4zRjloMkhNSWgvSVl3K0UzNjFDZW5xeXVkQndFVXVCbXhLc0wvNnlsdStL?=
 =?utf-8?B?WWI3VnVRdFZKNHp6UjY5VkQyV2swdFBPSDVxak1iU1I3QzdoNDN4TWdoY0Mz?=
 =?utf-8?B?TnNFRVNoNkFidkFwcVRnYTgzbGQrN3lhWWt0ZFhVcUxLQS9Jc3JCQXgweC8x?=
 =?utf-8?B?S1JhM1pwalRIYWdUTys1T1dFOG1rakdrTlhLK2txay9HVEtXUVRiQXUwOVFJ?=
 =?utf-8?B?YnRlQzdITmZaTWlpM3RvNnN1OFZtazVBQ0NMYnduVVR5UnlsNmo0ZllVNXNG?=
 =?utf-8?B?OUFqYVlHeGc3MzVZRWpMdVdjQkl4VXN5dnBGUUJ0bXNFcUU0c2d0WmtMU3Z1?=
 =?utf-8?B?RjVsSExoYnpGa1NwRWpMR1dFNXA4cVhjQTNFaTErWlNmTHlzTEVncll3Qnll?=
 =?utf-8?B?K2pYMy9aQmZsM2hJaks4M1ZuQi9HNWFzc25vRUlYaWJXYzJkM1pUOWw1RzBK?=
 =?utf-8?B?ZHU2YldnS3dsWkNab2RNcGtzdjhGeDl2ZzQrVUJrRzV3TkVKZUEvc1lucTVZ?=
 =?utf-8?B?M0Z6KzVtMUw1N09kM1FYcjJycGhuRDBTaTREckFYbS9uYlJzWjErcTlnbTBO?=
 =?utf-8?B?ZzB5QTNvVmNFTW9zd2tCRE0wTkRtOWNiMm1VUWtKeEJaSXZaejdPV2x4YTBz?=
 =?utf-8?B?enRuWnZIckNpVVRLcW8xbDlNNFNscXIyWXhjSXVJRWsyQlVKZENmaGQwZnN4?=
 =?utf-8?B?YWtvSSt1MlVsVFFFS05oWmJIUUhUMnlXZm8vcG5zeGR3bzd0aUhTbEZOcjhS?=
 =?utf-8?B?VkJmaHFMRkZUL1hGV3grZTdSSUVLR2o0b2dQTFhnWDVEZGw3UWtmS3BZcmNn?=
 =?utf-8?B?K09qN1hSby9DU0NpZmdGRC9pVXJCbDlLRUk5UmZSV3lvSTBSSHZRTStZMjNO?=
 =?utf-8?B?Rmh2QS9HeHZFeTJPSHcwVTJNSjR0YUxCelh4QWh4WlZwUkR6SmRtVlJVVGFT?=
 =?utf-8?B?ZWRVUnBmMFlvZis1am95Y29vb1VWYmZBMEtGTDlhcnlyMDN1ZTJEYkd5MEdW?=
 =?utf-8?B?RnVRRjFxTlRhekFQTXlCN0hmQmdadVVGWHN5eHVUTC9HNUhvOURQUVc3cVRm?=
 =?utf-8?B?YmJEWnFtaU9xWGh0NXR5NG0wUUpQMlpYR2FFVmVlbEpSZjR0Ty85c1Z5dXpI?=
 =?utf-8?B?UnBEc09yelZrOWEvcjA5M2x5ZW90NnJlV0VmY0Y1blIrRmNQb3l1YlQ2NHU2?=
 =?utf-8?B?THp3U3plNXVCdEh0bFZLSHJMZk8vR1V4aEw3TndrSEdGTnZWZmV0Mk81cDNH?=
 =?utf-8?B?NEloak5SbmFEOXpaQmVFL0lhcTZSR05IazFkYXI2MCtlaWN1VzdQdlBXbW1w?=
 =?utf-8?B?ZjdzWWJPZm80ejZQaXRWaUU1R21xeDh5c0hlZzVmRVVRdFNGY0dmWG9pcnhN?=
 =?utf-8?B?dllRUXQ4dEVwRDNBR3ZPbGhVcG9vbC90RWVKeS9lY1YzRkJtUFh1aGtJRGN2?=
 =?utf-8?B?Q2RVTm94dGh4UkdOdHdmdHlIN210eHplZlBOL0lFbi94TmVzUzJ5d2lDQlhS?=
 =?utf-8?B?MUp1QWVOWVhsUUlqUktLSGRKbDRHZmhsNzF5V2VncTIwTVNZb1dOWTI2NEhL?=
 =?utf-8?B?dzBsdkt1MXFLRWJDSDZ1VExrcXdKaU5UcFZHTFRCS0VKN3B5K24rRW9VRVg2?=
 =?utf-8?B?Z005MkxKL3NUaTBPVTdTUFB2V0hNejh2YnhrSFlVbHZaTlQrOHVYUnk2cWFG?=
 =?utf-8?B?NGJvVFVrc2RJbmtyd2FwTWszNk9DYTNzVms3TDg5YmkwdWM2ZkZNblQ5d2dP?=
 =?utf-8?B?UTA0VitGSzNKWjRGSUN4YXlyZlFGQkowRm9Cb0JlY2s1aTRIZzJlazA5dzZ0?=
 =?utf-8?B?aS9RS2VRZzZ1V3dFSDQ5S1dUWkVBbUlpNGxvdXp4cEFZWDhGM1VJaGFRdjRI?=
 =?utf-8?B?emJndlJFMUhySTYzeDdUYlltd2lGYVFvcEYzNkpXQ3hoU1ZWTUxCY0RUSU9W?=
 =?utf-8?B?VWZ5NmRPU0dqWTFrZ25xa3RGRjRESHl5WmxGVWJlU244bEE1Q2hpRkY0MlFk?=
 =?utf-8?Q?Kjlqb02DAr17jzJo1V?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2238144-665d-4bc9-176f-08dee62314b3
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8847.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 05:52:28.2380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s59gTCm9TLPJvsTx9lgsXOJSmZ/OngJ7McAgXtCsu19SN9jntIk62YKiP+euWSiH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7463
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_225235_230085_A21FDE9E 
X-CRM114-Status: GOOD (  14.29  )
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



On 7/17/2026 7:44 AM, Harini T wrote:
> Replace Appana Durga Kedareswara rao with Harini T as the maintainer
> of the Xilinx CAN driver. Kedar is no longer maintaining it.
> 
> Signed-off-by: Harini T <harini.t@amd.com>
> ---
>   Documentation/devicetree/bindings/net/can/xilinx,can.yaml | 2 +-
>   MAINTAINERS                                               | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/can/xilinx,can.yaml b/Documentation/devicetree/bindings/net/can/xilinx,can.yaml
> index 40835497050a..e705c719f7b5 100644
> --- a/Documentation/devicetree/bindings/net/can/xilinx,can.yaml
> +++ b/Documentation/devicetree/bindings/net/can/xilinx,can.yaml
> @@ -8,7 +8,7 @@ title:
>     Xilinx CAN and CANFD controller
>   
>   maintainers:
> -  - Appana Durga Kedareswara rao <appana.durga.rao@xilinx.com>
> +  - Harini T <harini.t@amd.com>
>   
>   properties:
>     compatible:
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7a2ffd9d37d5..db619dcaddbf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -28874,7 +28874,7 @@ F:	Documentation/devicetree/bindings/net/xlnx,axi-ethernet.yaml
>   F:	drivers/net/ethernet/xilinx/xilinx_axienet*
>   
>   XILINX CAN DRIVER
> -M:	Appana Durga Kedareswara rao <appana.durga.rao@xilinx.com>
> +M:	Harini T <harini.t@amd.com>
>   L:	linux-can@vger.kernel.org
>   S:	Maintained
>   F:	Documentation/devicetree/bindings/net/can/xilinx,can.yaml

Acked-by: Appana Durga Kedareswara rao 
<appana.durga.kedareswara.rao@amd.com>

Regards,
Kedar


