Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C2BCD73E9B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 22:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YE8gHiaenTfvj7n1GmQKqMzEk5M/t5rZ9K0cTxBkxuc=; b=i5wfsXoj4QJFfIivCuOZgUanDI
	yqaZ2zPEzfHlaBbnwzzaBpsTkjExgC1ZYKvKVwiaSEZZ35YuOBPCsRaUz77tmTxw06csfOZRvEEox
	6+swAhPaJoEA9JQyEP0N5mZ72zYhqhSOd8l1lfhtxRt/PtfiJByyq+4H71HNZH8Fg+GRtR84LTh53
	t+KWCbZa7GC5+GWX4Ldt0ZZLH4O4chppe+36L7C+spxTBREL8Ns3BZnyW6qaIIUqNcyaeZ+yMyDJb
	tLJrLwz8Uq1C1u2sxAfiNoFFz0EIuWI/hvPfjbDjFn8jYdw9oW01RGWvj3CXMwYOBsU/OQHwb59aT
	MhxOR9BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlagm-00000000kZD-26FS;
	Thu, 29 Jan 2026 22:40:36 +0000
Received: from mail-westusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c000::1] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlagk-00000000kYr-2MYh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 22:40:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pHQOUHzHJzfCadHMCTwyOPcAN1JLJVFdwZHy2ne0l3jchRcvCmJMpIxcNE2BcNT6a7idYCDbFaUjXn53X9SY1ekod5Tjd+WWi2DsWVvOat9YZdEmBqWwdto1ZMGkixmk1QVkulqE0a9rEJqT2hvqqnYl3b7N5B63AYsN0+10uEw86O/NXwWCt9Q+4KoQAE/gvyBufxXBQmmc2hLS8Gz9id9zg8WNKAkqzyKBDfgAdmoaJlK3/+I+s2RTV3m6Dn8Zkq7LF17+or5TMgWcK8288Evpbi/mae+EgR9yabysMwW9MYFp21RFHKgPrbh50rMhqxeqZpVrJY2ye1gb+hNIdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YE8gHiaenTfvj7n1GmQKqMzEk5M/t5rZ9K0cTxBkxuc=;
 b=yIYsZQ6Ad8SF2hpXpzONbDiuY95+IcJw3l1lrHQr+/w9h0vpBQUzryyTLD9FXLw6Z5dI8mMDZ4tgOEv6JYtfsEQCMm0EcEpbmehMt1yhYgm0JXKlOQ40BIFuFqa2BgQxYZySL3NxBDFkhyCM59huB8GBI6Iu3kzjFOaxqoiJnyrRxI5W9bof8Ue3y/wqkskvQI3IhudN0qjRLzAOhhxoWPF5H51oybsR2QofJ42PbmquhoKM6L5Arkwnj82T1AYl9EqwfbyUhLZ6yEtcqdaxrMSrrl055IWquoAcz1t5JfttRw6UIRJ4ugZQNn4LCFj1vERGHEhCKnBJrK6uVNBk8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YE8gHiaenTfvj7n1GmQKqMzEk5M/t5rZ9K0cTxBkxuc=;
 b=t/klimN/a0F63Y6mOXxhHTTDEcAM5AyxqKhrMD+r+FdPS2h/rW6O0WaERM8IvOTAiIbHfhNALdjxfnn5h8J6xVltEGka6dtdfewqhVfv1R+iDaT9tVYakmn3yyzT+m4/a8KYbmlBhRjOcYT5FTLrzJIudnI8D/Vj2A0lBxVOi/0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from MW4PR01MB6228.prod.exchangelabs.com (2603:10b6:303:76::7) by
 SA1PR01MB994090.prod.exchangelabs.com (2603:10b6:806:4ac::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.7; Thu, 29 Jan 2026 22:40:26 +0000
Received: from MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::86f5:4db2:7ad5:7fc4]) by MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::86f5:4db2:7ad5:7fc4%6]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 22:40:26 +0000
Date: Thu, 29 Jan 2026 14:40:24 -0800 (PST)
From: Ilkka Koskinen <ilkka@os.amperecomputing.com>
To: Besar Wicaksono <bwicaksono@nvidia.com>
cc: will@kernel.org, suzuki.poulose@arm.com, robin.murphy@arm.com, 
    ilkka@os.amperecomputing.com, linux-arm-kernel@lists.infradead.org, 
    linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
    mark.rutland@arm.com, treding@nvidia.com, jonathanh@nvidia.com, 
    vsethi@nvidia.com, rwiley@nvidia.com, sdonthineni@nvidia.com, 
    skelley@nvidia.com, ywan@nvidia.com, mochs@nvidia.com, nirmoyd@nvidia.com
