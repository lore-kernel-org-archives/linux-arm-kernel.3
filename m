Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ABA8EF06FA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 00:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aY9si+Qc3iQ63j/sZrWnU9kx4PEb0vzzqrLQRO71lAc=; b=p+2+2sRULGTwDbz2HEZgWwPr8/
	8RZ2ai9brCo2TQlb7L499XRxuJLZubPRPYptk82KPK5HEPdEweFHi/UfX8sAgP/bd2I4bt147ANwr
	P/Id28qy+8173E+r/OCF7Bf5/tR/e+cZb721YxzJH2OxIzrg1aCR86BkEx4O7bDpt3PJhPbbxkq5Q
	phk6JADUS9zVNcj+iMJIHZcKA4IBmzyoHb+K2veEi/dF2O2HYCtfVLxD6JZIfhyeWlAzaGnUC3JOR
	dt8BqK/M1h6A3LhV4Z7CLzysozwZ/ZvU8rptDQzUDRdSozfCVvX6QmkjAJ2ZDbrjeD3Ly7MhuWV0Z
	Xd/aRMtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpFQ0-0000000EcCl-0TnR;
	Mon, 09 Feb 2026 00:46:24 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpFPx-0000000EcCL-1fnV;
	Mon, 09 Feb 2026 00:46:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770597981; x=1802133981;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WiDvGdY9/hMNal5D7v3aKwx1iH+Txlyos/k45ceIkMs=;
  b=mrNeixg56yPxOB1Gh0aHzto5mjzlBrY22U4IzwUMOFMI97rZVj2IHHLB
   KCxE2waWt6Tnbx9rady9NKQe0O1qBQ5YAmS2JeCtis3ALflD490DzNDUF
   977fOEFcyGor39ACVZaBRHRr1Op7PGhTqKfpcGsB7NXjt+PSRE89qQyFL
   riYdJBkGRVnO6m89r1PLP/L2Rl/MNM8k0y/f5qR7sLU657esmEgfb0dos
   kpnl9XoC3FEoikH7t30aQjg4fPbSTmMopDov1p8x3t5ermQroJKqCRjdb
   9+HXvaxAEJO9UZQ0m8W7MiApStc9jO5I6U0qPviUA52kxz0JLMWkVrEbf
   A==;
X-CSE-ConnectionGUID: StNmmc40R6q4tE2lskWdeQ==
X-CSE-MsgGUID: fVMkmU5MTmSli0vo9q4mLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="71773838"
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; 
   d="scan'208";a="71773838"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2026 16:46:20 -0800
X-CSE-ConnectionGUID: JaHt4qN4Tm2qb/1Ezcgd0Q==
X-CSE-MsgGUID: h53wmeBVTmqur7ngxWel6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; 
   d="scan'208";a="242064508"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.240.14]) ([10.124.240.14])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2026 16:46:13 -0800
Message-ID: <d406166d-27ff-413f-9b35-fa7aaec1b886@linux.intel.com>
Date: Mon, 9 Feb 2026 08:46:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v3 0/4] Perf tools: perf-regs bug fix and optimization
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>,
 Guo Ren <guoren@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-perf-users@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Zide Chen <zide.chen@intel.com>, Falcon Thomas <thomas.falcon@intel.com>,
 Dapeng Mi <dapeng1.mi@intel.com>, Xudong Hao <xudong.hao@intel.com>
References: <20260203024356.444942-1-dapeng1.mi@linux.intel.com>
 <aYYGA_Mo1ppwdTH0@x1>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <aYYGA_Mo1ppwdTH0@x1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_164621_455182_9CAAF717 
X-CRM114-Status: GOOD (  15.01  )
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


On 2/6/2026 11:17 PM, Arnaldo Carvalho de Melo wrote:
> On Tue, Feb 03, 2026 at 10:43:52AM +0800, Dapeng Mi wrote:
>> Changes:
>>  v2 -> v3:
>>   * Fix the abort issue for "-I" or "--user-regs" options. (Patch 1/4)
>>   * Address Ian's comments.
> Fixed up somme fuzz with powerpc, x86, riscv and s390  Build files wrt
> removing perf_regs.o

Thanks. 

