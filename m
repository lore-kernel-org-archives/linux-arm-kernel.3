Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D25C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 16:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LubRAdYpy8pukWrxtXcmYMKnJVb/76yk9CzoDxoXWxs=; b=Md7HDNiU7MgD54I+MgFsiaL8zq
	TF/1KpnkVAQ00SZiPxQlBq4ZRwjNVuDyUGpdmn1SWTpj+zLAXdf2kS4PLRfgDqAJoQqZRUcEhSLep
	xHcdkCYrkWdZTdIcyDvzm70EKa9k47xMbIkWcphPwau02hr8bNDs11IahtRp2SsTAgGNItQfXFVZH
	u46S3qWIpXAXzn3+zXRUBWaIXBUcd33TrVMWg9oUDZn02usbm3YIpQ9R1z2mZnneZWo70lCa7WlSp
	zL2TE+7n3vsxSgTNlHUE0bLUPqohjU/Y43r7rNSMRKMjQrmFPYiIxKPuS03RN8EAsAJI1L8alwyE3
	9Cz7vyLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKLZ-00000004Xal-30yg;
	Wed, 26 Feb 2025 16:33:21 +0000
Received: from mail-vi1eur02on2082.outbound.protection.outlook.com ([40.107.241.82] helo=EUR02-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKK1-00000004XPz-2CBQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 16:31:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uZn/JJSsviy0Wn9SnJDox7lIQo5cnPpiMSONdDY8Gq8GmA6KQyT2rbPudezmJBdq8MyujAPKQP1rmwAGkzdW8XbnYQ6g+SUvQ63bAjz8Vfa+Bab1/vKKb4JLcSbcU2Tqmfb69IaIBQQPaEM4cd/81P0J/2C/+Z3UcuJ42kU97ZPJoZSDS5r+xZfDJqlsQXWfJkl8RqRjF5kBA9HSFIhW/Bo/HKsqtBVU4m60e26uJDGCHOhzWa34Ui7ClNGAQVEpmZdzydJdyITnb1kMIwkS83rg1SOGZLj+lu+Q0+HZW9lm+2v2F/Pf9WFWuFuUjJov44rhJ/x8aCUFILdpq3JadA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gv41jzHI2W38VLVxkLmri/ydcdjCiwCTVyL633dOnf0=;
 b=tcBMiw+lpWA5w/iZHCrKSsk+1JsvoGmMeg31klBMgIhFl/+oPi8e47ZEGE7XMeGihZg7T4DNDCu5c2rtPzNg/unbz+6Sm7agqz2rvVi89DL8QVXtyz3+n/olnlEafQP9Qj+A7rJV1wdA7egPg3OLbEwJUw9ZXlGDs/sIGKZ5TiWqWlyVep2ae7HGVZqGWtrmwwsCyYNEEL9LnQyRRG08QKbGRl2eaw1N/1sZ6F9mav9QfdOfA+sJMY3Vj1hM8yyYZkV2fY/pmUrBZtoe2SDgkA86ELatJanJxQDG2VX1rUdK5271PTm5uJ1EFicYYtDPQXYf0hhp2qd8ipCSapTqVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gv41jzHI2W38VLVxkLmri/ydcdjCiwCTVyL633dOnf0=;
 b=LHNBO8gP75laCPbwjq++ghv2qrP8li3xPeTTIJYjNWO72Jd+cISRK2N5p0YZe0Ohl/2YJuHju85N9CnCcXeo0lYhGHhGwpS5qzbStL2u0/FLZ4P5D2reebjkjDfPvDTVV04ttkc4w5WY6tUgsVZHwHXTH0iROcIZIWIoNRAdDm/fk8AA+fz9aucGXysjIPhJSlj5lrQhLMrNoc5/cbJyE3AnYFyq1BqDAQ/PnfWXowi+gEHCz6BV0XAMYGWE8j22P/TVvdDfXuvRyIbBJWyPjiZqBF+M5xr/gYGwOOJkDtNV5zjD9lTLK7VHWV3A3U7Efv+MiktKGOyZ4kc4IEZmTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by VE1PR04MB7325.eurprd04.prod.outlook.com (2603:10a6:800:1af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.18; Wed, 26 Feb
 2025 16:31:35 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%6]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 16:31:35 +0000
Date: Wed, 26 Feb 2025 11:31:26 -0500
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>, hongxing.zhu@nxp.com
Subject: Re: [PATCH 4/5] arm64: dts: imx95: add PCIe's msi-map and iommu-map
 property
Message-ID: <Z79B3pH0BwxJseHK@lizhi-Precision-Tower-5810>
References: <20250128211559.1582598-1-Frank.Li@nxp.com>
 <20250128211559.1582598-4-Frank.Li@nxp.com>
 <1995746.PYKUYFuaPT@steina-w>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1995746.PYKUYFuaPT@steina-w>
X-ClientProxiedBy: SJ0PR03CA0364.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::9) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|VE1PR04MB7325:EE_
X-MS-Office365-Filtering-Correlation-Id: cf5c796c-09ed-49ea-c81a-08dd5683094d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|52116014|366016|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?xz97nYGgdepF1sXpkTrZW+yRdf786OvqhTZl/fw3NA6/kEDw96hoLyBHTf?=
 =?iso-8859-1?Q?n1e4AN+6QFK0Hkc7vQgdhg8YrwAuejfh/I6F9JZv1Q5asGSxeM+BXssYkU?=
 =?iso-8859-1?Q?CtIqljnR0rpt8CA7NA/ecNy51/C2U9HeAA0X2P/Flx93bQ+dklV3+nxwH/?=
 =?iso-8859-1?Q?/UtIA3v1mB+CCOJqN4J0PRqA7kVkL3kGUeiZo9F2OT4rw0KFCdIbPpMKMO?=
 =?iso-8859-1?Q?6oHosuAFU22U44eCGW2axRgz25P42478EuBEA+/4VeW8FpF9FFdD5aSl98?=
 =?iso-8859-1?Q?nHCZKeDmnqsJHq7S3JD1MsQ96HFP0uXJU3bFo2k+5nj2tIEi+uQgnrHe1N?=
 =?iso-8859-1?Q?KeEQ+klYM3EcV/LQ2y3STHhPuZqveOSY2YogQoKGaw0jsYFNIRgIKbsKY/?=
 =?iso-8859-1?Q?bQoczyldvthgkgz3nFUIGM8qeh+OeVT1RIcLTe0sDSpQtlleiePXgicXo9?=
 =?iso-8859-1?Q?lMsF6b3fJcJl+LkTt1/m2T8MqLdVCoDVvw8H+t0D1gSpEvQixCV2cdTkz4?=
 =?iso-8859-1?Q?2WR/Urgpp91KpQww+eZgkDxs6SsexlvkUPWv9i8qq0AtA25xcoHkv9ZhBI?=
 =?iso-8859-1?Q?v5THoaPj4OO8Gn08nIWXA6OSgiQSL4bEYWvbQL8nv+MeoW//kTpqFxUJBc?=
 =?iso-8859-1?Q?curFJuu2G0Ad6zX3k2UiIss8b8v1LigH8/w5ZWAj3U8Q96Ob6RBv0SKYCl?=
 =?iso-8859-1?Q?LVO+6CnSW0GTDZM+fEazXo2/AN/SH06cLNQvlO64kMXd8C4v2IaeYxdbxA?=
 =?iso-8859-1?Q?TDdz/E1v3zM5rOlq0CAwe4/fQEbk9bC/noilWrlo6mZ7gMwjI26cSlWwcF?=
 =?iso-8859-1?Q?H/rsNRoSjJRKWvLddyWioqwI+GPGrAXFDrVtGVFPoPF7aUqAgGHKc6IUL6?=
 =?iso-8859-1?Q?2D/298Ogqd5vIjxlhUw6q6mt95W2iK1jfATFtYakRIyN/2Hs4MthfcZQdY?=
 =?iso-8859-1?Q?6AB7qnZEhrXtZYnJuSqq8QIN15XRZlrgIlVmoP3wUwCbnyfwmI54BM56cE?=
 =?iso-8859-1?Q?tp95wER7erm2lF1l/nDpkc5H3gjQ69qWUlU9sMzZvGzOZfIB0GcrauqUn4?=
 =?iso-8859-1?Q?bbgVLhRjfkl2QJVC8NfYFxpnhO9qzZwdYbBXm/jvQcE1bjekry3WMqcVZs?=
 =?iso-8859-1?Q?/1BS29w6GHr0Qi7bz9mHIHUMWIZQ81MvkO2bFfs7aiETd4QqANSqsxAMXa?=
 =?iso-8859-1?Q?p4eq3KDpDSV60HYnwJTQf/jqDFzuHIoDOixjcffDAuOyoS19a3MHl5NjAu?=
 =?iso-8859-1?Q?8+9nhEfOISPlFQJxS59knPM9eQeXzdY1EJqG7EXn2GIyrC9GXuPb7402n/?=
 =?iso-8859-1?Q?fhQC2mWBfqfOkG9EQgwOA095arr4YmVYhOXFvIW5kyz13d/CjOFLa1Meu8?=
 =?iso-8859-1?Q?M8vhQCj1Pn1Hkrw6ophvtsKo8OKMXkNkBbcf9a2ZflSf6sMG91SAHth+5M?=
 =?iso-8859-1?Q?O9trjptkxuqfBkkZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?2Tr6qmEM54NLe2OsADuxKsjFZv0InyHGHv+hKkZ7vihAQ4ydUFs6445ecM?=
 =?iso-8859-1?Q?q6gFXa4eo6jI76XmEYn5gOeRffMndC7qRLWiYljCnwPq3NxTLHV5yc0dSX?=
 =?iso-8859-1?Q?mbUtgZ2L/rd9K1YVB4j2P8jnOpuOng4waq1jVw5cgbgU9OpwtntKFuwZEk?=
 =?iso-8859-1?Q?CTHSk7f71/U3pD1vu3gELdDu+p8eUx9yY2omlJtj0gv4dOuEEGNJrWN1Vs?=
 =?iso-8859-1?Q?cyaJK+Y8z5vSHGi+IHi0JrHK99Yh0ah80YUrrw4ACgC1ER4nlvDdcYGwLd?=
 =?iso-8859-1?Q?5KblX/8jiqq+wBwWd4DLKvHQSxVX2VIsau3dwE212vBmq3yLkz8ywiNQHy?=
 =?iso-8859-1?Q?n9hBZgG+yzBcFXJ8D+0fx3sxWVwRrMPw2ngxr3zawEvnindiifBkYR4nQo?=
 =?iso-8859-1?Q?plpRqRHirH6k2gbm+ah8r+ob4aiMunh+Sa4f7YuXfkE2GviggZVmMOyFz0?=
 =?iso-8859-1?Q?qiSvc1DmK+Phs/Y4x02EHTPLAcEhQobpDe8gDSiibkcr+Lzi4Jw+7XpuDS?=
 =?iso-8859-1?Q?O/idnSHURImKuVgRwMfpS8y/mNqxJ3J7OJXPFEpFYBjX2V6Z8tXBuStKBr?=
 =?iso-8859-1?Q?k9Fl5VdhXH5agY3KuCFgZkTyZPJbhKDcqovcjgzoPIgy5LnrbQkj3ALSae?=
 =?iso-8859-1?Q?Rm9nPAE1AVm8TwebtPVrVRBc63ZaSqHoitdW5t84MJCbknuHrZZgfUVJne?=
 =?iso-8859-1?Q?oM1jofHLM/Rk8tsEuhCMyicK/20T7E+g/fMxVxDZmrqjnLJv2zffuR8m7c?=
 =?iso-8859-1?Q?F67QHhfHjB8Dgum0T97HmW+UvgxsRkskgbViag2Clx3pGACirjhdMK0Vxa?=
 =?iso-8859-1?Q?DXWGd3SKeXlaNl//XVLJWh/37ZAkLcIAhKgl1OlbFe1FMYcbOe/nW1JjnQ?=
 =?iso-8859-1?Q?Yw+0nwWU52qg69lcbmMsFK0khbYWx4TN3KDpFuNPVHZdERrW1HAakC5vBf?=
 =?iso-8859-1?Q?+aalWeu46gq+2cA0D54jj0N6EZF0yYX/UHHVX8ifBzB5S3w+zgxHrmWEGS?=
 =?iso-8859-1?Q?6h//fb9A0RUeGJFrpGj1+ZUbUJV1GRbtigY/g86nb1Uwe+M90GoFZrqmTC?=
 =?iso-8859-1?Q?JVeilds2f5AE7iv0hibQxm60HpOIIsSg4ujyDfwG30ZzC6lI8/ohyE6lOr?=
 =?iso-8859-1?Q?dt46x1qFmSsafOd1ABElRhCbAUVjH5ggEEp0UXVBHt0fUW22LuvYxjzkkB?=
 =?iso-8859-1?Q?8Op6cOtp/e21R468YG42FHYYcqcUMxSKVtI2iXYO/gg/T0ttC8L6Mim+LM?=
 =?iso-8859-1?Q?HhLrvp8fUhxQTSPliDwx2AGO6yMUBp6NJMgEFJ9tCYCclvy2ijsTZpsSz3?=
 =?iso-8859-1?Q?X36cMib+HUeYWyt7YTBqedgG7SpPZIqWuNz0W0gHcXfkiu6rA/T5HAf1ul?=
 =?iso-8859-1?Q?rEGS0QgPdtG186rW/mNTHiPso4GGCKBK9CKsqDqcOpo009NMeDCGdZNFN1?=
 =?iso-8859-1?Q?dK2xzGpOffHgriSRuMNN5q9o3J/2wi9pixcNP3ovQxzcGs1P6FVulqPJcl?=
 =?iso-8859-1?Q?Pho2nkJHq1z8tyK62oS+GjEh5QyXKhBpVdXKY6m5RWtAynZm1O8jtdbiSV?=
 =?iso-8859-1?Q?PX4giyHFpXY3gS7iMrymCl/ZCPR5LR3t96qL7t1G27CPYjhzkcbc5VW+oN?=
 =?iso-8859-1?Q?EkfPBePhHArVaa+ZKGs7kRE88phWAcXKB9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf5c796c-09ed-49ea-c81a-08dd5683094d
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 16:31:35.4467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EfyBtXoNqUJASwt+NGnh6MFPuPe3sfwl8XMHrl/EyhIxBKvKDEXbVKn7COIjHCZhwmSf+PxmuPEKMc+ZcYBBAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7325
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_083145_562267_94F70986 
X-CRM114-Status: GOOD (  23.69  )
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

