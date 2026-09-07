Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10FBEC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 09:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LnrwOfgYgRlI+zWAvJf9CXsDtvn5c6P8CIXhZ6Xbbfw=; b=de1C3LBf/uxi4vt3F/hZQoIv16
	K3EcpUiZdlmvlDzDNMN12wm8ADI9TVwSNwvT9symYStUPRrcujMN3jTyMJE9jOIBtXZv7bW3IDRIQ
	PGmVXxvhq9K7uCwh6d29C+OfRQhdPh0V59Nx1FmIms7TnRVxquNNlRthNHyQVjnqZcUTn86rg9vO6
	0t2bMKZuLbHXHUsPQJbqYx4FTfBr3Pg8r+2uN1tXcCGvJruIvct5Hk3zLyO+rzNKk5kmzoDiweNss
	WD7fN7jfowf4y3iNzGkNROnXoVFJcSEHLbEAsgzGNoHBuv0OaLEjsJW82iJIx38WkG6jumdRSJIeo
	ggVsD0zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3VEh-00000006Ksh-1N1G;
	Mon, 07 Sep 2026 09:01:55 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3VEe-00000006Krn-0Moz;
	Mon, 07 Sep 2026 09:01:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Isogk23a+qvXuQLbs66nuJ3HE4oyfOeKYO1pDHSDPZMCwMoUEQp6SRcuS8GcQzVtQgoKici64destgqyKoHLczKHskLV5Xga7AK3y5AQbjUe2G/6+jRkwW6sZndhUNWH7cij2I3h2n7xVLVPRNSP3p8qEUAFIVk+jwmuc9+CcAMqBdjeAuup8eDqOgo0bKwYPLCeK9pW5eY3LPkBkdMbQro0IJI64ZYhpPoDnM+CmuBxKnWuQWPdr5CzS4CI6Od3bQh56FAgEfKs317Q21Z0w6/N1qCvsyWuxq3EAHcRACP4iT/vOt4IQFATQAe6KHzckDCoxOZcLFmYOSfRaqb4QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LnrwOfgYgRlI+zWAvJf9CXsDtvn5c6P8CIXhZ6Xbbfw=;
 b=YJU66/qex5PAGl89nmM1u3Bo76jfNP7dxW8AZUwg/FaKfrPI9O+PRJBj9QOQbVfUpjhTs80LGLL4K42e01u6TLNpw+gTHZPVXAiC108GUYzlhedr4k+X2RFV3t/nhD0vLubO2qj9E6x6EywORVskAyPvJni/TMUH3Y461C7Zkq2Ohj6EwciOoh9qNHnMBwMjIUeKVRTb4oEEJDN8eLCANseBnt7Vt4S+Ud8xtx2FGE7imMJkeXmuyr1JIKCiQgUm5XtEQUS3SbX27cnkP+Rn+EODCSjjSJJ1x2ZkFhBT5DPzkg7zk65tK4yAhnJOlrWs1idEF7pedywXNsIBm7ra7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=oss.nxp.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LnrwOfgYgRlI+zWAvJf9CXsDtvn5c6P8CIXhZ6Xbbfw=;
 b=NttP/N0e9SjBYHQ4KbNbFzQcNwIjObOk2ESNS+UITuXrpvwdzYXJT/zytU08RjP+3RucZwokBN53t8EdwjSix7hRatTJoIkqExoq7alLmEQk7fOU90VexNoMutfCtrtqULTCqw0mIkpzHiaqnNtOaVXwdyPuuQlSEgtszN6nqDqR79PlL24HiwuJZNKuNDPlCuKhwlpT4kHe8XTBK7/wOT2O1YdHVTuf6E6LHDVBz9t+4j3zSKBixWyYMtDpRq5/HvyZHKPiDx5m183usGGo15GKWC6Ie7YcnMqSexQMu71Sftwk0Ilp/uW7Wf8frmUCXYVm9HmCYmsgdorJSXuItQ==
Received: from OS6P279CA0142.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:3a::16)
 by GV1PR10MB6660.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:86::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 09:01:44 +0000
