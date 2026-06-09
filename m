Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD82CD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 14:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JUgcItbSZgrpSuGAP45UZT1sZ+FhH4ARn4FVN8peCOk=; b=bjedjJrJRTiwi6sa8qeZbl9aM7
	2KnuurXg2cm+NKsjz2C0EGCZhQQEFTaLYdMI1tkUIZRUttcNNfNS5q+WzmEi9qSzwhh5/DjfCqR6f
	BrHRJtA4bCdVUOHzWD8nFvmEI1Ut23WMM+oLkFeWn5YmeoCmOs3HhLVhakgvsOnNf6b1ebntoLTdY
	rvGI4bIeOPLvAcOxhUo8GfgxVvoQGWDfky/ud71jEZvUok1umcbMmlptOlUKQvCXOC4S7+zY8fk0t
	//EutN94rLrtT+ua3u3n+TAdOXnQ6mT0CEV0DRzO/lA1EHqnjiyega+VbYQoqP7l+kZKCxdg1tDl1
	BmmjnP3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxor-00000005pTF-1SpG;
	Tue, 09 Jun 2026 14:52:45 +0000
Received: from mail-francecentralazon11013055.outbound.protection.outlook.com ([40.107.162.55] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxon-00000005pSq-221r
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 14:52:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RMu1MtM1N7dOQZwSbj2SvY2KyhpDMbK4eJawq4A7+HHihL1YwHlPXqs9IiUUvlJO18dQG0hGXwU2RIb4tFMUR1fEEMJtXXlnwWHpy79LzHchYc4LGTfZ+IEcQfNeEpMgyR+Bcu0eIshhiq+FrTsOe9kqD6h3ZjBakaMlWmQRfN8Eh5OSzXweMmQ1Ruze0ljG2UxuHBuofFLkB8NG8nw27obe0UmOu5rm48G6NTfTBmhQoTSjlzhyWtmUxhHygERsdaLYss7jJ8bIp5Zy6egnZfu6ViTGaPTfj9cStT9uLpwUvD631rXQAbMUXrCOtjq9RH632WhUqiC/9FCq+4UQ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JUgcItbSZgrpSuGAP45UZT1sZ+FhH4ARn4FVN8peCOk=;
 b=NWc/qZH9a6CabkXLhP3lR9hK4FcINnCSGJN1xSFeSvKHbOxBru02htYBTUXIQeqM33nlReXn+MrqFIZEGK4oWlnp/1B9QGggRFKGlC4BaQDInGkHGkLZPVUVuL/e4iPqPALmW2Y1aVuTkcRRhHZ6bG45FArIpWUN1zSoTENCT6/V7Zxl4EBs54LIRKKI8Ax872M7f5CP/DYo9pLWXQ1MHu5ogeQTpuiJF1oaec2ttOKsuXS3liZo43KUhaXZx/P+0eCkYJdWrXQFQcln/FjvOb7aOgI/nd5Cdh3df5J+YShb0cPA6psaY8kVWDF9BCtrRGhkVwqENjG0ZxecNR2piA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUgcItbSZgrpSuGAP45UZT1sZ+FhH4ARn4FVN8peCOk=;
 b=Zctd/gJYvbDLyKhCs9gKLxTRnyFQRQJmhRR1Fp4rAlwPFulSBs0QRn4rwwJlmdznR1XXTyGjm51PcMuUCXZIsnz7yG8h2unIVtAhWTrapJo8n6ofG1AKvVzl2yLkka1O99hQND1Me99/nQtsyLUKur3HseficHGi3+T8eYLNU8r5igJfQ+HPSU66CvBtPy4MnXFBhyDEG/ovREo9gFfHru4NcsbqCdRIOefBUkVw6j9sDqww+hzEnFZopjBJX39vDcsUqmNGIJV7PaUjb8VfclvujCKW1oQzm1z3NrUt0GzsboqX75dqnI5GwkCfuRmCL23w4VQcOipLuWGgo1VxDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV1PR04MB10581.eurprd04.prod.outlook.com (2603:10a6:150:20e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Tue, 9 Jun 2026
 14:52:35 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 14:52:35 +0000
Date: Tue, 9 Jun 2026 09:52:26 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulfh@kernel.org>,
	Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: power: imx93: Add MIPI PHY power domain
Message-ID: <aigoqp-vZxzsAOH-@SMW015318>
References: <20260609-pm_imx93-v1-0-d06c004b0f51@oss.nxp.com>
 <20260609-pm_imx93-v1-1-d06c004b0f51@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-pm_imx93-v1-1-d06c004b0f51@oss.nxp.com>
X-ClientProxiedBy: SA9P223CA0011.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV1PR04MB10581:EE_
X-MS-Office365-Filtering-Correlation-Id: c3953293-77c3-447b-adf1-08dec636bdcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|376014|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Q3pZg1CEvCNgQX8ocspTHCteevUhgaP7SJWf/6c/fjFfHPF584uCfMY3qfL2x5l+p1aBLKNy5lWpP5MT5c9PuXnqFphSdRM6qJxPLzmgSq5TJXkE/SVyJ1rIpDo+o8p0RH1oC/prYDHrrlsb04SD9XJkcV1ngVSbyc/MNdh3bwwSKo9M8gSYC5rR3gLc14G9JuxmoyfWiOcvQpzyqvQdS3YnxKVRECZy8F1uTmMR+cl5PhF0RyrqnOUtr/NHWw1s3Z3W5hUPMPCdJQh1O1eEDlGJ8BnHmqUnnQbfEO4RVcOsY3uom8AznoBDh2kjpTQHIM9rqECLT5PUzvjE7pdL4eqdIPjhkbNySXEyUVLKSS8kYr4q5O5BTyuCmEyWay+ueG4E6lmyXc+0r+NF+m+EKlcfgyCi+pyHyeEVl2mRQMSObvPX2e+nJDK0nROyuPSZqJpNBhrHkPLZwHlIOYHmBbDKpSL8g4IqRzyAQEuk0nlAP4FvagLWrF8RWzSC9igrPH/8PuXgzD4lVhJfOCxRt+7TjJhE7tiIxUWxnS8wBd0GUUZmGTeH0uZQFne1vhwSUwy4VSnT9uTUtph+6SsIcFiQzem8w+u4sYEKDnp1ci5PxdOAGnBtwtnU57w6DaP5maoAn+Ke3Y2dZG7twkIFD6WYJqiVkuw3DS+Qs8yQK2r5mFpeMcARI1UaNQZ4tfKF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OwktbNnhLFPb7Tt0hmeWXS9MVTVqxrGNr4KwySxnFM1hFc8UUoCywe3yvbgO?=
 =?us-ascii?Q?llcKH7QSiNvWBDWWkn1MiDbdgYAOS6CXUeDVc9IPsBTeo0bSZxFMUe9/DphS?=
 =?us-ascii?Q?lfgqcp7B5SuCoK6YONburHo0ZhKngEs+rBhzWqjDtVNBmZzSCUNv+WrFDcKy?=
 =?us-ascii?Q?KvRfzv9dzy2G+jtsa3NLtgjMjVUFm17c/uVxjVI3bsW+axpV2Gea5MfS49Lx?=
 =?us-ascii?Q?cls17ofJHEBbvl/I4+q0s7o1yjtpXtkZUojwj0uj49vBTUMRaWNmJ7eG0AP7?=
 =?us-ascii?Q?WsxTVmniitBy9U0JTG3ZFRaEfw5TD4KBqMObfZpWlAzqrOv2szQqReQIXUQC?=
 =?us-ascii?Q?kPLQY4TtB+VU1JffoYg+xN01Wc4YZ6FKhn+OLsfIezZ6P0edc4QGgydB5pFe?=
 =?us-ascii?Q?7HD9ILi4tCWA2u/Wygmee/giL2qWMNdHJF9e2cuNvQBV13QvhtGpjpFY0boc?=
 =?us-ascii?Q?VlKzSkT3+rZXt7AvvYP6T5rCBSCyE5AXl9XskJ0v/78H6xjwIk2NpKsCsxJi?=
 =?us-ascii?Q?ZdRtAUb3P+z3puR0kKGllYINkJ8LkTZkaujjbpCPsYLo8QcVfK+9g0ioIVZe?=
 =?us-ascii?Q?bthtGPGWXOs/tuQIUfJVMZeWCn4f4X6P6E0yXCAqD8qAVKpc1auQJoIGmUvR?=
 =?us-ascii?Q?D42liI8VyPZQ0eh1aos6bXA0CagmQdFPFbyBNxhjaJj7ygXazd5P3OaCuImo?=
 =?us-ascii?Q?tP/hRb9o9ISwXYhjGo4E8yWXiLYrjzpo/KfYaED2sHlky3aT0IO47eVqan7j?=
 =?us-ascii?Q?GhPtuiv/0/X25ApqCPHHWYQdHRlgQfvN77dLQYgkSQ514kz8YjixxLXtBtx2?=
 =?us-ascii?Q?EVJufyGo/Ac1KjLBLoOXy5xsYeDFTyI8mk0ZRX+Vp64/Ega0+4Ksvngycfv6?=
 =?us-ascii?Q?gJ8hEolGvcDi5gD76m4xSNuupR9w4er3AwB+Hk8gbp3FfWA3NNPkih5Yt43j?=
 =?us-ascii?Q?LOb5bmzIETJa6X1RlOP6MUWtykC4vT3yLFirqByvsLPFiEka3vGu4Y+ljsXt?=
 =?us-ascii?Q?Cbj5JbjnjOCradTwhd2057T0M/yCOzF2BypXXiEaGnefX+A3hD5v0JV7rQXC?=
 =?us-ascii?Q?F6lq5GxoJApjL4jrm7q0fQ7fxsLT4UdS9p2wc5VD3eP+tvp5Okc8GwY+QUbB?=
 =?us-ascii?Q?j1jK9U0TlB9vv7OSU22qZH81ZSHOzWR9qw/6N1xm5zeIsluy5e94ohLiAqfq?=
 =?us-ascii?Q?Aoh2ylt93s5JLX5SDbQL2RyQ1CgGSEdX/G31CTllRCHjJ3HbSzNBPYCGwY4s?=
 =?us-ascii?Q?kmhvL9SGND7shJlU86KPlE0YTZV1MgY4O5+ufsYLTR2akykUbjdcwfqS3Itv?=
 =?us-ascii?Q?75b9xxJjvC8GgC5pSSZxp12amxZVFp+f9UJg5aXrEGYIP/FXTfzsSVL7tNIo?=
 =?us-ascii?Q?WmxeGgPos9yZxgDcKag22ofLRh25DvgHLC+RodNteFTfRxcE195imOTEGfsF?=
 =?us-ascii?Q?HoYNndOx5vCH6cB5WXgjC6iZHNEiTD47szwwa4ZVonKQiivEDFi8wmBp2nC6?=
 =?us-ascii?Q?+WKczmRVtKFpkWdqwsEapY+B7P5XJ9U+jcdKBtmnVQTfFsX44TSKGL6l2gyw?=
 =?us-ascii?Q?SBfhToPZf7OIBMKPLv5S5AZMejn/atBu+ZkUeYLZKcVeepxDjbJx23JWFR7x?=
 =?us-ascii?Q?O38ThVXoIADyIrLO2EzXkrMDeGAWD7skFJhyIBkblBxminzOOHaIEbVJx/5a?=
 =?us-ascii?Q?76A1LXWZLLRW7YKxV+nNB9osiJNv50FfeLiV441+1BsvkZBFCNl5c3jqV5Qh?=
 =?us-ascii?Q?0L8MCQt89uRmwc18JTZmilc4laDnHJZ3lZ0o9Gq1YtpKgL0XFqXJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3953293-77c3-447b-adf1-08dec636bdcd
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 14:52:35.1654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6F1/m3qYM+pAhY/ZzD0JMPKU5lZH8ZRtijUHKLGna+lIedfqPQeuRP6nljJ+lwv/ys5luetl1F56PsQAo8O0+YVA4KbVRQEhL3QpA8DArz7llEK1c4MskbZ9xCt7b17Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10581
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_075241_522905_019314D3 
X-CRM114-Status: GOOD (  13.63  )
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

On Tue, Jun 09, 2026 at 02:26:40PM +0800, Guoniu Zhou wrote:
>
> Add MIPI PHY power domain for shared PHY resources used by both
> MIPI DSI and CSI blocks.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  include/dt-bindings/power/fsl,imx93-power.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/dt-bindings/power/fsl,imx93-power.h b/include/dt-bindings/power/fsl,imx93-power.h
> index 17f9f015bf7d..071221fe5c57 100644
> --- a/include/dt-bindings/power/fsl,imx93-power.h
> +++ b/include/dt-bindings/power/fsl,imx93-power.h
> @@ -11,5 +11,6 @@
>  #define IMX93_MEDIABLK_PD_PXP                  2
>  #define IMX93_MEDIABLK_PD_LCDIF                        3
>  #define IMX93_MEDIABLK_PD_ISI                  4
> +#define IMX93_MEDIABLK_PD_MIPI_PHY             5
>
>  #endif
>
> --
> 2.34.1
>
>

