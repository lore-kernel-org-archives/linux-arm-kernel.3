Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 794AAC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 18:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BXeEJCjPoPxjnv4tSbODga6+fdlDrTO7SevdKdGGMEc=; b=Jc2MpG6U3DVxvQ0pqUbF9MUZAY
	SCGdTKKVNxBtaGNTw0yjeBi+yNsqdDfzMpr67tgKfTGAm/wLbxH6Ds7i5kVPV2wI+FI4nhzpauPZ9
	r/KIK6Ltdaj950/X7VpAKbaZPd2dRhEH79TP3p9R3m1v7IfPYiCC1SxmrBYUikuR/gxeQ0dnF0Ahv
	W/yE5RB0gvTO/d0aTpFvlSXytcv9jZdOaiEWTkrDTzQN6f3DMxmCPqlF9Q9omF1XzufTyxSQ4xSU/
	3l1bAXEsctSNjAB670cgjkJylwP8fa7UUzjUinPfRscFBBO4C7cVq+4oWboutypTR5RsCbY/VDzxY
	lOTqqp+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZwB2-0000000Cj9a-3EAw;
	Thu, 10 Jul 2025 18:39:24 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZu55-0000000CO9K-2XN1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 16:25:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y+WIEQpBuoog7S6sr5Zs+AAh+crFUGz1Q+hbgzjoeyr5QRIEkoj5MDsBq09xD4Rbsgxugwe8kTxM+tVJXmkL2AEW+laTAz9qnFK0T7/O3A0ehpcg27LWHIRefkuG4yC9VwP9dvHMyzuo86PuLP/8Dw28gyKicVPti3dxWcK23bt1EjF3xiFRpG2K6SmxM9pIxpnHvZGkm/DzsxAj9V+Nm9IHLMy6bC+Uo7TJFT0sxPY3tEsBHqRCHLYTwjmrXC9MgdP2tLsLkzcxnnMH5XuBapA5IryDd4DnrlLx/NXIpDEk89Rgm71WlqVymQ6GwyEMy7f4Q2bnsT/NX5hICNF5iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BXeEJCjPoPxjnv4tSbODga6+fdlDrTO7SevdKdGGMEc=;
 b=yFAWsxEGFU7+lRM9v89wS7/+ORqS3Z0azAlHu8pFCt5yck8QEM8nF3COl1SUvMeaR/SmoC7N6Oq1DQSgfPc9fi0FlqzLHfb5VCaQMhfRXVSYqIatFS9wHDU4257/P45fV6GqB0JCnJO/clWEeX+HT8o3VjCi7KfDxSs/+acCxsx9xCTiKbyhjWrXV8gMpasPHVTpYLqCRfoGzXekcu6UqseEahNScGTC7hYYPDtMSm3A0idEC2rLcjOFNCa8gEswIAWApzGZW/iNtxiAC06wiuC7pvMJEedk/GqwGLM0rOeVyofjS/F4or+vVBU/PwfEic22f/uUg+z4a8Fxn8YHIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXeEJCjPoPxjnv4tSbODga6+fdlDrTO7SevdKdGGMEc=;
 b=T20/0tvaV3gwTGaPms2eVUwUfixhyytFZnKQONmiIhTn3cK3dCrRJ3jcBuDSN/ehYdCHZDDnoWK+KcSOx3uO1zWjy9UWlGh4XiFPk1bsCFZyiLCsQlhX3NHreHT/g1VlRbSQD6kvgy1vzoobs/bJr1rKGxcOVP11wKGKRAnv6E+3Ah49j2mEry08HOMP058/fpb75uF6zKbvQvSdFRHuu9t2+7IvskpmrhJpgg+mPK8ee4is3yksgStjocL2oe3h91eZq1706uJfatpP4TZac6WfRCkedpwLbSCGeaYN9/HxB+4zoy3fuQVRfKFi2dEhuBv6kAo8yjBYLWdmRY3kZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS1PR04MB9429.eurprd04.prod.outlook.com (2603:10a6:20b:4db::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Thu, 10 Jul
 2025 16:25:02 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8901.023; Thu, 10 Jul 2025
 16:25:02 +0000
Date: Thu, 10 Jul 2025 12:24:55 -0400
From: Frank Li <Frank.li@nxp.com>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, chester62515@gmail.com,
	mbrugger@suse.com, Ghennadi.Procopciuc@nxp.com,
	larisa.grigore@nxp.com, lee@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com,
	ping.bai@nxp.com, gregkh@linuxfoundation.org, rafael@kernel.org,
	srini@kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, s32@nxp.com,
	clizzi@redhat.com, aruizrui@redhat.com, eballetb@redhat.com,
	echanude@redhat.com, kernel@pengutronix.de, imx@lists.linux.dev,
	vincent.guittot@linaro.org
Subject: Re: [PATCH v7 05/12] pinctrl: s32cc: change to
 "devm_pinctrl_register_and_init"
Message-ID: <aG/pV0m8vNJ9isGu@lizhi-Precision-Tower-5810>
References: <20250710142038.1986052-1-andrei.stefanescu@oss.nxp.com>
 <20250710142038.1986052-6-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710142038.1986052-6-andrei.stefanescu@oss.nxp.com>
X-ClientProxiedBy: AS4P250CA0008.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::9) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS1PR04MB9429:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e18e561-b7ab-42db-38b8-08ddbfce523f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|52116014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HC2jawFrxZ8KfnhEUg5yhlJuWM7lMywPpU05be7qV+EyKBjCc59RBBtNGbYC?=
 =?us-ascii?Q?QxIxvkrQbwCXGUuhSv5W+BRLXYpSxRLVRFvzopgLsHw3xUqf/4AzwPQzVgEE?=
 =?us-ascii?Q?2wFi+KPz7k0cLddzJV8dCXhdvIflhCbxoiQBEfFB5CGvjuv45eiaIcbAaztB?=
 =?us-ascii?Q?dp/Ii2u4v6Uo486K8qjroUucTCn8myfiL9BptidZSJgPd0ERz+yKbszlz5vW?=
 =?us-ascii?Q?7BBnOyRH1umjZhO3M51STGzmS2p+WgHkwMhWvIZv2LILwxHYrEDi9kauVJg3?=
 =?us-ascii?Q?h3lbhqsz920oQ3N+q71tNL9FxEGSVJTH80ebjAE7crGFCmbN+Voy3qQz63LU?=
 =?us-ascii?Q?kx1kNsrEaeGYNq0A/Ro9QYbZeN8cOSV7o1I2q9TiG6C1YkOapZhaS9nBt6lf?=
 =?us-ascii?Q?ajOR7VL72jUvbESJ421bjDev4CdVVoFMCqldntYZlc6Ol5fqvHP1LMRagbUd?=
 =?us-ascii?Q?aNqc941HESCBGh3ccTvQHSYcEEfCABPR6xqOA/o7NzcayB9S7nT6RCos9Cko?=
 =?us-ascii?Q?1G+4OORSNmQJhJ+3mxa8BwqEc0DQmLzOfbAPBe+dbEb09qjpzswUQt9gakpK?=
 =?us-ascii?Q?I3B7xoA5nTjf3rd0Xi8pQKxdd3enUQZR6APqC88gDpjDQ4IyWo72NM1Sa5lg?=
 =?us-ascii?Q?ktZ+onAwBuSKsMnVa+jQFqK/LkdJRoJx3eYwjYlobaiN/Jh2WqxNRokdJfCD?=
 =?us-ascii?Q?TTY5yYVgkJC58t0BFPg9UETp8OpnaO9xzlrfEzrP7qOSFM13q/egsvTSuX/q?=
 =?us-ascii?Q?mInMzjSHx7TRy5TiZvxOpz39TsZUVHdkynK3TifIRjFem31xQpRLgvUPYEsu?=
 =?us-ascii?Q?sX1zr5JelZSR4h0PTWXxMCFWE2G/kspUzi1XCZi9N7yOkgZZQgVgbbG9zHvt?=
 =?us-ascii?Q?r33KGeHRPgKd3g5dHUwJLCms/Tgom386u2Gwt+Z6CLvDC9s5oAFannWHAYkP?=
 =?us-ascii?Q?Vk7r0djWQThfOFO9qvNd1+9dLu4nbYm9f+6Bv9S+Bw8kLgxd/bipJANHYlkk?=
 =?us-ascii?Q?Uyp8piukTpPRiJ1nQ3rNYbg+P2pYVafPWMaDzmStiAuKgSgh6Q+9ddCgB/Fu?=
 =?us-ascii?Q?qIkQP+NYH/10VVNpKzl82asTpw15Fdkdvb6VmWp/05xucOFA8uJYF+2XKH0M?=
 =?us-ascii?Q?VGGgMp/PLEkLDAFxdk/jox4i0hcOIV1EPmNnH1FJb5AVQxO7GZTEsDVIi3xZ?=
 =?us-ascii?Q?vkANGUwgRupjz/tmOZ6Oo+jhecMoaBtzVtnQr3vL1wiykwQgbT64MHyyynAn?=
 =?us-ascii?Q?2x3Au90sfi7OxjnFSDmRxY29v0a5EVDr9XCIALBwQasFOJYJoCVQCYAKptca?=
 =?us-ascii?Q?TbTnr2KpqRF+joatHKTo+pPGVkhYzZoDsVEjRJkJFpqUdDltifIEixJpGVN7?=
 =?us-ascii?Q?97HUkxyvfqyxOvTYGFhwRj/rFFZw760zp6sQRCL6BUufn6VPDwi+SDHfSTJ4?=
 =?us-ascii?Q?sKcnsG3WQOl1Mw3rYmIQOw+F/Nk2J1R2VD89lthuT0uwWfF34P9KKQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(52116014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?573qNlmElogmy+n+tKDTicg9wtxQBQtCmuRuTUYb+S7FZeLZv/9bMkmMVFaS?=
 =?us-ascii?Q?Y1D5oEM7akbzJR6GSBK0qxMIb4vINWsh6oKTer3VGrxnMqN4KND48/JoR4nr?=
 =?us-ascii?Q?xgcxN1L1JzZRnHLJWRg9CSTbS7DZ8t3juYccOuGjAA2c/9/C0m2DDARNWM7E?=
 =?us-ascii?Q?XJGO14in14APznrC3ZgjZoUh2eXpPGUuQzYU3EAPUFwDeU2cfo6NrjHY+HW2?=
 =?us-ascii?Q?1pRnFUfIJp+15zP0mXPKKPN9XOuJqJlVthb8eUstPjwzDxTcNiNAa3kss691?=
 =?us-ascii?Q?TcNz3rZFB60QDFDiAJdV++1G6fVqNoqNzGWC3DYvpMcOPpdXdfnbjAwL3cHI?=
 =?us-ascii?Q?NOYYrmj0+n20TlJsNrTYOxopF31MW0JOxJzSlZi5arZdtsRWNis0g3RUblfS?=
 =?us-ascii?Q?J3fslt8HS/NiQ3OxqLk6HIm8NqSs8g4B/wCPYTonyBmZN2i6QS5Cnhu3XXNr?=
 =?us-ascii?Q?6iB0Yud9M2UyQpKbia7kqSB0usEnxmyTrd2FXRiCeDjOGAi0XnRa7HXWpg1u?=
 =?us-ascii?Q?89IM/HQnKbIsslpQ9LARAV3mSZSYJUTFDrUS1FprLRmp3M842wnpiS6glJpG?=
 =?us-ascii?Q?TxWi1syM2b2KE3wxKbLaDdr9vrJGHB1QZWLHMvOiUwbMWrsvLK8tiP8W01BY?=
 =?us-ascii?Q?0kvuZKieKIATXT/jrdIVHLP6ugxtMW4pfKlh7LzI9ES0mAaYcDlNvcsKlrv9?=
 =?us-ascii?Q?GdJibS+9YlqDkw7aRH4efBJg8MLYvlMI1DSqvrpgRcPxppGiPB/g4Ld9uAex?=
 =?us-ascii?Q?JIKui7TwtYeDGhUQh+YyUzr4FnJkRNDNmARiRqDGZdzYN5pq/dcdpBfPuOHv?=
 =?us-ascii?Q?96Fu2g3jftaGKG3SUh/cT1Z5HNz55CnXeIyF4bn2PsWTrcSsK4MMrLwxZBZS?=
 =?us-ascii?Q?oXOnOJgTA3LVW3k2j2Ma9emm68GxzJUBztAXtGeeJBbOZ+Hx/PjJocA6Okxz?=
 =?us-ascii?Q?MtlXytS10wX25fBN4y/Syxb5gJ13MLV+TrYg9uDhedDopzBOnPNF0MxB7KOV?=
 =?us-ascii?Q?3JghjNp0dp7b+Ta6QsKWugdFV1WvHZ2L7iL7XUTMLGkH1C+LiFg/3bMVootV?=
 =?us-ascii?Q?xJJsa98uVpIjiI7jmoeZk8ODZ9UcX3PXqIKjWLDeaoqutfHWn/i5wTBzaAYQ?=
 =?us-ascii?Q?joPpPJCTO4/Hl4mcsPoUvKMIm13c2VpwWPbT/51rJSjQHsPiPBRpoPx/qCMd?=
 =?us-ascii?Q?6Dt2FF9auux6wh751SkDrYeDdi1lPqcMsQvsxZ0Q+wKUfVSEzx95Ki0X5VI5?=
 =?us-ascii?Q?Li7gxDrswdiUKKSpqZeWsggwxXYriQEUg4qlQE9opPQfj7mAdp1wiI34qwpI?=
 =?us-ascii?Q?A7fLA1VCGjUcCajWqN/7VdLTWKz+aAgCPeGCmN9Vi9+c/QEKt+cOHB5eyaLY?=
 =?us-ascii?Q?BU0HwIQ6z1lqJv8eMlXb/4Tw0fD5Sz10escpCz6esEoBZbC8YvqfljVdhFkh?=
 =?us-ascii?Q?Cc8VxjJuk1M6drobPdWkq+g7k7pcmcC/9YUh8Vq93OKl5sG7JzAes1EQTj/Z?=
 =?us-ascii?Q?vacpKqM93uq5JC9KAA5QaGj0SKx2hdqIXa3HG0QyKFz/ifrOJvWPDr1SH7Kr?=
 =?us-ascii?Q?zYhEkjxdVUySw1mgoJxnZY94aNBH3u4DCHawTqfh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e18e561-b7ab-42db-38b8-08ddbfce523f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 16:25:02.1897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q7jD8I5yHxN6gm7H1MwgAZXwpkC3HHRHEt7YJxyaHJjcMv16a3SiZwF6+osCV3eLq925PaAOGiv26uI2s7BUHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9429
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_092507_661843_4B6D5085 
X-CRM114-Status: GOOD (  17.89  )
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

On Thu, Jul 10, 2025 at 05:20:28PM +0300, Andrei Stefanescu wrote:
> Switch from "devm_pinctrl_register" to "devm_pinctrl_register_and_init"
> and "pinctrl_enable" since this is the recommended way.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pinctrl/nxp/pinctrl-s32cc.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
> index c90cd96a9dc4..c03dac643cb3 100644
> --- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
> +++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
> @@ -973,10 +973,10 @@ int s32_pinctrl_probe(struct platform_device *pdev,
>  		return dev_err_probe(&pdev->dev, ret,
>  				     "Fail to probe dt properties\n");
>
> -	ipctl->pctl = devm_pinctrl_register(&pdev->dev, s32_pinctrl_desc,
> -					    ipctl);
> -	if (IS_ERR(ipctl->pctl))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(ipctl->pctl),
> +	ret = devm_pinctrl_register_and_init(&pdev->dev, s32_pinctrl_desc,
> +					     ipctl, &ipctl->pctl);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
>  				     "Could not register s32 pinctrl driver\n");
>
>  #ifdef CONFIG_PM_SLEEP
> @@ -989,7 +989,12 @@ int s32_pinctrl_probe(struct platform_device *pdev,
>  		return -ENOMEM;
>  #endif
>
> -	dev_info(&pdev->dev, "initialized s32 pinctrl driver\n");
> +	ret = pinctrl_enable(ipctl->pctl);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "Failed to enable pinctrl\n");
> +
> +	dev_info(&pdev->dev, "Initialized S32 pinctrl driver\n");
>
>  	return 0;
>  }
> --
> 2.45.2
>

