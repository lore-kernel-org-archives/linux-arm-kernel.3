Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA12ECD342F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 18:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tQNbw8dPNxA48BBpwPexyVVlCSlk5PVV8XXJwl8AVEw=; b=2gtz9qiOj7oziMMEBhK6RcnGqT
	TqvAD7D2guVC7/j6YxVqNxXP8jGoBfy9t3XnlzqzaZCX9t+2/+I6NgkI2pfkUoTfT1FLcSvUK3CR1
	SY7x8PS47Ow8zYkfglV4GPnBjjy3V2i8PqbqMtzVulHvdtcdgnJXY+gZ8OwkCFi/j+gC6M2R/zxaF
	9IAbh3OA0FD2rO0kzUduepXJj1gVgMVx5gsdot49QbACksKXnks7YfVoHX848yEnylieUrKy9bv3f
	6IEFEXuzj9DWixBXgjSc6uf3qSY+veLvZYSATF3TFFbkD2nnLA4ESua/gLc/9KRclImxSwLgiytMP
	1Wn0qkEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJFBc-00000009HvB-0Yz1;
	Wed, 12 Nov 2025 18:03:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJFBZ-00000009HuN-3L4p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 18:03:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 734B71515;
	Wed, 12 Nov 2025 10:03:04 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B6E673F63F;
	Wed, 12 Nov 2025 10:03:11 -0800 (PST)
Date: Wed, 12 Nov 2025 18:03:09 +0000
From: Leo Yan <leo.yan@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 18/25] perf/uapi: Extend data source fields
Message-ID: <20251112180309.GA3243746@e132581.arm.com>
References: <20251017-perf_support_arm_spev1-3-v2-0-2d41e4746e1b@arm.com>
 <20251017-perf_support_arm_spev1-3-v2-18-2d41e4746e1b@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017-perf_support_arm_spev1-3-v2-18-2d41e4746e1b@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_100313_973452_3F9F4747 
X-CRM114-Status: GOOD (  20.19  )
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

Hi Peter.Z, Ingo,

On Fri, Oct 17, 2025 at 11:05:07AM +0100, Leo Yan wrote:
> Arm CPUs introduce several new types of memory operations, like MTE tag
> accessing, system register access for nested virtualization, memcpy &
> memset, and Guarded Control Stack (GCS).

Do you mind review this patch for extending memory data source field?

Thanks,
Leo

> For memory operation details, Arm SPE provides information like data
> (parallel) processing, floating-point, predicated, atomic, exclusive,
> acquire/release, gather/scatter, and conditional.
> 
> This commit introduces a field 'mem_op_ext' for extended operation type.
> The extended operation type can be combined with the existed operation
> type to express a memory type, for examples, a PERF_MEM_OP_GCS type can
> be set along with PERF_MEM_OP_LOAD to present a load operation for
> GCS register access.
> 
> Bit fields are also added to represent detailed operation attributes.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  include/uapi/linux/perf_event.h | 32 ++++++++++++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
> index 78a362b8002776e5ce83a0d7816601638c61ecc6..9b9fa59fd828756b5e8e93520da5a269f0dfff52 100644
> --- a/include/uapi/linux/perf_event.h
> +++ b/include/uapi/linux/perf_event.h
> @@ -1309,14 +1309,32 @@ union perf_mem_data_src {
>  			mem_snoopx  :  2, /* Snoop mode, ext */
>  			mem_blk     :  3, /* Access blocked */
>  			mem_hops    :  3, /* Hop level */
> -			mem_rsvd    : 18;
> +			mem_op_ext  :  4, /* Extended type of opcode */
> +			mem_dp      :  1, /* Data processing */
> +			mem_fp      :  1, /* Floating-point */
> +			mem_pred    :  1, /* Predicated */
> +			mem_atomic  :  1, /* Atomic operation */
> +			mem_excl    :  1, /* Exclusive */
> +			mem_ar      :  1, /* Acquire/release */
> +			mem_sg      :  1, /* Scatter/Gather */
> +			mem_cond    :  1, /* Conditional */
> +			mem_rsvd    :  6;
>  	};
>  };
>  #elif defined(__BIG_ENDIAN_BITFIELD)
>  union perf_mem_data_src {
>  	__u64 val;
>  	struct {
> -		__u64	mem_rsvd    : 18,
> +		__u64	mem_rsvd    :  6,
> +			mem_cond    :  1, /* Conditional */
> +			mem_sg      :  1, /* Scatter/Gather */
> +			mem_ar      :  1, /* Acquire/release */
> +			mem_excl    :  1, /* Exclusive */
> +			mem_atomic  :  1, /* Atomic operation */
> +			mem_pred    :  1, /* Predicated */
> +			mem_fp      :  1, /* Floating-point */
> +			mem_dp      :  1, /* Data processing */
> +			mem_op_ext  :  4, /* Extended type of opcode */
>  			mem_hops    :  3, /* Hop level */
>  			mem_blk     :  3, /* Access blocked */
>  			mem_snoopx  :  2, /* Snoop mode, ext */
> @@ -1426,6 +1444,16 @@ union perf_mem_data_src {
>  /* 5-7 available */
>  #define PERF_MEM_HOPS_SHIFT			43
>  
> +/* Extended type of memory opcode: */
> +#define PERF_MEM_EXT_OP_NA			0x0    /* Not available */
> +#define PERF_MEM_EXT_OP_MTE_TAG			0x1    /* MTE tag */
> +#define PERF_MEM_EXT_OP_NESTED_VIRT		0x2    /* Nested virtualization */
> +#define PERF_MEM_EXT_OP_MEMCPY			0x3    /* Memory copy */
> +#define PERF_MEM_EXT_OP_MEMSET			0x4    /* Memory set */
> +#define PERF_MEM_EXT_OP_SIMD			0x5    /* SIMD */
> +#define PERF_MEM_EXT_OP_GCS			0x6    /* Guarded Control Stack */
> +#define PERF_MEM_EXT_OP_SHIFT			46
> +
>  #define PERF_MEM_S(a, s) \
>  	(((__u64)PERF_MEM_##a##_##s) << PERF_MEM_##a##_SHIFT)
>  
> 
> -- 
> 2.34.1
> 

