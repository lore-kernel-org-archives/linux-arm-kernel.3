Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F46D1266D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 02:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HpJzDbjBPH9z4N/ZKH7W667KOUsviEFN8Z6/Dmw4wvg=; b=r+UHkxbN8wsgWjMDZ09QKDD4Hl
	rlkDhBA83krQx6mPR5BDK2HGH8f3+sJ214H5abGtF9ZbWbU+g7axYc2dUvq9kuOt9YcVvpozZSTud
	esC4qPqlTpMZ1XjWei7UFXqz2tYusY+Mk2J6QRxZCVwgyLW2UQFWDOwjvmh1TR26f2/Cx3dwvYXlD
	jm720HU2S/hjMZbPSavcqOxNTbTAQ9+xDDgYttTCySQU5s0p+eaj2u48ze0EgjHJmcBZ5Vhm/gw+w
	iWCrbJZY7/tYLSQKxALoysiI0HmBY8CLwrGuiM9ixSWqhgxZrZev+WgjWuOwHb3GxZdWQl9GG/CvB
	Tcu8d3iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQcwN-0000000634z-42EP;
	Wed, 03 Dec 2025 02:50:03 +0000
Received: from mail-westeuropeazon11011016.outbound.protection.outlook.com ([52.101.70.16] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQcwM-0000000634H-0Tzf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 02:50:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IRY/E4BBWEQrqocyZjhI2wiRAL7mae6QK3szE7iSArs+Lk9rKxLWxZyEKVyBlVoC228ag0TMgWAbK2QHFqzwS+V/lcNRriOZQ2X4OBUApqqrBYxOgSar6yPpAVmv/cBcjsHA/yG7dJNgKCkUKgG6XHoJkY9d6diApK3+wgi4CQ2bpvsilyRhM+/1876y0lAosyI0XjC7vRw2c8iwiLHxGB/o4XDcWo824ReHvMOuySzcEnJri7PpV6uvl2R2hbjCMTPogUhOxnQQoTIiO6RvdNG4/yMdALnQBkTLhRz9s2gzWwMkEqEE+rQoCqslJykx4RB6u1pyfE0KrBVBVmO4ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HpJzDbjBPH9z4N/ZKH7W667KOUsviEFN8Z6/Dmw4wvg=;
 b=LRQqfg4Zw0mslriDaEMxh9mGRviiq4j9QPf48juQM7dhPQlhmc8wUYvV9kNjqX6aio+OtWpctAkbj7ISVsE3Fwgs9H5PT48uBWtO312Uz2BDodFeLa/aiwUT+39Aw0xlcQ+ygNbDPth9kWrNzY1x+MYt259qXxN7odQKM7APvSyhnJsxasCieOA8wRdYYIiOxRS18BNAtSG/HXt+GAsAbynmyeq0ie+ogxbjXuhD8BQwX1D6kxvLeSDO9p5YRWXH5iYEgtUQdmBC5EhH3u46GPBpF0rrCF+Rqo/Qa5iGkHQL0d//tqwmYmNAwk8uzCITtzLPyHKdoLXsSmqNJ5Txjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HpJzDbjBPH9z4N/ZKH7W667KOUsviEFN8Z6/Dmw4wvg=;
 b=dHPfroqSAGBIvz/0A9zn2KMgD3RK6BQj0Z+XwrCgf4+ocT+DSySg+55rRtZaGQf+QfWFclU/XwN3n2GeJMNNP9la3ZWlSWOlswfOv5/Z70XiUiXZg/0Ow3pqV6GX3SzhbfNi55o0RClsh/pmJS1fJrNwNJWz8Aen+XaFVLUVt4PkflRLpiq8hl8mu8UOu2YDaxVBKEYgjrnyBCVaElBiZBPr62SPUo9Bvlh387+fbDF+Tn7bCiCaCQosp5S4VU0d+sLJybtItdpjYz9nfqboSBn3RqZpvsOv/+T+fkmc8pa25RPVHJdpPJTxBpygiNV+Lsg+LJ84fll9o+gtsLx/vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB11029.eurprd04.prod.outlook.com (2603:10a6:10:590::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 02:49:55 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 02:49:54 +0000
Date: Wed, 3 Dec 2025 10:48:50 +0800
From: Rain Yang <jiyu.yang@oss.nxp.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Frank.li@nxp.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
	festevam@gmail.com, imx@lists.linux.dev, jiyu.yang@oss.nxp.com,
	kernel@pengutronix.de, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, peng.fan@nxp.com,
	robh@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org
Subject: Re: [PATCH] arm64: dts: imx95: Use GPU_CGC as core clock for GPU
Message-ID: <aS-lEibp3zTsaR6T@oss.nxp.com>
References: <20251129143220.14834-1-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251129143220.14834-1-marek.vasut@mailbox.org>
X-ClientProxiedBy: SGAP274CA0013.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::25)
 To PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB11029:EE_
X-MS-Office365-Filtering-Correlation-Id: fa7520eb-9ee3-49d2-12ab-08de3216a35f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|366016|19092799006|1800799024|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ndYFCosqYSGanWVwsdaR1gyQLctVj7gGENKfOwizmE1mB6x8bwzas0yT6ttJ?=
 =?us-ascii?Q?MGQIjMprC04+XUdn0KldT+Hrse/ZBN6vZygso/pwpR4VJZTHBth+fiL8jkUK?=
 =?us-ascii?Q?/l89Yr199kze0ISSBl0aDZeqzZd0ZI+PGg5OXfRWykkoXAWWomvBTPUE3kP0?=
 =?us-ascii?Q?fvqHV6u/lV2E0gehhcJm5aM0MWlqHkWHineApuKJ+zwe8IhY7RdjRnr0ywaO?=
 =?us-ascii?Q?+4s+N7USOfZQfZPQkQmXd4nxD4dHz/mfb81QM+Ds8kW/wvrK6OKH+bT23ib+?=
 =?us-ascii?Q?4UtD8GlWSzpD4DDa7UIw034OEQ6mMVBiVp4HTj3suVcEhwvEjVSWRitEw4H7?=
 =?us-ascii?Q?MR3Mfqi8S4ipejlfHCXK+DUVGqOFYIZaf6Jyc2F2rY5673iOllSyDxJYBtI+?=
 =?us-ascii?Q?Pf9jISSN9JJXRlnPxyQlPm7Sew92xdvZ2DCZ8kz69iHzRVgRRAKGCQwbkAyl?=
 =?us-ascii?Q?zw1ld6cZVYP+y1d4Bu3sPzxkiQcFG+q+23U3/eGt+sExJmR2C3+SK2va7qJN?=
 =?us-ascii?Q?2Xl6c8fzKfPqweMc7qvKXUR0RBriLFx62njMnof3McCjlJEZoBjJ9ko9wTVl?=
 =?us-ascii?Q?qPJJvkDwBBDQzNUwql8A0a4f0UaNwQDJYZUxFOiQUTSQ2sYzH9QJQiOc255I?=
 =?us-ascii?Q?nG18XR15I5H2zZddCmY+rvPg8XCpqODq9lHjfjeTu/ZS1tNkNRbEoynIJQAY?=
 =?us-ascii?Q?LeeOu+PnY4ex1Gwtp6KT3nSCmcY1VGSuCxP0u5vGkgoP4nQJ1Ui8hIz0crbm?=
 =?us-ascii?Q?VpNed1Q1ADTjhRVcfYGZSB5xwooh8zXZaG9K0KU9JOJwVgYylsVAWjuzxXBr?=
 =?us-ascii?Q?GLiZmnvvzBZBrzZv8SbTay0L6jSRabNP126yKvbeEIukH359t4onaJLHQpuY?=
 =?us-ascii?Q?saHm3uABBasWz/zzEp3jVDb5lu2ue9Yxtslo6Rd/6/gCDWWkxES0Ek/0/Ady?=
 =?us-ascii?Q?64AIQFS9tOXp9BAIxKzWNMFQzM9uGdeHixNbb7Kto2taFl/5VLqpqDv46HTS?=
 =?us-ascii?Q?SqRQk1nf0eP1qUWYVcTlY7AKhPR47xW7mXslZVu8ouHZWwwJIzCNmFnqXno7?=
 =?us-ascii?Q?SQnkOorDfO5CyT/oOXRaXFlqeYqP285M6UqUK3bQmMt4NETOthd2qeyOwoz1?=
 =?us-ascii?Q?4hKcFg5xSGcK/+rvBBDYmY0QjebxMNpFBu2Q4B7kNN6RDcjsJVkrf01Deuib?=
 =?us-ascii?Q?kduN4ie0cY9KkjAqfl8ER0yu6Xs8Ir/uphA/hhOsbK9gRxKQg7Fspjgg7VqI?=
 =?us-ascii?Q?wNe2C9mGZxf3djoTk4TjvzjwD+A+TmWJTu44CMEktiB28LvuKnof24+l1Vo9?=
 =?us-ascii?Q?dEoqy5c/zsgYlmoxbRdlEl1iTWWP7uahIerh28Y9XingWqQ+QbkKaeXo0nwt?=
 =?us-ascii?Q?fF1LlZoVCR96TL855uKkz6GS3IsspJJwXZbYBl5YVXIqylXwWSsjW+k8XwwI?=
 =?us-ascii?Q?j4CpjFR61Eoc6SpWZIZ71Q22tY1hPAOCN2ZaBScPxXHhYk8P3FI0j6jfvTkN?=
 =?us-ascii?Q?6w6C24D22MlWtDnQHUz9GE+lAhdRnmzScRsA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(19092799006)(1800799024)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/w+rQ9eOh/KSR1X4k8AnAmj+3iZjwZcmNI1tJRRb3O+wny65Mqz1IUiFWzv2?=
 =?us-ascii?Q?oKwXPUEGXd+JrsinXNXIB13M4TG8TGR+iK8ibBdMkxLc9fcKZoqHeRdWgQNp?=
 =?us-ascii?Q?X9CEssXhN6a9U/Gbsa/ziN14CqHrYZXqD/P1PgO/r9CcII12mxleWZnwpNj/?=
 =?us-ascii?Q?J1/z8n3o0erkoPIPLhRR8XxmX8dteg5U0GevLdhwpj94B0v5xeZ58bEYa+88?=
 =?us-ascii?Q?0znNge8Ab9Kc7TBDxXIqBfRKG6Hf2/6GNpFc8sjgcfIIkGjRZkydijA+lYva?=
 =?us-ascii?Q?lRWD0/8AXCZIXehZwwf8FBehkD8xUrKLyQ9t6KX1rtX6mBW8n+4+f8EwsN5E?=
 =?us-ascii?Q?doXrUrZg4+uCTzSazjBY5bHmvPFa/zTcWavq2fnOFrqbR0LKwUu2BksN6OEu?=
 =?us-ascii?Q?A/XFJMz5wa6FEyEvqQ+NG3jOOxkNlsQWlsd5gdd0MfaSosgH45fliOzGtRZ9?=
 =?us-ascii?Q?nwCvOGJOPTRMhQHdpghQSpPzc4ONkdVSNzGW8Iy8QUbALMFLQwc1FxS2DS2E?=
 =?us-ascii?Q?ztkqrLT1HKAaJx5fvvarlki2L3E7XVWcj29NvAQwVFJ/TpRjGRLLNNmXXgeJ?=
 =?us-ascii?Q?NPcrwL3Li8oWXI9yO5gTHXqmYQ8Oj9rFdLgP0TJ/3VyK5l+aYtPxeu6ATGAg?=
 =?us-ascii?Q?gRSkFCssc/7lbstY4ec5Pnqz29Dsnj1cpsruhs6CQuwNCE7XL54Cdy7KyM/i?=
 =?us-ascii?Q?TJ6vyrYx0rE7Z8cyRUkx/FcYV6yvQLUj4wjztYy9Ez8GvWnxBYSMvnyy9IGE?=
 =?us-ascii?Q?dzwSU8Mb5MnPXis/UV5PgF4t7Je8I/uvt1E9CrPNU8bllq9NkBVqTdG+4Rb4?=
 =?us-ascii?Q?ejWiJKrTgjmeWF9Jg09qsTPxLxgK+SUmwui+rMNZN24+iSqpgxrtgllGgN3G?=
 =?us-ascii?Q?YaKgRTs6Wvnwu+YeawHkajybrAdK7+lHxzhIFXhhsv2/k3qPUd9e46H2Paqy?=
 =?us-ascii?Q?bQCjgxOIDjQDWYSt9Q7bcroVMICOClmLC3XJK5WjDdTQdlWgGOndnDGjAz4k?=
 =?us-ascii?Q?5rJp4C+tBD3Xwgnqakg5Vw0Jg//YJqfcdUyxT5LVeRFdhALx474VJKdcOBV/?=
 =?us-ascii?Q?M3f8PL/3cw8h55uDm6P41r5qaLjw/n077g6pRb5xdBsqtdRj5ehsHB8VtmJQ?=
 =?us-ascii?Q?c22xyzc4FuIfM9HMajqPOeNYPy2rpNvB1hX7aJJh9X3bfDGBDfGMbUpkpTzQ?=
 =?us-ascii?Q?H2jRgXLb2oLQXvLOgK/YJz3RGy8YJ/+wduwGzNCtXthuHTSRoClpSrkWFBRK?=
 =?us-ascii?Q?l0yRcG+JmbgE2p4KW9inq7XT2mfPfP1BOGl0xPxYaw6liT/HB6S2vDnXbLSH?=
 =?us-ascii?Q?/w/iN32FlVlMUJvZGFCKi/buyDBwjMTtDcMTQgjINpuPBqjuVzREY8s46hXa?=
 =?us-ascii?Q?NBmuCz8CdwbIUB2YwQ7zsoNSAX89l5y3XsBJEdiwQaZEDuTsTtOjVkvRVAYG?=
 =?us-ascii?Q?p/Qd4Ve2NFAWF2uGrXyuXLRA7Zq2yWBFAf0Itcr9+X9ML0JGYC2hompoAjSO?=
 =?us-ascii?Q?meapTyb96fpb7x9ZQrSTENl+aJ+dWdi+0SJWCU2+XcnUQ3IdlDk33rmFVNIo?=
 =?us-ascii?Q?mpAZberWsGx6ndUyKWsEW43psiMtqavNmWGGvBZX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa7520eb-9ee3-49d2-12ab-08de3216a35f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 02:49:54.7641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aMy4WLoOJvaHzcj0WC0Gx5bHY29r2qEWT+IG7AieLsIyq7tufit/pw4OqCQvpkNT7fZPE9S2Dy1p0ZhsYi2EmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_185002_163785_C1E51D90 
X-CRM114-Status: GOOD (  14.20  )
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

On Sat, Nov 29, 2025 at 03:31:30PM +0100, Marek Vasut wrote:
>The i.MX95 imx-sm introduced new GPU_CGC clock since imx-sm commit
>ca5e078833fa ("SM-128: Add clock management via CCM LPCG direct control")
>which are downstream clock of GPU clock. These new GPU_CGC clock
>gate the existing GPU clock. Currently, without clk_ignore_unused
>on kernel command line, those new GPU_CGC clock are unused and the
>kernel will disable them. This has no impact on i.MX95 A0/A1, but
>does prevent GPU register access from working at all on i.MX95 B0.
>The GPU_CGC clock are present on both i.MX95 A0/A1/B0, therefore
>update the DT such, that the GPU core clock are the GPU_CGC clock.
>When the panthor driver enables the GPU core clock, it enables both
>the GPU_CGC as well as its parent GPU clock.
>
>Fixes: 67934f248e64 ("arm64: dts: imx95: Describe Mali G310 GPU")
>Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
>---
>Cc: Conor Dooley <conor+dt@kernel.org>
>Cc: Fabio Estevam <festevam@gmail.com>
>Cc: Frank Li <Frank.li@nxp.com>
>Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>Cc: Peng Fan <peng.fan@nxp.com>
>Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>Cc: Rain Yang <jiyu.yang@oss.nxp.com>
>Cc: Rob Herring <robh@kernel.org>
>Cc: Sascha Hauer <s.hauer@pengutronix.de>
>Cc: Shawn Guo <shawnguo@kernel.org>
>Cc: devicetree@vger.kernel.org
>Cc: imx@lists.linux.dev
>Cc: linux-arm-kernel@lists.infradead.org
>---
> arch/arm64/boot/dts/freescale/imx95-clock.h | 1 +
> arch/arm64/boot/dts/freescale/imx95.dtsi    | 2 +-
> 2 files changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/arch/arm64/boot/dts/freescale/imx95-clock.h b/arch/arm64/boot/dts/freescale/imx95-clock.h
>index e1f91203e7947..22311612e4403 100644
>--- a/arch/arm64/boot/dts/freescale/imx95-clock.h
>+++ b/arch/arm64/boot/dts/freescale/imx95-clock.h
>@@ -183,5 +183,6 @@
> #define IMX95_CLK_SEL_A55P                 (IMX95_CCM_NUM_CLK_SRC + 123 + 7)
> #define IMX95_CLK_SEL_DRAM                 (IMX95_CCM_NUM_CLK_SRC + 123 + 8)
> #define IMX95_CLK_SEL_TEMPSENSE            (IMX95_CCM_NUM_CLK_SRC + 123 + 9)
>+#define IMX95_CLK_GPU_CGC                  (IMX95_CCM_NUM_CLK_SRC + 123 + 10)
> 
> #endif	/* __CLOCK_IMX95_H */
>diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
>index 6091c2713fa48..47f20e501315f 100644
>--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
>+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
>@@ -2874,7 +2874,7 @@ netc_emdio: mdio@0,0 {
> 		gpu: gpu@4d900000 {
> 			compatible = "nxp,imx95-mali", "arm,mali-valhall-csf";
> 			reg = <0 0x4d900000 0 0x480000>;
>-			clocks = <&scmi_clk IMX95_CLK_GPU>, <&scmi_clk IMX95_CLK_GPUAPB>;
>+			clocks = <&scmi_clk IMX95_CLK_GPU_CGC>, <&scmi_clk IMX95_CLK_GPUAPB>;
> 			clock-names = "core", "coregroup";
> 			interrupts = <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
> 				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
>-- 
>2.51.0
>
Hi Marek,

Thanks for integrating this downstream patch. Please note that CLK_GPUAPB and CLK_GPU are
always-on, so the commit message should be amended accordingly.
Additionally, the IMX95_CLK_GPUAPB handle shall be removed, as there is no valid OPP entry
in the frequency table, this also helps minimize differences between downstream and upstream,
reducing maintenance effort.