Received: from WA1PEPF000099CF.eurprd04.prod.outlook.com
 (2603:10a6:e10:3a:cafe::64) by OS6P279CA0142.outlook.office365.com
 (2603:10a6:e10:3a::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon, 7
 Sep 2026 09:01:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 WA1PEPF000099CF.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Mon, 7 Sep 2026 09:01:44 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 7 Sep
 2026 11:07:09 +0200
Received: from [10.48.87.20] (10.48.87.20) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 7 Sep
 2026 11:01:41 +0200
Message-ID: <ef4dfc0c-3215-4e21-b1a4-1a55a1cf55ca@foss.st.com>
Date: Mon, 7 Sep 2026 11:01:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dmaengine: use dma_chan_name() helper to get
 per-channel device name
To: <Frank.Li@oss.nxp.com>, Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung
	<schung@nuvoton.com>, Vinod Koul <vkoul@kernel.org>, Frank Li
	<Frank.Li@kernel.org>, Paul Cercueil <paul@crapouillou.net>, Eugeniy Paltsev
	<Eugeniy.Paltsev@synopsys.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Binbin Zhou <zhoubinbin@loongson.cn>,
	Patrice Chotard <patrice.chotard@foss.st.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Thierry Reding
	<thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, "Ludovic
 Desroches" <ludovic.desroches@microchip.com>, Viresh Kumar
	<vireshk@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Manivannan Sadhasivam
	<mani@kernel.org>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang
	<haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, "Chen-Yu
 Tsai" <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, "Samuel
 Holland" <samuel@sholland.org>, Kelvin Cao <kelvin.cao@microchip.com>, "Logan
 Gunthorpe" <logang@deltatee.com>, Laxman Dewangan <ldewangan@nvidia.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
CC: <linux-arm-kernel@lists.infradead.org>, <dmaengine@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mips@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-trace-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-actions@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
	<imx@lists.linux.dev>, Frank Li <Frank.Li@nxp.com>
References: <20260904-dma-chan_dev-rename-v3-0-685601b0b788@nxp.com>
 <20260904-dma-chan_dev-rename-v3-2-685601b0b788@nxp.com>
Content-Language: en-US
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <20260904-dma-chan_dev-rename-v3-2-685601b0b788@nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.20]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF000099CF:EE_|GV1PR10MB6660:EE_
X-MS-Office365-Filtering-Correlation-Id: 80f4cbc4-bfd6-45b6-a631-08df0cbea3e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|7416014|376014|82310400026|23010399003|921020|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003|41080700001;
X-Microsoft-Antispam-Message-Info: e3C1zsUIWNyMzCv4LKvCbYoE5pkmU4iJN0iaC7BNecxBtmaMdqawunJFOS+j8gyudAvw2Wlcg5OaxS7ugMtShsubFn3co+2usj777JRQyreFP6GV5TbIYMyG0xB8/UAwFTHZJnZsSyWuEMfY1N0fF+26BZC8XnN3EFNEWi4ZMO68CzU+RlQq0Qt/RaAkg35ajY8U0rwKUtEm3gxWMPI5LtCguHorkeSx6o4+eSQbJaQCiryk1PHXxfmkEo3iw6AvMbU9xKhjKZ9c0pibV4Iix9pokADUbaAXp+jyy0y7CVpvG2G6BhfFdz/nHJCfqTDXkW4gRRY8uxaFoS8rvKebd651AmbkYcnzFA70C4nIvCfj3TmW+s1lhDIAyNYUVaOrXJ3xwC7Jrc79n6rJVIdpudxMkY84rtxwVxQRe+a35Rtp+n6t/zCLo6nt36RsW1+V66S0GDOWCXtdX8C1E4IYZOpUVIp2MkId23A36mWBg1diFB9kl3n25QVxEB1AGRzGChYiMo9qk9ynNonCJGNJviyzmuQl6yFo5wfmxn6rDGx/NdrjhO8bG6ppCzAHDlsGsvRYmNOYf/Iqzph6DVltu+P7Vg6cN0iDc3oKbqvwdXKOGZyYzcvo+Qc5PwROv0lb9WnSNq/KqVcMJ9d+GX/9oytvYyGt2K1yUijfWLVtxCnETvIKfJQQqUsvrb0FeaMMznwLw15IL4Erp5MK3ulsd4ktw1vzzkHdteDOPeTVmvUPJGoKGTxAVEGrjgNhaC98Cctar/wYF4hd86R29iL+ZQ==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(7416014)(376014)(82310400026)(23010399003)(921020)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: XKmYppqmDMnVTG2wDJT/8rrTofE4i8l11vRfEKu46pAMZZwPoPppssTJXdm8TknF6w24D8kwsL0m9G+BjU4EnsDDtgB6ioZMrrYLVpzzI3EOOXZrArCHZzG11vNTDctvjmLANBtgc5w6cYAhjyHwIJBK1T5uKg97RS1AfLZ16ErmEpEnC3H5i0xgk08/QhdpBqwQ4Hxp+pv3dYhuUvp79uatd9JJm4Unz1dCbnfJF2H8aGN01CKUmH/xff/FThdBAMVIVvw6D6Tf3KtGE5S4QUUER0uNhonwsEtLCbECz5OzgVA0+kn6IX6MkYDhaoGAdDTQ6ok5gNTLmYvySF4UYObFmuIBY3S3j6XK+UvWAQYP3JAKygS9GrPPljtsncP2VyzwR23geWayUukgZTEr3KC6pS2T8QF6I6XZzxD6LlyJP3+NBL+sqbygh2843//9
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 09:01:44.2395
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80f4cbc4-bfd6-45b6-a631-08df0cbea3e8
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: WA1PEPF000099CF.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6660
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_020152_129709_1792E3E3 
X-CRM114-Status: UNSURE (   8.91  )
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



On 9/4/26 23:49, Frank.Li@oss.nxp.com wrote:
> From: Frank Li<Frank.Li@nxp.com>
> 
> Use the existing dma_chan_name() helper to obtain the per-channel device
> name instead of open-coding: dev_name(chan->dev->device) /
> dev_name(chan2dev())
> 
> Simplify the code and improve consistency.
> 
> No functional change intended.
> 
> Reviewed-by: Logan Gunthorpe<logang@deltatee.com>
> Signed-off-by: Frank Li<Frank.Li@nxp.com>

Reviewed-by: Amelie Delaunay <amelie.delaunay@foss.st.com> # For STM32

> ---
>   drivers/dma/dma-jz4780.c                       | 2 +-
>   drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 2 +-
>   drivers/dma/idma64.c                           | 2 +-
>   drivers/dma/loongson/loongson2-apb-dma.c       | 2 +-
>   drivers/dma/mmp_pdma.c                         | 2 +-
>   drivers/dma/st_fdma.c                          | 2 +-
>   drivers/dma/stm32/stm32-dma3.c                 | 2 +-
>   drivers/dma/stm32/stm32-mdma.c                 | 2 +-
>   include/trace/events/tegra_apb_dma.h           | 6 +++---
>   9 files changed, 11 insertions(+), 11 deletions(-)


