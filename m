Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482CDC5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 20:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SvM6fOgchV80jwV+RxJPPaeKQNkVBK9dIejN1NLhoEE=; b=StecDbj8IGrL8MDQh8hTdKu8Wo
	gothRM9shv1LrodYMdJ172w2ONJHU6Qsfjn+Oqpz43NuvupWbpBui+lPcTmKIogobcrjLvh1BwBVi
	aTSvTdBeo9YPYmzOFbo881QkhdYcjvEbQkR8rrnZBZYSSaPdBoNI6VVVnWXKEmaUovd251FssNoln
	W6Zs9XAYB+0KeKvPPOtdSwcFxry9sm4xbla6M31m1ofqWdPN/kv4zxmGLmbMPCIBf2+wrBD7z/uHK
	fndYfQdEejiZDAW0psRjex5YA0rQASKVOVl0sdf8CBDPprZ+9cam+8Cn0qL7gxl8iLBLhy71FXoxN
	Xw5KD5lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuyrE-00000003Azm-1bhF;
	Fri, 14 Aug 2026 20:50:28 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuyrC-00000003AzO-0CLf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 20:50:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UHDLopqzqjk6OhsHz47At1oiaNLWYK+F8y8+BgBKhar3f9KoNekie+RdeKvBa8NVZz8Y7bsuIrzDsArhapM92OF/TKx3vKAse9tYkOwof25UpJLOZihZ/E160DxX+5oYV+ryf4zPGiE191AUyYEIjQlgVk7qFBoZlOz9quoWZkD+9yQE8cSAJ4z5VzhdggK1652WvKlNvEB7aiuvllv4fqQIy+i2cxaA/Q9WU19E/awSWGlUPCw62UFKdl9YlLOBt9s9iuSueUpURHPLzvKZtpB14Dz4TCbcbSwZf5+ha1Ck9mH4O3fp056gr03f/kYw/ooyrJ/FKDC9VIUq07SLFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SvM6fOgchV80jwV+RxJPPaeKQNkVBK9dIejN1NLhoEE=;
 b=vn4s91azKApun2OHszC9JX1v5tVMpGgxHEhKUXZKHod77aV6sgrLSEFHQssrCk/t/AAbiGaJ5bQyLSZIChWbpCTKkk9EvvsSNBZ21/n3ZIjC/A/Svzrbuf4v/Qiru04QWKLTIwRAS94HVwEjmVtCbqnaExJ2h69MZgqxAQZwLZii39rmwF43lJgnf2NxsdCR5DSNE2QZMLSo/7k9NS8Ucz4z7izKVVVV59x7Fo35sffg2/Fc4jnVGkA44yXebwkdXqirmJL8LLKKeBHOGLdAIFogrZYJSbxzoRgSbtQ+sAWqBVjk/sJC++izujDDrwl+cz6kASYcpsNU6bqYSFHULw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SvM6fOgchV80jwV+RxJPPaeKQNkVBK9dIejN1NLhoEE=;
 b=F/l3zrRpgcGaDvbpJXQ4aig6O+UjXIljbZhCXkplStd4V9jEBbcJaEB+PnNnOfYRPjXjJ+s+HHbnlq8nOhzPVitZQH8eqp/xQTMJ715gVVOt5P2KWuUacVTTTBSGk3kmUsyPjQQjEdxh7did1kXI8uU+xzFx/9LT1ZmdcI/gpWZKpPeSokeCCRWrofmS1Bo8e6D8oCNA3jM1YYDoAcfXoZq1KcuJJW/YyAuRrhsnbYBEohzls0MriSq+UULZ1FfxWaL7ja8q1ozdfVL3OCc+GNyAvjPxEmTwVo9r4ibi4V1WHuS3xXEPjEXbHjXh6Qv4tNpG02/YNgl0c4vDHHNq4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM7PR04MB6904.eurprd04.prod.outlook.com (2603:10a6:20b:106::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 20:50:21 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 20:50:21 +0000
Date: Fri, 14 Aug 2026 16:50:13 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: manushprajwal <manushprajwal555@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] pinctrl: imx1-core: fix device_node refcount leak
Message-ID: <an9_haXPyNHTPbDU@lizhi-Precision-Tower-5810>
References: <20260814190527.969-1-manushprajwal555@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814190527.969-1-manushprajwal555@gmail.com>
X-ClientProxiedBy: PH0PR07CA0078.namprd07.prod.outlook.com
 (2603:10b6:510:f::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM7PR04MB6904:EE_
X-MS-Office365-Filtering-Correlation-Id: 75f11ba8-557d-4cf7-ca70-08defa45a7dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|376014|1800799024|366016|6133799003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: /Qssk6DKIrE6yxFlVOpUy+CJbBdsTvSRovbiMUEF+V1V/jOApMs/aGFlzoh7RPipQg3mJJCJsJ2BBUSeqxjaffVG6g8OUhtWunFPH5LRumdYcZKotCrQJGSZm+N11hkVs78qBVusL4FGVWEun0U/h/9vFzHOIEczb1jdoSI3smBS3RmBzxDHZ+trmYqScBOMZHML0jHa2tZVHx2S5BQsystu4ZuhKfbZQV8L6ffmCjeBXkM6wUJpRp3TiJpqjeTqMqbNl5rfeHwZGtTEYfWvsSdEpQULljyB/FkDVm+t3W1vGUhEvkSEDx0SFWAfVDEy95PJxTe3lb/9YO55mLSKmjwldIWAtMtFGRNO9qX9nNPe7jZ11yK5O+uroG0n0L16BI0bs0PM4Tg/wStyk/VrWTUyfd+L6f7pblOhIsVOAa7tGrnAIUeGmp9slu/XCg/+ECqG/FJvHyKVH6dkvOsR7qZ0+NGCV6H1shqiSM9azEhobP6LuN1HN5xp7Sl2qH3U2G5u8XXsh4uzuefjJvRgqrU+ldpcnT0iMNvW6DlZvMSYVfC48pKvCfQthTSO1q4XknwdLQMuRC2V1cHtHmwANoUgxBXFeml3CExI0LJEo2hRRzJ4szDTXpjgcp3UlVbXevS1HcSU5fMGAwA9JaQzaNB7Jxw+clm3aLddCkZgmoA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(1800799024)(366016)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EJ41UHDkjbVu8MrxrWa5sOiEVsWRlQpRS0l+Sg7Mm04m7VpggmxuzP/OkN1R?=
 =?us-ascii?Q?cF/NUkr/3dtWSojjHqgyTfoaMsiQ3JCgt8wRVBgWp4eTNzye9cGlVyxK+le9?=
 =?us-ascii?Q?Bs8HfAcD2AzCR7sTdTZeD0QhT4ZfIwKNQfp9I9JaakNnPYjs6mjOzamzkKeX?=
 =?us-ascii?Q?eBix9/JVdyIBhcmvy/fsQ5nscGbvGzq015CkZ6hyS+DS9f8GvQaIcQUoD0qQ?=
 =?us-ascii?Q?ytclbkTW+iFRZyp1LBzWTbBGBX7h4UF/nfwseaKbgf67Ih+w+siYsg3G4Zvh?=
 =?us-ascii?Q?PJvrctgcs+KDdqN4vN5xjW7vSmJyugP646FvplVQfug7wdAdZHTveyIVyYjr?=
 =?us-ascii?Q?V1bjzUdrdAAfcHgjlysgVvQ6sW34W4RkO3sN+VbIkNx4zVITEM9Z8Lq+bFbZ?=
 =?us-ascii?Q?KIKR8CryieC31c/V9hd4JVbKDvKVzQs8XzhaQnMBvokSX4x2oPuRnp2cSDfg?=
 =?us-ascii?Q?Sb7xsRet3crWTD6eA9ZWFc1QtzNIc65dxy8Wz+6NNv7wcD8Wj4ookP8yq9Ad?=
 =?us-ascii?Q?620CFOM37s0CiRl5xywswo44BgQbhHC9aNLm6hbuGeON6/snyRMNT7pztYao?=
 =?us-ascii?Q?GMDQBSWcXzRXpAzFoGKIWMLMayngGRNb90gV4ZI7TVY9lZfP1pVMBvu+8zpU?=
 =?us-ascii?Q?hHxHi8sZ8WzADm5sDiJI8s3uPCBfizuEhi1duUMa3YsLOUDK8rAYFKhg9ga5?=
 =?us-ascii?Q?cST9Fx3ows/7cQZ+tCRxP9E89GR1Oq7tRfu7+h4VRgFp5gNKhFvb4ogQRYew?=
 =?us-ascii?Q?I+PomI3q+Y3R7hgJnd0BqoAUNsyDCKLOTviCpgvmSL2cUOw2OaovWHKGGj/4?=
 =?us-ascii?Q?mide/raThQRpgtR/cUoR4s8/8LNk1zlUAZKqbHboW4tTYMNCNO3s5P/3z4Iw?=
 =?us-ascii?Q?LoyTBfc0HotqQurqxWjl9WIEF/Zcqa8zeDGXjhiw21vbtsxncD+2M012egIm?=
 =?us-ascii?Q?VqtxkKmBdBq1vZ16NjNvlHR8zgjPhrpOEWX91QCtHPVjwRmlJR5VViyvmA7w?=
 =?us-ascii?Q?sCnCUDiE7DiXXsDLfDqgoR5gBBW+Bh+yDCtyTIxdPzdyLr6gP7CUVgXesp/A?=
 =?us-ascii?Q?B6Jj7JpKIP6vx/tAxolYw9TrDzh4+p077Wvyb82cW59czgYsuEL34JkjDix5?=
 =?us-ascii?Q?zW2zPh6YSUcoRLaS3/KPSMcCsRfIkkbFZaMvUtNKXsSGubwxWB6lKONNoSVA?=
 =?us-ascii?Q?n+4AnztbxqhZsfXAe9eJlD2b+Xs7vkUUl/yVtnfERmjZRNDRRyKBzCtcbtpE?=
 =?us-ascii?Q?Khlab5gWbTRCx8eVXG3pKlRvaXCCgS5qpEHTQrggAhzdz8shI0GMR3OUWiL4?=
 =?us-ascii?Q?O37pMDm7/rnjZANTyyMo+BxqDlY8Mauy/o+D9efsGd1qrmBniRk49tYcM4Y7?=
 =?us-ascii?Q?dLKZBP7EGTNKhvRk4+a6iGUDsIQryAp87iLCiu8yvDWYMScqggnyM3M6h9HP?=
 =?us-ascii?Q?2ZrG4EO78uGs6IXgU91FSUZcESHhoJvcw2b5xSg3BRARv4ED1/6D2rquMkIc?=
 =?us-ascii?Q?POlxRZw62HQkNmal2vFXs/pW8zlqj8FbX9WJggzMwaj+ars4HhuGbolXRwf5?=
 =?us-ascii?Q?3TNu+CVheP5NN7USGX0E/Z4KhdRmtvfs3vJPtNFsKfGovejCzWbLI61m1pH4?=
 =?us-ascii?Q?ZLY/k5pVbrn4AIZ3wsVQtOBrxuZvtlHURRspoMNVcwgDrvCpe8eWqyuPauHH?=
 =?us-ascii?Q?PCuYgCiwgIuBGLFEoauCWC6aaZZKxDHHe1knEadXlZR79QCXRO7xPqxI/QEx?=
 =?us-ascii?Q?m8PjwgifZBfIU6mB2XhE9uhFXD8uGN2HeXYtVSy1v+Pq/ZBmfDyU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75f11ba8-557d-4cf7-ca70-08defa45a7dd
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 20:50:21.0480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0+SLlO+4SUq5fy+bRZfgw6nFZ/amOOw0G/1BS1CwdZAqO8ThEF+YyFCgOOgNkb+YgtQiGhA0bLoEYswlk/qegc+JDa+9kcHcBW59pyBQVOh+c/PSo/vDFTrt7u75ZuQi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6904
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_135026_122566_A194CB50 
X-CRM114-Status: GOOD (  17.13  )
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

On Sat, Aug 15, 2026 at 12:35:27AM +0530, manushprajwal wrote:
> From: Manush Prajwal <manushprajwal555@gmail.com>
>
> imx1_pinctrl_dt_is_flat_functions() iterated child and grandchild
> device nodes with for_each_child_of_node() but returned early from
> inside both loops without dropping the reference the iterator held on
> the current node.
>
> Rework both loops around for_each_child_of_node_scoped() instead of
> adding manual of_node_put() calls, matching the sibling helper in
> pinctrl-imx.c and imx1_pinctrl_parse_dt() in this same file, which
> already use the scoped variant.
>
> Signed-off-by: Manush Prajwal <manushprajwal555@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> v2: Use for_each_child_of_node_scoped() instead of manual of_node_put()
>     calls, per Frank Li's review.
>
>  drivers/pinctrl/freescale/pinctrl-imx1-core.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx1-core.c b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
> index b7bd4ef9c0..fa8f6a7e03 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
> @@ -547,14 +547,11 @@
>   */
>  static bool imx1_pinctrl_dt_is_flat_functions(struct device_node *np)
>  {
> -	struct device_node *function_np;
> -	struct device_node *pinctrl_np;
> -
> -	for_each_child_of_node(np, function_np) {
> +	for_each_child_of_node_scoped(np, function_np) {
>  		if (of_property_present(function_np, "fsl,pins"))
>  			return true;
>
> -		for_each_child_of_node(function_np, pinctrl_np) {
> +		for_each_child_of_node_scoped(function_np, pinctrl_np) {
>  			if (of_property_present(pinctrl_np, "fsl,pins"))
>  				return false;
>  		}
> --
> 2.46.2.windows.1

