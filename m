Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F588EA71A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 01:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EXgX1cb7HFOza2Phl/z6KFIgww4qrHeWNXpzbwli55k=; b=BFDOFASwpNPcs2v4UTxcmr9k4v
	jcGOAkFMIahumsI+CMfEWWayDGe+CCFCE+RqaeBYT1FKG1ZY4GoedntQSuPppPF4lMeDuC+fDwXQS
	KhC9pJgE+LKz5lNHhg7eZ12waFzQSCyfLKc1IjqjlnEOCfnxOl0MbPNgs2nBVau76mz4tnywU5xyU
	zC0HJGgjcASo5ZGvTGuMYtSiLI5xEYSZvWld0XBA5ehPvZ0/z53ujM7EUuuLrkmB2oYiYMs9TC8o1
	D8dWJ0y2dKe3D6bSVljyho6k3LfoAav18HP+ZzNwU3JI7SXzhd5iCs3OhNjOqikJ+eD3/VsPEZKRx
	r77Uc8yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEdsU-00000006IM8-3LO7;
	Mon, 20 Apr 2026 01:56:46 +0000
Received: from mail-westeuropeazon11010071.outbound.protection.outlook.com ([52.101.69.71] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEdsS-00000006ILm-3KF4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 01:56:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aeXc3hAPcNKho+JHqJDkcLJc1kHEDlfV8V66kBLXlSzaUgn5ePFqgPaH7y4wgM6xB1EjTNtHIJCFWbRTaZevsrTu0drz8MC5B+in7TbDh0rNrmDTRDs7si8x5cwemHrm8GfBSNcDDiCtetiSaqmOUBe6nWVnOjz21dC8NkVZI0iOo7BNSF6EDu6KM1gYCkoK7Lv0I+MRYaZdCyr0a0IdlrOszr2IrT9h3lfpjielR1E1APdDmiJPHX9maBv79ArYrOTYNu84vKeieK3RcfMT9gYeqt7ACo2j53BHAqQiun+BchCnJ6mYyFYLyQTHZJ1GHqOZo/k7wd+ja1rIz8rvHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXgX1cb7HFOza2Phl/z6KFIgww4qrHeWNXpzbwli55k=;
 b=DEpCUvAhVl4ljHaCsZU3PssU+stndPZHWaRhCfIqWUGmeCYN32S460jnOVa0bZmugPJMWOnSh1aN+HxkcXOf8FGZ+7rf2McdlG2nFd9JajmxK5l3Zpar8Epk1vFq24oVGGR7SJhlmCJ6of6QwaTxqCBf9PuRzUstaekUZk5BMN9BBxwTzZzCz1LhH/ZAl9uMVb8X59ruJ+CVQirLNJUvcOA2WC0HNpk5wAdfnTk90vFUzSY3/xOhXuunrGhJx8yNWosamQJAl3GfFsMgm63wbdcVxUt+pYWVdhRFNXZVeLEWnvlN4wcJ0BgdjD4V3mJD9yvD5c7r4XYGz0/a9IYiQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EXgX1cb7HFOza2Phl/z6KFIgww4qrHeWNXpzbwli55k=;
 b=TWKZVlCXtIZY0fyXqHEEtkUnr5/NkjMDD2d61nwlhHsqTx/f5DlH4qG0o9n4ixglSf1uyHYa+qFxcqSScCME8J04jYWNDXUYe2EKGkClYmTMho7AbUAq+0wnCXiM6GQ8TTiHSOw/Z2rRr5Vc4ikEdjqWVn0kEJ6HezyReqYBtb08SULRNYe5HXbk0bxzySLlqygV5PMw1XhDCNMuaqUGkYY9sCt6UqaP+29oM40jIsZ2zZJD5JyTs/CsCQTYui4xfIEhoWrEdC9hQk6w58A/ahkK5dL6ilkTFWgluZ6IZixrEbNn6yKPeeBQE7EWs2CiistG2f17bx1XZkqEMU4zBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM8PR04MB7219.eurprd04.prod.outlook.com (2603:10a6:20b:1d3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 01:56:37 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9818.032; Mon, 20 Apr 2026
 01:56:37 +0000
Date: Sun, 19 Apr 2026 21:56:26 -0400
From: Frank Li <Frank.li@nxp.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: imx8qxp-pxl2dpi: avoid of_node_put() on
 ERR_PTR()
Message-ID: <aeWHyhp43ZbgXwFe@lizhi-Precision-Tower-5810>
References: <20260419122134.97529-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260419122134.97529-1-lgs201920130244@gmail.com>
X-ClientProxiedBy: SJ0PR05CA0108.namprd05.prod.outlook.com
 (2603:10b6:a03:334::23) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM8PR04MB7219:EE_
X-MS-Office365-Filtering-Correlation-Id: 0657e5e6-ad3d-4b8c-b824-08de9e800ea5
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|19092799006|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: rIAmofEdLahYNu3x58S3BO95PGpYug7vH0rCX44CYDHW/hjyORVhyw8irA4i8nsMlaQO55eYgp8yrWsQHrL81QNBwIXxXzFN3+0Gxe7omXMwInOSquU4/TKdO++jFuIst1dyDpwd5Zu5TU7PovnAnvRPH6diaUyH/3oi5tJHyP1D44k7CXZfhdc652inPtS5lzMe2wY281+bFcQ9NlfDsh2g/9RitlPgOl4jDDnJ/exK0zr+8p8xXt4o7uRaDRFvPBC4NooPG8D4+GKTF6Dsu7R/njRQtcTL0kXGjiSblHDNEGDTW0s28qY6UTUyTnZvSKLmpZmnqyAspyh/Qn5mS7EAJt3xoM68e3BKYPyCYwZ+x0hboQqjXRR0Muuq8qpIqouznwfjyj+HxW3m15GI0EJJUMoT3lh3Xtj8kaA6HzBv/HyF7/UwSGZYHzjJQJrFBERZkWz/yR2Z5bacP2NZXdQgungoz7P41U2W3qCn9B0QbBNJty5emQUuwoeXOl+Nu0IReUA2f/U5ZruV98c/Iw0iVaALxW++z2AtUfvoHGwq+Ce/UEwbcvh/1Gi51cTNp3l9h/o0+YmZafShmI/XxAgd348gRlhaTuh21MmCN1GixGUnPrgl7kiOi+3cvSfaVK5+XWshNzP9/tjibAOMntOfr3n4uVPCLc16rtmhDzdLJD1GB/SUOGRtogtKrgZpwN3gdpGT7K2tdvhFXYXcco9gRfNI++fEA+wLL+4S9o/pibYIwpiF1e3RbwrhNW1qrveFCx423Sc7Lpw3a4Fieqia9rYh9yasdtJO9AgCBSQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(19092799006)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bbdGQ9RSADrwoU4umDg2HZ/wikb7eQ+zVDilujPvUZ6WyJVskGehTE1IkezE?=
 =?us-ascii?Q?oLQZAH5tVM4iA5DXGzZ11eJaY03zyrPKRmf7xTlIhRmtFiEUvZCEdZmwObY8?=
 =?us-ascii?Q?wSBOpbe12unfEOKv8CxvlDd+LXVcx5YR0QYGfptLJmZ9OoYyWbm8Q8uppXbJ?=
 =?us-ascii?Q?I9avoHzPGQLDLawJZgXl7r6yAxmQowAH9RydC0JZEqtOJIUuHKWGLighvnqN?=
 =?us-ascii?Q?4DSDorTnSLRc/0bc+5M9qG0Mrm6zEHXp2OyVzp8q7Ldkv/tE1KlvFgvyd04d?=
 =?us-ascii?Q?CIPkkfta5+rBC3JwRXvNAseLK4SRgGXQP9xR7vdyHYvaP5mHzMxgFOIOrkXO?=
 =?us-ascii?Q?RdWSENT/epsyN1LK4Ue7GZ9NMPsC0Mpdd+o0DP7Yzsxx2SN7ZqF4ulB5EBSW?=
 =?us-ascii?Q?zuSegER+5E/503zV62Hr1l5MqbUN5lMTf4x9FVL/fZORPj9hKGVKmr3qq3bf?=
 =?us-ascii?Q?OBoYwx+xfS5nRWu8ZODXhOHAJAjHeVBMSFvt9u5LzMZOiptKTEjCydEo64GB?=
 =?us-ascii?Q?WDOqtC6x1u0sLJ5mOwhQK+K7/TRH0VQTObWfcEpc7wS36s7QNl5i5NGHm7ds?=
 =?us-ascii?Q?s4McVRKYRYo29WKf/pF9RJvYJ8sBpCzKkNi2gUo8BlQebedW84PhbSK/N5o7?=
 =?us-ascii?Q?3jPhwxBK++LG66nZZgnZJEFQwbOuEmuHUd1NGK5uE216bhAeUBGLTLw37meU?=
 =?us-ascii?Q?l8ybczNWjxy8Gsx2c9JNaLDJuwem6qtaZcotfdvISjL9pOgsoHm1zecL47b9?=
 =?us-ascii?Q?kbrMcCFQjmJVHEjh/9910WSDJ3AbQZzrfAl6sCyTWw59gnCkbmwSGsQgdgYw?=
 =?us-ascii?Q?czXPOoOJd7YDEF9vcOn6QX4E2xFrWUYJcmYUqWkdMHHcEoqL/mmR078eschq?=
 =?us-ascii?Q?22pLyVixXUpT/0m+vgbbDdQuBH7V62Hgg2XJ5aO+v+Dpf9AlX/H4tj0wuhbK?=
 =?us-ascii?Q?CgkrPfzRG6/f4KDsM2uoSJncv5eb5tOkg7VBoFox7WYui686HiEWUrJMWgl9?=
 =?us-ascii?Q?fQ7EFprUDWU1/w2KvOjGawdIuzidUBRx4GfGEMuilR4bstG+jPMj+UKOBEEo?=
 =?us-ascii?Q?K/uIMc2Ha+ZSCK3KVscTtrxK7NxwXggVOnbeCQ/ef2S/2p5QH2FkGZBKg7na?=
 =?us-ascii?Q?lZF366x66pIOiTOhPH/3a20Xc1Iwt1iHZ9qLhIQB7L1b6TCVfEmgK54TSaU6?=
 =?us-ascii?Q?RPNiPMPR8FhnhiHny6U1c3c8SFD06Jk017EtIB8oaBmm7rncfz5vN6psbsQE?=
 =?us-ascii?Q?nCJTDHjVme4vqMDYhtuUY4d13QvFQ96WCk8s/91pBxOZWi9E2xkJg2cwd+X+?=
 =?us-ascii?Q?l0Rqh9WPdaVpqhocOLBIJnCbz1TyoafjHCUYZ1vsw+QWn14Xfb6aeefowGfF?=
 =?us-ascii?Q?S5Itmv8eACUOgSrCyjbKc4G38UkQ61+89PTmhj0BiIZO/wzan/YAzP79+tma?=
 =?us-ascii?Q?wqqrLhKyq0/DgVKEtf4v/24CE6V5zom6LPD1R9n1nmunIF9VK0NxjeANBQ5k?=
 =?us-ascii?Q?BNbQPtSXQ3SqXLByF/Oml7FH/L3BdvIzsvCw4hw2Wpnkh8FChGM0/2B5r59Z?=
 =?us-ascii?Q?L03eWWPeoELsjDL9jenTQHpPqzR5vRG3MXWmIyW9HrUvAuxKeD8ZTsylAcWI?=
 =?us-ascii?Q?6R4gCfchu8YkJafIC2MsXqyjg6DBq5JP/Bs0D5+QAxAQfI9bXPjHCknXrGU0?=
 =?us-ascii?Q?+3EGjbrudZTCn/VB2/shwAwxXCD/VmYhPhd7rtLFHCrmKM4q?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0657e5e6-ad3d-4b8c-b824-08de9e800ea5
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 01:56:37.4018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e1F7vsasKVws17j4YUPI+ZuhVcnFM3GiTojXIJFaBCzyQQ/HCGPn8bGNaFe0aybEVv6vrQ18wXYNFO5JZ+X2VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7219
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_185644_843445_0F97FA4E 
X-CRM114-Status: GOOD (  20.92  )
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

On Sun, Apr 19, 2026 at 08:21:34PM +0800, Guangshuo Li wrote:
> imx8qxp_pxl2dpi_get_available_ep_from_port() may return ERR_PTR(-ENODEV)
> or ERR_PTR(-EINVAL). imx8qxp_pxl2dpi_find_next_bridge() stores that
> value in a __free(device_node) variable and then immediately checks
> IS_ERR(ep).
>
> On the error path, returning from the function triggers the cleanup
> handler for __free(device_node). Since the device_node cleanup helper
> only checks for NULL before calling of_node_put(), this results in
> of_node_put(ERR_PTR(...)), which may lead to an invalid kobject_put()

Please fix
DEFINE_FREE(device_node, struct device_node *, if (_T) of_node_put(_T))

If (!IS_ERR(_T))

Frank
> dereference and crash the kernel.
>
> Fix it by avoiding __free(device_node) for the endpoint pointer and
> releasing it explicitly after obtaining the remote port parent.
>
> This issue was found by a custom static analysis tool.
>
> Fixes: ceea3f7806a10 ("drm/bridge: imx8qxp-pxl2dpi: simplify put of device_node pointers")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
> index 441fd32dc91c..3610ca94a8e6 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
> @@ -264,12 +264,15 @@ imx8qxp_pxl2dpi_get_available_ep_from_port(struct imx8qxp_pxl2dpi *p2d,
>
>  static int imx8qxp_pxl2dpi_find_next_bridge(struct imx8qxp_pxl2dpi *p2d)
>  {
> -	struct device_node *ep __free(device_node) =
> -		imx8qxp_pxl2dpi_get_available_ep_from_port(p2d, 1);
> +	struct device_node *ep;
> +
> +	ep = imx8qxp_pxl2dpi_get_available_ep_from_port(p2d, 1);
>  	if (IS_ERR(ep))
>  		return PTR_ERR(ep);
>
>  	struct device_node *remote __free(device_node) = of_graph_get_remote_port_parent(ep);
> +	of_node_put(ep);
> +
>  	if (!remote || !of_device_is_available(remote)) {
>  		DRM_DEV_ERROR(p2d->dev, "no available remote\n");
>  		return -ENODEV;
> --
> 2.43.0
>

