Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEEC6C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 02:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JLk8prjpNSpBh+WPOd8jAtgD23sqQHTuWjnOt6sSmHI=; b=0WWejmvZ3pVzi2jvlyMazzosTd
	fON4yyqFTF3Peubp1ipgT1yeRqkcBcVNS0Oq9KAYlWSt/R4fEa3z16ajT10za0i6Om1+daRyN7GJe
	woUheaW+4F0cT3nkZnNOHt9+kG7NqlNcfaZNRBVxWe/KMxLt1iUB3lVnv9Z2q2IsRgYIwJoV5h7nc
	wJgFjptUArfUEn//4uNDBUyNrIxX/2v+dczq6KjjSq9mOsSucQc5TxrdnibysGI8oLdNi5Yh4hP68
	M1b56zlfUpwp8lra/x9XXwmIX96qwp32cMZj+m8VzjGqk43Hj86cQ02TD/bDgMjh0ij0d9AFSwn8T
	tU+VeNgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuMI6-00000004Pb6-0LnP;
	Tue, 18 Mar 2025 02:02:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuMGO-00000004PPs-23cE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 02:01:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C70C95C5450;
	Tue, 18 Mar 2025 01:58:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ACECC4CEE3;
	Tue, 18 Mar 2025 02:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742263263;
	bh=MWRHRY/KicIe1xNDW3dbQ8Vzru7zkxfpt/pE9dHmM2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GBq1ZUFRib5mLBwAmD7VkKcic50/2prf4zdxZDOLEw0nV8FHBRE6bJSyL1ml0+XHc
	 TFlm4KGdFTpVgA19kqhR1bNG8gaA1djf1xjF3m2PLQkSE/A55Bkfq92vNVe4nbMj//
	 sAEaePZInj4FMeDKPPzGxwMI1B3nBTZMzVOZ8nZNaXtX/d0FIVhZ40OlJviTFIQISB
	 NTNVXi1F2VhdyhS51g/7gCup3QbCEY3bRI6k2MuZmZdGprXIGQ5Z2M1Uqpx8AbI0Jd
	 +Mcf5Z/ug+lhgu+TZFGAuybY/y8BDMvHl9bkJQ+zWrMKj0jRJMmLaQ/khTEIbVoIWB
	 xAOnP2ogPAzkQ==
Date: Mon, 17 Mar 2025 19:01:01 -0700
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
Subject: Re: [PATCH 6/7] perf annotate-data: Handle arm64 global variable
 access
Message-ID: <Z9jT3e2j8HDMLcYh@google.com>
References: <20250314162137.528204-1-lihuafei1@huawei.com>
 <20250314162137.528204-7-lihuafei1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250314162137.528204-7-lihuafei1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_190104_607770_728B7DD0 
X-CRM114-Status: GOOD (  28.91  )
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

