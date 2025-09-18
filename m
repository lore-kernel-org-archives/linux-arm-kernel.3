Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464D1CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 12:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MnrqdS/CyESwa7wrTBA/CnKmDfqr+zNYzf8WC8JEeH0=; b=u0yM9H5YTKLuzMf1J+YdRWzHuj
	INo/MxDk/SBs6z1EbCPaTFUHfSVGD2EbEabAi3AKkVmC9Io8hPr5cWA9BgY5RzaRj0w89jmJ4PKGs
	Zek7vfl/xvmOk0zIWB2hraokaS0JBzhjW8xJTfqfCe7akxzJOhNidT+Ta9VglylBFVUcwtnEXXGFp
	zcUOfWxUIVI2zeigOp6MczEDTiwtPrgkeHVZwVGntZlwEjvG3GznBZ/+DT2UYm5Cr/+PuQLM/ypHY
	+g147hbvR2iiAb1GnVUKKil/gwstiHvbO+2HEpOtcPa4Q7Rug3L92GEPnPC3EwJxdyPfjIuw2KYIw
	nQi2fzXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzDfn-0000000HOAY-3aRq;
	Thu, 18 Sep 2025 12:23:39 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzDfk-0000000HO6v-1MY3;
	Thu, 18 Sep 2025 12:23:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EpIsWoEBahspgC/0oP2Wa4EMjvgxd+xDUJ74DS4hjcd5WYjKM7u7rdB3AZTrr2dcUuI9UHxYrRmtG6lrzTW7u0bs2JGVBDXwKkD/afg2MP49qTXrZLUI24u67Q0I8pU5LRgb3PkfNzmVcFB00m006gc7BGQgUHb6xi+TM2HRvdqV/nUGXN1ZQRXcTrXYnHRZ8NR7JBKwbD4yx+GFvLakQ3vWz22G9NlTtWwqUYCuQ92BuhodHXazVBQJJfLDruufXJgt+QkF08k1iPsB0iAgA6duMihmLWY8mDaU82Q6BoGZLbZF34XUvU5wnSdB4ZmAwBGEqiAHGziInd3A2xSaUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MnrqdS/CyESwa7wrTBA/CnKmDfqr+zNYzf8WC8JEeH0=;
 b=H41El8ee7seNT7msdhOb6n+Qx/3xS5pDAnT9Ofw1bFjPc4oKZnParQg83bF1WDsdIkFfNAvMdRmVNm/j/g9vJUo1CdyTHozfwZBjIQDaTyBy2kg9fPSw8g/X2xuzfhnjMsUlg7PWSaBEhLlQn7wyFZQDRGPrtdXBY+us1T+XJehvU12uQmCh6RIA/gs488aoy0+9eDCCF7sN5t/PFzwfI+frT1O46MMgFinbKFv/dvIUgKNL80Iq2LZ3ujEfHgRAM1Qjyxh/ZPly7Z/J0lVNnrr/1/CV5PBom4QJlNQspCohXXuZLvcfVXmOSznyoRMdgN+T+shxQNfinm3Kq3i0LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MnrqdS/CyESwa7wrTBA/CnKmDfqr+zNYzf8WC8JEeH0=;
 b=qvIv67jUNwOvWAmFXfASiiZjDpbad7CqCxsWFg7Th95JqlAYS9hwuXC1Lz3kE8HcJaDCvpfS29xEy8eSoHmwdC5rCaF819iVZe0IL3HcRyTuIsm2ociVQ36xdoE9D3Dvk18A81w9xJ/DqQVoH53tuv77EKLRuVRJelA6lDWSilSWdPDuPMNRXulFp5f3gKFFyweW+OqCfnUM6eVfC07n/tbQ6bjMBPkH2uOK/xbv7Iltma2r5jebUGSfqoZ6mJZiPSsuGOGsNbNz8jzHnXTqHW/eHKFPZGmQXDCYkTMKbvtACV+lhbsqGjSF0cJMBlelrjM0FXye8OFk6YfMM1PX8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB9074.eurprd04.prod.outlook.com (2603:10a6:102:227::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 12:23:32 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 12:23:32 +0000
Date: Thu, 18 Sep 2025 21:35:08 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aswath Govindraju <a-govindraju@ti.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	Haibo Chen <haibo.chen@nxp.com>, linux-can@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 0/9] phy: phy-can-transceiver: Support TJA1048/TJA1051
Message-ID: <20250918133508.GE9196@nxa18884-linux.ap.freescale.net>
References: <20250909-can-v6-0-1cc30715224c@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909-can-v6-0-1cc30715224c@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR01CA0119.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::23) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB9074:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dda8c96-9b7b-4cd5-20c1-08ddf6ae2e9f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|19092799006|52116014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+ByjoAT/oyPEfIujLMWrorIRgR5Pc6C0sgyt0F+RaBDIuoT/h+XvqOol5DLr?=
 =?us-ascii?Q?0deeyztLm4sB7gtgBgAVMyNIzD3x43kbiH66gwVNwdZyWUtZq2sSR8o9c1vj?=
 =?us-ascii?Q?GvPUb6ZzvQv92NBlvP+3dwxhqBsQyUdjBbFNu08peIRppDjLlI9IY95amxd2?=
 =?us-ascii?Q?+bWkcVWgzheuj7rPAFZD++7rLIVeI1u+hjTi0c+OvWM6gLvPWw36xq39aZ8L?=
 =?us-ascii?Q?TE5rIrpDj9i36kDb4Ud97TFhv7zqgFlMCLmG/61AlM3HOa6PsefNz2CMs7Ks?=
 =?us-ascii?Q?alpLK5O1RRu8HsGXPn8zyOK0Q/mLzHi+hJAGXBTg7dXIg+BMwumr4s7MCwwS?=
 =?us-ascii?Q?RBh6CkLGUBc3rbz5w5nQ5DiIJLvFiRwpB8n5yDXf4aI1QwKv5hBUEfehRuS+?=
 =?us-ascii?Q?ogW9MC0ps8X7yjlUOmFlKZIWOe/4PAxv0nKI/NLQlCyHqcbeZznU59k+pFGG?=
 =?us-ascii?Q?Ny3PV7MChrDTQTTiVCozz+i7eWiUUdAzfMrr3h2C2sDifKRzr0OqlFhw5oXm?=
 =?us-ascii?Q?ab9ReugWnAQKBsPoAfgyZFPYLTrgzf85nT1nqbWiIm4fyPDqzr82dvrFQDKK?=
 =?us-ascii?Q?icGNRVTEVvApWwr7ziozhoW8KTaoLer43TJfatjClr/G3a9iXdaGyxjPrgkl?=
 =?us-ascii?Q?gRnm0r67Poufu5m7ZT1zThAShHSEGN3I3hj25vdhEP7sY8lhb2+uqh4E9JYK?=
 =?us-ascii?Q?mNOOAEFXkdwRqPx2NXb1eQx4NzM0Bd5uGVpFEzGaq0UgaadkDtWwGrpO7giJ?=
 =?us-ascii?Q?UaTle0qezUxEU3Ymw0Mrb8F0Y1pMhlO3208WVD01i9zYmby9If0RuQrivc1v?=
 =?us-ascii?Q?bpCzwvh1EOICpC9J0v5CgyPDDivmv2YSSYHw9+QjScN8vqN2iVfizAleaic4?=
 =?us-ascii?Q?vj8NlveAJJvI+BmmU89XXDp6h+9C5X5jALcVo5GV1ja2uaq0JnO6PykHsGFY?=
 =?us-ascii?Q?WSn8173RxSMLo1Q08qwpkbbasKXeQRIl5T1Am+0YXrOeEP3JtU1Gk29qAulz?=
 =?us-ascii?Q?pI++MUywNlW+XhIT/tlqu0QuJqvOJRoZnoX/GYyoT+ZtKMvCqqKUq6TQLDHh?=
 =?us-ascii?Q?qUiYno96o2ZEwSAL1OGSnKT2T/ufBwYqhpmlbtR3AD4x0vo7oeV8wulGXlv+?=
 =?us-ascii?Q?7TWGDYWbTeBFL/vkds9zzQ7oIKRB7sOB5DNsxvFuXcRWp5XZApBs65vksWXD?=
 =?us-ascii?Q?gB5+oomfcU4nNI/k+T0zfjkXkfxPZGT3CJbREQjLWEu5xP6ADKgyN++c1sf3?=
 =?us-ascii?Q?OPlFX6E0LBveY5sBLA6LNxs4BEQP7luhisKSwsi+9c0LrqjlFOzqAXfELMf/?=
 =?us-ascii?Q?vDrnC75ovWHUq10lkNcGMXmsNnzhM1+vdy323OzFhlSGkMBieadZ9dx9q1sS?=
 =?us-ascii?Q?vN9HtYpQjOl8NlMLI3fbD5YaXlnBatggCcr7k3OLs6neXogfk9HNyH9ajYv3?=
 =?us-ascii?Q?IDnfw9vkK3K9QtOnKnGiauiP93ZpSRPmOppw9vGd1rowRuzpa5t20g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(52116014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a1TIbSSJjd7Q+1dWBLWLWMGJVFCKq2pb5iSlbSgoAtL4mkQ8euUDkKpnKSJm?=
 =?us-ascii?Q?Z+NFdcfbYeY9NvunYD07iTdo5HSt5tXC33ftNl+elg+TkDR7nqDXfRinzx6j?=
 =?us-ascii?Q?yfJ0AG7cSUaYflC9SDpcMjXmlknK1jJiDcAmqDgcDwVbNG+ARrLSJhziibb1?=
 =?us-ascii?Q?Z3hFqPua1wKDZTX7G3iXtEg+rI9iio3uzU1nLwft898/ejjy12mWRTpAVtPO?=
 =?us-ascii?Q?s3Yz3a/71vgqMZ7WJLyBSziajPs3LFsMR8JA9s9O0WOuMxf8POtSkHey5LQQ?=
 =?us-ascii?Q?vmdTKnx06tt4fIbzwQSb9TSGRR1VP2IgpfiY5b4CV8iCPMpJbdQ+ad5KTkXb?=
 =?us-ascii?Q?/H7teLbkmYPYkj0rovYoF68kBQ7vOigbNOAK9lxquK4aO4vAvEiNk7JTYlSU?=
 =?us-ascii?Q?lNErbgrZ2dtCd0ROzLB2It+AhZ6DJjS8674moGQ2yVD/uVcluYEgsqlRxSvx?=
 =?us-ascii?Q?jUvE14hP5D2oSzuxPasfUBOAggMAMyUWTMYanujpr0ckE4eNfmy5aZwrVPbE?=
 =?us-ascii?Q?/Fh+m76x9irg64AZ43M8u3sGMzsKEnqeBdcwi9TI4Kwplgwo6bMD09Qg/NBG?=
 =?us-ascii?Q?3IL6ojJ5GYJ8Ys3IAqbrGx3uCehEF334jkkos9dz6r7AXKheGl4P/mxtT+aH?=
 =?us-ascii?Q?yrgApdSQJk4LmoSA0oeB2BFHDZTNdgrL2r3AQR11XSSOR7V8fNCBCiiDShgY?=
 =?us-ascii?Q?9/EXMqEW0sv78x7WgGtlxMcmBH56en0M2lJM6THS90cJDSnPd4bw5VdrAgNv?=
 =?us-ascii?Q?3TmAzLHegG1l+YanC6ZGo7gvw0WEDrhbnK8PF2xmk5GBxYaFqAwq1WdBrAov?=
 =?us-ascii?Q?3Hl8lKMwnC7K9eJn0mb+13ncJVetAwFbdIWX41AkUQuP594/zGonYxH5CGWA?=
 =?us-ascii?Q?C6RCLtLCB+nwKlslHA2XR2S0ECh9MVFrwLl+GDID8CSA6VkqOimydnq1H1ha?=
 =?us-ascii?Q?mAFVGj4CCX8+Zt2yRT3jCgIMK9UqsRYym0qjbH8kSglDk/04fqWuErc16870?=
 =?us-ascii?Q?1yryFWJjByndzgJeyKYcOH/zBT2htdYg4xdzBhENgJvBJFsBZ7S/GahiCvNg?=
 =?us-ascii?Q?7VBW3YQYjBtgrEHw92HZgQ7qfYqxPd1M4CwiBFqdV4558IMYsKT8qvQ/c4rv?=
 =?us-ascii?Q?T8ki8AfAlvuv+y8xbFU5bPatz/cwc/sWEsvtI9OUuGbh6gb42dpse1pDiUo6?=
 =?us-ascii?Q?9+lW3BBcdWySmSQPkGuWF4twkE7Z7oBNhkAeShloD0+nEnaOEUtCCMf7o+RT?=
 =?us-ascii?Q?8ISZ2SIFFdBj2PdlRg2q9xn5Us3rZyFMJ7nawOdWKSqaSHkihvZ/ptSF2faH?=
 =?us-ascii?Q?djfrTzFJNdcX3mlciREn+WFdtX9UnUs1JJsdhu+G3+hrkBhX/ceWy8DzvVtJ?=
 =?us-ascii?Q?M6+NZSzSS6K0+GR9kiY49wtM9W60HaS7mr7lxkQ5aRNcXlfS6RlDZfRhQd1J?=
 =?us-ascii?Q?Ql5eV6UGEPP+iADxZ84lRg4B4X0SQB+uGOIA1yOs7y+AJCj7PJNry+14Ubg/?=
 =?us-ascii?Q?8aGw7mGuReeBJJS5MqVL8dxmXBTFCRTENiY2YBa9eG50/EiZWVO+iv9sFaXR?=
 =?us-ascii?Q?u1oEwryKvyJ6lcGWGT8rtmJ02Ifd9DIUKCZZlQU/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dda8c96-9b7b-4cd5-20c1-08ddf6ae2e9f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 12:23:32.5836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RpRysq5aeRrZ6JWs8IYggj7VIVav3ytGhXzGw8O1IHjxelWVPQMV8q1c5r3+9F2dcAxbqT62kCsdLlcPbJOeKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_052336_367519_03E2080E 
X-CRM114-Status: UNSURE (   9.14  )
X-CRM114-Notice: Please train this message.
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

Hi Marc, Vinod and all

>      dt-bindings: phy: ti,tcan104x-can: Document NXP TJA105X/1048
>      phy: phy-can-transceiver: Introduce can_transceiver_priv
>      phy: phy-can-transceiver: Add dual channel support for TJA1048
>      phy: phy-can-transceiver: Drop the gpio desc check
>      phy: phy-can-transceiver: Propagate return value of gpiod_set_value_cansleep
>      phy: phy-can-transceiver: Add support for TJA105{1,7}

Any comments in the driver Patch [1-5]?

Thanks,
Peng

>      arm64: dts: imx95-15x15-evk: Use phys to replace xceiver-supply
>      arm64: dts: imx8mp-evk: Use phys to replace xceiver-supply
>      arm64: dts: imx93-11x11-evk: Use phys to replace xceiver-supply
>
> .../devicetree/bindings/phy/ti,tcan104x-can.yaml   |  69 +++++++-
> arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |  43 ++---
> arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts  |  17 +-
> arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts  |  13 +-
> drivers/phy/phy-can-transceiver.c                  | 180 ++++++++++++++++-----
> 5 files changed, 229 insertions(+), 93 deletions(-)
>---
>base-commit: da57e528a86120a1187edf3e2c9affb4083d342d
>change-id: 20250821-can-c832cb4f0323
>
>Best regards,
>-- 
>Peng Fan <peng.fan@nxp.com>
>

