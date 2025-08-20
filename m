Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A38CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 22:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JnKbf1hFcVpCYbQusq2awBee1LQxawoZry3CuRG/f4I=; b=48t9KK+cHvbyNNl02nxlq2LXIm
	mD5b6Vkth8yUxrIwHJLvFLv+l9fPDpVAfcEuvZbL6GkiUem14v4GrMs9vcE0fULCl5A1RW93dCNe7
	zFEzpMOEXt23bzsFpYTMyMxpC+kZGeqHoqq1KOIoRM55/pZb7WgNYy/41BiUSEdez1b3jblQpyNAQ
	TVs4sI4O5Eg7UNm5K0gYoiWnGEWlcsQzeKyqchx3vonx5N+pWZB6rbDj09kA3zNKby9CtSeSDy4NX
	Vd/LsfMYuWQ85Uh2ZQaDROteTjb2W97mEq8FDkMesspG+07TSbftY4/E6rBFpOEPBZuedgZBnmyq5
	0gvTGWqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uorUh-0000000F781-47if;
	Wed, 20 Aug 2025 22:41:23 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uonND-0000000Ef5e-2JCS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 18:17:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xCF0Ta7J9oEI7a7nVrygT0IoVRSRYTDm4J04Yv3LHAoN0Qw3Mhux0+2Ul+2hL0Pn6mQc8h50g4K5Qtyg/yqwwDY2LrK2o+5om10OMHMPn/rRDLmzWtfBFs+Vwzbaqf1m/OEFbZm6hk0+WvX9U6yS6uMh/SiStlB2YFXaXjB/SUR1DgdAtJfraSWfX82FkEgI0/K32cGFldQLC45gQHZeLOpCFAVAJU69SZSwryM+jQipoWg2JGQyOj7LLbmXkemLQlJdKVsScJCZq66a/w5fooDfxZGn7Is5RhsJ9gRzaUTCZQMVh2/MEbJUfiSE+jfuG2z9geDjOiiDKA49qJbK4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JnKbf1hFcVpCYbQusq2awBee1LQxawoZry3CuRG/f4I=;
 b=fNMH5Gi3Qon67cDOQvYGgp4GE5x/xd+w93YSbqkL1GMmGb1bmxkG8I1jDbvcEScultSh+3s21BPYLxD9HQMo8uyL44kX8sjMCpVGdAaQ3/QTg1SHsSliZzOj1ZYd0WfjrMA1H/L+DyzDn7beXi7E4MGTvz72EGgSno0Wgs9HbJdEEtsdnfGIVq8FUjc2DFEbzQJWhdXZDCdz4+/47F0JG3sdBnaCxmbTkUd3lWm1eQZETrXnp1GKVwrDLxR0JwsSTVz9scG8LJ6+WTzPH9K4S+nROZim9sO77LuAmgWy8VHy1X9ElUIpkqGPs8Ig1lfgvK26o0cgNHWgxJg2ydmgfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JnKbf1hFcVpCYbQusq2awBee1LQxawoZry3CuRG/f4I=;
 b=PfP8mUGrRy5FePig7YFAi0GKobjz1M92P0jGmaN4DJ4vMmRXTteCJC3JETafAzh1YSP0LMtMr6K31zZaRPK7NnOOG4360uotDWv8qsO2e7NZp6NpsaLSpmsGDuPOdlCqURuZ3YubgESBETS1UDaJDxD5eY12I27MIELQ67H8AoWxC4I0AxVDm7OahcTaO1qCRjBvdmz/QtMsoqOucTjFb+MoXJOnnRnQ9jH8S3pUSaUAdGTkem7HmYvUUS7jR9KGzwrwuzSw/BaVMrWEBlzNfHyamPURGQhwwdkdtez6Efll6sIhuKMs+W/tL2agitgAjk5h/T0RHIdagVw+gzHl9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PA1PR04MB10441.eurprd04.prod.outlook.com (2603:10a6:102:447::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Wed, 20 Aug
 2025 18:17:18 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Wed, 20 Aug 2025
 18:17:18 +0000
Date: Wed, 20 Aug 2025 14:17:09 -0400
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-media@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] media: imx-jpeg: Add support for descriptor allocation
 from SRAM
