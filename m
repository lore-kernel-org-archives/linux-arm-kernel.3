Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85250D11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 11:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f8CGj7++wez2iofYHE+8rYGNnR1riTj/PlPCTcwlGd4=; b=j4/fdiP2niUZ+U+0DY83ARBBh1
	yBaD6PWVmQrxvdeTP+D+bdzVJqOhCwsfFuBzTICP3rc5gq6eXcw/Dh4Vczoc10CO/t4D1L/PdpH0K
	AzCbw53DMpuKE3yTe4tLApZtosnDHHW5/tv6x4e2pTQTNPLIUtaG9/tAdRMGx9oqVchV7jdbjFNJl
	rJbIsvv+rTM5hG9PUyxmLW1MPfStgD8FRmntgBd65rhnNMzTLedEJ2H/do0vNl+qhxoQf0Qotqsc6
	8mh4/KjhUQA10La+2oxcYP5Jp6kdxpvFcXIcgKlApbftJs0VViujOOMsG23aenj76+lafwKlTO2w+
	N5RX+XEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOa6S-0000000GSA1-2AKJ;
	Thu, 27 Nov 2025 11:24:00 +0000
Received: from mail-northeuropeazon11010016.outbound.protection.outlook.com ([52.101.84.16] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOa6Q-0000000GS9L-0DlX;
	Thu, 27 Nov 2025 11:23:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S3MYIEVtoZo497DyQn02VJatR4jSqg/tDYedVrwJqIU9rdMQX9UpGWu9ad+33ttMSTvIeYXjap4lNDHApqtdesZ1uRqVBgNWK8GJwn18s/1dpUihiCFNIU5Wtq7WU8Onl9FwlBGEraJwBq7/1gJGes7n7ZwNdXBqdN5RMqNWLsYFKr9szsKHetxKS6wu+WZUWpopt2IWjO0X58ra6cUkMKeixS1egRt7QhXsGYeOLBXpIXNDrRLV0X6U3WbdzxbXVXW1tVplVQROXAPfdZ4hv9MscOvdibefxnJ8MmTMTHoY2g0zf14Q7tOwXsHZBRHEf3Rp1mHbE4K60RO9XkSvdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f8CGj7++wez2iofYHE+8rYGNnR1riTj/PlPCTcwlGd4=;
 b=m/wjFYXhl/xtxYel1GKy9YbOB3AIBod1/Sq2rUCawEDz9BWnPaxnSHCUDsI7O0rW0n87x54XiK/ffmJiDCd6NX5rUmcqrKAUifSSjJWds62F9kb3flOCBQ5IELcdqeMFiRjmCmO5pOQhpbOQvKmjRl+6LCs+a7xMMb/UsPyXSJF/wbAGlk2paB4BMihodmFsbwmxWf9EEFhzKkgDNWEqANrolZvXGctnAvTxfR0b8APP4Mtp8BaPYobUXcZpqMETK1e/IyJZXjAAl824/2z86984ToG86Y4Qf4H9DT6bAU2Ka7rwbBJC2yqw1i9KBqXuZT459vUIBSn5JBYl24umJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f8CGj7++wez2iofYHE+8rYGNnR1riTj/PlPCTcwlGd4=;
 b=X3TMH4BmzwEqlE39W7nh3z43TSSN9HZhZ83Hy7GYXSCt7IPkoXB4OkSFoNerZTIyzo7M3/Cv5HIY5vlOUaQOV5/cR9NgvzN0EKh0kbCWuZVrY7GsarWuddkmJ88xNnCarE/7i0OPkqPU8pht2theqXdfmlt927y8OUJKkcmnCR9VHa2jirATUO+IJrrXW2T/FITX6mY5uMgrmaAfch10cxEtTcXDza+A3su8KmYOt1ChBuiPwcOl7OoD1y96+27vf1s07+mXl4SH8fBthKftOVCWCROw1nlX94nPn1enrcPYLVHqk2fCfhHsbf9fzQfxs/K7uM5fACmi8yVqs9IAqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by PAXPR04MB8237.eurprd04.prod.outlook.com (2603:10a6:102:1cc::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 11:23:51 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%7]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 11:23:51 +0000
Date: Thu, 27 Nov 2025 19:17:04 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Franz Schnyder <fra.schnyder@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Franz Schnyder <franz.schnyder@toradex.com>, 
	linux-phy@lists.infradead.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2] phy: fsl-imx8mq-usb: fix typec orientation switch
 when built as module
