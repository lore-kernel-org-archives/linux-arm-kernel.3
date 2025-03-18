Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C3FC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 01:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NkVlqtierIKyR7pALOw/dVeL18PvCCdb4Enw5ncQfmk=; b=vBbclsPSkZTilbrLZOiUFa5BVg
	WysnC6HP9Ywt9Ipyw+WJbRJUVY56xw6jWzGaJ/XhNlXQ6ZrRu1ANDpTNX30NtNKa+Lcjw09Hb20UN
	G2OdH3SgrX/e6LkivlzHhKILlKnC0kltXznHY0oyUm7DQ06EbAcfxqQ6HFmN/CNlSDRhIBWeFcOhC
	SeOF2v++vWuZ3OkpF9zspFMEQtYPaQzSWZKbdCk2AZyQYBdZBcdF6k/0jIi1sWZdCEKvHus9LyfMj
	FsbeSDggJDbcuGdQgPACJYNK4N5G4CdbU3I2picfkHKIUninwyisPVC14F+H+cBxDACFv+wvsKiN4
	vt/po4vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuM9A-00000004Obq-1fUd;
	Tue, 18 Mar 2025 01:53:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuM7U-00000004OSg-0Js9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 01:51:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5C7EC5C56F3;
	Tue, 18 Mar 2025 01:49:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34E47C4CEE3;
	Tue, 18 Mar 2025 01:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742262711;
	bh=G23mUapcKGI0bq5I23W+bVxIi2SUfa9ELELg6EDzo7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UhwdCBNVmArLhOku75QhRPkOI7QN7I+Ll8ui4Zt4yq2YSEYOORmcOyIpo/QLRgc75
	 UZllW+VVGrcLwTNoK1HswqMaVdGE+7Xs1AZ8gEiTDoCOPP4uttALf9hDwxxyBEaOkR
	 N8/OJeBkFFm3mclyrh8bvlXEN+N5OypSs6n+HpZ96mmdb4frW293e97sHgAwyENCH1
	 slp3MKn/dqf9YosCD+BIiFJbrK+yOYe2l+azIb2oPYc68Vr8KoUvW9cT6ih/jDlkvF
	 dsQZUgl3ZAAh7zoQEQKAOsvfEHiRSs3r7yKWb4k9FCmF+JJyILB3KEZfErlUcHRlfF
	 sDDeRIYTtHWnQ==
Date: Mon, 17 Mar 2025 18:51:48 -0700
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
Subject: Re: [PATCH 5/7] perf annotate-data: Support instruction tracking for
 arm64
Message-ID: <Z9jRtDJY-RjiyFer@google.com>
References: <20250314162137.528204-1-lihuafei1@huawei.com>
 <20250314162137.528204-6-lihuafei1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250314162137.528204-6-lihuafei1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_185152_193146_FE387694 
X-CRM114-Status: GOOD (  31.02  )
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

