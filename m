Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE0EFEE20AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 15:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z4iBvKcLu5hIphQObIBPVM6L7iOx7gCnKq3Ngau8LXU=; b=3I78WwcLsbp4dUERCBiHSbQDb2
	w1Hi3IghsymfKx4yAf0Zve+vjSLip9CQ8uIA6qGX1ZwbJrBmgJYN8gnWI9V1ey3JDbjkJC6IUrhev
	9o8TougiGHZaInTcvDhYifz0li+9Y0wj9gNqJeXAz6h0fxak7kYtGI1qmzWxADFRQUo6tjoTWlxtH
	c1RgeszGMVu1nqFy2fe0jJDK/tXfgQDydk1iOP9lHBNaW15YXbF3fh3mAyxbD8+T8GYq+R/bt/5Pg
	TP8Xmg9VMoWdJCfNMxEQH2Mq317YY4W9KPx5l8jqrT3WEcrh5RHlJCW8zOQEZvgyUVt3A4Y+81n/p
	uiVglGSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voNaN-0000000BUOu-3wwg;
	Fri, 06 Feb 2026 15:17:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voNaL-0000000BUON-2ZIj;
	Fri, 06 Feb 2026 15:17:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6176A44022;
	Fri,  6 Feb 2026 15:17:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B452C116C6;
	Fri,  6 Feb 2026 15:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770391047;
	bh=6mz/3w0UjpTEHMbTpW4AIj0Grix3lL6MyzuhtcoRSic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VlAOXJcFe4nga7Co7rthFiRF+OTrMkuvkC7VLx301zD3DttlJ9cwinHFhpJFtMBBd
	 3ngn0fnOslHfDn/rzIQG0+7N9oxPG1N+EKewk8rJHggIKFVzImQIDSI79x8NNFf5vu
	 3hlM0p2dmflv+x3Sh6C5CpkqqFIlC+d06GaVtH/OsChouzd6cPnUttTXv17XAk4Gi9
	 l8j31GXwzzXDrYx/XSKXehj0znte90kvWBaHOpF5gTIlLDSWT0mVzjgfbN7F6w/Itb
	 Mgl+Rle4jQ1iDdiCKMbjK2lqOihrs4IqtQXkV6Lmcmp6dKTJ6+IZoyrt3sY8xPXHFs
	 jq3hXzro+kiOg==
Date: Fri, 6 Feb 2026 12:17:23 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Dapeng Mi <dapeng1.mi@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Guo Ren <guoren@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Zide Chen <zide.chen@intel.com>,
	Falcon Thomas <thomas.falcon@intel.com>,
	Dapeng Mi <dapeng1.mi@intel.com>, Xudong Hao <xudong.hao@intel.com>
Subject: Re: [Patch v3 0/4] Perf tools: perf-regs bug fix and optimization
Message-ID: <aYYGA_Mo1ppwdTH0@x1>
References: <20260203024356.444942-1-dapeng1.mi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203024356.444942-1-dapeng1.mi@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_071729_754748_21E9967B 
X-CRM114-Status: GOOD (  16.94  )
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

On Tue, Feb 03, 2026 at 10:43:52AM +0800, Dapeng Mi wrote:
> Changes:
>  v2 -> v3:
>   * Fix the abort issue for "-I" or "--user-regs" options. (Patch 1/4)
>   * Address Ian's comments.

Fixed up somme fuzz with powerpc, x86, riscv and s390  Build files wrt
removing perf_regs.o

Thanks, applied to perf-tools-next,

- Arnaldo
 
