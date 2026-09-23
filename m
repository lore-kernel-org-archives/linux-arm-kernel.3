Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257E9C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 15:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DMAJqk7+A6na5r3s5rqYK6aECQdXuZYcCimx1AokKIM=; b=qXrZwFGl/gP3nZUPHicJqhk1pv
	9L63Njs8U0LDx3O73FoCGpC4NLtSJQz7KMe6UfaWvT9PpA3h89tiLKILzRxPTysOAGqHihoFyct5v
	18p1tD/pWXYTqwQgS9xO1XvTqEnd/LLaTsRmR4FdOOjD4PtDeG3fHlVy0VCyUVMxPF6J2WMXu3PLa
	NB5/PQ3Bbg+SmOy5bpbLy+OEIBfR+iFabiYUcoMTm8uLSpiCWcgPgSR9dWNZIcyeiG7UZV9b633Qr
	1KiUHnU28ysSSTtD4x94yHK0SRBLghs3N48+sWW3ztqNpdtmv25FzuM+g+6Hon9RR5JOYZV0JxyWJ
	R7IiH+hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Otv-00000008jrV-06dv;
	Wed, 23 Sep 2026 15:28:51 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ots-00000008jqo-1G4l
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 15:28:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G5SFU5IxKb5orhHgBg4wEeCJnrlNxJ+2kdzRN4yXAft2RFnv6qs8LylWcsutlfB6RH9oxm/O2AojxLET6+bQ730e4H5c81atCuTuEV9UoZenKubvmgiXaWyfjl3mo3+ftcvtZ3u7kZb/HFvX4IiisMslNNJdGVJKJRK+3i280j9EE7S3jk4doGeCyPuxcr//xzCPmwL4MXsEmMm+3mqEaquKOLBsS7dfYDIcbib8oacvapV8h5PNQeJ3IZOLt3wIwosPaj0yYpLDxy9U7x1wwNVHkFcMRveMmcoUjnvBsRGPF4/Lpnhmb/TtUqpL8oVuW1gJa6rTGh1CC0XcNYsfaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DMAJqk7+A6na5r3s5rqYK6aECQdXuZYcCimx1AokKIM=;
 b=rbqt0K00szlft5jL7ivDSMkkorNDCvdlKXfFoGHwKifm+QK8/XBT+MwnJWUIOlKVFbbDIEbUomvcpwS7QWD5e9yJAsKEhq0uAaNbIMjGglwxgZ21+rUjqRmmwc6th3MaQENyp0coxYou1wQqdeK5bOO8M7c0lcPnYwy4m76ooB8O3j+EzLuCoQje8isksVhbikEcBoSuNHOdytSRleCXgJ/+ENx1JQx/qI7Pm5GhJbCXdiAx3lfJKahKTkEUeEDd2pyfo/nYhTA8RbE64FY4rsuJLUKIiirPEiwbpSjmRiOzgIL60rrIsVuZf0KzoFjJw5y4N/ZFcP/ZTTDn6+KliA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DMAJqk7+A6na5r3s5rqYK6aECQdXuZYcCimx1AokKIM=;
 b=gSnONWcCq/UJxyWUh/FIfvVKhwMErcdpq0McNSjvsgwx+XiqzkOyYrqT1f26lbmnrPES0FOUpj30oiGOpGg1ys6Fl8zVUxp+jm7PgXIZ/gMP93OctHSGloFwFxeBczOCiWgcJYvq0Hp9/3YDnJNQeAKGqdqRT2HlVg4f6xG0UIO2G+ygkJYBtzws0MZVjt7+Dwd0VKGaak7+CJugL9E1WIBuSU8t84Bm1jkIUPhGFW/ru1O1Sl+OhUyhvkX+hQZNBZLahRfy5BiqiqvgNL2CrrDXLGbC4i+syeDKysJ+xNn2Ace/3mHQdJW5uVJWOO4aDFQ2owtUTZ1lzEp6Ycr3iA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by DU7PR04MB11161.eurprd04.prod.outlook.com (2603:10a6:10:5b3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 15:28:43 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 15:28:43 +0000
Message-ID: <d0d03403-6216-4869-8c12-7356eca751f9@oss.nxp.com>
Date: Wed, 23 Sep 2026 18:32:17 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v5 3/5] ASoC: fsl_asrc/fsl_easrc: move DMA params
 into pair/context struct
To: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 shawnguo@kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com,
 perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
References: <20260922033428.1690822-1-shengjiu.wang@oss.nxp.com>
 <20260922033428.1690822-4-shengjiu.wang@oss.nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260922033428.1690822-4-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::18) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|DU7PR04MB11161:EE_
