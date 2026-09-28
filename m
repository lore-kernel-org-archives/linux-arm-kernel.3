Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8463DCA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 13:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jHp9519IohKaGCfHrjMdY/AB+t1NZw5ShwPwUAdPWNk=; b=pc1SQycm+ukJzsW4zqnKHvFrB4
	diTeqXZF9BmNvH7jgAEj7c4lX5BFD895XfnoNXsS9F7sny5BEgdHlmd1U/hS/5251Z6U0ljySkKzN
	Y2fs67oT/yLDPWg71gRyZYLNcZuX088REGN2XY5auWO0r//B5p8IHM8c8tK/T1MFVZn2kIRdNxuHz
	Dz/C6CypLLoHd5myuRNrzSVVU0IWh2QI9MNLS/1umZTu0zkpG6vQW/xUkL6pK97Man8+AFmPyGh11
	r3P7imIQr9di6drt1FWdDkX7TvPKI4mQFFITdMVHfshFEuFCTIv/Tt1xQv5FGTfDOjUiiI0rbDb0v
	K+isG4AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBkJ-00000000hjH-1aN7;
	Mon, 28 Sep 2026 13:50:19 +0000
Received: from mail-westusazon11012016.outbound.protection.outlook.com ([52.101.43.16] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBkG-00000000hi7-18Gc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 13:50:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cRldP6btLhZT88eUhDmKGAfK5BfNM5lZXi0Tg5HAuIDLxVrzZTA9qdaub36/mMcnWNVmyfOgbSY88S4PiHe2RJHcDmzog2DKH2ZlUN7D1n7qm/MQqPaSknR4WfbSMwhYsCH+RFOrOUuQz19tzDvnFjOzWI0m1l82yEUpjfvm4TszzRYD/yUR+t7hntVgMaijqDQMtopfeJaFRIqYOWJkcSfVM6HRMpHzpbEWMqszcvMqy7Q1x8/mPqtbZABniQRa4/0Hvor6UklcsIxhzYQoqGys6bGl7/7rii+ZbC/kSnB+jaehhjfJQjKesRFI/i2w33tqRfjgjO0GW1yop7/ToA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jHp9519IohKaGCfHrjMdY/AB+t1NZw5ShwPwUAdPWNk=;
 b=cA8cjJMWQIgFBd+A8gUvBSqL2MhPdpWlumg7tHddzOKBHBSpbj57nlpa+WOcs+rM59WsFhQpd8urWos+ET8EzubDIn0GM+JNVoVU29nUTQFqKKwxGZTXpPFVTNX1I6AwBoZw01GBitmljFHXDJe7wiFyV2PMdY5xuVUGZATJyLNOmuHKoqx1Fc6n7PJx996GcV95Z7QY9XRyLwU5y9cZftwTf3ahrxAwzNAkfEqzi27EcmcXRo9ACU4guHLp1vW2y1LoTqhcL26yhCN7JiG52bdFB0ZucQ3Un8uJzcRNUeZiGgBgCIqheof41qKe4uXsn8SnYeReDX3GMUaJW5DaeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jHp9519IohKaGCfHrjMdY/AB+t1NZw5ShwPwUAdPWNk=;
 b=jZx8u3HFLf3Z/pmOioeRayNmyNQ3gGD/oPW2xd3+GXgXj2346QKM2yLjp72QAL9amkZDQsrUpZ04hamxiqx7FPWLH6olHiXEGDfkOU5scMBYcIzGa8maq2V7uISZIH6RiqCbUiqZAlmJ93XVTCUo4VVHFA9STiZn67KqAxD2jPmJH2AW6oYfkibQw06gnyjO7II1iOZGxS0eTj7Rhu61siKKqTufWQ5kKWgpdt7mCQFenr5PY5W0FBZDeHIkrzXUarvjjJuJTNeZFjnTtOlipTwKNZL6uMu0wxZO62TYLxQoLpmp1JdZ9eK2JhFufJAerbzQ69XxdWKkg7NQABw2uA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by LY0PR12MB967422.namprd12.prod.outlook.com
 (2603:10b6:408:3bc::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 13:50:09 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 13:50:09 +0000
Date: Mon, 28 Sep 2026 10:50:07 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Pranjal Shrivastava <praan@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, iommu@lists.linux.dev,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Will Deacon <will@kernel.org>, David Matlack <dmatlack@google.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>, stable@vger.kernel.org,
	Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Subject: Re: [PATCH v7 4/9] iommu/arm-smmu-v3: Optimize range invalidation
 for latency
Message-ID: <20260928135007.GA1616761@nvidia.com>
References: <0-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
 <4-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
 <arpohmaJTPEEI7mi@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arpohmaJTPEEI7mi@google.com>
X-ClientProxiedBy: SA1P222CA0039.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2d0::12) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|LY0PR12MB967422:EE_
X-MS-Office365-Filtering-Correlation-Id: 980cb7c0-86bb-4964-1bbc-08df1d6768fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|3023799007|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: OJFbD25See8QtHcjGZqD3GFRMnq2VFCeqroaRTXzsqyEgSto0s2APfMywRmMKt1DOFJoFk4uVuR1XGV4Nv4lpAEtBJQDkiqHj9d6cXdVCqqT8qKOCqDecRb585P7kODCinp7koo4ZgjjYkgtPpReiyrAPXcSOmmZtqfYUCxluewsKnyZVJjhDuC2czzhBqn3+Zkwa+7epAzPPdrUoKfI2SJajDuM7KxnHxD+g6sep6jzfV1Nv8moJ27ES77I4Griskq6KsMcHkf3pE73YCL3OIN3XrRJBHhB6UUY1OzY9ZYypg+VBMq1jStpRgstGCur6AI1Fk2WO+IBueU56dYd2bvTBH9u9uGx+7nhBpdCtbCTdGIw0Ze+Qpq3As13ZHzEGUT8H1gccQVemwBVF3ANYD+Dm0mFvS6oAJhNT3fT2TTs0D90bgLd9VygLiayJkaGSm6F3ceMU5vAbqeF82bVK8xbpuq3JtvC+Fikxhtb2qvuBdqdsxx+621c133Fa35gk6OpqA3FSOBoNNfEu1ZPgduU15qEKLG8UkLEhLa/e3JeY5Y5gky8YbWX5Se0kl7DKLgdQYkavwa1iLuzQYty9XD5UmTTg9pqtPTGnepxxID/R3LDEjsWoWJG0iGAKeLSfqKnRMjrUlWIfKTapomYqmvoIDgHSbg58waq0XCH4ZU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(3023799007)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9EVqllFw8CsWWaBNG4Zq6AsnGW0+zHLSGrkonoEymzdGP2OvW+X7CUnqgLW6?=
 =?us-ascii?Q?Wv8KjfFEThCrUyWAbLAi2uYTmZqgAMsEuxnPx0okGKfvt05TiS+ymM7WxBVM?=
 =?us-ascii?Q?xbSNaQicGRskMZ0XsS9KNdgiL3Kji/O17V3msri36t+Hejm76pDRQcV1LU/I?=
 =?us-ascii?Q?gWvwjS8XOHjI06T2ZJc4OzIxFzB10uYikCP6u1pqTLc0AzyEOlVLEXRvn+1Q?=
 =?us-ascii?Q?FvWrM+LVTE5oXvZEf7Cmo3Dws6rrehfgImdRXdsKCo8YbrsmpUi3Yy0/DjSM?=
 =?us-ascii?Q?xHAwPA1CXIeLSadytYNvw2XXHa0u9UzpnPyG7YV7VHg44EKUTX3ucYWSsXr+?=
 =?us-ascii?Q?xXkmCeLsNA+yrbF0ZusX+WEJoE5GzdUTYICa8i2WdMMAVXaLiJO3NcTRciwe?=
 =?us-ascii?Q?Wb2dQ6UY9VUsJ3eM3AhE9IHtPhXWIG489cY7DPN1DESVB0eIbdCp4ZwXsUip?=
 =?us-ascii?Q?8vtC5fiGGCbRVkIuxtTQpTAdwJCM76xchXWXjAvxVxxo3wXQn3JgW0XRS07p?=
 =?us-ascii?Q?YMBBcSdX/XknTmAzM3ncUM6cbzs3k4+Y5TmmRbHdDS3CqlbBbpcjzYN0jEXJ?=
 =?us-ascii?Q?a4hQldC+1xL8LuIUonhtvLhqaPd9NWLHoZJzC/EbHH1JifNDlXNdmDgkiPAY?=
 =?us-ascii?Q?jj4tofBpBBPPv3wbC02IPJ9+yQZx64EuGyvYB74lhS7NJfOGr73uiQoVXSzD?=
 =?us-ascii?Q?rCaErMHipU1x5sj69cPAA6A/jaqzOnELP9ieZEJ79eZvTsOqvI4MXwIGlzcV?=
 =?us-ascii?Q?YUK4CtDv8kOFViJ9pRTHE0n4BwNChW4on8pHOieZ89PrdiT0+rQiqfR/2v1P?=
 =?us-ascii?Q?tKYne3Qp90BB33OWkO9UMfTG2U9ywNwS16RnwZfWil4/7z2FiI23WyDf2jf5?=
 =?us-ascii?Q?52U79WQpXD7a0ya4PxVnGUxL3MkvcWAs0N0C60qXLBIPYUTgJy/HR+N2dQkl?=
 =?us-ascii?Q?Ocx+H36FHGtCNs+jBTEcRD6br/hk+86OyW58GU+pD98/sI6HcSUF4IfmP9z2?=
 =?us-ascii?Q?7nNJNATa9abioKaZVJrJ29CRwXgAnVLS7FWeEuQ/5Gzk1J6x19QFiHMtFG5N?=
 =?us-ascii?Q?7jRm/KhvtwHoM5SV8bz65whVLpnvOEYGibTBetav8u8KLkQtdvzpT4Cw9GM9?=
 =?us-ascii?Q?r1PBLm1k9J+u1uVDgsiQ4JlgXCwbmsPKmmL+5N0ymr/rREKkxiBtHKyvtMsW?=
 =?us-ascii?Q?Akt04nrTFnPNOpBzXMHKBRTzbUYdZWnxTH41nFhF60CqZnZrNkB/F0Sk1TbO?=
 =?us-ascii?Q?QjLKMGmqdZJRnCm3NWt77QrWVP7fS41LFklTVZoR2T9SIqMzJt8uCToMe2wZ?=
 =?us-ascii?Q?+Al6x4k8FOlSTehkM3IKy7q2je6fg11Pg/tg58ffX8RXmwpPKsm7qpj0Q84G?=
 =?us-ascii?Q?cyJJcczrcHGdySvQcpVPmqQ1/h7bHIpc/4MGYFfHVAU+0QhnPDR/WZ0BPryT?=
 =?us-ascii?Q?1z/XrjUc2JWoUXeKIuAdugRZ8C+jA3FGlvIHwOOUxJ7DNojAC+Bmd5d/KqAR?=
 =?us-ascii?Q?jWfpWCO+qK++L5pyE9+ZtoQod/oPR8WIQrZUUCySWN/s2UvbYA94DvM/r8du?=
 =?us-ascii?Q?PcfHfgHKwTihbQeFv4y+YVLAfuX06UIah1XvTktMfSzclWtGblL0+2zmHZ13?=
 =?us-ascii?Q?77ACPNzb94gn5ILMlawNqJO2AyJH3uobWAjjpg1atpHkqmcMwvWi1wFpftbo?=
 =?us-ascii?Q?AQ4NFxbbW1hBP+6HqzEZD5bWqkjDc83EoDoRQwchciO8UeuH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 980cb7c0-86bb-4964-1bbc-08df1d6768fa
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 13:50:09.0807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fvriXLRIHu5cX2B/HHh2mUCOIF501OA0DzYzH87TWJRm4rj88n4vEkU53pRnYnf2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LY0PR12MB967422
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_065016_321596_EE97E88C 
X-CRM114-Status: GOOD (  22.56  )
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

On Mon, Sep 28, 2026 at 01:15:50PM +0000, Pranjal Shrivastava wrote:
> > -/* Used by non INV_TYPE_ATS* invalidations */
> > -static void arm_smmu_inv_to_cmdq_batch(struct arm_smmu_inv *inv,
> > +/*
> > + * One TLBI command per IOTLB entry, assuming the entries are all at least
> > + * iopte_granule sized. Returns false if too many commands would be needed which
> > + * indicates too high a latency. The threshold is similar to MAX_DVM_OPS in
> > + * arch/arm64/include/asm/tlbflush.h for the 4k PAGE_SIZE.
> > + */
> > +static bool arm_smmu_cmdq_batch_add_single(struct arm_smmu_device *smmu,
> > +					   struct arm_smmu_cmdq_batch *cmds,
> > +					   struct arm_smmu_cmd *cmd,
> > +					   struct arm_smmu_tlbi *tlbi)
> > +{
> > +	unsigned long num_ops = tlbi->size / tlbi->iopte_size;
> > +	unsigned long iova = tlbi->iova;
> > +	unsigned long i;
> > +
> > +	if (!num_ops || num_ops > 512)
> > +		return false;
> > +
> 
> Should this be ">= 512"? The old arm_smmu_inv_size_too_big() and
> arm64's __flush_tlb_range_limit_excess() both fall back to a full
> invalidation at exactly 512:
> 
>         return pages >= (MAX_DVM_OPS * stride) >> PAGE_SHIFT;
> 
> 512 is what a walk flush could generate. For example, when 
> __arm_lpae_unmap() frees a last-level table on a 4K granule,
> it calls io_pgtable_tlb_flush_walk(iova, SZ_2M, SZ_4K), hence,
> num_ops == 512.
> 
> Before this patch that was a single TLBI_NH_ASID/TLBI_S12_VMALL, now
> it becomes 512 VA TLBIs + CMD_SYNC for every 2M table freed on a
> non-RIL SMMU. The same check carries into arm_smmu_tlbi_calc_single()
> later in the series.

I had set it deliberately like that so that a table flush would issue
singles. That is largely based around the feedback from before that we
shouldn't over invalidate.

We've been insensitive to that issue in the past, and I'm going to
argue the >= of today's code is a bug as it effectively made alot of
iopgtable actions turn into new full invalidations, while originally
they were range bound singles.

So I view this choice as a return to the historical behavior before we
started to fix the soft lockup issues. I guess it crept it during one
of the refactorings where we merged the SVA limitation into the main
flow.

Granted I didn't notice this detail that the current code was 511 not
512, I will add a remark to the commit message:

     The end result is any gather is converted into either:
      - One invalidate all
      - One or two range invalidation operations
      - At most 512 single invalidation ops
	The current code switches at 511, but this turns every table removal
	into a full invalidation. Change to 512 to try to minimize the amount
	of full invalidation.

Thanks,
Jason

