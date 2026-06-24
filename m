Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25DC2CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 02:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dnvoFrJhlJCL9e81EXyvHBQDfjFBTadCPk/LJUOw2Iw=; b=Zo39mrODrBWqv4JYSx7qiI0yXu
	W4xmK/ItTRmUjkcH8GI5dPLWbyWNWq9+CN66vTXzjF+ffKmfnQpRhKsKfxn3gkkPB68igcReIcytQ
	1xN7qfcmxPRo7xQgUYOunGz3WCuBVbw8Ly54VMMnhxVXC9Qhe4o0xHQLswK8/ZgkBluEiMcTXSEqd
	y5jYDUi0s5fmXfjK//zaGckeJcHmpYSbB5XnfloVt8yjvuV9zcvywCe2FvNoCdkEOp6MBCbd7WUpv
	+53W9dndQDsnCr+o3h2J6tuIWGzVlTcq7kUf+8JFepimJQvt5mkNuSSR+SC2EFm2PPEJvgagpiTQI
	9UMY/+gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcD92-000000072ve-0WcY;
	Wed, 24 Jun 2026 02:15:16 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcD8y-000000072vG-2zLq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 02:15:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782267313; x=1813803313;
  h=date:from:to:cc:subject:message-id;
  bh=nIOHiv7R/Ej0NPY4DBIL60TFcFt6IO2/67c9boxiK2Y=;
  b=A7PVMyCvEpZfJBOkz4SzSDP8pjJWv231x+VnwErNg1UJn0IDl2vpo/MO
   4HbFpUJ0luVuLUxQD+p0xZJmlp/EDN4mwVwaIuvncsnYMLeNTQ8PPBjHn
   lRQe9Wmi+3T8PbAA5z6fRuo1O2quxN2lpNfkYKcRDvoIo7qM4DYIbo734
   rj6tSVwLmnMsSN+tXjTGhDhUlukOefhg5nhz2t0OTzKfCSZweGu4Ak7FI
   EtF3PpxbRRfj2b+BbHkrTc4j0NkxffWoCOSbFF0VfvKJEJPuNWeUsiTiJ
   b+pSbMuISQvQzTOp/cP9nlyFsU8tzBZSyjEA7WAvvasf4nerSU4QuoTkh
   A==;
X-CSE-ConnectionGUID: b7mdqGeoTxWI65ur7rvyAA==
X-CSE-MsgGUID: fNK4cx9QSTiuay0MZvccEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="82126954"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="82126954"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 19:15:11 -0700
X-CSE-ConnectionGUID: h+ag6gclS8GX5RbjovsZeg==
X-CSE-MsgGUID: psk0ALP4QPWzMSBtzp35Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="254779758"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 23 Jun 2026 19:15:08 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcD8s-000000006K1-0825;
	Wed, 24 Jun 2026 02:15:06 +0000
Date: Wed, 24 Jun 2026 04:14:15 +0200
From: kernel test robot <lkp@intel.com>
To: Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Marc Zyngier <maz@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Subject: [arm64:for-next/core 12/12]
 usr/include/asm/sigcontext.h:81:9: error: unknown type name '__u128'; did you
 mean '__u32'?
Message-ID: <202606240441.7eZ1TIRM-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_191512_812488_63430DD9 
X-CRM114-Status: UNSURE (   8.84  )
X-CRM114-Notice: Please train this message.
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

Hi Will,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
head:   9d6306113f921dc00793df46f31ed46583c720df
commit: 9d6306113f921dc00793df46f31ed46583c720df [12/12] arm64: uapi: Use __u128 instead of __uint128_t in UAPI headers
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260624/202606240441.7eZ1TIRM-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606240441.7eZ1TIRM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606240441.7eZ1TIRM-lkp@intel.com/

Note: the arm64/for-next/core HEAD 9d6306113f921dc00793df46f31ed46583c720df builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from /usr/aarch64-linux-gnu/include/bits/sigcontext.h:30,
                    from /usr/aarch64-linux-gnu/include/signal.h:301,
                    from testcases/fake_sigreturn_bad_magic.c:10:
