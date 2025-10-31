Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B86CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 19:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DCI2HCzwIlV6zLqwpvaVjMiSUfPI0b9aQPBKdE9sn1g=; b=M2vrZOy92CJkgd8mu/EwxNRQlT
	sZ8efwwtsJH7AVw1qRLljbFBh/v0s8h480VEANOa9nChNLn5hnHx764uNpbu7dAu/LNqMHJ2G3ZmI
	fLTSqY8H3JtbeoLwO58rfCz6uXImAQK2jKNP0qm9TBVYasgG5QaEgipBdhXNxNd7cEf7PqcVBsZl2
	ClICkcYIgB3IG+XewRcCs2ksgPVDssnFZSdeGUj4WjaSbUqK9VgzhE0tObUsRC3AUpbaNk0h2VjyR
	fKkZ0TARWgAj3h40JD7IhoN0SyeKvngH7eJucnqVt6+E5SbtCk9eyK1Ke0Ukqf5patMlTgEOa2Z7a
	91mlyBag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEuxG-00000006ix1-2ZFS;
	Fri, 31 Oct 2025 19:38:34 +0000
Received: from mail-norwayeastazon11013014.outbound.protection.outlook.com ([40.107.159.14] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEuxC-00000006iuv-3Uba
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 19:38:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YjkzfyqHGVJSX1/Hpwt6hyVdx2fuTJO+swEtjJH6qTrl50lnsfKjpSuTEoytdQ8z00VY1/rno5q+fXW8xHX1fqcAeTpoJVagwOy2JH+Z8vt5fdVe2U2MoOFX93PSyJ/ynXu116boRAnWKFrFVmZ0z+RnGxLxqyfEC+xCm8Ex3i6XC6sEdhfrQYJZkQ4k8nv6O0ZIEwIie9uhD+CYtQEbSVoJa7BnOaKY4fX2HcwKuLC7AadLiUK+IlmwyiSPrWI4ZQgpOXxcpxQHdbemipXRhooZTdf6pumY+pSI3FT5bB4Wga290mSnca3S+eHnPc/veP3XKNo/wBnE4Qei7wZUbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DCI2HCzwIlV6zLqwpvaVjMiSUfPI0b9aQPBKdE9sn1g=;
 b=LlmTqVCw7WgS4IIkgRfQHfEykoeQD4QjfNR0paokCT/UNeJUxVVycu8CdPoGAYiMIg0tSOg1aHC/SefkSzSRW5Rr4+74Iib9Wf+2DaNHzTdC5l0vrM1TUVETZy/b1KPrtNOM/KnGyAAuFTqmAm2qEmQN5z7oCT36dMUYzGqpzRbN3tHzRf8eYl52rlg//k4yw45U77HGHmcsDNXCZNRHuP1+173R05Bvn2jpMnGGCeVYhdKSIGeYEf+qv+d+96ehmWtWSq7mf1U6MbqvBVrdyVVgj1pkGNPZ/NoZzmtbgqI4P+4LCnm098a/HvmFD792RDT7iHV1+ol5uUe1zKR74Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DCI2HCzwIlV6zLqwpvaVjMiSUfPI0b9aQPBKdE9sn1g=;
 b=ItbQxE8a9ENkuQxE33DJPSojR1oR7Xf1yPunPAZGYnRsck2n1+RYRcchLMODwlA23VLYf6Vmi6Zhi6d+xiswXNdZmgX+rQqzFRywjmIrWzxAvJ/N8UGn6PguGBpiN+uBU56QpZ5jMnlug9hYTZXEGFlcTLmpiXFjK4092M6AgM+Jfid+tc0xiXpnGMofngPf4mcNclN0E8PF7LZfhE5qPzYlugA2LAmRgNXknClzg9VKszupZN0cSl0NhuryzeDIjpP/mN0EgUfkiTN0f6RWEiFpn6yS/LB+O9HjeF70k133VacXWFyH3pO2xKeHDcaqnF2Qsn/GxPjQ2my2SytpmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DU0PR04MB9468.eurprd04.prod.outlook.com (2603:10a6:10:35c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 19:38:26 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 19:38:25 +0000
Date: Fri, 31 Oct 2025 15:38:16 -0400
From: Frank Li <Frank.li@nxp.com>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: l.stach@pengutronix.de, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, bhelgaas@google.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 04/11] arm64: dts: imx8mp-evk: Add supports-clkreq
 property to PCIe M.2 port
Message-ID: <aQUQKA9UX/yoKl9Y@lizhi-Precision-Tower-5810>
References: <20251015030428.2980427-1-hongxing.zhu@nxp.com>
 <20251015030428.2980427-5-hongxing.zhu@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015030428.2980427-5-hongxing.zhu@nxp.com>
X-ClientProxiedBy: BYAPR08CA0037.namprd08.prod.outlook.com
 (2603:10b6:a03:117::14) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DU0PR04MB9468:EE_
X-MS-Office365-Filtering-Correlation-Id: 41414519-d5d6-4eb9-2750-08de18b50f24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|52116014|366016|19092799006|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tqV4J2Zbe/ZlB0ggN16IZ0NUVvcqMte+yO9ja8czKJvpY/uBgE44XuEiX2ta?=
 =?us-ascii?Q?tGQl27eVpY/76vS1u3II1tM3de74bly2veag+nmuN9b7VvoO0ck/NYqocOHv?=
 =?us-ascii?Q?VTro1r0LPjCs/qlG4VP218NdxLJbeQhvwS2sLMQt/SDlJYRh3dN8qoyiuvJc?=
 =?us-ascii?Q?L44k/PmJsr8+Iwm3n+8T4mm4k6z0jMhJU7M5yW2EeHoEZWfBrFGL5rYbaWOT?=
 =?us-ascii?Q?PMxNx2zlOBBfPYc0Qfb3DvkaUb2tAt7wBa33oNrC4SNYXCLyB5KfkIWGvpof?=
 =?us-ascii?Q?uNzihqeWBAtKliSo+OdGC4Xqeo/elyJHLKekfIsuoWMashf2PoD+4ckspfo+?=
 =?us-ascii?Q?rSmx1l2480JQt3ugy944C6J/Y8N2kA86PA0aFbtE36KAI1UUzc8kGtbPuXeG?=
 =?us-ascii?Q?k2NxhqyKLyDTQyU+0mQ44chSFeBap/Da6fyAwaEfT4bGvqdCM5sW4vNmLldT?=
 =?us-ascii?Q?0P2GrcrGrMBa7cpegPz1wvBzE46TL/eaD/z5HqLbRFud2WFAOP6iH4XMls9G?=
 =?us-ascii?Q?OtUXVnehmSRSbKzfnJREQ14TwGeYfDIEud6WUR4NRDSskWKpTQ76Q+4GUr8Z?=
 =?us-ascii?Q?kfkfO+K/b/Mi+ShwJa7xuIRHIFUu8r0RqF1krd9ep4TMN2Fb8sR6W9ypKeb7?=
 =?us-ascii?Q?cnDTu7+eiTysvpiCrAEf4s8pdT5JyxtcYdeY84iU1EaEoruRa6CXh611Bjfl?=
 =?us-ascii?Q?oXOA5fmwxy9ZWfcovABr8RQLQnl0JeB+CLfkargRLhjIrpymzsYvcCp3bWBu?=
 =?us-ascii?Q?82Q07pFqQgzfJGiGabSVqJXXGvmqcm2NZBIGPdOUYKCsmENC3f2H1o1gkhnn?=
 =?us-ascii?Q?f7EoOT27Llhh594jxzNAb198IhCZohfxs+D0Wbcma1bDzTCfnewgCjFtmLDF?=
 =?us-ascii?Q?oU1LW0LJrRG/sD8LzunoSrsAbXW/Drl9hetPiejMv8tQbtTmGT33pNQFncln?=
 =?us-ascii?Q?RED3A5p9LZhiFtMwecUPzSMqGM6j2rnpUGp8ViLmtVCYMSSuFDUdscRquOq1?=
 =?us-ascii?Q?jvETzkQUPeVTk74Y+9Vq660aHZC5imM77Fh7YkwHVK6ccCbi+13WlHIGROQn?=
 =?us-ascii?Q?BekmQKmT/HQEVtiUWFTRSRV4EXefA1MPTpXfHHbc7/VTHi9Jd7VrjO/LCWno?=
 =?us-ascii?Q?cO4eBtl1Ql1wThfzRueUvqi6RzAwSF3+DenHxz9yfXk5bTlPIXQiznAyftqW?=
 =?us-ascii?Q?YqAOmwZ9FwzvAKsLDmBntlNaJbVLGXU9hfeSBaEpRvU+56xkmLohLZY3IvU9?=
 =?us-ascii?Q?+WbHWU4rsNHWfn10yWDmemq8NrUy+g0HkVE0FGLsfyf6GcTkCIUEm1TeVtx2?=
 =?us-ascii?Q?MG4spkUj5HLQrmTUJOV9v/lTBI8ea/GZDx03MoVWBh5wAA8OTQCkDDHCdmk5?=
 =?us-ascii?Q?pLOCSoVzhwnLoRP8oOLny8x9ye3n6+IZYuyBeTlaDyYIoSAcYrhwIMqK8cdw?=
 =?us-ascii?Q?2IMzCvciXCZ4GBdKjnhqXj7htgKS6aR4cIbmslx3UbuXWfm2rh5sX9qSLJGE?=
 =?us-ascii?Q?+bsorzJ2xFcTkMgs+ry1rSWch6dSODVfkhaL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(366016)(19092799006)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EhSqxNL7uN3I7Rtc88UPFrTWdnkzmW5Xu8K9R0Kt+Mos3yJ+YzBysc8zvVhN?=
 =?us-ascii?Q?Te6H8ohECK/jAuQcGvrS0+DYsChwskGUArm1zUi41YCGLXaebWXeProt138v?=
 =?us-ascii?Q?Sny+C5FeB4V6lrNGMgP3FKZyh/QeCGseNsuOuGAZpjWS4JtaLL8DutJkvI9j?=
 =?us-ascii?Q?IRkaJ8bddWyYjDbALgwRNv7JHjrlVWdL4Tnc96RKD0IVcpaP7vK/X3lODXJu?=
 =?us-ascii?Q?+blcF51jjvug2/xtsMgPY3SG4GsEGck507lPvvNx7pb3AdxUjmKV5R5UFxic?=
 =?us-ascii?Q?JXYwFHaSC+W8TLA+jIswBRdY9x/94DBCj+9T9d0SrsXDYf1b8UVJqYf0urdD?=
 =?us-ascii?Q?vUKRkaGrJe+C2scXMT5XQ6sPoiFE+NQtkkvmA0YOoLQ88x38z68Le2WGcg+x?=
 =?us-ascii?Q?DmRF57I5NkttQZE7mJdpsAvCarS3DaV5nyQuvth0h8kQ/IxEyRFhjrEWUGAp?=
 =?us-ascii?Q?BKwqaRdZe+0v+cQZXon3T+KCU9i3+hCBGx753DmCsK9Cq0p7iCnyckYdSfSc?=
 =?us-ascii?Q?9aLsnxwLlf2VU2HWc3dBMguFmAEU5qVnZ4X7aXUu+/Uq7Tk3YRzjq5EGhaF6?=
 =?us-ascii?Q?67DcaHESfdvZMA9NjJNifhtLW8gbNTGkDpqvxVrATtuzkJLptA+01WygIh0n?=
 =?us-ascii?Q?/NoJjs6KbOEtjO23RUj1HVYSUVA0BM7KVD1dfIZ1ZTX3XkalXdMqzMxT+f1R?=
 =?us-ascii?Q?Ll86Cuhi/H4BlfHbs1JDdClqmVTSWcWAbQmX+ozMUa9UIhzBQPz9GAValf0l?=
 =?us-ascii?Q?9jbNi7mA0L5W0NGDU0/fMym2iNuPou/Js84g8ZEuNHXhX7FgB7ceW3OOATeq?=
 =?us-ascii?Q?4FXLVgXAsXBcSm8YfbH0upfMICh7FYB8oG1SHGh2MPVnVRXn2EnTwGbYvtUK?=
 =?us-ascii?Q?Jk5EHTSN3BzHuzvb58ihVOq7tkbyVnSGoMS2jeYuIcPwJMN2p8MwLfjzwJxO?=
 =?us-ascii?Q?qC6ZSoOpVpOZG1dMWkWRXIuhg/GZm/1j+OsIoSSgka+02FRqvwssV0n/F365?=
 =?us-ascii?Q?S1WLdcwsT9ugwhCAhPQWfIoN7I6SSCYUhZatpe7iuXwJ+KZCLqj5elKdA+//?=
 =?us-ascii?Q?LNu8hYM529/9wP5oifAsMAWIevBhWcwC7JMt5c2ML2o8VLrLBa/7Y5j0ejO1?=
 =?us-ascii?Q?vHVXA7JWtqNcEPJd9JKQcqHmIlH2mzHjOHjqL6vCpt1Un/4dUv9cO4m/1oCM?=
 =?us-ascii?Q?vPhpwiNt/ZYqyv4SbBzmFskrPoSpWX6oxPB2tcFI1CUIZsyEI/SV00SjW/zh?=
 =?us-ascii?Q?y9gyJXZRnBvFxiC2hNQL72BBRP2EKoia8/m/tX98knQo+So6pFfGQ33hL2iR?=
 =?us-ascii?Q?e+Vv//AK22xWJYMERdxumiQ/YYUu9TXeulPH6JcxTPgsaD2tpjksvHmhfYEU?=
 =?us-ascii?Q?aW9Ru0jApTuSBEv2hA9q8PjXV4oZ4Cc8ecjIeZ/sRoNiaQBO+kiQMAui2o9y?=
 =?us-ascii?Q?JX3nZv6gsSFwOVsZEqAqQYQmoUoXREv9NaycdfywEnjcrlUsj74Gsl2Uh6CK?=
 =?us-ascii?Q?MhcvhSv9y2C5wees6n+tA56oznhrHLhgW+phsiBtRwahp/0qV0VllFjM+QXk?=
 =?us-ascii?Q?4BlmrYey/KAxemZZf6I=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41414519-d5d6-4eb9-2750-08de18b50f24
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 19:38:25.7716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UWMbV2rEF30avUqdV4+LcKbYJRlRr2HyZoQK+A2fQ89heE+85QKITCxxsScYRF1XtnLvjeS2sIZnmm/pl/wXuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9468
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_123831_264259_91191B19 
X-CRM114-Status: GOOD (  16.94  )
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

On Wed, Oct 15, 2025 at 11:04:21AM +0800, Richard Zhu wrote:
> According to PCIe r6.1, sec 5.5.1.
>
> The following rules define how the L1.1 and L1.2 substates are entered:
> Both the Upstream and Downstream Ports must monitor the logical state of
> the CLKREQ# signal.
>
> Typical implement is using open drain, which connect RC's clkreq# to
> EP's clkreq# together and pull up clkreq#.
>
> imx8mp-evk matches this requirement, so add supports-clkreq to allow
> PCIe device enter ASPM L1 Sub-State.
>
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> index 3730792daf501..523bf4aeff317 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> @@ -710,6 +710,7 @@ &pcie0 {
>  	pinctrl-0 = <&pinctrl_pcie0>;
>  	reset-gpio = <&gpio2 7 GPIO_ACTIVE_LOW>;
>  	vpcie-supply = <&reg_pcie0>;
> +	supports-clkreq;
>  	status = "okay";
>  };
>
> --
> 2.37.1
>