>  v1 -> v2:
>   * Fixing "PERF_REG_EXTENDED_MASK" redefinition building error by
>     changing the "asm/perf_regs.h" header path to relative UAPI path.
>     (Patch 1/3)
>   * Spliting xxx_reg_mask() and xxx_sdt_arg_parse_op() conversion into 2
>     patches.
> 
> This patch-set remove the below three architecture specific __weak
> functions and converted them into the general architecture specific
> functions which are dispatched base on "em_machine".
> 
> uint64_t arch__intr_reg_mask(void);
> uint64_t arch__user_reg_mask(void);
> int arch_sdt_arg_parse_op(char *old_op, char **new_op);
> 
> The advantage of this conversion is that these architectural functions
> can be called even for a different architecture with host instead of
> only called on the host architecture.
> 
> Although the converted functions shown below can be called on any
> architecture, currently they are still only called for the host
> architecture (EM_HOST).
> 
> int perf_sdt_arg_parse_op(uint16_t e_machine, char *old_op, char **new_op);
> uint64_t perf_intr_reg_mask(uint16_t e_machine);
> uint64_t perf_user_reg_mask(uint16_t e_machine);
> 
> Tests:
>   * This patch-set is only tested on x86 platforms. No issues are found
>     for both intr-regs and user-regs options.
>   * Tests on other architectures are welcomed and appreciated.
> 
> History:
>   v1: https://lore.kernel.org/all/20260123090938.2222960-1-dapeng1.mi@linux.intel.com/
>   v2: https://lore.kernel.org/all/20260127070259.2720468-1-dapeng1.mi@linux.intel.com/
> 
> Dapeng Mi (4):
>   perf regs: Fix abort for "-I" or "--user-regs" options
>   perf arch: Update arch headers to use relative UAPI paths
>   perf regs: Remove __weak attributive arch__xxx_reg_mask() functions
>   perf regs: Remove __weak attributive arch_sdt_arg_parse_op() function
> 
>  tools/perf/arch/arm/include/perf_regs.h       |   2 +-
>  tools/perf/arch/arm/util/Build                |   2 -
>  tools/perf/arch/arm/util/perf_regs.c          |  13 -
>  tools/perf/arch/arm64/include/perf_regs.h     |   2 +-
>  tools/perf/arch/arm64/util/Build              |   1 -
>  tools/perf/arch/arm64/util/perf_regs.c        | 141 ---------
>  tools/perf/arch/csky/Build                    |   1 -
>  tools/perf/arch/csky/include/perf_regs.h      |   2 +-
>  tools/perf/arch/csky/util/Build               |   1 -
>  tools/perf/arch/csky/util/perf_regs.c         |  13 -
>  tools/perf/arch/loongarch/include/perf_regs.h |   2 +-
>  tools/perf/arch/loongarch/util/Build          |   1 -
>  tools/perf/arch/loongarch/util/perf_regs.c    |  13 -
>  tools/perf/arch/mips/include/perf_regs.h      |   2 +-
>  tools/perf/arch/mips/util/Build               |   1 -
>  tools/perf/arch/mips/util/perf_regs.c         |  13 -
>  tools/perf/arch/powerpc/include/perf_regs.h   |   2 +-
>  tools/perf/arch/powerpc/util/Build            |   1 -
>  tools/perf/arch/powerpc/util/perf_regs.c      | 172 -----------
>  tools/perf/arch/riscv/include/perf_regs.h     |   9 +-
>  tools/perf/arch/riscv/util/Build              |   1 -
>  tools/perf/arch/riscv/util/perf_regs.c        |  13 -
>  tools/perf/arch/s390/include/perf_regs.h      |   2 +-
>  tools/perf/arch/s390/util/Build               |   1 -
>  tools/perf/arch/s390/util/perf_regs.c         |  13 -
>  tools/perf/arch/x86/include/perf_regs.h       |   2 +-
>  tools/perf/arch/x86/util/Build                |   1 -
>  tools/perf/arch/x86/util/perf_regs.c          | 283 ------------------
>  tools/perf/util/evsel.c                       |   4 +-
>  tools/perf/util/parse-regs-options.c          |  13 +-
>  .../util/perf-regs-arch/perf_regs_aarch64.c   | 139 ++++++++-
>  .../perf/util/perf-regs-arch/perf_regs_arm.c  |   7 +-
>  .../perf/util/perf-regs-arch/perf_regs_csky.c |   7 +-
>  .../util/perf-regs-arch/perf_regs_loongarch.c |   7 +-
>  .../perf/util/perf-regs-arch/perf_regs_mips.c |   7 +-
>  .../util/perf-regs-arch/perf_regs_powerpc.c   | 183 ++++++++++-
>  .../util/perf-regs-arch/perf_regs_riscv.c     |   7 +-
>  .../perf/util/perf-regs-arch/perf_regs_s390.c |   7 +-
>  .../perf/util/perf-regs-arch/perf_regs_x86.c  | 281 ++++++++++++++++-
>  tools/perf/util/perf_regs.c                   | 109 ++++++-
>  tools/perf/util/perf_regs.h                   |  27 +-
>  tools/perf/util/probe-file.c                  |   3 +-
>  42 files changed, 787 insertions(+), 724 deletions(-)
>  delete mode 100644 tools/perf/arch/arm/util/perf_regs.c
>  delete mode 100644 tools/perf/arch/arm64/util/perf_regs.c
>  delete mode 100644 tools/perf/arch/csky/Build
>  delete mode 100644 tools/perf/arch/csky/util/Build
>  delete mode 100644 tools/perf/arch/csky/util/perf_regs.c
>  delete mode 100644 tools/perf/arch/loongarch/util/perf_regs.c
>  delete mode 100644 tools/perf/arch/mips/util/perf_regs.c
>  delete mode 100644 tools/perf/arch/powerpc/util/perf_regs.c
>  delete mode 100644 tools/perf/arch/riscv/util/perf_regs.c
>  delete mode 100644 tools/perf/arch/s390/util/perf_regs.c
>  delete mode 100644 tools/perf/arch/x86/util/perf_regs.c
> 
> -- 
> 2.34.1
> 

