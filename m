Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA3CBC4450B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 07:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d8zshZZgMrng5PlukhIlocEzscHjzcZmsn8ImjX9AqE=; b=ATRT+dJI3ajdVR4XqKT3JVZ/gQ
	4eOfN4YSD0FWS+eoIYVpvMyc/tmwedvH/61dJqU9Z64KC8p4tFwapA3MZ+PSJS4iQ+XGLtOhKjp9/
	I3457M3VFl1dBx9z4ckRgWPt4QlX+/ieTFks+pF2B7dMsT5RxzHjp3r+xXecqS7M2Y6PBEYOMcWOy
	+4KoDQlC0i2XgbCTL4MvGw/DjVqoxqxSIKa8EdTCRUvVGlQgAWwNhs36QJoDWIjWp4YZ+rx37+Myf
	406LzY9wT/QTvFO+5WWONrUzz+YD38/qpe2SnEW/GU3p64Q0hk2pC7lEpR/fC/a0VEf7QnyOk98Tk
	2L4o9R0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjuH8-0000000E3vX-1Gfr;
	Wed, 15 Jul 2026 07:43:26 +0000
Received: from mail-japaneastazon11023107.outbound.protection.outlook.com ([52.101.127.107] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjuH5-0000000E3uP-4A82
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 07:43:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FCm7c4bhCTPWHZ/C4mKDUzU7Pu6i/EQaQsuWgZtglljmSG3q322A8V9Hf9y/XY2fnVUZVy9Y4PHUm7Plc8PlVobCHOQLFOU2E4NmIu8bSeNYeGs1YWY99dFpny3xG+/MOHv7o51lQIBwjhPFtQMrJEEbuoqOfCVohGomRYBlRLFCwKj1oaPV/rRKRdzMBmpQkeHVE3S2dwn8WYERME81XNNQsNi98WmHp6rTd7dBoV8a9WUKmYun94YQTnSL4OTw9zqHEOzFvbrxkhk8Mbcs7a/kmm2GA0rXYgyU8orWNUlebWQgIg+AfCM9MIBg5jhAQqHwkIyjlWmL6xtui72GJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d8zshZZgMrng5PlukhIlocEzscHjzcZmsn8ImjX9AqE=;
 b=XYfaenZ4wzHERQChouqQ1aLlA1NSOGcbet8pCtfiOLzjtUQ4eHJU+iNUVG7WCfb1rqwLjT2qXNH6Rkcs9slN4Qn5ttUvY7JvYVfb9tB2T9QSbDrX36HHnoeTwNGwItzQ9Fu3LoiDE0b+VOU4R7Xp+Vp+Y7xbShAsj6r0NRkaf/C9l9YzrSLSK4olQu5wo3k/GlMmJsYdb3VjfXiyMGVWqlzDLDu+VV6YfPngMPUxC+7UHNoqe+X0Shw0K5G3K6BeZdznTJwxeDmm2N2mqnPLRiLzSonQ4WgPv6bOnk7YLXbPbi++gsbddt41DALOLetEtLxyY3BCDNB0g/xqDrbZUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR02CA0044.apcprd02.prod.outlook.com (2603:1096:4:196::17)
 by KL1PR06MB6395.apcprd06.prod.outlook.com (2603:1096:820:e7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Wed, 15 Jul
 2026 07:43:01 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:196:cafe::33) by SI2PR02CA0044.outlook.office365.com
 (2603:1096:4:196::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.11 via Frontend Transport; Wed,
 15 Jul 2026 07:43:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Wed, 15 Jul 2026 07:43:01 +0000
Received: from [172.20.96.76] (unknown [172.20.96.76])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id B0E9E427CEE6;
	Wed, 15 Jul 2026 15:42:58 +0800 (CST)
Message-ID: <d7f0fa37-50f2-4c71-8004-2b85e45171f4@cixtech.com>
Date: Wed, 15 Jul 2026 15:42:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/2] dmaengine: arm-dma350: handle shared channel IRQ
 wiring on sky1
To: fugang.duan@cixtech.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, vkoul@kernel.org, ychuang3@nuvoton.com,
 schung@nuvoton.com, robin.murphy@arm.com, Frank.Li@kernel.org
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
 linux-arm-kernel@lists.infradead.org
References: <20260521072924.3000282-1-jun.guo@cixtech.com>
Content-Language: en-US
From: Jun Guo <jun.guo@cixtech.com>
In-Reply-To: <20260521072924.3000282-1-jun.guo@cixtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|KL1PR06MB6395:EE_
X-MS-Office365-Filtering-Correlation-Id: 8df89c79-7b6b-40bf-6d86-08dee244b26f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|376014|7416014|1800799024|82310400026|3023799007|5023799004|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ARf45caTIGuydVjMiT7LtH377DkhPF+DmfHJZsxT9f7s5xOT5X2pag5th1v2MbA61K+DZJuM7lqqhtBkPKy2oO41qWJ96skoxYdu1hnqphKSnxy+p7vntL38js5ptYM3C/CBpXEbFSyovfb2a6l1+LtBWTFRN5KwvuGs72kdH/+7rqzTpDipDOXXa+zzjR4Jv8yvHjKuCxSsqjlLgAxRgCGiSoshh/US1tjIL5HpcqQo6YI3HoRROl5nqX5i609nBHuCkeMZ/3b4KcBoyUZBZWE0inSbPsD6J+GrBnszh8ebqnDV+DzF2xcxvyiuiDcuLU/SwIho0IQqA61cb9E0/cAbbztMzfdAE+KuPjSntjxLnr3UtzwOFCzVqAWXIDkf8xp56e3MKUzZXOJLRs+Y4u1UTW4sTMN+fY5iLqkYbTbGJzx4boQQUoKYMV96jmEGj9GGW7ztAB0KPkO/mI6VQBGv1Umq5r/MXK0Ec43EQcBQgcioJH06ARqExERM3nEM/d2BW99m2A+GN17EyH3KWLxV9enpp657y50nnwU4Y5a94Bww0gO0VEsr463ivZtnHlyWO8p2E5XaQijzPCXGrMfS7ePeUJNzCwoXthFBX0RJKo7lSpkYiegv5L+0XhGfxDE/liFz06vDQgsccpZE47n92serSiCgmA94Nape7D6MK3TmNjG5KKw82/YHIK2yBNfk2xOnjl4suaW6WeBT5A==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(7416014)(1800799024)(82310400026)(3023799007)(5023799004)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: TkpIvUY6LcaYe3q5X28T3b2QdX7zdtt9CCbOs1bPp18vYvuwKJVMtwpZMjccFaHpbsWc+F3Ce0wvbY3+vrGzlAQMrFfjyA9lbYx82bq4UY7ya5zFpJeePpBHMAF+PzMV3/iHzSJ9c/ECYSua19zVa4gJzx5f1QBnXxRqZL6u+RbJz2LqPDp/gNNGMSjJUE47WUBNru4cSF7yYAjHvgprmH/pMxYS1WESpPmq5LyazWYRU7hZQTLek3Pdq9mw/UIodhAor/zNgcZfLsF2YgSQga+TxyHinOSqTkFvHLYJgtYB8fekFu7G720uTNS7yl/1/ePhiBPII9bKQCrx5cdyKbk/Ko4kaXGkeLB/wn9OR6+fgA4daRUWM7mWCeoWNPTIErud/CaDxG/sGj8s5Up6DJgNMXPOJAKMP4HEqy9eK/vldm9wWQoDLM15upHcUFqI
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 07:43:01.0744
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8df89c79-7b6b-40bf-6d86-08dee244b26f
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6395
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_004324_035922_DFF79C6D 
X-CRM114-Status: GOOD (  19.14  )
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

Hi all,

Gentle ping on this patch series.

I understand everyone is busy, but would appreciate any feedback or
review comments when you have a moment.

On 5/21/2026 3:29 PM, Jun Guo wrote:
> This series updates DMA-350 support for the SKY1 integration where all
> DMA
> channel interrupt outputs are wired to the same GIC SPI.
> 
> Patch 1 enables DMANSECCTRL.INTREN_ANYCHINTR in the driver so
> per-channel
> interrupt status is propagated even when channels share one parent IRQ
> line.
> 
> Patch 2 adds the SKY1 DMA-350 DT node and describes the channel
> interrupt
> sources using 8 channel entries, while all entries map to the same SPI.
> 
> Tested on CIX SKY1 with dmatest:
>    % echo 2000 > /sys/module/dmatest/parameters/timeout
>    % echo 1 > /sys/module/dmatest/parameters/iterations
>    % echo "" > /sys/module/dmatest/parameters/channel
>    % echo 1 > /sys/module/dmatest/parameters/run
> 
> Changes in v7:
> - Modify the commit log format for the driver patch.
> 
> Changes in v6:
> - Drop the dt-binding update and keep the existing 8-channel interrupt
>   schema.
> - Simplify driver change to a minimal fix:
>   enable DMANSECCTRL.INTREN_ANYCHINTR.
> - Update SKY1 DT node to describe 8 channel interrupt entries mapped
>   to one SPI.
> 
> Changes in v5:
> - Fix the formatting issue in the AI tag.
> - Remove the unnecessary "cix,sky1-dma-350".
> 
> Changes in v4:
> - Reword binding text to align with kernel style.
> - Revise the AI attribution to the standard format.
> - Remove redundant links from the commit log.
> 
> Changes in v3:
> - Rework binding compatible description to match generic-first model.
> - Keep interrupts schema support for both 1-IRQ and 8-IRQ topologies.
> - Drop SoC match-data dependency for IRQ mode selection.
> - Detect IRQ topology via platform_irq_count() in probe path.
> - Refactor IRQ handling into a shared channel handler.
> - Enable DMANSECCTRL.INTREN_ANYCHINTR only in combined IRQ mode.
> 
> Changes in v2:
> - Update to kernel standards, enhance patch description, and refactor
>   driver to use match data for hardware differentiation instead of
>   compatible strings.
> 
> Jun Guo (2):
>    dmaengine: arm-dma350: enable ANYCH interrupt for shared IRQ wiring
>    arm64: dts: cix: add sky1 DMA-350 node with channel IRQ entries
> 
>   arch/arm64/boot/dts/cix/sky1.dtsi | 14 ++++++++++++++
>   drivers/dma/arm-dma350.c          |  9 +++++++++
>   2 files changed, 23 insertions(+)
> 


