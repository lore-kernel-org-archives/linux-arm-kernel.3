Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C13ECCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 16:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=prh5Xa+MWWrHt8ZPMriOAbbeAcOTE0xqwfR01338IqU=; b=bXJFlF8mrBEPH4ttDIk+dDZzP9
	GGuQ6kARmvw0Mrp8G7tnSnwcjIvjXw+N/O++7gmRPK5eGqMBHYFCanqRBFOpF9W86CoVOS8u+W/WI
	0K/PQnao4gzJisPnE/jUi04iGa1X6bD6I0AcCc6e+y/V+kr3p3zowCs8Tq5WjiHlt3AGkHKtAMVnf
	Rryj0L+vz92aP1ZOIXJjaS3v3YwnPMsORQDgIQUSbLUWz5EMe4XCBq1Hv43gr9Ik07xiD8cbfWj98
	Ny1GnJrWLcVzHbw/ARA6BY+A7eakAJJKbNpWO3UTM06OGDNLe+5Ah6Ig54E+tZA5iHXXmM0d3NDWJ
	wk/VzvDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE9G9-000000024c9-12DN;
	Wed, 29 Oct 2025 16:42:53 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE9G7-000000024ar-0w5B
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 16:42:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NiiVrOiUn4ueTKyeHwfYlbXuXauJS2p0zSAY5Ku02FJNdZR4U/lmPzrNYeY+8WVWkgEV6JGIhKQdRIhl/LBZxc/5U4kiUsHrNrjF/EKjjAJGM4gpTOqvEOC2gA+LF7vWLxIZbyPNVsIcVpd+WmN46Ib5SQZLdn/K4VjjQ+mTg7ScL32p0ygb/0331cDkf5g0jm526npzEqCmgVe+kM0my5OFOolZUUjxzeORilhHcKw//I4QRAJYy6tRrL5ZwdodeP4L1QXlM+F3Hc4VxTpyH+bkDT+aALrLS5yTUYdphLxDRQcWK8Wwz0ubp2Ooyw9ZVx9bLRD2XDnw3+zxAUhMQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=prh5Xa+MWWrHt8ZPMriOAbbeAcOTE0xqwfR01338IqU=;
 b=fi/i23Z9SNMM/xZvYF9TxXMvPOI1U+S0MeMs26Hs5gXIAJsRfOaPtvE1Da2VWGcQx5+KRwS2JbvJvaR725Eh0Ow/cqV2KprvDpKjCtXjKVy+skqw9PuMm4LJD1dN2hKmJPeycRSOSoXcQMQJjTRAI8msoTdpwBfjBQrVWox9BXrbc04kV7GjbqfZpmnvdYlC+csh3JmjbnzpdNYKJ6ASWXg95qJu7IZV3L/dQjaxi2o92Ser0fSY4avaH8ZWA0WkTsGeNOno5OA8dsARGPJJ14Cz/2S97r8lbuNeI3EAHufV2l9Yeta1/Qn1FrwFUqZY0BfqAC86raKB7p5YNV6d7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=prh5Xa+MWWrHt8ZPMriOAbbeAcOTE0xqwfR01338IqU=;
 b=oMxxcJLGOvhO+W/9sYTvRbmyhKYPCFTKwqIvs3G1sM4pDxH4Vaz+wo7DatUyIMc+K91uR16b9gHfujYhSV6hUVI1xKUB6L+nVk3yNBx2O6f3F+NSlV9YQUfphA8h16h7tnJMz+DxGtfMVQDMbooQdoRXG5mEN7sWHnc3FmzoHh+Dr5sXp62v0iueq/3XWvqrvS5KwB9ImFdSg5mvMDLK6iPOwvwcomylvPaWvwk5OCbbSelHQ9J4dBM4jUWWaM5kB3IyAHPXq9qbyjE42EkqAub5rFWcb7Ht6hebxbMuVTR54yy6/VyyY4qkJvg0TRYzu+rmMaRvs3k36IXR3W7Wqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by AM0PR04MB7156.eurprd04.prod.outlook.com (2603:10a6:208:19b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 16:42:46 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 16:42:46 +0000
Date: Wed, 29 Oct 2025 12:42:36 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v3 6/8] reset: imx8mp-audiomix: Extend the driver usage
Message-ID: <aQJD/I+fPNobYBAW@lizhi-Precision-Tower-5810>
References: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
 <20251029135229.890-7-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029135229.890-7-laurentiumihalcea111@gmail.com>
