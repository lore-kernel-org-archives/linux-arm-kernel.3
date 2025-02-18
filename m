Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CABCDC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 09:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ub8KcIaInEqrO393sFZTZsgayzH1hLqO0x6G8f1wUhE=; b=VQcC9ezbsoPP9PUqIocI206F4I
	vgXFGGV4z5MlcTo9Tt6YlBDwd4QGgJJsktlERTMIJFum9aevj15fR12jzQJ8dDuAf//6ISAYUoJZ8
	cIdNloqWA50xvljjPFsoX1TTVLjfY7YbgHHylJ8Hmb1IZ9MVFnPC2sQtRs/tHUA0Cwbq4V+mz1usq
	NvwVvKXULRrR433aLduxSU5va/P/Q4CvnC8VcVKtR07BL9OrtRgWM0y/DE5BwGOSsIXLhj5vYSMwJ
	3sYH9FJewlV13QiHxzzHG4KySnVEYsPViDsJwwxWhSkLZ0FTBE12FNXo1V4Kis8EUn3iTQ2dkD65K
	p6s/6sdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJWy-00000007PkI-0iYo;
	Tue, 18 Feb 2025 09:04:40 +0000
Received: from mail-db8eur05on20630.outbound.protection.outlook.com ([2a01:111:f403:2614::630] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJQZ-00000007OJj-37oS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 08:58:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sVyDTGF07qLVJ8kAPYAhOKPUCF0X4Pk+ZZkwvCk8ExdOiWx3PlBZ1VGcFI1PXx/D8fVhdiU54uXHrt7tpFRA2xSqxv7oVZC6gWyJBLapeTvzvqWmKaV1SLVqr5gJy4Ypuoeq8RQTMGzdoKVS2wgo5vhk1/jvPI5PxTRWCFC+ZgWRvOZ/fKTxSs716k4h34R8l0JFD3dBzfFnhbUu24c59I7EYoCDcoKWUXLLTCTepTFDUDT2Ur7tU+Lg2F2bKR0Y9MQynFjWdbZ8KU/KZrY3UKhITrisFM9UmQXlGRgHNuFJLkMdnPSOt/gus4/yue+/YZ9tUXq4IueSpGHjiTEAZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ub8KcIaInEqrO393sFZTZsgayzH1hLqO0x6G8f1wUhE=;
 b=JmZWZ/1EVxrxu3Sb5FH+HUUrIe5ambWXMq972cWWmhvGoszcKw7dk6DNVlYXPGn3LURyepPqQULmn4UyweubbX5WT+QONpzZq2EmYNQmcb1DvqDXTX8BWT6UdZPefp96BRZS3iC6q7P/TSVCXlTU3L080FGVDl/i0PiuZBrDZtsqFxFt2s295dXrfWY3UzzTP1n+rC1OgPCPGb6+s3UhYmtlEPFjcbLIy8fRf+8uW+0q/JppQBSayeQ254jyf8nhjU6Zw/QJeFqfljiKgsjM1q6p9reTCj+8EOzKx+FV+ulxoZNCjAbBrssr4fE2LVc3t60LoqyViCW2e1q6635ZzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ub8KcIaInEqrO393sFZTZsgayzH1hLqO0x6G8f1wUhE=;
 b=aJ9KC/tTmShmFyrJ/wf0eBXwRGkNoxNilg13ulNhkmS0wVP/ejpqI/rtkcq53t4dwfuYiSbfpj7XEQ6vsQjal/uW9ik4UdV9J5S8Jf/ihIlG6rPjbOz2FzxPT6zqx7igkm+0FEf3V8rPS9aBu5wAcQ8Q3iJqQU89cToXlZzbK0h9BwLdMl70xLfC83d9pqsGBrU+1wvrE0dbibkD0DLwH6/Ga3hphCSHG4Lk7YhunPhkq7qOgXZ+1bMETAlmSSH55iiCoxVFPxfDD3MIcGia/0kT0ThzwP88uXaUYr33Eoi0hW3+H/Yz6iVU6buRHQ9lGLmEaGgy00h7Bwtv1cP7Tw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by AS5PR04MB10057.eurprd04.prod.outlook.com (2603:10a6:20b:67d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Tue, 18 Feb
 2025 08:57:55 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 08:57:55 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: p.zabel@pengutronix.de,
	shawnguo@kernel.org,
	mathieu.poirier@linaro.org
Cc: s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	andersson@kernel.org,
	linux-remoteproc@vger.kernel.org,
	iuliana.prodan@nxp.com,
	laurentiu.mihalcea@nxp.com,
	shengjiu.wang@nxp.com,
	Frank.Li@nxp.com,
	krzk@kernel.org,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH 0/5] imx8mp: Add support to Run/Stall DSP via reset API
Date: Tue, 18 Feb 2025 10:57:07 +0200
Message-Id: <20250218085712.66690-1-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0286.eurprd07.prod.outlook.com
 (2603:10a6:800:130::14) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|AS5PR04MB10057:EE_
X-MS-Office365-Filtering-Correlation-Id: 93cc3163-9342-43b8-4f67-08dd4ffa5541
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?e6aAbeXg22VHAyDBwMDWf4bAT27ZcQImq1Q9EYNFV1hI0JUwp9l6BVaubmaP?=
 =?us-ascii?Q?QWtpKdGsVh10Qk/XEeGzzQK7gbXBYv9ZjqEpnzvFctAtOeIJKW5XswVwzBEc?=
 =?us-ascii?Q?S6cCpos7aTHg4BhNKwaAmnJSsOFrn9GgYuOzZDL49MITLwzF+UHJckH3+XBB?=
 =?us-ascii?Q?QrOKYkTeJZN2poAgReM7htIhQdN1inI055fSnZznyhf8OZhqLFKTuO9JLvl4?=
 =?us-ascii?Q?+PWtjofE47bNsqDFVS4XGFa12flEZBi6RonKzIvqhew/MMrddeRm0NKOjbPX?=
 =?us-ascii?Q?tDa3WblZKrYunBePymtVPYT9BEDPMknEI++xiJT8fnLr620LHZnExt6A7uFh?=
 =?us-ascii?Q?Gqwn7TGEPUZBGo7NKwu+2VOXtIPHWCrypxZBJYERB0HjWeP9I+T1pn+BUNcJ?=
 =?us-ascii?Q?M7eX3VVfP+4uocbW9exFmsOGBUIA55Y5TLQ8YEmoL2LF9tJ64kpN9goRSN5J?=
 =?us-ascii?Q?nkEO26eoEGKPG6/CB326NX2NIR+fUKdT8WNq+l18c5r9vaJf7rAFd5XrMJTp?=
 =?us-ascii?Q?BoLb+LSzvYH8RuHOjsRrzcUvjXX5DEWEvqKJt4sEyZI/f0c3sj55QWRPYAy8?=
 =?us-ascii?Q?LpPqAdy5RvrzznsUnvsTRlp8rrdtGkFfseVzG8fp2qZaGIVPhXNy4Mx4TvbW?=
 =?us-ascii?Q?QhZcHu6sfqqExN3YaZD1EUfxSiTS3vzgn9MWxtysGLV9gPnlVDuNtlSaDFpY?=
 =?us-ascii?Q?T/AYxhoUtpYE9ACUX4y+VDg8bVxOnFzoEiT8m07P/Cs6dkHrwMWgteXbS2jN?=
 =?us-ascii?Q?GSMCF2fLE7g8pMLEEQPEn7iYki+nNjoEQZvxZrXNulNu+FBOubrltI1RhGXB?=
 =?us-ascii?Q?0OENNVQt4yX1HO+2MJLTDhO+jbPZ6sjKfDAxHsWQGUuk1yzYWUVyx+WjVkAJ?=
 =?us-ascii?Q?jVcGAQqot2t3lvJGb36aygMKViPU3MUL8ylSAYqXSKAmK+VBKfEelYWLzWZr?=
 =?us-ascii?Q?IrjWxFxtfLfh4wo0sXxZqEe4zxDPa+23yWIF+nlzPAAuOrQLiGEvWmMV72cO?=
 =?us-ascii?Q?s8fvhe8d0pAQ5wpxko1cDGtmgCgRoN4WhsBaupS0Ss4/rEiBBS7btdnHS3PJ?=
 =?us-ascii?Q?wGOJjiLvhionMtWMr5G4GgY6L+xhH6S9wV9zywFAeYVbdstNYbIfml2KZHmU?=
 =?us-ascii?Q?J2vxfsQ+tlBCtirfaTTD3tpDXuSNOvuM8sZHJFgcRQXjIHHMGQ4cSliBtSbk?=
 =?us-ascii?Q?MbWhywrFwkyBuTVPKw7T8nGzJlXXgYzSyR8/oyi0siiFJjWXbVbu6YjMunhh?=
 =?us-ascii?Q?3wC0dKFoaFaMYFuWwxbmi7Y2Uj35ExxtR0tQoEyQk+kp/bLValj6UnqpRRiZ?=
 =?us-ascii?Q?NrgT02I3Q4YNbZT2qLdcdfr+vVqRozU+imXTa2zO1YqPzy4M+chAKdt0y36X?=
 =?us-ascii?Q?+JBrU/UfKYyvkxn5v6DfM3XGzX0T?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SDSIPGLbuGd6zjhkDmOnyAdXjdGmvKFV+dowooX4CsJa26vVLUM87NMoZPTe?=
 =?us-ascii?Q?9WYEgDT9S9s9ZuFORZucJ99xJYwyLNtju75sqxwJyKjD9d+DxixhMLM4KWZE?=
 =?us-ascii?Q?NZ5QX8VKA8bTiC9EXaFctTtFPxt330kX6A9kswSo7fFfZZXIQDgX03qdQLZ9?=
 =?us-ascii?Q?KWCxVzEopP45lpJZ5iYH/q+6RLRZw5ENR4toGbUQxURkIH1RQY0FwdFxNArD?=
 =?us-ascii?Q?uknXydZ+2B1pL/QAwRU2Ibyp6e62pOt4aAi46DbTufel65L7X68GMeLTRFGQ?=
 =?us-ascii?Q?hXq6vylFBo9fl3DJhHGYWZ1LxkweAi1Egy4hZ+lrYqGib1jqfWStotX302vL?=
 =?us-ascii?Q?1fXosFQuc47ZuHUB02FLC7KW1R3vGnQVPJodS+ySlwAjpJzPgdEqqAvthO4L?=
 =?us-ascii?Q?hKG5Bqwz09a6E8EaXl/EHf203u8GBTq3RplBmEKzjSZ988A+i9SqjJqEiHrV?=
 =?us-ascii?Q?UTbR81p9KZAb1T4EUneN5jscPmNG1QhGSZfaerVc9hIC+FYuVJjGIRT9g8Z0?=
 =?us-ascii?Q?MvnLFgRoc46EP+WdgG/+KUAnJerMSTD2lrOM946hQazQipthp/8aA1b4dHBI?=
 =?us-ascii?Q?v4ikUBCkwrVA/UAryauuJSg1+jjP+1aXNVtB1ODzMu5QsCgdilnww0qpEIW5?=
 =?us-ascii?Q?o4jFjqCKqcPtkyXEVWgqZg2+Psw/sabcWI4cCZVS5f06fWo6T+VbYIA4rsp2?=
 =?us-ascii?Q?GB9e65ix0zjAUR+TV1OeCZmF5sGQ9IU80VwFsDnsxLlEIOs5XDXq/Vjd7eOD?=
 =?us-ascii?Q?FK10tKGQuzwabM8wQ0E9dhGtkH/m92IqWoQxaABeiLSxJdDFOXIA8r1DZzDF?=
 =?us-ascii?Q?Uqcz2j6jQIcwv17KsjvnbYT7uOG5RZSBWSEYVqcHKOevu+SP9AhacJwWjmmk?=
 =?us-ascii?Q?8QMSoSn6EVneVt+HgraZGTW1nXIjjXqfsPwTHBcqi9XN55T9mlcSzqpR5+hG?=
 =?us-ascii?Q?Xs3PMFkQ/ERYTh6FPWMc/pKR831CmzHyHTQM5uL7Bb79zXr8xsgNN3VBH20z?=
 =?us-ascii?Q?alBedtji7My/9JD2KP6BbVJsjMb1Xs1O6N1xJgZoq9KpRHF5F/wXtaNj0+cJ?=
 =?us-ascii?Q?TtE5Hnm/WX/QaXH7kPf5ospvV3vymaRp+3+ryyec9kT6RAegm0oBtF9w2s6W?=
 =?us-ascii?Q?tvliDP51JadWM9DEAo0lroFAMpTRL0xGQ7f2XHqN/nBgRomNeJ4SlBzUONKg?=
 =?us-ascii?Q?WOmMZdwJzIjaSa8/NnBALMODUtEe9cgCdAAXiCJHmaqZYLmwmf0yXuDq61cd?=
 =?us-ascii?Q?PU7XDcRgtxK8TH+w6wGhU2kULohXVc6p8xAWl9cS+YcVoKsqtboiH5OKsNut?=
 =?us-ascii?Q?tshtk7BMZZVllir3/tMNypH8UL9bv7dDQEouNUnusj3uFMZbHNyZmJEbyARy?=
 =?us-ascii?Q?rOzTjqI323FF6VttWVtCS6zlwDNxh8C/A2u2fFOjkG2ozvq9tUoaiy3S7Zxg?=
 =?us-ascii?Q?vvcDsLt4giIOhjBYzlc3NEwyndIOtfZoeoqjtBYcxFlw7Ba5q/TUYKdW7kLK?=
 =?us-ascii?Q?ZzfSfzgggFBJjO/g/2b6mEh1F9pJecOP8kqM1mjSKtQXqoJ507oNDY8OFgUr?=
 =?us-ascii?Q?77/kkiwBs1mWnS0fsQllfiY3xs8vC5deJQoPpekxk8mY9wywIwI2iwPIAiwx?=
 =?us-ascii?Q?sJW5NDyQyxN7pCPMHAgUQfe8vavFGaj7Qr1OuEVNOszW9jy5ilKq8cvEEmsu?=
 =?us-ascii?Q?zEw+Tw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93cc3163-9342-43b8-4f67-08dd4ffa5541
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 08:57:54.9662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FSe+efnQvksgzWOJn8CVHA3XiXJooPPuZEaBmD8yt2Zh4tbY6oit41Q6UJ5mH0uNAA5jzxEyQWeAo+tPvXdSFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_005803_799741_E73B2DD8 
X-CRM114-Status: GOOD (  10.44  )
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

This patch series adds support to Run/Stall DSP found on i.MX8MP via the
reset controller API.

Patches 1-4 apply to reset-imx8mp-audiomix (should go via reset
controller tree)
 * refactor code, introduce active_low configuration option and then
   add support to Run/Stall DSP.

Patch 5 applies to imx_dsp_rproc driver (should go via REMOTEPROC tree)
 * use reset controller API to control the DSP instead of directly
   touching the audiomix registers via a syscon.

Using reset controller API was suggested by Frank Li and Krzysztof
Kozlowski in the following discussion thread:

https://patchwork.kernel.org/project/imx/patch/20241210125338.104959-6-daniel.baluta@nxp.com/

Daniel Baluta (5):
  reset: imx8mp-audiomix: Add prefix for internal macro
  reset: imx8mp-audiomix: Prepare the code for more reset bits
  reset: imx8mp-audiomix: Introduce active_low configuration option
  reset: imx8mp-audiomix: Add support for DSP run/stall
  imx_dsp_rproc: Use reset controller API to control the DSP

 drivers/remoteproc/imx_dsp_rproc.c    | 25 +++++---
 drivers/remoteproc/imx_rproc.h        |  2 +
 drivers/reset/reset-imx8mp-audiomix.c | 86 ++++++++++++++++++++-------
 3 files changed, 83 insertions(+), 30 deletions(-)

-- 
2.25.1


