Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E42AC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 17:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o2Wwn7WkBZvMsChn3tSy1WGRy3cby9J/xcn0WQ2q0yw=; b=dwu6m+CukYsIRycPrWaBYbsZRJ
	rzn/XmM9cYrEgxIirtv+VfDasAHGbe2FMckVcnpLGk/kJwSbHnxlECXeU5lvVUuWfV4G00h1UM+id
	wDJXd+S6Ht22mHAfvolHaB2PdNEoA7cikvHKK7qQniHtkMnBCyW1U0aaxUyK89mZ9ZXGzbVrsY8A4
	ShkmycVslTcLjP6LJ5kf2gtcnPBTFimyDgXH3MgVwxy/jOFI3We8AbWaTR52tKsSssrg5o+RUxgg8
	KalWgfwq3KEsSXieOGl9NyR6UDQ01s0dqQ7TtksgtgrGUryCQq1AwHiP2smlZPGB1nxNiNVm1nuuq
	YROvu2nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtTRz-0000000CTLQ-3z8d;
	Mon, 10 Aug 2026 17:06:11 +0000
Received: from mail-northeuropeazon11012049.outbound.protection.outlook.com ([52.101.66.49] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtTRw-0000000CTKg-3arC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 17:06:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XEpcefvuUooFfJZOE6WR5xXfaDcHBHqkT4xYf0dXfR7PXiGwkXhp8xhc70HbnvF9OCNO1guyGdfnZavl5XxfUxTu7aIGGRbgrJa4VKXw/8B14ZRSZA61TmPHbVrloMZRszCBBi3a0+oCAlvk4VkbgM9Hdsd9516q0Tkv1NE8TPEplz7mNMX32c1yZXxPUR2+JSW02cYuNElRI9ZnNGZNhbXRwbePaY+VJRjb9mTJpKV3prW1YQ8fQ64u2mGHSDOnwHcpbLJqDWVi4f4x4DDC7o/4Z1Z/dlxRiPn3xAYmVDlKJvMIDmtr8SEtRAaZY7WX3iVyOfwRVz+dapn208SlQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o2Wwn7WkBZvMsChn3tSy1WGRy3cby9J/xcn0WQ2q0yw=;
 b=LQAM51yzs9IfST3WPUSNoppHmZJBQGm3K7XLpp8VyWFEfeXa0gqdgI/1ghSA5VlGmq/SPs6G7igE91wCoj/xAgdJuWhBa0tshKBiVdlkML/kwEnX4sHqXirkHZB9LzcFntfBqmScBJTInnI7wML+ABsRPFfTabU/jLhEFnT8zd5fS29o8t3BPgRQtjSWMtmUvbyYdlV4JJktPn5cnWCJvC8H4ZqisKSg+fbRd01Tyxp1HeGekRHOY672TQCLqb4eMQR+I2fsouILLHsDxmoi5wqWpx0OQc+hncoYbm6O377V7/VRwGH8prW+WcgDZJY677fHWiyknu+Yieh5gbsTAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o2Wwn7WkBZvMsChn3tSy1WGRy3cby9J/xcn0WQ2q0yw=;
 b=XMrobJ376S0dgDZmgCex2JsR+CWnyKTdEZq5huOYBOfCpI1xd4bosjzVBkv41qcgH2OHj1oemo2XTmiaau9SMcSJDohVBJTqCmAWUHsx57FqKM/zLOvCc3eJ5MrHT1SNMAfdlx01a1dceZ++DducNYCfgJiVyp5c3KCXye1skzDYKBYlFPxwiG4pquC4naeTj43MMYrxYLwX7LTCnQQ46xOPmXDxY2rwNk0YKcshhTQTCdp9asNC54FDF5bcXdGdiDjMyWQfsoDNhbcDq7bF3ES0EPRR9rP4DnlOa+A6WyW07PNtMs5sda6yLlTxvKhkskGb9AplBw1OH4WweckHog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10564.eurprd04.prod.outlook.com (2603:10a6:150:215::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 17:06:04 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 17:06:03 +0000
Date: Mon, 10 Aug 2026 12:05:55 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Chen <peter.chen@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Xu Yang <xu.yang_2@nxp.com>
Subject: Re: [PATCH v9 1/3] usb: add missing headers transitively included by
 <linux/phy/phy.h>
Message-ID: <anoE81_B11L38CKG@SMW015318>
References: <20260810125614.441667-1-vladimir.oltean@nxp.com>
 <20260810125614.441667-2-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810125614.441667-2-vladimir.oltean@nxp.com>
X-ClientProxiedBy: SA9PR11CA0023.namprd11.prod.outlook.com
 (2603:10b6:806:6e::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10564:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a956e79-7c53-4963-b080-08def701a8c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|23010399003|18002099003|22082099003|10067099003|56012099006|4143699003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 3DdrKqFKIFRBV2Kh1b2RIta51gmJJzSJNR/JzicKmNlfqM9m3alUHpr2FncSfR8ecUIfIQUTGQmXz1QCRCtifhlffuukqu6IFmPFDMuVs74qe8SE0RW+l6U6ebGpUHGZkggdNoAFx78cC6K+a7wGCKIxF47H7YrS1ZzhnhqdZcEWl+zwUMaCOe6/54t6v01oPdrU34Qi2kjvVE0/PfjchdUhvwvdaEKNE0pPRw+X4eDivbFhIqoWgzrZ/NdlP8FKdfFSaOyrSOvs8d/LlaipODM2EpXi+rOCOCGWnvG0EfLk80EQyDPmm5Snlh4cpqa23eQ3Dvwdh9xeAWj1E1N2Ukaype0egQVyK6WYT/S9KxKozflzqMN5wDFb/6SKF1K2jiu1efzBzQpXw6ytgSJCRCtUpg7C2OXbVXDuSfYbeON1wx09XCc8N0zc2BY+OtZL3PU80L9A7koh4Oozsk2LhhnroNIiF8oMGCPcnRjMjzgEsmNtdCVjbVXHCAtaJ7VsU4OIqgzJrcQwrYOhgLtAB7ojyhF44iT3sqeaXgNtgNE6Lbsmwx92kl/MTE3zdQ1O7puW+c1okIWdyvxePEDbFZH9ku/eD5Moh13BYwDNEqDNvBOZWRyzROKPUQF6JGq17EgZLwVqRuLYjejoyAb+HgSGbfDZEkCc/cCXEw7zihw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(23010399003)(18002099003)(22082099003)(10067099003)(56012099006)(4143699003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qmzc3YYLaTcWewaHdvWk76YOQy+YPhrjmV/eCa0WUJzg4zgiiKkIhAtwJIRb?=
 =?us-ascii?Q?nXKZs2zo/5sybD9UUtk9+D6TEtMOY3dyMrWCmnlRR1SD1N/czkdfyDWyX5K0?=
 =?us-ascii?Q?5qxYlGd5ykP+9/nEZY8ZnwC7y3UQiaHeu5PqTyfeW2lfQyBUFnPNm1SV0OBK?=
 =?us-ascii?Q?lSnYj+G4SnccUNVAhyO/dSjT++AyKWKSNX2ReIc/7xT6aksXAjJ1OMmdkN1i?=
 =?us-ascii?Q?LrRRAdp5pbiFQUBkSImB9hG5ku45C1b67wCA2mAcLo+u8OtYhc5t/tIFNHRR?=
 =?us-ascii?Q?abkbWWBe1VK0+NBZmzfYY4i8BJPWrTj4AU0PJie4dgYJwQGQH9+1j40JTfxz?=
 =?us-ascii?Q?6UN91Wsycr5l0M6ekFGBcuEt8Kb3vG43ziYFjgfctb+9cHZuCbXUIids4JFL?=
 =?us-ascii?Q?AcyXO/pmkDbg6Je93c3cKWX95bIGCQSt+U9Aj9Es91PU2AqrJIYMVVEmAUq6?=
 =?us-ascii?Q?zHtTvBzt4NKpMecmXrhZKoZhijAhdJ3gaYA7Qe9wOtKJYuL5OGpHkco61rvG?=
 =?us-ascii?Q?cScH26BDEDNx0tuABDZzc552jOKDUtAss3ihrjpSqc31Gtpx6PIfWPXq2224?=
 =?us-ascii?Q?mcuw5sAyMKJctn4qz9X6Pb4YIzcZoP20TJtJ965RDfzXIVNoeBBbFVkbVsXO?=
 =?us-ascii?Q?9beh8RKFSpOEtYMOfWeOoK3wdwztsiGXu1+0tIKq9AXthyx1ifN9Uj1K0xin?=
 =?us-ascii?Q?SUs/+ud6bOzYX/83FLluhOsKHO6urlq+WNJfC2yD8RL8WDaZ5N5/PtJzzua1?=
 =?us-ascii?Q?q24Z7r5ecOA8kGPs48fyvUEQgzW7lX8mHbYDP+7SIHoQYzLQeOkNTiFJjn9I?=
 =?us-ascii?Q?ynU/FVhTJfuloceVpsXXeMjTFMvzRActfZtAo7uHrwNoYDoV1jzDXjsxHDF8?=
 =?us-ascii?Q?3seieOrz0WV/U1Ft4NTaVyL9CS/ZL2ituBAsIbEdaeECtUi7HV1eOW86kE67?=
 =?us-ascii?Q?tJRGJULGaUJmmWEvfxvz0d1U6VVB8+UwA+zC8XOeMl7MareiWodLRhTPuk8M?=
 =?us-ascii?Q?hLN0g3TQHFU/qyAP6cMTBuVaOFrZjJAwdZTLn7p3WQYis0tboxV5f04Gtn+s?=
 =?us-ascii?Q?p+RiiktyVa6i7WskAeOzmdQCBk4ZS8jf8oilonnnkEcA1wzZiTWhTc5EKh1f?=
 =?us-ascii?Q?zu7KxLv3ASeUEMVfSF70LVLziAU/ka+M6+iwPMEAKiIw1C7enc7hHKd7YbS4?=
 =?us-ascii?Q?OsYVHON641urXR9Kn5DLWdSYh01ot7rZvJHhrpckgDt0C4PSvpCnPZRBAoFl?=
 =?us-ascii?Q?YbTTS5sOESbiZafpQTsX+qiuYoqsjQoOlGQazl87p94tAdP6i6LG0oVodTnh?=
 =?us-ascii?Q?6+sTJf0zK6gL3aVLCt1ZhcEt1pmYs0iG+XzTa3SD3+HnfMHUKi4KNuLMZ6OF?=
 =?us-ascii?Q?wFOTLPR4WaK8AKrQbY6VkmJC2kb0+bMa9qFC92CaZR0hO3jElSfAJx2i7VI3?=
 =?us-ascii?Q?NtgaEZ+89Xo6X1DwFamWozFOFwOKgjI/qlxAmpVIqaYQUos4iZdOgQt/i3iQ?=
 =?us-ascii?Q?dgN2YkB9iVA7kXoX2bZ7j1bDfwAOQYnqrDzVwZQhTYfkmHHP9sTqXVjt5q+G?=
 =?us-ascii?Q?vZhw3u48x1/UBX/zGWsrcZL/QBa1VevIWcRyBkQM1EWeEiVmEvq9rapXD+QS?=
 =?us-ascii?Q?AtLBzoaQqyrj5nLfmag/YjppsD8J84m6pD82TNsj5oV39pxoB2BAIdPZ/xCy?=
 =?us-ascii?Q?3SHe0Pxun5B0cE6QfzP3csLE/tCo7AiW8o75VABwwuspNqtk6pIgizPNYOdY?=
 =?us-ascii?Q?iAMQ79nl00hPNjIZ/jSQks4s7LDNP5JNgrNx8nFZ0ORkINpgzbYR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a956e79-7c53-4963-b080-08def701a8c6
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 17:06:03.4626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xfAXs+3G7GVkRlQoWWOt9urtLjhnw9QLlGERgHQ6jpQlx1Ewxwk4TupiTMQn4hfnl+214Cg091Qe9haTw8MHlfSTshEnpjPBcZNtXCmE72skoEzQevmPgcQfwqGkc1uL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10564
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_100608_901074_43F137C0 
X-CRM114-Status: GOOD (  21.30  )
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

On Mon, Aug 10, 2026 at 03:56:12PM +0300, Vladimir Oltean wrote:
> The chipidea ci_hdrc_imx driver uses regulator consumer API like
> regulator_enable() but does not include <linux/regulator/consumer.h>.
>
> The core USB HCD driver calls invalidate_kernel_vmap_range() and
> flush_kernel_vmap_range(), but does not include <linux/highmem.h>.
>
> The DWC3 gadget driver calls:
> - device_property_present()
> - device_property_count_u8()
> - device_property_read_u8_array()
> but does not include <linux/property.h>
>
> Similarly, dwc3-imx uses device_property_read_bool() without including
> <linux/property.h>.
>
> The dwc3-generic-plat driver uses of_device_get_match_data() but does
> not include <linux/of.h>.
>
> In all these cases, the necessary includes were still provided somehow,
> directly or indirectly, through <linux/phy/phy.h>. I found the following
> command to be quite helpful in figuring out the include chain:
>
> $ make KCFLAGS="-H" drivers/usb/dwc3/dwc3-imx.o
>
> Since <linux/phy/phy.h> wants to drop the unnecessary includes, fill in
> the required headers to avoid any breakage.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com> # dwc3
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
> Cc: Peter Chen <peter.chen@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Cc: Xu Yang <xu.yang_2@nxp.com>
>
> v7->v9: none
> v6->v7:
> - add drivers/usb/dwc3/dwc3-imx.c to the list of patched files
> - collect tag from Greg, keeping it despite the new addition because the
>   change is minor and in the same spirit as the rest
> (https://lore.kernel.org/linux-phy/2026033028-squint-yield-4c23@gregkh/)
> v2->v6: none
> v1->v2: collect tag
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c   | 1 +
>  drivers/usb/core/hcd.c               | 1 +
>  drivers/usb/dwc3/dwc3-generic-plat.c | 1 +
>  drivers/usb/dwc3/dwc3-imx.c          | 1 +
>  drivers/usb/dwc3/gadget.c            | 1 +
>  5 files changed, 5 insertions(+)
>
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index 282314eea7fc..1509b8ec630c 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -17,6 +17,7 @@
>  #include <linux/clk.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/pm_qos.h>
> +#include <linux/regulator/consumer.h>
>
>  #include "ci.h"
>  #include "ci_hdrc_imx.h"
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index 8e8a5f59b319..f7def9b116e0 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -10,6 +10,7 @@
>   */
>
>  #include <linux/bcd.h>
> +#include <linux/highmem.h>
>  #include <linux/module.h>
>  #include <linux/version.h>
>  #include <linux/kernel.h>
> diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
> index ca69ac0eb07c..2f2ae6f4704f 100644
> --- a/drivers/usb/dwc3/dwc3-generic-plat.c
> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c
> @@ -8,6 +8,7 @@
>   */
>
>  #include <linux/clk.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/reset.h>
>  #include <linux/regmap.h>
> diff --git a/drivers/usb/dwc3/dwc3-imx.c b/drivers/usb/dwc3/dwc3-imx.c
> index 973a486b544d..6e122674edaf 100644
> --- a/drivers/usb/dwc3/dwc3-imx.c
> +++ b/drivers/usb/dwc3/dwc3-imx.c
> @@ -13,6 +13,7 @@
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/property.h>
>
>  #include "core.h"
>  #include "glue.h"
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index fa0f16ffafef..e70c17d50db8 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -10,6 +10,7 @@
>
>  #include <linux/kernel.h>
>  #include <linux/delay.h>
> +#include <linux/property.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
>  #include <linux/platform_device.h>
> --
> 2.34.1
>
>