>> usr/include/asm/sigcontext.h:81:9: error: unknown type name '__u128'; did you mean '__u32'?
      81 |         __u128 vregs[32];
         |         ^~~~~~
         |         __u32
   In file included from ./test_signals.h:14,
                    from ./test_signals_utils.h:14,
                    from testcases/fake_sigreturn_bad_magic.c:13:
>> usr/include/asm/ptrace.h:96:9: error: unknown type name '__u128'; did you mean '__u32'?
      96 |         __u128          vregs[32];
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:261:9: error: unknown type name '__u128'; did you mean '__u32'?
     261 |         __u128  apiakey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:262:9: error: unknown type name '__u128'; did you mean '__u32'?
     262 |         __u128  apibkey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:263:9: error: unknown type name '__u128'; did you mean '__u32'?
     263 |         __u128  apdakey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:264:9: error: unknown type name '__u128'; did you mean '__u32'?
     264 |         __u128  apdbkey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:268:9: error: unknown type name '__u128'; did you mean '__u32'?
     268 |         __u128  apgakey;
         |         ^~~~~~
         |         __u32
   In file included from /usr/aarch64-linux-gnu/include/bits/sigcontext.h:30,
                    from /usr/aarch64-linux-gnu/include/signal.h:301,
                    from test_signals.h:7,
                    from test_signals.c:16:
>> usr/include/asm/sigcontext.h:81:9: error: unknown type name '__u128'; did you mean '__u32'?
      81 |         __u128 vregs[32];
         |         ^~~~~~
         |         __u32
   In file included from test_signals.h:14:
>> usr/include/asm/ptrace.h:96:9: error: unknown type name '__u128'; did you mean '__u32'?
      96 |         __u128          vregs[32];
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:261:9: error: unknown type name '__u128'; did you mean '__u32'?
     261 |         __u128  apiakey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:262:9: error: unknown type name '__u128'; did you mean '__u32'?
     262 |         __u128  apibkey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:263:9: error: unknown type name '__u128'; did you mean '__u32'?
     263 |         __u128  apdakey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:264:9: error: unknown type name '__u128'; did you mean '__u32'?
     264 |         __u128  apdbkey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:268:9: error: unknown type name '__u128'; did you mean '__u32'?
     268 |         __u128  apgakey;
         |         ^~~~~~
         |         __u32
   In file included from /usr/aarch64-linux-gnu/include/bits/sigcontext.h:30,
                    from /usr/aarch64-linux-gnu/include/signal.h:301,
                    from test_signals_utils.c:6:
>> usr/include/asm/sigcontext.h:81:9: error: unknown type name '__u128'; did you mean '__u32'?
      81 |         __u128 vregs[32];
         |         ^~~~~~
         |         __u32
   In file included from test_signals.h:14,
                    from test_signals_utils.c:18:
>> usr/include/asm/ptrace.h:96:9: error: unknown type name '__u128'; did you mean '__u32'?
      96 |         __u128          vregs[32];
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:261:9: error: unknown type name '__u128'; did you mean '__u32'?
     261 |         __u128  apiakey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:262:9: error: unknown type name '__u128'; did you mean '__u32'?
     262 |         __u128  apibkey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:263:9: error: unknown type name '__u128'; did you mean '__u32'?
     263 |         __u128  apdakey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:264:9: error: unknown type name '__u128'; did you mean '__u32'?
     264 |         __u128  apdbkey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:268:9: error: unknown type name '__u128'; did you mean '__u32'?
     268 |         __u128  apgakey;
         |         ^~~~~~
         |         __u32
   In file included from /usr/aarch64-linux-gnu/include/bits/sigcontext.h:30,
                    from /usr/aarch64-linux-gnu/include/signal.h:301,
                    from testcases/testcases.h:12,
                    from testcases/testcases.c:7:
>> usr/include/asm/sigcontext.h:81:9: error: unknown type name '__u128'; did you mean '__u32'?
      81 |         __u128 vregs[32];
         |         ^~~~~~
         |         __u32
   In file included from sve_helpers.c:10:
