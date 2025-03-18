Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 073A7C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 18:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ccuvJ9L+tpTHaiSa+bTPK+9dkfygxMsvRIBrl4/cDzY=; b=evoCDZVhm4URfIJ4fe5FIeM/mD
	CfD2HbkdL0WZv6k7M2X7yjCnDxyr0q9tBVJRadoQT/yM8virSs5x8hbTkePpe00afZPaA5pK6wKkn
	GBcUpdaxhS7rJma4c1/fTNYIfFAWPgbZd9oWB6li6Em4Owr8i7Bj/5KWKBdghy5EpPjX262PedG6l
	xV2DP/CFPn7sAyEDf6AN2LquXOZQavFPV5PtW7ak1CgQrr35a6B0bRCTajT6UeRsSF28iQSdnFMP6
	u7C34RFwF2fsmU9wcro3BMPiGTfBqBhA99mEpMrJ9gNl3lB5hKWpqt8p+JB/NhI5TQp+PJJVT5eNz
	ICoHbYNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tubL3-00000006lJ8-2RDj;
	Tue, 18 Mar 2025 18:06:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tubH5-00000006kd7-40et
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 18:02:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E8D2B13D5;
	Tue, 18 Mar 2025 11:02:52 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1715E3F694;
	Tue, 18 Mar 2025 11:02:44 -0700 (PDT)
Date: Tue, 18 Mar 2025 18:02:40 +0000
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
Subject: Re: [PATCH 2/7] perf annotate: Advance the mem_ref check to
 mov__parse()
Message-ID: <20250318180240.GB2860028@e132581.arm.com>
References: <20250314162137.528204-1-lihuafei1@huawei.com>
 <20250314162137.528204-3-lihuafei1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314162137.528204-3-lihuafei1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_110248_083073_742BA703 
X-CRM114-Status: GOOD (  19.98  )
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

On Sat, Mar 15, 2025 at 12:21:32AM +0800, Li Huafei wrote:
> Advance the mem_ref check on x86 to mov__parse(), along with the
> multi_reg check, to make annotate_get_insn_location() more concise.
> 
> Signed-off-by: Li Huafei <lihuafei1@huawei.com>
> ---
>  tools/perf/util/annotate.c | 9 ++++-----
>  tools/perf/util/disasm.c   | 8 ++++++++
>  2 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
> index 31bb326b07a6..860ea6c72411 100644
> --- a/tools/perf/util/annotate.c
> +++ b/tools/perf/util/annotate.c
> @@ -2442,18 +2442,17 @@ int annotate_get_insn_location(struct arch *arch, struct disasm_line *dl,
>  				continue;
>  		}
>  
> +		op_loc->mem_ref = mem_ref;
> +		op_loc->multi_regs = multi_regs;
> +
>  		/*
>  		 * For powerpc, call get_powerpc_regs function which extracts the
>  		 * required fields for op_loc, ie reg1, reg2, offset from the
>  		 * raw instruction.
>  		 */
>  		if (arch__is(arch, "powerpc")) {
> -			op_loc->mem_ref = mem_ref;
> -			op_loc->multi_regs = multi_regs;
>  			get_powerpc_regs(dl->raw.raw_insn, !i, op_loc);
> -		} else if (strchr(insn_str, arch->objdump.memory_ref_char)) {
> -			op_loc->mem_ref = true;
> -			op_loc->multi_regs = multi_regs;
> +		} else if (mem_ref) {
>  			extract_reg_offset(arch, insn_str, op_loc);
>  		} else {
>  			char *s, *p = NULL;
> diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
> index 50c5c206b70e..d91526cff9df 100644
> --- a/tools/perf/util/disasm.c
> +++ b/tools/perf/util/disasm.c
> @@ -607,6 +607,12 @@ static bool check_multi_regs(struct arch *arch, const char *op)
>  	return count > 1;
>  }
>  
> +/* Check whether the operand accesses memory. */
> +static bool check_memory_ref(struct arch *arch, const char *op)
> +{
> +	return strchr(op, arch->objdump.memory_ref_char) != NULL;
> +}

This patch looks fine for me.

However, I did not find the 'memory_ref_char' field is set for Arm64.
Later patches even remove the condition checking for mem_ref() and
unconditionally invoke extract_reg_offset().

This is a logic change for me.  Shouldn't the register offset be
extracted only for memory access instructions?


>  static int mov__parse(struct arch *arch, struct ins_operands *ops, struct map_symbol *ms __maybe_unused,
>  		struct disasm_line *dl __maybe_unused)
>  {
> @@ -635,6 +641,7 @@ static int mov__parse(struct arch *arch, struct ins_operands *ops, struct map_sy
>  	if (ops->source.raw == NULL)
>  		return -1;
>  
> +	ops->source.mem_ref = check_memory_ref(arch, ops->source.raw);
>  	ops->source.multi_regs = check_multi_regs(arch, ops->source.raw);
>  
>  	target = skip_spaces(++s);
> @@ -657,6 +664,7 @@ static int mov__parse(struct arch *arch, struct ins_operands *ops, struct map_sy
>  	if (ops->target.raw == NULL)
>  		goto out_free_source;
>  
> +	ops->target.mem_ref = check_memory_ref(arch, ops->target.raw);
>  	ops->target.multi_regs = check_multi_regs(arch, ops->target.raw);
>  
>  	if (comment == NULL)
> 
> -- 
> 2.25.1
> 

