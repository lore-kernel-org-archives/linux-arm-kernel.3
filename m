Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F7AC2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 19:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cr/JTnmXXjlQ3EpGYxdhQAYKKjgcB8B444EoUdl64tc=; b=u+JNfLIBRcot2wfdItVPq+Tivt
	aavpyoOSqZkpltxjIaWo8JG0MvKVHlTrc1Hmabbap2kJvJVtWXSuqsU0qZ6p34oc4ANVPptphkGfm
	+ZeSFR9jqnR0NHNjN3B+u6Y/kL3YI77iNKOoaFVuuOBVf1iU7O2/vfKVkAA7O/75GnpX1IFBxPAA/
	6jqlnE8veO+HfsqJ8GE+ELLkYiKoz4wYcuBk3zkQpVG5rWZiTAsYlJk/Qn0iRs7FeAjeTwFfx3xXb
	RGABAFPN6IMJxzJxnM00nIDuQmNrxqM2SWvJJgY1kjvrzrghYGhOzmCgWW9U32D55TUw09kGPkcVD
	RCyCPaJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsQ5Q-00000008fBM-3Cqk;
	Fri, 07 Aug 2026 19:18:32 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsQ5N-00000008fAk-3g7V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 19:18:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=plNIUgemJJXhaoOXbWNI1hcpB2auHpMugya96uLcV22wDek4Y+j0MLju4CQEUu9wSqH5WetZWaPN+JJJPnEVkJrUboPMbbsgmUHv+yHY6n3Aoc4+/36v9z0iDO4I3tEwm6FtRuLFDbQ+j9HIlTIFJrCp8qMsnrl6B/K+7f02wa9ShiWo3o7qxpINoNd3dBs0cMHUAVqLV0z3hrarhBMneKS7lvJSGZ2dcLphmpGSidgc05UbM1Y67eIASj1bwcjDKPkFjunZcjstMic4ham3PIxW77I+QSwM7ZEmS0OvLnUdiq39WVWOPPOYAV4LM9njL7qwjBmTVzOUYl+dzvgS/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cr/JTnmXXjlQ3EpGYxdhQAYKKjgcB8B444EoUdl64tc=;
 b=MwCFmo/H58Nz47h81LDb63iVPT6Q311UiHZrM0Fk4pfTLEyvnxWXCU/jTodrp2vdvai9UdyIQ2Le4SZaOHhyw3S8KZpK+5oTqI+jI4YOn0HsUVYc6KZOmWtw0U7egVtB1hEVPkXnA7lhRpvLurR9gu90d5BnjLKC9P5pJ6/+ovd0VB94AQqrLd2qWmo6IvR5cV0gnFNn8PUfKVuTou9rYn438zpIzDNhbNP3TIedKqDPIwgz/3rRWOmModyWHv8oDgO6ZWR24Edg4bnIthie2OXN4RP0Gv9EK07705RVsU87VaVfd4ojA8iTZ9jT0hmiPvr64zIsp509qRXT2zpl+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cr/JTnmXXjlQ3EpGYxdhQAYKKjgcB8B444EoUdl64tc=;
 b=j+u7WoWnOriayby2Q5UD8t7F8N2zn4TKcO41zV8rBmWA6EZhm6VfNI67mgRI1AkE012SK0YFndLBBTM+yVZceCGFZwbN2ETtbrj6rlTARIYUEZi5ID6FXnWXzM6xsd5yIhpTTCOIb4O1eaw+61tI2y19nmTREd/QK8hbdWg9oEQWqwZL+EKnCCZNirDhofO8zwAkhRB2rfAgf/b16p/pWM397lD3yMuh1g5U3DrIvppZ9HLyRlc/q4hm1bfbwpERBg41gDkzrAaXncFiYEHB4pV7NYuZkalKrOBAEq09F3XtWvMOAY8vUvoaQ08GmhsHmfyhjIi4XSk3Nzx6QapOBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI2PR04MB10547.eurprd04.prod.outlook.com (2603:10a6:800:280::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 19:18:23 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.018; Fri, 7 Aug 2026
 19:18:22 +0000
Date: Fri, 7 Aug 2026 14:18:14 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: phucduc.bui@gmail.com
Cc: Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-usb@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sashiko Bot <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2 2/2] usb: chipidea: ci_hdrc_imx: Fix error handling
 when creating IRQ name
Message-ID: <anYvdo8V_bqWnJNj@SMW015318>
References: <20260807065619.30604-1-phucduc.bui@gmail.com>
 <20260807065619.30604-2-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807065619.30604-2-phucduc.bui@gmail.com>