>> usr/include/asm/sigcontext.h:81:9: error: unknown type name '__u128'; did you mean '__u32'?
      81 |         __u128 vregs[32];
         |         ^~~~~~
         |         __u32
--
   In file included from /usr/aarch64-linux-gnu/include/bits/sigcontext.h:30,
                    from /usr/aarch64-linux-gnu/include/signal.h:301,
                    from /usr/aarch64-linux-gnu/include/sys/wait.h:36,
                    from pac.c:8:
>> usr/include/asm/sigcontext.h:81:9: error: unknown type name '__u128'; did you mean '__u32'?
      81 |         __u128 vregs[32];
         |         ^~~~~~
         |         __u32
--
   In file included from /usr/aarch64-linux-gnu/include/bits/sigcontext.h:30,
                    from /usr/aarch64-linux-gnu/include/signal.h:301,
                    from /usr/aarch64-linux-gnu/include/sys/wait.h:36,
                    from fp-ptrace.c:22:
>> usr/include/asm/sigcontext.h:81:9: error: unknown type name '__u128'; did you mean '__u32'?
      81 |         __u128 vregs[32];
         |         ^~~~~~
         |         __u32
   In file included from fp-ptrace.c:28:
>> usr/include/asm/ptrace.h:96:9: error: unknown type name '__u128'; did you mean '__u32'?
      96 |         __u128          vregs[32];
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:261:9: error: unknown type name '__u128'; did you mean '__u32'?
     261 |         __u128  apiakey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:262:9: error: unknown type name '__u128'; did you mean '__u32'?
     262 |         __u128  apibkey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:263:9: error: unknown type name '__u128'; did you mean '__u32'?
     263 |         __u128  apdakey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:264:9: error: unknown type name '__u128'; did you mean '__u32'?
     264 |         __u128  apdbkey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:268:9: error: unknown type name '__u128'; did you mean '__u32'?
     268 |         __u128  apgakey;
         |         ^~~~~~
         |         __u32
--
   In file included from /usr/aarch64-linux-gnu/include/bits/sigcontext.h:30,
                    from /usr/aarch64-linux-gnu/include/signal.h:301,
                    from mte_common_util.h:7,
                    from check_buffer_fill.c:11:
>> usr/include/asm/sigcontext.h:81:9: error: unknown type name '__u128'; did you mean '__u32'?
      81 |         __u128 vregs[32];
         |         ^~~~~~
         |         __u32
   In file included from /usr/aarch64-linux-gnu/include/bits/sigcontext.h:30,
                    from /usr/aarch64-linux-gnu/include/signal.h:301,
                    from mte_common_util.c:6:
>> usr/include/asm/sigcontext.h:81:9: error: unknown type name '__u128'; did you mean '__u32'?
      81 |         __u128 vregs[32];
         |         ^~~~~~
         |         __u32
--
   In file included from system.h:20,
                    from test.c:7:
>> usr/include/asm/ptrace.h:96:9: error: unknown type name '__u128'; did you mean '__u32'?
      96 |         __u128          vregs[32];
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:261:9: error: unknown type name '__u128'; did you mean '__u32'?
     261 |         __u128  apiakey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:262:9: error: unknown type name '__u128'; did you mean '__u32'?
     262 |         __u128  apibkey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:263:9: error: unknown type name '__u128'; did you mean '__u32'?
     263 |         __u128  apdakey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:264:9: error: unknown type name '__u128'; did you mean '__u32'?
     264 |         __u128  apdbkey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:268:9: error: unknown type name '__u128'; did you mean '__u32'?
     268 |         __u128  apgakey;
         |         ^~~~~~
         |         __u32
   In file included from test.c:14:
>> usr/include/asm/sigcontext.h:81:9: error: unknown type name '__u128'; did you mean '__u32'?
      81 |         __u128 vregs[32];
         |         ^~~~~~
         |         __u32
--
   In file included from system.h:20,
                    from signal.c:7:
