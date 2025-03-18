Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF3FC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 17:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2MNs0cdBY9zIg/KEv1bZR2T/kB5zy4h4OTL0rpYmXjk=; b=KJxcFXulGhG1xhXW5o5wAwvbng
	IG1ZI2ZDTvpDewaNxjPwb3Iu/PQgn4xBuxB2iA8D48guQ5stONPxZ1FUXC1F03jqEf0r+0SujawNv
	vYwczlYKNWXSNTma9DcdfdFS2hdtFwMnY2Gp9QKyc8gFEuH7HyyM68Rs2r3tBt/qEZh/Khmb9YoRA
	mfMVv4lM+w30c6ya1O+pZxJ5AGpc5SWy/JU4h3MGng11opSBzEDmCFKJytLkqcLj/5wVpkzyStlQm
	VOeLyG4dJRJ/NdqmhLZzHUnOKwWBBc8SkQCxO/nmx04wXGpF+GGPb2nYgOY4+sFdhySBJxiazZRXi
	pZv/fN7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuaZa-00000006eaG-2I8O;
	Tue, 18 Mar 2025 17:17:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuaXt-00000006eFb-39Nx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 17:16:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31080113E;
	Tue, 18 Mar 2025 10:16:11 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 51F8E3F673;
	Tue, 18 Mar 2025 10:16:02 -0700 (PDT)
Date: Tue, 18 Mar 2025 17:15:57 +0000
From: Leo Yan <leo.yan@arm.com>
To: Li Huafei <lihuafei1@huawei.com>
Cc: namhyung@kernel.org, acme@kernel.org, leo.yan@linux.dev,
	james.clark@linaro.org, mark.rutland@arm.com,
	john.g.garry@oracle.com, will@kernel.org, irogers@google.com,
	mike.leach@linaro.org, peterz@infradead.org, mingo@redhat.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	kjain@linux.ibm.com, mhiramat@kernel.org,
	atrajeev@linux.vnet.ibm.com, sesse@google.com,
	adrian.hunter@intel.com, kan.liang@linux.intel.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH 1/7] perf annotate: Handle arm64 load and store
 instructions
Message-ID: <20250318171557.GA2860028@e132581.arm.com>
References: <20250314162137.528204-1-lihuafei1@huawei.com>
 <20250314162137.528204-2-lihuafei1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314162137.528204-2-lihuafei1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_101605_865993_AED0A64E 
X-CRM114-Status: GOOD (  30.19  )
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

Hi Huafei,

On Sat, Mar 15, 2025 at 12:21:31AM +0800, Li Huafei wrote:
> Add ldst_ops to handle load and store instructions in order to parse
> the data types and offsets associated with PMU events for memory access
> instructions. There are many variants of load and store instructions in
> ARM64, making it difficult to match all of these instruction names
> completely. Therefore, only the instruction prefixes are matched. The
> prefix 'ld|st' covers most of the memory access instructions, 'cas|swp'
> matches atomic instructions, and 'prf' matches memory prefetch
> instructions.

Thanks a lot for working on this!

