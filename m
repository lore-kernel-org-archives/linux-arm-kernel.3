Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD45C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 16:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XmzKZxbBZQAZVBbivjXpFuJ1wfqEPZEA6kerZaLv1Zk=; b=fm90D1MnMCNC5G5EHEQXeRlx5W
	mTKshCScGhvJRwvJNEEyndxHQc6+VTI7d+nB33pa6mahHPRvUC9vFqoQvcm/0YKud4/+e9CMqaRzq
	Y47Z7pMe5zbkkTG286G8FjQajxS0tMHXPR7IDuQa/z01dQcUNzVoH7IFW50IQuB3GRP0e6CqeaWD2
	EHyZLiFQOxyDaJqF7SpQjFfWdSWE53tAYRyJfnEnosbUo0oVXLqQiwO64nOMOxlFH0hLh6LWyM88G
	yMofS/Q/rCAtfZka8Wawp6ua0EddaiWWv5P5TqTxaHA7hyCLn9CrGaeqELTJof+GllaoUHlQFX+ix
	larW7kRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuYOR-00000001AeI-3i1K;
	Thu, 13 Aug 2026 16:34:59 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuYOP-00000001Aco-1skd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 16:34:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d6DWRTZ56PijV/+6J4m0kfng3QNBRaIUjoiYi6diMNHHPeUazdqJR/USGVK5IiVPDd8/54bolgooNnDI5LWvPdyecc+NV2IqgedTs/XXwwsNXCgJmMIQDdrY8LQ1dFY0h3RGyY8dyDGNMOFvrN+tpLqKr1VIX3J9VNOf0gC5nOhNVekewJB/JD47vu91w+/2zLjyVxLeYyafwqVI2BciRjJ0JEiIyaN6T2YqENhrxpN5xvWpIVdJDN4RQdP6z0ate617JbxtwDi6Lsji82ouSh0tUGoX2OsWB3Ha8HSelxKKizmRFYLLKS5mxQjAD7CETrpoj5jegKzZIVgrMGpY+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XmzKZxbBZQAZVBbivjXpFuJ1wfqEPZEA6kerZaLv1Zk=;
 b=ozXEcp6gqfyh+zyYiIzlb0nEOBihptbyEdY++a32fz64gZb+pA08lKX6kCMfTWuF/ZLcmdMfyWl/C3UmbLdmgn81qC344Smkprn9Iob++ZTrHiMWO6oibTwx6CgqLiXS1Ln8UeFkdkLOjyHDmg/lXZsZ02JaILLdwvhkl1KvNbH4xtE6U4UYdsqiwyJuKZiB0wASvDOaLIma97RHmlnr9toFABHfOigZY6yG9zkKhFVno8MXcjKiuBJCxt02O6YekMKQgcwMSRJAHL18xF0AdwVf73HSi3DayMxuX7KvHm17vlBDGwHjH1VXTOp24gTDi09BBlXS90uZJ6Z4PrqggA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XmzKZxbBZQAZVBbivjXpFuJ1wfqEPZEA6kerZaLv1Zk=;
 b=B5nZ2Am8OGfPJMshZSGPNXmT/+5PiQzvKKP5DGpgtGG5xN5wGW/CY4twyzkWZE1GzuCHv5IIsXM2p8Ip8PE+S57XfogRaQL/3OTfMZhlyaYUVQRt8zgv3G6FnIDj01Li9f2RJCBNc06lbj2CmeSyfthFu1eno6Z0/F3ra504oZwGmQC12NwzDb6HmdLQq/Fmc18Ykl8Kl5D887fJXtqgdW0NVqd/P0/Y7FvaHHe+DqC6XEjXcCKKk27gAQonbs1Tv2xNnrm72142EE9lB1lMD9Db+GCy/QTXKrx6mEGnFbCIY/GPvPuAE5vipYxfktIiwFZSOqH7BmNNuU0DKVpV4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by DU2PR04MB8552.eurprd04.prod.outlook.com (2603:10a6:10:2d7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 16:34:53 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 16:34:53 +0000
Date: Thu, 13 Aug 2026 11:34:47 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Manush Prajwal <manushprajwal555@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] pinctrl: imx1-core: fix device_node refcount leak
Message-ID: <an3yJxpt_DvIYLXC@SMW015318>
References: <20260813110938.1512-1-manushprajwal555@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813110938.1512-1-manushprajwal555@gmail.com>
X-ClientProxiedBy: SA1P222CA0178.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::26) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|DU2PR04MB8552:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d04df3d-6dc6-4418-07cb-08def958cd34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|19092799006|366016|6133799003|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: rDtwywVXXzgMyZdNsBDbXnXVi2RD0sdW777QBKLLTg/VsSXjz3/GcagiZzTaD4Y+y8CGSqp3vsvCwGTLXtObdBXddrjYHtNvWqGPw2GaF3V7i5qZxjhfkOUsfaXHpN+S8meh3dt33YEw6mY2wC8xZamKXIXR3VTIq2Ofa9kAv72l07a9z51TxDRMWXRrm8cv/GJCsp5OWfG8lizneWUpnh5B3PnvX6vPfOewv6uirQmFYOsLS45xCS7u5JqdPW4MVbM2caUy3scOnuqL521A2i9QyAVqLW27LxIgn2BrT7elJRGfV6SlCQ3EymTbG9idpFQMm0gSNcbchNkjcOzUD6On0sUmdOnxymylrpcLLhqikaFPvzglTW1FY0LznQiLvwg5JV/1T4SDF50uwfmd4P7DoaSxV6LCzn45NAwQV9WxhTvriKPGPVGE+SL8RwO1ql+Z3GcpeKCYL8ggVwOEGMdNmzh6OzBq41XIE/Z+uZKqYrb9pq4javETik6/MCLIdf/tybmUsTHXl9e1DJR2XMaGRkjrItsVn35pC2YnbpU3kFS5ohfm8Lup+4QN2czlmhfOZuAe3WsBHCsS7Nx2VphPRXABFbiWG2R2pQxsSg/mGxMF8xwREt+wsKmDe2KByqLng0IZg8aZQu4+TzrxuMImNLfh6YIoqQOwfl+eKi4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(19092799006)(366016)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y4PSZkcZWIii7Z6q+mKJuMEB26w+TzCz/oimB7RifCWt6MLmqZ0h91ux9e2g?=
 =?us-ascii?Q?HRPj+fTRhwrn9bfDBOcUr2FX5vrORkwWXG5FqenjArQ0AtAkDpm5NKF9kdtP?=
 =?us-ascii?Q?R+p+jPZs8gUYzm0tpoikN8i2k9dYkgpqCVBhmIPYG4B0DKpb9lP3kPMjPWEj?=
 =?us-ascii?Q?Ct91kounVmFnZ0gYmFUyP+3cCqfaqOZRVa2ur+/Nili3Nl8OqvfXCCBZ6rZZ?=
 =?us-ascii?Q?57Iglgd/tcaUcksQsBs5bqO+OyiddM5zUaIVGqDcY/H1+Xbj03y0TNOzpZ+m?=
 =?us-ascii?Q?R1GrBh1aG7aJ7oY9Yd43+zTiIsw5MXGv12/xQR1cOfRGcPQK4GRJZPsBr0iY?=
 =?us-ascii?Q?Ko+fGpAQyfkUiVhrbF3N9Rp0fZz8mppFeHjmQdNoZ7xhr6VaEzIrCa6rkWCE?=
 =?us-ascii?Q?TK+9JhuaHBLx3xzDEoLULN0FiTagqtZt7QfNanVDSyK+hpgPYzRTQPlFBzve?=
 =?us-ascii?Q?+i6mgPNgyXzWiIgKMUMDLvokVxCs68EP4xwH7YV0+OQvjPP912YUTaPzUACS?=
 =?us-ascii?Q?sFwyyzb7eTn+hTGKVVx3hm9b6vjYQmU4zim1bMVUSBK2w6v3STuoxdPKqFZ+?=
 =?us-ascii?Q?ltDfa6CAwUe/PjFFWyztSleKIoLKbl+oJPR5X8ttMYYEHfr6jUee79E00u+y?=
 =?us-ascii?Q?qwXz2tZLR/a4/mnYYjsixoBsAk9C6FkFxiB7PptuAdC5/NnzU9vJKSphgIIB?=
 =?us-ascii?Q?VAKca+7jBn1maQdAfDVZw66Dh1kSHAgNAo0uJ77OxW0GAr38m4ArW6OKplBj?=
 =?us-ascii?Q?rpmR3ojnzHSdcrhCvPzDKml+M0aDAI3zHGSoxjjXyqBixWVbQ5vzQw6p13JK?=
 =?us-ascii?Q?YH4anVkOjDDibgy/OtCI/x5c0wkdeQLcMV55u8njKRiAJLuTcOV8cfEQ4bF1?=
 =?us-ascii?Q?Bw+DFyoIG+28s3A34FgC0h5RRiWKxyvS5wv0y8mUjmkidDxdGdotI53StGBs?=
 =?us-ascii?Q?ZjrAIYEC1PkoAeiCfrKPCgUqD6s1rjTtOR3M6tI1tQMvCQmBOrr3mxkMtpFK?=
 =?us-ascii?Q?JeglpsTOuGKU5MiVNfEr1lUa1T5Lw/dXDmSjPQ1cg1qD+eLYb+N2TvQgqfb7?=
 =?us-ascii?Q?DlhLh38ABHNzsR5hMeEclgd2fAU5KgRHe41Ky0DOQKGWdvR1t2Llq4ziFZQq?=
 =?us-ascii?Q?oTUpf1SlRl6PHBtanu2LvrGJqYS/rBdyxxPfXi70RmSRsP3HPsUH7KCqzdpf?=
 =?us-ascii?Q?UgikP8f+RUx0TNJxCdImuegnFzxeICjC0jrkopsjWJuNuX0w8ppSQvs6mTry?=
 =?us-ascii?Q?ZDQNNc19scXoH12dt02zHRIizo7pUwZGUr5Uptrm6U/kn2vtD9QNFeLon1Sy?=
 =?us-ascii?Q?3J4CCfAbOkSF1CESmOGdgF/uFAjvFGzdZtJlQCvp07Asu+G5V9J9hYKKwuBW?=
 =?us-ascii?Q?xOuXA44Zg/7G5R0D3f/ixg32KVJ1GwFCQbQZc89sk2Nb0CrQNS8I5t6+qTa4?=
 =?us-ascii?Q?aIjeiC2rpXiazE4wXxFaIj4RTbH5wggXNhZjd2Fpi6lymBbd9tjy91LGkvdG?=
 =?us-ascii?Q?iKA5zZOvUFGGtd8qAzEN8WHLyYnb2ggtv2XDqMYt6G6iZWaK58GZ4i3Hw9AF?=
 =?us-ascii?Q?W9vbuumVxGQ/vMQSSuS8EskhVwq6K9AXkmfnklA2WTxA26coWZWTyeGTNSKg?=
 =?us-ascii?Q?3T/aPLK13YG61EieiTYM2ZIn0WLz9F6BMZLy8RhJXEskOT4omffby1k+uw1m?=
 =?us-ascii?Q?DLbyWQh1ZppcXymY9l1dq06F6U35i5IhONHX340C0hcSYVIgeqJZW//KFgTA?=
 =?us-ascii?Q?BCFUjjxxPIFCzqp+Nkse/0PnbFPNJg8MzrJLvQNFsSQSiwbqw/1x?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d04df3d-6dc6-4418-07cb-08def958cd34
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 16:34:53.0839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RSChVTDuY8Sl4NZwb4uUqOQAhct4P1k/yq4sm37r1dHDYP00M6ELEWKlEXdmLBQjGpad/sXEH9DOzqg97GjiN+Cm7Hv9TCwOwWmQs+J+vl4qHrGzs910xiH2tQE2t8PC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8552
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_093457_490603_7293F096 
X-CRM114-Status: GOOD (  19.08  )
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