>> usr/include/asm/ptrace.h:96:9: error: unknown type name '__u128'; did you mean '__u32'?
      96 |         __u128          vregs[32];
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:261:9: error: unknown type name '__u128'; did you mean '__u32'?
     261 |         __u128  apiakey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:262:9: error: unknown type name '__u128'; did you mean '__u32'?
     262 |         __u128  apibkey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:263:9: error: unknown type name '__u128'; did you mean '__u32'?
     263 |         __u128  apdakey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:264:9: error: unknown type name '__u128'; did you mean '__u32'?
     264 |         __u128  apdbkey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:268:9: error: unknown type name '__u128'; did you mean '__u32'?
     268 |         __u128  apgakey;
         |         ^~~~~~
         |         __u32
--
   In file included from /usr/aarch64-linux-gnu/include/bits/sigcontext.h:30,
                    from /usr/aarch64-linux-gnu/include/signal.h:301,
                    from tools/testing/selftests/cgroup/lib/cgroup_util.c:9:
>> usr/include/asm/sigcontext.h:81:9: error: unknown type name '__u128'; did you mean '__u32'?
      81 |         __u128 vregs[32];
         |         ^~~~~~
         |         __u32
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics
--
   In file included from /usr/aarch64-linux-gnu/include/bits/sigcontext.h:30,
                    from /usr/aarch64-linux-gnu/include/signal.h:301,
                    from include/test_util.h:12,
                    from include/kvm_util.h:8,
                    from demand_paging_test.c:17:
>> usr/include/asm/sigcontext.h:81:9: error: unknown type name '__u128'; did you mean '__u32'?
      81 |         __u128 vregs[32];
         |         ^~~~~~
         |         __u32
   In file included from usr/include/asm/kvm.h:37,
                    from usr/include/linux/kvm.h:16,
                    from include/kvm_util.h:14:
>> usr/include/asm/ptrace.h:96:9: error: unknown type name '__u128'; did you mean '__u32'?
      96 |         __u128          vregs[32];
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:261:9: error: unknown type name '__u128'; did you mean '__u32'?
     261 |         __u128  apiakey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:262:9: error: unknown type name '__u128'; did you mean '__u32'?
     262 |         __u128  apibkey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:263:9: error: unknown type name '__u128'; did you mean '__u32'?
     263 |         __u128  apdakey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:264:9: error: unknown type name '__u128'; did you mean '__u32'?
     264 |         __u128  apdbkey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:268:9: error: unknown type name '__u128'; did you mean '__u32'?
     268 |         __u128  apgakey;
         |         ^~~~~~
         |         __u32
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics
--
   In file included from usr/include/asm/kvm.h:37,
                    from usr/include/linux/kvm.h:16,
                    from lib/arm64/gic_v3_its.c:7:
>> usr/include/asm/ptrace.h:96:9: error: unknown type name '__u128'; did you mean '__u32'?
      96 |         __u128          vregs[32];
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:261:9: error: unknown type name '__u128'; did you mean '__u32'?
     261 |         __u128  apiakey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:262:9: error: unknown type name '__u128'; did you mean '__u32'?
     262 |         __u128  apibkey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:263:9: error: unknown type name '__u128'; did you mean '__u32'?
     263 |         __u128  apdakey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:264:9: error: unknown type name '__u128'; did you mean '__u32'?
     264 |         __u128  apdbkey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:268:9: error: unknown type name '__u128'; did you mean '__u32'?
     268 |         __u128  apgakey;
         |         ^~~~~~
         |         __u32
   In file included from /usr/aarch64-linux-gnu/include/bits/sigcontext.h:30,
                    from /usr/aarch64-linux-gnu/include/signal.h:301,
                    from include/test_util.h:12,
                    from include/kvm_util.h:8,
                    from lib/arm64/gic_v3_its.c:12:
>> usr/include/asm/sigcontext.h:81:9: error: unknown type name '__u128'; did you mean '__u32'?
      81 |         __u128 vregs[32];
         |         ^~~~~~
         |         __u32
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics
..

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

