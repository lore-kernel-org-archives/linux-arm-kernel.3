Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D970C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 14:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V2Xicuh4ycUz4i6o0EyYf0l3OdxBeiXAs18inUPo/4s=; b=OS/xmZPlDa5z8KpYB79YkQi1Gg
	jO6Z27sAg9iNEQNw8pLwziUvMrorrt8V+ZTfVV6VM/OedXQaXrRixeEoH6iksZNsKUqvisK5NIojc
	vBbbfqYhYhwdNGZxHAujc5pCTT7sP2qadvV0TAsbVt89cTb/5U72H6G6lp8PggI6WGcGzCOiQGqdt
	m+CQhszQfiIBrM28IvZQ+ZxjvBGM1US62xuppCRWBF1+V5rSrb8+k+2XZBZBc1Bn0vXFiUOJaIu3z
	KE2+q9cnM3V5ieV2S4wuvqjlXze7HluOwgket3xjblRT998zmSr/WzI5xnmEDhgt+jLzV1+t0rMac
	fnMJAwTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzFqh-00000000W0u-2Qdm;
	Mon, 31 Mar 2025 14:10:47 +0000
Received: from mail-db8eur05on2061b.outbound.protection.outlook.com ([2a01:111:f403:2614::61b] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzFop-00000000Vji-2O8p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 14:08:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TqnCq40GuAm+8G5kqdBlDwWTt+Vr4HNaK05YQoL0G3UtKJB9RC5ZGgdQaA3avnOdNG4dBHMTTY1thM6jEgvO3hAYQDPBVe/BXipcrsWAMX59AJyExaRvocI7pnnLL7PGaOLknta/F2nxuabEaQvxQsV1Guj37AY5hLGBTllPgrYBT2jMif5QjYkL99+a0lVuO0u17j5PZe5uUlJ2aX9FQtTtpG6Efnf5Ygzsfuhf4aKQGK9lUGaGi4PsEWBHxAn4IJlwIuXN5Wnz4TAHxqrD7iTrunBhw+rknJzipSLHOBBmglEI9XYV7JaV1rG0OiAcJ7QG4mmMicorPabVzttz/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2Xicuh4ycUz4i6o0EyYf0l3OdxBeiXAs18inUPo/4s=;
 b=e6s7OYzY5VfLhzUKdUUFa0IsQ4F5KWSvyDSKapoNbcqbRS1voa9jS0AJI8eaYS7xDmMCahT3oO31hL2S3WbVJowzSAgkL1fRIpuGFASHXuW9fXubPJRekVVuAHh2D9C1wN+InoikCpQCQtyoOkAQTC6E7qtyeRhpmCoTzoYup2c/GZ/iT1I6QD0C/lBmwiw3lb1/8RJCh0xo/33Y3AqCzn7uwpWT/jla3Yhk0XvgLnOUqC4MAMdZ2QUrpGzZRsFLvbnuGWLsfoo0Md+7t6XGL1QUI88v2GcXE26MZGfxVo4Ec/j3k+euvk+SvhoUnB8R1qWpItWuVZk9UAKz5H17jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2Xicuh4ycUz4i6o0EyYf0l3OdxBeiXAs18inUPo/4s=;
 b=Zjl+R4adXWMcL7/q1dFvUARrc6rT+b0cByIONx4/gaqpKjjF/JEhBK4xWmsCl5wC4OKMyfbYYOdTSGbcVVTFJc0nmv+sDJWs8B8sgbGUVGL4/MdshInZFXq1njcc35r776l8lUT6R8OWheAazEXKI/m0mEkQLR9A7Sc9z6fhxi9z9lUmLSUayGFSaolXct+7L43CuMRUm8eSxtL4QFqJHBfh4MIr6urfvIDrzD8/4zxlmINIs+tUE5yCSk2WiyWDuxV5bNQvksZHyFJw3IiILs9e3WbxLAgfKsjd6IGUTDHA3/9G4rYcbL1EjHgTYS5VIUBsLVD/iM53J3l5QsX8Yg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by AM8PR04MB7842.eurprd04.prod.outlook.com (2603:10a6:20b:245::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Mon, 31 Mar
 2025 14:08:48 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.8534.048; Mon, 31 Mar 2025
 14:08:48 +0000
Date: Mon, 31 Mar 2025 23:16:56 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Cc: Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: Add mutex protection for workqueue
Message-ID: <20250331151656.GA15525@nxa18884-linux>
References: <20250331112246.2407276-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331112246.2407276-1-peng.fan@oss.nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR04CA0007.apcprd04.prod.outlook.com
 (2603:1096:4:197::19) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|AM8PR04MB7842:EE_
X-MS-Office365-Filtering-Correlation-Id: 19de771a-efa1-4654-1ecb-08dd705d8e54
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MbgnicSjjnPTC8UqZ0sxGgKnXcQUPhBflRVHCgwOTswSo6qiat1ogkbmbZBe?=
 =?us-ascii?Q?sXAjE+VhrECgVbpyiATTR+eXcySl10/cK3XhinYnilfX54uQF5Q1pOAOoS4e?=
 =?us-ascii?Q?vzXewd1pwmw9wA/2J/DSMUZmo646q+B1czY39EtzM8KzhZPxJSxY6Ke0eaT7?=
 =?us-ascii?Q?DnOs79BF9FEs3Ql/PM99eXv6J8LoS98H9asTSbLQnriLtaasSaRDOZD/MQ1J?=
 =?us-ascii?Q?YcASAlf8elhsQEO8Hx/ofYNAiMGNRSZNmGiNnxw3pHhg5ig1uZWB69PPNerY?=
 =?us-ascii?Q?rbeozZIANSMHV2Q8zoqWukEFHxSLwR2Vq2q2rRdHa0P074clDmQUTVKpxXCp?=
 =?us-ascii?Q?laV/j3esEJf3I9CIDS1fVZA7tu0cOPwTZdJbBuKGGIml6XdzeJF/yVKLYdS1?=
 =?us-ascii?Q?DZL9lIHWPnMtns2TOEgf83DueKfdCaBbaowpZsklKnT8Y+vGVBFScX3LOhwS?=
 =?us-ascii?Q?IlaXxVo5DhLM80VY9ItcHBfVwBYbiWEw5IsxfV355m210WZda+c4q/gVHixc?=
 =?us-ascii?Q?3V5kroddSIjlrvtSsEbxtc8dibGMdVKSvl77ztgocyeYxjcjZZSM+Fd30i/d?=
 =?us-ascii?Q?QCHBZd838KcMDKqBam13C9m4mm0Bdv9MGWJlVtqn8qrtSmyhwW8nTGVpdpc1?=
 =?us-ascii?Q?UQRV70irgKFofTweYyfl2B7nGgTfnuNRanKsM1wkT7fFSNIEF5vQiW7mVtlq?=
 =?us-ascii?Q?d95IHDDFfEXhvm43KysfzjW1HLEllb8cMrI6lVmva0rrhHbTMQLga1krRG7W?=
 =?us-ascii?Q?aLbz6W1mJvU/WF0lXk9M/8EYf2zBzPkcWAnZHpREq6YWQIDjcyQuRnKlBqIW?=
 =?us-ascii?Q?7X7DZeHJ92pwCc+PgttVEsomsPA6H1gm00fKHoypxOdMRp+BxjfdcL39MdWD?=
 =?us-ascii?Q?Dg+dYiroQ3UKYKZ2EhGJCHc1t0n3qVKwcIpAeJh8vDsHMv26earlc7zZ2lpt?=
 =?us-ascii?Q?R4TXhyXijezW3+VVTQtsevdYmxKU0Usgdq+wbNDlTh1uQPraZJs5TSmggJzn?=
 =?us-ascii?Q?qcDjmrOJ2yzlpLNFjEyRnhROlNLKX0xFWTH/TfojY5LdAmO5OKpIE/J8V7P8?=
 =?us-ascii?Q?vrYpz9rELQ3l7quyn6PRNggjJ3Kqf5wQhkGs6RL/DeYEYksE3TcBgRHxxjoX?=
 =?us-ascii?Q?29Vl60dk/hI4F9Fjt/U2xVdAF+aOIzs3g6pPJfULEQHFaqH8lS0zYEwxNxuR?=
 =?us-ascii?Q?2MEtVPFCNEi5ME0Nj9AFqHKP/Y4Iu05bHwTvHiA/xsfe0FNwmV5OFyCP1S+h?=
 =?us-ascii?Q?M0QAdLauM63gjqLbA4MU52HPlbMXMLqsMML6s5fPE5AfFdn2FeAW/gqE01BI?=
 =?us-ascii?Q?VNlzk7qoCj/e+1puEryRX1W0oVyKepSFiLPMT5uyL4O6fEvv1uChjUWZvQ8v?=
 =?us-ascii?Q?F/nWjNc2RzQwI1PSjye8lL7M2Q4dBsq5T4XW+ZTlHBiPJ3YupKVCVGgeOYki?=
 =?us-ascii?Q?QzCPzvIkTslXnZGuiL1QsVzjmcLoEOYel9Agba5CDoiObZHslK8Avw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gUsJcEMhF4m85iaRR7taQQuh+bldCy6i8qnHZD4NdlHBcIH5rbBXo9JDYykz?=
 =?us-ascii?Q?LB8ueSFkme2HMK61ZIE2MI2KD0m+XMTc+mIDys5Qxs4/pVX6r3hk2fXyQ15B?=
 =?us-ascii?Q?uK/SPYXyRUsstwiRCNKKfiKj/5E3Na5FfY+s+YxLTzkgFg77NTdZNhKx09V6?=
 =?us-ascii?Q?3y8JD+SU1PfhZzc64/HuOheQrQ089hFyNY6zbet/CQhtYutVwJN9WPuTUsSh?=
 =?us-ascii?Q?3KNUlAkxBuwskJBu3K33c88+lFp/g+jFfVO1Hqej6lU9GKEugDASHvKsc98M?=
 =?us-ascii?Q?EDgFDVKUdUG5e+J+7hZ47Vn3DQn8JWcTSSjZ2p9Zf0Ql4Khl9xA8sAODB8xf?=
 =?us-ascii?Q?jxRY/UYbcpTqha4ptEVWLHjePfpDfe8hjfpl585QIs5l8Y9kL5QcNWmgMFlw?=
 =?us-ascii?Q?2e6hqN5xEJow7O135gyDcTlQ+fbnLTCosqGyNNoTg/Kw8Jtlfr5PEmMHmV5b?=
 =?us-ascii?Q?HUQdtOGP8/JOyRutgG4Ego5+Q2icRPDFOrmVEm2aCqwZ5Dv8Ko8+aMlEAWsq?=
 =?us-ascii?Q?HWMDInIh5rB0gKS7pkyHDhFEt/10OsyfttuBH1NuntvESlOv/0nT3Monj+nT?=
 =?us-ascii?Q?JvX3AVaCTk8d6UBWHYKvlMBYyBcnbzYEmEVARwcSJOEndWEvW9A2rrrwaoIH?=
 =?us-ascii?Q?7BcX35kYJ5AkvvRxAkH+obGEcs+Q6O2CIIFaiizK2VgsKqQmkd+z298WseOU?=
 =?us-ascii?Q?psRDeviwopcoIGxKQ1kIDd13BX9iz2pZ/wmukpoA6hCH8OKX0/lfUOqWB9YZ?=
 =?us-ascii?Q?rraWlUOxkyq7KqM66xlXPnBTDv7J9+iv/99n5s8jxLXlmIW4WvphlQ4cjxAv?=
 =?us-ascii?Q?DHFNsb66vW8YxVr6dtTpleGzmvprhKCktfu20XmFszLqejcYQWMF/h3swXMx?=
 =?us-ascii?Q?47aF6dXMiIPqpiOgZqJUkMZvXhDNy0veE0ovePMqzX3j2/te0YvpVYrS3T5y?=
 =?us-ascii?Q?+FV7uAi/+gx8HT1d5O4gvLQ7flQHHmWfp9zv6PZAoKdDjolAW7lvU+9MAzIh?=
 =?us-ascii?Q?1APSj2Bg6a2qRJPPRxk7D1MrEXvTvPClptvT1i0LibECQHDfh70HnhksTTiR?=
 =?us-ascii?Q?r838UC9yJtrek5EET/R+l2tcR8QIlkYljkFt2bG0ViK73gKxlW9Iugh9awkv?=
 =?us-ascii?Q?EDPnCZn9VGf8EAWnJhOBpuMNsQdkFZ4aH3FGIV1P7uUP0dkGAB5nflTXo9Fj?=
 =?us-ascii?Q?p8x6Pvz9KPwukqeA2yA/t/g3k6D47POzLWuHmVRsDjClDanlIvtfmkfumqRv?=
 =?us-ascii?Q?wypV2F6gm/HyRngbPCRvUsr8jYzigPsKxCL3/sY9FVYp55AYJsopBynfriti?=
 =?us-ascii?Q?QfYBfoKsGd2Eu//0r1N67NenhZLqAVyoLyFIHgAjwE9xxoVvSSsuzmlfA5pk?=
 =?us-ascii?Q?9TSg7lC3b15s0FcK5d/xQJyHDTTX9BOHJgfdA2TPNti5Y/7T2ngYkWkvVkf3?=
 =?us-ascii?Q?5tS87Qwb7o0eq6DpjVcg7Evvcl5ATyDldhtClLR1OUGrsiHsOXFXzjpAEf8E?=
 =?us-ascii?Q?+JLzyHDzQ0wlL8lbU9APC9zu69OPXD9t6wORppIU94Z5Ax0JlP2IAfOSdep0?=
 =?us-ascii?Q?tiv9kjfWJPPq9iB/m2iv4R4gkK5Z+Re1nZP6wQBY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19de771a-efa1-4654-1ecb-08dd705d8e54
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 14:08:48.2087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s1OTNCiYs/NMY1YnMK6RULTEMkcZjQCBGFuqUpjVsrKmwQ1MNNeLU+E1ALy8K1f4JmKDg2tL/L1gT1YJHpOjwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7842
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_070851_620906_21473DDA 
X-CRM114-Status: GOOD (  10.59  )
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

On Mon, Mar 31, 2025 at 07:22:45PM +0800, Peng Fan (OSS) wrote:
>From: Peng Fan <peng.fan@nxp.com>
>
>Same as
>commit 47e6ab07018e ("remoteproc: imx_dsp_rproc: Add mutex
>protection for workqueue") and commit 35bdafda40cc ("remoteproc:
>stm32_rproc: Add mutex protection for workqueue"), imx_rproc driver
>also has similar issue, although no issue reported until now.
>
>Reuse the commit log from the fix to imx_dsp_rproc:
>
>The workqueue may execute late even after remoteproc is stopped or
>stopping, some resources (rpmsg device and endpoint) have been
>released in rproc_stop_subdevices(), then rproc_vq_interrupt()
>accessing these resources will cause kennel dump.
>
>Call trace:
> virtqueue_add_split
> virtqueue_add_inbuf
> rpmsg_recv_done
> vring_interrupt
> rproc_vq_interrupt
> imx_rproc_vq_work
> process_one_work
> worker_thread
> kthread
> ret_from_fork
>
>Signed-off-by: Peng Fan <peng.fan@nxp.com>
>---
> drivers/remoteproc/imx_rproc.c | 6 ++++++
> 1 file changed, 6 insertions(+)
>
>diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
>index 74299af1d7f1..f933c8f4fc8b 100644
>--- a/drivers/remoteproc/imx_rproc.c
>+++ b/drivers/remoteproc/imx_rproc.c
>@@ -5,6 +5,7 @@
> 
> #include <dt-bindings/firmware/imx/rsrc.h>
> #include <linux/arm-smccc.h>
>+#include <linux/cleanup.h>
> #include <linux/clk.h>
> #include <linux/err.h>
> #include <linux/firmware/imx/sci.h>
>@@ -785,6 +786,11 @@ static void imx_rproc_vq_work(struct work_struct *work)
> 					      rproc_work);
> 	struct rproc *rproc = priv->rproc;
> 
>+	guard(mutex)(&rproc->lock);
>+
>+	if (rproc->state != RPROC_RUNNING)

Rethink this, I may need update this to
"if (rproc->state != RPROC_RUNNING && rproc->state != RPROC_ATTACHED)"
same as stm32_rproc.c.

Thanks,
Peng

>+		return;
>+
> 	idr_for_each(&rproc->notifyids, imx_rproc_notified_idr_cb, rproc);
> }
> 
>-- 
>2.37.1
>

