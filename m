Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE1D8C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 18:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pFLJ5GlXWyaVpKGcaOJizAWoSbXS7Xq7IH8LyXRYBis=; b=gqbE1IxV/H5SZ+cmNN5M1FkFjc
	mT2suDrPVyvED+P/jFI4Qn8lZaMfuJQL7ohjTtfiGCkCmmQKvaLBeYJ1yxsAjVzuS+ZRw3jN6EDxy
	A96Bbszc96JxnPNFhSoUdyB2aTV3QSWJv7SqAvMcZm+/FbUVulmAJWrMRet+TgstOoYmhg0oYfEiz
	l9gITVdvpCeaYNOfkKNBxJ6NQpUoUf/Qu8uAbyH0lvHrGwL9A5Tmi8TMun8+HNR0ANdbyjZLm7mLE
	Vuo+QZXeADZc42KzjxI6uSmOsW28sKmLqLtgu8aMQYrJ5xy4ufmyo/YQl7ZZ8wLuRFOc6Bqn6hgJK
	+WANyTWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIXWH-00000004jcU-45BS;
	Fri, 23 May 2025 18:53:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIWVV-00000004bar-28Hv;
	Fri, 23 May 2025 17:48:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pFLJ5GlXWyaVpKGcaOJizAWoSbXS7Xq7IH8LyXRYBis=; b=KUOgezIAuTP1FsPgpShaTif5k3
	Jd3vYtYfQFwe/Xdkb/b44YCX3pZOja00jj/yAP2fol5mfx0Zd4Mxs2/A8dnSAX0QxWcNLv50FW4Lc
	48IrfHWQXR+MTV/q1DbTlSTczMmK7J3HlqHaiMT8/MFdYvaUWbVO9RXvLVLEVDMKt18+fD4+qDYd5
	brpykbEBeslyGuqrpkcdJ3K0uzPe95lDLyNkOAtCCQFlbWC9uIzt9lqrCQRQnDTIhKCnBQSvQoTrZ
	dM2FTuxMXtyNYev9p0GdUCP2u8nfkorpqkoJNzp8fa85qasr6s8p6/HWNWABX+L4UzLs22LScG6AB
	Kc75ZvyA==;
Received: from mgamail.intel.com ([192.198.163.16])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIWVR-00000001MHs-1grv;
	Fri, 23 May 2025 17:48:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748022509; x=1779558509;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AqUynDC3Sw8C6ZtTMriTAeGFMTNBji4jXiQmc/rbw2o=;
  b=EkFdnqv1ophR1OH0doEciObnAjIK6MORKCWmpzyxoFq1EjUedSDnRoUz
   W6hkchZs4QWae6rnH5vGoxtuwPMHa41dV/i+drvL4+YDtJtFUpyQibpXr
   09coju7HstH5bo8ZMarkjEJko34x9hIv4SNyvORtj1zCdBKfEacLS9Qym
   qaWY1J1rYYz1VefBZHk+i3+U36XL/JhFrZgIpla+uzh8VGb/nd3QKmNvX
   Kt5LmIu873PHXBMPMmTL/qKG9tacG1VZO45b0bcJb0ZyDUk2aRC5rWwA2
   BKwsAyYZM9ZiHn/7FM+VpxySEHKWnhb2RhfHGhXzNvEqBRIyq43n540sL
   A==;
X-CSE-ConnectionGUID: CLhbDKMNSKCev2WBnSw+Mg==
X-CSE-MsgGUID: MdwNu1DUQYOc8F8sOl2YBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="37712261"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; 
   d="scan'208";a="37712261"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 10:48:24 -0700
X-CSE-ConnectionGUID: lJrSde5yS5yz0+ah3FyjYQ==
X-CSE-MsgGUID: VO9IXjEZT1W8X0PcYRPbOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; 
   d="scan'208";a="141740316"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 May 2025 10:48:18 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIWVD-000QdI-2N;
	Fri, 23 May 2025 17:48:15 +0000
Date: Sat, 24 May 2025 01:48:04 +0800
From: kernel test robot <lkp@intel.com>
To: Rajnesh Kanwal <rkanwal@rivosinc.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Beeman Strong <beeman@rivosinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Rajnesh Kanwal <rkanwal@rivosinc.com>
Subject: Re: [PATCH v3 5/7] riscv: pmu: Add driver for Control Transfer
 Records Ext.
