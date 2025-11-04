Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21953CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 02:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HOhBXrZ9Xkgi/sM0726ekqXqInrVwYfhUsNhmWvlOA4=; b=QyTSG32OOCDDa5+TdWyyLXa84r
	hYP3fK8wOfkUcLo7aLmBcHYkAsLRrPk6GKM9wPMwYq4Kem8delr4BCbCB3WpYSWBiF4gxQaSHpsoH
	lCnAHKi2bVptRRxo6eQ7lsAAnYSlMsxZvfq5L5O4qbnCeJPjKlpgm7vZsqUx3ShDa9hnmzP82UZzI
	mHgzSqGHMq1S7j+Pub5f+nBHtvAPZaMZmTWItbk5ZD6kktLLjMMKLFIfMCLU8eTEDvfUUZL3y+5oQ
	OSmEO8MNe14ll9JLLlxJreHoCzjW5uoqxzGkDKVyEEN2KzLAcpETY2KXLfsVdv8AmfN2CuiV8IKBV
	dV9fORqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG72a-0000000AzxT-0xeC;
	Tue, 04 Nov 2025 02:45:00 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG72X-0000000Azx1-27yV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 02:44:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C534iL4ux/vkZEVxAi0fa4gmQUBTZyG/Gfgs1keA6CUiDf2ufVuVdqR4IpGtVlfsN2vIETQ4PFZQqAKFxtuVBGhJYr5562Pt+OPUbbKd48rlUT6GpN5iZtc7XjQaUs+hPhzrJg416DiYyrPeFG5BHKHh3LtjoK9DjLlEIs4uxM/Lctu7WSfdE9AcJ8rWgBv9++2DujGBjFqEIITcrKZ6VTruVxbiJOzXRyUMYjTtmplI/F2qY+W+d2UdIXFjTyNCZCoVlyOj/p53kUYvy9KdX4J3lyGCf/7Xl4Ta62qzNiQIkw0IaXSywM2d2UjBmX1Yex7WoRofBeyQsN4cW9Qz6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HOhBXrZ9Xkgi/sM0726ekqXqInrVwYfhUsNhmWvlOA4=;
 b=mdWuxK+l5S1Bco+mzDTcemvQGDBsLl/rRkQGfK7qJLIrC7j1MQ1wDpecFvY15HaWiep7rfFDD6/BBjyi0LGYNwQe22T5Oy2wLAdYPNWQOa7WPj7MSRajULryHK4opNZffAs9G7kIj7KB4N4bT24Ek0mI0mV2f9fknScBRb7kgTHeEyTFlCN8RRSAQ/bCY3fzsD3HNlhDdzJpksKdq39ige4/qxrmU1v2yjcls3GNbU0+pY+sWUkXsJlWMYsxM3yD7rsyJG66HYkhZjfTnMVozG6Z2ICWc+dwEsrqQM6Qm6JffT/vwvB0cwZ5DFoXMrsYY9ENIDL0OvZHuNN1udGDYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HOhBXrZ9Xkgi/sM0726ekqXqInrVwYfhUsNhmWvlOA4=;
 b=VUL8wns1duJ71EnRxjg7q9afXtMWO1AEaE7caNqs1A7CpQGhiiMEWWGb+V5OrCIJo602zB8gVEplj12VQ8qRGV8aJ2Om63tuwrT5hxXc6ABAdoLoZ817afBJvj7zF6oL8JESVuiLwHqgQCwZrtlOY15dqGzSkWWtXnMrmZX7seyxO8s6/pdr/TOzhnJusicHf1YS2pD3iqWz19zPZyAJxIvkWXKgppfLnj9SO5JP5+OU40VwAEC2KuNe/IqC1OJzX2M3hk7TWS61gmzGtj0uGFWu0GGEfmNAeoIWlV9EhtLOJTlCzDDhbIsU7JyVUUoCJZbhosaG37oApj1HOCg9HQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB10203.eurprd04.prod.outlook.com (2603:10a6:150:1c1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 02:44:47 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 02:44:47 +0000
Date: Tue, 4 Nov 2025 11:57:13 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v3 3/8] clk: imx: add driver for imx8ulp's sim lpav
Message-ID: <20251104035713.GB8752@nxa18884-linux.ap.freescale.net>
References: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
 <20251029135229.890-4-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029135229.890-4-laurentiumihalcea111@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SGXP274CA0024.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::36)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB10203:EE_