>
> Thanks, applied to perf-tools-next,
>
> - Arnaldo
>  
>>  v1 -> v2:
>>   * Fixing "PERF_REG_EXTENDED_MASK" redefinition building error by
>>     changing the "asm/perf_regs.h" header path to relative UAPI path.
>>     (Patch 1/3)
>>   * Spliting xxx_reg_mask() and xxx_sdt_arg_parse_op() conversion into 2
>>     patches.
>>
>> This patch-set remove the below three architecture specific __weak
>> functions and converted them into the general architecture specific
>> functions which are dispatched base on "em_machine".
>>
>> uint64_t arch__intr_reg_mask(void);
>> uint64_t arch__user_reg_mask(void);
>> int arch_sdt_arg_parse_op(char *old_op, char **new_op);
>>
>> The advantage of this conversion is that these architectural functions
>> can be called even for a different architecture with host instead of
>> only called on the host architecture.
>>
>> Although the converted functions shown below can be called on any
>> architecture, currently they are still only called for the host
>> architecture (EM_HOST).
>>
>> int perf_sdt_arg_parse_op(uint16_t e_machine, char *old_op, char **new_op);
>> uint64_t perf_intr_reg_mask(uint16_t e_machine);
>> uint64_t perf_user_reg_mask(uint16_t e_machine);
>>
>> Tests:
>>   * This patch-set is only tested on x86 platforms. No issues are found
>>     for both intr-regs and user-regs options.
>>   * Tests on other architectures are welcomed and appreciated.
>>
>> History:
>>   v1: https://lore.kernel.org/all/20260123090938.2222960-1-dapeng1.mi@linux.intel.com/
>>   v2: https://lore.kernel.org/all/20260127070259.2720468-1-dapeng1.mi@linux.intel.com/
>>
>> Dapeng Mi (4):
>>   perf regs: Fix abort for "-I" or "--user-regs" options
>>   perf arch: Update arch headers to use relative UAPI paths
>>   perf regs: Remove __weak attributive arch__xxx_reg_mask() functions
>>   perf regs: Remove __weak attributive arch_sdt_arg_parse_op() function
>>
>>  tools/perf/arch/arm/include/perf_regs.h       |   2 +-
>>  tools/perf/arch/arm/util/Build                |   2 -
>>  tools/perf/arch/arm/util/perf_regs.c          |  13 -
>>  tools/perf/arch/arm64/include/perf_regs.h     |   2 +-
>>  tools/perf/arch/arm64/util/Build              |   1 -
>>  tools/perf/arch/arm64/util/perf_regs.c        | 141 ---------
>>  tools/perf/arch/csky/Build                    |   1 -
>>  tools/perf/arch/csky/include/perf_regs.h      |   2 +-
>>  tools/perf/arch/csky/util/Build               |   1 -
>>  tools/perf/arch/csky/util/perf_regs.c         |  13 -
>>  tools/perf/arch/loongarch/include/perf_regs.h |   2 +-
>>  tools/perf/arch/loongarch/util/Build          |   1 -
>>  tools/perf/arch/loongarch/util/perf_regs.c    |  13 -
>>  tools/perf/arch/mips/include/perf_regs.h      |   2 +-
>>  tools/perf/arch/mips/util/Build               |   1 -
>>  tools/perf/arch/mips/util/perf_regs.c         |  13 -
>>  tools/perf/arch/powerpc/include/perf_regs.h   |   2 +-
>>  tools/perf/arch/powerpc/util/Build            |   1 -
>>  tools/perf/arch/powerpc/util/perf_regs.c      | 172 -----------
>>  tools/perf/arch/riscv/include/perf_regs.h     |   9 +-
>>  tools/perf/arch/riscv/util/Build              |   1 -
>>  tools/perf/arch/riscv/util/perf_regs.c        |  13 -
>>  tools/perf/arch/s390/include/perf_regs.h      |   2 +-
>>  tools/perf/arch/s390/util/Build               |   1 -
>>  tools/perf/arch/s390/util/perf_regs.c         |  13 -
>>  tools/perf/arch/x86/include/perf_regs.h       |   2 +-
>>  tools/perf/arch/x86/util/Build                |   1 -
>>  tools/perf/arch/x86/util/perf_regs.c          | 283 ------------------
>>  tools/perf/util/evsel.c                       |   4 +-
>>  tools/perf/util/parse-regs-options.c          |  13 +-
>>  .../util/perf-regs-arch/perf_regs_aarch64.c   | 139 ++++++++-
>>  .../perf/util/perf-regs-arch/perf_regs_arm.c  |   7 +-
>>  .../perf/util/perf-regs-arch/perf_regs_csky.c |   7 +-
>>  .../util/perf-regs-arch/perf_regs_loongarch.c |   7 +-
>>  .../perf/util/perf-regs-arch/perf_regs_mips.c |   7 +-
>>  .../util/perf-regs-arch/perf_regs_powerpc.c   | 183 ++++++++++-
>>  .../util/perf-regs-arch/perf_regs_riscv.c     |   7 +-
>>  .../perf/util/perf-regs-arch/perf_regs_s390.c |   7 +-
>>  .../perf/util/perf-regs-arch/perf_regs_x86.c  | 281 ++++++++++++++++-
>>  tools/perf/util/perf_regs.c                   | 109 ++++++-
>>  tools/perf/util/perf_regs.h                   |  27 +-
>>  tools/perf/util/probe-file.c                  |   3 +-
>>  42 files changed, 787 insertions(+), 724 deletions(-)
>>  delete mode 100644 tools/perf/arch/arm/util/perf_regs.c
>>  delete mode 100644 tools/perf/arch/arm64/util/perf_regs.c
>>  delete mode 100644 tools/perf/arch/csky/Build
>>  delete mode 100644 tools/perf/arch/csky/util/Build
>>  delete mode 100644 tools/perf/arch/csky/util/perf_regs.c
>>  delete mode 100644 tools/perf/arch/loongarch/util/perf_regs.c
>>  delete mode 100644 tools/perf/arch/mips/util/perf_regs.c
>>  delete mode 100644 tools/perf/arch/powerpc/util/perf_regs.c
>>  delete mode 100644 tools/perf/arch/riscv/util/perf_regs.c
>>  delete mode 100644 tools/perf/arch/s390/util/perf_regs.c
>>  delete mode 100644 tools/perf/arch/x86/util/perf_regs.c
>>
>> -- 
>> 2.34.1
>>