On Thu, Aug 13, 2026 at 04:39:38PM +0530, Manush Prajwal wrote:
> [You don't often get email from manushprajwal555@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> imx1_pinctrl_dt_is_flat_functions() iterates child and grandchild
> device nodes with for_each_child_of_node() but returns early from
> inside both loops without dropping the reference the iterator holds
> on the current node. Since the function returns a bool rather than a
> node, there is no legitimate reason to keep the reference: call
> of_node_put() on both loop variables before the early returns.
>
> Found by inspection; the sibling helper in pinctrl-imx.c avoids this
> by using for_each_child_of_node_scoped() instead.
>
> Signed-off-by: Manush Prajwal <manushprajwal555@gmail.com>
> ---
>  drivers/pinctrl/freescale/pinctrl-imx1-core.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx1-core.c b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
> index b7bd4ef9c0..fa8f6a7e03 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
> @@ -551,12 +551,17 @@ static bool imx1_pinctrl_dt_is_flat_functions(struct device_node *np)
>         struct device_node *pinctrl_np;
>
>         for_each_child_of_node(np, function_np) {

use for_each_child_of_node_scoped() to fix it.

Frank

> -               if (of_property_present(function_np, "fsl,pins"))
> +               if (of_property_present(function_np, "fsl,pins")) {
> +                       of_node_put(function_np);
>                         return true;
> +               }
>
>                 for_each_child_of_node(function_np, pinctrl_np) {
> -                       if (of_property_present(pinctrl_np, "fsl,pins"))
> +                       if (of_property_present(pinctrl_np, "fsl,pins")) {
> +                               of_node_put(pinctrl_np);
> +                               of_node_put(function_np);
>                                 return false;
> +                       }
>                 }
>         }
>
> --
> 2.46.2.windows.1
>
>

