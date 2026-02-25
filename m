Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14A4FD3767
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 15:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=euOwRvzpZqS2btWOg3iDm/+VrQTw5RVh7seutlEAel8=; b=Hgj5QinNmd+EjtdGhCi1ltby0Z
	i2PQlCBYGZaDtpuRg+wZXLLunYebZMhUb5QhR4MQr3vU0U+1+zrnWpmgjgNJjrVR9NpQ1frZbC4XM
	cHlJVst9NcvUEvJcU4u4LH5MXuU937qBBwNd9u/YTJoTmiUxtsulT02EQMWuSPBignaK9aSjNP/Ml
	Tl8U8yldobalvOCLAicgGYpxGkD8CHWLBsZsN0R9SJMtSr3Hvo2/XW1wDls/bSmPeFEsKmxf+gy9T
	zcI2TahcKRyFPpeUYBBAnk6UjFnVtEe9Tn154nIZS3HWU8YcCkIfLOpcrHFt+86rNjKFrVgDrzo8R
	kXyEipxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvGmS-00000004Hof-0Ao6;
	Wed, 25 Feb 2026 15:26:28 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvGmQ-00000004HoJ-08h0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 15:26:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kGpPk6QaI3B7pCmpNr4rw364YI85ao8n3xDtjwEocAr08NqswBT4eNlvGpj18bxUHtqkiLSEm/I4MshsCIZezAXXqfrXEIOLtQvILvA42YTNV3n08nmtzaLZmQ7asZvakd46YORKGTZqLkfxcKCrtTU7fEzmRi9qoWO+Ji9EnFWIe8M9LXXJ7etb+3tJd1P6uX6Nk626LC6AMJQy7+kAhb43hzS3/OTgUg3B6iae4P4rqxmIUKtF0ac5iR256TmTHIpE6AN26Bvb1E9DlZLmaZqjXh2xZvZ+xfzm6xYqu2kJFRHH4+qA1U/yZx4tWhp/nDY0CfMH1HKdsphJ6Bn3Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=euOwRvzpZqS2btWOg3iDm/+VrQTw5RVh7seutlEAel8=;
 b=GDvmBn4oTg9cw31w+Xpd87bP4M5++DT2nExif/MiBj+QCM4XA5D8nkM/1OdBJyBkfLX9BziY0GY9UFOi8jXILJ1rLzGzNKI+dBu4wnRJwMPegfZeBsK1Z13/iMl7Tr4/BkKM9tfqQmiykFKh8n3JUWg1BaC9SnvgdPdDF1j+oztzFKOn5qszeOFzgfH/bjJ64Ap1Q8ZgGQIMQalcDJ6VmTYTVNXCXc02fJP8DnzsnyoGRg5foKbYqAhhAYxfEsD5Hc3BECo7P6fsGktSzP/A8yT7wuZNKNM4ZPfecmOaP9u+Kza79XAvNW30b3ElO+W4a1QJdlyr9+4rogIb3fsxyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=euOwRvzpZqS2btWOg3iDm/+VrQTw5RVh7seutlEAel8=;
 b=gyu0wocNYSNfuM1FaK6JzeARzl/AxgQjzlL8w6fD2brqaDPhYcUyi0Dby1si/zHQcTVmDM53w1mk+Lz33i/Fr2GykCQdZLTwqFw0CRf0rIDrFgRWyGiqIHbOEF3cRtvQz+MoGtV+wphjZgmkX2OEwnVwCAVdPotoPskcbi+1yUrFPozgSC6jMVd8LiBITK9P+f3BNOneWdf1HYVjf7w1kI88ZiWzwRqOKmiF9fBkbkFxtXlSNiDE4A5ZWkL9t1GbvDDba9z7mM6Odn0QNpI3r/eQkXZ+etizhzwWSz0D4aKCp06HwVqI6gDyVmJGl2IFh08tn5MS6bc/6sTfdXCIfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB10437.eurprd04.prod.outlook.com (2603:10a6:800:216::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 15:26:20 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 15:26:18 +0000
Date: Wed, 25 Feb 2026 10:26:07 -0500
From: Frank Li <Frank.li@nxp.com>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Haibo Chen <haibo.chen@nxp.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, s32@nxp.com,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Larisa Grigore <larisa.grigore@nxp.com>
Subject: Re: [PATCH v2 4/7] mmc: sdhci-esdhc-imx: add NXP S32N79 support
Message-ID: <aZ8Uj9DvCAD2lZjM@lizhi-Precision-Tower-5810>
References: <20260225133858.8026-1-ciprianmarian.costea@oss.nxp.com>
 <20260225133858.8026-5-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225133858.8026-5-ciprianmarian.costea@oss.nxp.com>
X-ClientProxiedBy: PH8PR15CA0013.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::16) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB10437:EE_
X-MS-Office365-Filtering-Correlation-Id: fcbc356c-9e04-420a-0a98-08de748238fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: jIBQdC6SsvIINydI48mYwtIHQGTBSZgkfdGqP91ki3joaAjsCvRo5jNRdR1zDOn9aSSq0QS1qFkC3ehHXISKsxf3blHvWqqQauwoVvZx4ElfjcXELJAAoKn0VqAPAHYXXI4w1SBgrwapxuWCOG4lo1CQ9xatPXXV2Xq1bhz6acSqnbEtyIHzhvRWHUxi/vJwDXFDSRpmH0EWBHBmmqCGmb4xfcjNnmyFbRUJYwlZaD37tq4MVTuN7hJEo9jZ6NSoi5cpXjTQgqlo9UiwtcFOnDbdpWTbJbvBy4/UtWP6vwQSZGrqs6/d+oN8M+LUA/fS4/sPz8xIFiUOP7DHLvos2rIypO48DrK4Q/L9PYyIa3zqndCRrEwuk+hK+TO9yHfyYF/0fJDgzwgwUbEcvQ8BI+unYTaHYdGSfATw+FSHM1YAklnFg9yjiEt5expnascw91PG5+PR6ISBeDEA3jTuyy0hg56Fq0o5J44CaFIkK3CZYCC3behqiIBkNbvKIpszeowwFcuKYQnJ20gXNj1C7bfqH5V1kGDfV0OzImh6CltBf63Lv/IHQjVhFRlV6uY4yZXop4d5sDli/iXbABxXTIPpq6eHejJLzKV4VOJWJ7YEWE8VTLVmnijMlYAalAzjsrdsnU3I5Q/ogSTLtvhxZsYq/zjpH7easyZJUFnEbRm96EuTvNNJyqQTNlFmzET4HjSqv3OyvbYT4P57Z0aMkWvcAkljHQI0nTZW16kfBPZYQLQiLrKbPT939iBrMUAQ4QsLcqVCFynnz0ckF6pqVGpncfHH5KpM4KoJXrqVCzk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6Yf3Y/iFdTcjXHhjYRtrtso4tgImaYCZj7gmQD5HPYNtxVvDsvDj9w1HrozT?=
 =?us-ascii?Q?VfKD4cQGC/mmanCPzd7fXPSc4S1/v0+3qdVHCSm7Y1xqm9PzkJSnGNKPwtE+?=
 =?us-ascii?Q?kbWKOtfyd0ErhgCShvRWwydPOs2XBE37lnFtQbMgRgrxpifH+ug+NnySwmqI?=
 =?us-ascii?Q?txUc4OvBKtkxQ4QINONkW/iiCqcVW/uCCU/pBJ6fXW4IfWL1n4CgbiJjCeay?=
 =?us-ascii?Q?YetGFMrY+kL7HNHYT363/JcIXk9Dp4A2YE4u0J6NP6tB55EHQZNJAXKc8+vU?=
 =?us-ascii?Q?Ehpz856F5iev3uDESy+NT1unl2L9gzn9FyIPClRrVijRow3RRhSbwYCPx0Ga?=
 =?us-ascii?Q?hiYjmcpFEgNrj9JZK+MtaOdpATgVS0Lpx+lDVzBkT5B0hVETFCmV4aWFN4yr?=
 =?us-ascii?Q?5OBROMAt0NLT24NiRh+idm0bY1wV/P4MB6RcJqttBX1kZ4hYxZ7IIJVA74fr?=
 =?us-ascii?Q?pLmLMmc1sKCGDVE96KDSOcSwI+1Dg/0Zf9DnAIb34m8Ia3y14nYJvJ3fbxKa?=
 =?us-ascii?Q?bkCk/exRGEbTZ75+GjPjAqLRoQSu6tIMoigFlx/pVPyL0e4lhWFyaMX5KZ4o?=
 =?us-ascii?Q?fwv4rNgVn289rAmJSl67dksft2F0S+PXiiDx8Y6Al6NL167PQIUqWV+2XgZZ?=
 =?us-ascii?Q?FWv4I7hy4UiC9ZmeArElMfcpKxZjbCP8XVXF0jmRGrAPPkgzu7VuR4Q111rM?=
 =?us-ascii?Q?idUZqdAa51sAB3jb3rpjcJk0w0CpGpFoaFzYtiRlSMA19CZaANmyLo6ZtSvC?=
 =?us-ascii?Q?3hLByIUaS2QTpmlsVDcY63bTB6glsZVpSylpeEJGZ6NfRr7lkz5xd8TKZXcT?=
 =?us-ascii?Q?Hb8WVTLrUatm8NRvcD/yRxigZlLIwf6o1etjaiDXBG2jtLQekRPrWxpSopAm?=
 =?us-ascii?Q?XlMIm7NZX7FjL1zWeToA0gMI7AbPWXjwTCXywjP6+Sx3/kqcOAZbftcF7XuY?=
 =?us-ascii?Q?V+fYl07MAOM9KAun0Ui/+8TG2r+Sipioe1jfRSKFboLmFxn2r9I2AyO+1j8J?=
 =?us-ascii?Q?I6ABkLlYDbRuC2huA/plUshkK4DVknDSQvWQz7tFyrgweBbKSPgSyVKLSCMD?=
 =?us-ascii?Q?UUPdTq4RvGvLowUPTQl55k/ohgVZwf9qMZ57M6cIhuY6lFwKOF30Rf6LWbC+?=
 =?us-ascii?Q?TQHxiAzs0YFQN9GCu7ihOdwnwsrreiDf0IRTrbm+MQOTCn1lc6FLJj98eBVm?=
 =?us-ascii?Q?suwcr6dkFY+BF00m88bAUoEDmwv0o30djpev8hQ4TFJT/e0aAsBQUxR6xgu0?=
 =?us-ascii?Q?d4C9sVZpHDpEXpTDglGf+qH2H8K6YGU23PxpbN5bL8KnIOYgZIT5QyvCYSEe?=
 =?us-ascii?Q?2h7ZPIdPBeKICxEQuyXlBss24w1oHiKHT+tk+B+3E2wL3q186O2JlK2nSoBn?=
 =?us-ascii?Q?NwJmiAGk9QVMdx64MfS2ZdeCA1VZH7lKpCtGjXQd+MxO4DlwNronipu8qdql?=
 =?us-ascii?Q?ORdSctSs4wOnuNbAjRCmSLvZP9f/YV8bEZOJKk7XLldHs9o5MFDuAG15ExtM?=
 =?us-ascii?Q?FwKFLP+RdVO89RxqYvu6Zw+7Kcsk/5Sbley9O2ADHkOog+mBYwf+vXdLiXzW?=
 =?us-ascii?Q?bFz51Gz6IWaQIPBK9HYZdUbUbEgOY7ZVooFeDWt0jPdIB4Xe0Y/yenGTOv7W?=
 =?us-ascii?Q?pjXDb6vDdokaB4aEzBz8fGwONMluh6VqjlZZUTbJJKsP7xsqYOFaXPAN9548?=
 =?us-ascii?Q?Ko1Q8exSxpU6q030BE78nxEdQ1Gl+krLktry3t3Ze5ZN8WmaIiHc8DGk4AU+?=
 =?us-ascii?Q?LBwV/nKwuA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcbc356c-9e04-420a-0a98-08de748238fb
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 15:26:18.4889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lPCb8UYQCMp/rxrlXsNS29yPvJi9bGsxWFTQif7cgpaP2M55CkVLz4qF+wuYItM6IgWWUxLN+grck3OZ7pVYWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10437
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_072626_076912_93B49629 
X-CRM114-Status: GOOD (  20.21  )
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

