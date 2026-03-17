Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3DDFD877C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 14:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bzlw2ZdkU+dpB88pkRPzn8q/CF49DgcKzKeLmCu0duA=; b=1cqb0yBegSWgy1Op+Fa2vhy4ww
	gC8PSU4jLxERVsCzSRG/5tyyh07wwUj6AFqYikoet0B6veDL39Z93MFqohfHc2dc5KwZW2Ra6pNL6
	j1yOmSmP/E2260DE2uXMIgKQNRGbfcp2CzRCsV68uFoRVuL2Gty5Nww4V3XgATZpgK21z8w6jvLcd
	8A3ZNP1bZKiXa9etxl6evYzuKsnDU4l1wG/dqRJsRGnWXxqR7YUwO7r9DEeyi29caX+hXo84I2cZJ
	I7QkClzAbmBrdRLRL/0p3Uu154Os/HlhGCDn1OBpd8lTjvk+yurPdxKXljNtmRWuCd1hlre8eThZH
	6pFKgpmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2V5n-00000006WN7-01gK;
	Tue, 17 Mar 2026 14:08:19 +0000
Received: from mail-northeuropeazon11011068.outbound.protection.outlook.com ([52.101.65.68] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2V5k-00000006WLz-2CPV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 14:08:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQqaEcPpX59Nnxd9yadlAHtDONLNGUMSCyZVLvzXHBbc7fc/BMqtbuk3t+Dp2nXvAFbofbRTy6lc3nIZbk6bbV3/1RdNPYgzzaKuRdHlSM7q+g+kv04xt14Tt3H/HYY9jj7TCptB7yY0Y2pfANw2XupeLBAnrLMTdHHHcGvw9M8JP5NyYGkXHOMj7SbdiXUN4oorm3adlJXWfV60XCE2NyOqv05hX/3NyG1E1Z5dXtvyhN6qqrG+MXShRmJ8BuBlv+weNW70aA5V8xFfIkyZVm0RuZiGjMX+owpmHxN5eeZUzcZjyQ8uhv4e+OvVwJaTxcnsrvtYi9a7Nqp/hzO5Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bzlw2ZdkU+dpB88pkRPzn8q/CF49DgcKzKeLmCu0duA=;
 b=KbsKyOfx2L9+Utb6J217vp2tdYL/Ol54LMhM9RwCC6GOV0nKbcNbfMXMSPkmtRw9MQUG47eVjOQlWt1QVTx0t3iEcFYeXO7lMklJIOu0qmmKhUrqYe4rpxU2ZGM+KxhjjhNMs3wZIqJ8/oUtk/N74Bszni3pYVOIjzmT9ghKR9THNPxLLgrjCNbUML16A5+2Se/f18c+TMIF+EBVumFqVythuvI26uhF3oJbG/hcD+qAc3vdYHniMn4BmBZK+Ltzmh82xg1SRdLkWzPhGfvFaqPIxnsnwuIAaGt0FasQqVCiUJV+RWUxKRTHPCxeyoSrulJlef9+x/DYzF2fhHfY8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bzlw2ZdkU+dpB88pkRPzn8q/CF49DgcKzKeLmCu0duA=;
 b=TqnFPwX9wNxm2i/mUl27wJDZ4yua23paItflCTDgI5OIoCjaqZTacuH6sTVxCMauxa3ECzGEFXfB4Juu5LAM/Qxll7jOpVb3XmohScsw+UhlMuysTbRD1SICMDJs0J8IqEzpiF3OB44wHdTwDVK6AGhy8nC6E83EL6sNPQK2jO0Kfx0i67rTUhaUs3x0pCQUmBIYMLFr+EnHruLcpZ9HOMqw5GyYFeGLWwQkuFyICTsbMx7WRJ70Y+eDPPfMN0J1HNpi8LCKvR9q04SxvBBLgXUFqL5eq/+IawMfZWnSdYGajIlKVdq7lrpcw7De2pV8tU1P09egM9FTRAAWoR4fuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA4PR04MB7903.eurprd04.prod.outlook.com (2603:10a6:102:b9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Tue, 17 Mar
 2026 14:08:12 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9700.021; Tue, 17 Mar 2026
 14:08:02 +0000
Date: Tue, 17 Mar 2026 10:08:04 -0400
From: Frank Li <Frank.li@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org, arm@kernel.org, Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [GIT PULL] i.MX fixes for 7.0
Message-ID: <ablgRERiHQ1Tm2i6@lizhi-Precision-Tower-5810>
References: <20260312153557.3338430-1-Frank.Li@nxp.com>
 <20260317-jumping-corgi-of-defense-038bcd@quoll>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317-jumping-corgi-of-defense-038bcd@quoll>
X-ClientProxiedBy: SA9PR13CA0013.namprd13.prod.outlook.com
 (2603:10b6:806:21::18) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA4PR04MB7903:EE_
X-MS-Office365-Filtering-Correlation-Id: a18bf3e1-e9d7-449d-af6d-08de842e9a41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|376014|52116014|366016|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: DVwHWupUzdz6IVTRDnTDXolpovyVbrcC2C2PXlLuMfXMD2ZiBelIS+h5ESsgsKzrwU5JGaD6mBnmi225GeS0yBpADNHA6U3bpySG8ndPw6XGbumYhPbiUCXwj/3T4Vzrkq2qAB+6E5W1YFbqVf+EgfCB7DEsKNyNsTer1mz1PzaVsdtvmlW55E9RfZF/PN7LXehaucswARVvb0BCXMrfQUI0zags9q8jD8UPO0ejWJNisxa01n82EdXWD8moA98kByWIIZMWqGcstNc5+IKMhG18j3zUGWfFZuNZlwllGFCKJjeMewucc8TLk8ke6ho/vU1+LrFZ5t1RMyWioCvttIkraAefV1Kne2s/sPyFhL9iUqo8l8ZxzSozIt4yQ6ZNvnjXTZ++97bjE52MpaReZZnUokenzYzhRvC3LRNGpPRtTCut4iUzvIklAACUKlp/7sUUbcqjKSMcGD14XCoUkH9zfdWg4hdwVvdDtSZAsQR0N4GzLmJAduyTr7SDZcF/IHXQVGfGSv/whpevIt/3M4E9dYzbkzH8U4abHN8Sw/Q77baX2lDtMVsLSY3zgRsZMEQLrCgB6IjUHmbgoTBzMDq9jO6kl35phH60kV7isLPnOD/2gS4jPnXMBwXiVONrsB2M8r9kP2il6q3KdvArSWp9QkPkbjLYhWK6QqQIIIEuy01EHZB5ZRg7jALKVcD/kcKpkBo5NvO26+LSmmmAipBvetyua3wC4dzQqrwYb4xcuV62AgP02Xdx3//mOWbI
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(52116014)(366016)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DrXjswmQYgZA46xk6VSt6n9oS6U6diV1p8760tehFB93kPLYu74x7a7E7m9Z?=
 =?us-ascii?Q?WSNJXKUxnjXgnZ3HBmsaX1teTaCGRfHOi2t30jorHjoC9VPZ4SDxbhc/DAxO?=
 =?us-ascii?Q?TrpOS0J4ct8ZlYCwX+CNiIgCzVaD6284aiKpL2PAqL0OtThrlysY4zhk/g3J?=
 =?us-ascii?Q?n+cfzCz0H9oI+GBOXelmlPiLNA07h2czr4aNNyaab2G3RaS/xGeZ0Fdx8asb?=
 =?us-ascii?Q?6CLcRsDoiU8pJZP1JFezW2enQutwO0S8Wqay9pTPkxdDhEPEgvKva4sHeaA1?=
 =?us-ascii?Q?zaaLP+moiz8ua1ZNKokqIFN6tP6uXg66cHdc/5JCb3t/LheVnmUgWR9NEYhK?=
 =?us-ascii?Q?X95g+stQxkcVJNg+7NoPe52xVfYiMN+Kqdc+la6XKg2OLKE+iJ2OxiFF8k6L?=
 =?us-ascii?Q?T8Bg819ur8+CBdHoe8OSCUmcQs95CgLhXMoVpa1KUVJtktHVgd8NLd2A9GK+?=
 =?us-ascii?Q?j+QdmwnsK0Aj3tKP6iyDcEmGbk95G8/6HsrRiW7ve2J96VNTAvdoLQszyEoh?=
 =?us-ascii?Q?58koAWRDMhScxnbHye9IITcQFYKZIQAdD9un0M5Sjn9aWBO+uuZYL6uPHdem?=
 =?us-ascii?Q?a+8U5XrjxTg2v0aiB0VLJ/bDOUIcJOQpg6z2suZxgXcaYWbddR1Od0jSfekI?=
 =?us-ascii?Q?8Eqe/fuJ3tjRubYK6NCIpMOVpfIDAx/1g/dNMD3YAqH8+I9gZspiadVxtBjq?=
 =?us-ascii?Q?oFzxHJ7SE5nK5Zft2exvyWKAP83yPu3tEXhuhx8V3qSWzsl6m+6kJNBbyPHC?=
 =?us-ascii?Q?Q1vQKs4qAU7NkPdFJ1F8CdCCjKzsdsn2IMClJYW1LlXm/JiuOd9xr7bUh3Ej?=
 =?us-ascii?Q?gMzsLBCTq5MRTswSzhC1pJS5f2fF99u+1gksZzr3TGMmloOxgKwDuURzpVYj?=
 =?us-ascii?Q?lFrD4foqJMazy14rhD+MiyUUQHTtmZNqOugYjIWzGJulmAg8jRECSbtkr67Z?=
 =?us-ascii?Q?mldVG1uIJQagnFUtHwVN5rtmhv1nqfze2QPwAk67UD8zhgtTsGn11+jSTxE0?=
 =?us-ascii?Q?z+55i80OKIfyh2v6p334U9CGY0UO7jTZffF1lE9ehYYY24lgfkYzjU9eOSUw?=
 =?us-ascii?Q?+be/oHN9qgJn3UA+BDQOEiGaZdXv+l6+T0jiXP9fA1VNrgzgIMlm3/VmJWFj?=
 =?us-ascii?Q?4QNtRfKPXE+EgDf/PhiNEjqr/GQkG3qytJOtcqbVSxe/VH1AtJ+EYZMaxnFy?=
 =?us-ascii?Q?uWXt0kDZQTLvJ9IzVoptpFOefJysy1duFb8T1UKKAMouGA5AXcx4YiyQcq7I?=
 =?us-ascii?Q?Y/F7vPQ2Svu68+5qs5QLLDl15cVuAXKKF8o/mgIR8nCp4OWptomFQ5n1ZBPS?=
 =?us-ascii?Q?ZAHfRK0z2Zffcgg+SRKJhEfgpqSRUObduMnbjxweU1w132pACTZA+NzwPBY5?=
 =?us-ascii?Q?mfd+/bzo0Jk9WMK1NsRSkE44zbQCM4A7jkbCiXc0dUpINCtoKW+seTHkcyGq?=
 =?us-ascii?Q?zFogjINVeUawh6xFcHd2nlzBA4Gg+DJXPMN4YjNbimumK/RXRDsYchelanqK?=
 =?us-ascii?Q?N7OUhfPcCHBOGRs5XNCRxDhmWduMEunxLyxutpcPimaQWtZdNW7Wx0MGKz70?=
 =?us-ascii?Q?uUPefGCxzJEm+8F1egbeaJCyTK/tv+b/AvegDasM1kQ09kn6ePXKFa/vv9Ps?=
 =?us-ascii?Q?xLeDAf33RK1ULU5jHkSJFwXMu5nZS9BjZxb5sw8QYSOl0wcp1hzZiFbfNCaQ?=
 =?us-ascii?Q?eCrzl80H8Fiesk3JZT75AOM9A83ubNifgfKM9A2+KsIsoFNc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a18bf3e1-e9d7-449d-af6d-08de842e9a41
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 14:08:02.6339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tAapsfnXlQUjjlIBglKwbw+Fp4du5plU1sQEEdiZ2H4C6HFAEoZO7P8YLkhnnLl5vFgcX9udAvQ8H6MakEOh8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7903
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_070816_566261_6EAA34D8 
X-CRM114-Status: GOOD (  13.60  )
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

On Tue, Mar 17, 2026 at 09:03:19AM +0100, Krzysztof Kozlowski wrote:
> On Thu, Mar 12, 2026 at 11:35:54AM -0400, Frank Li wrote:
> > From: Frank Li <Frank.li@nxp.com>
> >
> > The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> >
> >   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git tags/imx-fixes-7.0
> >
> > for you to fetch changes up to 04d00f57c168153758d2c6a2395d20aadc785e3e:
> >
> >   arm64: dts: imx8mq-librem5: Bump BUCK1 suspend voltage up to 0.85V (2026-03-06 11:19:41 -0500)
>
> Hooks fail.
>
> Commit 587096ada520 ("Revert "ARM: dts: imx: move nand related property under nand@0"")
> 	committer Signed-off-by missing
>

Sorry, I will update it.

> Please implement basic checks from beginnners maintainer guide (LPC
> 2023).

Suppose this one?
https://lpc.events/event/17/contributions/1498/attachments/1155/2452/Maintainer's%20toolbox%20-%20Linux%20Plumbers%202023%20-%20Krzysztof%20Kozlowski.pdf

Frank

>
> Best regards,
> Krzysztof
>