Message-ID: <g7r2rdhqswf2lph4r2qquxclaxr6aa3xd5mfzxhaq3anwaasdt@iepmswqob56g>
References: <20251126140136.1202241-1-fra.schnyder@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126140136.1202241-1-fra.schnyder@gmail.com>
X-ClientProxiedBy: SG2PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:4:54::24) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|PAXPR04MB8237:EE_
X-MS-Office365-Filtering-Correlation-Id: adc3f830-4251-49a7-1349-08de2da770fa
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?a/olcrkQK+e4PpTCUEp0Kc0P+MZZeWo62X/MUE1iZO6CLcmdwshgv3nt8jpk?=
 =?us-ascii?Q?ztar+lJ+9B+u/Bae6ouaFSn1h0QY/OOmkvglWPUCGUdKV76VJmB0K/7fin2N?=
 =?us-ascii?Q?ZPkIW9Vsepxj4Op8gJwf1Il37dH2/SNbp/iGhyTddeIovFetoUTHGCrswDmc?=
 =?us-ascii?Q?trM2E2VIVvQewl0FbsWO4Yq0R4pCfnvM8Ttv3kfplBw/+trQScrQg6QTH2pj?=
 =?us-ascii?Q?itM1N3KyPLp19jsn9VFpFPVFI5lZMOZ8afAStQT3sGMjWlBKtrAf+7r0I0vB?=
 =?us-ascii?Q?nnejPiYgT4X0CDfItwKSn8PjAr1RIC147TZNJIOpWnVa0iKtAqvisLjQOGDC?=
 =?us-ascii?Q?mJvrMwZZGuGLLTbxMVPEux0+CkflVygY4MTQ9jwILp8Rnkh4XcPddtEb2Lta?=
 =?us-ascii?Q?7/5ZOcBNjR5Y4TnkgVESXn4N0AmLx/ZzwxJ9abvJiMj+9/04HWH3udaXXJWI?=
 =?us-ascii?Q?nCfso9yrRlrLTl/KNg+fmp1xQ7kk9msrJpRCW6C60J+NoTaxdFAYssCBaBqC?=
 =?us-ascii?Q?2ngUCkT3u89GOvprotO1Gpcx11Ck9MusZud1m/W+NGyZIwfP+fOkvF9GjKkB?=
 =?us-ascii?Q?SZ5raVVF8wgjeh8u/2Q0jadyyy7QbvT8Q2SkHl2M8Z+rP2vbUA/qI2fijyRf?=
 =?us-ascii?Q?k/+CUF+1xgsqPFL/4aBktSQoECYdOv100K0p/N4uymg60MiKWW56JrOQ2JYG?=
 =?us-ascii?Q?JuW3i2zlGblVQ91TLaQSdzPxz8jHEAH6sEQTJmFLfZcMStlS1zKy/YwFPg/T?=
 =?us-ascii?Q?HksuouGnEPoqjY+XxwHOQ8pETkPyTKJD1DL0kqjybyUWllnUFkgUtzEgIx4G?=
 =?us-ascii?Q?xr0xlVEgn/ZX1+3XMyiBg7jV2YWS7kA0KxYYtdYQarR1/cCi7Lnu07/VaSaJ?=
 =?us-ascii?Q?vJ6971UtYF65D9HPaQyqgWlFkkEaOvxkARX9oRo5GkRtgcoHFalhLG8rSPkS?=
 =?us-ascii?Q?N7tU9hkden6Uvtm0+mjJ1IpjeTaNmsB+iymHbxV3Z+OSbR2HAsa+8UhsDdmq?=
 =?us-ascii?Q?MjI53FXOQspnBPPQPjjd2hZOiHnUoiVFsxOOYQePHemFMR0mD/hjFnvcMMQd?=
 =?us-ascii?Q?emfN/WGIube4lqxlor7AbZ98ov0+13Kf+jNsQXz8ZzJuYkSCeukSgpKOX/pF?=
 =?us-ascii?Q?2lMMhNAlOGAPtt7EZmKHXT+/N81bjmguyuGY1vWnpQn7nC8Yvv8+IhIdrNMh?=
 =?us-ascii?Q?SkYK7nZrr+04lJHYwNf6/fdykXUXXiKUWpexzPGk3zgHavRb8X6dJ/RJo9cf?=
 =?us-ascii?Q?Vzo/aqwY2RvpLo2ld2wdyMVJa6CIJDaUaVvmttiJPYbEcoRMz9r++hdKGEsH?=
 =?us-ascii?Q?3tDd1pYtMNvpHZea2pxaJHHV82EhC+q5Oy3oH0vPp0Rc9TBkBen/WMz9E86X?=
 =?us-ascii?Q?RmlJXCAgt/jHReka7pF755IBZNG8IZRQUv++IH9OZ8e7VTm0vXNWAI+7qn4v?=
 =?us-ascii?Q?6r14DpLREzrermGqiSZTQsxdc0+/cMvHaTagMj5o3rzq3QK4UCD3EkV6C81e?=
 =?us-ascii?Q?9ggX20aTrmww7EcQDlfsSpjCpne+5rsNmXIW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+pPAQi/1Ag1KVll5uWi5897UUFnUtIbdWXWTfNCwUQ1lyGh+M04z47gwpwj8?=
 =?us-ascii?Q?ylCT99sJu59kewKa9Q5Q/i5t341kWPohYEGjFADD8UXYFA3uj9xDVgjEgRbX?=
 =?us-ascii?Q?jqO8Nf0tClY04nlZBKWnJzau20t8XTGdRl+fsKOqhGTGtbpXCheHMDiCic0b?=
 =?us-ascii?Q?hlO/y0op/fx0j6SRyFsvCvk56E5VW94uBDauH+6KnplOEIKtBdtUlwWyTiTJ?=
 =?us-ascii?Q?/p/gWmvwj0xi/qQvMNOAWQZ0pkr+mISV/gQOIo/rds6mRV7KHnto4H8ujbju?=
 =?us-ascii?Q?TGXhHYbpK9uEGMKUyJvk7k1t7N9b4nmX5s6k9BvMSi+Kw1jFn9VJT8Tk04dw?=
 =?us-ascii?Q?GOrhdJN1kFZiPGFIietgsSZtS3Ppc/50bZtPGux2TTRLv0YXfSQtpKaucRmZ?=
 =?us-ascii?Q?eSnWZK6S6I8Lek6T3tQngL3a9291C+HEk6ZMShykCZBdK6dauPXNi89Uz58u?=
 =?us-ascii?Q?/A33khKW1hCd9BwPbGiJaH4gHSyP+NMZQe/IqVFM1rPpzooiKPdITSN9+lk8?=
 =?us-ascii?Q?TrA6xuxyIZox1VigsfdbH6X5t2Ia5akOguuqys3oM+c9JRYII29LkkZ+Q/MV?=
 =?us-ascii?Q?CHOSCKC1buk62PpSWdVMwzd5eJMYrfpX7JLFjSanLTls6o/bEFsAjuF40/PB?=
 =?us-ascii?Q?ebLqr9Oetv+875E3ltXG8DspXqzWlxUBse74YHJvrMtah9oy3Way/S6H0/cX?=
 =?us-ascii?Q?zQ8pQQdGi/vyiqjxj1AQ9owSi3t/69Sm8omSa0riPAuMQRaRitlC6K63HSWE?=
 =?us-ascii?Q?Ze7mzmmRIvIC5nKmKLaPheJzs1Mn5ALaqJ65mPj/w0EnbxsPEng51WVc9SW0?=
 =?us-ascii?Q?5s2hZRvMwXkX5QaI1KYqHa5Uu/WAPLtoKDB9q3n0JoJojDz28wukL3IXAenN?=
 =?us-ascii?Q?BmpQbl9/mgr/o9k+6y5wjnYXeWDVEZAH1hQAbLF9+wZeSYu8BF3zg2K98JzV?=
 =?us-ascii?Q?g+djmhrSku5f3g7gDMgliBtI10Bnyf7BMmAQ11vg7d0QqF/L1+KOQsAm0rNJ?=
 =?us-ascii?Q?Ux6Y6Lu57xDiacILjdDMI7L4jG0jdgw/EVFUz9TwAT69qAWZhr8AgIOcjOwy?=
 =?us-ascii?Q?wkRoQWuHsOZnMveNKfZ4YGC6qan81OQZXFoAT7ZAIOWkxHb5hioAiOBRCxhM?=
 =?us-ascii?Q?DzqhAydqp4ocT58NjNj/AM5Ws0R8F/ZHnBniu1lRmYHKI1k8u8+EQhMidJfN?=
 =?us-ascii?Q?Df9RHWmNJy/5y2hfkmVZj6BcrFJutEEhURxjD0NVBdvnSm8N22tpKXt3XzyT?=
 =?us-ascii?Q?HO7lVpJy4tMpL7coF1+ZJ84hUro6i/AAzS44rm9qZ1mAYFqVbcuaDR+FVIdc?=
 =?us-ascii?Q?FUR9If7wCBFIOy5hc3Jed2KUDwPmiol5g+KNTMM8nIcFs7Xz4lCOAOTS/mDd?=
 =?us-ascii?Q?3cl+iQQm/ZHg4NLKZHFcZtWe0dWD6c1QAxfKCYy4Zzwb1S6wh0v9NClTuAzz?=
 =?us-ascii?Q?mvLhHgZAxSYhThrCjQj/n99eQAtJLTlSFKXpqIGoJntTtjBgI/8T+7GS85k/?=
 =?us-ascii?Q?2lLXgAKTY8n/PRwO8iPvXNbCrlhdSqU96xZkyEBoN03HOz8PMitrEDxuzy9I?=
 =?us-ascii?Q?9i8zBiSNc8S6GmHuE3gyZktfKxFyzfak7C/WFP5d?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adc3f830-4251-49a7-1349-08de2da770fa
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 11:23:51.3419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FXeHmet/feuPNTMsJU+wcsaeC0cWvrInhdqV8SP7D1i9rmC+5GNkjHkHK6UgQOM/wg8cMB/NTAFdMobDzN+X/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8237
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_032358_226932_FAED2065 
X-CRM114-Status: GOOD (  11.86  )
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

On Wed, Nov 26, 2025 at 03:01:33PM +0100, Franz Schnyder wrote:
> From: Franz Schnyder <franz.schnyder@toradex.com>
> 
> Currently, the PHY only registers the typec orientation switch when it
> is built in. If the typec driver is built as a module, the switch
> registration is skipped due to the preprocessor condition, causing
> orientation detection to fail.
> 
> With commit
> 45fe729be9a6 ("usb: typec: Stub out typec_switch APIs when CONFIG_TYPEC=n")
> the preprocessor condition is not needed anymore and the orientation
> switch is correctly registered for both built-in and module builds.
> 
> Fixes: b58f0f86fd61 ("phy: fsl-imx8mq-usb: add tca function driver for imx95")
> Cc: stable@vger.kernel.org
> Suggested-by: Xu Yang <xu.yang_2@nxp.com>
> Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>

Reviewed-by: Xu Yang <xu.yang_2@nxp.com>