On Wed, Feb 25, 2026 at 02:38:55PM +0100, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>
> Add support for the uSDHC controller found in NXP S32N79 automotive SoCs.
>
> The controller is compatible with the existing sdhci-esdhc-imx driver.

"compatible" is not exactly,

Add support for the uSDHC controller found in NXP S32N79 automotive SoCs,
which reuse the existing sdhci-esdhc-imx driver with slice difference.

Compared with s32n79, needn't set ESDHC_FLAG_SKIP_CD_WAKE flags because
...

Frank
>
> Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---
>  drivers/mmc/host/sdhci-esdhc-imx.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index a7a5df673b0f..28288fca87ff 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -321,6 +321,14 @@ static struct esdhc_soc_data usdhc_s32g2_data = {
>  	.quirks = SDHCI_QUIRK_NO_LED,
>  };
>
> +static struct esdhc_soc_data usdhc_s32n79_data = {
> +	.flags = ESDHC_FLAG_USDHC | ESDHC_FLAG_MAN_TUNING
> +			| ESDHC_FLAG_HAVE_CAP1 | ESDHC_FLAG_HS200
> +			| ESDHC_FLAG_HS400 | ESDHC_FLAG_HS400_ES
> +			| ESDHC_FLAG_SKIP_ERR004536,
> +	.quirks = SDHCI_QUIRK_NO_LED,
> +};
> +
>  static struct esdhc_soc_data usdhc_imx7ulp_data = {
>  	.flags = ESDHC_FLAG_USDHC | ESDHC_FLAG_MAN_TUNING
>  			| ESDHC_FLAG_HAVE_CAP1 | ESDHC_FLAG_HS200
> @@ -408,6 +416,7 @@ static const struct of_device_id imx_esdhc_dt_ids[] = {
>  	{ .compatible = "fsl,imx95-usdhc", .data = &usdhc_imx95_data, },
>  	{ .compatible = "fsl,imxrt1050-usdhc", .data = &usdhc_imxrt1050_data, },
>  	{ .compatible = "nxp,s32g2-usdhc", .data = &usdhc_s32g2_data, },
> +	{ .compatible = "nxp,s32n79-usdhc", .data = &usdhc_s32n79_data, },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, imx_esdhc_dt_ids);
> --
> 2.43.0
>

