Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8D7CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 15:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MmmOhXEWLv9zXOzKoJkL2OSlv5kvnGUJZU3yFTwVxTs=; b=C22W1vkYcSj3GXhP3tOJfX7otl
	ViNf/zFvX7a8sRShavNEvvA23fBlwGVaxwt4QOei/UgA23sR/7BQNMjak4IpQVORuZEccRJtpqS5B
	rsZAavpbnnXJrIIBh+R2C8D/6n26HC10EMonXtc2L2s/XoW+dL+ml2z6qxl4myJPgB5UImbp34zLE
	PjwhkfYVHOcT1NoOPNQH3vEzG+oEaZLBv0xbsKBEjwcLQwrKpQDSiw14w6tyAN9PEaBa7nOkN/ngG
	f0dOopfr/NnRMYsJh72lDcBAvC1ttcJGf02gLgXnlmIBOUI9tvzJ0wsjFIkspg6S2QQpYGYXBiATY
	djm69KRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMoeV-0000000H9Nj-0XIe;
	Tue, 12 May 2026 15:04:07 +0000
Received: from mail-francecentralazon11013048.outbound.protection.outlook.com ([40.107.162.48] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMoeS-0000000H9Me-0jXP;
	Tue, 12 May 2026 15:04:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HSCShb0wxrb+sc2Yt0vHhay+mNG0g3xupnQh/9upW5oMYKeWEMGgLsLF0ndKLqk90w72Ex1T7aMMyXRwrcBWFoqnm+it4md/jeHUdlKmf+nC69+aTdj+tUsglX0w/N/o28xex5rECcjVu5iD4niNRO3+Yya+GWPyKacJXBgp7vm7/HY4iDu7IOOASzZN6ESpbAD2ATd2jvpudJTnu1YBUHcMKHrb4X3bSbfZNYkAwPay7CeydYDgl1qqIpqqbW5xuXZzBU5+Dxotz18p1DeCXhLztDynovptGFdgdUHuAJ0FQeFuoXV7PoRg+yusPWNuaK0eicLVbdJr43Yr/VxxTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MmmOhXEWLv9zXOzKoJkL2OSlv5kvnGUJZU3yFTwVxTs=;
 b=PIedMy5T3l4LffKxmSzX6eR0ub8nzv85WWQ/8rKnBQ6XwZO4qUKk38z1rTRUboZ9QGjPR0tSPVQU+Fq1GrrwnXrQH4MMzJDXTALlDsA+qsXSqb/P9QABVChWFL/B7yrlb/JU+Nic9kpMAz68WhD0+fcFuLE3C/DtS/NOvchu07j8o6s0P0BIoiaZ6rcQeWyTcpIV7GMhwYCBH0SFQYjCuiqx4gy/YxjeIM/ouGoS533nXkQ58W/SxF98mRU3lSmhu3Ketq8oVBynA/snxyc39Q4u/hz8z8naAccvebkrSZvv+IX2v/ZFzGEBT2ihsmcSODfmPVWHALim0q+nlHpV5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MmmOhXEWLv9zXOzKoJkL2OSlv5kvnGUJZU3yFTwVxTs=;
 b=XBBj2SkzhTdPsW19kiYs8tAQSUVhfBFTR0ZqqzQ2sT9TWTZxxPngxubnUPuhQNB2IMCHhytlFf9ttdYuZa2EBTUTDlaO+WP/elqGUReePgFUkM0HItojBDth9lMV8budxSNNDpkqDegxyNYV0BPdA9ggwc8pgvKOzY9KpPcJ9rR6gqG0y8+Wyg16ECnMUTTXJ/fBMkh4Bela1YhvScDPNaTNqPlfi1Vd+hUFuA1r6nwPRFxJYeAmzgkEeBAjFcKS0WKbqZzr6uzWR6hHZnOFm5Jia89X9eLWSWPHK2btY4MIFHSSTKo/MEwb1Wzie5xx/ily5mQQY/qc6eSWK8LBcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU7PR04MB11089.eurprd04.prod.outlook.com (2603:10a6:10:5b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 15:03:57 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 15:03:57 +0000
Date: Tue, 12 May 2026 11:03:49 -0400
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com,
	a.fatoum@pengutronix.de, franz.schnyder@toradex.com,
	stefano.radaelli21@gmail.com, linux-phy@lists.infradead.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] phy: fsl-imx8mq-usb: set usb phy to be wakeup capable
Message-ID: <agNBVVufDeBSs0y6@lizhi-Precision-Tower-5810>
References: <20260512101046.1498096-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512101046.1498096-1-xu.yang_2@nxp.com>
X-ClientProxiedBy: SA1P222CA0177.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::25) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU7PR04MB11089:EE_
X-MS-Office365-Filtering-Correlation-Id: aa015b16-1be2-49b5-8789-08deb037b0e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|19092799006|38350700014|11063799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: nFvRLS3vega0WEORfTJbDzFtZ/9u4/VZ6DXSJVqz7avAXQzA0MoOCOixVMOWrcj6/xReERLcFNX7KYkr4mD7ykUSY1drHCy6ZywPEP9wVS76SdnzIdMOJrH0Y8g2amISUOPueXQJ7vjLCQE0KiWlzZCH9PKeIxLJgnrmgG4XQ24uiSWZVFRyF96yAVhOuxaYv6yC3QzM/9vC9IYMcxvuqrKUsIl6xWcdE8a19YLRn3KmoBdVoAaiHttYsIFKFVqp+9nUYpxoEse1wHyw7CpH8tFpXQ9X2it42YAZZNl5zCdSkIJAOHV8BVSb/C5J6zkN9LYOf7CgACSZgp2I/MFh9aDLfcJUqvS7N0txIlnB00++5VSNYY3PKwGPm8uVCTJqFE96azYyPKJXdQWReL0K1PIaTJMKHNh5PdrLAx+qpPi5De64+GBDS0mpBFefLSShfg7gdJCfNMkxyIYNz29kWeXVOLN7SlTqhSXx8UsXN7hoQ51gcpeVeqjRhbNM81E+xkUA+8Qzwf9UUlwu4iwnE6P+/a5TkXoVo7iUZPZHNcQGm1/oyO/be1AJcoFbgAP2lYVkOGiYR18qYByUx7A8GPUM91JQB99lgFcfWwYWWinyFYwvf35Z6i8BVE3kvf5eukl2RsVL9TNp7vcD7oDnv4NIjKAw2ja4Ayc9GB8Mz/SxwiDedxrpi5gY2lWbmqHMWpJRvxRJkcSSzQcCxXD/+lW41mLdzZJNZLGTf9m9S5fk4nnJoQBECFcc+8fXRFHc
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(19092799006)(38350700014)(11063799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OKL9HOwtGCtxfdJoW5R1mlE1bPIASVvZ0O6B7dWEXjUNR4h2SiMvQOgRbq3D?=
 =?us-ascii?Q?9pQ+lPsSxXkfhzHP+syHBysTjTaRByC71lvwUwxmZn/Ntr6qG9odSc4t/7ya?=
 =?us-ascii?Q?JCvZj9sUOg8Vz+hlbnoR1hgeyjUNWPYw20+ngBa7K9QBB3JzM209cC4/zfhg?=
 =?us-ascii?Q?KC/m01ZQWkfLH/zOKRLJI5ktGaeNsX0CItlB9E4L2riA836+Y+U0WMQjzyHD?=
 =?us-ascii?Q?TMCgNgXORmlFjBRrE8sWTZBqPMMxXB7HXqz0CQbW+d9Td4PXY9bXDr6NtEfw?=
 =?us-ascii?Q?Q988CUeCo+aILl9DfMOZIU2yDe0i64S4UhoPnwLjmgf0efYMvsgMupOwYArx?=
 =?us-ascii?Q?XnxB6H0TurEZFkkYiEMf1vS5PUdTdu5CkbTFPOuj5HhM91pXbO+VRwci70Rs?=
 =?us-ascii?Q?rnPVpf/ti05TBrctRGGnCBDSGF+yWzke+74+cfow+duY7RBRryvtBm+LPwGZ?=
 =?us-ascii?Q?0ltXL2Tu5QeGC9gJzFik/dHldq8BzNddaJ1ZqPwnOdomlbRBcHH1FkWByfc3?=
 =?us-ascii?Q?shM8/Golz9YcLlP+1icAyzKh4+iLDl8Q/PQlIpLtqNOMT70gM0ytSzhQ6D5u?=
 =?us-ascii?Q?7IsaCxj2ZjkZhqTK3cfmOv78u8hW7NNlIP+BD2Y4mOQFEMR6rsUVFm0Wd5cg?=
 =?us-ascii?Q?ZC2Zy8wKRITjsgjvIOkCf/DIJmSUuyirG+pI5vDbOF/gmcQ4RjwpAtG4ABxE?=
 =?us-ascii?Q?ncLTXXelmLkUd73cVy+lacr0Rl9SqZGT7HGB58Y0iJsgqScTfjrH1iyNTZ9i?=
 =?us-ascii?Q?YbDT7tit+ouNbJvbhDL9DKMzwc4qE/Wkwo83Bs+dNU/RCfZG2Q23kbppWfmt?=
 =?us-ascii?Q?mUxKJzNO9+TJuWngCGDlKi5bUuN9okPqsZErm9/1xUCGfWirJRV0KRor7KIq?=
 =?us-ascii?Q?JEWnAj34oZwB/VfT7hn6viqLRe33XU/mLAZNyKq8QY+8aeWVPh1bUXS6qSUl?=
 =?us-ascii?Q?KtATYFcvUQCDWfwhbzYatMICpI5OU1erHLcAvqQERyVqA14ojKiqFbS3vr/Y?=
 =?us-ascii?Q?iDzwE6+KFetVyfRP24ApUERLY+t0LqwjSybCWfcV8Zsb64D9OfBRqDC9gL/N?=
 =?us-ascii?Q?AJ6UoDomJo39ZCSDhtolBoIQZVRPPnvNQVrNEjLx52ktkHXzSfcQX43lFfOb?=
 =?us-ascii?Q?+0QHeTnfRl918V0m65WpEUKbVkfS+JgmEdxiLe/apliSwnS/aDPPXtA6KyP9?=
 =?us-ascii?Q?vjixNlcxuNScbkQ1SxHi0MMwgjNOtTWDU6R6+PYMxeM2GbK0VdlvOKdVRY9W?=
 =?us-ascii?Q?2vRa/eefresiTSkyvwbOX0TKE7D3Fj45N9bxoHRdoG/T98rnltnxP1/jaf4B?=
 =?us-ascii?Q?yPByw1XZOsIZBhorqRMusFkLjxnXaOfATibsYYpGO1kNfuegdmgxNZ4cqV8/?=
 =?us-ascii?Q?SuCXcytn/C6/fEV97OkrRg1/HiCdG0KBgSUH/18Bk26X9Gpd/WXmjfoswuZO?=
 =?us-ascii?Q?cN/S1S16kj0y/A8VU8ds2LeTJfbAloTNBTc0yr35orzZs+AP+xnUYjQpnUCZ?=
 =?us-ascii?Q?nyPNr4NjqCpaIN30q8Yc/z29B+GkQNHlgfslBsnIcCKHH14WHyYQHnT0qnID?=
 =?us-ascii?Q?sln7tpEWRyeTDf4rdP9n8OFikSOop1BZVkt1bEsgn5gFPA/xJHupANSAXBsS?=
 =?us-ascii?Q?VdUqb3y9Tz08+zoqfMa6XEi3C1lOehmV5ii75IBlhJu2BEuT/wbIXliyjU5C?=
 =?us-ascii?Q?U1rd0zlXaiMUWpGOXxOz+lbjEIVgyV+nUL9bj38IsR98IEfFF2u3GmeAKFhm?=
 =?us-ascii?Q?klzbX10QwA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa015b16-1be2-49b5-8789-08deb037b0e9
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 15:03:57.2373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3qboxsb0vdV7budCwcQ+9XctAQ5j6IbbaAXxBIKmTIRzTdoqOC7vu60Jkf2LPAcUKgsgamD8JVlLGv6pGPCrvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_080404_218238_235A5081 
X-CRM114-Status: GOOD (  15.85  )
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

On Tue, May 12, 2026 at 06:10:46PM +0800, Xu Yang wrote:
> USB remote wakeup need its PHY power domain to be active,
> so set PHY to be wakeup capable.

The reason should usb phy support USB wakeup.

"Set PHY wakeup capable because this PHY supports remote wakeup function." ?

Frank

>
> Signed-off-by: Li Jun <jun.li@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>
> ---
> Changes in v2:
>  - no changes
> ---
>  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> index 958d114b0c83..50b67f1e6a90 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> @@ -750,6 +750,7 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  					"failed to get tca\n");
>
>  	imx8m_get_phy_tuning_data(imx_phy);
> +	device_set_wakeup_capable(dev, true);
>
>  	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
>
> --
> 2.34.1
>