X-MS-Office365-Filtering-Correlation-Id: 9275fd45-7ae6-4b48-6576-08df19875a28
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|19092799006|7416014|1800799024|921020|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: cUIAK0cnFR/xuL7kQi7M+3rGtyxTiV174WsHOANfqaaLA4mmrdOig03zmWopNjX6FFLPsrl9KwVq+31DuO/1DJcrzIm30/cnD7nYjHNp8hlMdSO+0HNJ+VD9Br/xJVOg8m8nz8BxjuLIxhaZIohxYOzimL7UEawqfG9wJkLBGp9CkzCkGpqM8wjtWLw3U9TlfHyVCQ+0FsDkdbrsj9GfYOpTNmAKuwJJagRwy8B7hMor47MI4FUc9l6lr6M8e2mGdopW7/mloZIvoiNw+g1RhdZ4IWDw0zdvHQK+vZ1YlZTxPeDnT5lfJp9ojphnTlqoXiohn7N27psx33PDbbqzYHUqzKi1SZylHF/FEos7bpipLr1UsWgGjftpaCFejXlI9dToWtYrCKPcW/IsVMxO5d29OfmVSPEcLf3nrIyQoVuDCoBEOGCJGBG7vO6eYOJw8K55UECiKHHoRWvoPpRp9Nil6VpG7NM966+nam7B+IMKRR6Mb0cZVFipjPMnHHIwuJdfyDE2X4TzoMiZtvmbm/B+WjEeSF13xh4hYH2grXi1+HkAnKhRvQptyHyWoQKZbDx/TDfg/iwDHuG66n75L6kN94J6U4J8HEVxa33bIqHNwaEnueSU3/Ta6VqMztbbrvwl+XQHcjFp1MZiQ51BbD82ZGKY90fWeyuJD+jAVpsAfCInklzGvQ/E/w5lDYeWIjD5/lTn8r9Rvr2tkdbqpQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(19092799006)(7416014)(1800799024)(921020)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUdCVE5ZK0ZmVU44RUswZW83RDVWalpXRVUzcFcxTzlNTm9oWXNpSmtkOFBq?=
 =?utf-8?B?a3lGSFdPUjljeU1VME84S2J6Rk92Q2h6eFpzSlQ2dWg1ZmNRczA3YmZxTjVx?=
 =?utf-8?B?eXd6cEdpeGtaemUwTlhTN3Q1RWk3c3YwZnp0bUMyU1R6WnRhSGtZOXBJcmIy?=
 =?utf-8?B?anp2YTB5TzQ0RVRQVytZNlYvSkNabHNGMFNBNUNkR0RFU09ZdStxMEwyQzRr?=
 =?utf-8?B?RG9LQmtxWFhpTDlydEJQUFBmQWRYakprSEVnSFRUR1BUaUJBRHRyRndNSFZP?=
 =?utf-8?B?VDA3U0NOVlpUblVnYzYxb2hoYVk2aytUVFp1czM3eGpTUHpGcE9hYTN4V2VS?=
 =?utf-8?B?YWRpSWd6c2s1Vjc4Y000OXZmeW92M3hYZmlKZHFZak9xd0pYUDVFUU5YVHJl?=
 =?utf-8?B?azNaWVJKTks0U3JUbFNTWjdpcDNPcXhXbDdyZXFNcUJ1d0lHUUx1S0V6MmZN?=
 =?utf-8?B?NUtVNXB0U3A4UnVqeXJicUpRM0RpY2p3ZC9HRW1CQWRDSFhTdndIT0RNS2Rk?=
 =?utf-8?B?WmdDUHRpL0U0OVdYRmg3NGZKWlVyNlJrUS9qWkpLaHdPWG1uVHcwUnRpTGw3?=
 =?utf-8?B?bmlnRVFNZVJNTjdwbHA0SEdXWXpPdWZxaG1sd0UzdUgzaWpXNlBUa1VoSlc1?=
 =?utf-8?B?NjlnY0t5ZXBPSEFSc29BUW9RSStDajFjOHo2ZFl6OUoyaG9xZDk0V29JbGQ2?=
 =?utf-8?B?c3Bxc1oyS2QzcWE5blVNQVpGa1ZVVGRDMVgrTjlpYzcxNjl4K0lCUmN3ajM1?=
 =?utf-8?B?N0NIVXJ2bVViL0dFNzQzQUpIZEN1Z2I4eXRoK01jOWdGZDZ5dU5QQUFQWWFN?=
 =?utf-8?B?RTNxS1dGOWhleFJSNEVKMzZYa0NwclYxYTg5cnN0N2g5bGRqNUlFcG13SEY2?=
 =?utf-8?B?Tm9PUGlZcU4rVFgzalIwMDhEc3BEOEtXN1ptRDhwMlJ6N2hnRUtQN2pxY1A0?=
 =?utf-8?B?VEZ3K2lxQ095YTduMHMvd3BEUVNscmdZVmM0b1hxUXJOcG4xM1N5b3ZjU2o1?=
 =?utf-8?B?NjNwUVRuZ2NVb2tnbGNyaGJlOXJ4a3VRK0pFS0N4dlN2VlAzc3JZQW1mWnpp?=
 =?utf-8?B?V3RuQ2xUcmM2Wnk3emJ0YllzL2V1eS82SkZ5ODRReVhyUG5CZDg0dnhXeWtj?=
 =?utf-8?B?aHUrdDNGOTJzamZKdVFqNEZlSVlzT01oVjJyb1llSW5WMmpMOUoweEF1YzZt?=
 =?utf-8?B?UHJrMmlMODFjdC9mOXd0eGNmMEpXdXFDZHMxTnFVL3J0ZkRDRVluYnUrM3p3?=
 =?utf-8?B?OXdGQXdFVWVIVjBiTENQaGlnL1BtVzF1RUNBK0o5aE5vdVpxeFVyR2hidzZO?=
 =?utf-8?B?L3V2RHZpc2ZpL29MNmJBVmxaVEJjazNKdzVqeWlkVWxjS2hDaE1QQnprQ3hr?=
 =?utf-8?B?WjVvbmV2blc0WndVRkQvRnhkY3R2MjBmUzZ2anhpK1llY3pLQTRJdlYyYkM0?=
 =?utf-8?B?bnBlRFFveWNTREp1NjY0SFI1dWVnZUhkdmNJaHV4RWdENmd1cFcrM2RBY0Q4?=
 =?utf-8?B?SHlxNXVjUEZzNzZ4clE5WHpwSythbitieTFGRjlJZExDV3QwT1hzV2xwazNU?=
 =?utf-8?B?Y3gvaVJmZ0p0Q1J3RC90YmVsdllsTmluVVFQYTl2QVQ4NTg1c04xall6c3d4?=
 =?utf-8?B?SXM3NWlielRkckgyNEtNcVc5d3dyc3BscjU4b3hTUm05cC96ZUlkQ3dKb1o3?=
 =?utf-8?B?SHFUTUk0WTE4akd3eTk4d3o2VU55Y3NRR0RGeUUreUV5bC9wOUFGVHp0c1NL?=
 =?utf-8?B?NVZZYTVqTWZudkdhVEt5b1E3V0ZwaE5NOCt1Z2haTzZiaFVxNnBiaXlOVU5P?=
 =?utf-8?B?WW5oS2NzK3U3WWJQb0pDRXVlTWlZR2RKMnZkejh6b3lqdk9yUFpvaE4yUzFk?=
 =?utf-8?B?SHdCemRBS1NPMEE3VHRyVGRaZFJOZXV4eHpQMko1MUxQbEViWTVxTHg3RmJX?=
 =?utf-8?B?STZHYkh4Qm9HN0JRdWhqQzAvQWYzdGhpS1ZIZk5xYXBzcmE0THgrS3E3cmNE?=
 =?utf-8?B?dWNZdmZMWk1DYVBzN1p4U2lpbGdQTXkyNGFXN2xsSElKb3hVUmJzMXZsN1Nl?=
 =?utf-8?B?MVlMZFIzVUg2LzFta3N1aTc1YjVYOCs5em5BNElCUkRRU2RpamZ5RUdWR0g0?=
 =?utf-8?B?SE1FSnovY1JBcjR1UEVJVmNRd2tJNTQva0lkZ0E0Sy9QbFQyM1dhOTJlWStP?=
 =?utf-8?B?M1RnWHo4TzJ1YTY2YVNES3B0V0tvNXllcDRTSjBCM2ZPNXE2NThRczVaT2sv?=
 =?utf-8?B?cFh4WGNuYlhpbXJ1WmZtSEJQbksvTGx4Zy8yK3paR0Zsb3lkUlBjUWdnL0dI?=
 =?utf-8?B?VWRYT3pBbmpjdHg4elpNTHAzRUk1WTRkMFNzNmJxd1dHeE9sVWluQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9275fd45-7ae6-4b48-6576-08df19875a28
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 15:28:43.5153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yakx1Kv6td4S9NdwW0qI6Di/cgMSwFIO1eUOmVavu/+A5sTggGl6D6h66Q1HjFqbfzInhJ0cXK0nYhFYWJH/qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_082848_435200_7A0D1753 
X-CRM114-Status: UNSURE (   7.07  )
X-CRM114-Notice: Please train this message.
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

On 9/22/26 06:34, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> The shared dma_params_tx/rx fields in struct fsl_asrc were a single
> instance written by every concurrent fsl_asrc_dma_hw_params() call.
> With multiple DAIs registered (one per pair/context), parallel stream
> open+hw_params races would corrupt addr and maxburst for all active
> streams.
> 
> Fix by moving dma_params into struct fsl_asrc_pair so each pair owns
> its own copy. Initialise them in fsl_asrc_dma_startup() where
> the pair is allocated, which makes the per-DAI probe callbacks in
> fsl_asrc.c and fsl_easrc.c redundant; remove those as well.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>