Message-ID: <202505240131.OJkUGGvA-lkp@intel.com>
References: <20250523-b4-ctr_upstream_v3-v3-5-ad355304ba1c@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-b4-ctr_upstream_v3-v3-5-ad355304ba1c@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_184830_084494_74703BDF 
X-CRM114-Status: GOOD (  12.84  )
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

Hi Rajnesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on e0200e37637e573cd68f522ecd550be87e304c6c]

url:    https://github.com/intel-lab-lkp/linux/commits/Rajnesh-Kanwal/perf-Increase-the-maximum-number-of-branches-remove_loops-can-process/20250523-073341
base:   e0200e37637e573cd68f522ecd550be87e304c6c
patch link:    https://lore.kernel.org/r/20250523-b4-ctr_upstream_v3-v3-5-ad355304ba1c%40rivosinc.com
patch subject: [PATCH v3 5/7] riscv: pmu: Add driver for Control Transfer Records Ext.
config: riscv-randconfig-002-20250523 (https://download.01.org/0day-ci/archive/20250524/202505240131.OJkUGGvA-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505240131.OJkUGGvA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505240131.OJkUGGvA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/riscv/kernel/asm-offsets.c:12:
   In file included from arch/riscv/include/asm/kvm_host.h:23:
   In file included from arch/riscv/include/asm/kvm_vcpu_pmu.h:12:
>> include/linux/perf/riscv_pmu.h:156:76: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
     156 | static inline void riscv_pmu_ctr_sched_task(struct perf_event_pmu_context *,
         |                                                                            ^
   include/linux/perf/riscv_pmu.h:158:13: warning: unused function 'riscv_pmu_ctr_add' [-Wunused-function]
     158 | static void riscv_pmu_ctr_add(struct perf_event *event) { }
         |             ^~~~~~~~~~~~~~~~~
   include/linux/perf/riscv_pmu.h:159:13: warning: unused function 'riscv_pmu_ctr_del' [-Wunused-function]
     159 | static void riscv_pmu_ctr_del(struct perf_event *event) { }
         |             ^~~~~~~~~~~~~~~~~
   3 warnings generated.
--
   In file included from arch/riscv/kernel/asm-offsets.c:12:
   In file included from arch/riscv/include/asm/kvm_host.h:23:
   In file included from arch/riscv/include/asm/kvm_vcpu_pmu.h:12:
>> include/linux/perf/riscv_pmu.h:156:76: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
     156 | static inline void riscv_pmu_ctr_sched_task(struct perf_event_pmu_context *,
         |                                                                            ^
   include/linux/perf/riscv_pmu.h:158:13: warning: unused function 'riscv_pmu_ctr_add' [-Wunused-function]
     158 | static void riscv_pmu_ctr_add(struct perf_event *event) { }
         |             ^~~~~~~~~~~~~~~~~
   include/linux/perf/riscv_pmu.h:159:13: warning: unused function 'riscv_pmu_ctr_del' [-Wunused-function]
     159 | static void riscv_pmu_ctr_del(struct perf_event *event) { }
         |             ^~~~~~~~~~~~~~~~~
   3 warnings generated.


vim +156 include/linux/perf/riscv_pmu.h

   152	
   153	static inline bool riscv_pmu_ctr_valid(struct perf_event *event) { return false; }
   154	static inline void riscv_pmu_ctr_consume(struct cpu_hw_events *cpuc,
   155					      struct perf_event *event) { }
 > 156	static inline void riscv_pmu_ctr_sched_task(struct perf_event_pmu_context *,
   157						    bool sched_in) { }
   158	static void riscv_pmu_ctr_add(struct perf_event *event) { }
   159	static void riscv_pmu_ctr_del(struct perf_event *event) { }
   160	static inline void riscv_pmu_ctr_enable(struct perf_event *event) { }
   161	static inline void riscv_pmu_ctr_disable(struct perf_event *event) { }
   162	static inline void riscv_pmu_ctr_dying_cpu(void) { }
   163	static inline void riscv_pmu_ctr_starting_cpu(void) { }
   164	static inline int riscv_pmu_ctr_init(struct riscv_pmu *riscv_pmu) { return 0; }
   165	static inline void riscv_pmu_ctr_finish(struct riscv_pmu *riscv_pmu) { }
   166	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

