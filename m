Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C439103E305
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 15:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l3TjDzmRVgxDekiJ2pVLnBAuefBGor0nRo59TdX7chQ=; b=l+2/lOwpv7rNpRJVIrE3xQdj5+
	BXGy+vi+2ykoA1aCBR0mBihY+iuiap24qxyN/HoA+LtzhCCXw6ssKEWG0gyw4dysHVXNYplMORlbp
	yl4fyuREdygbnVMEoMU0FqD8cDo3NFVY+Of9GHaF6/Aw7z5676OaVyKQVHoANh2D/PFT3zedzoyjF
	SakHFu6E9VcF6HebITvqeVUb0xG1Du6zFK6q+DERMCVFKSDO2kLMafjH5Ig+9mQlvNJ0eO1U+u5m+
	rI7Tm00/nXAClLgQNP21sfmlMPdQf53Ma9SG2eAi3j3JoaV0FsWnML+H/gmvKD/4e0Q+m+NVKkFYq
	u365FqRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14pp-00000000aY9-2883;
	Fri, 13 Mar 2026 15:53:57 +0000
Received: from mail-westeuropeazon11011009.outbound.protection.outlook.com ([52.101.70.9] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14pn-00000000aWX-3CsU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 15:53:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GIkj7TppWZKRWSMxwocUFX/Oms84Vnp2XggNmMNlb466xFrlJUL1Bcv0T6zpcBSilfLXkhdQ+IsbMd2ihGF++QGAQa3sRCb1TsUcRmEYaEiqP6oXSjJS4Vmd98cZkC8y5EQvdqImSABvaldVavmwsZLiu7XndOP+YLypjbyk4hgCrM7m5YT+rEy9FlgS0wp9eqjjCfvITJ51+eWBQA0Fhobmc1xpOEt4fzCPENEfPLm7ZK9ZrInbaKMVwGVWuiJO1YAd2tJZznFp2mV1GCzRoueW2KQj2xpk7rM++jUR1bqKBJOfx24USny56XfrBk+PUJGcVjjaa9Mt1OJRsSuD0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l3TjDzmRVgxDekiJ2pVLnBAuefBGor0nRo59TdX7chQ=;
 b=A4Y3eJJnoqoFduUEQ8UUbBqHfiZwhsdgdt041DcpgN4HDPZGiNRIr1e2xaXGc70wno987ZjfUHjj/LixRmH/oomhvLDKNd0oYIqrc8hB26gyNiq/eIzS0cAp+3Ey4KLZrSgPYpSFByItewRjs0s+pHomcYAQ+saWgkrD7zT80Rueesx+YZhxEeSF3j6Lkz+UY0oggTIVcwcyvo3uGtHBFxHu1xeslhOWE4GxqQ8X+FXFI77SEngqbx5FPWGQCrHjz5BvAhXgmvbnzG5WlMXMDu7BJIfkbA3RNPu7OPmIfYhn/rLadA85h3aVvdfO1eiuV5C8BbriGJg1dGWhWSO04w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3TjDzmRVgxDekiJ2pVLnBAuefBGor0nRo59TdX7chQ=;
 b=Ia8o6gRfXBgSZnFBuFV5zFiwFLPvBzksLBPHNcjuD3kyDTVFxU6jUU5NHjbY/txp6iwsm5wI8mBwPnTEHtnZaqeCSGKoVUFZpHYdDKNaKsZvrU4OG5tAHJccalIHo7YI4gNo3fO+keuvsh6Qd66nElrCjIC/Ioc74kqMwUZcWqM9kuJRhSvfB/cpRcO0AJEUFvKJiws+q941K7QKnWHJfTSbRw68t73vTbuUBUV0+m1VZ+pGSdLeSMO76tzgXNudMcMO8t4PEXId8ZGlo6XHS67ZIHOsaoEUGV/l3HBK1V1wLQQgk9o32J7qNGa6P9aWskt5emW3FFx0KV94eO+V9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVXPR04MB10898.eurprd04.prod.outlook.com (2603:10a6:150:214::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 15:53:35 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9700.010; Fri, 13 Mar 2026
 15:53:41 +0000
Date: Fri, 13 Mar 2026 11:53:36 -0400
From: Frank Li <Frank.li@nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 03/11] arm64: dts: freescale: imx8mm-var-som: Update
 FEC support with MaxLinear PHY
Message-ID: <abQzAM1cxsFJoTJ-@lizhi-Precision-Tower-5810>
References: <cover.1772898346.git.stefano.radaelli21@gmail.com>
 <24d31e0ca71c9b2dcb64d39117a8501d85cf945f.1772898346.git.stefano.radaelli21@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24d31e0ca71c9b2dcb64d39117a8501d85cf945f.1772898346.git.stefano.radaelli21@gmail.com>
X-ClientProxiedBy: PH7P223CA0008.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:338::6) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVXPR04MB10898:EE_
X-MS-Office365-Filtering-Correlation-Id: 490fa00f-4e7c-4e1a-f7e0-08de8118b2ac
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|19092799006|7416014|376014|366016|18002099003|22082099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: h28SY3UAQsEoTCVXJDP+WcXj5xJXUcVU4lY7oJC3PBzJMJc/9dLxCGSLfDSGSsAmKQm6X2TVQegqJv2ClKt6vEUhb285ext1LNeg/gWM/wj/eQ1GS10dCxGrhh53w8UHvYmpTSDwvtb1K3HjpMq54Q8QyIF65okJXgHcGgXtcVKo0Cqp7Uix6LW4z06aRFQpv+vMsgIad+eg4EtNmUsjViarSLe+UghIY3zTI0ZbCtjBN5gfj26dbNYnFPYnc7lW1xaTyR0hP2dLxEOHNHwrn0ZbZk2RX+pJnYNCbS2eMcvd+vLsl/LOza3nTePqMGXGXEo7NVhJv4T+Q1suO8bwFxVEPCcXrcnwaottqpdoAcce+PIyXkQQmT7lbsqg1MrGvfo6ZRoJ4eLe2MLdv5IefYSgCaROFPHAl5X1ZRvvXO4mYnU5NWGPiUIfbPkEsO5/fW5W5p04HH4VJQAAOxtnrdRdTrxWKy3K8jf3LM/hLpg3AnpTsPnSRZ0e8fACp2sMAeX8bL5bxXxZUlr2xRK2xT7auL6rapgiRTtUXKe8swH95yqaBik0ciaawDN75+/qYdPSvJ9pPDRYjofgmCnipZwArybhXMJgqpSMTSNbyD8W/6s8XCy3mnkutKMd3dpAto/yEPKZnobUKU0T+8V8bErQ4GtNynYo0tIJ/61LVRrsApTbhihWR1oyddiBqCNHQzy2R6GBsH1KohjCwO0LNYIWVtTjQlptXbIBx5HkbE8aXL74DL8CgWBPlB01PDqVNEmJ3n1hIqYDW/CLScYpGaZlX5L5/xZTkzmaTtVJNlA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(19092799006)(7416014)(376014)(366016)(18002099003)(22082099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nmwCVIf4CHPhcrb/HZoBs453hlL387lny/BR01NCs0VL+DPl0rEdI4sWQpr3?=
 =?us-ascii?Q?OjUA9Jbi7vljLyKKEj5X0x5N0W6ClCn0HNkH/xyXIgR0rKk9x/Ugdg3JHc4M?=
 =?us-ascii?Q?ZLZjai4JCuE709Opg1H+iYVMcv3sXvbi/GwxIkbH1NH2h4GTltbaYgpFT4mC?=
 =?us-ascii?Q?q7p3iy3Fmv9hOtp5eubTiWTYSp8AeKJS8uFgeG6/UETgHHzYUAhRpTqWhlB/?=
 =?us-ascii?Q?6LiolHs1q5w1wrOam501jJ0Bmr6nJARGO9g0qTdl/A1jpIU0T8NmnKt3rpiq?=
 =?us-ascii?Q?94856V0wLPFO10kYZ1OVJWYxCQecw2TiexcJS2GLKczpqfxi2ucb+im+voNX?=
 =?us-ascii?Q?gEo+wnBH5xdPC9yGmmTMq32lTXHsQ9kdE4kDBGVNe6xZkvnssu7Dv5atLsdA?=
 =?us-ascii?Q?nervIad2JWpHlGSXV181+fuB2z8xnGws34V8g12iwrHIoMm1WI0PNBNkCj1Y?=
 =?us-ascii?Q?b9ifTUGWANKuxcBqNRMVKQSGJNzVMAQGvT8a1msnT8HvU63THmMgvMLMlMCU?=
 =?us-ascii?Q?Cz7gNU8u3VAsKxPFlODj/9+JS9oWG9onBsuTgjlbriOuLsvY5340cn0NI8vd?=
 =?us-ascii?Q?xQeX4JpBU/sI0BUPeCC0kAnriZjigljo6wP+AcU8CQeUPel8gAbg5zX+3rQ0?=
 =?us-ascii?Q?qTXe2B2r1OExFlo553kyIOgso/vfAqmg1fRJ6Td0jL0V32lwduvOQQM+Qm5I?=
 =?us-ascii?Q?NwDUY1GheV9iOPnQ2kh8j9czIp2Q14jhPsS+Bl4XLkRnIMgfnOy7z7XfclxG?=
 =?us-ascii?Q?BIZcbSTCHzCTX9chDdtMK4mLutIhhNz2wx5QWeOG2FUKxdMaSZNKw4eIRJTp?=
 =?us-ascii?Q?cB6LryZfHB34+g1YyAqFEjY8SX/GXhIVS1JzBzPu+YM+X9jfSI1xTO3M973C?=
 =?us-ascii?Q?eLWG/Bwx4KA53ym5UEqsWFU25GyABHi1VKhfYXnrDQuyzDGgFk/44EZK9pA6?=
 =?us-ascii?Q?6n9VjQ25Uy0W5TPDDr7iYbbHuY9Ry1h2aobN5MVe1HIzjeC1E9TSedM2TrU8?=
 =?us-ascii?Q?v63mFB1kwJJrjIzXhrme5roiAzridT6jjvmBLlvaaVTHrEuVI6ZUlRwIxf5Y?=
 =?us-ascii?Q?hgD+42cHozOq00K1kdvOfRZXFLG9oHAeZNYxJD5WYLpLIL8B2gEOP25Sorlr?=
 =?us-ascii?Q?OX2J1RzpYKyHyGPOSDTZSEA1HrKnCI7VLApxNLeBecJPG7jyMkPySRuCIjsp?=
 =?us-ascii?Q?OlZq1UYwPjXvrrzeME8g7/VnFiNMA55+nl3xPGkpPlAA9PsQT36qu6kV9Ft0?=
 =?us-ascii?Q?uC6z0uV0cYpZavgz0Oqu9oAJJrTbaPvIT+7NfU34XHSAP7geu+GLPDVsWN77?=
 =?us-ascii?Q?QUgDK3gawIuu1SHThXuhaHX/zhkrWCPNN4hnj44ayWKMrFU/By6aeJzL3wGb?=
 =?us-ascii?Q?TrvPVwByTGPJgPGJsAwIczpvvfz8nFSbZlGSsc7HKqR3eJbLPSfynwOKeffE?=
 =?us-ascii?Q?/Y1RXeyiyaUm/+p8+JDCUsVLwbxxermi0/Moutwr5zpQuHYpI3SswmNJ+YfW?=
 =?us-ascii?Q?ing/cQaRfDRdDLW02zBsUhIFtEEE2YjqH/lDcDSpNALFsTN2xxPMCPMVL2zd?=
 =?us-ascii?Q?1fzlYLoEEiuNSSrxQHpoFYfGvOj8VviWBNhxGKhui/zr8EN4Qu5XwaFadvcE?=
 =?us-ascii?Q?vmGl9iyLxJ/fbcV1bbT+kMKuI9rFEMY4krG2DvXd//YqOqEcPgGS/SLYF5rf?=
 =?us-ascii?Q?kmjpdjLzTOlByhiXwJ4WNCEmq6tLujAkxpLRjL5VegGH6085uBMJnrc3O8Gi?=
 =?us-ascii?Q?LqnfkljuPg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 490fa00f-4e7c-4e1a-f7e0-08de8118b2ac
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 15:53:41.2494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vwWSPW3ZfNBlXYONTMIUivzS5Y+BkSFJa1wS9Nd/DLj/7Xpr4B0oDyViKeB1rIvz/eMZf5sTHk3ePnSRW2BRfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10898
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_085355_802173_D2AE0E61 
X-CRM114-Status: GOOD (  16.56  )
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

On Sat, Mar 07, 2026 at 04:54:39PM +0100, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
>
> From: Stefano Radaelli <stefano.r@variscite.com>
>
> Update the FEC Ethernet controller on the i.MX8MM VAR-SOM to match the
> latest SOM hardware revision using the integrated MaxLinear MXL86110 PHY.
>
> Add the PHY VDDIO supply regulator, adjust reset timings and add a
> pinctrl sleep state for low-power operation.
>
> The PHY LED signals originate on the SOM, but the actual LEDs are part
> of the carrier implementation (RJ45 connector). Move the LED
> configuration to the Symphony carrier device tree, matching the
> evaluation board LED wiring.
>
> The enet_rst GPIO hog on the carrier is kept to ensure a defined
> board-level reset line state during boot.
>
> Wake-on-LAN via magic packet is not supported at the VAR-SOM level and
> is therefore not enabled in the SOM device tree nor in the official
> evaluation carrier board configuration (symphony).
> Designs requiring WoL support may enable it in their own carrier-specific
> device trees if properly integrated at the hardware level.
>
>
> +		enet-rst-hog {
> +			gpio-hog;
> +			gpios = <5 GPIO_ACTIVE_HIGH>;
> +			output-low;
> +			line-name = "enet_rst";
> +		};
> +

Any enet referent to this gpio node, otherwise can't guarantee device
probe order, maybe enet driver probe before gpio. rst is critcial signal.

Frank
>

