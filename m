Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CA4C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 17:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wjUx4Xo/6nBdhvwk7VSHX5iBx7vY+KAkEFSPL8ySX3w=; b=Tab1iFMQT1rEmMYsDeICBpXrgO
	0XpePtWGf2HQqGCbEMANjnnXw5FvpwA9geAr5ecIvzajYbzy8oqjyg9bvfgJgfqUxyi/az6mWQwAn
	eDVvxQlA8nWKEaX+U7utFDS8b4EJcwWepFbjmOgTYI+2F7pC87A3k63+MpzFA5JLjFEKLE+IcrW/3
	TPp9jlZsc+HrO33aNI7D47j1U/uwk5Mby3aom93JWN3aVE16cGn8AL9rJOElEIjrPNbldYkPFXoo8
	3Gpex3Gw6wcIcgZ0EIxHDwVFNYbV2+uPwFEP2vbWjSYgJ+3x0ZpJq7wsLyaIwc4SQCbsPb+wWp/EW
	PT3ATuHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnLMF-00000004kYy-2xpv;
	Wed, 26 Feb 2025 17:38:07 +0000
Received: from mail-northeuropeazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKL0-00000004XWx-2rOl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 16:32:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YDdwrxEe+c5zR/VMPAyjDvDwgcYaDU+Xueu1nc1ECV9wk9qz8C0Ysu+aFzY3Umte2lXPIa/ZkW0oFuOh/eZMB2mBg4fo0xbLEodSXTBIl3RhW9fVYJZtJFvaPORFxzvFlUAmDNiRDNTEoezkJgOMP4TxTxFi+Ls5cXw1neKYK6TEFEKImofNjmCD4SRu0tuMIekK3S1yWz5gM9muZs4dTx4QVfhhXfZiu2MTIoNkr45lhUV87QyYb5LDLZAnLI43kzY//9YcQVOs/ZpoWQWCesM5KcXGAwcr3yI/E/XlHuTSGf7isDuuEYUJguzHuiTkWA3BnXRVd6LKvuOpzJEX0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQtbwqOtKLXrSInYInuRROVAX5HLHlQb3S9CZrqvx1g=;
 b=CgWZ0UiRnG/KeJ9eMJfaqSgSaemlQEotGm10Kse+ZtGCeZdLrHvbzazx+zFpU1dU+fpWD99gGerpPJ3V8x/oifgD5ywnBWad32fUWUjXQKbL0UjLrJlpEA4xo818WG7+5tepgvbFuascvkInsKHVf8QWaLsAtN4HznKlMOerh6UJow5KlrZisiqSzuE3UORMFUTgvkMysZkCZFN2bDgMfZP7TYq/+7sGCoRKur7oMUqUannuSofd0kELyRpEFAwpcZZyTwACbNnss7Wqh3usZVcbVVu/IFFircHaDX8dva/bRSVRR4PZi66P6J/QMPwedF/Xa1qjoJZzfv17M/Z0Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQtbwqOtKLXrSInYInuRROVAX5HLHlQb3S9CZrqvx1g=;
 b=hpT+0lXPBWD4URTFUgkyeuxBjQDD1ahGrjan95y3Qly8mft5USQPKSgGlZRE2IMSueOVmtbPAIeB4PmXnT9olnxM+N4BcdB5QGclaKRIBdzUE1NMMFh8Pd4FREpbHrpsY2V3J2JHNpf+L5VhsPV9IJkNyci/PIUVisDV0Wli5oGzjtFNSnoszsRAe7YK0n7K7eFIFz26WEWxG02/UoAHQvqUqtghaOO9XdUhKOglVgM0lMj8PBa6pCZgrVr6V21PR7knfVOpWJSMqb+ZE/soq7N+5hMdVt8vBUq9o5zBmExaBhhIuAkOaYre4zq5R8Mskof/DEki576fD95x9pVtTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB9PR04MB9866.eurprd04.prod.outlook.com (2603:10a6:10:4ef::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 16:32:42 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 16:32:40 +0000
Date: Wed, 26 Feb 2025 11:32:29 -0500
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
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] arm64: dts: imx95: add ref clock for pcie nodes
Message-ID: <Z79CHUVZc28ftqGZ@lizhi-Precision-Tower-5810>
References: <20250225170802.2671972-1-Frank.Li@nxp.com>
 <2979558.e9J7NaK4W3@steina-w>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2979558.e9J7NaK4W3@steina-w>
