Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC38AF0181D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 10:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hjxD2azxx86MtrhKnWbALaEngbdhn6j+ntNKGIi5nmc=; b=n4DKRcQVLUh7i24s5KSX5rO+ve
	1jVKoawVloj60mmMtLHAsUxDh+QEgxB3zC0GOri+6Qxq0jEy0DNhX0zmoT/mtbgP/mdyChdyiAtsr
	S1aNYD8hv2HbHJj5K9TmMJCgDtyohELGmSht0mvLT9Nn1GxI9ySfZdNyAPC78OT3nz5iyCDpoYFfZ
	YXcJcVLj/EOSPb452ReSKusbL9x/RAQ4ivSIBTcXTscvbGDKMBs1Mm1OWWSk8/SwRgOH4LNaUlKUm
	C3MvscTGLbZ8qSsdD17I+1yYXUSJi2fjuFTtlQf7CFxWKpbBUi6hh40TdgCGdbMBYzklb3ccZr41b
	wD3klzdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyS6Q-00000003Pgt-1gOU;
	Fri, 06 Mar 2026 10:08:14 +0000
Received: from mail-westeuropeazon11011034.outbound.protection.outlook.com ([52.101.70.34] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyS6O-00000003PgX-3SsM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 10:08:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l0f0UxubXmontRwKg8+fOaHGcin40pWny4MlOokkc5MW9yuflqhPEGusnwi1Vmx6OJFMYNJKUPp0zW/pNnHbd7NWITIJQsBjAfZrV/22dxjmeLfPDOJj5TjMtcawsGY8KhjUsbydxCzVYVHmZoNE6RhkXuwo2Og/LMIhl7aXk2yC0EFzehdXzrcVVHcalxAMXuVEEixfaaXcdx9z0mbgRWfQnXcE/7SYzMvq46VapzQ5J1Yv6pl14F79HNBSDGLRJiwfVY+1MEN45f+v0Rta+LAGZ/zwTAflVMfHrp6F8JZLsgu/zVzcQa0wi6hc5Z9dyz3gOO2jLwv2Pu4+kegcsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjxD2azxx86MtrhKnWbALaEngbdhn6j+ntNKGIi5nmc=;
 b=iftFtk09EJGxyLDJKDuj7aT1h0aFzN3QcTXgE9wo0QyjUVbdQVbrYy0yFiZ6K2olHUgcVRJxpSuq3BWIhM9EvbRN/44JBVbcjl6G2l9/x/cMXAvBZQf9EgHj6B9/0rMPKcfpwSlpH6NmiPdmBG8ivmvgaPyUb0Mkk+u1Oh9rSqCCoUUku0a7JoG0IfA7J+JlL3dpnexLCbzbvV0sHINRvJkfJNidyRZgZPFaRs2jBJh7MZN6hvfR6BA6KLRs9GA/E0doUtDwL1rnUfdbJeXKpfei6iDoNRiHhK6V8knzSqFRNmBT6lPnblIHSHXbSq6Gkl/z3g7bJqQr+q3oQPgYUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjxD2azxx86MtrhKnWbALaEngbdhn6j+ntNKGIi5nmc=;
 b=IvyjNevZ0q3V7ftgwKq6ACPOjtQ+Wi1oBUGfxDfOxMVHSjd+23XqcHNr5jmCxfdP7291WHdAHXAqSMyq0QUazceQ7wLxoR9ECgKhC9DdwtmmDnoSK/MfyLqko++FLjwnNPS1d/KdSxY+uLHloWnu660SsS9PJPKKogactfl2a5BIe/G6gMBmnmD9xY0n1EvkQQinjLebJTC6WnSlKQbGlMMDgBIoETt7zOz+BfTsabHBSSBR8itKxXk4+N0ju19FyGLdRLVVAataEUlXkFJSUB3mIY/C9TjgD6LQ+poiZDZdAY/T8dwAH/6gf9tXv3AUtQJFDJjQmmzoPbWoyyEMMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by DU2PR04MB8517.eurprd04.prod.outlook.com (2603:10a6:10:2d0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 10:08:06 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 10:08:06 +0000
Date: Fri, 6 Mar 2026 18:00:26 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, jun.li@nxp.com
Subject: Re: [PATCH 2/2] arm64: dts: imx943-evk: add Type-C node and enable
 USB node
Message-ID: <shfsnwlb5raj62vjkfdcz5mopyq4raaabquwxmc2gyeeois5r3@gmxqk2svtufx>
References: <20260305075527.1116943-1-xu.yang_2@nxp.com>
 <20260305075527.1116943-2-xu.yang_2@nxp.com>
 <aamkWBGOPDlc8Bxu@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aamkWBGOPDlc8Bxu@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: AS4P250CA0024.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e3::17) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|DU2PR04MB8517:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ec79537-3c38-468d-32b6-08de7b6842b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|52116014|366016|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 1kUIorcTGedHVrwdii7Uk3nHdGJylPtoMNmHAQyNXZPYvnuevQWneyfU6dm7HKdv4vioRc5veoxXNWV2wycfP10Dc9T17w5sFrVEtmE/0MJarMho1VVfvonifNGAf9183AyQt69qH8FU7kSRcLkb4uzG85YgWb7V0IeTJD1CoaMsrX8lk9Cdpuj0/9uZ4rbLgwEEiwEgx27PrmhNOzI6HnNZhip729jQvXRQY1M4W95i/w/JGx0lQbPT52/0cL8YwChr5UG+lFpPVW5z9DXvfnAxuDBJD/5hRShJELnpa/NbBnlLjq4gl35ZZDxumgqCX3MNQZRo5B1kKitpX3KBYTXGX6ycVjz6K9bfNAYe06DiWvcPuoyyT+u/KlAttAqaijtYtHqguuouZZoFZ8F+kAV2BJUfjB/gfkNWJMDdsPKG0KL6p9mvaZeYavGIDk2qnG+Ped0AkHYFIIjcxEp6j+uRRJttQv2LHvIZDv7K6J9JSw2okZCI9394K8cjbDn64t5CnMY+Vr/fVsU5ygCCG9FHx9AfBDNTDMCrHY6odsR4mvxRXeUJOgX1XWyQPJrz3INeoDW0vnmY3UKMswbKYSj2ND+tDS2w6fsk5lawp2NILBl8cEkYU8viI+lrFGHgN5uEVJrcx6bmOhlLs03vbFS5OUz4YtpBZ7R1v0lcdaFqrxmVnMMmOr+179abg0W77kzk3/OW0nB/+UZULMVEAQAuXBnuffrMREi+FM4/rTJbzZIlygAbYntBdw8+JNW9lugoWzioY7AN4q+FK1UAVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(366016)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FoaWcwoSBh1oxx7uW+ig55zVUbDEDwFnPgwtFw+Jcia99Fr/J7Gzf6eycz7o?=
 =?us-ascii?Q?2Iu8B+VeYMCQBrOKG59H+NrSiA+Ie3/KWTe42Sr/lFq0vh7ItSyra8yi4dsf?=
 =?us-ascii?Q?Z6hnt0mO7KjnuQkMPGt0e56DAxyqfbir6/icwM6A9dBBsyJF/F7s3hXeG43t?=
 =?us-ascii?Q?6enX3D6S0GDc86n6KFXsr2qtMyG3MVFnrX4qj2R8oy3P2VbCArWYsrYHKzIe?=
 =?us-ascii?Q?2Xi08a476XEdVKN+vDNkkiZieCn93luBNKSyyh7/iy2atpbjCmmdjXbO5dF3?=
 =?us-ascii?Q?EL+c3Xwe8fz6wbuoPZnfBxIUfzQ/PFnUgnWNdf2kIkiXB0ec4NgiRVnQrV9t?=
 =?us-ascii?Q?gC1OTj3CR7ZMdYGTUgScnGv4TfHZBAVP3zMiJr+ERogchYoNnSQi04eJri4Z?=
 =?us-ascii?Q?W6ropy9jLSGKnhp75/1ay/SaqNduTIY7Td9H9oT/SqFDSipJP7QjXZbfGdNm?=
 =?us-ascii?Q?9KcpJFZa8NwMLfcFALyZI7ibI0REy93WdqbF/9x5a1kkS5eTC/jbK671cmJa?=
 =?us-ascii?Q?kpEXr01Y+w4EdALAZUhLjSKSEPqJXXo069vBK8jt/leVO+UfSUVEvqH8l0Pm?=
 =?us-ascii?Q?8aRFVqQiZIxH0F3IiV3ayIRWlbcMepSYEhvC9+ur7m752bhmmnIDSzUd8hDL?=
 =?us-ascii?Q?uXLhj7nXJUp/9pv4mInpNChzyAXtng0Z2nUEQY3r/7o6moer3Abj4pCTsjjw?=
 =?us-ascii?Q?LzVd/pzLMunUXLz+uFJI+rN99JIZhnKCX9yZOaK0HyRIDt96gLU0pSuDI3dS?=
 =?us-ascii?Q?Gm/XsT63KbJc9bsgSfM/L9HPuiCEit/7WlYpmLI18xXLNtz324v757+iu8Lw?=
 =?us-ascii?Q?ehLDJBaloWpMT5OdD45XtpIpN0EYfVcW1EmmCrLQ1m6SguhRwyc0wUuPIk3+?=
 =?us-ascii?Q?wvM6TWh4Gn3Iz70Qb/vJixVwFnTKm+CSGtNoiBRXZQIC1E5Al2JX/67ZcsMC?=
 =?us-ascii?Q?DksFVRz0Xl9HrWOT5sQ+XLNtxFhyvqj97YXrL9Z5j4jq1j2Mx2edzQaq6Ftu?=
 =?us-ascii?Q?Jy2/1aKaWw39FJyjYaKMXPdhDQOA/F4hmQRZhaVFq2tCx/n+K0ame+IPhvAk?=
 =?us-ascii?Q?2FhW26QrLltYA2oxWpbz7IZjhNwPoamZNrdUqmUtMMRh0r4u2aVHNWVpUAkd?=
 =?us-ascii?Q?LDHXAlRfB+biaBjEIqRRD99JmlbPycObjcOh004GfmUyTnVpo1sXtCtYPmNE?=
 =?us-ascii?Q?JF54YYYD0PKBp4y+Am4g9gOUTCj1yGrrY99HnSLRGSJolOpebvDNXI1NSonh?=
 =?us-ascii?Q?CIsg1B7emHhohETJrqP7YxDvRgRwb5znsW5a0KetTMtEvmymvG9Tp0RaQvWZ?=
 =?us-ascii?Q?xklmjlF2Opc1IVf4hXIH9akyeYZ1rN48Ev/0tRLlkzCm/r8RPEacAaz8TeZU?=
 =?us-ascii?Q?UK4hx8Ai4pHCKCegxSw0Irs7X4fNRYDwSvununRT+0hQGEv9wSki/faNan3j?=
 =?us-ascii?Q?UzsGQ8F2NqXFmAJxsEbiHReGBBzLvFyNk2gui+SJ4/L8/rM4vCLnGnIAbIxH?=
 =?us-ascii?Q?v+x7PW2Wv3m6uyi90EL6lrUqyWqj94hzU3Otv0vtWUyxjipLFoYP0Y+NXQ4m?=
 =?us-ascii?Q?YA/LHp655NRX/h0mhAi49AruciC/TNfeOnKfbA0HyMMxNEfUUqcuHisAYnIg?=
 =?us-ascii?Q?mDy6KKPjBGAz9ni7J7GwQCaVyaALwZZYFZi/hc86blD795Cwwtjw5IqfMiZ0?=
 =?us-ascii?Q?lxn2anYS0VIqXXOCuesjjaV8yoKpXaLvKwnHi8aE1/IM6gWFEfRXFZb/lJ//?=
 =?us-ascii?Q?bBiE+vJkdw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec79537-3c38-468d-32b6-08de7b6842b4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 10:08:06.1895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u5xr1qok/E06SvNR4lv8+it7MmDIybKYVsFxHGWVvZvy/3Ix2lEtC47HQKmnD8AIRYqwi/8lUUWAvKsP+xVy7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8517
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_020812_885713_90F6C069 
X-CRM114-Status: GOOD (  10.06  )
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

On Thu, Mar 05, 2026 at 10:42:16AM -0500, Frank Li wrote:
> On Thu, Mar 05, 2026 at 03:55:27PM +0800, Xu Yang wrote:
> > This board has 2 Type-C port, one has USB2 capability and another one
> > has USB3 capability. This will add Type-C node and enable USB nodes.
> 
> last sentense change to:
> 
> arm64: dts: imx943-evk: add Type-C and USB related nodes.
> 
> Add Type-C and USB related nodes. There are two Type-C ports, one is USB2
> only and another is USB3.

OK.

Thanks,
Xu Yang

