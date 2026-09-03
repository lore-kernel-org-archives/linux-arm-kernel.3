Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD2FCC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 19:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V7qbQTNUzj+jV5r6cRQjR4MwCZrcYayGUDiPOWPEzmQ=; b=gf1x0c5pqR8u4DcZquIeQJ5q0f
	n0evzeYON+sKaiKCDejiK5MtYQdeTkd2UjAbrNGqNgjFdPNvIzT3CqZ+hHO368ruWb1FNDect5s7F
	r4S2RqIId49yLSTfbscR0lF5fkOAesdzZBGYAQKbSXl+fxd8HkOp8Po6ztKCa9ryI5V5AUQuOloMS
	tjxlcYoubX5HTge7j/ok+wmufYZ1tMOXYztcXvVZVd89bDokt+1jbipH/dK0Lwj2EVfnaW47HprLT
	0qT9KXtYHU7O3FVKGg+EedQxfYa4sL22mrZF5B4gOubXVnHPlGV1zv43vzd0HV9VqUvu44KNideO6
	vM4wHq8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Cpz-00000000Rer-2RXr;
	Thu, 03 Sep 2026 19:11:03 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Cpx-00000000ReV-1MjA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 19:11:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DQp7+ajo0hw3Wf258QT1O15FMDQAFT0rzGI6wTnTM+ofsELMJJOZwfiG0ZGPVx7V2GV4z25Z8w0Vrjqa1BKuChO2/mgBtw8X6C86GtmOsKorLHskq2H/gLvqgQKIk5DdJQzDe/qaGHxr3PHhopkyvUo5OWn4UAAQwlHyRsDKQpIyrZ9aBHAGJK0pcUiU7q9q7wNr54kUeI5CM7xM1+xOhnedALL1Sy2pqSDhWZzVRH4yibnjT5t3Et7VMkRtGaqqvFwyKsoeJVrqJnYa94gyhgelM67oh5hBqfWLt8xR6mzpT3qHLG7Y2nUsx4kmg3N/QOhFf1eVkRL5/N21fyKMtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V7qbQTNUzj+jV5r6cRQjR4MwCZrcYayGUDiPOWPEzmQ=;
 b=j/4/BdCwTdz5DyE7NHmvTEBLSdBjlg6Rp4kRBeA1pFE127RtyRKaCa5dPUROynlj2sbAlGAIgh5A3K9ct7CeMlGyxF4tFMFASBfDm9cgOBKHa+F8XQZpqbi4zpIUhmX+kMoCQ0xSWxQlYIeUdEdWLesZDekgAMTArXg+98wHlVBv2UJGcFt9jaO50J17K9T1YInNIgOQGcFp2QZTY/YXKfoeUW8LeU0shCU/5+M0Vy2QLdmv9/EX32yA/3kmKatLwDa4Fu6i+MvYWJi1wExdZ+UnVnWMaoNtbKRcIZ0dM4TMDUnrNRX6tm0c7d2qyvBG0DQGcueQ3hE0uacxj1av0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V7qbQTNUzj+jV5r6cRQjR4MwCZrcYayGUDiPOWPEzmQ=;
 b=Vxx+rT6j5LJOcbAEH9li0gKUbAq0FaQf6flkSDtYTLptbXPVuDe9f9dspOyAVSDWCoJMlnkEGJ17i5yBR9HToUl4O5RN3A49k5HMy2fJedaXYGFrPfQIhVu0VOCs20I+7KeDBTcgxj8o092DhSU2Xj0dCQrrB3Sw+WPOTvqsnxdZTstoRGhlHLAWfqjOkZPSGLpnfD4veAJAxrP+9l3ctAgWd0h6yAQZnDeH7ZuriqO/pLIQYQ78IvV0bZz9MpOoV6hD0e2yngO1gUasOYzq8sp8uPTS/VGN016xxlFaZKaU/umBNV7uhaHrtdONpWMlZQvc72LU/QRoPuN2eXMlqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8561.eurprd04.prod.outlook.com (2603:10a6:20b:420::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 19:10:56 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 19:10:56 +0000
Date: Thu, 3 Sep 2026 14:10:45 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Zhijian Han <hanzhijian1991@gmail.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, sashiko-bot@kernel.org
Subject: Re: [PATCH v6] PCI: imx6: fix resource leaks in probe error paths
Message-ID: <apnGNctUMNtaROtr@SMW015318>
References: <20260903160342.3282199-1-hanzhijian1991@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903160342.3282199-1-hanzhijian1991@gmail.com>
X-ClientProxiedBy: CY5PR15CA0008.namprd15.prod.outlook.com
 (2603:10b6:930:14::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8561:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a8452da-4d51-4bfb-addb-08df09ef14bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|7416014|23010399003|1800799024|366016|11063799006|6133799003|10067099003|5023799004|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: RqivAUtbVVfOp+VRxGSpPbUc84wM52xFPCG7XLbeRe8BZskbmrbvWPwZxn4BPAaiRXrb/o7rYvKi28e59DBre6Z4EUlM9/VgWa65s0xS0OLPKm05YzX7uNFWtnSBzY5KT3Ld84Ld3mwD1S0ztO127TZdw/2PCMljB1+NBRu0uO17VziT5JOkLehvApF+9QbmmWKGqOHmZMNowfq9qsNF8O6Kp1EL1BWWuE+sm+jwwkAkMx4qPeKZBuMXUA2Xor1PqyguThsXJ2821oWz8UgPSj1STCtDQdF2GHbqI2T4AhjS59ShJ2Zyg4PQmIxUKT8OibUvLaT1JDYdbnI6RSUrMAnKZvr2YRe97jp7ZFH6scs3fBGVxlbrWakfwp3lvnfM8B6gWRI9bshYsRBGoAuMo2KwvOk8wYtAgQfgoz1Pl26oo6rguNpO5pqVgQUEkgexePQNdfHNJwcJhlErUBbeQgXPaQ5v0/ron2Hut2EDt6zeVdvpr97WnVRFURGelbYpST50qF5apC8jpcXlTkPVySjetIkpuvQd70tbbdQlS6di2uWtE46ue18jqEvAufvEC3LdeVNkkteiQFGIfzeyJ/FElWOIlCGDtZtqTy76vrtI6Xkov1/xvKTgK4sRiOgQ7rZQn4iDPPeyvfgnKuHyHKtEeRmr2kwbvpYCNy5bQus=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(23010399003)(1800799024)(366016)(11063799006)(6133799003)(10067099003)(5023799004)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gMEd+UFy+tf5qsfinI7L3cw5VzYrjLgATcVIzhpShRcl+TiUdk3t4Iw/h6Ve?=
 =?us-ascii?Q?Hf957du4VBHB/Lp5rlRwZJPom2IL7D9e3Vp0iX3W4kJcR+xoV6HOAdLHslrn?=
 =?us-ascii?Q?4wGFvSbcekhS+TI8dQ0uw4ACmWd/ds0v1ti5di2Spxu9R2zTKiuUlDqCxQ9E?=
 =?us-ascii?Q?Oco46pWMxRbAWcLbhgeZmF34pKGVAlBJGn8+4cojJJRlSSq1jhrQ625ILmrg?=
 =?us-ascii?Q?fwJu9OypjW7cDmlhxhzOAjSWcCKz3Y9icg9mT6SrUNtafurpXcnROEZPw1si?=
 =?us-ascii?Q?OdEN95Mq0FqzIyFmDbycRQF57GJwhkDTjwNhk+OLwdAPwr4jTOHQJgl9GlhM?=
 =?us-ascii?Q?IsE+nVDCE2KT1oBj6cHIP5EFIDR8q2y7BShjEY93supN56prwv3HxucshoSe?=
 =?us-ascii?Q?HwDfYQmhsjbeG+Qd7Yp3DhfPu3Un6vuzv4IuNkpkBf4DenZOhcgNuWni0m0w?=
 =?us-ascii?Q?fT0eD1ag/e7W5Rcfzc65qra0DL3eaNF9CnhW1mg9SzZtkJY/pKeS19Gx4ta9?=
 =?us-ascii?Q?clYfdxDEmPws7WRRw4jE5+lZ6P5YCSBj0RPjUKphwmUljPx+2E4mfLUpJlH5?=
 =?us-ascii?Q?jM48fptH7cnlc8rn5lUcnt6tRfdl/1yEmOQN61ZxWQ5jprfygFC56X/7Ebl/?=
 =?us-ascii?Q?9q4h5+k6Q2R4CWrRp9y//bmDRGn928qo5VzvwgooWO2OrYQ6VZR0I2VlYDf/?=
 =?us-ascii?Q?kEtmRbzpuBWr2RsmSvQgNa3yPzRMf0ja98MInZTIASC2h4r8fW3FpPRgMbNO?=
 =?us-ascii?Q?u+xdR8253ktKgPGvTnrNhD9/yI60Pc7VbCDD1EWOV6q/ROYqQGu4ZnMyOtuX?=
 =?us-ascii?Q?DT+SmFAhBpCPukkVoR57KQCWrN6Lhnw9xB/PvNURahYODZ+IbZ3g39dYvsf0?=
 =?us-ascii?Q?XlqerxkvxSnvhKKHIDU6QNulwNg1JngdRqFPCiuPyyiPxXlmkpRErPq0dRyU?=
 =?us-ascii?Q?HVLQ5cKZjzantTln2yiy8RahtMSLy7pILF+PA1F9e9uITlEBWoOrM9jRcFpM?=
 =?us-ascii?Q?uTEiWf2pYoVGModAf1hgpGeY3kJgXUAVt+4u2IefaovaTCx/S3SMOuboiDjI?=
 =?us-ascii?Q?qF+4vTB5/XxDQvdm1WM5Z2wJyqozaz38zcV1ZJsIkRmO5UVDMZmovq3h9etE?=
 =?us-ascii?Q?sWvFxq2mYM41bJBfayLWC/PB9j1MdIcNzd/pniLergy7rPalFkZ6rRRpv2Dy?=
 =?us-ascii?Q?A/EkSh4uAHE1rCiaG/UiSygSh5GW7AxHPGpuseC1rp2l2Elgdx9ixaIiLRds?=
 =?us-ascii?Q?h3EebMSIxDOwrfu7ATI+kxkxwt9Z2zs4yG6hLH3gy4IIgAM3bjfdlNaYgOoL?=
 =?us-ascii?Q?WMU2pf0nWslL34DKCsEU83ULYO3CyirO5gm+1sSY4RZy2WpZR9F9FNr0Nl2t?=
 =?us-ascii?Q?ouyiqmDivl0m77i8aXUyu0MXIEh0Xm+gtFZtP//ExR5I2Zil+iBjBwiey5Ls?=
 =?us-ascii?Q?0Od78UtkC5hUex7sJlhqO/+y+SH+0hAwkXYOKzs04cxs+EWyhQC8EpcFpHmY?=
 =?us-ascii?Q?P669BN8NsaPM8MQfByI4yTxFwKhrjqBIJKtOflcdKNvf/A8QinXGRWaZVxtU?=
 =?us-ascii?Q?8KV+KcoS2uSbMpLZE1HaVopNjnnP4nv44dUyfjFS3YIlGXtrP3BOBR7hm+i9?=
 =?us-ascii?Q?8mXJiMElracj/EtrpXOWR+iX7fe14S9I9T1DJe2jXYgr8bWBhmrE0BtfIGRY?=
 =?us-ascii?Q?fPb4RilFNRCSaAhijJQ4M4ftYACCBgJu2siFQpxJMaQQ3DPwMGp2RrjEmims?=
 =?us-ascii?Q?+2k0GXP4WZxsKlwXrZ2TfW8z9Z+3N3IfIS3ZtLE8rPffckcruYD3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a8452da-4d51-4bfb-addb-08df09ef14bc
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 19:10:56.2908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G3penp/pgh9TOo4bXab9HHRi3heSevi6wd24waXZADU0ZCpusEV3hqAYblNqZfqKdFatPbqdWce6+rJ86l8EcWQbdn/tJp/d3swrncx05Rh+hBALssQrL+wrHjiy/Ncz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8561
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_121101_377156_16FAFCA8 
X-CRM114-Status: GOOD (  31.97  )
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

On Fri, Sep 04, 2026 at 12:03:42AM +0800, Zhijian Han wrote:
> imx_pcie_probe() leaks both pwrctrl devices and power domains on failure:
>
> - imx_pcie_attach_pd() attaches the "pcie" and "pcie_phy" power domains
>   and adds device links to them, but nothing detaches the domains or
>   removes the links on probe failure or deferral, so they leak.
>
> - A failure of devm_pm_runtime_set_active_enabled() returns directly
>   without destroying the pwrctrl devices.
>
> - A partial failure inside imx_pcie_attach_pd() leaks the power domains
>   that were already attached.
>
> Add imx_pcie_detach_pd() to remove the device links and detach the power
> domains in reverse order of acquisition and register it with
> devm_add_action_or_reset() so they are released automatically on probe
> failure.
>
> Reported-by: sashiko-bot@kernel.org
> Link: https://lore.kernel.org/all/20260822013640.182C01F000E9@smtp.kernel.org/
> Fixes: 2c5768344f88 ("PCI: imx6: Move pci_pwrctrl_create_devices() to imx_pcie_probe()")
> Signed-off-by: Zhijian Han <hanzhijian1991@gmail.com>
> ---
> Changes in v6:
> - Keep the device links stateless and remove them with device_link_del()
>   in imx_pcie_detach_pd() instead of using DL_FLAG_AUTOREMOVE_CONSUMER,
>   which creates managed links to power-domain devices that never bind a
>   driver and would trigger a WARN_ON in device_links_driver_bound()
>
> Changes in v5:
> - Register imx_pcie_detach_pd() with devm_add_action_or_reset() instead
>   of calling it manually on the error paths
>
>  drivers/pci/controller/dwc/pci-imx6.c | 58 ++++++++++++++++++++++-----
>  1 file changed, 48 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 39790e66b98d..7dd22b4f826a 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -180,8 +180,12 @@ struct imx_pcie {
>  	struct imx_lut_data	luts[IMX95_MAX_LUT];
>  	/* power domain for pcie */
>  	struct device		*pd_pcie;
> +	/* device link for pcie power domain */
> +	struct device_link	*pd_link;
>  	/* power domain for pcie phy */
>  	struct device		*pd_pcie_phy;
> +	/* device link for pcie phy power domain */
> +	struct device_link	*pd_phy_link;
>  	struct phy		*phy;
>  	const struct imx_pcie_drvdata *drvdata;
>
> @@ -639,10 +643,34 @@ static int imx6q_pcie_abort_handler(unsigned long addr,
>  }
>  #endif
>
> +static void imx_pcie_detach_pd(struct imx_pcie *imx_pcie)
> +{
> +	if (!IS_ERR_OR_NULL(imx_pcie->pd_phy_link)) {
> +		device_link_del(imx_pcie->pd_phy_link);
> +		imx_pcie->pd_phy_link = NULL;
> +	}
> +	if (!IS_ERR_OR_NULL(imx_pcie->pd_link)) {
> +		device_link_del(imx_pcie->pd_link);
> +		imx_pcie->pd_link = NULL;
> +	}
> +	if (!IS_ERR_OR_NULL(imx_pcie->pd_pcie_phy)) {
> +		dev_pm_domain_detach(imx_pcie->pd_pcie_phy, true);
> +		imx_pcie->pd_pcie_phy = NULL;
> +	}
> +	if (!IS_ERR_OR_NULL(imx_pcie->pd_pcie)) {
> +		dev_pm_domain_detach(imx_pcie->pd_pcie, true);
> +		imx_pcie->pd_pcie = NULL;
> +	}
> +}
> +
> +static void imx_pcie_detach_pd_action(void *data)
> +{
> +	imx_pcie_detach_pd(data);
> +}
> +
>  static int imx_pcie_attach_pd(struct device *dev)
>  {
>  	struct imx_pcie *imx_pcie = dev_get_drvdata(dev);
> -	struct device_link *link;
>
>  	/* Do nothing when in a single power domain */
>  	if (dev->pm_domain)
> @@ -654,25 +682,31 @@ static int imx_pcie_attach_pd(struct device *dev)
>  	/* Do nothing when power domain missing */
>  	if (!imx_pcie->pd_pcie)
>  		return 0;
> -	link = device_link_add(dev, imx_pcie->pd_pcie,
> -			DL_FLAG_STATELESS |
> +	imx_pcie->pd_link = device_link_add(dev, imx_pcie->pd_pcie,
> +					    DL_FLAG_STATELESS |
>  			DL_FLAG_PM_RUNTIME |
>  			DL_FLAG_RPM_ACTIVE);
> -	if (!link) {
> +	if (!imx_pcie->pd_link) {
>  		dev_err(dev, "Failed to add device_link to pcie pd\n");
> +		imx_pcie_detach_pd(imx_pcie);
>  		return -EINVAL;
>  	}
>
>  	imx_pcie->pd_pcie_phy = dev_pm_domain_attach_by_name(dev, "pcie_phy");
> -	if (IS_ERR(imx_pcie->pd_pcie_phy))
> -		return PTR_ERR(imx_pcie->pd_pcie_phy);
> +	if (IS_ERR(imx_pcie->pd_pcie_phy)) {
> +		int ret = PTR_ERR(imx_pcie->pd_pcie_phy);
> +
> +		imx_pcie_detach_pd(imx_pcie);
> +		return ret;
> +	}
>
> -	link = device_link_add(dev, imx_pcie->pd_pcie_phy,
> -			DL_FLAG_STATELESS |
> +	imx_pcie->pd_phy_link = device_link_add(dev, imx_pcie->pd_pcie_phy,
> +						DL_FLAG_STATELESS |
>  			DL_FLAG_PM_RUNTIME |
>  			DL_FLAG_RPM_ACTIVE);
> -	if (!link) {
> +	if (!imx_pcie->pd_phy_link) {
>  		dev_err(dev, "Failed to add device_link to pcie_phy pd\n");
> +		imx_pcie_detach_pd(imx_pcie);
>  		return -EINVAL;
>  	}
>
> @@ -1955,6 +1989,10 @@ static int imx_pcie_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>
> +	ret = devm_add_action_or_reset(dev, imx_pcie_detach_pd_action, imx_pcie);
> +	if (ret)
> +		return ret;
> +

because there is safe guide in imx_pcie_detac_pd_action(), if move it before
imx_pcie_attach_pd(),  Needn't call imx_pcie_detach_pd() in error path.

Or use goto in for error handle in imx_pcie_attach_pd() instead of duplicate
call each error branch.

Frank

>  	ret = pci_pwrctrl_create_devices(dev);
>  	if (ret)
>  		return dev_err_probe(dev, ret, "failed to create pwrctrl devices\n");
> @@ -1975,7 +2013,7 @@ static int imx_pcie_probe(struct platform_device *pdev)
>  			pm_runtime_no_callbacks(dev);
>  			ret = devm_pm_runtime_set_active_enabled(dev);
>  			if (ret < 0)
> -				return ret;
> +				goto err_pwrctrl_destroy;
>  		}
>
>  		if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_SKIP_L23_READY))
>