On Wed, Feb 26, 2025 at 01:11:37PM +0100, Alexander Stein wrote:
> Hi Frank,
>
> Am Dienstag, 28. Januar 2025, 22:15:58 CET schrieb Frank Li:
> > Add PCIe's msi-map and iommu-map property because i.MX95 support smmu and
> > its.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx95.dtsi | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > index 6b8470cb3461a..2cebeda43a52d 100644
> > --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > @@ -1573,6 +1573,12 @@ pcie0: pcie@4c300000 {
> >  			assigned-clock-parents = <0>, <0>,
> >  						 <&scmi_clk IMX95_CLK_SYSPLL1_PFD1_DIV2>;
> >  			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
> > +			/* pcie0's Devid(BIT[7:6]) is 0x00, stream id(BIT[5:0]) is 0x10~0x17 */
> > +			msi-map = <0x0 &its 0x10 0x1>,
> > +				  <0x100 &its 0x11 0x7>;
>
> Aren't you missing msi-map-mask = <0x1ff>; here? Similar to pcie1.
> Either way, with this change PCIe on pcie0 is not working anymore,
> regardless of msi-map-mask.

Yes, it should have msi-map-mask. During my test, I have not enable enetc
so I have not found this problem.

>
> Without msi-map-mask:
> > OF: /soc/pcie@4c300000: iommu-map, using mask 000001ff, id-base: 00000100, out-base: 00000011, length: 00000007, id: 00000300 -> 00000011
> > OF: /soc/pcie@4c300000: no msi-map translation for id 0x300 on (null)
> > r8169 0000:03:00.0: error -EINVAL: enable failure
> > r8169 0000:03:00.0: probe with driver r8169 failed with error -22
>
> With msi-map-mask:
> > OF: /soc/pcie@4c300000: iommu-map, using mask 000001ff, id-base: 00000100, out-base: 00000011, length: 00000007, id: 00000300 -> 00000011
> > OF: /soc/pcie@4c300000: msi-map, using mask 000001ff, id-base: 00000100, out-base: 00000011, length: 00000007, id: 00000300 -> 00000011
> > r8169 0000:03:00.0: enabling device (0000 -> 0003)
> > r8169 0000:03:00.0: enabling Mem-Wr-Inval
> > r8169 0000:03:00.0: error -EIO: PCI read failed
> > r8169 0000:03:00.0: probe with driver r8169 failed with error -5

Can you try remove iommu-map and keep msi-map? then remove msi-map and
keep iommu-map to check which one cause this problem.

>
> Without msi-map/iommu-map:
> > r8169 0000:03:00.0: enabling device (0000 -> 0003)
> > r8169 0000:03:00.0: enabling Mem-Wr-Inval
> > r8169 0000:03:00.0 eth0: RTL8168g/8111g, d8:9d:b9:00:16:10, XID 4c0, IRQ 166
> > r8169 0000:03:00.0 eth0: jumbo features [frames: 9194 bytes, tx checksumming: ko]
> > r8169 0000:03:00.0 enp3s0: renamed from eth0
> > r8169 0000:03:00.0: enabling bus mastering
> > r8169 0000:03:00.0 enp3s0: Link is Down
>
> pcie1 works as expected. But this is only a single PCIe device, rather than
> having a PCIe bridge.
> Any idea what's wrong here?

Can you help dump more information at for PCIe bridge case:

imx_pcie_add_lut(), need rid and sid information.
drivers/pci/controller/dwc/pci-imx6.c

>
> Best regards,
> Alexander
>
> > +			iommu-map = <0x000 &smmu 0x10 0x1>,
> > +				    <0x100 &smmu 0x11 0x7>;
> > +			iommu-map-mask = <0x1ff>;
> >  			fsl,max-link-speed = <3>;
> >  			status = "disabled";
> >  		};
> > @@ -1640,6 +1646,14 @@ pcie1: pcie@4c380000 {
> >  			assigned-clock-parents = <0>, <0>,
> >  						 <&scmi_clk IMX95_CLK_SYSPLL1_PFD1_DIV2>;
> >  			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
> > +			/* pcie1's Devid(BIT[7:6]) is 0x10, stream id(BIT[5:0]) is 0x18~0x1f */
> > +			msi-map = <0x0 &its 0x98 0x1>,
> > +				  <0x100 &its 0x99 0x7>;
> > +			msi-map-mask = <0x1ff>;
> > +			/* smmu have not Devid(BIT[7:6]) */
> > +			iommu-map = <0x000 &smmu 0x18 0x1>,
> > +				    <0x100 &smmu 0x19 0x7>;
> > +			iommu-map-mask = <0x1ff>;
> >  			fsl,max-link-speed = <3>;
> >  			status = "disabled";
> >  		};
> >
>
>
> --
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> http://www.tq-group.com/
>
>