X-MS-Office365-Filtering-Correlation-Id: 7724b078-e7db-44e3-d227-08de1b4c1deb
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2WYdHrCWG6Fagf5H4Dgo7XlunXjbhrx/l+6K2Y6+BJMs1ev8TmLcSpk4xORo?=
 =?us-ascii?Q?P7y00jmonGMoS13nLgMUpOZ1Hiq6xsXUr5AcOh9wSxCvNBbcqYVbnirkFkAr?=
 =?us-ascii?Q?//O8FxzN3Q9PTPx4BzEh2rZqrhEStABGYMKDz784+bL3kTOeIsOGrkxSeYCW?=
 =?us-ascii?Q?9WqFMoziffqeEwJnDOGTUcV2lUHAUEG7ZJk50w21sIDw31gAmIsJJ4YSpAQ5?=
 =?us-ascii?Q?B61FTy60FiD6Q0ua9pPLLZ4tSeHdCVe84ylzTiIu2i8KhpiEhfjqn0Uq62ha?=
 =?us-ascii?Q?RIE2il5QX5Un/kZjRAcbxzpFglUv3tElLATtOi7olXcaJktsXz3LLSSqw+ED?=
 =?us-ascii?Q?LPRBX57jdXxmTm5+6byHVsP11meogLqL2QkBeLPG1g42jpc2vytcJaLugdzG?=
 =?us-ascii?Q?Tuu+0E0iWLCifv6XwV6VT4Cf59aakigFX4Nkg34FH72tVtFxytZLxNmAa1t1?=
 =?us-ascii?Q?aBnj0hbGV5KHFLSy1elyf/9Qg9OzBNIYxG/+d6Txmmd1rWXNlDh/s6CCA866?=
 =?us-ascii?Q?cBO+aCNyr0qI6+3cayYU2ZHBjvNGqmMxiMKMRE73dlTS5W8DNBmiTdNX0GDz?=
 =?us-ascii?Q?aYqBy7GoZo3bA+NOpF3XAdPemk2O6E/FnKvW7UF4j+3Q4IkNdACEeCwl/EBH?=
 =?us-ascii?Q?6+VUa6dpzOtaorRdSwAvKiviNPrjEB+f49LtvjhcsHFkMMfETSXvJFTMicuM?=
 =?us-ascii?Q?M0H2AtMDxJIEhiMijCF532IUyiQr0xHWXnh5esA0cKctMuy/l9QFKid8YQ9H?=
 =?us-ascii?Q?wGATtfCsKrVHLXaUmI3Py/OT8/N6HpmI0aShEcAfSgz81OR2gurqCNy3KoBm?=
 =?us-ascii?Q?j8ID01wXQg0iooFkiB+3bqVvhB3QvBuwqQWXtGmpi9uHto81T+eVE7HWS5us?=
 =?us-ascii?Q?XMWfU+V+mrhmZJMzVsfyGpIDIczx2Ks/r8gZarlfjhn+FNvGEhybY2p26lfy?=
 =?us-ascii?Q?hPgE/HBd+z3yVPZpc7YIjwnaMqXm27n6iwQ7XOGPXob5uDN/B9yOXT/+23j+?=
 =?us-ascii?Q?BVhxT8ojqwDeGZRiz5ymNfv0IPXiw0PrAML1eCMBt/+/y/cM/kXrOpY8PzWP?=
 =?us-ascii?Q?ueGN5B5UO4cGb5klTgyq7Nd3uJnFSz4kWid1GGYU2f0tJU8TM6HS8YLRFiTK?=
 =?us-ascii?Q?0cD2ftmSlRQbMYgFTH8gZlSXXiuCiWlWitOc9GMvaC1VDloASPxvt4A6Ol2l?=
 =?us-ascii?Q?N8HyB3L7UpSpjDc3htf3oOhI22LuLsGPaB33lSVC8o03YhEURcpMOe6fST6X?=
 =?us-ascii?Q?tE4p5R7WYw+3RZCh4Gmar5qSmxgPSIi00ShNT/aQrzVgfVP93GXxeRwRmdio?=
 =?us-ascii?Q?UC/qNYovTwk1/hir7jONH2XDpL17aKz1R0tN5ngRD8dSf3cDLFL7umcedJS9?=
 =?us-ascii?Q?jCWl+7K88xixZ0kCeOwWgcej6LsO9KUOORUPqqBHhBQrHkELu9YWGn1P7Ilz?=
 =?us-ascii?Q?Eln1QKuUNY17lejeJ7Q+qB48+Pc0zZHRwjVXC2Vg7L2nQXIMU9XkhuiCK+zb?=
 =?us-ascii?Q?zxj3iuccUbVaBmbtcxIRstbSAcwcSpNp2Lr+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qlM4WHIEM5QtZJmzTxKx0Y2FCqDi3Daqx7kL49Z8ioplj9pLTee8D2qEwevI?=
 =?us-ascii?Q?JUBQRhPHhJ5ijNtUESerUTEUqk4u/xybl2Ecq1l3mXT/VTw54HbVcCTUuH/P?=
 =?us-ascii?Q?6CN65ZvD7PZJxZfKgf1Px30lbb2YEUPgdXhJPH/ajPggT6xj3pfe33NXzINs?=
 =?us-ascii?Q?Sb6z464f+lbQG2qdyiGVdUZ7Ks9kWSJktWzRwIVfFKfSebktti8PxCPh7RqI?=
 =?us-ascii?Q?h/Opvd8ON2wJuHErFhfyzV3K5WUPD03tReifXMS/b9Cl1gAQecuFCshcHGZx?=
 =?us-ascii?Q?d7PQhlzhPDyMXlrjLRxzU/V+x7MUI2xH/r73aXfzDBRRogfr477crURZt+lp?=
 =?us-ascii?Q?eIf035hCgJgjj+Bs2slwZnLBAn2YRorEhi+uKnq0v9Uqpwpr6mc3xRT93sBE?=
 =?us-ascii?Q?2KhFBjRAdzLlnDUBALAZX4fS09chwBHQ6VolXBNTg1Ni1GbEj6azI/coCvq5?=
 =?us-ascii?Q?be2SFz61lb/riFMg/o9BzxVPwIzsYR/cxF789YJngmydZ3AKll9Za0FBxswc?=
 =?us-ascii?Q?dRQf7o6zC6wttwNZREDHt2KF83bvKPLLzG8BqKduJY4lncneQQz1lL3cx7zm?=
 =?us-ascii?Q?6R6w2xRBC+MPXNtrYTubrqB6la8ifiJnjUqEWDIOz3oN9TA+1udH/SVzdsdU?=
 =?us-ascii?Q?sAA5tZq75oqKn1GzmjQ8PecbC/uJTYwCkkKnV3ZSFFfKw6ijP6uI7TuBgzpM?=
 =?us-ascii?Q?yI5RiFoNH+1a2LzVr1va4oNQuxcilR5Q6V8wopeYHINfchwPEhGcQdQOYxzI?=
 =?us-ascii?Q?S0RfRAHQKnNkC1d9xQNo9PmD9r4svWJ15Ipv9Ch1bLNvsGqcumwqHGGD9jG+?=
 =?us-ascii?Q?XmS/wwMPP7KaIZhqLKnhiHb1UBylkG1NjvAZDpV6AOvGXtz3ZdjMKherVITX?=
 =?us-ascii?Q?TrNhf15xAtRhpIsB9BQDvdxD3cKB3ZCu3Gt8A14wWJIWrvcCekyne4jpHwjt?=
 =?us-ascii?Q?xlf5KJdEcMWgUClPQ87Jlb3meN9Cukbs2+A/vPmo3PylUeF5lp8PnnSW8iZO?=
 =?us-ascii?Q?rrfaiF6QpsouHFzAhuzWpvCxj0/HU3lpZjGioveWy4olieiOADgn8eoTUfTw?=
 =?us-ascii?Q?q8MfS+5sTDESzwy29OIhF0z3pm+a06BWMQcPogmADxSbIjAd/S7IXPyuYBCT?=
 =?us-ascii?Q?aS/sRAQB95IRHFFWE5GpQ0jD1SEixVZRshkrVeOwp8euwq5uOuxHbR6hBBur?=
 =?us-ascii?Q?7f1ddCxAFOLwKo1qdkVkcC3/kIN9+btY5PsQX+SY73ieZLey58NcJT0cxGob?=
 =?us-ascii?Q?ethP7Je56KK2PWaWUCFwKNW15W1fK3MXrjgXsUKB2n8KCTgGoNT1bkL/d6sw?=
 =?us-ascii?Q?w8rkUNxPM6V5P2SdBBznSklHaJ3LRvT/PxRNiAN0CCG6Z/wJjkMcxvHsiAR6?=
 =?us-ascii?Q?KYvR4L4a4KyvV5q2EMVj1GzCkHmdzKxaVMp1bAhwh3QDge8UWl4u7dYj80uJ?=
 =?us-ascii?Q?2dcm+ETsE0zpbTE8YLah5/fx/HzLbENUC+pJmCJ66ci8TIB8dvWMGH0qXk5g?=
 =?us-ascii?Q?kONUlPopbaothWx1wSVIFNY/6c/d6Sfue7vJnQsGEZ9CKPm1gauV07OmzwvV?=
 =?us-ascii?Q?aX/0cyxtvF5vNRUaYGNycSZfbVPIpZuwTP7Q3MyO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7724b078-e7db-44e3-d227-08de1b4c1deb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 02:44:47.0109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GFwJpEpYNO2xYbthirfUr+yaHpGk6CPppwVh8i/HT5H78/IbkQn5e8eIVv+A7lS/SodQR/6+Vb/AMTWmFjwVUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10203
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_184457_572364_EDDEF924 
X-CRM114-Status: UNSURE (   9.74  )
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

On Wed, Oct 29, 2025 at 06:52:24AM -0700, Laurentiu Mihalcea wrote:
>From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
>The i.MX8ULP System Integration Module (SIM) LPAV module is a block
>control module found inside the LPAV subsystem, which offers some clock
>gating options and reset line assertion/de-assertion capabilities.
>
>Therefore, the clock gate management is supported by registering the
>module's driver as a clock provider, while the reset capabilities are
>managed via the auxiliary device API to allow the DT node to act as a
>reset and clock provider.
>
>Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

