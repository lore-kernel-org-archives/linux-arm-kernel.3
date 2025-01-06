Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6817EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 16:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7CRsG/nYorG2F1PPrLjTJSwIhUFgjNLF8a3lY9S6blY=; b=tncStTTD7FBVlUTSu9JU+hqUAp
	RxyGuJoSGA6K3ONmp3eUCJHt3o0c5TDD8VYvOryKPL81TEowZxHNAJL7jrkGbpoNRhswf260rhYbP
	jCy1ojkkyvc58uoQ4N06JcrPrBpM9BuvmXIAeZcpwZH3lRj4RZrrXxBh4S+Rt5GXD44cv3je3/Aup
	03iug2OAVURzQYtuLw0hGQodb2k57ItN+YznZb2KLHZeLZLZ8VUXdiqFNwdagBvxk0XBp9nDviE4h
	VI5zUi/tP0WI6SBuFScukXpmzeWWdcv5YZTfvxR3Tbf+rglZn14Zi1eVNLScad3rLbPsNtvwKxa+e
	m16LDm+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqE0-000000020Eo-3w9g;
	Mon, 06 Jan 2025 16:45:08 +0000
Received: from mail-db5eur02on2062a.outbound.protection.outlook.com ([2a01:111:f403:2608::62a] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqBd-00000001z8T-2O0G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 16:42:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sSKHYQZzIdEAbvMycGYk+SG6nAJ7wL/dOMRgQGuQB0pDtOHm4V6ryEIWZ/pqfmOOWNE+74Qb9lrMtIw7LiTtX+hLrpXLhlolObFb+0Uvit2eWNOhOIsPS8g04XZFFnMtez8Cg0opvGz8ArMHZxm3R54nEB6BcXcJ1ov3ov57ZOG8pp1zzRQ8lSPu2qMAk4s29FF4sipfHR+DRZlXEqDN4hNehmtiXULy6+jMBv7sgYrCx0O2V5cQi5QER2/sOKRIYZJjrcOWB4h5VXPCNLB1X2FexSe94B32kneB5khzapQDIoqkCFsTArkI4OCNDtKfiHmjJLR6z92c6AFWqVZJnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CRsG/nYorG2F1PPrLjTJSwIhUFgjNLF8a3lY9S6blY=;
 b=CDxH6FUU2d5tpw5DNzRF2vx8KsFxZ2rBYR/k3tqaq3PX0UTnFmW/2+d+sL0XrVHg/kjhAw9qXasXFOd/E9ybWjZ7k3fH6Fojx2noxVLvA9kY2bb3rFOkXhecG/fDtuE54MPT/zpjZcevres+YwZykN+lFWvh50LX4+j959U/7h/QqAiybsWeDtaTqVZY4q6G9Ft4ocdQZctA5lM+kD7Jib7dzraBHkGLaboWHPFkOW6JGEUG3H6HzmYj0IVYOKprqHMg9rU9jY0yUdbCXHojQULwh0Qcf1qs7kf05oNhNSCsLWrV20s0IGdYfXS3nOvKcIqT2sJv1ftF0h/DiDaJfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7CRsG/nYorG2F1PPrLjTJSwIhUFgjNLF8a3lY9S6blY=;
 b=QEQWFDlVR2PFMPbX91Scb20YE/Cqn1cpeZmDNNkcALUmN+eQUYfkjN4Iq5MsVT+HvffbmHSs3H+B9QaUpuri0OngbbrHmFbccZ9aQLw/XPEZBA4Yarfmgobc24CRco7bxLRmzr+jvyAX56VG/kphKffvcwNZfPux4XjGanY5AViqT341LPiiRrRY6Jb+dUuYigAXuaDga1Q/SzgpWbf+fUyGHqX0seNqFDFQKX/xW1oHz2c4YFVIbZnZ2TQGHZntvg4Fmwta32kfbSzn/Jf3g7VkNvAEuylw1fu9uqJ53JOt0cn5TpzcXBze42LWoE3btngXd+Dz4hu20DXidkNsew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8125.eurprd04.prod.outlook.com (2603:10a6:102:1cc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 16:42:34 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 16:42:34 +0000
Date: Mon, 6 Jan 2025 11:42:26 -0500
From: Frank Li <Frank.li@nxp.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH RESEND] arm64: dts: imx8mn-bsh-smm-s2pro: Remove invalid
 audio codec clock
Message-ID: <Z3wH8qcPlP6Vw720@lizhi-Precision-Tower-5810>
References: <20250106140330.2071858-1-festevam@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106140330.2071858-1-festevam@gmail.com>
X-ClientProxiedBy: BY5PR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::18) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8125:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bcaf3a2-a75a-4e17-e14e-08dd2e711f10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FvDgCWAcVvMldOO5PYyRYVDFp0oE1Mum8E83ToLH9SPNge1JdCiS2/TIyEtO?=
 =?us-ascii?Q?iTBm1doEijVCRHdXXLEKFucf03fn+0P8oywn30WWpKSCun6+NJKPLxw59Pvs?=
 =?us-ascii?Q?wU2uz+j37jWxJdUssXdk4NUQenJR8S2FroxBRPpqGsqQsxKg27LDktBrOOh2?=
 =?us-ascii?Q?6SLkdGI7Sm4L9dI84dGQ3FrJl5cS+BYYEqY1GfyR8OlmEYG2zdEMeITdjoNV?=
 =?us-ascii?Q?ljGBndtjYgMlvAk88LA9tBKT+WEjX55A+qMzgz+1U1KxCSE7FOTu0UEJMqLC?=
 =?us-ascii?Q?OBQxu4MjOx9gHwio3CFu1ALbYSQvIksIffARtiQPsZPHkn8q8iAYXuydRF1L?=
 =?us-ascii?Q?PM2kbWhfE7m+o6Reh/MfHBkmu+DmKYP9Uq8oNCLwV4JYjirsDYXcoxmAu6nC?=
 =?us-ascii?Q?jdyTDooLATvSdRhCzvHKINU268m/SE3lxVcRvpbr4m3UrkjXUOwdkDiysadV?=
 =?us-ascii?Q?283A6TP1WN63Gv8Lu4aPokqfWkKPar7PtmwQcUVNxl1yZg40LCKxpuhX9fny?=
 =?us-ascii?Q?irmegDirEwKDEGrw+Uw3HvtbsvPWr3U/iFJE9iyccyjtbsbLg+m5QgHFKMyk?=
 =?us-ascii?Q?GqMRkAuqLosMkwUQK5RV3SvdvHoAd07Ge6ONoltTAEOrBqCPyOgv8V06sIGu?=
 =?us-ascii?Q?2gofZQoIvUKPRVqact29K8p7KW8NCWHE1hK7JL7DPvZUMLtlLW/b31hpSgY1?=
 =?us-ascii?Q?U81ol7xoPGV7P3X0t38Xngi4BUavWW50X+xzJ+0ROsKhhrzMaiI+3a/S81Wh?=
 =?us-ascii?Q?nWXAoofRFAFBrGDOKZayTtzpYXoR+DkU1hT0wgBajy1E9PV48ZatnmMD7Md/?=
 =?us-ascii?Q?PB64ffgbwadIxEjVJVuXp6jPp2sWNNG3fkl8d6wDc816oYsAVnZxSjEugAc3?=
 =?us-ascii?Q?47rsKW9cXs3dhlY9X+ZYUNvoTXXSb1ouSp0j5glGlxP6ulEPyo48wHuFMh9D?=
 =?us-ascii?Q?s72pfQZyd8hIU+9yDJjQed1B7x1+lJcjyxVzrKSqkwrI16FylbXXAV3/xhZy?=
 =?us-ascii?Q?VxisxTdmVbpVpDNW+gkkc99SSru3/MjOUekT/mWaBq3DvLeATfdg6a5z0cIe?=
 =?us-ascii?Q?rNjIzCMa9qbjW+4aggSF9HEMJ3OLerQVyYG0KOZUnRWrv2FOrYw9yvNGk2eI?=
 =?us-ascii?Q?+fzPHmXsbvnOEtyqiC8LpgM9qQ3dXrkKmAtOowwDrI1gixy60PA4e0nD40AO?=
 =?us-ascii?Q?S6MoKXnFwixhpPgmrgWZczwecaqH5c/wzsIjujInguUxLOF+IyxP2OMjPPvg?=
 =?us-ascii?Q?rk/VVyoVWLFMBgpzI2TcwdHb4ugkAudGmwk6GGZBPLX+k9b9MP/VsJ2wcKVz?=
 =?us-ascii?Q?3k8pXQWydxZehTdoU/BfO2GrV9vcfrHaCouyJ62zw3kjGhinGXMoaBMIIGb5?=
 =?us-ascii?Q?aVTeY7rv6Y32bzAPgBa9f3f9YbfCG8L+sh3zN7Km2LzRiEXbhUsZLYic4GLA?=
 =?us-ascii?Q?ewVsL/PEaDkWVUFFAABegmD8rTjDSW46?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l33AGYlY9RV8/brWEKgUIdid8Ate2Urs8R3+ZDLFQhwBtkYyerazNM/KXPH9?=
 =?us-ascii?Q?I511CkGj6Os4QDoNI6vBcUJ0iZXa+cnnvRl0lYzpqkwj78hRMVQgNgYnQ8uC?=
 =?us-ascii?Q?WTo9twSYGBNo0IK4ANXDAtHq4H9Dfeehk+MFixSymXaa8XllNswQyHh5n8gv?=
 =?us-ascii?Q?3/J7dT8vTCDOLncPqAm7IYNHvXgVy2Mkk1FtQ7eBMXUcA6GN5XnKSJOTIvLD?=
 =?us-ascii?Q?ofjoUuqTqr9J0dBMBnk5iY1Kn7eVAH1H6detDmYIxXJXUyuijcGTlFaQ7TLH?=
 =?us-ascii?Q?uBrPSA88l0fvi3wtK4Y8ISyGBjP1tIMxCe1MJwLXDBRS1TN4GGCDW2YuJgNW?=
 =?us-ascii?Q?1yiZN0ectdyw6susEi9hacM9aJs9nFJphIUwVbp26h3ZvhhonL0hfPVaP7g5?=
 =?us-ascii?Q?3LlV/hlLMUjfiZ8HenetNx+yIsmWi0z+ysQGucAAJUmzLjetyoh8wu/0rQ4G?=
 =?us-ascii?Q?feNxRGF26SjWHSYpVoqHn08lv7VaYogaBEQ1wlcDVCCB9s3hX93JBL6frPix?=
 =?us-ascii?Q?xsORfXtWYnl1OjEzLRk77Pz1XFM3Z9Qu5lIMDzd2UGRBqARph0SjRkQjReMn?=
 =?us-ascii?Q?v7wO94KwB0Rke8/s/hA7bmqP+z4YwTK8OZaSR24htLCGEyUm+Ujzrs+AB4H7?=
 =?us-ascii?Q?/DwSjs4vWzB3bTY/lWd7zNbpDonOeYR0zGHgg7JBDsHq1iRzCXecUhdLjnku?=
 =?us-ascii?Q?yB5yKdtdGYrqXkw9Uk0CmtHZvz2tZYaEKl7jjPJxIzRmgL3wkfmRFqBhefTR?=
 =?us-ascii?Q?55AP7my97Mc68m+yjZlsuve3zGZumWqARDZXX19iAJB6wfi2FavWEZfb+sdZ?=
 =?us-ascii?Q?ActXmSbSR8i+DRGxFMBDtasMkIeSUVs5ZKy54VvxGBgWyFcKbQZa9Nn3Wtks?=
 =?us-ascii?Q?+sgptugB6WMM5QC76cuZvwCt+SMwB1S05DlLiawDStU4z+st913XEjJp7u8F?=
 =?us-ascii?Q?JrZ7tFU3jdy1X2ZP6ZLcfJLSBplszkOTJe+7R1LF5lkh0UsRhLzs8Ush3whx?=
 =?us-ascii?Q?klnU3EDLQnAyu/d/bKjpZxcpBuoaJoI9JLOaHmYsrl/bcet8E/S1BvDX/HZ0?=
 =?us-ascii?Q?fqF4jbBYVtnUrDIYySMvc6SMLxnOUXVQTP+ECxWWxis4We3rRLx7ndRP5F5M?=
 =?us-ascii?Q?81+roqP4XfzWJ8iolg14ZyecURNpJaihV+FpTyG1VF6jfbfxLO5YIMklc+kS?=
 =?us-ascii?Q?Nl7EiJw0uSnN1Oa5XMq8WiOR/uTqtpmr/5QVKmDkNFfnXIHB7I8sfWGKRawh?=
 =?us-ascii?Q?pefDyHYmLKtyjMg96nJCkfqBFClBZOJOPD+IlNqTlsClS6GK2KR0cu8MEVMY?=
 =?us-ascii?Q?l0AnQfCrKFjbzm+g3xnfOeqBN+H1aO8fKfyLXHAlQXAx/1MQrkXzl7QZ1JwG?=
 =?us-ascii?Q?d0ErQmqmLhpU+SZWofJRvl1GuBXBZYUHKuv+K6rbJhqdB7Vy7HHQWjP8uiC8?=
 =?us-ascii?Q?b/b9Px/KeIs6GheohksOHKOX5QXFyUsAZGM57o5owF8N5EXAmId1MtB0gdmV?=
 =?us-ascii?Q?Yv/b1tpw5w00uetdWCy39Nwd5RIyZeKQgaDsJdq47GuOQUWhmI4+MdGvmZYB?=
 =?us-ascii?Q?b/1NKEKRY5bKLhtXcyTW7GfZelnOS83LnPzK1z6T?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bcaf3a2-a75a-4e17-e14e-08dd2e711f10
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 16:42:34.4751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kgsduBlIysgLj8OH32+2uFM0c56eBnqbR/OqDL4hK1vqtlRf0YkL8sq0Xj70YLw5zC/wnJja7II0ERv7oR+OTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_084241_617461_A4AC3134 
X-CRM114-Status: GOOD (  16.92  )
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

On Mon, Jan 06, 2025 at 11:03:30AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
>
> According to ti,tlv320dac3100.yaml, 'clocks' is not a valid
> property.
>
> Remove it to fix the following dt-schema warning:
>
> Unevaluated properties are not allowed ('clocks' was unexpected)
>
> Signed-off-by: Fabio Estevam <festevam@denx.de>

nit: wrap at 75 chars.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts
> index c6ad65becc97..475cbf9e0d1e 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts
> @@ -64,7 +64,6 @@ tlv320dac3101: audio-codec@18 {
>  		DVDD-supply = <&buck5_reg>;
>  		reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
>  		ai31xx-micbias-vg = <MICBIAS_AVDDV>;
> -		clocks = <&clk IMX8MN_CLK_SAI3_ROOT>;
>  	};
>  };
>
> --
> 2.34.1
>