On Sat, Mar 15, 2025 at 12:21:36AM +0800, Li Huafei wrote:
> Arm64 uses the 'adrp' and 'add' instructions to load the address of a
> global variable. For example:
> 
>  adrp    x19, ffff8000819c3000
>  add     x19, x19, #0x3e8
>  <<after some sequence>>
>  ldr     x22, [x19, #8]

You can try perf annotate --stdio --code-with-type and see if it finds a
correct type.  It'd be nice if you include the result in the commit log.

> 
> Here, 'adrp' retrieves the base address of the page where the global
> variable is located, and 'add' adds the offset within the page. If PMU
> sampling occurs at the instruction 'ldr x22, [x19, #8]', we need to
> trace the preceding 'adrp' and 'add' instructions to obtain the status
> information of x19.
> 
> A new register status type 'TSR_KIND_GLOBAL_ADDR' is introduced,
> indicating that the register holds the address of a global variable, and
> this address is also stored in the 'type_state_reg' structure. After
> obtaining the status information of x19, we use
> get_global_var_type() to search for a matching global variable and
> verify whether the returned offset is equal to 8. If it is, then we have
> identified the data type and offset of the accessed global variable.
> 
> Signed-off-by: Li Huafei <lihuafei1@huawei.com>
> ---
>  tools/perf/arch/arm64/annotate/instructions.c | 90 ++++++++++++++++++-
>  tools/perf/util/annotate-data.c               | 20 +++++
>  tools/perf/util/annotate-data.h               |  2 +
>  3 files changed, 111 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/perf/arch/arm64/annotate/instructions.c b/tools/perf/arch/arm64/annotate/instructions.c
> index f70d93001fe7..f2053e7f60a8 100644
> --- a/tools/perf/arch/arm64/annotate/instructions.c
> +++ b/tools/perf/arch/arm64/annotate/instructions.c
> @@ -262,6 +262,94 @@ update_insn_state_arm64(struct type_state *state, struct data_loc_info *dloc,
>  	struct type_state_reg *tsr;
>  	Dwarf_Die type_die;
>  	int sreg, dreg;
> +	u32 insn_offset = dl->al.offset;
> +
> +	/* Access global variables via PC relative addressing, for example:
> +	 *
> +	 *  adrp    x19, ffff800082074000
> +	 *  add     x19, x19, #0x380
> +	 *
> +	 * The adrp instruction locates the page base address, and the add
> +	 * instruction adds the offset within the page.
> +	 */
> +	if (!strncmp(dl->ins.name, "adrp", 4)) {
> +		sreg = get_arm64_regnum(dl->ops.source.raw);
> +		if (sreg < 0 || !has_reg_type(state, sreg))
> +			return;
> +
> +		tsr = &state->regs[sreg];
> +		tsr->ok = true;
> +		tsr->kind = TSR_KIND_GLOBAL_ADDR;
> +		/*
> +		 * The default arm64_mov_ops has already parsed the adrp
> +		 * instruction and saved the target address.
> +		 */
> +		tsr->addr = dl->ops.target.addr;
> +
> +		pr_debug_dtp("adrp [%x] global addr=%#"PRIx64" -> reg%d\n",
> +			     insn_offset, tsr->addr, sreg);
> +		return;
> +	}
> +
> +	/* Add the offset within the page. */
> +	if (!strncmp(dl->ins.name, "add", 3)) {
> +		regmatch_t match[4];
> +		char *ops = strdup(dl->ops.raw);
> +		u64 offset;
> +		static regex_t add_regex;
> +		static bool regex_compiled;
> +
> +		/*
> +		 * Matching the operand assembly syntax of the add instruction:
> +		 *
> +		 *  <Xd|SP>, <Xn|SP>, #<imm>
> +		 */
> +		if (!regex_compiled) {
> +			regcomp(&add_regex,
> +				"^([xw][0-9]{1,2}|sp), ([xw][0-9]{1,2}|sp), #(0x[0-9a-f]+)",
> +				REG_EXTENDED);
> +			regex_compiled = true;

Similarly you could put it in the arch and free later.

Thanks.
Namhyung


> +		}
> +
> +		if (!ops)
> +			return;
> +
> +		if (regexec(&add_regex, dl->ops.raw, 4, match, 0))
> +			return;
> +
> +		/*
> +		 * Parse the source register first. If it is not of the type
> +		 * TSR_KIND_GLOBAL_ADDR, further parsing is not required.
> +		 */
> +		ops[match[2].rm_eo] = '\0';
> +		sreg = get_arm64_regnum(ops + match[2].rm_so);
> +		if (sreg < 0 || !has_reg_type(state, sreg) ||
> +		    state->regs[sreg].kind != TSR_KIND_GLOBAL_ADDR) {
> +			free(ops);
> +			return;
> +		}
> +
> +		ops[match[1].rm_eo] = '\0';
> +		dreg = get_arm64_regnum(ops + match[1].rm_so);
> +		if (dreg < 0 || !has_reg_type(state, dreg)) {
> +			free(ops);
> +			return;
> +		}
> +
> +		ops[match[3].rm_eo] = '\0';
> +		offset = strtoul(ops + match[3].rm_so, NULL, 16);
> +
> +		tsr = &state->regs[dreg];
> +		tsr->ok = true;
> +		tsr->kind = TSR_KIND_GLOBAL_ADDR;
> +		tsr->addr = state->regs[sreg].addr + offset;
> +
> +		pr_debug_dtp("add [%x] global addr=%#"PRIx64"(reg%d) -> reg%d\n",
> +			     insn_offset, tsr->addr, sreg, dreg);
> +
> +		free(ops);
> +		return;
> +	}
>  
>  	if (strncmp(dl->ins.name, "ld", 2))
>  		return;
> @@ -287,7 +375,7 @@ update_insn_state_arm64(struct type_state *state, struct data_loc_info *dloc,
>  		tsr->ok = true;
>  
>  		pr_debug_dtp("load [%x] %#x(reg%d) -> reg%d",
> -			     (u32)dl->al.offset, dst->offset, dreg, sreg);
> +			     insn_offset, dst->offset, dreg, sreg);
>  		pr_debug_type_name(&tsr->type, tsr->kind);
>  	}
>  }
> diff --git a/tools/perf/util/annotate-data.c b/tools/perf/util/annotate-data.c
> index 2bc8d646eedc..aaca08bb9097 100644
> --- a/tools/perf/util/annotate-data.c
> +++ b/tools/perf/util/annotate-data.c
> @@ -65,6 +65,9 @@ void pr_debug_type_name(Dwarf_Die *die, enum type_state_kind kind)
>  	case TSR_KIND_CANARY:
>  		pr_info(" stack canary\n");
>  		return;
> +	case TSR_KIND_GLOBAL_ADDR:
> +		pr_info(" global address\n");
> +		return;
>  	case TSR_KIND_TYPE:
>  	default:
>  		break;
> @@ -1087,6 +1090,23 @@ static enum type_match_result check_matching_type(struct type_state *state,
>  		return PERF_TMR_OK;
>  	}
>  
> +	if (state->regs[reg].kind == TSR_KIND_GLOBAL_ADDR) {
> +		int var_offset;
> +		u64 var_addr;
> +
> +		pr_debug_dtp("global var by address");
> +
> +		var_addr = state->regs[reg].addr + dloc->op->offset;
> +
> +		if (get_global_var_type(cu_die, dloc, dloc->ip, var_addr,
> +					&var_offset, type_die)) {
> +			dloc->type_offset = var_offset;
> +			return PERF_TMR_OK;
> +		}
> +
> +		return PERF_TMR_BAIL_OUT;
> +	}
> +
>  	if (state->regs[reg].kind == TSR_KIND_CANARY) {
>  		pr_debug_dtp("stack canary");
>  
> diff --git a/tools/perf/util/annotate-data.h b/tools/perf/util/annotate-data.h
> index 717f394eb8f1..e3e877313207 100644
> --- a/tools/perf/util/annotate-data.h
> +++ b/tools/perf/util/annotate-data.h
> @@ -36,6 +36,7 @@ enum type_state_kind {
>  	TSR_KIND_CONST,
>  	TSR_KIND_POINTER,
>  	TSR_KIND_CANARY,
> +	TSR_KIND_GLOBAL_ADDR,
>  };
>  
>  /**
> @@ -177,6 +178,7 @@ struct type_state_reg {
>  	bool caller_saved;
>  	u8 kind;
>  	u8 copied_from;
> +	u64 addr;
>  };
>  
>  /* Type information in a stack location, dynamically allocated */
> -- 
> 2.25.1
> 