> Signed-off-by: Li Huafei <lihuafei1@huawei.com>
> ---
>  tools/perf/arch/arm64/annotate/instructions.c | 67 ++++++++++++++++++-
>  1 file changed, 66 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/perf/arch/arm64/annotate/instructions.c b/tools/perf/arch/arm64/annotate/instructions.c
> index d465d093e7eb..c212eb7341bd 100644
> --- a/tools/perf/arch/arm64/annotate/instructions.c
> +++ b/tools/perf/arch/arm64/annotate/instructions.c
> @@ -6,7 +6,8 @@
>  
>  struct arm64_annotate {
>  	regex_t call_insn,
> -		jump_insn;
> +		jump_insn,
> +		ldst_insn; /* load and store instruction */
>
>  };
>  
>  static int arm64_mov__parse(struct arch *arch __maybe_unused,
> @@ -67,6 +68,57 @@ static struct ins_ops arm64_mov_ops = {
>  	.scnprintf = mov__scnprintf,
>  };
>  
> +static int arm64_ldst__parse(struct arch *arch __maybe_unused,
> +			     struct ins_operands *ops,
> +			     struct map_symbol *ms __maybe_unused,
> +			     struct disasm_line *dl __maybe_unused)
> +{
> +	char *s, *target;
> +
> +	/*
> +	 * The part starting from the memory access annotation '[' is parsed
> +	 * as 'target', while the part before it is parsed as 'source'.
> +	 */
> +	target = s = strchr(ops->raw, '[');
> +	if (!s)
> +		return -1;

I am wandering if this is sufficient for handling different load /
store instructions.

A simple case is an instruction "ldr x1, [x2]", the handling above
should can work well.  How about instructions below with offsets:

    ldr     x2, [x0, #968]
    ldr     w3, [x25], #4

Could you also confirm if the parsing can fit the pattern for
load/store pair instructions?

    ldp     x29, x30, [sp], #16

The instruction loads paired 64-bit data into two registers.

> +	while (s > ops->raw && *s != ',')
> +		--s;
> +
> +	if (s == ops->raw)
> +		return -1;
> +
> +	*s = '\0';
> +	ops->source.raw = strdup(ops->raw);
>
> +
> +	*s = ',';
> +	if (!ops->source.raw)
> +		return -1;
> +
> +	ops->target.raw = strdup(target);
> +	if (!ops->target.raw) {
> +		zfree(ops->source.raw);
> +		return -1;
> +	}
> +	ops->target.mem_ref = true;
> +
> +	return 0;
> +}
> +
> +static int ldst__scnprintf(struct ins *ins, char *bf, size_t size,
> +			   struct ins_operands *ops, int max_ins_name)
> +{
> +	return scnprintf(bf, size, "%-*s %s,%s", max_ins_name, ins->name,
> +			 ops->source.name ?: ops->source.raw,
> +			 ops->target.name ?: ops->target.raw);
> +}
> +
> +static struct ins_ops arm64_ldst_ops = {
> +	.parse	   = arm64_ldst__parse,
> +	.scnprintf = ldst__scnprintf,
> +};
> +
>  static struct ins_ops *arm64__associate_instruction_ops(struct arch *arch, const char *name)
>  {
>  	struct arm64_annotate *arm = arch->priv;
> @@ -77,6 +129,8 @@ static struct ins_ops *arm64__associate_instruction_ops(struct arch *arch, const
>  		ops = &jump_ops;
>  	else if (!regexec(&arm->call_insn, name, 2, match, 0))
>  		ops = &call_ops;
> +	else if (!regexec(&arm->ldst_insn, name, 2, match, 0))
> +		ops = &arm64_ldst_ops;
>  	else if (!strcmp(name, "ret"))
>  		ops = &ret_ops;
>  	else
> @@ -107,6 +161,15 @@ static int arm64__annotate_init(struct arch *arch, char *cpuid __maybe_unused)
>  		      REG_EXTENDED);
>  	if (err)
>  		goto out_free_call;
> +	/*
> +	 * The ARM64 architecture has many variants of load/store instructions.
> +	 * It is quite challenging to match all of them completely. Here, we
> +	 * only match the prefixes of these instructions.
> +	 */
> +	err = regcomp(&arm->ldst_insn, "^(ld|st|cas|prf|swp)",
> +		      REG_EXTENDED);

As a first step, it is fine for me to support these memory types.

After I review the whole series, I might go back to check if we can
support other memory instructions (e.g. SVE, Memory Copy and
Memory Set instructions, etc).  At least, we need to avoid any
barriers for extending these instructions.

Thanks,
Leo

> +	if (err)
> +		goto out_free_jump;
>  
>  	arch->initialized = true;
>  	arch->priv	  = arm;
> @@ -117,6 +180,8 @@ static int arm64__annotate_init(struct arch *arch, char *cpuid __maybe_unused)
>  	arch->e_flags = 0;
>  	return 0;
>  
> +out_free_jump:
> +	regfree(&arm->jump_insn);
>  out_free_call:
>  	regfree(&arm->call_insn);
>  out_free_arm:
> 
> -- 
> 2.25.1
> 

