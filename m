Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F2DF55102
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 17:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NgXAP8H0aVDR3gLzwH7upHC7+KUR4japSk1GwBjKI3I=; b=DqiFlw/ZXEI80bUD4GRXcYnIpW
	dtMrntWACiEbLsQqVmlVv0x9OekL8S+igJfEFNiq4iIGKmP52OdArb0PrUR0V6sbw2pP00GO+lyV4
	/zj0WApY+9cHx9Ri11gtGOcEqwvFIUGi/OYCmTE9WW+XiAGLwvT2SjCq6AzhtmJDp+ozPJ7Vg5BNr
	aSX9xNc08XPSP7Czy6ktt3fVZT0bvV/x59HVEsP+w0IlGJpMVCDHPAH5R/86CReL6UWTybohwf3So
	mltJzuNzHyJKJyI/RIM6DmgpjsDc6UytDa6LKbsyOL8iLRavdD6JJNO/SRcOn0NvZPbLINn9ZjpDJ
	Q+DXrJpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyvNf-00000005Olr-1pQa;
	Sat, 07 Mar 2026 17:24:01 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyvNc-00000005OlA-1bUa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 17:23:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772904236; x=1804440236;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=old0xdZwgrJsWukz3od9fCjMaLFlhCHt0yZChfgcuCA=;
  b=F/QSGJmXB4DCTQ5gk36tUropUMIBiSiUHDfrF0DO5RRpYvlp4VdjduRy
   oHa7bYdTO3U5A7k+rmAhyfcPVFa6gq3r25XGC22M1UqlKoG95a2jsZAmQ
   82VrxRmFtsxCHWMYTF1ayPlbhnTCb0KeSWPaxjwoAOGRxDMsFcyhsN7wr
   sTBlOYtPy5vf9sVTb1Or1TtsSr18lISdNvB+zEuvaBXqb2OmkFONIj3qr
   AYMre3l2y5P+YND/MCVyFgOaeVnEL8wHMkvDUilXTGOndT+DGDVdaGTVM
   o8Q+04ATn1vu7FdaA0Aon8y/zl6VMgE/fIPSXSPmbbMNlCjVck1w1tXrF
   g==;
X-CSE-ConnectionGUID: h9AJOQ6cThuPPRUa9HZTog==
X-CSE-MsgGUID: igPTTliqRRKg/zmgQjqLXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="73183968"
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; 
   d="scan'208";a="73183968"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 09:23:53 -0800
X-CSE-ConnectionGUID: /k0cv0owQL6cuijTy6RHUQ==
X-CSE-MsgGUID: s1luV+E7QoeRiJ16/xAD0g==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Mar 2026 09:23:47 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyvNP-000000002Nh-3Gha;
	Sat, 07 Mar 2026 17:23:43 +0000
Date: Sun, 8 Mar 2026 01:23:15 +0800
From: kernel test robot <lkp@intel.com>
To: Xu Kuohai <xukuohai@huaweicloud.com>, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Yonghong Song <yonghong.song@linux.dev>,
	Puranjay Mohan <puranjay@kernel.org>,
	Anton Protopopov <a.s.protopopov@gmail.com>,
	Shahab Vahedi <list+bpf@vahedi.org>,
	Russell King <linux@armlinux.org.uk>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Hengqi Chen <hengqi.chen@gmail.com>,
	Johan Almbladh <johan.almbladh@anyfinetworks.com>,
	Paul Burton <paulburton@kernel.org>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Pu Lehui <pulehui@huawei.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	"David S . Miller" <davem@davemloft.net>,
	Wang YanQing <udknight@gmail.com>
Subject: Re: [bpf-next v7 1/5] bpf: Move constants blinding from JIT to
 verifier
Message-ID: <202603080148.tjqluX6P-lkp@intel.com>
References: <20260307103949.2340104-2-xukuohai@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307103949.2340104-2-xukuohai@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_092356_432905_DB0CA5FD 
X-CRM114-Status: GOOD (  11.93  )
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

Hi Xu,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Xu-Kuohai/bpf-Move-constants-blinding-from-JIT-to-verifier/20260307-181538
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20260307103949.2340104-2-xukuohai%40huaweicloud.com
patch subject: [bpf-next v7 1/5] bpf: Move constants blinding from JIT to verifier
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20260308/202603080148.tjqluX6P-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603080148.tjqluX6P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603080148.tjqluX6P-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/verifier.c: In function 'fixup_call_args':
>> kernel/bpf/verifier.c:23100:23: error: implicit declaration of function 'bpf_jit_blind_constants' [-Wimplicit-function-declaration]
   23100 |                 err = bpf_jit_blind_constants(env);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~


vim +/bpf_jit_blind_constants +23100 kernel/bpf/verifier.c

 23087	
 23088	static int fixup_call_args(struct bpf_verifier_env *env)
 23089	{
 23090	#ifndef CONFIG_BPF_JIT_ALWAYS_ON
 23091		struct bpf_prog *prog = env->prog;
 23092		struct bpf_insn *insn = prog->insnsi;
 23093		bool has_kfunc_call = bpf_prog_has_kfunc_call(prog);
 23094		int i, depth;
 23095	#endif
 23096		int err = 0;
 23097	
 23098		if (env->prog->jit_requested &&
 23099		    !bpf_prog_is_offloaded(env->prog->aux)) {
 23100			err = bpf_jit_blind_constants(env);
 23101			if (err)
 23102				return err;
 23103			err = jit_subprogs(env);
 23104			if (err == 0)
 23105				return 0;
 23106			if (err == -EFAULT)
 23107				return err;
 23108		}
 23109	#ifndef CONFIG_BPF_JIT_ALWAYS_ON
 23110		if (has_kfunc_call) {
 23111			verbose(env, "calling kernel functions are not allowed in non-JITed programs\n");
 23112			return -EINVAL;
 23113		}
 23114		if (env->subprog_cnt > 1 && env->prog->aux->tail_call_reachable) {
 23115			/* When JIT fails the progs with bpf2bpf calls and tail_calls
 23116			 * have to be rejected, since interpreter doesn't support them yet.
 23117			 */
 23118			verbose(env, "tail_calls are not allowed in non-JITed programs with bpf-to-bpf calls\n");
 23119			return -EINVAL;
 23120		}
 23121		for (i = 0; i < prog->len; i++, insn++) {
 23122			if (bpf_pseudo_func(insn)) {
 23123				/* When JIT fails the progs with callback calls
 23124				 * have to be rejected, since interpreter doesn't support them yet.
 23125				 */
 23126				verbose(env, "callbacks are not allowed in non-JITed programs\n");
 23127				return -EINVAL;
 23128			}
 23129	
 23130			if (!bpf_pseudo_call(insn))
 23131				continue;
 23132			depth = get_callee_stack_depth(env, insn, i);
 23133			if (depth < 0)
 23134				return depth;
 23135			bpf_patch_call_args(insn, depth);
 23136		}
 23137		err = 0;
 23138	#endif
 23139		return err;
 23140	}
 23141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

