Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C64EB3622
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 17:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jf5Kmcks1ngtq9TFXySGgxd2xZhdjnqjTnL4DZJAuNo=; b=TrIbK2KsTqG9/HxQv5VFp1KwLN
	wrxJesPIkuSAZ3M18TRjgnI6Z55A73BTb6ubgAjAlby4yXPSmoDqGCS4DQ42pTY9/8G5edRdKjbU0
	/KRzzgZwf7YD/RSD2V9A04ZqLK9zefAmOqvb2WsUh9qEAv3xBuDpYxxSV4oAU6Cw9z2Waw0NeBFco
	yhE61wO4S/uGv75wten4EK5ClGSe6WQZf02fPVqNbgVvxf1Q3IY3LTo8f3nZqxkzKiiTroH8Hoqaq
	LTfxS3CK9pr6erAt3ga1xOENPHYaEyvBkTkKLU50UHXX3VIHccC90Bs7Szt5mxqfV82ZPdvKRrG59
	S+banr7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx78Q-0000000DbZl-1BjK;
	Mon, 02 Mar 2026 17:32:46 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx78O-0000000DbZQ-3iU2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 17:32:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PXGH88Ze2gYiN90qd/s+fqe/Y5mdTW8eSOfMSmy1KIn+Uzhk9eHnXpuddVLXd2BCqhJk9cRcIU7SOL9nWXvjMZCd+T7KIoWEPwyQnq6SEA1q8t84t8DBluIWy9TOFdCQUL1aFHa3PgANI9xHEAG75maqqN3TpNDFrl/psfOvZl+jVC+XurJztHvUz/QcosHnjqII9OaIDSwUwINqzBVnWiC6DKdakA2Pwcube6ySViJmcPctIxwBXpH2XmqcAg7fXN+makIQ6Z3QWuBYa7wnPsbEyr0nvrbhKaW+Z+6nI6k5HH5LLYXjn+8qGUTMOlg0CB7buUbf4PDiF9HSCpW8Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jf5Kmcks1ngtq9TFXySGgxd2xZhdjnqjTnL4DZJAuNo=;
 b=lO3031KS/BxvtTOA8eX09HSo42+FrOTSCKvUypP+LLLGarHV3GUTCDYQE9iIpKj89uEy8LbIt9reXKNX088Qx2oyA8s5IPEPii2j5Tmp8MzgJ9jg+sxRNLSxMjOSA8WIoDZU3rOkZ7Wq4phlU3jJ6MhKmlq/5aeCiKHgJTyTAkKsGptvJl5Oy7ig03xzv4/AKg3nPokNEFCs1mpvigvEPGxusSpKk5upYGjxwO4L/hI5ICPPRUe15PTMB3Kwj2kIYMyiw+WiIa669+7oHKH3c+sGRBbqMUIQcBEBLHa/0o2pu4k74X29ki7SIGnxFuOkgLTySEFDGpWVSMYXdwkf5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jf5Kmcks1ngtq9TFXySGgxd2xZhdjnqjTnL4DZJAuNo=;
 b=Vmq8wgOhet/aF9NaySspsJnaPbhQHOHI9ovC5kyCEjglX/qH4Ipc0vgGIXJ8myLy1p5w1vMFP0LPH99IgI2/CcF+9w+8X5cqpx4MaT3SKDocJfvdRrUX0wmE6a2pvSd9C2rACnlGOnOIDGGh7LSGI/ciYh0yMqf8MBPQZXXQMMGCwL4GibDfSf4YsbUUC8LJuXHDwDGks/iAJXeR2vwhUKLp+LSCVYJXmj39BSUn87h+xaaD8/b4PgvThFCCn71Oh5MoF1QapbbX9KbOdN2JL+ZaxHtHZRoHapZ5Dcn9NcbeN9+PrKyfsFvTMfLjTznlTe0DHO7iw7Vmhr5EYJeSGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB11662.eurprd04.prod.outlook.com (2603:10a6:10:60e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Mon, 2 Mar
 2026 17:32:41 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 17:32:41 +0000
Date: Mon, 2 Mar 2026 12:32:33 -0500
From: Frank Li <Frank.li@nxp.com>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	kernel@pengutronix.de, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: imx91-11x11-evk: Add usdhc3 for SDIO WiFi
 support
Message-ID: <aaXJsQd6z4cmusym@lizhi-Precision-Tower-5810>
References: <20260205100647.3745669-1-sherry.sun@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205100647.3745669-1-sherry.sun@nxp.com>
X-ClientProxiedBy: BYAPR07CA0045.namprd07.prod.outlook.com
 (2603:10b6:a03:60::22) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB11662:EE_
X-MS-Office365-Filtering-Correlation-Id: a3e5576d-a852-43fe-e7a0-08de7881b49c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|52116014|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: 7ENQgTRdC5ePWM5kJo5/BpsMhcXzkfBXPSEYdW+G0vxnoOeolFSENtyP7Al/WUaQFThKG71JtXnccY0uL+aP6P1J/02FsT3dWV8utOobnUFEmNJGeRObTn5KHwuoMMI7ZngnCGNtze/gLfC/bP6EWPAgd8xZIo0mnE9JPp4roBDwGYZC7mx4yKwQBMcPc4aLbgXdxnihKddZxFKab5Q2dnxI8LjracF9c8gVkQmXmUJOEeXFSmFvVTfdJ5k4dFlWlw7oIq9t8GyDRJ/+TT2NeklKLPDYejQaMQkKQ/zXjvpjD6noEoz+u3mZOS6RBkkz1GTYpY0vO7862aZ84YDSUs7xMTiwsrUFSHVd++3YdAy7vKaIhj2ezUNuLFTA8/Th3K4OFxu4MgfBK1MUboB5lFYlY19TnT9qNNmjAuskUPGLyxFmu4m5NE2HjxRoTVofJ91D8ux2o8yU0l8/BmaS3dRA0wTcyvOb4NScO/I/JDRkfV/ZkPg+NQVPiwDRrX7Xk6ODxRCItyXzSq98/JTSbSgkSzs32mwa8Urz2o8re2XInsaLyz5ADuQ6JLpc+GPQKf77vOcS76u2cOmwNpUagiaKmO3c8bnwXEIc2jkLBDjC3X10CkmIuZILEIhoKRSNV84XxhsDqDjm4xxuHEV+fYxUCKHlSE4Of0v+8y7xWwJFCm7Rkvvx6dQ+M/XuOXfxSqBTtbeKTEMe8DUEO4yHGXyzKg0yI9pr9IhtlnvNO8+A++FZb+9TBlxvTTvTYO736jq/w9osHlD+nhj72LTW8ZH5bD5gPnb2x26xY8CGJbc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(52116014)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Xaw/BFzNMmWKhYVf3dRekwIAHfJP0dm3qTCVldqnykWwHczRzAnM4lURhIne?=
 =?us-ascii?Q?IoZFrTWP3P8Ez5LOWNW/PF+ZTM9bIRHVWqCsMCSHaaX/MQAeNBg8aiDE7CA2?=
 =?us-ascii?Q?MoN5dctV6gwzDaZKKlyrcYzpaV9bJAfvXENYiJ3mqshNkCgrCWrVlXVArcoN?=
 =?us-ascii?Q?Q0nwWWNK+s6Ba2F6wi9P2W87D9T+aXKGnNy7cSNxGwOF5hs4nnF7fdFTdWJx?=
 =?us-ascii?Q?89fBC/k0q+4ZmHIUUWqA0kUPWSzG8K8GnRun1XL7cCw3kCaaYna8uqZcAgmY?=
 =?us-ascii?Q?qF0OgdGcjv329iGeGYg9rsA8Q0RnIK3ont/P26FxLvotqlne8LUpt0rYxQyl?=
 =?us-ascii?Q?TzupWgdacdLwAL3T1UP/HcY/OpW6w3o+Puasn49Rc53jN7KzkQpyrJUl2IGj?=
 =?us-ascii?Q?3/TAooaCmufDBsmYKl35gYOp2C1e/G6cxXAMOAUFVZVK8YfDLoDnjWMVad60?=
 =?us-ascii?Q?Q0NBpDGuimH54XKF9hQh2wSyxOadnMjubKBLLUnPUw45lc4L92CcJsBA1kaO?=
 =?us-ascii?Q?y0Wk156tyu91D5eC9b0DY8tBJMZMdZA5mpMA6vl7IbrqTKi097BO+PtAQ9Lm?=
 =?us-ascii?Q?ajWqWB2VbOPEZml2GpQW+KC3yBclu8mIAZ35srlGsfYywTDwlGWKK8KxCBdc?=
 =?us-ascii?Q?wpFHw4eWzd3OYrJm/ASH9z7N37GgoMf598S4+MRiZcqJhxT9xXjLY3p+0KSo?=
 =?us-ascii?Q?htYwFpLz4daUnNFL+p/FJJbLbEI+Z2Ey740higEsPZ/PnkZgDoKIWMQlG8TW?=
 =?us-ascii?Q?xkG2MWZmZOd0LKHRtkisW+Kgz2L87ETO1gPcM6m4xNRU1Va50Z+5dd6xT+ZI?=
 =?us-ascii?Q?wxxlnZXmHbdSFPxiXMnF6OQVwnisL8xoTnEcAjB/uzMHOvUG4ei4xPK7XWce?=
 =?us-ascii?Q?VWIagEKkDmUepkjktg4QnUr7wZuIb6WG3+MBkjYy9KfkxgPZJE9E3a6ErdOd?=
 =?us-ascii?Q?q92dONDzTkFQBq978F6UrddUnbiUf5OYHPcdoIMuJOa+GCqG78/KLNujryNr?=
 =?us-ascii?Q?Sh7AxH+VaBVLqRKNj3qfCcbP/OFVUNry01koiWEouvCGmxHv9ZSOJtojobjH?=
 =?us-ascii?Q?DL4m4mmSNnijLfzGJiuchYyJMmiQZxAffb13kMm7ZXA7mljRYkdZ/B3x3dag?=
 =?us-ascii?Q?zRgUqiCt/ORATuUGAKn4/99rUYas6ttiw4z9snK+UNP7cEIi0KIg8LtcAecN?=
 =?us-ascii?Q?LXFfHebEpwnLOZW3sZTbnGYJuNrvbFNYgqCMcOkvefSJUMLN4DR87EUf/4NR?=
 =?us-ascii?Q?5LLj1DVjrf0QcHDwR0rFjV9x4o8HOodLrYeedU0YoB7dDnIOorZRv1Nz62dz?=
 =?us-ascii?Q?vfnEIsrGewa2Xbxnuq9amj+2x3ZlJ6I/iPinqM9JHSWpiXFUoDrkUYVTUQPB?=
 =?us-ascii?Q?nQqcoQ2LpVILWWBK+H6A9W7d6bgWuJlWo9yLtwr3dFiKbgVZl/aDei5RKB1q?=
 =?us-ascii?Q?/XQAY7+DmEYHjHPw+8Vv80v0ABd2HDWRNG3G6xlpEfyJwubXjkU3kJ7xmsyY?=
 =?us-ascii?Q?6GYpGhu9EFq1GnOH2cQrDYmVvu+v1Nlw5EMs51CpT3FODobgiE2YfU2T01wv?=
 =?us-ascii?Q?rNV4OvgP44VYwoYR3qmKay/O/xBevO1bDDUcdB8UcUhV5K4Gn4TUvVPCq+Wf?=
 =?us-ascii?Q?w2Ak6U5XucwNtHR0zPi8xQFyK9JPcPzyZX4UCGaA8d3Z39VJtyV9bH257953?=
 =?us-ascii?Q?ahwLh9kl4cp6GuBvKjIWtzEIuSQNV+sPW5Q3kIe66QHAyCqMDkRQCtQ1Ev0E?=
 =?us-ascii?Q?iPuigeVUrA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3e5576d-a852-43fe-e7a0-08de7881b49c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 17:32:41.0691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G5tfOAiac3A93dsrVHkvkpf+hC9NKprH4uS/fBxNYu/535OXM3aJs4pWFkmBdY+Q3fiaWyfTCppRieT4eV6xFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11662
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_093244_947945_B6FA67AB 
X-CRM114-Status: GOOD (  12.90  )
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

On Thu, Feb 05, 2026 at 06:06:47PM +0800, Sherry Sun wrote:
> Add usdhc3 to support M.2 SDIO WiFi on i.MX91 11x11 EVK board.
>
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---
>  .../boot/dts/freescale/imx91-11x11-evk.dts    | 96 +++++++++++++++++++
>  1 file changed, 96 insertions(+)
>
...
> +	pinctrl_usdhc3_sleep: usdhc3grpsleep {

I rename usdhc3grpsleep to usdhc3-sleepgrp, please run CHECK_DTBS before
submit patch to make sure not warning.

Frank

> +		fsl,pins = <
> +			MX91_PAD_SD3_CLK__GPIO3_IO20                             0x31e
> +			MX91_PAD_SD3_CMD__GPIO3_IO21                             0x31e
> +			MX91_PAD_SD3_DATA0__GPIO3_IO22                           0x31e
> +			MX91_PAD_SD3_DATA1__GPIO3_IO23                           0x31e
> +			MX91_PAD_SD3_DATA2__GPIO3_IO24                           0x31e
> +			MX91_PAD_SD3_DATA3__GPIO3_IO25                           0x31e
> +		>;
> +	};
>  };
> --
> 2.37.1
>

