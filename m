Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 227A3C55ABC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 12:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n2nPNPQGXGCw7I5Hq9vPEc1mLprdU0Rtb0NgOnKCL4E=; b=iBIkOWM9O4TVo1QFDQMD85v1aA
	Uv7TO9qGHXkmZVUAbcHS3tK3wQ/rAQNXKuWGy9KSkqX0zVsvF3gBWuzYUAeGCvOTiQIXB+ocS00qN
	hzbko+QphR066DJitciceS8S02rJ15av72gwQaBl1B2YZ18knjTsD/PkA65IW9cnT3qUecrGg3lsk
	rGattBz4AISgU2WjoHGilHI9RSuTOInDk4MoZ0Jg9hBrfJ6AlE3AQhOjVTydNe8i+TSCBcoBAI53L
	bUrBbU5LMatJX4jp0qWNrfY9Wbw4ExaRdk5qXtgVnueektz1wVC0uDfQAF/rDoxZgh02/NhUWIIgi
	O+7mayLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtPBG-0000000ET2u-3ekp;
	Fri, 20 Feb 2026 12:00:22 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtPBD-0000000ET2W-1Cvi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 12:00:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771588819; x=1803124819;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BJwn3q+eqyH6klWhmr3v9YPJaWcEJddp5EliWQLosW4=;
  b=fDEdiIr7ULPW9S9xnEyoGdRAMcliwA0gLHs9wG5uT8+Qjj0voyv5Moyo
   kSmx2rICjSWMd8WZv0wQV0B65NoPngBWVnBv575ZufUwndpnE97kSGXlS
   iOccac1YMgi7DXsu48B6lb2NkoEMiBcsKo9K3tCzZSpBnonnI8PfXC2eE
   gDlPaxzlg7RpWJqiaHUK2Ls3ZPUf7jccvJsLCizaWrQW2rF5xRKUvxP6q
   WSCaCzxeR1vClmXDiP7aPfRBRDsTBz3bWT+HtuCS2zilaFXeO93N24gct
   4u8+ZsG0U6htsW5DxH5DMhhXWhvlfxCuhp6P6OlrenAp802rTLZYZ7MKH
   w==;
X-CSE-ConnectionGUID: Ru9GT8tgQGmGVTvxUD+Nnw==
X-CSE-MsgGUID: XL25mFElSUW2sGqg/e1hOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72579537"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="72579537"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 04:00:18 -0800
X-CSE-ConnectionGUID: fxCgkGONQi+IaN4+f3YPjQ==
X-CSE-MsgGUID: JjXTyrWBSxStWLPFlyzSCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="213402075"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Feb 2026 04:00:11 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtPB3-0000000144S-0Nu8;
	Fri, 20 Feb 2026 12:00:09 +0000
Date: Fri, 20 Feb 2026 19:59:16 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Hwang <leon.hwang@linux.dev>, bpf@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Leon Hwang <leon.hwang@linux.dev>, Peilin Ye <yepeilin@google.com>,
	Luis Gerhorst <luis.gerhorst@fau.de>,
	Viktor Malik <vmalik@redhat.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 2/6] bpf, x86: Add 64-bit bitops kfuncs
 support for x86_64
Message-ID: <202602201931.LBZGbpvs-lkp@intel.com>
References: <20260219142933.13904-3-leon.hwang@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219142933.13904-3-leon.hwang@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_040019_374984_BFD50164 
X-CRM114-Status: GOOD (  10.32  )
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

Hi Leon,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Leon-Hwang/bpf-Introduce-64-bit-bitops-kfuncs/20260219-223550
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20260219142933.13904-3-leon.hwang%40linux.dev
patch subject: [PATCH bpf-next v2 2/6] bpf, x86: Add 64-bit bitops kfuncs support for x86_64
config: x86_64-randconfig-012-20260220 (https://download.01.org/0day-ci/archive/20260220/202602201931.LBZGbpvs-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260220/202602201931.LBZGbpvs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602201931.LBZGbpvs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: bpf_clz64
   >>> referenced by bpf_jit_comp.c:1621 (arch/x86/net/bpf_jit_comp.c:1621)
   >>>               arch/x86/net/bpf_jit_comp.o:(do_jit) in archive vmlinux.a
   >>> referenced by bpf_jit_comp.c:4250 (arch/x86/net/bpf_jit_comp.c:4250)
   >>>               arch/x86/net/bpf_jit_comp.o:(bpf_jit_inlines_kfunc_call) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: bpf_ctz64
   >>> referenced by bpf_jit_comp.c:1647 (arch/x86/net/bpf_jit_comp.c:1647)
   >>>               arch/x86/net/bpf_jit_comp.o:(do_jit) in archive vmlinux.a
   >>> referenced by bpf_jit_comp.c:4247 (arch/x86/net/bpf_jit_comp.c:4247)
   >>>               arch/x86/net/bpf_jit_comp.o:(bpf_jit_inlines_kfunc_call) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: bpf_ffs64
   >>> referenced by bpf_jit_comp.c:1673 (arch/x86/net/bpf_jit_comp.c:1673)
   >>>               arch/x86/net/bpf_jit_comp.o:(do_jit) in archive vmlinux.a
   >>> referenced by bpf_jit_comp.c:4247 (arch/x86/net/bpf_jit_comp.c:4247)
   >>>               arch/x86/net/bpf_jit_comp.o:(bpf_jit_inlines_kfunc_call) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: bpf_fls64
   >>> referenced by bpf_jit_comp.c:1677 (arch/x86/net/bpf_jit_comp.c:1677)
   >>>               arch/x86/net/bpf_jit_comp.o:(do_jit) in archive vmlinux.a
   >>> referenced by bpf_jit_comp.c:4250 (arch/x86/net/bpf_jit_comp.c:4250)
   >>>               arch/x86/net/bpf_jit_comp.o:(bpf_jit_inlines_kfunc_call) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: bpf_popcnt64
   >>> referenced by bpf_jit_comp.c:1683 (arch/x86/net/bpf_jit_comp.c:1683)
   >>>               arch/x86/net/bpf_jit_comp.o:(do_jit) in archive vmlinux.a
   >>> referenced by bpf_jit_comp.c:4253 (arch/x86/net/bpf_jit_comp.c:4253)
   >>>               arch/x86/net/bpf_jit_comp.o:(bpf_jit_inlines_kfunc_call) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: bpf_rol64
   >>> referenced by bpf_jit_comp.c:1707 (arch/x86/net/bpf_jit_comp.c:1707)
   >>>               arch/x86/net/bpf_jit_comp.o:(do_jit) in archive vmlinux.a
   >>> referenced by bpf_jit_comp.c:4256 (arch/x86/net/bpf_jit_comp.c:4256)
   >>>               arch/x86/net/bpf_jit_comp.o:(bpf_jit_inlines_kfunc_call) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: bpf_ror64
   >>> referenced by bpf_jit_comp.c:1714 (arch/x86/net/bpf_jit_comp.c:1714)
   >>>               arch/x86/net/bpf_jit_comp.o:(do_jit) in archive vmlinux.a
   >>> referenced by bpf_jit_comp.c:4256 (arch/x86/net/bpf_jit_comp.c:4256)
   >>>               arch/x86/net/bpf_jit_comp.o:(bpf_jit_inlines_kfunc_call) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

