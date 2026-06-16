Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51278CD98E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 15:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YS17Uut1k6vMdxzdvl6RwPnesYUAKhYJa/huozXq+5s=; b=skMRMHNHqCiZGKPXN1ycx60MLk
	KlLyaP19MprKuZQNG/dkVXDRrd9LfmxVfms5wZqDxl6Jd2imQtpY+oF1n9Wf/W0Ka+zI6kBICS96o
	YCG4QpbwSc7aBIpCCKPNQ9NoE1g8Q+yFaIZLK1Ka1bTdVWs705aCRIaK4lSaWLyV4O+pe7ehEOjSL
	avsjNyjft3Z6EnG/AOSxI94LCbSeWkEDE5JaOhbDMWqKFqmlNq1Z+LxXsIoBhJghdCDoz9UupqsZc
	XFYsbRPg2PsKnVPDKbW74cfaPDduPYGM5nZUPJLbssprqt6baUpIWsrN04V7vQTdsdEc43z9yEb2v
	67Y1gZ7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVqh-0000000G1jm-3jjb;
	Tue, 16 Jun 2026 15:37:11 +0000
Received: from mail-francecentralazon11013025.outbound.protection.outlook.com ([40.107.162.25] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVqe-0000000G1iZ-2Jxy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 15:37:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OO+4E2Ew2an1/FBuRYKaUCzqRl3Smyv2R/wh9qj8p5HHx3ndjdsZElR1dr24KBHExNMJSPVAq51RstFk7BA5DrRjS6QRRxr9UGP/pUkkZ1gwjqc012oClRT1dsuNXkDGXFyJE6KS+nSVSsdeFhOQyLg/BuaB+w3Pahlz/TvVbbd1fcmpQS+4gGWaSwR3DVDJbLUDGSfHfVelViVLc4YHyWiG6/DKprQs47Dg5AIcV49ck2B3rYGUSxX7IKe8sHVq/vUU5ZAmXAxdJf78qCUfw4n+Zkax6VKtJDyKOKuvubaMX08PnVQIf3nR2BUiGnfexO+KpOlvHrhz+H9GTWKvKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YS17Uut1k6vMdxzdvl6RwPnesYUAKhYJa/huozXq+5s=;
 b=WPhDVaPiQRQM2gt6tnnTv5yE8z6RbImBG/Tj7aRqSiH1AjkPU+Q7AsaCosmPvuRbzZut5rB4ue411kvQEbtbc89rEZKWWBzhAQ9QGNMgtJ61w2Q+gCvJJxX/FdckPJGnpuqI7hjhT2LLfD6TpdIgTI1wxDUPFzzYj+8xQsH/HUpBJ1ViwRhIwFaxeDG2C+VuDiWmHbMWL4UTvxgxjCKZj9e5y4Xib12vX4qlP0dm2fNs/Ila/3AfyREfp+vcxKgmn09hzI8K2stThpYmPA9ksAei2PP+mbv7tS9OzvQPfIdeSCGmkB4UbJc3LT9saIe+Nu8SkUIPSH7dSS646R+frA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YS17Uut1k6vMdxzdvl6RwPnesYUAKhYJa/huozXq+5s=;
 b=vVmpdo9ikgJ66qFR8Up5ErsXOhGjjmekf8sL2Z6mo0Vo3nsTcKmO2zBh7W1KE2ykuCkoBJrJTBUQdC5xspwhDJ3zq4Wilz1phxq8TMNfv7gVWU+u1vGMqR0ms6kE4Rj9tdPkjB6JqUUjMekpaMxMsGj1tN4uitzgdwLOBiRJ9xxoZOiIPDIkv6Gvjm45Hsu0QU/aaAOMbedPnYJKD3Uyf7tHb4JG/mGpijFvdSIYBAvrfXjRLxf/s3SxlfIV8cKajyzqwmKb9nDx0ythATki1XRlJrqZCVO9+GXl3LPYLiCm6B868MVyRppaTkySfKYDLwmmr/XFVEfVytCI7xnuhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10325.eurprd04.prod.outlook.com (2603:10a6:150:1e6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 15:37:01 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 15:37:01 +0000
Date: Tue, 16 Jun 2026 10:36:51 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Frieder Schrempf <frieder@fris.de>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: Re: [PATCH 3/9] firmware: imx: ele: Add API functions for OCOTP fuse
 access
Message-ID: <ajFtkysqxuLV8GgF@SMW015318>
References: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-0-cb7f3698c3e6@kontron.de>
 <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-3-cb7f3698c3e6@kontron.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-3-cb7f3698c3e6@kontron.de>
X-ClientProxiedBy: SA1PR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10325:EE_
X-MS-Office365-Filtering-Correlation-Id: b49934c7-92a6-4c7a-4b35-08decbbd1b47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|19092799006|7416014|23010399003|3023799007|22082099003|18002099003|4143699003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 27W54JANriPThFfX3CRT189p4CtFGl8rvLOTGuQYRjgG52U1b5qtiXIscDbVDbmQr1/50+7hk9eb0FOp3qvvv4/9zA3COG9mdgF3vDU84u6Yne7k9Iov9WEoaPxwlh4W/j/u7Idbe6O5w67+8rcf8Mj88psFMeSqFYGqa1gBVHAbTR6fGZavR75VER+y63kCeQlfhcUAoJR3YnPcXlY5II9WLtdgXkr96+u1ss1NfPzQQjQcAEFZcFtAmxTGj6vYjn/4sEqg2s0P0Wm6r9JSEIOS31TAynX0/troGT8bv69k5XdyLiIfFZfstFHGy90qQZ3qLelyQFEv6SZBgWqqqvxgnrCBiSA4sFOy0Eqm5IJeIYld36CkzFPJbJ3u7Ibz3bC6ORoChDNyjVpEmc6GfFMT/Gc68hOGjyyEpf2x0OzvSUUrKcO0YLaTniimLk25ynkrAPxuQD4ted+U5Eo4v9JQNEsJUVbEFdS7AbJhwMx/+QT0viIrXzfS4PD6477FYbkNjQb6p4wgVy2X3IN2Cc3b7C6lH7Np3PdEKr8TUx+fd9dMVOpgkNvvboC88uxUWUNCfxlcr1k0XvJ4yKy3TxEQQbRV3CdRHLbELhzWe/3Y/BDmCx0okrVgSMTkTcjG7FsTifR0qLTprzdzo/2BLinSRlcL9vSXj+FUZjJXoYjJFL57o5jCTGZDDwfHehW5
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(19092799006)(7416014)(23010399003)(3023799007)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AxUD1PaN9hJ1LQYrXuRYCjlVoYdG6JXSmQpq5b2dHu4QuP0L8rNeT5QA9LWp?=
 =?us-ascii?Q?WHQyvH1Z+BBM6V+bf6O8jdIap0YmyiynfHSlPxL3ySW46BW5Dpjtp+5EKHOi?=
 =?us-ascii?Q?3hzNH4pW5/JaFWO3huvBPTSm2qqIAcL9CoGJ6pi+FY92OgN3lRQPptCl9W2n?=
 =?us-ascii?Q?cqVRsVUHBp7PeiKSirN2JFGg3fL42SyV5V/JjFPHK6xwN6Xs3FbciVhuu/XK?=
 =?us-ascii?Q?M34rq82d3tBYtlehLn4VCLFcGK9CAx21SgFUMyDtWgYnK2DAcTvf1ELbdKF3?=
 =?us-ascii?Q?RhB3aZ9YBcwNv4w8PKkIh7cWvBInQs40fTB5aFVlnf+JWK3SJ6JikZUVYu8J?=
 =?us-ascii?Q?28GBK8epuyFVe8QiXqZ3W1Sp1p30vt+LmFpF8u+YozryMeyUwx9zmWG2HRQu?=
 =?us-ascii?Q?gXj14/z2lT/Qi8A0jJ5rcIzc/F2Gl4g+fL1CfGszOBYgGtaCrTDJ/6jkeODg?=
 =?us-ascii?Q?HVlSrlKd+yecIn31M0CJKD7VqRNaMCYOeFa7N2oqwB8mqCwLyOYzcWRemPxw?=
 =?us-ascii?Q?Cei5B1yw26MyvIAV2YtU9Ja6dKO3XKwbTdWoT6lmFuefi6ddrG/QoGba9Caj?=
 =?us-ascii?Q?XuedS7sb4x6Uxp9xeJzTfO0XiEACqdkIrhZwiGu3blUbipw2CNcyyHiQlonF?=
 =?us-ascii?Q?QKkXlgw4u8y+eCG9OqXWdQfjq3NoiIAvuB2qpK9avRYn5uhG36nFMsDe3pM5?=
 =?us-ascii?Q?ar+F3i6hGqVxsTTd5SPLUoshfA+Te5999Ybd8ZEFj4I0aauUVP4mTEv0Z34f?=
 =?us-ascii?Q?qiJIS5sHbbczKrvDSA6zPe1Ln0OzP1CsUl4gYxXpaNLwpVxFelrg+bNQQJ0c?=
 =?us-ascii?Q?ZPc9iORGw6NnN42S+OnKLD7fxTXb2m74XCXZPxBjXirjc8vXGW13Li3H9Nim?=
 =?us-ascii?Q?B5YY5HCnyWNjxyBfF6risPmsLL1B5RKVpY4jcLcfZWqjV2Xx3140wcc/sgU2?=
 =?us-ascii?Q?jeGVoR77hVsHUW2TZ0l+rG5b7oJ6TDiGpHvuCKjpQU9It0AHbR9tWjKoO7i+?=
 =?us-ascii?Q?ELRvWjePuqBHB4NPYuKZ4ClLFDGkqjDKNa6viUwZ4SWLoa/+b+KDEqzJgs/j?=
 =?us-ascii?Q?HpohCgeqbpJoeZY5egFhTAnZAiP6fCzhLV8TTq1PX8p5nABXSVTggyCyq23s?=
 =?us-ascii?Q?4BZxO3Iu0j1/wRZ2gHjIqpoRJSmwWJj5sLB88rXUgJj8z2TofFRj6tFz0eSz?=
 =?us-ascii?Q?MPpmV2gH50omq02kLzZ6tZh/bi2UmSqRU4AJHeo1xT2+T/ISWBbI/wzuTtLi?=
 =?us-ascii?Q?NiDzCqX501ExDnN/8LZfTAjoh++DR+nvqn00x4GugnosKfZbwlanLrofhxeB?=
 =?us-ascii?Q?wuq8BMhgA3vrNkKc/s3YpA1ioLdAZEOb8TnOGuF4hPv2dhwPKq0xokKozdHv?=
 =?us-ascii?Q?XWHpdPqZnQzeOhpElooYsGhdHnDCbkFGQ3/mkY+jhzRdsHmns0d25sujAqYK?=
 =?us-ascii?Q?vOtRRmxvBnpaFpt4zkfk0nPNM0CnMNXLwTNI4GR961qGZt04OxCfTm64+guc?=
 =?us-ascii?Q?uKA38sIDB3k0xIyVA8jZpuN2ByQbdtKXIP0wl9g6R3cVwSUKzWT1xDCNbblY?=
 =?us-ascii?Q?Hp8N+n5mE04opsYiN/iryc6kwqYmAis7DyAHylnr+K9aspXP4rm2KFeFWVcH?=
 =?us-ascii?Q?GQu15i3laUPXgMZYMTb8XOO8fuOyv5e+uJO0eBPX6zsYWF2aRTXCKFiFh5rs?=
 =?us-ascii?Q?NcguLOfhZb2LGKkP6yvP128dwudDXwefcnXjC76EcoNjtEQ/EYRx7+YwQmXv?=
 =?us-ascii?Q?J1cJYoFLh0QpI5CPvGDbJYeIaZgI29IjeWlam4mCWgbFiiUECgD/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b49934c7-92a6-4c7a-4b35-08decbbd1b47
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 15:37:00.9667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a8tIwNgD36MtNjscYut3VPnIQRDFLmOEcNHeWwFO7c8+K13r5TQNZ3kzm64Ow4T1bkMhGvU0CS373ReIRH5OCnP12ZBEvaPyMg+g+qnKSsUbfur5fqPiRlqXsOedThS0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10325
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_083708_595220_9BB26B21 
X-CRM114-Status: GOOD (  15.04  )
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

On Tue, Jun 16, 2026 at 01:52:18PM +0200, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>
> The ELE S400 API provides read and write access to the OCOTP fuse
> registers. This adds the necessary API functions imx_se_read_fuse()
> and imx_se_write_fuse() to be used by other drivers such as the
> OCOTP S400 NVMEM driver.
>
> This is ported from the downstream vendor kernel.
>
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
>  drivers/firmware/imx/ele_base_msg.c | 122 ++++++++++++++++++++++++++++++++++++
>  drivers/firmware/imx/ele_base_msg.h |   6 ++
>  include/linux/firmware/imx/se_api.h |   3 +
>  3 files changed, 131 insertions(+)
>
...
> +++ b/include/linux/firmware/imx/se_api.h
> @@ -11,4 +11,7 @@
>  #define SOC_ID_OF_IMX8ULP		0x084d
>  #define SOC_ID_OF_IMX93			0x9300
>
> +int imx_se_read_fuse(void *se_if_data, uint16_t fuse_id, u32 *value);
> +int imx_se_write_fuse(void *se_if_data, uint16_t fuse_id, u32 value);
> +

This API should implement in fuse drivers. Other consume should use standard
fuse API to get value. If put here, it may bypass fuse driver.

Frank

>  #endif /* __SE_API_H__ */
>
> --
> 2.54.0
>
>

