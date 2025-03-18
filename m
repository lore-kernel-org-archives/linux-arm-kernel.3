Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E37C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 02:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uZ6X5VEjNJh4X/JwoR1oPC0UqYKtCk/4D89EcVP3XoI=; b=yQq4K3zBxYES+qrvJkE1B1VP/f
	wxxPg5g+2zSNl9TYOyCmeeMW/8k2vdd/QwvyxkN24u9uzPvWcFb4AATT55YIzd73JBGYgHYoqprug
	0IceSglAHNBR7MxeBXMN/9f0FsKBSTv37vWIuEaWR4bmapc6EsD5bql5ICHPKvZngBf9Aj6oZabZ6
	aTqyl3seB3Sjm8puZdi7pIYWShTZaPvV+jqcK6/p0q1m+yhZHnDsl/DK/ycnXk4ykLWvh9Cf7XjNN
	4mIZf6kwXII/ubVJC16vDDkZQo8Z0WtYlDt/eaKn4HgM7PE7mO4H91knOzyZSFpEmXWEwvUHSpIrq
	JWCvKYhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuMMu-00000004Q5Q-47mP;
	Tue, 18 Mar 2025 02:07:48 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuMLD-00000004Pvi-3zTZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 02:06:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3621EA48E4B;
	Tue, 18 Mar 2025 02:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF97DC4CEE3;
	Tue, 18 Mar 2025 02:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742263562;
	bh=BFd5y4dCY4Ff+fqcyWeon768yNTKhEyKUZxgJVN+Sdk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WyicySzusAnWspPQVmrJaNQnfrFX4Cc73KxxMdzEb7bmB04T1a+7rkp2R75pihYd8
	 NB0qHbLE2S+BtlnPtVk8UJeDyxJvZkwcz6Byspr4qD/xSgDSeyV+keJ4xmjixvuYh4
	 YVHixhvuyzVI3vuQ6AUWNwujUO3FsOTDFAP4+OHn1YYfA+oYmxl/K1owrfE/8XFNwA
	 V/FVU5gD8twtUFS3RwCa6vtXg/75Hu22+ipM/IVXtlAtN8w+ZA4sFm0vyY4QCZpbAb
	 LB++xWYqizbrpevR7isVbFLZw94WWOAgC9fJSXQv5tjNgevoWLB66CQZBCG5AAe3vg
	 BaRsJAnQRVzxA==
Date: Mon, 17 Mar 2025 19:06:00 -0700
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
Subject: Re: [PATCH 7/7] perf annotate-data: Handle the access to the
 'current' pointer on arm64
Message-ID: <Z9jVCFwf7Gbs6u22@google.com>
References: <20250314162137.528204-1-lihuafei1@huawei.com>
 <20250314162137.528204-8-lihuafei1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250314162137.528204-8-lihuafei1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_190604_120186_5827A512 
X-CRM114-Status: GOOD (  25.32  )
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