X-ClientProxiedBy: BYAPR01CA0064.prod.exchangelabs.com (2603:10b6:a03:94::41)
 To PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|AM0PR04MB7156:EE_
X-MS-Office365-Filtering-Correlation-Id: cdce5159-6eae-49a5-1f19-08de170a3081
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?i8P1e5TG7S0qcGPJbQv+mo5NDu5lSWj501f8ggxiadP85iSYcfIBeHnwFRPG?=
 =?us-ascii?Q?OL30dXhhDfjB2FUH2HH8Cqo+wwVU49dV2U2znuN5IhsRQXVj/syEd6QSE8uE?=
 =?us-ascii?Q?0M4GlTD8RQy3x5i/F9n7xWpt5Vnu8stFLKUKI4GAlogzPUJ58CG1LxYAnCOA?=
 =?us-ascii?Q?tl6G3UN/lBmX3ubWby7Nfg8gIbXwi/mfvHm+JGerq2djkavmj1qCCxaRftAR?=
 =?us-ascii?Q?9MIFSYsnWbrMABFJ0YTUzLDc92lLaIY+uQj+hHQ6mgDBb/WYqVi6Tq15f0WV?=
 =?us-ascii?Q?kg/8nsnfod8dt1wjSoL+o9gLzEjOJRwxvfWHOpMnY5NAYh/+gHSRXvdpngkG?=
 =?us-ascii?Q?L41sAAKF5x1j1l2WJRq++WfbVjZSaA468cYKylCpGWkY/mPMm7SAVwJGYiQo?=
 =?us-ascii?Q?DrazqrUOsWCXTvllIKA5I9FNgaVMYwQrxyrvfcz/OF4GRvoKFqFAEbWVYXQj?=
 =?us-ascii?Q?kJGmhrH7zb4XH2OX78Pe8fB+f+sigkZ/dBZbBPS4wslJr7s8KWSmnn3nCklB?=
 =?us-ascii?Q?ZWK/MSSkPz0ph1mFn7s5C/PGri5vbAz5ZRUV0yUZDoPLvxr3zSGdD9TfF3qQ?=
 =?us-ascii?Q?ZJP7fI2gSdVsfN+5ArPwqUoGfVHRXPQgrnqgwMYJX/w52wuwOYwPX0Z1En15?=
 =?us-ascii?Q?xgo7xhcREDwThFVyB2J20p6K/DlsDYFramrcs+Tg/ou0vdB22E+RrG/VX+Rn?=
 =?us-ascii?Q?885T/y5SzeHsKMvZaqFtZ6OfkOOaUd53lPOsWsRPH3N5Osr8dvPwGfqjSIPl?=
 =?us-ascii?Q?8gStOyHl28ohyQHHo40V77VpAEUMbCEMfSD14UqipI2jOJRZcZ17cEosbxHe?=
 =?us-ascii?Q?J5Bedgc/nomzb8OW6AYbjK2QCAmkbhMDr4X9S5Am5g9ZQtKOKCMB6NgbYCc/?=
 =?us-ascii?Q?rm8MzrWJ9k87aqr1EMPfNbyOeJifYfhq8AnXdsgdsRV12WvWpbj9jWGaR4ui?=
 =?us-ascii?Q?M8fVieY4O4CFfJ0TKFR5AllniSD1/jmC+5gz7qjXRFmNS6Ik16MiE+94pPYG?=
 =?us-ascii?Q?URfvqFSPAq3Wxpvsyf+VQH2oYI5L+kR8kDMRPTzABBE3ZOsWQyonFKprYkQa?=
 =?us-ascii?Q?LnFJ2bR8oc4LtkcHTVqZuU0fvW2+GP5uaGWciXNha4dZBKFsdSF0UJp+QOZ3?=
 =?us-ascii?Q?kSq2KRgSYGzr5thw3O5AYDWwSUzraLoYpzKiAN5hd/Wi2Mlm5NLcJ7gNdvt0?=
 =?us-ascii?Q?RZXKNM/WZk6aQi/ETNlmFeda9uFxaFnIr6ToKqaLbsjvoT5RnVtOI0mY5I5M?=
 =?us-ascii?Q?Oqb0u6gVJYOemaORzEFxEecObmoK9ZrsPWOaYWRf5BmD4rFbDV2YEyZCPeQx?=
 =?us-ascii?Q?x6C4hfsSpMpIIXyQanGIPejtRK8CYt+F4BCBG3F1NVoZ52e8fWS7nYm0bbmS?=
 =?us-ascii?Q?w5tRx+xYDDz0ydEZHalK+5rxmiJGV5HBJFpQdiJ+jaLHtumQn1+R1ooPwwAv?=
 =?us-ascii?Q?7RxNWDZh1J5Sii6sPF15AGhZgifo5MogBH+ar4WywUTFqKgI3oh4IdbeVE3R?=
 =?us-ascii?Q?0IyZvBzu9Dhp9DkFqLI0pioYw16piCoTKQKB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AOn5Euq+vlyBwtauHP9HK6ctwCJrsUzGdugqScoy6bIugRu96enTGOX57nPi?=
 =?us-ascii?Q?hcH1e9sXuJsRpRvbmB4HKGLB2/OW0U2JkKTlOkLku+gNDEzXVKqXEPcjoR5p?=
 =?us-ascii?Q?TBG1WsVgWIax7dSDzvgYR8nqwcq3S6Og57Q+LxneWxVW0WFa6UD9E9UHwZN1?=
 =?us-ascii?Q?typLHcdYhms72njYqwoiGIxdighRJoeeJ2Yk5VYpW2333EPMHQWRO8DePL8+?=
 =?us-ascii?Q?tUnIqjJSxBi4x0/gvykAZRP9QLi+jwMVK9V9nXy/5ZjiZvHEHurOpB0HgkyY?=
 =?us-ascii?Q?iQr6fShh2mnHH/qYLjsm9w7UK9/97mtSTVou/ugCKBGpdIyVEObfd9TacG+a?=
 =?us-ascii?Q?Qs5IumXY70LouovdUUs2bmBPhi1KPBxZ0FNAE9vjQgdkuCMD35DK6bUQ4LEl?=
 =?us-ascii?Q?gCTIL2IHTAn+ohyBB5aTG91NVB1cA5XhqUqa6Fx13x9FijZigrM8LqJkA6Ew?=
 =?us-ascii?Q?ASFWtigtUswf/mptzNDnrA6w1SQw6DTWh/YB9G0BxXHdDKLfjDjG7W/Pisgt?=
 =?us-ascii?Q?QJaQQHwHMRZO0ip4z6p8NgHB0FhlEwDGrpb18MAUS51sDF68Oy9SygQitcRs?=
 =?us-ascii?Q?336PbFVvKqbTbrCXR0DTQwP25oJRrCicFeuCPHGwncdHC6pFr9Pd2LcNq5eg?=
 =?us-ascii?Q?ewFbruUYekV6frb91EJfUDRISCIkyi1RbCy/pQgz6ErcjgKU33Ua1qq7Ni5Q?=
 =?us-ascii?Q?2zwQaEcSSppVFav8VW8CCRzMJ3+/Z5B1P9jDlsS2/Qk7+/SjSiiaEo8H4rQI?=
 =?us-ascii?Q?Xu7bshsf0j2NgA5pe1lirScbiT0pLLW7Jm01vGH/i3l/f9FlooPtPtHtQZ5r?=
 =?us-ascii?Q?mq4KzN7w8Lj3hevTTpAI9NypdnaNVXsBmJKSpRZ4pqoCJWPbhGkUacTBU/zz?=
 =?us-ascii?Q?0EiCvNO2RBlKDv5El0FNnE/5vAEY1+4IlwLtOPO8h4DV9pWqSYS0sOC9m+Ng?=
 =?us-ascii?Q?t9OnMsM2RlZLMK002uS+xRCS36JVQEKu9U/PD1IwtROUTZNEy2VLjyNCoV/4?=
 =?us-ascii?Q?ZWZ/11Cm2t6XBzzF2uwOGpb6EOw3bhUGWzPy9G8b3X2L5yu+QSlnVb2OcA/A?=
 =?us-ascii?Q?CVFamP5pqbHEfzMor9VLNf3fUNzak1gANmp5JttoRH5Wl3uJeCfCAdYKMP7r?=
 =?us-ascii?Q?bjBDTIdYVMNEtyt3DUtlqb1xFheefHM7wz1S+WywOUVjSfkB1jT3nxC0B6vc?=
 =?us-ascii?Q?FnEO/T/CDXbc2MPdeaD/P2tf+Nwxxg494GenNIgFazmOxvcH3BvVn0Ywordg?=
 =?us-ascii?Q?VGpqMyDWP6N5LI1kvflWbx79AGTE4H2K9JhI5EWDh119lGlpAFwB2IBaWGqo?=
 =?us-ascii?Q?2+dXZXluEa4/A1fu+wwGLBLXMAVzoK6vu+vbXJ9mvYJQU5O7wzEioWPGO9R+?=
 =?us-ascii?Q?J3O6DER6AR4LVS5e7MDZIFwqKBexbgMXNrckdnrsScOgYT/TBY2BOSnfgOxA?=
 =?us-ascii?Q?0ekmWQHY8FFg5J/V1yKdsgNnx71m5hEfeqDzO/vUE7f18Wse/NEKjf97/up+?=
 =?us-ascii?Q?0JqsxJOZRFUsvsCaW10Ia0sX9T5RXvo0knC2AY5L4m+EnfzCw6J99lX6MDtX?=
 =?us-ascii?Q?Pc2kSzXwQZ6kPp7Jj6A=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdce5159-6eae-49a5-1f19-08de170a3081
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 16:42:46.6034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VxSZXY3EPoKrtpLnGwSldPqLi3Zbn9dHpXqYNcLH87+BsgXLXPa2RU1n0yPzH1N0h/i6YkiyOMMRKSHb3uzsVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_094251_264602_DFE58087 
X-CRM114-Status: GOOD (  23.80  )
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

