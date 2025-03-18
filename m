Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43C7C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 01:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j4cBPK4ena+tDgrt8jA5+VF0CN7M4GUhQaItB+ywGWE=; b=BKZ05RfvGX5mVGMKpuKlitdgEd
	oLO8m2KGCDR7gn5zDCUkVg58sA2ItW2/o4bloIOkhgf4y/PxVVd2p+2SXgw1dnHi2mEOYzfwPCVXX
	Mtzo0qP7Enu+CrczW5HQdkDMYNb8Hzx3sxx2D6MuMqeQzbWF87YiIDBXHvnUUN9E5T6IBZR8TF4qG
	VwfLOV9l5x7UphwXv2bVNWTWREUNfZJibHi2iqeTbbKmqqM/JNw43p0j0U7RIxuj36N3eoj2qmWfy
	t31GFnZgX5hb2ZoYzYLRD4mPnSkpJZ6k36JLM6+6HkzGaA4AGplaJWZsGaQG2fLKsdW5LcSNxT65Z
	oMaGkgNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuM3F-00000004Nmg-3I9F;
	Tue, 18 Mar 2025 01:47:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuM1Z-00000004NWy-1W8j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 01:45:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F05795C4BA8;
	Tue, 18 Mar 2025 01:43:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C30DEC4CEE3;
	Tue, 18 Mar 2025 01:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742262344;
	bh=iTtWsr/6ltpPt3N2bnmqcM9CSEjqwqOSpAeEa/CHmpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GvRu7j1WMaZE1ElFhX6GlGwashLUeChbjmHIS/czxWlSumDEJLWHtRn0bIGOYjxmG
	 YYJ+g6NTDsNKFxwimCiQILS6Rel+8pVaaqA5SEAUkoV0tFb2KPKhq/8zqom2ZNGWMP
	 rYiXk1lrlWq8E3XNIHM5DBzWuPYOyvIo9Bf8baTucvnziwQNKub1r6de+sQyux4XDd
	 zBwIrmzD9CJ3VyYe7BP0HFqk39BztkKSufC92hdiVMxqKjyAxFaDvy7+COT/HX0Lox
	 6uahOcmn+XGWSFJ/06FslC1A53QUQ2f/IMA/kcOGrYSu5tVUBmd3KPt5LXXtY8KvVE
	 QhRDe15H9MOyQ==
Date: Mon, 17 Mar 2025 18:45:42 -0700
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
Subject: Re: [PATCH 4/7] perf annotate: Support for the 'extract_reg_offset'
 callback function in arm64
Message-ID: <Z9jQRl9mMpBhfc4q@google.com>
References: <20250314162137.528204-1-lihuafei1@huawei.com>
 <20250314162137.528204-5-lihuafei1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250314162137.528204-5-lihuafei1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_184545_483135_216E0AAD 
X-CRM114-Status: GOOD (  30.81  )
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