X-ClientProxiedBy: SA9PR10CA0013.namprd10.prod.outlook.com
 (2603:10b6:806:a7::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI2PR04MB10547:EE_
X-MS-Office365-Filtering-Correlation-Id: d46a0db9-3244-44fb-29a7-08def4b8a5d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|19092799006|376014|23010399003|22082099003|18002099003|4143699003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: jN67+ZaxQCmbMo4MJSIdefXC4L27k1xqrFQ9PQp5L1KcUauNRDqe3/RQUZz3OgEfshslmQl4J15S+6W1Pw7TEOcNCgmiqIKJBJOBCEZaBts0I3DK0oI/ruXPOgQW0i4pxlB3tK2okLWCC5ZnHrXFcqbeSGbjvOah556cp0CK5m3esebffzfPZA4zByuj6TI5sIcxvM/SVFx52pcYnZnXj+/28AUsayMCJ8plPEb0NfNp0eKmqIge3osI/d+7DXOWdAU6sPQiL9k5BiD+xQf8typ6qC0j89ZFhyAFfjhF37ITPod7NH2OGT22n/LyWnWfer2sm637RFffMfsOIGvMkzHNIu/NT8vGCPCu/v2yG5PTQTOi5O36VNWM9xz9jXMaYQAKiyVOFA40Him3ZvbYm7Wlb80V69CoYVJNos180tnx2HN8CdgC2ZBILy0V3SzlY/b8rsX8q99pD9+Cr3pw2LwJ267E29NnQK1AI/0ZnzZ8soqq7kO+wOjx+jZ2UnbGUk9B6SV7Ct3s9ZL+RfIHgAvN/zPIbWKe9vaTnZOvUDxQYE7KRv2ws+YEajAcOAmNLTD5ZB5APO6wqfBDHrmGwo26K8JTIOvadYqS8ZEIR1jU1HLAPUZndwLBw7TNOzpuWdXLNYnb8JYe76X+wOO0VdmM2AnwJeGeBZwbHVl74fs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(19092799006)(376014)(23010399003)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BLLgxOG9G5hRF5QwNbPVEUeYdKYPffTf0wgILSstpNkBtRUKBulWBBsS4cQa?=
 =?us-ascii?Q?q9c0Tb4Li4mhGU5vH8tW/LxGW8z9HKszU5TEwV4hPEiZAjq0LYlIQDHCJVTW?=
 =?us-ascii?Q?mKCHufR6TLHsHCREp0vRDYy403UTOFebIlcRAIz2c1Q8ikPulX4lQ54e3sgX?=
 =?us-ascii?Q?eu32rwfjBqHEpSXwwR1BdOrz8voj0udMflj3WoVVoGDXOXgSqNGmXmkoAO1n?=
 =?us-ascii?Q?L7TdhlJaQHkCZ8tlcXPEML7S0U3gktzBh9zJgLbRc7X00JrPsGxMbmW/ARLn?=
 =?us-ascii?Q?NnUBElmqL+QUBqLpp4scVcmcXh2vgUSCp72ddZRAYK5wqObkfI9//gHtNUWK?=
 =?us-ascii?Q?PfVWarnEcLEqD9JlH5ybo9u4Eqeuyeh1Lrkj4W/DX4G5pgdd4BMiSgEk3Hac?=
 =?us-ascii?Q?MJ0ATmf/rImwXlh6jASEeRCfzGjH1AjJdbGqjDH5IjsbC5bfkd4SOhcFXRSh?=
 =?us-ascii?Q?IGSJhTjNYDZNHyveIF9YNICLFjGyuoHDyE7wwQTfbO3Mpe2XnY6mvN9c6t9J?=
 =?us-ascii?Q?5BApaVaCr7xBvJt+V859xUbcSwb5JvTDsP54utynIzcmo7LCvanGQ4DL8Mka?=
 =?us-ascii?Q?6gekd1V1c/WHay+fUs56jkKDWvkFkCCadkOJA8kx0Xxo7hjnSNl6zKF92hyX?=
 =?us-ascii?Q?pmr1G6IZtCN0acV6A38O2ZBRETMBDtb01zAL3wahg1NYQTIbygs79vSh5ntw?=
 =?us-ascii?Q?aJE6igQCNjugs2OF2thd7sdia0CpDq63l4pqlbc+AZFAD0ZqUXw0+X+0/zOL?=
 =?us-ascii?Q?yedw98o8wna7yGsUkXlvl/UsrI79l0NEt3C62zzaZ2vkvd/07L3/+AkBtwHB?=
 =?us-ascii?Q?KU1z+I4qGzMerjyJ1/5Ai+tUR+axlf+mxdOK60zUC07XOUFyfZaW1xa7Pw3o?=
 =?us-ascii?Q?QctW8OI5CCQwRII0EvZFA3X9Fwb5MaVpzTqGwHV4QAHDE7N0sFIDzNW4VQbt?=
 =?us-ascii?Q?dT5qOyacSrXhscEcD4FdXUXGpDBZ+LyUUDYVXylcpdcvbNCfRpG07WQuRTjA?=
 =?us-ascii?Q?X0/SKB487Y3MRNxIrBrcFhDvEiqlV2iDoUBfpcGduRb5CF40gM0PSBIJmSTV?=
 =?us-ascii?Q?eF+0mT9+ScKQUPuKc6D93uUzAqSaDS59AdqRjiW4u61ZCG6GT1N69Yz9wpzZ?=
 =?us-ascii?Q?+RaAyGJRuvdieK91W8wIQ7GqEdtsavXWqKn1i7xbEHUXRnbfigyC/LQBcV4h?=
 =?us-ascii?Q?cKWxft1aundF8EUZkE+bI4SVSuXKQcBtJ4ez/0jDr1vMMPh2pmQUAc9CnRYC?=
 =?us-ascii?Q?XpmnSDIgMw3DnPS783WKt93zt4uk2BOjCa4KHHG87Wi+iDM/vizWQOOqTQJB?=
 =?us-ascii?Q?3NEJIXZINGQOeE3sASQBypZkhgHTjrdJRMQzdQwKWwPprbt4DReTBQm4PTUD?=
 =?us-ascii?Q?JGLG/wcc9GewFyqZIMZAjsR76hfFdopzDw4fa+LJbxU7hcBWLEAqahPTQHJL?=
 =?us-ascii?Q?mczESWibiec0ywWithmPkZTdYZaco9MMdaw4H74Xf3q/LXfTs4Fpt5kUmpEN?=
 =?us-ascii?Q?erm2w0vjDw8WSO3sgY1VjwnfwncgNILkhxWqrRgempHxEqZhZKuRDyDXgytc?=
 =?us-ascii?Q?WqxrZw4dcFJXNgFRedLO9l0a+I+ROapeB3olerw8jdqEz+6cv6z+3rZfrWmq?=
 =?us-ascii?Q?k2y617aU8fKs8KQ8ZNd9QvqWFtqWKAW/l9Cl+p9mq8wWauJ521tsBV+7Lcv+?=
 =?us-ascii?Q?Mlf8LZPEJUxiQ7XkyPjeY8YVtUzrYJNmwPL3QHIvb3zvm9RWPR4Z79si7zF8?=
 =?us-ascii?Q?rR4f35sYfWkKd+Tz9fo7ERRSuG2tcdGYMVSMNBJ4rPvfAklOK7bX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d46a0db9-3244-44fb-29a7-08def4b8a5d4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 19:18:22.8222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OEl1dpUJPMeKKNSEff7dP82sbu1uCi2V/cdvZp3kdss7YwVyTEEXzjXLktbZwCrUcriTBN6MGiZ8DKXScf19JXkV5biLdpvh0iOLjLCakgtW3JTEb/wzMIg1V3jeuNez
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10547
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_121829_916751_B7F45BD6 
X-CRM114-Status: GOOD (  18.07  )
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

On Fri, Aug 07, 2026 at 01:56:19PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> devm_kasprintf() can fail when allocating the wakeup IRQ name. The error
> was logged with dev_err_probe(), but its return value was ignored and
> probe could continue with a successful return value.
>
> Store the error returned by dev_err_probe() in ret and jump to the error
> path to propagate the failure.
>
> Reported-by: Sashiko Bot <sashiko-bot@kernel.org>
> Link: https://lore.kernel.org/all/20260806065755.C9F361F000E9@smtp.kernel.org/
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>  drivers/usb/chipidea/ci_hdrc_imx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index 7387c9903e80..ec2280ae82dc 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -532,7 +532,7 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  	if (data->wakeup_irq > 0) {
>  		irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
>  		if (!irq_name) {
> -			dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
> +			ret = dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
>  			goto err_clk;
>  		}
>
> --
> 2.43.0
>
>

