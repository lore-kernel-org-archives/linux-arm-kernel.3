Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1A3CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 18:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nuZ/ZtIJbh2l4iAMz9HaJ6b3OAKDrpHqX9KGLFerUEA=; b=QBYPWqeOh80J5zi9AqtPxbH3Aw
	v7Djb9BQH2Zc26lC2Rcef3t6HjJEMmPTc5T592JJFh1xK2Dlb4ux5kAkDSCSr6z43rmBSyR+kE+IR
	719bEyriF4QQcxTdRpvU3Jdl696qVbU4qf/2ZffFnJFQq/gYNjyYFjmHHTL+0YwQFbmZmtBSq+1J+
	R74qZB0Ji6sdvm47f0asiVDk61Xo9LPKzN8VTZDmDUM5JhBKG6JELegW2tHPlQfzRPuLoch9Qe6Ek
	QbiRSW1mWDLuemE70KYhEbvd5xs6cb9LHo1/hDTczy/mPy3UGtABK27HYqSFqB7FTOCtd6x/uoTTB
	s+tqQ2AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEuA9-00000006e5D-2R8i;
	Fri, 31 Oct 2025 18:47:49 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEuA6-00000006e4g-3CuI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 18:47:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WZpkYFcGxnfwXTlOlCr9DTsmH4omW462HmJRc/x/y57Kos7LW2wL8my5CNtrFfrDTcaZ1XVNO4KLPVF/+/IIz7GPyLyK1cmH+Zx6RrE9P9NPdSIkWvPUDFLyFM3/D8AfqPGORumUexVUgqyOaewD/AntMwydXy3ocfimRUqFvMP2v5veGr6kc1pAhqwmwUAnbyXGq+BQ94CRurbHDFihJkx55kuA2S9nvA6n6eQeu8PRwrfG2AF6svHC0g2vFwzdp3haGQO3cx5jvnkTdxkUY5WF9PRmpyOu/1iqXA57GVNJxqu7FAPihtizzWjyfFIaQZ9a1LiA8uN5USlM4jUNMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nuZ/ZtIJbh2l4iAMz9HaJ6b3OAKDrpHqX9KGLFerUEA=;
 b=F4JpVY02yvovPDYzDQB9/Plj+e3FG2kGMCn0/c4KxFSSbC+ar0XQXyTOBNgrzmoYEBJnYrLFB87m4UDAvaw5LBaglJlg7id0EtRAM4XYGhhyo2EGpvd9tYdgIp/IfxmdjBDZB/nPWvOmtv9TKW9gEA5BPBKEDVhxCW0uh/0OvQ7agIVZ9EtCL1RP4bMbc0+ufhcU8vkoeyMR0e3UZipYj/O+HbiyG2KkTGyrRU7a26CAyuuPNuL7sz09fJhfHwm8XxGozXMyU9DwVrEMJZMFTKMoG2Po8FLgorj2WOq/8lemSyGwtJwR0RW7gycJNB3BY05VFL79efYnZX9ehzpbXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nuZ/ZtIJbh2l4iAMz9HaJ6b3OAKDrpHqX9KGLFerUEA=;
 b=DsTBro0YcB3ofgGk9m4cUH/ywLjwAgzDnxMACUgXtjnO+P22zCNociURUn/7SR4NTIPrh8kZkPl7+/UnlFIaRhSI4oDrtTCtsBMjzEFHTwzhG4qc/0lFk4T0dXA4pxCgdTrTJIbUmsV5jJE6KkwSOxHwENYkXeKc9NAzPN7f7Wv+wh0+1Ov6OPXhG990rt1f9ACNsnwl8QL9Gx0Ga0S6lVo+v4W0e4ky7wkJGrKSx5Z0DhPh5ZTDlluZI82/19oku6cRl4ok5Aa17qtw+hg41mgAQiKJ2Y0GeYQNyZ/soAleTrcvqoPCtMrtqWopJF0V84I97q5r+TF4WnfCdvoVBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by GV1PR04MB9216.eurprd04.prod.outlook.com (2603:10a6:150:2b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 18:47:42 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 18:47:42 +0000
Date: Fri, 31 Oct 2025 14:47:33 -0400
From: Frank Li <Frank.li@nxp.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/11] remoteproc: imx_dsp_rproc: Use devm_rproc_add()
 helper
