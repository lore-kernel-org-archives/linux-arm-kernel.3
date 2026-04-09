Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DB9E98FCD
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 06:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ydyP+QmvZ3Z/0sqL75C+e3DO/JJLevxbJ3oYhVwCex8=; b=pDQ9UeoBzmhMACHP2UZZpZMrgm
	WjidfhGvLSP/IWbpw+NVSb6akyJA1Wn9Mhamqe9e1WcBFmTbQ5t7G9sk5H8EVbTiUPmuXUVC3kJjh
	ScWI75Jc/qSbFHdoOM9QyAPWjwSxjvsQUfCtPwrJ0MPWLUm3V/0P/K8mj0XFM8DK3s02YZB0xLq/1
	iKffEzXEuhMT0tDgEb8EyQO3BsYgTZ8bBXS2go70UdubA6l0nptQV/kQ+BCtOt4L913wEA7eLOTBA
	FC6THn8nsmSgNpO8QczktXo5i2CUGnX6rsaBil7we9hUfcVH+rLhrUmRcDzjuxOmfkpzQ4mB+OJad
	rHUvp37w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAjCc-00000009n0U-2E4R;
	Thu, 09 Apr 2026 06:49:22 +0000
Received: from mail-northeuropeazon11012068.outbound.protection.outlook.com ([52.101.66.68] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAjCa-00000009n0A-2I9J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 06:49:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LtQ805xvKA6WIKtaR6V9cjYaVhFpc0CoqQ224L3Yiqwe0nwzfYyeZdmgDORQyIECMVKPFwYj4q07DZO5CLPOjgRjNmvrWr3i/IutYMJzdolRJIt9LG50uHvV4KMvwxr69N9TqJ3+peX4VP77E2Zb7mUfOhQe1nFLaI+1ZZHeptvmSw5l9cEiI328/KuWybGX3e2jez19oUzv3Be1+R2J9Kzi0ClQj8emu6IgPruGXRcI2tIL0xJF+VWrMRrGeKaCA78dJQca/s7uOrWukHwZESM0b9SgYJpktxSEcbb73s4xNTnChViwI8Zk33DQhw4dVYqzKFTTts1eEM2CU7/cNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ydyP+QmvZ3Z/0sqL75C+e3DO/JJLevxbJ3oYhVwCex8=;
 b=dMgk+YGwUH6IPAx02L2zWHTQm0OuSVyqKDRelcTp5Q90HVE3BQk4z3BqdmwEZNBJDbouOpjlfUrwLcEIJB1zZciFLP55YAuvbr4LK3m22X/ovLPeQGUNdhWQervmK2NJ46+GaFl5Vtrg2LZXljVTfMyJg/vXcDKzqE3K63bPyTHHYZyV8dLCeyjQFyDEUDXHpc3q++tL1+IAbN9RDY9shjwmZ+ikLtzOkUPizRu4ywRxRHU/UBm9ovBayaTECBHHIjNdVC8yX8JpV6LKAZ1NifQjigBGp/ALYCB5B8P1utzSYwDBwWDBydwSoOWNCMztM0AXEYQAN1b8IM9IEt+4TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ydyP+QmvZ3Z/0sqL75C+e3DO/JJLevxbJ3oYhVwCex8=;
 b=ir501jcAW/bHKh1lvziZZVZUoxyM4hap2XxI33gIie/dv3wq7VRWCIwCC+nIb3WP3rCkJK3XfxHcnThLpwFC23pBCPlhfqprU1NmjmZE2vnlXaIKJzVSia+Ca494YFFUggbtrChNE8/HCApOgS9w5ATG4HDoZY1HzitEUZVo1yWARhh4TH+F/njU2gTgqb80lsie8yx/tFhpyataNEIV/Hrk6HSop1pGK5MgNJLRP7+B3eMi29P/DI20G18p7TDDWEdQ8Vy05XStqMnHgg99cgl612noDHOghuGWQHOXAVI4V27uN2ysKRqqvRBC/tLZVypHb7rBunMiroGk/o+aCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI2PR04MB11172.eurprd04.prod.outlook.com (2603:10a6:800:29a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Thu, 9 Apr
 2026 06:49:13 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Thu, 9 Apr 2026
 06:49:13 +0000
Date: Thu, 9 Apr 2026 14:51:35 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Paul Geurts <paul.geurts@prodrive-technologies.com>
Cc: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
	sboyd@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	martijn.de.gouw@prodrive-technologies.com
Subject: Re: [PATCH] clk: clk-imx8mm: Initialize clocks in arch_initcall
Message-ID: <addMdwvnDkCMJxhx@shlinux89>
References: <20260408101313.2082125-1-paul.geurts@prodrive-technologies.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260408101313.2082125-1-paul.geurts@prodrive-technologies.com>
X-ClientProxiedBy: MA5P287CA0102.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::6) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI2PR04MB11172:EE_
X-MS-Office365-Filtering-Correlation-Id: 0883d1b7-4a6b-44a1-ec42-08de96041c67
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|376014|7416014|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: MuQGYuaI8x1T7P4XdfqU6SknNX9VcWI1h2hYdLp1JsUkOH1N3DVBD380zVR42dOLOubZnGfAI2hUJmR7L2C4FmKhbxm4iJnqms0Tti2QJ8/3RGh0+ruC7eeJS3s8jtFsMuM+V7faNMOM5OIyZ4o7pwirZuvW0K1fMD0agxRM/ifaKQD3NG7QIy9BL3e6n/L0OIO3OuezICf9qPKHRZtDnDF8MHtMzMSPNaMaLRg+sgKisair/NhWgQn8kG64fWzGw+H6CeJbaP06/fjFc6BF9g67lgDoIWjwzZof3AojlNQuJA2fw/cPI8TaQXA8eaq+jnanzfaSwViJ6m3z21eXHVtjbgmVL4eSdY5uAAWxpLoVayEE5TO5Gn3b1/12wkFEa1NQYTJ0ABuchJDDk0iAQIwP7lrZwYqaV5cg35yhRK+KvrJ3p+2F0b0x+JMwJg+IuNp2kGL8RowpmH7uTrQn+2aX39i4zu+gu89MixV8hYtlLSVES/ANBSRmcO+7J6VQxU65muBQP4Bp8OGlKTWYVknVuxb66y/seLrOg1AS330LE/vwieHeHmFx/AJ4V41Vg3n/ipNEoWsOoxAn5FRN5VR0r+ghG80pMheThononoS8P+VW4MI/hjBwBTlL7jHwa6mdkEYmbuRj7Ffdz0WRIbB13sLuJuSx7TwwENif4J8GbIDZR4avGSEQd1FDIG86/LrsD2H0Cady2eouPvn+Cn6Q9UcECOFlJqYwxYcISSRdQH5ngTHLPohtfsbv8Gq2B3o9sx+e6MWW08zUNy306jIAu8E6nQ6tn2XyNFxJ9ts=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(376014)(7416014)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1AJ6rz/ermcST1MJrRBFrpKJyKP/MdvQvRThmHAzQv5ABL5QS0LjfVb+3wKh?=
 =?us-ascii?Q?insMmJ8lvt6hM0G/JDgCHSxYpM+ksso/jVY0mtV5M0Vw39kU2LsBsAAnXvUT?=
 =?us-ascii?Q?/FJvO8ORzGEiSVOx91dqwDtcP8DpZbbaVHzl7fo2fxzjV6YSBQG4bx0MY0AR?=
 =?us-ascii?Q?pKjsa6QhrC0t3nkxxp8gsMYfgQ9aJUOGYY6Zthuq0ESo++/W6/lOC+Ev7tBM?=
 =?us-ascii?Q?GaIUHhjJ3DOp/wSBkoW6ya8crCByHtskyGEyzCGFe7qM0ABzDc3v1cA8KTOe?=
 =?us-ascii?Q?Tp3jwCDA6L4/aY3+peHRhuPt7Fe6d7BHSpnHYgkp96bJrgFyYr9cLADxmFOh?=
 =?us-ascii?Q?bRkQjezbJ7p9kgQfdX3gVUj9G0pTjT9/vC7o0Mw9c4bXChQ/6OmsTb99hXuq?=
 =?us-ascii?Q?SBLuW67Si0RSrFxJkvOhwMaYOzlLDF6I2nR50bhdfx/oROFbleLDZ7/icpqX?=
 =?us-ascii?Q?7IrZjk7nALQEfdqR6P49aN3TxxwrczXX3zEVYBjMcfuiaQ8PzkqTZZVp0XnW?=
 =?us-ascii?Q?gkA9q+NL6M70DYmVb+o/T2Z/xc1z4QFDZMlMYde5ZqQFktg8kXgXvueOBl2i?=
 =?us-ascii?Q?0MNs2SXVZlwnITo+lqky3CJlzqG45IQ0QE+YCyUvkLQ63utv0M8zENytatL6?=
 =?us-ascii?Q?tLRJCLsh3eMI5MXX86CR0ZyhcG0XrT8ihkbMTsFZqAZqIFFGp5re3g2weZqF?=
 =?us-ascii?Q?Dn513xAXU/Ajy3VcCLFbJWciJLHxO3PmqF301bH0c55xXDlY1qIN9ZMMc2TR?=
 =?us-ascii?Q?ZnzLl5jbSI07OEr8LfBDuF6Abuflj+Tsv/TI2Mb4PuE92R7kGACDtVQORfRD?=
 =?us-ascii?Q?UxGh1PQoyZmgJXGigQZ6NHleiddYiJE2U4TJRau2Rgi5efO32nBIdelsh323?=
 =?us-ascii?Q?gtpyAyc0XQizce+3uXtGb74XT3f3ao71UriLwQXAx68V1ECblBxOICSqG1SE?=
 =?us-ascii?Q?6pz7UvZi/OZomlQn0g+fClvKZm2nbJ2S/B15OIf/VRwhq3Es9QqkQBY090+8?=
 =?us-ascii?Q?OIBUcNuNnSPexa2krLQ/mLeEQnJ07dFbg5IWXw+PQ/i8z/Xvn7Fl0ro9RmCt?=
 =?us-ascii?Q?FoMje9IewAoj6ud/N/Fr9/47v4mmI6xRPsFDVI4NYVONcSamjcb5tKQQ5u6s?=
 =?us-ascii?Q?P1jGiRvB4iw3+h2QHNcuOE/9RjhILqzpbm5rEjHDn0SiHe6cq+KMgAZe5nbI?=
 =?us-ascii?Q?Xp7xjslsMWv309GDHe28TnTTVNQDlzN4INJv5cGLO8zIp/j4z6GB5r9YJnfh?=
 =?us-ascii?Q?fP8pEDe90qWXV4wi3sT8Xv60tPT/zy6do8b5aYb+xQk+SfT6ZSE4dEhzbIHO?=
 =?us-ascii?Q?95VDgsxOBsYZdDtCYS+dj7yxVSuxrYjMaAmghFMNESju59RRJc0jni1/l4Or?=
 =?us-ascii?Q?KpDZQB7LLLTLAuG5V4oA5DsZmvYWMwxFF7e6GgjapdBlVzeA4K6DjmaGsMix?=
 =?us-ascii?Q?DekByw6BIpmPkQFCTVRaAcl8Fjx0qPsqTB3RVF46evRpal3QoMCPld8jF0pA?=
 =?us-ascii?Q?l3W9qkZ0PZfdT2/36Ed9yOyITfOigu2Tv3lCubQcmneREnG5/V/rwSkcO0V0?=
 =?us-ascii?Q?Nl5+b5ua3+M/D4CYOlHROQ2TtFensfos5A8NJZ74X4IrBM/lhjCeRMV4yiyg?=
 =?us-ascii?Q?rM5xnXT74hwdAFVY+cksYrBqc2FmOJ1eLXUmIrT059QYKE80etR7Oj4dqnx2?=
 =?us-ascii?Q?Nl4xNl81FAU13WN8/YoAyxFpH/MIo9RKoIjGvH904E1DqNGAsvb7LpA1r7/n?=
 =?us-ascii?Q?4XqXTimXsA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0883d1b7-4a6b-44a1-ec42-08de96041c67
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 06:49:13.8407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CCCXWxZgLIHvr3XSHbsf5dvLQiOAnGIDQLUyprbdm+J1t9ct2/D9rXY5ndItxT89aEvX5Our04u9DhQM6m+AnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11172
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_234920_606903_C6AF4445 
X-CRM114-Status: UNSURE (   8.63  )
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

On Wed, Apr 08, 2026 at 12:13:13PM +0200, Paul Geurts wrote:
>The i.MX8MM clock driver is implemented as module_platform_driver();,
>which makes it initialize in device_initcall(). This means that all
>drivers referencing the clock driver nodes in the device tree are
>deferred by fw_devlink, which are most of the i.MX8M platform drivers.
>
>Explicitly initialize the clock driver in arch_initcall(), to make sure
>the clock driver is ready when the rest of the drivers are probed.

Let's keep as it is, changing to arch_initcall() is not allowed.

Thanks,
Peng

