Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E79FC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 02:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vDY4B830VXvhUgcp+0VHsG9npfOC0lmvBPDD3KVEVmc=; b=zqcsYHISWcNLPwQ497+ShueJK8
	s1JoB5tQH4oKil62fe3W3LBhzfElvg6nvYoCA5FSpDCv+5cZT+MCyh1vZujRqX/88ChGKyr0VrPMr
	+lVgKJ8NgX7U/VnskzsCRDa9mEm1e6VopZyxGeHvU3ZJXIkdakGA5h4U5S1zLCKUPO1/zr+SAMpFO
	HRlKEC7ERnPhVtA//hcEVf6Ttku6ESO79WPrrRsv5+eaU426y3vrvYX9aD3J+uQlZ3wt2KrIUReu7
	NQHysl25I0IIdN5oYA0Y3/8ZDyhkaDWtBCvR9n3AHAGtJWg5/x1i5yzrRGEFMZpL/6gXSieulwNFR
	dvfQuBXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFlHF-00000002J1A-1Jzo;
	Fri, 16 May 2025 02:58:25 +0000
Received: from mail-dbaeur03on2072.outbound.protection.outlook.com ([40.107.104.72] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFlF7-00000002Itb-2dFE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 02:56:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qe6bYikaDgEtUMdWNp9zF+QEWYbCYi2BSrBaRF6HYI6OK2Z/K+bx9hocRNj/JbS+RJdl+DBmCvaU5p07PGnc1PboKs+n1W59P/jtGENxsizqUNUIr+HGCIqPdxgikKwm6FD5q55n96Zke+OaDdhQebZI7p9U0Ljp1RoEGNC9p7mN8kxmdtckukJvw+j35JuISLNpkKjAFP5oRK2xkQG+i/tV8wF0IwCcvUbC3MBhUijJ8xxlvUVULL0URAurnSGUJB/TKddJsPpnmCW3sMYTOJo3oDFSJ0+RkHsYP1ktShTiZb9NdVS2BRwZ8oQIZyqNTeRVujuBMghtLF3NkCrPXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vDY4B830VXvhUgcp+0VHsG9npfOC0lmvBPDD3KVEVmc=;
 b=pHHYP6ZzUp4fBMjuRTV91cWeIYfteIU1W5Pyjs6/OYAn4cexe1/SLmi5rGq1xfRzo9rxXST1iXFCY+hK0FNt7IPdcmcFzwak5x13icAeLosqQikJee10SEpnFYDN3nhWNlm46nIt4rGofY6gKt9THwy53V1OCBM4ovOK+ajlySEzuZyP/hg3Dm0Odt4rCacViEcaMFrQUR8ZlrURnjLU9YVc7RcCLBmTbFjhGL7wi7za1MELmMrQp2Bf+P1BV6GfKK4E1FMoGTh4gmHJkiPNQOG/NN2HdoDynbHnAs0XSDjvTX8WVv3hQIbMSrYjjY4bAw9PHkIX+5ANn14ypAQoVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vDY4B830VXvhUgcp+0VHsG9npfOC0lmvBPDD3KVEVmc=;
 b=k4Yf9OCromDSkqbCm/yDTK3If+sNXFN8MPGihdryXzN/YGippUAG+I7MMIhl6CSxekx7+++uGy53iZWjmK66gSiKGNEChxwo5YhjxHF1i5dwxt0juZVKYWFcJPkxH1Vnh1GrDVzfWzQOPBLf7WGefys0mdmaTuhyiz815R6lfUqHFxMuyAFoEG8gz3/XPXbt0RRA4238RSZ9nhwhSbjtO1vh3o5QrmUUrc3LWW1ADhd2F+1S8Dm9ZozCpz6zfCVAUum7BWFWaLIH29xaJLljnxigfwCJHkLBJ/uhqYRxj+wVjEsfgtU61afrld+iDH7E17WfkaJiAxnpXd9zT9PIqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB7869.eurprd04.prod.outlook.com (2603:10a6:102:c4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 16 May
 2025 02:54:54 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 02:54:54 +0000
Date: Fri, 16 May 2025 12:04:22 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Leonhard Hesse <leonhard.hesse@bshg.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] ARM: dts: imx6ulz-bsh-smm-m2: Enable hardware rng
Message-ID: <20250516040422.GB28759@nxa18884-linux>
References: <20250514070545.1868850-1-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514070545.1868850-1-dario.binacchi@amarulasolutions.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI1PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA4PR04MB7869:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c52d63c-40d8-4af9-b4f1-08dd942508fa
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|52116014|376014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NY4MMkGzKJLh5eyxqRuQpN2yV8j6vxGeSOrnGDTQpRtXGyjInIb6BA2N46cn?=
 =?us-ascii?Q?ZQNaS3SrzBLgSqb2FEwFWuz4iAgtujnUzgkB417XDoj1BHzlpvRyJUBLRhmj?=
 =?us-ascii?Q?J3zQQANjScr/FDBuN/iy+AkPoeDRDpDlFXxinECCk2Ns2FeZpEkxiox/BVPz?=
 =?us-ascii?Q?62ep0wwMZhw5oINPVVrbaLbZEZRL4bUUeBF/Y4l/fgrTiyyLe+fT+paXtfHw?=
 =?us-ascii?Q?XPwHsum7hN6iv4SCMZKpGraKgSw4jiJXnD3qZoxdTCtpZ5cXQ66x8ufCxB13?=
 =?us-ascii?Q?M4r5CnN7sDz/wPq1mxa+dK1GhLstzEVwGhWsAKxM+QUTo4xptGnx4KgkTOnS?=
 =?us-ascii?Q?HhWfezBl8SD+crWipeLvmOUF28o3lc0wEBZ3amCS/noYDo9tNQsoSQ7u5WbN?=
 =?us-ascii?Q?sojg0/u2XHuKefraqplxIBu/SPlrN9rHu/vZgTqlsKTBbqQhZsL0oLkkLqqJ?=
 =?us-ascii?Q?g2T3e8v2kYAXOAoTaY79+4pzXhXxHJVezUWVlC1h05gVUvfpeaglywyXiuv+?=
 =?us-ascii?Q?yjbgpiV/kCF4WuZqIrFjfgLDZtWHrrHbCxe/URzPBGoNTVJf5VYU0WmTSPzs?=
 =?us-ascii?Q?hgXrP/W069d/BQLAfVHrUSvGYgjPTAP7r0RMKv7Cnf5op366UH8+PTno9TOj?=
 =?us-ascii?Q?3wF17AQZWWSQQb25yXAHgKtfS7d/Zjc2cjwNtaKQ2K/dvgqkknqwFSKSlgkn?=
 =?us-ascii?Q?YCOdIFBfOhDUQBWhdmaFbufAYW9zvjvflqdC8z2/GNED+ymMVesZ6eKpF+bT?=
 =?us-ascii?Q?s8VQH4M0MbAPUoRvVYdE3W2kTzCQQrJrug9uTgK6lwdpBfp+k4wh1XMW0AF7?=
 =?us-ascii?Q?WB+rJ9jj/F/2hGOC9/iLn58ETtfaB2plR669OxNhwLAW81xKlr3ENY9iVzm1?=
 =?us-ascii?Q?ANUu9YrjZPd8C+Hzxrc7yiaLuP0USnXYPsIFZ4dceBHZANsPcCtelxrHEcx8?=
 =?us-ascii?Q?W8ZZBpRYrcw7gh+dkRee0Gx+QOIppSMOKZA6XNX5XDLMavn51+V2bUj1/kWd?=
 =?us-ascii?Q?eTNwtowIla0rRgFHu4X8esF6lyc7ojVAsXUbJkTVM9G2Y3nLMJtSa1zkPwso?=
 =?us-ascii?Q?C7rrFEwAs2HnloarOU1J+y9Js3YYibklyD6hXuso/7oHyRkUK9nfHiev3CUr?=
 =?us-ascii?Q?y+WGfMMviXcQB6xfDL6BjeO++rm9ODO8G1MBbEP9LnQYgD+XE2WIeoOzPULr?=
 =?us-ascii?Q?fvjs52LoEIgULPLgIXDIeQAqCGkdtdlihjdA1MIeMawnsZZvzN5QkGHKwP+T?=
 =?us-ascii?Q?5UwMAAgu34ee89QbkypWuKn2dwlAuCS+SIzVSWKDv0K7xuN2a3Chw6L8Tl6a?=
 =?us-ascii?Q?d3G9eRo09Grr1RCdqlIM0eLMq0d9XYyNdPm/xGfBPFQ/C0NeAzmcWW9YfjvN?=
 =?us-ascii?Q?ItZTEQMYO3SD6P9mKsffv/BumjNgwH+kcAMK6f+iRPV+mwmrhKw8bkzCjbWR?=
 =?us-ascii?Q?z7tXAdHy+nHia+r/vFApPEHY2DPUeeAooHmi9Uh0k9drhbsv/bBPMw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(52116014)(376014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R3nXxFjY2i/7aNYauAap5Tkj+ZLNTbv1XkWvq1zwU8tBT1d4cqx3sliwuYDR?=
 =?us-ascii?Q?/XzcSDXTyfkJ7E5Rg1AUw2CLdqW+oHNDO6SA+fPyz8mu90cwvz1QpKNCvyDB?=
 =?us-ascii?Q?AAK/iCoXB16hQUney+d3xBigaAkw5qH78Rp3pB1clk4pKfAU8qlu/Kuzpi/v?=
 =?us-ascii?Q?r2gbotAsf/XN99TJujpz5wAr57JnTF3MHjKcL8fOU7denbBINlH9T1/Q9vIU?=
 =?us-ascii?Q?dw1f7xyOAFJ8eURdENSDOB6u6k5uMRCUbGdlzNRr/yHqTyfe/aj9g88IRb6E?=
 =?us-ascii?Q?reU/8NB0wGa4YZxPlzVKFfeSeR0OnVp1EoX3b4Bmn/eet6cyoBr5GaosLVC5?=
 =?us-ascii?Q?rrsikaMK/U4ReGxM/cH2lq55VaS8wqiJVe4x2ANh0xVWIR0PhHMAg9vR1Er7?=
 =?us-ascii?Q?ZLorktWla0htlKNPskhPfD4vwiMFbhhZiLJtHjSVYkhu0wywUFgKGhWO6u0t?=
 =?us-ascii?Q?h6oKHiIp0uzucgdmPO1FN3mSfGkc7ZPEXu2bLjONg28QnI0ioHczLObw0lK8?=
 =?us-ascii?Q?urZy74oqM4uMTmNnKH9DvoAs5Tf1NyWXDUgiAnezCHFPziljcxjOIZql7InQ?=
 =?us-ascii?Q?209wY2U79QG0gw4pL/C4CWnHCYIajdRkmt85KsgM+NkjTBs9u65dH9zBI3bi?=
 =?us-ascii?Q?7IRZmlDqB/ABwWTF4+OYMT74DiY/ZGwOwf5QLd6qiSEX7OD7Kt+3vxBF9LGn?=
 =?us-ascii?Q?uA//9h4s6K4A/CjTqNc9V8Kz2GlPVvf22Segqmph6VtKSNjsyshowh2FUtP2?=
 =?us-ascii?Q?6iR6CbMErP/SfZc/d2iUMg92LW4DmgsNa4KSeX6pFp2DVcbKsmg5u0pE4rUp?=
 =?us-ascii?Q?rablmSMra2Vkr1kaXRkmgtpVBhJPgifBrB7HhDUcMQCMXz4EgB5l3ud/Tja7?=
 =?us-ascii?Q?qV1aknkiz01sxl2N9j9xj7NZAxXKXHSbcma2RYDHH4KPkI8svDfNjJVmDPR1?=
 =?us-ascii?Q?Lh8y+yOWArGOSV1I5HBsPhbv5GyOgJPSuhR/CpHXGpN6PW+ZDiNL1LiK9uMg?=
 =?us-ascii?Q?QAR/q/Pr3lRprBBlno7z/p2+roY988aSDfUDui1LP9S8D8y95+eOWqbxbJiU?=
 =?us-ascii?Q?D2SnyiYeTCv2D2PkVjHl0M2lVjTUzXwDmXuIUVUstfLDv462iO2KfYxVNMpT?=
 =?us-ascii?Q?oApB9bT+0jhigJyZLPmDRSuNda0NxbJ7pHrD5hvn3fKTC+583Wj4lD1gg25f?=
 =?us-ascii?Q?e9xwR+crKNCfVSv11GnPVImGqSC09dfAAZsX1Fkm3eVax2NHRypYZwdkWIfx?=
 =?us-ascii?Q?PsFqXuSU881DGq3SpB9oYM+XMwTzKOt8DPNjpNXL7kdDlzcnVVz8U2bKWlqw?=
 =?us-ascii?Q?UoZ1sl30N3rMIcFV9EwkgNKt/N+A4TXEbO0YycZa+aGNcj+5gZp9V3lwtgx7?=
 =?us-ascii?Q?xhqKFJ9QkHkMbg+uLiyAbO4SRD88yF41Y4HYTJjmSLgQBkprK4cvyVjAcPAy?=
 =?us-ascii?Q?PkC1KbEg58e1c7k5lGDsDokfs1O+ZVpV/I6r3hyIIW/gH+l5gNBkOmBIkpHx?=
 =?us-ascii?Q?2Fv2l5b5AdS7Dr1TQtSl5cKAIY+47oXPV4sj6UtN+8wZNpiKq7Pnz+1ybaXM?=
 =?us-ascii?Q?4GkvvTItoVpiLDBWHVN+wywYop9u2TewowWueCvi?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c52d63c-40d8-4af9-b4f1-08dd942508fa
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 02:54:54.3719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gem0hgU7vU0RbI7Z1Jukcs0cUgOy0WwavMS6Vdjv9cPSmvv/1wyfi+M8RSzqPw7ftZcreJVV/x6HBh0z57MZvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7869
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_195613_668453_162913FD 
X-CRM114-Status: GOOD (  10.76  )
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

On Wed, May 14, 2025 at 09:05:33AM +0200, Dario Binacchi wrote:
>From: Leonhard Hesse <leonhard.hesse@bshg.com>
>
>Hardware random number generator is now used for cryptography.
>
>Signed-off-by: Leonhard Hesse <leonhard.hesse@bshg.com>
>Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>---
>
> arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts | 4 ++++
> 1 file changed, 4 insertions(+)
>
>diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
>index 6159ed70d966..5c32d1e3675c 100644
>--- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
>+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
>@@ -29,6 +29,10 @@ &gpmi {
> 	status = "okay";
> };
> 
>+&rngb {
>+	status = "okay";
>+};

In arch/arm/boot/dts/nxp/imx/imx6ull.dtsi, this node is default okay,
is there a need to set status okay here?

Regards,
Peng

>+
> &snvs_poweroff {
> 	status = "okay";
> };
>-- 
>2.43.0
>
>base-commit: e9565e23cd89d4d5cd4388f8742130be1d6f182d
>branch: bsh-202505-imx6ulz_smm_m2