X-ClientProxiedBy: BYAPR06CA0064.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::41) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB9PR04MB9866:EE_
X-MS-Office365-Filtering-Correlation-Id: a1b4d74e-65c9-42cb-9593-08dd56832e93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?7D0uK/ilVXQ0nA/MJW+ZPfsoZgEtTmJYRpABHJZMgphixof+VDA2IXsJqn?=
 =?iso-8859-1?Q?frOqs8JWEyKBDPnuV2NCuzEsU59J8gbA7+Qmfv2XssluWfBLiE33aw3kUy?=
 =?iso-8859-1?Q?uXSyTuphF1hwmZK9gfLrVdxopEDquMJFDJvWkWGmz0zMER91d8ZZCOG/P+?=
 =?iso-8859-1?Q?7iwRHdg34JZL0vb8pcSN+E8PvZjtYxiYtJlizab2iuVN32ds6Pz/h8b/bM?=
 =?iso-8859-1?Q?3/nfNPb7AN1HVpSAvvUj6igv/p3YXCcVoZvYjepZLZxqQwa6Tb9kM8mQyv?=
 =?iso-8859-1?Q?AVqTadt7rh4ia/+ViQ6Qji3MTQrIrq3fEWuWJ6kIYEPCXVEWFkKBzKL4Nv?=
 =?iso-8859-1?Q?bdgnutCaR99sIqNR8NeIlgL83cJWu/YsGXfZSht/dHUmLT2gLGOKHeInWg?=
 =?iso-8859-1?Q?gILUHr56XGJLW0vYb2yIQ4iFIFV6J0JOO4VBsnNjywHCJ1p1TBQXTO4cdV?=
 =?iso-8859-1?Q?HJB1bH/AWH/xTSeQaat3FGTzKqdU+h1Ox7etaedWx45DIVkfv1HZCC4EcW?=
 =?iso-8859-1?Q?cKM1pnq7f6fAXHknDCeLh9fKMryt8w21euMMdLq1mI8Glvf5VFmOkSFjaL?=
 =?iso-8859-1?Q?DRUjob4P3J75/a3/fef3kOzImbXfFZ0ygqpQLgiLqraKPWIGSrX1GpczLh?=
 =?iso-8859-1?Q?Nf1Sp+U1ZKrGrcPV3o6MgnxYKPwvdYx2kaTvPygCrwLm5uNeaVxkX1CsKn?=
 =?iso-8859-1?Q?DQP22lnl/OixCwFRhumaahootS5lUKif2PJsD3/rRqlTY1Rnr0wJr8MZUl?=
 =?iso-8859-1?Q?lHBMydy8kPV5lX12aTzX9pahNmrUSL1RUbmgNbSprNl/fcwEfom/yTInnh?=
 =?iso-8859-1?Q?42SYu8D+/JWWtt0Yv90MMCrGYfBL5PbcXVghBL/kHsQCHT0/DSI9aNDx+M?=
 =?iso-8859-1?Q?d5780dv6/T3xbmnY+0geHtQrJFaRMUojBqIqgXhidQXN0MrR/6bb85h9Ea?=
 =?iso-8859-1?Q?jfVnjdeSx8zUz29prZSZYx1ND1zUMDHe8uR08I4dlmyG6PHNEVnkRHW1Rn?=
 =?iso-8859-1?Q?HEhsiDZJXReL1P0GFjAtFgHSlqG/KdT4VjnRu/LOOlmkCV7pFCQNYQOjuh?=
 =?iso-8859-1?Q?m1ClQW0zkBTyY5SeJFKODN03HKnP3S5qb9PU6AyPYClTkTdDFmPTPBWZhi?=
 =?iso-8859-1?Q?L17xThJ+c9hVzoFuP11QiO0IduNMDRDZyfHGm1RWt50LnFBWm0FQFcNh8x?=
 =?iso-8859-1?Q?1PjllpW/3xoXnmtfY7OYdUL/2SJqliAJMvk046n8Y5v/LE/2FffuEj2zW/?=
 =?iso-8859-1?Q?zenx8qu4T4qyo0PQFrrxY0eTZ/tNRh6POmOddr1KPU2/tGRTj+ITsIquK4?=
 =?iso-8859-1?Q?NQMB7zXXIZOlrTTiZlt6++Y6hyudUbvy5MWNe7ggrviblCv/ov8c9LVyQ7?=
 =?iso-8859-1?Q?HtFwboMZvbkpICJEqwYdf4eoG+Vs/KHKahRNuQpn80THSE+lTve2J5zXmP?=
 =?iso-8859-1?Q?ldwwDZXd+eSrtD3f?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?0OgaMaLzerzFk8z5UTfSmDFheqfeKqZl2m+wotqPBL5vmnsqvYXAix3QMy?=
 =?iso-8859-1?Q?KXU5BXKuxbScFUaWK9z+OY2nvGRmzVsj6qrJi0yOild2q8SeMNb3LuOB2w?=
 =?iso-8859-1?Q?IuiYdFi6AOoRla/ZuE2FQR20LOkimIsisU7yHrZdzyn+xwKrM1T64bkNIb?=
 =?iso-8859-1?Q?1dvc8bIDmPn1xBV8jX+GmXahvY5EyGKOa/f5CosOwRL4ABqBlWUN3p16Uc?=
 =?iso-8859-1?Q?IMMXeMSqyLdIFmtwN3PYqgvRzM/QCUXyU8KI9RJ12qzbcIKLC7NCRdGAEy?=
 =?iso-8859-1?Q?uLx1uW9XyYirFI81W/m9l9vOU9DEDaVVrYS5c2PXMOIMw+McfA0ifNXSOM?=
 =?iso-8859-1?Q?lLrEXxKzCn1kY7jHixP4M467GUGitOmwxng6iSinxiT7Vhg/3hzAmogDZp?=
 =?iso-8859-1?Q?raHVtPUQR8s6Z/VEoTdHJcwGORXsam3wy1ypLG7jDlfa9pjA96yAaipeZ3?=
 =?iso-8859-1?Q?/nZgsMGBGdZY3VhrTrpIgKzvskhcpI8F0XBD5IuwyA10cKLkUReBfB7sP7?=
 =?iso-8859-1?Q?5NBc555U/G1V+b0jkFwauBiWlBk54KbeZZNtv/8A/j8XVokIxuwVmxn3j8?=
 =?iso-8859-1?Q?aFYw8xUAE3DXVppFo2TrYqNnapamtJ68P5IHltkq8k1jh4V6KEG03dhgR7?=
 =?iso-8859-1?Q?OszRDReEm6IHpKBV9CzgrL3qpfOOIFzHhVF4Ky1+eLWfpXgw8dz1VFHjVA?=
 =?iso-8859-1?Q?7Rmmd3q4PLhvMnp5oLo4Ux3AekKig+AB9Na5ikajzMIvzGvJ0oiuqAHxBY?=
 =?iso-8859-1?Q?7fpoH+Udg0uO/cpBFASSG5RhDm189q2cQsAy+gwcXXemncFg5/a5YmcqKv?=
 =?iso-8859-1?Q?EQW8PxfhXg9WNCQm5LrGv0Au0EzO+4yTI5r/xR88x37hYgmT0+j1ljLnj4?=
 =?iso-8859-1?Q?AdhRVO5iQ/18cgClysNwoW2Jz81c1xm1EZTlhajJ+hT9AoA0zynFgCRzBU?=
 =?iso-8859-1?Q?7v+FS0kwDYGiZc6vKDlV4VJe50Eq6+n9PiZsT6HD1rnlEyx/nD/srvYexU?=
 =?iso-8859-1?Q?9LGxSSx8cvukEc31eorj/swpMIcst73sF3d/e5GPld7eiVW9p2zZ1IZcgR?=
 =?iso-8859-1?Q?SZm6mDgr3e9TLFuo8sNIltafn5Q0hKDS9mKDGzW2F/4JyfLKenJiknIJwp?=
 =?iso-8859-1?Q?UdBYTpsA3gRpjBxs2sRO4PqyfB/FWo7h2mSx3YKCMolNMz8vAoUHyrJkks?=
 =?iso-8859-1?Q?pwWU6NgHc6Z2u4Dy++oGrB2/kUlZmPhO0zQJ4TtrzlQvcODaXKdUTdXWRl?=
 =?iso-8859-1?Q?KCKateh5Lh3Dend3hUW8Gj166zgTZF3rv7MrR+t45E2l4Q68MNxesgEllQ?=
 =?iso-8859-1?Q?l7pcd2Y3E4jeOLDoM18RKDAukvlEb1tjYEQmSZxDwE83/IGG8rE7kUe5eN?=
 =?iso-8859-1?Q?Tgt8Uk3rmwtREMpLqRLRYGFO1o75p9Jkh6n+ty1F7pGCAf1feBJf2Pl0+O?=
 =?iso-8859-1?Q?3hG8UiIVGxVW9GFM936pQwL+Q3JGYTrdH19Z+vOQeuppquk6DtDo+f8dqa?=
 =?iso-8859-1?Q?2Z06xsa0+GQGSvagdQqxE2utr2VKsYxZ+x+B0x8/ImJCFPqke2PrxxK8Dh?=
 =?iso-8859-1?Q?MAdI6Ir6+Hx5eXAlV9OJK2UJUQ1UqeKYVWeOwIflIOehcjuoazHIf1u0Cm?=
 =?iso-8859-1?Q?3LmGuK3rxEpag8FfZvswjSm0c+p5EFRsMg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1b4d74e-65c9-42cb-9593-08dd56832e93
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 16:32:38.7976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 76Ahz0bkz0+l8HbXdIx9Sp2h2RzQv6OqEvRd0NBHIDFUQwVzLndXjEab7q/5OzLEh5l8iNm02X6zkxJ7su34rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9866
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_083246_723193_7F5FC643 
X-CRM114-Status: GOOD (  20.66  )
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