On Sat, Mar 15, 2025 at 12:21:35AM +0800, Li Huafei wrote:
> Support for arm64 instruction tracing. This patch addresses the scenario
> where type information cannot be found during multi-level pointer
> references. For example, consider the vfs_ioctl() function:
> 
>  long vfs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  {
>      int error = -ENOTTY;
> 
>      if (!filp->f_op->unlocked_ioctl)
>          goto out;
> 
>      error = filp->f_op->unlocked_ioctl(filp, cmd, arg);
>      if (error == -ENOIOCTLCMD)
>          error = -ENOTTY;
>  out:
>      return error;
>  }
> 
> The 'SYSCALL_DEFINE3(ioctl)' inlines vfs_ioctl, and the assembly
> instructions for 'if (!filp->f_op->unlocked_ioctl)' are as follows:
> 
>  ldr     x0, [x21, #16]
>  ldr     x3, [x0, #80]
>  cbz     x3, ffff80008048e9a4
> 
> The first instruction loads the 'filp->f_op' pointer, and the second
> instruction loads the 'filp->f_op->unlocked_ioctl' pointer. DWARF
> generates type information for x21, but not for x0. Therefore, if
> PMU sampling occurs on the second instruction, the corresponding data
> type cannot be obtained. However, by using the type information and
> offset from x21 in the first ldr instruction, we can infer the type
> of x0 and, combined with the offset, resolve the accessed data member.
> 
> Signed-off-by: Li Huafei <lihuafei1@huawei.com>
> ---
>  tools/perf/arch/arm64/annotate/instructions.c | 44 ++++++++++++++++++-
>  tools/perf/util/annotate-data.c               |  3 +-
>  tools/perf/util/annotate-data.h               |  2 +-
>  tools/perf/util/disasm.c                      |  3 ++
>  4 files changed, 49 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/perf/arch/arm64/annotate/instructions.c b/tools/perf/arch/arm64/annotate/instructions.c
> index 54497b72a5c5..f70d93001fe7 100644
> --- a/tools/perf/arch/arm64/annotate/instructions.c
> +++ b/tools/perf/arch/arm64/annotate/instructions.c
> @@ -215,7 +215,8 @@ extract_reg_offset_arm64(struct arch *arch __maybe_unused,
>  	static bool regex_compiled;
>  
>  	if (!regex_compiled) {
> -		regcomp(&reg_off_regex, "^\\[(sp|[xw][0-9]{1,2})(, #(-?[0-9]+))?\\].*",
> +		regcomp(&reg_off_regex,
> +			"^\\[(sp|[xw][0-9]{1,2})(, #(-?[0-9]+))?\\].*",

Does it have any real changes?  If not I'd rather leave it or move the
change to the original commit.


>  			REG_EXTENDED);
>  		regex_compiled = true;
>  	}
> @@ -250,3 +251,44 @@ extract_reg_offset_arm64(struct arch *arch __maybe_unused,
>  	free(str);
>  	return 0;
>  }
> +
> +#ifdef HAVE_LIBDW_SUPPORT
> +static void
> +update_insn_state_arm64(struct type_state *state, struct data_loc_info *dloc,
> +			Dwarf_Die * cu_die __maybe_unused, struct disasm_line *dl)
> +{
> +	struct annotated_insn_loc loc;
> +	struct annotated_op_loc *dst = &loc.ops[INSN_OP_TARGET];
> +	struct type_state_reg *tsr;
> +	Dwarf_Die type_die;
> +	int sreg, dreg;
> +
> +	if (strncmp(dl->ins.name, "ld", 2))
> +		return;
> +
> +	if (annotate_get_insn_location(dloc->arch, dl, &loc) < 0)
> +		return;
> +
> +	sreg = get_arm64_regnum(dl->ops.source.raw);
> +	if (sreg < 0)
> +		return;
> +	if (!has_reg_type(state, sreg))
> +		return;

It'd be better to invalidate state of the target register even if it
failed to get the information of source register and its state.  The
destination would be updated anyway and keeping the stale state would
result in an invalid report at the end.

Thanks,
Namhyung

> +
> +	dreg = dst->reg1;
> +	if (has_reg_type(state, dreg) && state->regs[dreg].ok &&
> +	    state->regs[dreg].kind == TSR_KIND_TYPE &&
> +	    dwarf_tag(&state->regs[dreg].type) == DW_TAG_pointer_type &&
> +	    die_deref_ptr_type(&state->regs[dreg].type,
> +			       dst->offset, &type_die)) {
> +		tsr = &state->regs[sreg];
> +		tsr->type = type_die;
> +		tsr->kind = TSR_KIND_TYPE;
> +		tsr->ok = true;
> +
> +		pr_debug_dtp("load [%x] %#x(reg%d) -> reg%d",
> +			     (u32)dl->al.offset, dst->offset, dreg, sreg);
> +		pr_debug_type_name(&tsr->type, tsr->kind);
> +	}
> +}
> +#endif
> diff --git a/tools/perf/util/annotate-data.c b/tools/perf/util/annotate-data.c
> index 976abedca09e..2bc8d646eedc 100644
> --- a/tools/perf/util/annotate-data.c
> +++ b/tools/perf/util/annotate-data.c
> @@ -1293,7 +1293,8 @@ static enum type_match_result find_data_type_insn(struct data_loc_info *dloc,
>  
>  static int arch_supports_insn_tracking(struct data_loc_info *dloc)
>  {
> -	if ((arch__is(dloc->arch, "x86")) || (arch__is(dloc->arch, "powerpc")))
> +	if ((arch__is(dloc->arch, "x86")) || (arch__is(dloc->arch, "powerpc")) ||
> +	    (arch__is(dloc->arch, "arm64")))
>  		return 1;
>  	return 0;
>  }
> diff --git a/tools/perf/util/annotate-data.h b/tools/perf/util/annotate-data.h
> index 98c80b2268dd..717f394eb8f1 100644
> --- a/tools/perf/util/annotate-data.h
> +++ b/tools/perf/util/annotate-data.h
> @@ -190,7 +190,7 @@ struct type_state_stack {
>  };
>  
>  /* FIXME: This should be arch-dependent */
> -#ifdef __powerpc__
> +#if defined(__powerpc__) || defined(__aarch64__)
>  #define TYPE_STATE_MAX_REGS  32
>  #else
>  #define TYPE_STATE_MAX_REGS  16
> diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
> index 1035c60a8545..540981c155f9 100644
> --- a/tools/perf/util/disasm.c
> +++ b/tools/perf/util/disasm.c
> @@ -129,6 +129,9 @@ static struct arch architectures[] = {
>  		.name = "arm64",
>  		.init = arm64__annotate_init,
>  		.extract_reg_offset = extract_reg_offset_arm64,
> +#ifdef HAVE_LIBDW_SUPPORT
> +		.update_insn_state = update_insn_state_arm64,
> +#endif
>  	},
>  	{
>  		.name = "csky",
> -- 
> 2.25.1
> 