On Sat, Mar 15, 2025 at 12:21:37AM +0800, Li Huafei wrote:
> According to the implementation of the 'current' macro on ARM64, the
> sp_el0 register stores the pointer to the current task's task_struct.
> For example:
> 
>  mrs x1, sp_el0
>  ldr x2, [x1, #1896]

Same here.  It'd be great if you could share a real example where it
found the current for x1 in the second instruction.

> 
> We can infer that the ldr instruction is accessing a member of the
> task_struct structure at an offset of 1896. The key is to construct the
> data type for x1. The instruction 'mrs x1, sp_el0' belongs to the inline
> function get_current(). By finding the DIE of the inline function
> through its instruction address, and then obtaining the DIE for its
> return type, which should be 'struct task_struct *'. Then, we update the
> register state of x1 with this type information.
> 
> Signed-off-by: Li Huafei <lihuafei1@huawei.com>
> ---
>  tools/perf/arch/arm64/annotate/instructions.c | 71 +++++++++++++++----
>  1 file changed, 57 insertions(+), 14 deletions(-)
> 
> diff --git a/tools/perf/arch/arm64/annotate/instructions.c b/tools/perf/arch/arm64/annotate/instructions.c
> index f2053e7f60a8..c5a0a6381547 100644
> --- a/tools/perf/arch/arm64/annotate/instructions.c
> +++ b/tools/perf/arch/arm64/annotate/instructions.c
> @@ -263,6 +263,20 @@ update_insn_state_arm64(struct type_state *state, struct data_loc_info *dloc,
>  	Dwarf_Die type_die;
>  	int sreg, dreg;
>  	u32 insn_offset = dl->al.offset;
> +	static regex_t add_regex, mrs_regex;
> +	static bool regex_compiled;
> +
> +	if (!regex_compiled) {
> +		/*
> +		 * Matching the operand assembly syntax of the add instruction:
> +		 *
> +		 *  <Xd|SP>, <Xn|SP>, #<imm>
> +		 */
> +		regcomp(&add_regex, "^([xw][0-9]{1,2}|sp), ([xw][0-9]{1,2}|sp), #(0x[0-9a-f]+)",
> +			REG_EXTENDED);
> +		regcomp(&mrs_regex, "^(x[0-9]{1,2}), sp_el0", REG_EXTENDED);
> +		regex_compiled = true;
> +	}
>  
>  	/* Access global variables via PC relative addressing, for example:
>  	 *
> @@ -296,20 +310,6 @@ update_insn_state_arm64(struct type_state *state, struct data_loc_info *dloc,
>  		regmatch_t match[4];
>  		char *ops = strdup(dl->ops.raw);
>  		u64 offset;
> -		static regex_t add_regex;
> -		static bool regex_compiled;
> -
> -		/*
> -		 * Matching the operand assembly syntax of the add instruction:
> -		 *
> -		 *  <Xd|SP>, <Xn|SP>, #<imm>
> -		 */
> -		if (!regex_compiled) {
> -			regcomp(&add_regex,
> -				"^([xw][0-9]{1,2}|sp), ([xw][0-9]{1,2}|sp), #(0x[0-9a-f]+)",
> -				REG_EXTENDED);
> -			regex_compiled = true;
> -		}
>  
>  		if (!ops)
>  			return;
> @@ -351,6 +351,49 @@ update_insn_state_arm64(struct type_state *state, struct data_loc_info *dloc,
>  		return;
>  	}
>  
> +	if (!strncmp(dl->ins.name, "mrs", 3)) {

It should be kernel specific, you may want to add a check for it like
__map__is_kernel(dloc->ms->map).

Thanks,
Namhyung


> +		regmatch_t match[2];
> +		char *ops = strdup(dl->ops.raw);
> +		Dwarf_Die func_die;
> +		Dwarf_Attribute attr;
> +		u64 ip = dloc->ms->sym->start + dl->al.offset;
> +		u64 pc = map__rip_2objdump(dloc->ms->map, ip);
> +
> +		if (!ops)
> +			return;
> +
> +		if (regexec(&mrs_regex, dl->ops.raw, 2, match, 0))
> +			return;
> +
> +		ops[match[1].rm_eo] = '\0';
> +		sreg = get_arm64_regnum(ops + match[1].rm_so);
> +		if (sreg < 0 || !has_reg_type(state, sreg)) {
> +			free(ops);
> +			return;
> +		}
> +
> +		/*
> +		 * Find the inline function 'get_current()' Dwarf_Die and
> +		 * obtain its return value data type, which should be
> +		 * 'struct task_struct *'.
> +		 */
> +		if (!die_find_inlinefunc(cu_die, pc, &func_die) ||
> +		    !dwarf_attr_integrate(&func_die, DW_AT_type, &attr) ||
> +		    !dwarf_formref_die(&attr, &type_die)) {
> +			free(ops);
> +			return;
> +		}
> +
> +		tsr = &state->regs[sreg];
> +		tsr->type = type_die;
> +		tsr->kind = TSR_KIND_TYPE;
> +		tsr->ok = true;
> +
> +		pr_debug_dtp("mrs sp_el0 [%x] -> reg%d", insn_offset, sreg);
> +		free(ops);
> +		return;
> +	}
> +
>  	if (strncmp(dl->ins.name, "ld", 2))
>  		return;
>  
> -- 
> 2.25.1
> 