Message-ID: <aKYRJap9Gwc2mFXh@lizhi-Precision-Tower-5810>
References: <20250820163046.209917-1-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820163046.209917-1-marek.vasut@mailbox.org>
X-ClientProxiedBy: BYAPR02CA0001.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::14) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PA1PR04MB10441:EE_
X-MS-Office365-Filtering-Correlation-Id: 05d79c9f-4eec-46fe-ca30-08dde015cc31
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|19092799006|7416014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XFPCKWT3JnSEiL5BZUJV87YOscJMviLcXVsuEvBzyN5DGhd0abAo7lqMBZrR?=
 =?us-ascii?Q?rtoYzAcIuOP8nuIbLTY5t8gNU27D5gIRyqJU+gHrUiMjDD77JqpGW3QfxG0a?=
 =?us-ascii?Q?cFxV139tBuYAoR98co0TlHHHbAN3K8wH7U9cDTDnPNVDnZ8H1ATR2x8DOE/a?=
 =?us-ascii?Q?2ti2r+7/FqRCa4XsLMkMxooCKO5eluiJcFZtImCltAIHypDa5tNYLA3TP4HA?=
 =?us-ascii?Q?HwQG4NfNs0W1ZKZa46G6zyWHOtQ6/+hb5Lb5M83d9J3reI/DigtixSMdd1In?=
 =?us-ascii?Q?yz0rD3HdxFqEMMPvjfGgYZimkudLhMPCQ135J1KaIHB2Dr/twAWsthR2d+Jr?=
 =?us-ascii?Q?QWZDk3jOWljr4ffVLx3sQSYZH+8DUQ6UhHN54RYVaSkMMec+fPwcWO18B0+8?=
 =?us-ascii?Q?IqLBk5rqAj7Xy+DDp9Tn9GTWL95yvqLiHKvebpJDChvGixBjZvOaAttGO3Qr?=
 =?us-ascii?Q?VDoJr81mYPVtyMIINp6Pv6O2MOC4j/mM92epSCVtukaz1BKUfQpU466Mse25?=
 =?us-ascii?Q?3JrmKGgu2McbyT2xzMNcrCA0xS9u9vNlXYwbokTPDeNq8uob9IS7SvOS8bWY?=
 =?us-ascii?Q?FYTMQCfW2xBdTGs5TYWTkaDWSBPg8rit5mHeTTW+MpNInTObmmRAiv5gR2mL?=
 =?us-ascii?Q?n4qkzxtnNYCh2ykI+XMdMU8Ss+zhtNfvY2ND0K9o4D9TTwrrlsR8XwECKN/A?=
 =?us-ascii?Q?BudgYIkg3jmkUTw9lOenbDi+vx6aeCcIi/kxcCCzti05m+V/+FE3esK4XiE+?=
 =?us-ascii?Q?p7MoRbVqHINPPhx0/f2veAJK9kK/AqLPOl8XR80tnLD4HFouFEDSU3tr6VBC?=
 =?us-ascii?Q?slrMby5UL6zY+Et3e1jmMhlDcrhjoZP7dF8RWP9lhFuXjpMP4eisUVKx0rDh?=
 =?us-ascii?Q?eK6gVHDkqpueK/uuJPZVk4P3BHKtjLZsshh0jMU3LOOMWaEBzeiIurSYQOtX?=
 =?us-ascii?Q?n5LJnvZ0ZBX3n4w4Pdq9VHyaABniRcxpPiU+y53UsvFMAaaWK4nEP4vZyGUL?=
 =?us-ascii?Q?MARs+DtHEL2vX1ynuniU1lcx8lHQNCW9jTsxK3x7oYGNnl4PnGKt0vPOFl2O?=
 =?us-ascii?Q?uVm7f36H4zyJHJXb/edlffTl40YTWQ6YXoEp66EhwHfw6G0M1O4KzuykyyHk?=
 =?us-ascii?Q?qbVmzxGXG1aCm6jqTzI1ZGq1xKRGxWEs8CtDcqV3REFaYflvA1Z94LCCutRY?=
 =?us-ascii?Q?hhA0tVQ0V2YDVKpu2avW9FSxQVTplRMtQjADuzy58iq+MnJWmwzG59+BXRen?=
 =?us-ascii?Q?6KCunT3E5DE60IQTbfleCstvTij2U6OeiLJ9P3wRnMSzQGlPkTyFHybM3uc6?=
 =?us-ascii?Q?ZDsIa9Eq4/mW/I2dQ/fpP9oBlHVeVwvQ0LHqtTq5FFUhaKxOP9sTmGiWVsUb?=
 =?us-ascii?Q?tQw0rMzeUh98HWxCEUtpEragADNbmTSsNupPnmSiBjLG9MayH2e4OyMnV6uv?=
 =?us-ascii?Q?4Ol1HSWLop2OBEbj44BXZ+NjXt628BH7g5HZlg3Av1uVOiImJLlBZg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(19092799006)(7416014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/vQi1CkUcm6CAA1qDOQzRaMq+YmkLr0imjz41KI1D+FDn7iRAW3zZAb73I3F?=
 =?us-ascii?Q?XoL5XcY50OrkMeq5KGD+FGOuv0erWUXLCudl0Lg+f2oprx6tl+ZYKgnz21W2?=
 =?us-ascii?Q?vj+gnacRe6B2NaXjq3imVOaERA4qGJj2T7Wn/LSu6bZNBZ/9d52ct5IeaGEg?=
 =?us-ascii?Q?iJ0zbcvABlS8u7agXZ0Byaw9/sWZXjwpWZxKgqt6X5DwJNKNwtL7XO2Q80uZ?=
 =?us-ascii?Q?exE1NEFCw7myOJBbrRO2wX22DKtwbEo215nY9AMr0JJ49LunssJtBu+CMkdp?=
 =?us-ascii?Q?BuwqOPXRbfrOhlayL7NprhUSf07jI9TjvMJFgWyNFBqRN71zF0ZroPX0zq+O?=
 =?us-ascii?Q?OciqOI+12sv08nmvjd4tLWS/n2Vu4PrRvFeVY8IEeZBUbtl/1OPdDCYoKUSq?=
 =?us-ascii?Q?bbRAQZo3DiVj1JLnOgcm3VXev2kxW5++1ju6HrMEs7zwrEAFT9F6HYp0UVSr?=
 =?us-ascii?Q?dLrK9ld68RCat+UjKn58kESQl95gJEp4pf6JIKNXXEWXxHKb5xI5Vc25Y4Pa?=
 =?us-ascii?Q?95oKF4H9xzVlf3Ia93XffusGb41hIJhr9hzm22QsQnjFnBQ/vWCUnkJ1n66S?=
 =?us-ascii?Q?S2qTK7VS45uDVISpq5f6LdLRm8lTTy00H/XNo8qedqO3lI48uc8/qpO5AnyW?=
 =?us-ascii?Q?04nw1qNmg6tV8AgoCVyrIzW6YF9JuJMT+5wBJ+0wYC4hPcCR6CA3EolX4ade?=
 =?us-ascii?Q?C8HFvrTpuzqOBiwwI7TbopRy1RvAxmjtHcRhkiQqzHaa3AQ5/m4pryjVsMe3?=
 =?us-ascii?Q?TjxuJSv6ft+Jg1V0LxGq51uYPslJccaCMBLQLe0KZD71SSKPtX4QqcEYamrv?=
 =?us-ascii?Q?X7J/3aLczJWYPY3VjC6/4qBRl9kvgtvJqU12P8W6izSQzHNZSoBa+fDfaPzK?=
 =?us-ascii?Q?yHGC2IH+g0SNEGQrJN0IG3/5tuNHNieoyYO0EPMRHs13YXzgm1n73oT5gq3B?=
 =?us-ascii?Q?JsCqRAohMrUe8/hN1mL1ncI2y/llkBLlphMelGur+aOafzhhNSmogyCRoZjq?=
 =?us-ascii?Q?9Li8Z2rhy3djnW4AaMCgk57OjIrpA+4i/m7aDSwz4+b8rSbcklNqkX5bIv55?=
 =?us-ascii?Q?dlKr4gHc3PulU7w11OSCpKGBY3DmK+DDL446npisVh0xIhjipiKAWpgtrJO4?=
 =?us-ascii?Q?ODogY8CKNtj/95Gma+fcqZQFwxdxbUTEdbpeAOMkwPVWSVjuIchxv4tou5j3?=
 =?us-ascii?Q?FP7DB/sQTAfxQLEOUBVbakxQdcagGjfka+i6wmXiM42M1Ffh/lzAwN93sdDE?=
 =?us-ascii?Q?Y95UXvH+3iIrXohQN86xcqwgnJaKit4TrOTLJcys3mxeYzNYnOk17ZiJhLR8?=
 =?us-ascii?Q?Ex74WgrdFR2MuTOuXoKipTMNOOY6ttp3n4Fg2MreBzkkW1D2yYfKY0o+dvOD?=
 =?us-ascii?Q?wqHYMa326IdbjBiIQyweEpY9zlGl/2ydVNmb9ywM2mhGf7RkJqoulAWGjZGA?=
 =?us-ascii?Q?2WbXlks9OZQiL8N/nfwJidLEh37ga0cJlxNLFWwElW57B7notb5JcOi8pS6X?=
 =?us-ascii?Q?h2ZZUi3AoZTnjPNic4OumboKmqedWi3zneAnJ1+ZqJlus7H0qN4o6O+vhMvt?=
 =?us-ascii?Q?U8vy0OtGYAwyD8RegBEnsOCPzBdt2b1V9YTTPX+e?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05d79c9f-4eec-46fe-ca30-08dde015cc31
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 18:17:18.3295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7OV2a3XqDMUv7pKarT2kGi2mxRWmcidCKdQ/pw0SRUvSjXqwee2KX+3Fbsvk9zd3PFsU+pLFrPiqcx8CDUqMuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10441
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_111723_616836_4D8FB7D8 
X-CRM114-Status: GOOD (  21.17  )
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

On Wed, Aug 20, 2025 at 06:29:53PM +0200, Marek Vasut wrote:
> Add support for optional allocation of bitstream descriptors from SRAM
> instead of DRAM. In case the encoder/decoder DT node contains 'sram'
> property which points to 'mmio-sram', the driver will attempt to use
> the SRAM instead of DRAM for descriptor allocation, which might improve
> performance.
>
> This however helps on i.MX95 with sporadic SLOTn_STATUS IMG_RD_ERR bit 11
> being triggered during JPEG encoding. The following pipeline triggers the
> problem when descriptors get allocated from DRAM, the pipeline often hangs
> after a few seconds and the encoder driver indicates "timeout, cancel it" :

Do you know why this happen if descriptor is in DRAM? why sram help this
case?

>
> gst-launch-1.0 videotestsrc ! video/x-raw,width=256,height=256,format=YUY2 ! \
>                queue ! v4l2jpegenc ! queue ! fakesink
>
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
...
> -							   GFP_ATOMIC);
> +	jpeg->slot_data.cfg_dec_vaddr = mxc_jpeg_alloc(jpeg, jpeg->slot_data.cfg_dec_size,
> +						       &jpeg->slot_data.cfg_dec_daddr);
>  	if (!jpeg->slot_data.cfg_dec_vaddr)
>  		goto err;
>
> @@ -2902,6 +2911,10 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
>  	jpeg->dev = dev;
>  	jpeg->mode = mode;
>
> +	/* SRAM pool is optional */
> +	jpeg->sram_pool = of_gen_pool_get(pdev->dev.of_node, "sram", 0);

Need update binding doc nxp,imx8-jpeg.yaml

Frank

> +	dev_info(dev, "Using DMA descriptor pool in %cRAM\n", jpeg->sram_pool ? 'S' : 'D');
> +
>  	/* Get clocks */
>  	ret = devm_clk_bulk_get_all(&pdev->dev, &jpeg->clks);
>  	if (ret < 0) {
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
> index 7f0910fc9b47e..311f2f2ac519f 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
> @@ -142,6 +142,7 @@ struct mxc_jpeg_dev {
>  	int				num_domains;
>  	struct device			**pd_dev;
>  	struct device_link		**pd_link;
> +	struct gen_pool			*sram_pool;
>  };
>
>  /**
> --
> 2.50.1
>