On Sat, Mar 15, 2025 at 12:21:34AM +0800, Li Huafei wrote:
> At present, only the following two addressing modes are supported:
> 
>  1. Base register only (no offset): [base{, #0}]
>  2. Base plus offset (immediate): [base{, #imm}]
> 
> For addressing modes where the offset needs to be calculated from the
> register value, it is difficult to know the specific value of the offset
> register, making it impossible to calculate the offset.
> 
> Signed-off-by: Li Huafei <lihuafei1@huawei.com>
> ---
>  tools/perf/arch/arm64/annotate/instructions.c | 62 +++++++++++++++++++
>  tools/perf/util/Build                         |  1 +
>  tools/perf/util/disasm.c                      |  1 +
>  tools/perf/util/dwarf-regs-arm64.c            | 25 ++++++++
>  tools/perf/util/include/dwarf-regs.h          |  7 +++
>  5 files changed, 96 insertions(+)
>  create mode 100644 tools/perf/util/dwarf-regs-arm64.c
> 
> diff --git a/tools/perf/arch/arm64/annotate/instructions.c b/tools/perf/arch/arm64/annotate/instructions.c
> index c212eb7341bd..54497b72a5c5 100644
> --- a/tools/perf/arch/arm64/annotate/instructions.c
> +++ b/tools/perf/arch/arm64/annotate/instructions.c
> @@ -188,3 +188,65 @@ static int arm64__annotate_init(struct arch *arch, char *cpuid __maybe_unused)
>  	free(arm);
>  	return SYMBOL_ANNOTATE_ERRNO__ARCH_INIT_REGEXP;
>  }
> +
> +
> +/*
> + * Get the base register number and access offset in load/store instructions.
> + * At present, only the following two addressing modes are supported:
> + *
> + *  1. Base register only (no offset): [base{, #0}]
> + *  2. Base plus offset (immediate): [base{, #imm}]
> + *
> + * For addressing modes where the offset needs to be calculated from the
> + * register value, it is difficult to know the specific value of the offset
> + * register, making it impossible to calculate the offset.
> + *
> + * Fills @reg and @offset when return 0.
> + */
> +static int
> +extract_reg_offset_arm64(struct arch *arch __maybe_unused,
> +			 struct disasm_line *dl __maybe_unused,
> +			 const char *insn_str, int insn_ops __maybe_unused,
> +			 struct annotated_op_loc *op_loc)
> +{
> +	char *str;
> +	regmatch_t match[4];
> +	static regex_t reg_off_regex;
> +	static bool regex_compiled;
> +
> +	if (!regex_compiled) {
> +		regcomp(&reg_off_regex, "^\\[(sp|[xw][0-9]{1,2})(, #(-?[0-9]+))?\\].*",
> +			REG_EXTENDED);
> +		regex_compiled = true;

Probably better to put it in the arch specific data and free it when you
add arch__annotate_exit().


> +	}
> +
> +	if (!op_loc->mem_ref)
> +		return 0;
> +
> +	if (regexec(&reg_off_regex, insn_str, 4, match, 0))
> +		return -1;
> +
> +	str = strdup(insn_str);
> +	if (!str)
> +		return -1;
> +
> +	/* Get the base register number. */
> +	str[match[1].rm_eo] = '\0';
> +	op_loc->reg1 = get_arm64_regnum(str + match[1].rm_so);
> +
> +	/*
> +	 * If there is an immediate offset, match[2] records the start and end
> +	 * positions of "#imm".
> +	 */
> +	if (match[2].rm_so == -1) {
> +		free(str);
> +		return 0;
> +	}
> +
> +	/* Get the immediate offset. */
> +	str[match[3].rm_eo] = '\0';
> +	op_loc->offset = strtol(str + match[3].rm_so, NULL, 0);

Can you please clarify what match 1,2,3 mean - hopefully with an
example?

Thanks,
Namhyung

> +
> +	free(str);
> +	return 0;
> +}
> diff --git a/tools/perf/util/Build b/tools/perf/util/Build
> index 5ec97e8d6b6d..d408cbe94fdd 100644
> --- a/tools/perf/util/Build
> +++ b/tools/perf/util/Build
> @@ -210,6 +210,7 @@ perf-util-$(CONFIG_LIBDW) += dwarf-regs.o
>  perf-util-$(CONFIG_LIBDW) += dwarf-regs-csky.o
>  perf-util-$(CONFIG_LIBDW) += dwarf-regs-powerpc.o
>  perf-util-$(CONFIG_LIBDW) += dwarf-regs-x86.o
> +perf-util-$(CONFIG_LIBDW) += dwarf-regs-arm64.o
>  perf-util-$(CONFIG_LIBDW) += debuginfo.o
>  perf-util-$(CONFIG_LIBDW) += annotate-data.o
>  
> diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
> index 905eceb824a4..1035c60a8545 100644
> --- a/tools/perf/util/disasm.c
> +++ b/tools/perf/util/disasm.c
> @@ -128,6 +128,7 @@ static struct arch architectures[] = {
>  	{
>  		.name = "arm64",
>  		.init = arm64__annotate_init,
> +		.extract_reg_offset = extract_reg_offset_arm64,
>  	},
>  	{
>  		.name = "csky",
> diff --git a/tools/perf/util/dwarf-regs-arm64.c b/tools/perf/util/dwarf-regs-arm64.c
> new file mode 100644
> index 000000000000..edf41c059967
> --- /dev/null
> +++ b/tools/perf/util/dwarf-regs-arm64.c
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Mapping of DWARF debug register numbers into register names.
> + *
> + * Copyright (c) 2025  Huawei Inc, Li Huafei <lihuafei1@huawei.com>
> + */
> +#include <errno.h>
> +#include <string.h>
> +#include <dwarf-regs.h>
> +
> +int get_arm64_regnum(const char *name)
> +{
> +	int reg;
> +
> +	if (!strcmp(name, "sp"))
> +		return 31;
> +
> +	if (*name != 'x' && *name != 'w')
> +		return -EINVAL;
> +
> +	name++;
> +	reg = strtol(name, NULL, 0);
> +
> +	return reg >= 0 && reg <= 30 ? reg : -EINVAL;
> +}
> diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/include/dwarf-regs.h
> index 6f1b9f6b2466..81cc5f69a391 100644
> --- a/tools/perf/util/include/dwarf-regs.h
> +++ b/tools/perf/util/include/dwarf-regs.h
> @@ -101,6 +101,8 @@ const char *get_dwarf_regstr(unsigned int n, unsigned int machine, unsigned int
>  
>  int get_x86_regnum(const char *name);
>  
> +int get_arm64_regnum(const char *name);
> +
>  #if !defined(__x86_64__) && !defined(__i386__)
>  int get_arch_regnum(const char *name);
>  #endif
> @@ -128,6 +130,11 @@ static inline void get_powerpc_regs(u32 raw_insn __maybe_unused, int is_source _
>  {
>  	return;
>  }
> +
> +static inline int get_arm64_regnum(const char *name __maybe_unused)
> +{
> +	return -1;
> +}
>  #endif
>  
>  #endif
> -- 
> 2.25.1
> 

