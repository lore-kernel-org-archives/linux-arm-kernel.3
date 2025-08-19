Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF719CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 18:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ImlcGm6ka0vXFtU3rIKPGUSpOHKhnTlnumo+4xkfSEA=; b=J72E61IELTKBS7pT+Nb1q86OhX
	bLVRqVNmOjSD/QgDk7Gv9seUpuHz4KESsjtYuKybep3x4jMNcmcC9cLmfByaSxfsxn8G2vguE87nQ
	RW19WXPa4B9WOlyCt/iB+YhUqJXnTJRqXulqXyOuIfJNWNzXwPhZFg+n93/mrHaG6jFXvf2B9hS4g
	iyIdB/oCVj9OMgVAvQFF+9IKQXog+imQjtspar8YlURs47EExGzHu1c/tQD8LjX0G4zh76+iNSJyc
	ws5o5q4aGO4rSz7Mgavor4/7McH3Jc8HpyC9bcWAwXatHu+7gENViFDbvK2A7A0W5MRrsGLdJcNml
	mBaqVBeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoR05-0000000BHfJ-3oMU;
	Tue, 19 Aug 2025 18:24:01 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoOWp-0000000AvNw-3sDH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 15:45:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mRe4iLZClgVfB2vohxp/S4vEvgpNcW0hzfBRc1fyDkZddNCOtg3BIR3oS8MZ0sPiKyO3kXDcn2KiuuOvLjj5neRNz5VDhrRPcaH2YKOZ8A5lUekAwRtEYO48Sd1mx/xI9eF5+tMsjuDj+DBMUPBoXARIgoSD9Fvt7UqZmr8DL/uWDpPl+AU6U6SjTZnZKSkXKOvD1etcsh/AVhIM14a0a3W3kAdOiITt3tOr5z4RT+/dez/3ZcWmq0FU5IfrtVEO20ADMLPlY1scXQ4oNE9VYs1UYNyfTBiqPfhz+XMEiQZOhA/J4xJHzztmRdhYMnY9/S98MGPJw4V9TsyvpzkS7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ImlcGm6ka0vXFtU3rIKPGUSpOHKhnTlnumo+4xkfSEA=;
 b=Nc04ZIHlSUSlLJlAFDiWTycM2aimAnKO87NLuy23SirdXGrI5O5N2tgxmO1kU94k9QOLohKvnh+HPVoGaW3/xfrMjqoZhcGziI9BkZGBf8dVgd0AMubtFpCfPJJIvnz2Z2RlUwg1WjLrWJAeqUq4363N3cM7iE68NO8qJfAOXGJ1//MY7Ckk4OHocORG5HUX8rDWDLJh1iNrKIQe5jLxM4fZ0sTY0fs5SNheGUcpc+kesC07kUiZ6upMpwXjqFSfaI4kjQa3cGalrvJykamKoTveImaFJhcuAJdTvWgfVMs0kKUcorD/bGVBAFtekE+fdaCMoXZFd1pRhXidpBmiMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ImlcGm6ka0vXFtU3rIKPGUSpOHKhnTlnumo+4xkfSEA=;
 b=l7fpc6gkZq0X3eseB8PmOpU3HiUxRDNXEawrqm5LjgvyAIoe87ZEqiR4Vw2p3X5F6jBaG8TMx8S0+dkn0Pp0qoPQpb8iLizE+ip1I82GfO7FvqMrMKh9GsBh9kS5PXiH2ukmCIHs33eh2c1atXPVvIB4Y27IAkZDewWrPB7Gj1jRc+adRqvkx+xyr6+96OZFdCX/aTzBFVD0O8Fx6FFA0pLR+FvU6g+ACRbxu4g0sgUEQhzUtOCUwnLvcON8mrsOmfGy09fNbb5glgSxR0Zz+tnNp+KIuoF8fFjYIIhq/B9x4vciEr6E4NUJrYrmzo1rOyVkVgGOcd5FMLh3zytD8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB11044.eurprd04.prod.outlook.com (2603:10a6:150:215::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Tue, 19 Aug
 2025 15:45:30 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9052.011; Tue, 19 Aug 2025
 15:45:30 +0000
Date: Tue, 19 Aug 2025 11:45:21 -0400
From: Frank Li <Frank.li@nxp.com>
To: Guoniu Zhou <guoniu.zhou@nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/4] media: imx8mq-mipi-csi2: Enhance the driver to
 meet more usage case