On Wed, Feb 26, 2025 at 09:30:01AM +0100, Alexander Stein wrote:
> Hi Frank,
>
> Am Dienstag, 25. Februar 2025, 18:08:02 CET schrieb Frank Li:
> > Add "ref" clock for i.MX95's pcie and fix below CHECK_DTBS warnings:
> > arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie@4c300000: clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux'] is too short
> > 	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > change from v2 - v3
> > - fix typo 1000000
> >
> > change from v1 - v2
> > - rebase to dt/dt64
> > - add clock 100mhz
> > ---
> >  arch/arm64/boot/dts/freescale/imx95.dtsi | 25 ++++++++++++++++++++----
> >  1 file changed, 21 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > index 51625bc9154ec..9bb26b466a061 100644
> > --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > @@ -291,6 +291,13 @@ sai5_mclk: clock-sai-mclk5 {
> >  		clock-output-names = "sai5_mclk";
> >  	};
> >
> > +	clk_sys100m: clock-sys100m {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <100000000>;
> > +		clock-output-names = "clk_sys100m";
> > +	};
> > +
>
> Where does this clock come from? Does this origin on board-level?

It is internal PLL.

Frank

>
> Best regards,
> Alexander
>
> >  	osc_24m: clock-24m {
> >  		compatible = "fixed-clock";
> >  		#clock-cells = <0>;
> > @@ -1595,6 +1602,14 @@ usb3_dwc3: usb@4c100000 {
> >  			};
> >  		};
> >
> > +		hsio_blk_ctl: syscon@4c0100c0 {
> > +			compatible = "nxp,imx95-hsio-blk-ctl", "syscon";
> > +			reg = <0x0 0x4c0100c0 0x0 0x1>;
> > +			#clock-cells = <1>;
> > +			clocks = <&clk_sys100m>;
> > +			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
> > +		};
> > +
> >  		usb3_phy: phy@4c1f0040 {
> >  			compatible = "fsl,imx95-usb-phy", "fsl,imx8mp-usb-phy";
> >  			reg = <0x0 0x4c1f0040 0x0 0x40>,
> > @@ -1633,8 +1648,9 @@ pcie0: pcie@4c300000 {
> >  			clocks = <&scmi_clk IMX95_CLK_HSIO>,
> >  				 <&scmi_clk IMX95_CLK_HSIOPLL>,
> >  				 <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
> > -				 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
> > -			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
> > +				 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>,
> > +				 <&hsio_blk_ctl 0>;
> > +			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux", "ref";
> >  			assigned-clocks =<&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
> >  					 <&scmi_clk IMX95_CLK_HSIOPLL>,
> >  					 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
> > @@ -1706,8 +1722,9 @@ pcie1: pcie@4c380000 {
> >  			clocks = <&scmi_clk IMX95_CLK_HSIO>,
> >  				 <&scmi_clk IMX95_CLK_HSIOPLL>,
> >  				 <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
> > -				 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
> > -			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
> > +				 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>,
> > +				 <&hsio_blk_ctl 0>;
> > +			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux", "ref";
> >  			assigned-clocks =<&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
> >  					 <&scmi_clk IMX95_CLK_HSIOPLL>,
> >  					 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
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