On Wed, Oct 29, 2025 at 06:52:27AM -0700, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Replace the previous approach, in which a single reset map is used, by a
> per-driver approach, in which each auxiliary device driver holds a
> reference to a certain reset map.

Needn't "Replace the previous approach".

Replace single reset map with per-device reset map to allow the driver to
be reused for other NXP block.

>
> This change is needed to allow the driver to be reused for other NXP block
> control IPs such as i.MX8ULP's SIM LPAV.

avoid use words "this change[patch]"

Frank
>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  drivers/reset/reset-imx8mp-audiomix.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
> index 3f6d11270918..5ee5a32c6950 100644
> --- a/drivers/reset/reset-imx8mp-audiomix.c
> +++ b/drivers/reset/reset-imx8mp-audiomix.c
> @@ -23,7 +23,12 @@ struct imx8mp_reset_map {
>  	bool active_low;
>  };
>
> -static const struct imx8mp_reset_map reset_map[] = {
> +struct imx8mp_reset_info {
> +	const struct imx8mp_reset_map *map;
> +	int num_lines;
> +};
> +
> +static const struct imx8mp_reset_map imx8mp_reset_map[] = {
>  	[IMX8MP_AUDIOMIX_EARC_RESET] = {
>  		.offset	= IMX8MP_AUDIOMIX_EARC_RESET_OFFSET,
>  		.mask = BIT(0),
> @@ -41,10 +46,16 @@ static const struct imx8mp_reset_map reset_map[] = {
>  	},
>  };
>
> +static const struct imx8mp_reset_info imx8mp_reset_info = {
> +	.map = imx8mp_reset_map,
> +	.num_lines = ARRAY_SIZE(imx8mp_reset_map),
> +};
> +
>  struct imx8mp_audiomix_reset {
>  	struct reset_controller_dev rcdev;
>  	void __iomem *base;
>  	struct regmap *regmap;
> +	const struct imx8mp_reset_info *rinfo;
>  };
>
>  static struct imx8mp_audiomix_reset *to_imx8mp_audiomix_reset(struct reset_controller_dev *rcdev)
> @@ -56,6 +67,7 @@ static int imx8mp_audiomix_update(struct reset_controller_dev *rcdev,
>  				  unsigned long id, bool assert)
>  {
>  	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
> +	const struct imx8mp_reset_map *reset_map = priv->rinfo->map;
>  	unsigned int mask, offset, active_low, shift, val;
>
>  	mask = reset_map[id].mask;
> @@ -140,7 +152,8 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
>  		return -ENOMEM;
>
>  	priv->rcdev.owner     = THIS_MODULE;
> -	priv->rcdev.nr_resets = ARRAY_SIZE(reset_map);
> +	priv->rinfo           = (void *)id->driver_data;
> +	priv->rcdev.nr_resets = priv->rinfo->num_lines;
>  	priv->rcdev.ops       = &imx8mp_audiomix_reset_ops;
>  	priv->rcdev.of_node   = dev->parent->of_node;
>  	priv->rcdev.dev	      = dev;
> @@ -164,6 +177,7 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
>  static const struct auxiliary_device_id imx8mp_audiomix_reset_ids[] = {
>  	{
>  		.name = "clk_imx8mp_audiomix.reset",
> +		.driver_data = (kernel_ulong_t)&imx8mp_reset_info,
>  	},
>  	{ }
>  };
> --
> 2.43.0
>