Message-ID: <aKScEQp4RJ5FuLJa@lizhi-Precision-Tower-5810>
References: <20250819-csi2_imx8mq-v4-0-c16b1d8f88a9@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-csi2_imx8mq-v4-0-c16b1d8f88a9@nxp.com>
X-ClientProxiedBy: SJ2PR07CA0019.namprd07.prod.outlook.com
 (2603:10b6:a03:505::21) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB11044:EE_
X-MS-Office365-Filtering-Correlation-Id: a4978797-887d-413c-bc3b-08dddf376d22
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|52116014|1800799024|376014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gM35pQAbU36wvJ5Tb2Id+Pn4i4WTHr5iRMkZRUJWHK+sJJdAEj8Cngh+8k+b?=
 =?us-ascii?Q?y2UpXtUqDqgLWffzgZhPc8gYOmt/CBoE4Gqs5teHGpTUDWoE3cT8KY0vZlPi?=
 =?us-ascii?Q?k2E7uY/1FBaHGojtjzdYwg4Q7c70qF1ZSq/TkiDrxDKNZqN7oNB6V4pGOhAw?=
 =?us-ascii?Q?KCuV3/5GNFFhaI5Uqhp8NNxkDLCCgtt03TLNXIpW9HFj3Al+lk37PR8i8YyY?=
 =?us-ascii?Q?krZkH1ZLMrlqYpAP1KWCv+deeW+pPMsYHroFy5TUN2OUHU105W+kNkaukJ99?=
 =?us-ascii?Q?t3CLIwWlJmXF9HoUKk3Lqa7JNrEXkSX1YKxSD45/y78OH8ulXRApaxVy/+cE?=
 =?us-ascii?Q?KyYWY4lB9HnqCqn8+b07rQbUR9pS4C7k6U5SMhPAEdAceWCuqhgh6RH+qIwX?=
 =?us-ascii?Q?BeT/nSXaeMnpkseaver/wem18bU+U961e99vVUyYqAmtZNlV3osrXfvpATE8?=
 =?us-ascii?Q?1BoIrWVe5IvFtimN5zedyjzEmVW2nMzlg3RFRv5kO6SFQhsoVXl6HEE/hFNG?=
 =?us-ascii?Q?3tS8LFMPjBpVt4kz5TYyls8PfLNyNjhx9iWobkBLDnCeGxm0UQb3NTs8ar6C?=
 =?us-ascii?Q?g/7liopoVE9o4XwM51OuvVyKEuRa+2iM6oQfO0kKPRaDD3vZgr4cCUI4TNtk?=
 =?us-ascii?Q?s85N18x+DNZO0XFVB1QUFXnr5gdU9NTvxcjLmIC2JWJN9+0B0Rg9Pj1MfWFS?=
 =?us-ascii?Q?H7f6ozUp/fnWVoReVkiRq8UvUkiKYSPBvlTOp0Rlerg2zQ18SUBfgb1TrrH9?=
 =?us-ascii?Q?A0yzxNceD2XgSIhsZb3C6A58tPpGMi+UA8iDKqTDj1d5WUgXxBIAkLnvZHqa?=
 =?us-ascii?Q?qVjg90fpR414XwTqpDNP7bleoHfXiJoEhg85ic/mHiK+B6uA6uEWKX3V4xax?=
 =?us-ascii?Q?QtyvVDO/rI3lE+C/o31Ok973lD27x1xITGDlV9eGLwQ6bclHiBYNjNBQQsYI?=
 =?us-ascii?Q?66HiaMGJjP9DyFcYipk1/b3W6WfyoKJMH6ZvJFC4YfUxfpkQT/EjEfLbi0B8?=
 =?us-ascii?Q?72XxOJVQD2TsD9MKmhCu1pYuEmOhebQWCs5heChUejShSlWtv2JAGQR+MbRG?=
 =?us-ascii?Q?bqFiU5lHVP+25DZbwQ+iRhZvT4qzrJidH9c4n+v8ryQsVwOBZ1k4YlrSriB+?=
 =?us-ascii?Q?rG2HLfAUuI4A9rnLMrQSzornVpykuK/fEM8zQEPPkxvjN6t1nZMr0/3L/SkC?=
 =?us-ascii?Q?DcG0csPlgt8KcfuWgIoMBqELmqAVBu3vw2zqetI9ignRJB0bPI0d3fVCLeZc?=
 =?us-ascii?Q?yOuG/q1Nrm2+n6ASNejtHSzgDd07pYdi8nyuSQ3L7CTGi0IkmHJUHKxgbPvz?=
 =?us-ascii?Q?pugZAqLCX9Qau6jtpjuBumLYvkmbnEQ6avgrIQx7tGaetOGtlH372v+T29NS?=
 =?us-ascii?Q?cmGF2fFu5aYkp+7CmTXnS8DSDtvULnIt552FSvka/bQ8sXNxShZGUz2Q+kw7?=
 =?us-ascii?Q?6ReFnn3fosdgDgXCBrkp19zaJija6+U+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(1800799024)(376014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MCJz4m4qruU1PnyI3kMKrjb7OZ1V2IKZVZXnp/Qx50mlSM/tNdOREIzUkohl?=
 =?us-ascii?Q?1s7/2cJlM48tiFzk0X49W9e6i7cMb2i/RTAebH7qniva6ECEmf7zyeiUcuEA?=
 =?us-ascii?Q?OnvXIfkreUaSUFuatDwNzvRlq1U87Nz+icXdIgUJ56ZVjQw2atvZUxHQgZ6w?=
 =?us-ascii?Q?hOBZnxUWbsticykMSDGSrbd+C+1JSPu5zbYb8mLN0I/ZNmpyUXPTpdqoWYRx?=
 =?us-ascii?Q?/YmbsHzk+Ynjn8aKTz5i7jDRrXgEcg3u6jRl9aKneYBrKTxtCXYkGEiDTgxh?=
 =?us-ascii?Q?GV7x0nf32RxpIc2QET+OCl6yQ02xkeb2UxcXkhKH8lqwc0/5mlLYiYUDpwug?=
 =?us-ascii?Q?L9VdDr35IIUo1wxbD0u1Uc+oOMDJw1toKY0EiOtsXxPcEEHFHyhv2owoCsov?=
 =?us-ascii?Q?7oSBGEDCmrS4wSQXrAhY5V4+ZcgVuJTPz7Tt5u0jHrGWql+W9WqJmMxmmzVN?=
 =?us-ascii?Q?W+KchVjtmbfQBmZoMyfuBlKNOachz6IKcf1e6a5YC/F8LEd6Zv/KSmMbz5te?=
 =?us-ascii?Q?ypDDX2vD9v+ipjofNvBfVLXc2hLugL0Bb76mr+8f+jMLVPibNLrfK0HgcAtR?=
 =?us-ascii?Q?wtNYtWuU8nMSMQKd4RjJPEzR46rBoPmZ9sJa86hqieTcIEYG66GaJ/icc9ff?=
 =?us-ascii?Q?z4b4q2ZUN4cGQDIWnesc3DydCBdq00kkeCnASvnOGi/EHkzsLRLlkiT9KlgP?=
 =?us-ascii?Q?+wpnbFbFn8zMNXJRa0I7fB+jvJwTSF1c3yCvrA+UzqglJXZAVDpvzkYck4ub?=
 =?us-ascii?Q?uchG7Trk9//9krlYarNhczIMrfUbcTSOgDFgQEWaiRSkJumG9gvUVNMqOFXz?=
 =?us-ascii?Q?USLE0lgzgZf0W67lyKBsCavyrhBEKe1O0AewIOdBPoY0E0E35cYy9x+3HeRG?=
 =?us-ascii?Q?/JEkDHMmynjP8zBgLcRDo/CxnWxb0siLtJ9EMMXLnGuDER/TjKht5hDY0egG?=
 =?us-ascii?Q?wTL/TjjLB2EcLqBJPx1F2DV3G1+GkoZJE2/g4pg4XnMy+s28UDV4FssRQ5sU?=
 =?us-ascii?Q?9iVWFDFr4WItConpr7UzQbv7/1eFWl7Q8Go9H6yh1PKD4A3TC+gcK6/cQa7j?=
 =?us-ascii?Q?kWeoAkJ1D079r4JjGSA8hNkcqZCXsygJiIDlvT2HTEZhL6ELwRCqfMbVMCw7?=
 =?us-ascii?Q?pyMCRDClmtt5gFcVnm8EP1fNIrQxoUt4iqIk+wrlwHvndIDNmX6WLHq1aM7N?=
 =?us-ascii?Q?Dgwh1N2Q2Gw8mbFL+UeKlpSv6rulr074zmbklJ1pjkKDEMq/soSXwJuT5t4+?=
 =?us-ascii?Q?qJaWFE33hj2XFlumvngzEGr5Amsw3p+I9oBIn+9w01FtTwn8RijJWeupTrIe?=
 =?us-ascii?Q?QbOO64PrBhMY55bwkFeul8boPHzDKu93toTBaGXEl07hNOgBdQQjJkhxd2Th?=
 =?us-ascii?Q?SeklemIte72OvLRSsuVQxge7oF534nPKi6LnK06QixdLz09WljiKbT97mnJM?=
 =?us-ascii?Q?3lXO4G+04N/vjq2cUwe389gMlQ4wN9s7JNM29gJdhyFErIPx9dtwz5KFfSHd?=
 =?us-ascii?Q?PH+IrSouW7MQKiYWxagrP6aOxTTooF0/zPdmLxdZ2ieS8VTjwxyXucGEe1H4?=
 =?us-ascii?Q?t09KMUYNPpIOGRgAqsw=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4978797-887d-413c-bc3b-08dddf376d22
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 15:45:30.5414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LK01fnNm3At+1o7aBpF5V/h9WVvOQbL2OJkSAouKisZvGZ2v4lx0kIkmkFe0PKKma4uNL8Y7nLuw0VApzS3W1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_084539_972208_966A3CB3 
X-CRM114-Status: GOOD (  16.71  )
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

On Tue, Aug 19, 2025 at 11:57:59AM +0800, Guoniu Zhou wrote:
> The bellow miscellaneous patches enhance the driver to meet more
> usage case, such as i.MX8ULP.
>
> Changes in v4:
> - Remove patch 1 in v3.
> - Add two new patches(patch 1 and 2).
> - Use helper function media_bus_fmt_to_csi2_bpp() in patch 1.
> - Use helper function media_bus_fmt_to_csi2_dt() in patch 4.

This functions are still under review, you should mention your patch depend
on my patch.

https://lore.kernel.org/imx/20250808-95_cam-v2-3-4b29fa6919a7@nxp.com/

Frank

> - Link to v3: https://lore.kernel.org/all/20250812091856.1036170-1-guoniu.zhou@oss.nxp.com
>
> Changes in v3:
> - Modify cover letter file to include history info.
> - Link to v2: https://lore.kernel.org/all/20250812090843.1035800-1-guoniu.zhou@oss.nxp.com
>
> Changes in v2:
> - Remove duplicated Signed-off-by tag.
> - Link to v1: https://lore.kernel.org/all/20250717071359.1910515-1-guoniu.zhou@oss.nxp.com
>
> Guoniu Zhou (4):
>   media: imx8mq-mipi-csi2: Remove width field in csi2_pix_format
>   media: imx8mq-mipi-csi2: Add output filed in csi2_pix_format
>   media: imx8mq-mipi-csi2: Add RGB format support
>   media: imx8mq-mipi-csi2: Implement .get_frame_desc subdev callback
>
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>
> --
> 2.34.1
>
> ---
> Guoniu Zhou (4):
>       media: imx8mq-mipi-csi2: Remove width field in csi2_pix_format
>       media: imx8mq-mipi-csi2: Add output filed in csi2_pix_format
>       media: imx8mq-mipi-csi2: Add RGB format support
>       media: imx8mq-mipi-csi2: Implement .get_frame_desc subdev callback
>
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 94 ++++++++++++++++++++-------
>  1 file changed, 70 insertions(+), 24 deletions(-)
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250818-csi2_imx8mq-59464599858b
> prerequisite-patch-id: 508b25bf601f2d069f16918ac44824ef2ee3cd45
> prerequisite-patch-id: 8b40bfd4a8fa73b38acd53809f88508a5ad437f1
>
> Best regards,
> --
> Guoniu Zhou <guoniu.zhou@nxp.com>
>