Message-ID: <aQUERTOtSRiW3LlF@lizhi-Precision-Tower-5810>
References: <20251031-imx-dsp-2025-10-31-v1-0-282f66f55804@nxp.com>
 <20251031-imx-dsp-2025-10-31-v1-2-282f66f55804@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031-imx-dsp-2025-10-31-v1-2-282f66f55804@nxp.com>
X-ClientProxiedBy: SJ0PR05CA0094.namprd05.prod.outlook.com
 (2603:10b6:a03:334::9) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|GV1PR04MB9216:EE_
X-MS-Office365-Filtering-Correlation-Id: f04bfd42-8e1f-4937-1063-08de18adf912
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|376014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XcB5Cw9WA05FBdrRqEGoFaytV97vlpqoe4twjvnaKDLnSeAcd2OU7pkKsibz?=
 =?us-ascii?Q?losgTtE+br8gjQDhgR7vGC9p59zAebFcYvmiBfNJefEoQ/sPNgNx8CM/Bbxb?=
 =?us-ascii?Q?gYXitBxv67qaeviqVlYdx0cofBpCZ/n74rHR6sVc901To49KJv7+mnMg2kCa?=
 =?us-ascii?Q?FqeL3D+449nYyRAW26HdsPZRe+fT2qyFp0tL6n+/gabAi0PB82iXkaSwThqc?=
 =?us-ascii?Q?X/Mea30Wkc0RQLls8Dele91XM54Y05N+C7KYtAfAGgFM/3AIcfc50v/X/B/Y?=
 =?us-ascii?Q?TG84VbJuYmb9zTdj9HgQ+8EmI3VhF+pK3ZR6b2Wj5chLK597zO3E8VKkerS6?=
 =?us-ascii?Q?PnSo5Gx3hOk8B3hNso4zNLNwvpw4dnjO/dK6Csh5ivLGzjwt3QTYuhYfz84B?=
 =?us-ascii?Q?KZSmOBIwiyIHE7tPMN+O4ULd5KeLB+X644JqDu4itcN4LldbTbpP+f3UkUn7?=
 =?us-ascii?Q?WpYGAhNETgWXSGiF/y2DRAddFx3NY51IsWtIDZUaR6iaD/SLS2td1XNIIzJI?=
 =?us-ascii?Q?ndVO7rUrByBkdNZ3D38W/HozvDaTemCq8I5kb0qY/awvji2m9CfL+DBL2o8Q?=
 =?us-ascii?Q?PggHV78T8SCz6YuvmTjeNVK5aeGCnrVKT27oZIfknNVc4jpa+E0z25gruQ9i?=
 =?us-ascii?Q?MtybCHSgVDOLESmdj5wMT4by3fqTORdmhVTRHrN48o7DeDsYDLUGlnGq1hmz?=
 =?us-ascii?Q?NehR0vOnIPDl/VRoGa139zE7U84QByRTIycsqw6MRrvwwuqEsOzbltEH8Z/A?=
 =?us-ascii?Q?Yem2q+3RNau3Zwklgrq4UYcMn5/c5SbO/RFWp5O05LM7maXjwVorb0R2pra0?=
 =?us-ascii?Q?hHKsYYLV2/U7g0vFiO9Iz+yblCFti+CY1k8dYeB00fEOYynIRzjL45GqFgjd?=
 =?us-ascii?Q?Hd0Qo7hRlu0ofMu09C1+oN4exqjNm6zPL0UlY1fP19hzZpJLGRFU0SvMaKuW?=
 =?us-ascii?Q?7+OYaDpzcqllT/aHX9ynkXHhmcxXKWy0HqosfvqfeHB895XuBUopOgSW9PO8?=
 =?us-ascii?Q?e9T0YVOnTtsx5HeHXr6V4jCG5YhWUtwY2N9SrSKrirJpxZ85SJFAuqCjHtvX?=
 =?us-ascii?Q?aKvyhfJT2gUk/xQVcgaKNk3xLE/aYruiuuWgEjSqOahIp1OF9/J3UpGrNT8M?=
 =?us-ascii?Q?xjgunOSVEZpNiws9YM6RToTqicKdXPyjMGdPdB+XJh5YHMErzCsreNAUxi3H?=
 =?us-ascii?Q?2FXJgeb7YIMlym7MszhfQgoT4siknyu2z3Ckw53LUrPenbleMULMudqBk6xg?=
 =?us-ascii?Q?7NamcnMuTKMFaU0LB5ceQIsbosUkFgJ3AjswR0GPZfWXooxyeQh2Cy4v9yzr?=
 =?us-ascii?Q?VPICsCds7e1limlzUZp3/3jT1C2rQmBr1JfwHyZ1f9xSQrSb55sSIwPCZZXM?=
 =?us-ascii?Q?C+UI52V2Rz16Pyn5MqHZ58AbIV3ZpJDpgSj06pMrBc85sBPg9doGJAJvgm9A?=
 =?us-ascii?Q?ar33aUIVjN8Ae/+hGHXlr6DwLjA/ifVn2Q8/mh6ibsi656EuEFeNR1RjkBEV?=
 =?us-ascii?Q?YSmbUjMfNfsriC0YZNxOlnbpGrGEEcdwDDZw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E47qF8pdtoDzGWP32reFjVEGtsOVtgFvVL0kB9Y4DA5ROYcfAYvYKOIuT2YW?=
 =?us-ascii?Q?PYsYO29RQLpiBpZuU1WaqApgK4GUoYX+MaHdmGsOLz6RqcTO64yzGp9Grv7d?=
 =?us-ascii?Q?fC1XLieRDTDIowE0hk3JZq4eyAYrlWlO0iWejmmHobD/KiYzoo6s+jzqMrL0?=
 =?us-ascii?Q?xUKEjM6K33EppTRO2CPJj57dG/XCqvkYNuelffevi0qZY1Hm6kyDe3bRkgRm?=
 =?us-ascii?Q?I3fx1sepE68wPl1HyNjoi22Wr8FS5zwhzvfKBtvnOFxfVj2pwyrWqb30BAjW?=
 =?us-ascii?Q?mJMYI35x4G6l1idQoE+LcaGpKu8HxCHf0A5feD+Shy23I0MjbDYGO0MRPEkl?=
 =?us-ascii?Q?doVhE6HzWh58R3joXtSSlm/p8a+NkWVQEMFTbFROWlkzEfS8J+EOZTvwbBUB?=
 =?us-ascii?Q?nL3s+WQz3HuSrzL24Dqq5Ec9Ty6QtLcgcYYgpLZp3m+I1qJx8nvWbVQoQgTh?=
 =?us-ascii?Q?/yZ5cm4LyNnbGZBptR4VtgfpkkzLdKapaaVwB6/T+FfeITtf5g8s37wh2+cp?=
 =?us-ascii?Q?iDa0PZ+V/3hyMHRvgoTGmY1dhIoQCvA/ACRgaPwEK1OdWjzGVYByb+WOEFPh?=
 =?us-ascii?Q?vNMInbUOU3AZw6p/tfWAE4bJYvtdKEtynGmsyPummr6NJA9sAWZnne0mcA1j?=
 =?us-ascii?Q?x94XXtJED2ezd67T4thSvg1nhAijTnMLQOKolzJP9HsCOa8VD/OUJiYzHSJk?=
 =?us-ascii?Q?hRyMo5AL6Ptf+nEkRsHNuZGJcG4/0MUiEHsQqqI5F8WIPu1tkcI8k1qHDown?=
 =?us-ascii?Q?7cqd4AVmU8yFoR7qn3R4La1TnQe5xuJcK23gFWbtQT0njeOddFAv9EnAWziz?=
 =?us-ascii?Q?mCt4DRsNz/ra35BCe2UTfEOGIucdcMgRVp7CeNg+7+6/ilCT04IixDUNQqPn?=
 =?us-ascii?Q?D2he/D8VpjIr1TJOu3ugMBWKUXdJD9dr4Kqtr1EXgzgJj8JcKOCiUctfsetU?=
 =?us-ascii?Q?vQ8rDRjw/xsiAFNB8hSWE7Y8BkBg2PDIoPQn5faehSTfHMRxagyDBTqfQqQ3?=
 =?us-ascii?Q?nNGF1w2YeRixeMwep7nsn0HvI3aQ0+gVJ29FKAnj8XXRfbR0dV2ZRM78SQP1?=
 =?us-ascii?Q?uSRXxROF0v0BU7yNdUG81rlX02f4qhLdWbCBAU8if5X30GlueQ430mdrd1z3?=
 =?us-ascii?Q?SkY3A9OysIUf8urRdqaad3U0tUOC3r6DZEKsGSCWStoFY5djnW6eqB574ANj?=
 =?us-ascii?Q?9/Oy/q8tZbUne+h6liriC8GDbbu/DinIq/blGzqCAuFkrXfUMYvWGaTzOCgW?=
 =?us-ascii?Q?hyVDwFh+sAjaQCEUA4iGSIjhVxsCCNx3LFW1UXi0746chPE5EChxwNVcv+/1?=
 =?us-ascii?Q?uF5Sg6N9ZCnLXEhnw6/T9jZGriwX4pegoAj/a1YHRdiBXP18FhH16eE1ugEL?=
 =?us-ascii?Q?d3YcIP/LuhazHnHKjzF/0caFIWJdY7HHo/79NEar/U5o223GZdsY95HKE9b7?=
 =?us-ascii?Q?UeMl1q3iaw/Ce86+2nY02KsaGLq3dBNDAQyfGZzkJU1X8c3DuorhdomVEeOW?=
 =?us-ascii?Q?+8WswexTDXdho0syRYiZ0oeecIcEsNAqR2sLP8ulRuZrY3vF9vaE5oeogslj?=
 =?us-ascii?Q?ywhhqt/guT3TWhBOV9c=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f04bfd42-8e1f-4937-1063-08de18adf912
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 18:47:42.2026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3jBCvNBwh3Dh/A8VDHbUVJkpdUPHn8xIBoD+WaAvdiwjR9B6/q/VsuKVhRl78dSGYWyYx71ysiAOipKx2hS0lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_114747_742785_8C842A23 
X-CRM114-Status: GOOD (  16.30  )
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

On Fri, Oct 31, 2025 at 05:08:31PM +0800, Peng Fan wrote:
> Replace manual rproc_add() and cleanup logic with devm_rproc_add(), which
> ties the remoteproc lifecycle to the device's lifecycle. This simplifies
> error handling and ensures proper cleanup.
>
> No functional changes.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/remoteproc/imx_dsp_rproc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index c466363debbebe8f91b908b3bffaa32e9bf8b9a6..df6a4126538d22ff6e02145edb5ac13c2d72c949 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -1194,7 +1194,7 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
>
>  	init_completion(&priv->pm_comp);
>  	rproc->auto_boot = false;
> -	ret = rproc_add(rproc);
> +	ret = devm_rproc_add(dev, rproc);
>  	if (ret)
>  		return dev_err_probe(dev, ret, "rproc_add failed\n");
>
> @@ -1211,7 +1211,6 @@ static void imx_dsp_rproc_remove(struct platform_device *pdev)
>  	struct imx_dsp_rproc *priv = rproc->priv;
>
>  	pm_runtime_disable(&pdev->dev);
> -	rproc_del(rproc);
>  }
>
>  /* pm runtime functions */
>
> --
> 2.37.1
>