Subject: Re: [PATCH 5/8] perf/arm_cspmu: nvidia: Add Tegra410 PCIE-TGT PMU
In-Reply-To: <20260126181155.2776097-6-bwicaksono@nvidia.com>
Message-ID: <409515ed-61bc-2cd5-ea9b-e9f246884c6e@os.amperecomputing.com>
References: <20260126181155.2776097-1-bwicaksono@nvidia.com> <20260126181155.2776097-6-bwicaksono@nvidia.com>
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-ClientProxiedBy: MW4PR03CA0223.namprd03.prod.outlook.com
 (2603:10b6:303:b9::18) To MW4PR01MB6228.prod.exchangelabs.com
 (2603:10b6:303:76::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR01MB6228:EE_|SA1PR01MB994090:EE_
X-MS-Office365-Filtering-Correlation-Id: b95085ab-e070-4fed-92ee-08de5f87658e
X-LD-Processed: 3bc2b170-fd94-476d-b0ce-4229bdc904a7,ExtAddr
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RL3jILM7epA/rdkbHv7qoRD814YT75HYiFL6eAjkZV3QdPKdNMwAoh6b8MS0?=
 =?us-ascii?Q?0AmMsBhI1GEqM/jEXFAqKJVPDbit1GYJ/dNcyVXQADLA8n62LAJbb+yzwj39?=
 =?us-ascii?Q?IHn788emNSltT9fXUqySHo+LbPPWR7fEOZSiWmt1VGKc5YYs0JDdD2kIL5vN?=
 =?us-ascii?Q?IwXe8X8/rF1zQBKNNwm2Qf0pgCTO32p4SeMw1iu8cAa7EpOR0VMXatn4596s?=
 =?us-ascii?Q?uYTsAwGrACkwKWR609T911i4NG22SguUQEEALOzprool6rdzU49FxHcNTuHf?=
 =?us-ascii?Q?/yxR0fPas/gTGSgqwlBRzn9cBZ+hKM82xd2hs8hy5wKphT0dIctxHnmSSOdo?=
 =?us-ascii?Q?hp4xce5NFcpntvlu3T8BtunRlrb8ME343TZX5R45SBA93VdLv0pfas5XH838?=
 =?us-ascii?Q?F5Av3p2P9XA4O8IeFNn6sGKPAjCSGLXbSRBRONeS5ZYiiTXYbHdW3vQt5oB0?=
 =?us-ascii?Q?C8428denitxbvxq6312hAn7HGRbeT776FqDPDMELkBDzH+pAm/8jsUbDaZjV?=
 =?us-ascii?Q?xzbYoOvul34eHIKb2el7wmkZbhsYJjFQEMGk2ouAfmUAqec9t+NLZaAJOuDN?=
 =?us-ascii?Q?7raTK7Sl+9obSOEdspENNJblYNgnAqH4AJz/FN4rws3OIKjdQ9nyA2CuqLdb?=
 =?us-ascii?Q?Dhpv3XheArsIwuqqWcSL3D1kQAedNe46moT3p10zKNLck9ta6f19PflaAuuH?=
 =?us-ascii?Q?1bP4u3KacXOZGqyRL6pUYAb18D4bTsraj+WX7Yr8+OYK7zEdrZUmnzimb92/?=
 =?us-ascii?Q?0VE0qUMiHC/plKxA4cI9PbTLqNAu59htxtBgjLeDuIJab2fYHhB9b5ClvOmO?=
 =?us-ascii?Q?TP1Dq12U03+GCPd1kKRXYxRH342ke52Xxk3ta7TGS3UWsC/mC1gkZ8nTXxGk?=
 =?us-ascii?Q?x/dPYPkYFFI/UQ0vRvzKLzb6KxdWARZ8JUkHnireoCof01nvKiIR4f6l8L8/?=
 =?us-ascii?Q?mhoabBOj+JhIVr6qzUa65SWI5vIjdTkp5jXpIQH4YCe/ph+FbTX+tcFmTuTC?=
 =?us-ascii?Q?GlhrRhPFlZohE+/USYH11Xv/wETt2IWy/I+QigF2rvbKRZE/gmOZAwBUMTPN?=
 =?us-ascii?Q?UunNJrWV/lIN+OfJHRZ2QS57hDc6kcIpTuzGu/qlenYRZrLtHHSZiiQsmqOn?=
 =?us-ascii?Q?tPljuVqmaQsb0O0SKeawQ6rR/FlpA2AF7tVXqyimXKfPmwcaFwgZeyveiCXO?=
 =?us-ascii?Q?PcM05fttLkBQB1csawIcdSdoiokvK8x/D/ApglKo2nnHLRBtQSWhr6POCC4Q?=
 =?us-ascii?Q?g3EYkfpNCINd2xnFyF/2oKBupYCNqh/YbFGMWFZGy/Nt1ltnzCAvC8PM6JWa?=
 =?us-ascii?Q?YAlPVeQcKBLSkzNhvQkHoy/jhI60lYgye0JCQWTFyAox8GpWbRRZRoJQ+xwx?=
 =?us-ascii?Q?b7C64kP7Lsqt1VMRHM6rQ1g/VkLjmkbXBqgtGCAvg1ZBWruS4xNccIvQH0U1?=
 =?us-ascii?Q?lCKWjvyJQY/3oyHximdU9Qzmf5B0sjSAxrOsNy2yg0IHE4qjcPr2jma2kQ15?=
 =?us-ascii?Q?RdIlIQjuSDWL+sCMvKr0X+H6pKME3iARHp8kV9yjf887ffYFW7vbsG8abcvf?=
 =?us-ascii?Q?HmIWZ7QU7dQLBCCHWPo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR01MB6228.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o1RuAkrN9eM5XYqLajZtvRLFkHk06j8KFIGqtw7PXWoOTD+VNZMGn/g8REh2?=
 =?us-ascii?Q?4c+l4Q69hKKc96uI59Wx1d44EUeGa1mnJzig/7Ewj2MJNDkYPUwNh+R1S6H3?=
 =?us-ascii?Q?IWusbmYRitr8eJz1mQVn9f93sT0GAgCMPYV4DEZtVccll42YfiU7J2ihO5vQ?=
 =?us-ascii?Q?YyLhX+jR2oNpUr/inVmZ1zvlSS3nZEAj3jZNXXi22CxW2zhuVqjZoNPtKe/d?=
 =?us-ascii?Q?Ys3+YocCl9ByPlfV32h0urV80xXrTrIrNlx1UENH6CSdKSeaEA5yKCHtSM11?=
 =?us-ascii?Q?4PJ+HMSdOBYTKTvfBjQhqqfQHERpi56TevZi9kUJRpwtVBNNWwY+pen5QAYk?=
 =?us-ascii?Q?SIJBBO9g980ddwhBx09ilG/ptXdNeO2+Vffyin36FkDbmHT88xIlyIrHg8ks?=
 =?us-ascii?Q?TSjw/iH+jCJWVX+A3X3pDDkAzjMhy39wfRCue3Bm3Sr/eaJsEd+BepTUiyOf?=
 =?us-ascii?Q?Ebf1vf4e7kNTZkIdQficWp7cGK5pc75P9m2Ppcuxh0ugnZCwLLyT7Nb7Bddm?=
 =?us-ascii?Q?BBFSU9/BDlgCXQ7Slscc0rFEUEz/JkoxBJKncu5aTNn1FX+yY2QyNXAShit2?=
 =?us-ascii?Q?bbYe1B2GqRk55SFRzeZkbtvkOZsyj+VnT/+2ocUM9ZNoAV1DKS7HJnWvnbz2?=
 =?us-ascii?Q?nFeTfU2hwafnr9oOUXQJraRmXEURnOXLX2/WWow08mtkME747lxGyxZgXFrB?=
 =?us-ascii?Q?E+MkXEW/1HY827umwot0S44G9svMZ5gGqtaz4FYW5lE+CrGPBq7PJlrRcKuO?=
 =?us-ascii?Q?ug0R/FS7id3CSEqi/8Jb0SjxWIlv8+ECPDsn0xZzDh9liB+fy8FUgON3ILlK?=
 =?us-ascii?Q?vdq2Ckz6DzgeLZOGVepPeSX8spYykXYHrBJlcFbVN51lk+fAIdmRxuwY1BH8?=
 =?us-ascii?Q?26gidCA8l05B1w8bYM5TTPaZqUiYh+S5e6uhaTgt010bGANVI/B6uRq0z4xI?=
 =?us-ascii?Q?1VePyCtkeUbMPhRkSVMk36BNY8kv1Gj9Yi9E3OCN8rwrPLKWsggqIMd2Hdg7?=
 =?us-ascii?Q?iayF3RQF2bQiG1WwTT4+xyZphlwAI+D4gfaVeb2IFojizvkFRLvjpbi38Qex?=
 =?us-ascii?Q?dFzAXkx2f27w5ehwc9UVvC4i6HW21YGK7ZNXiP+arGf050b2KyUxgHuhOGN4?=
 =?us-ascii?Q?hpYl/Ph7Lq6FGVPP05bd1qpfLKd0zEQ5+R64JVdpq/AFhqQ1WVLPgLZ2/GQy?=
 =?us-ascii?Q?KVFlw+g2BqsP0DaBGrL5cE9NVVEmWP7MVPw9sAVQNHapov1HgIgx4DowLlNc?=
 =?us-ascii?Q?8jtO9c5T6FEzf82pT+2Xg3RJFbQ0YSxkaU4GqhEl6ZknnNPYojU635HVW5lK?=
 =?us-ascii?Q?b5Svfk2wMDKFLdBbXaXgw6mg8lSlCQyGonRygLeu+/4LoxTRrKyhzgvCtLmf?=
 =?us-ascii?Q?4O5/lY8D4MmXkMne88mScMCPhhHkBAHMZGv/zdYVWTsh0ibGWPr8hAqHwLMf?=
 =?us-ascii?Q?wQg5+pLktujrdXSn1VVaax9yfQlLnx3/lD9/9pnPga6Gv3DIGG5xF3h63Wbm?=
 =?us-ascii?Q?v7tGtmBJXRNB+SIFB/L1Ikdrm0hdmpdl7CapIuB6SCyGjKNQQiIxjYJFbBYq?=
 =?us-ascii?Q?Ak+bl4tPuFRBhAlLOM1xqhI6SnnrQmfccDReI0LUNS3YQZKlmWCqUIZAXZeE?=
 =?us-ascii?Q?Ega+4HFKlt5G1YIedUKPhtL1pylyNNbrI+/HYVwoIAQdx5xLNQXnlkREUnXR?=
 =?us-ascii?Q?eu3ZL0RH7WbTQPlrqGNC/lPDtv1rYUCKSw7+2V/e2Th7zsLYlwgv5Va2LgAE?=
 =?us-ascii?Q?fguk50s1TZYex0xSY65JG/7AUaD1TY0=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b95085ab-e070-4fed-92ee-08de5f87658e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR01MB6228.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 22:40:26.3204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uo3+tL3o7ZPBNZknuQgrQJ0I09ozUdy5eTZbKrzmcx8sEufTD+TpTDYul6/E4IKDHTo8CtJ5P93VJtBUbAJt+f4aJmcDHsjyuKomrN1jJCbfD9aJocJFeKyyDbb8tvY0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB994090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_144034_626393_E46AB01D 
X-CRM114-Status: GOOD (  13.47  )
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


Hi Besar,

On Mon, 26 Jan 2026, Besar Wicaksono wrote:
> Adds PCIE-TGT PMU support in Tegra410 SOC.
>
> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
> ---
> .../admin-guide/perf/nvidia-tegra410-pmu.rst  |  76 ++++
> drivers/perf/arm_cspmu/nvidia_cspmu.c         | 324 ++++++++++++++++++
> 2 files changed, 400 insertions(+)
>
> diff --git a/drivers/perf/arm_cspmu/nvidia_cspmu.c b/drivers/perf/arm_cspmu/nvidia_cspmu.c
> index 3a5531d1f94c..095d2f322c6f 100644
> --- a/drivers/perf/arm_cspmu/nvidia_cspmu.c
> +++ b/drivers/perf/arm_cspmu/nvidia_cspmu.c

<snip>

> +static void pcie_tgt_pmu_reset_ev_filter(struct arm_cspmu *cspmu,
> +				     const struct perf_event *event)
> +{
> +	bool addr_filter_en;
> +	u64 base, mask;
> +	int idx;
> +
> +	addr_filter_en = pcie_tgt_pmu_addr_en(event);
> +	if (!addr_filter_en)
> +		return;
> +
> +	base = pcie_tgt_pmu_dst_addr_base(event);
> +	mask = pcie_tgt_pmu_dst_addr_mask(event);
> +	idx = pcie_tgt_find_addr_idx(cspmu, base, mask, true);
> +
> +	if (idx < 0) {
> +		dev_err(cspmu->dev,
> +			"Unable to find the address filter slot to reset\n");
> +		return;
> +	}
> +
> +	pcie_tgt_pmu_config_addr_filter(
> +			cspmu, false, base, mask, idx);

I think you can fit the arguments in the same line with the function name

Otherwise, looks good to me.

 	Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>

Cheers, Ilkka



