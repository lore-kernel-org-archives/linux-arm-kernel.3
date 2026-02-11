Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4949EB2719
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 10:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pXuBL1u437cciInU3AQPoEV9yartS0X6Q2aPQmclGYc=; b=rZdcJM/pnCH2HqzHH+6pesz1xl
	o6Mpq/8FOAawkUVwwZw9qjTcVkHBkF2W0OTIOH8KLXByMJ/VKheZuXRYZ9dyyz2m2DIsRvxLdGL7M
	veq+PxwdEIu3lWJIn/+kOCyJ93dEdTZKGaVw+GCIFkxLueofk//i0cn0ZNFdcfh8qx5t3rju/mc6Z
	poobLZa7WHLOSPdSLN7inb588esOHaySu1RPlNNQeshWKEfLMTXYwkECtHq244hHwkRMJm0i3iH1/
	CefmWf6fgR1gOVT1uWjt8IgeyA4nEfF2IdLya+FyohMTC4ovLGB/4D0dAuOhqth1NGR8x0mJLqEST
	omZJsqFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq7cc-00000000WYb-3r2x;
	Wed, 11 Feb 2026 10:39:03 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq7cZ-00000000WXy-2VLo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 10:39:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PD2URu71N9woD1OM2ICkjp2qEptiXNjfw7zLHsunPPpX9P6x1jsTY+R+6U8ysxjN6JAMuBODm9b200k8rXhC0LpgIu+/sE/E/vrlDTvirBLft2gsBWObB+5ox+6iC9ppR+bOnKwMOKSxJoKQFT9x/wNISvtxfgnpuDr/ySnkzsUUw7dM0w45jMix8kHazg3pemHrJcoUAbWfF83/DaezMCQXw53SvfbDRR0hodIGtqFXb1yMMQSkKsQnI7+hI6o6f3wGbEbdSukSTcJ5z+03OgsWIxe9EBikA8o25BkKStOaHiSop59FF+HJj4vMcMfDrqQ0Jjng6Y0B8sgG4JcNpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pXuBL1u437cciInU3AQPoEV9yartS0X6Q2aPQmclGYc=;
 b=GklIaC5omIQTwzSIm15Fhp9lXDHhLLGsc76VOZpExpGpATvU8eZcOY5qPuOdnD+x0hKUk+LM+BGlNJPNFfdmqlQehBvN1/FJEWbP2KqJoEMCgryZWcgLd42x+UBQ0se+guNTQwIGP2lHl5hKTgywE9myKnX/7ltNDCjmPDXRDZrOQmxJoNPXBj3p4L7phRxeo5o2dTOKL7p2/Ha7NoMau8OlFLLN6i1WIaXE6lPUUy7RVNdBOmJmbmQfQA9/svUPO9Lorfy2V1voGJ4PGqkqyU424OeTVSY7QV8hv2/+sesYZg935piuSX1Ym5uY1ITGiDj06FynN4WVQNeWajDO9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pXuBL1u437cciInU3AQPoEV9yartS0X6Q2aPQmclGYc=;
 b=W1x7dwhOm4bxlmO7WE169AsXNV6E1FQthQrdQStsUaHnys1CxXekk0a/ro6vDU1ZjJJ82IJH89DOiJ3hoeqzRLv6MLFpyXDtDwPB+KbslVOxZiQA1bOX8fcX9l5DwKOnWKYxN5Ts67IT+cht6eOrx9Zs3mvgO+z80hD5M1Zyv5htgA0ChcXMSgf/KS+a9WNn8jTr/iDxFYKtONoAtg742HrDtYZf2WhHDzXH1qL1lAJ2cCKQZsxzJYys5gk2J+68+tep7MC3km3SXex3VpSBolhtZahBOc23NpXVnBpAbmSvQo0fmkhgAiM41cd3VTNoile9uoU5thZ35oylTLeuIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8825.eurprd04.prod.outlook.com (2603:10a6:20b:408::7)
 by DBBPR04MB7532.eurprd04.prod.outlook.com (2603:10a6:10:207::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.17; Wed, 11 Feb
 2026 10:38:53 +0000
Received: from AM9PR04MB8825.eurprd04.prod.outlook.com
 ([fe80::49d0:5fa7:d131:7781]) by AM9PR04MB8825.eurprd04.prod.outlook.com
 ([fe80::49d0:5fa7:d131:7781%4]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 10:38:53 +0000
Date: Wed, 11 Feb 2026 18:31:23 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Li Jun <jun.li@nxp.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] usb: dwc3: introduce flatten model driver of i.MX
 Soc
Message-ID: <v3sr6eetfhtogwbuz6hkjelj7vl2f2wkd4beldyqrskhthg2f5@rxx7rgaefn7t>
References: <20260206-add-flatten-dts-based-dwc3-imx-driver-v3-0-ebd9b9b77049@nxp.com>
 <20260206-add-flatten-dts-based-dwc3-imx-driver-v3-3-ebd9b9b77049@nxp.com>
 <aYYQ3jJ8GVIz4FS0@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYYQ3jJ8GVIz4FS0@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: AM0PR02CA0149.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::16) To AM9PR04MB8825.eurprd04.prod.outlook.com
 (2603:10a6:20b:408::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8825:EE_|DBBPR04MB7532:EE_
X-MS-Office365-Filtering-Correlation-Id: d4649b99-0565-4fa3-f3ff-08de6959c090
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eDVZRgaz0XLVpgjGCi24tckQZoOhvVmyFHOGgtTlrIGB4p3fu2eYa1iuvaoY?=
 =?us-ascii?Q?1hmsh0vHaieWS4xgVnv7zR5p+mT6KQPLE2PcnRO4ga/wrOh8/aw+q4lHIgpa?=
 =?us-ascii?Q?eCSIQxcpp4T68/Ape8h3YfZsWF9jgOK3eoOfxW/VJx+cnpnrKauVj8Wz1qox?=
 =?us-ascii?Q?IflaZfCmLVxZT9o5G9U/sedB7N3l1+kMsuSGL0teEmJId4lMyQ6TgsQ8r6Yy?=
 =?us-ascii?Q?LqXFtP1csilaGRdjhVhUps30RFr80gqKOM/P0joj4F50xz+cMmVXqgTDAUeF?=
 =?us-ascii?Q?TZsv7QU5HXuXaXzW//mT4wXJxGVxoVyNqBk6NVCHl1RN/nNSlXM/hHDX17On?=
 =?us-ascii?Q?UqVOiwcNy9tOOjYUEt/yu2veAxeZeZs6TmzCd/mtqNEN/T9/k+GzhteU1MIE?=
 =?us-ascii?Q?Ubu54PAgs/jwqJEnYykkVRFHGCgjPdPdOtR272mTNUpdSwWIljquOjsnroj2?=
 =?us-ascii?Q?VFHRyn46jpl4vGWAo9o5cZn2Z1sGwkW/A18+1vyoHq6ToAF2GJiVtA2eF9gi?=
 =?us-ascii?Q?c0Ba832LPTm78h5YoGEerK+1t0r0EHOlTFPYqeJZzhYndH6wMdzUU1GWEGm0?=
 =?us-ascii?Q?riT61uNcwNDIB2dSw8eM5mQKKVqRPrBXIgLkcsJcbU/HA6HeUPUdphCrCgft?=
 =?us-ascii?Q?ARI3NqLFLLr0dYLuylX0WDEbB/W7AdyROqMKlpXO6QFgJz3FUfF5ttCDqa6Q?=
 =?us-ascii?Q?fPcIvMqGbLLoruxEi/74CLTNnokmsSYtsKTz7Ozc+nqblJ+uhdBcObELD6bl?=
 =?us-ascii?Q?LTwGGWgHkrdE4d7Lp77SbOXapTlZa/x1OVEdmkuFbmiWtK2si2JtgyXC1Uu7?=
 =?us-ascii?Q?o/qqC34fmmzHCvGC8rva+zH/8NrYO2C2h2EDV6+ed9H1stOW9VHGqbb5HmDy?=
 =?us-ascii?Q?On3nhoQcrwPUwVBeKZ9O1C0vJrpntyzQRN7Qp8/k+wEyY4FDkKG32O8Q19E4?=
 =?us-ascii?Q?QclS6EGlWQqicsRxwF3cghWcFOv+gZ7q71oFRkRXm3HUQvf9aS7cgxt7CTtQ?=
 =?us-ascii?Q?YibSp279yZ0FwVXJwInpaI2EKGKIxu7AF5xTI1p+6K3R2eyz/KIbegCbhaq9?=
 =?us-ascii?Q?HWwzhfWsWLeAIJOKfE09prR1n0S9wv+XYEkLPrkfIph7sHg6zqP3jecxM5Mv?=
 =?us-ascii?Q?Vs6Ba8IR7SYwSUlAJUoKFIiXtriiBgtY/GX+aya5rZzcXHl1+3+dUDz0QOmo?=
 =?us-ascii?Q?27UxDZIajVxuTxGM4qeAUFWjiViWy2vNEnPlO1eD2pejd0dWwr9pj8N2nyPn?=
 =?us-ascii?Q?63TsxRrhr9V6aQIQkOzkjOWDAPECUFZTuSpowQIOUOEHycGNYQwB4BuHQxKV?=
 =?us-ascii?Q?Swd98riY+nvIpFc+Qaas7rcNGSrOi6Cv9p7a4Yd0EIy1KM0WWMxDk5roLdEL?=
 =?us-ascii?Q?T6mNUIlCAkcYOfyBO9FMpmK8l6Q6ZDi9rWL4AISg+d1IG8vqXHz1+AoZQi7v?=
 =?us-ascii?Q?If96iUdydE4YwHXfydkDLb5LwO0cVHMVeHlkA0/gRtYeH3y1bjwfQpOEEm9M?=
 =?us-ascii?Q?gM8hPvHGoX+Fo74n8/Q2eJ+0gCvDPv/RnUyFzSiLtkdlwUQ9+ykfA5bPaHBs?=
 =?us-ascii?Q?/kCpE8w8OxkBfpfhaAhfQgXnrpgeQagfHe6pGnspHQJPnt5gFkFtyv/jrRql?=
 =?us-ascii?Q?MkYhwRs2siZcsFZy1CYFu3Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8825.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F8LuPfmFDbms1X1LKa3HJC4ffpTvCSMe43NPtGutKQmBC9tQeEFSjV8EbVEa?=
 =?us-ascii?Q?XWtFRlD+U/2JWZLePSCuj9tbAOYMzR0szpy59p1ytodlYyjcyZAxG9xVvxu/?=
 =?us-ascii?Q?MF5gkMQ+JOkHMQWACGTkv/5Y97wvgMBuhvyo6NXkT7jkPtJVNK7/i+0iJcpX?=
 =?us-ascii?Q?y0g2+jn+txKt3eLxtlRsi+4vvzTCEvRllk9KgkvUpHq+XrekKP40cqznG/kK?=
 =?us-ascii?Q?DVxeLmSy3AsmOc6Y47YwUGHR+Yii8IeH/VX9cn54Mo8gvDRBq7ulTQ2nQXC6?=
 =?us-ascii?Q?bEKlS5ya+gQIwC+AJ19dlPPGTGGTbrhb1AmhQM5XH8TiBlBhaQ9fRfExt7ud?=
 =?us-ascii?Q?A7YgnfsioK5CqYnnd1LeEIQWf4f4feqvRSZVNLft/9ohzSG3Yom4s199RpJO?=
 =?us-ascii?Q?UmlqemjHHyyw4zZpKSrOWFNY2UVwhOu3BiHB3zAKMRJjfech3DG5cmGQj9Jm?=
 =?us-ascii?Q?9MgREI+rDQ2FCi1vkfRnu5BTaiWy5SZ9vIuPo2Hm6QTCY+E2jgRw3VDBneX2?=
 =?us-ascii?Q?+fpy61DAzycyII0x9S08eeNMbwvane+3zZxudqPeo3NrzIruDJRrWRmP0gWI?=
 =?us-ascii?Q?xW/tfk8hCzkWAAGQDMtTme5lf4JvuXJIAn5qK59+fn+32SxL9N9XldOpcYkC?=
 =?us-ascii?Q?7F8/ztEje8SXOWJx7N/KEu6xbw1h8W8S84dnwopHiGnplVxm9U4+bE/EhGzZ?=
 =?us-ascii?Q?W1WTX6HIX2/4G6oKH+dlFHDTrjFfHewhxWJN8+JR5tRgmwnfadunRiycCQok?=
 =?us-ascii?Q?PbOxigg6y2QAezFcEYZUU1f+v9JAG69jL3Q4T2HjJS95yb/dppuPiiY8TaZa?=
 =?us-ascii?Q?Hq1KUmYT6oAcZvsyjkwYXwMItw0FK4y8L7eglbEsbPaxL6sWietzBHN9rUuY?=
 =?us-ascii?Q?elVpigxWBr8hpSjT2Oj3549IVK4EbxlFc8Gu7qig/Y11kV19YIVx4Cw3o4+e?=
 =?us-ascii?Q?hN2MNsABytsdBSIaxlAwrc4S/qPBGeE1zzgQkzEQpJ4s586grnVVGdgkNvLC?=
 =?us-ascii?Q?eaaSKEW5yzY0Ipx4zrFFehhPhvWZkurLBDsjBBkWRQmUYRx6kDWVquopy5I4?=
 =?us-ascii?Q?XKr8nXK7KRe9V96VNAcrtNXX6Gp657lCjsA6ngiQD1xYNxLwqDx3jWD3yLfp?=
 =?us-ascii?Q?IXP2WyXOfNUMJgeYhMF9fyPCE8DX+qCMwJ8fRgX9z1NJF0EMA5uqHg8ddsKi?=
 =?us-ascii?Q?7L9KuegFrrSdsK13IO16PTCqN2CVPd57LFU2oqnhEFbcOgSflG/7Z5TqLt4z?=
 =?us-ascii?Q?qxohzzk86s/h4oNeSDcqkbVIDkk3lciOTmpZ1+tq3H5YfI+usP1akYRdxhqd?=
 =?us-ascii?Q?/iPuWDIHCWiAeB8EJ0Vi1tob/KtwKmaqbknIRv0+fJOmbdrMzuYPWZvMrMAX?=
 =?us-ascii?Q?ln2VE4xrtvhqcZH7L6P2MHCasLxtbfnrMqVF/0ZVdwQj2zuuC0sNWWXO7Ypy?=
 =?us-ascii?Q?SluBSZTyf0ZX4e3g2Gu8+7hyw8L5BJB+yqCo80pArKNz/aFEU0SVt9bHenw0?=
 =?us-ascii?Q?3g8GW4OBnaalIYct3bAsoF4y4MN0dWGsCRTcEINySaNwQo65zgm5GQ9lGzlg?=
 =?us-ascii?Q?oPuPy3uttT1TK6aQlNH5UTbN7WDDxPC+kqBSfSnlZ5DOCGBYXHPmxwICz7I2?=
 =?us-ascii?Q?Aui4xGXW9xCknmcTQinhFuaCpvdChPGrU0oPD5sCmLcX92WhmPqxKQK3A8Jv?=
 =?us-ascii?Q?oOGGBFq9pCobpn2RjAuDnaQajE6qIKVEL02GAofN8sSRBjzHq/2bfBA9yBs+?=
 =?us-ascii?Q?D2sod1IsfA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4649b99-0565-4fa3-f3ff-08de6959c090
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8825.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 10:38:53.8929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xq8FGQdKbarb+hfTYhl41olsqiWI0sbuBdnFh/a4WvRJkvBygfd8AD/kFNJdM3IiA6edkisytJkl3EOeTUSu+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7532
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_023859_787771_B4133EEC 
X-CRM114-Status: GOOD (  36.98  )
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

On Fri, Feb 06, 2026 at 11:03:42AM -0500, Frank Li wrote:
> On Fri, Feb 06, 2026 at 06:18:51PM +0800, Xu Yang wrote:
> > The i.MX USB glue and DWC3 core are closely coupled. Describe the i.MX
> > USB block in a single block will bring more benefits than a parent-
> > child relation. To support the flatten model devicetree, DWC3 USB core
> > driver already support to directly register and initialize the core in
> > glue layer using one device. And many notification can be received in
> > glue layer timely and proper actions can be executed accordingly.
> >
> > To align with mainstream, introduce a new driver to support flatten dwc3
> > devicetree model for i.MX Soc. Besides this driver disabling wakeup irq
> > when system is active, no other function change in this version compared
> > to dwc3-imx8mp.c
> >
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> >
> > ---
> > Changes in v3:
> >  - update compatible as nxp,imx8mp-dwc3
> > Changes in v2:
> >  - improve commit message
> >  - fix code style
> >  - add IRQF_NO_AUTOEN
> >  - remove pm_runtime_* in dwc3_imx_remove(), dwc3_core_remove()
> >    will do that
> > ---
> >  drivers/usb/dwc3/Kconfig    |  12 ++
> >  drivers/usb/dwc3/Makefile   |   1 +
> >  drivers/usb/dwc3/dwc3-imx.c | 429 ++++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 442 insertions(+)
> >
> > diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> > index 240b15bc52cb..18169727a413 100644
> > --- a/drivers/usb/dwc3/Kconfig
> > +++ b/drivers/usb/dwc3/Kconfig
> > @@ -150,6 +150,18 @@ config USB_DWC3_IMX8MP
> >  	  functionality.
> >  	  Say 'Y' or 'M' if you have one such device.
> >
> > +config USB_DWC3_IMX
> > +	tristate "NXP iMX Platform"
> > +	depends on OF && COMMON_CLK
> > +	depends on (ARCH_MXC && ARM64) || COMPILE_TEST
> > +	default USB_DWC3
> > +	help
> > +	  NXP iMX SoC use DesignWare Core IP for USB2/3
> > +	  functionality.
> > +	  This driver also handles the wakeup feature outside
> > +	  of DesignWare Core.
> > +	  Say 'Y' or 'M' if you have one such device.
> > +
> >  config USB_DWC3_XILINX
> >  	tristate "Xilinx Platforms"
> >  	depends on (ARCH_ZYNQMP || COMPILE_TEST) && OF
> > diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
> > index 073bef5309b5..f37971197203 100644
> > --- a/drivers/usb/dwc3/Makefile
> > +++ b/drivers/usb/dwc3/Makefile
> > @@ -55,6 +55,7 @@ obj-$(CONFIG_USB_DWC3_ST)		+= dwc3-st.o
> >  obj-$(CONFIG_USB_DWC3_QCOM)		+= dwc3-qcom.o
> >  obj-$(CONFIG_USB_DWC3_QCOM)		+= dwc3-qcom-legacy.o
> >  obj-$(CONFIG_USB_DWC3_IMX8MP)		+= dwc3-imx8mp.o
> > +obj-$(CONFIG_USB_DWC3_IMX)		+= dwc3-imx.o
> >  obj-$(CONFIG_USB_DWC3_XILINX)		+= dwc3-xilinx.o
> >  obj-$(CONFIG_USB_DWC3_OCTEON)		+= dwc3-octeon.o
> >  obj-$(CONFIG_USB_DWC3_RTK)		+= dwc3-rtk.o
> > diff --git a/drivers/usb/dwc3/dwc3-imx.c b/drivers/usb/dwc3/dwc3-imx.c
> > new file mode 100644
> > index 000000000000..3b154d075bcf
> > --- /dev/null
> > +++ b/drivers/usb/dwc3/dwc3-imx.c
> > @@ -0,0 +1,429 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * dwc3-imx.c - NXP i.MX Soc USB3 Specific Glue layer
> > + *
> > + * Copyright 2026 NXP
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/io.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> > +
> > +#include "core.h"
> > +#include "glue.h"
> > +
> > +/* USB wakeup registers */
> > +#define USB_WAKEUP_CTRL			0x00
> > +
> > +/* Global wakeup interrupt enable, also used to clear interrupt */
> > +#define USB_WAKEUP_EN			BIT(31)
> > +/* Wakeup from connect or disconnect, only for superspeed */
> > +#define USB_WAKEUP_SS_CONN		BIT(5)
> > +/* 0 select vbus_valid, 1 select sessvld */
> > +#define USB_WAKEUP_VBUS_SRC_SESS_VAL	BIT(4)
> > +/* Enable signal for wake up from u3 state */
> > +#define USB_WAKEUP_U3_EN		BIT(3)
> > +/* Enable signal for wake up from id change */
> > +#define USB_WAKEUP_ID_EN		BIT(2)
> > +/* Enable signal for wake up from vbus change */
> > +#define	USB_WAKEUP_VBUS_EN		BIT(1)
> > +/* Enable signal for wake up from dp/dm change */
> > +#define USB_WAKEUP_DPDM_EN		BIT(0)
> > +
> > +#define USB_WAKEUP_EN_MASK		GENMASK(5, 0)
> > +
> > +/* USB glue registers */
> > +#define USB_CTRL0		0x00
> > +#define USB_CTRL1		0x04
> > +
> > +#define USB_CTRL0_PORTPWR_EN	BIT(12) /* 1 - PPC enabled (default) */
> > +#define USB_CTRL0_USB3_FIXED	BIT(22) /* 1 - USB3 permanent attached */
> > +#define USB_CTRL0_USB2_FIXED	BIT(23) /* 1 - USB2 permanent attached */
> > +
> > +#define USB_CTRL1_OC_POLARITY	BIT(16) /* 0 - HIGH / 1 - LOW */
> > +#define USB_CTRL1_PWR_POLARITY	BIT(17) /* 0 - HIGH / 1 - LOW */
> > +
> > +struct dwc3_imx {
> > +	struct dwc3	dwc;
> > +	struct device	*dev;
> > +	void __iomem	*blkctl_base;
> > +	void __iomem	*glue_base;
> > +	struct clk	*hsio_clk;
> > +	struct clk	*suspend_clk;
> > +	int		irq;
> > +	bool		pm_suspended;
> > +	bool		wakeup_pending;
> > +};
> > +
> > +#define to_dwc3_imx(d) container_of((d), struct dwc3_imx, dwc)
> > +
> > +static void dwc3_imx_configure_glue(struct dwc3_imx *dwc_imx)
> > +{
> > +	struct device	*dev = dwc_imx->dev;
> > +	u32		value;
> > +
> > +	if (!dwc_imx->glue_base)
> > +		return;
> > +
> > +	value = readl(dwc_imx->glue_base + USB_CTRL0);
> > +
> > +	if (device_property_read_bool(dev, "fsl,permanently-attached"))
> 
> can you parse it at probe and save into dwc3_imx to avoid parse dts every
> resume()?

Sure. Good suggestion!

Thanks,
Xu Yang

