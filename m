Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273A1C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 01:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EAdbp+TZYSsN4WWykxbH7LaT2eNRf5IppRbBiSob1Eg=; b=u9Q0XJ0u9Z+zDTGCyKc+QG30lF
	tBKyWjdhxcOT7uj08JSf+LHp5eGYmv7rqgPMS8BR3lv7FCInGzySarAq/IZMwyQMS+vW3H34k4dMi
	/zfOdnyGCuT9+GfTILP+yAIeV2Kdu+c5LuFYvuNkZZvWlszdnD5Jh+2cy+moyDkKxEMblsA9FOae1
	cjmTncnXfswdRX1fxAnBMJ8aIQfpPJXVrrY/kXMVBGsKsJS+3bfqysaUNKNh+AhP6MnpK1UJyHSsL
	FyhEk7kZrLU4eqsz92xoECvCRz7yAQ2kCdioHC0xct1jGX4j5QndkRtLaIs6W4GQ4ap/jd/2eQQmh
	vM2V87RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuLqh-00000004M89-2SCr;
	Tue, 18 Mar 2025 01:34:31 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuLp0-00000004Ltc-0z9T
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 01:32:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DC108A48E47;
	Tue, 18 Mar 2025 01:27:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 627C7C4CEE3;
	Tue, 18 Mar 2025 01:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742261565;
	bh=I4iPKp8yRcIiMxB58gWCtiaL8IYeA1sBlvQ8GEEr2ro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bz+WNGpy3DiqOcNSNNKSA8b38dxVYc3AKHHXKeGHvmFuRzrqfemSycGz7KKUSarTu
	 u/yEXl5UzRCGGcEZjurrDvFelS2yZHF0eGW1mjjPO61Pi39MW7RAruySMk4E95xlA+
	 fvMaJ9ZTWMeVjN2dJs9OZ0EcStk5etqcreSsdrL1CE/ff+lnK4k70cY2T/MwxZnU0B
	 ysNJlm+C1Xu91XE/hAQjiVNBQlKLMF26+SMreJsmd0gkwHC0LSVSCB9LDiv8a5zpqC
	 fSy5qnQ+yagTYcbh4n/WUdcxNg03iFQrumm6gfExut7KVL6YxkcIwcPhEBZq2NraBr
	 5lnxwxvYIX0hQ==
Date: Mon, 17 Mar 2025 18:32:42 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Li Huafei <lihuafei1@huawei.com>
Cc: acme@kernel.org, leo.yan@linux.dev, james.clark@linaro.org,
	mark.rutland@arm.com, john.g.garry@oracle.com, will@kernel.org,
	irogers@google.com, mike.leach@linaro.org, peterz@infradead.org,
	mingo@redhat.com, alexander.shishkin@linux.intel.com,
	jolsa@kernel.org, kjain@linux.ibm.com, mhiramat@kernel.org,
	atrajeev@linux.vnet.ibm.com, sesse@google.com,
	adrian.hunter@intel.com, kan.liang@linux.intel.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH 1/7] perf annotate: Handle arm64 load and store
 instructions
Message-ID: <Z9jNOgbZj_ZCx-9-@google.com>
References: <20250314162137.528204-1-lihuafei1@huawei.com>
 <20250314162137.528204-2-lihuafei1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250314162137.528204-2-lihuafei1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_183246_404755_230D8108 
X-CRM114-Status: GOOD (  27.01  )
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

On Sat, Mar 15, 2025 at 12:21:31AM +0800, Li Huafei wrote:
> Add ldst_ops to handle load and store instructions in order to parse
> the data types and offsets associated with PMU events for memory access
> instructions. There are many variants of load and store instructions in
> ARM64, making it difficult to match all of these instruction names
> completely. Therefore, only the instruction prefixes are matched. The
> prefix 'ld|st' covers most of the memory access instructions, 'cas|swp'
> matches atomic instructions, and 'prf' matches memory prefetch
> instructions.
> 
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
> +
> +	while (s > ops->raw && *s != ',')
> +		--s;
> +
> +	if (s == ops->raw)
> +		return -1;
> +
> +	*s = '\0';
> +	ops->source.raw = strdup(ops->raw);
> +
> +	*s = ',';
> +	if (!ops->source.raw)
> +		return -1;
> +
> +	ops->target.raw = strdup(target);
> +	if (!ops->target.raw) {
> +		zfree(ops->source.raw);

I think you need 'zfree(&ops->source.raw)' instead.


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

It seems we leak these on the success path.  Probably we need arch
annotate_exit() to free the resources.

Thanks,
Namhyung


>  out_free_arm:
> -- 
> 2.25.1
> 

