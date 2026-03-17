Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D08BCFD7075
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 10:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xpp8V4Q88K8V7gjuRDopkWjxHHPPDoYcK06uaaXI85M=; b=d04b9BHWV7LHSn5k0c/6S6riKF
	FKUPRrO2KO67nS95zzrPCueTncvfCT/L4GrbQUTYm9X2nlRr1H+0I6J/IXcUUhM8fsgPKRQ3nyrc+
	SzV0DVETh64NqMKcpV6kvAWSqEj2oKwQ09PKv9Z9QbIVh/HgY+nat9Q1ILCsv0kSXwux1/xPorGSm
	FFz9RFkFiRexmYIe93yFjYhE+BNRrfAxrjKIVPO/2yYxxb8YGkqsNYVtjDtdJPrcyanRNkHvhl/po
	Fg0sDkAhuhxVBWLdczui41reBwA1PuSZSAEx9s/gTA7az4XgMiEvwRic4mYWBtLu5mo+dpjB/v5uo
	Ulwsy8xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2S5h-000000064Sv-3iLe;
	Tue, 17 Mar 2026 10:56:01 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2S5e-000000064Sb-1ebI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 10:56:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773744958; x=1805280958;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rXOjATTUi8wxb6WZdH8wP/yeOu/3DLjUMmxyBtYdHWQ=;
  b=M/aJIL+JtNvZE7enrCB/JHbmX1FzeVOmBYsTjqyyZmCueFiVzirt3pwr
   Kyrx/dCQcvhx34V2F8GuWR9XF9pgknoCba7SHaBlXDq9YDBfhyV/tecLw
   J/HCmufvZX3reKtV3UxFn9dvyaT1Um2FwM8LFwNPjelqwhahZUBcZtt3G
   U/XjnGptD1TqNk1yMK2+4r0M6pxTYW6IE8r9oyX4eNEyuNQmMRbEPY+x6
   0wC3g78IaH8F9BvI1YoT7dcX8lAQ9bKiNvh9B9ZDfxRdrNtHY2pHbpr4n
   GfgtCm5QONA0H7SIbJpy2rR0a5dE0/E4YdNVr/0/i5mCX9C9TSivu4OQu
   Q==;
X-CSE-ConnectionGUID: 3OvUYiDDTP6K4OU0aTcC+A==
X-CSE-MsgGUID: 81CwkRgBSB2my21LIVJY4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="73791762"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="73791762"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 03:55:54 -0700
X-CSE-ConnectionGUID: n/SGPSluTc2VciJcnqUI/Q==
X-CSE-MsgGUID: wx7avkihQ7W4fj4H8mE5kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="222459726"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Mar 2026 03:55:47 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2S5P-000000000HB-30v8;
	Tue, 17 Mar 2026 10:55:43 +0000
Date: Tue, 17 Mar 2026 18:55:03 +0800
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
Subject: Re: [bpf-next v8 1/5] bpf: Move constants blinding from JIT to
 verifier
Message-ID: <202603171843.yv0X1mn3-lkp@intel.com>
References: <20260309140044.2652538-2-xukuohai@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309140044.2652538-2-xukuohai@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_035558_816498_AA3E518A 
X-CRM114-Status: GOOD (  12.58  )
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

url:    https://github.com/intel-lab-lkp/linux/commits/Xu-Kuohai/bpf-Move-constants-blinding-from-JIT-to-verifier/20260309-214106
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20260309140044.2652538-2-xukuohai%40huaweicloud.com
patch subject: [bpf-next v8 1/5] bpf: Move constants blinding from JIT to verifier
config: powerpc64-randconfig-001-20260317 (https://download.01.org/0day-ci/archive/20260317/202603171843.yv0X1mn3-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260317/202603171843.yv0X1mn3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603171843.yv0X1mn3-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: kernel/bpf/core.o: in function `bpf_jit_blind_constants':
>> kernel/bpf/core.c:1467: undefined reference to `bpf_patch_insn_data'


vim +1467 kernel/bpf/core.c

  1429	
  1430	int bpf_jit_blind_constants(struct bpf_verifier_env *env)
  1431	{
  1432		struct bpf_insn insn_buff[16], aux[2];
  1433		struct bpf_prog *prog = env->prog;
  1434		int insn_delta, insn_cnt;
  1435		struct bpf_insn *insn;
  1436		int i, rewritten;
  1437	
  1438		if (!prog->blinding_requested || prog->blinded)
  1439			return 0;
  1440	
  1441		insn_cnt = prog->len;
  1442		insn = prog->insnsi;
  1443	
  1444		for (i = 0; i < insn_cnt; i++, insn++) {
  1445			if (bpf_pseudo_func(insn)) {
  1446				/* ld_imm64 with an address of bpf subprog is not
  1447				 * a user controlled constant. Don't randomize it,
  1448				 * since it will conflict with jit_subprogs() logic.
  1449				 */
  1450				insn++;
  1451				i++;
  1452				continue;
  1453			}
  1454	
  1455			/* We temporarily need to hold the original ld64 insn
  1456			 * so that we can still access the first part in the
  1457			 * second blinding run.
  1458			 */
  1459			if (insn[0].code == (BPF_LD | BPF_IMM | BPF_DW) &&
  1460			    insn[1].code == 0)
  1461				memcpy(aux, insn, sizeof(aux));
  1462	
  1463			rewritten = bpf_jit_blind_insn(insn, aux, insn_buff, prog->aux->verifier_zext);
  1464			if (!rewritten)
  1465				continue;
  1466	
> 1467			prog = bpf_patch_insn_data(env, i, insn_buff, rewritten);
  1468			if (!prog)
  1469				return -ENOMEM;
  1470	
  1471			env->prog = prog;
  1472			insn_delta = rewritten - 1;
  1473	
  1474			/* Walk new program and skip insns we just inserted. */
  1475			insn = prog->insnsi + i + insn_delta;
  1476			insn_cnt += insn_delta;
  1477			i        += insn_delta;
  1478		}
  1479	
  1480		prog->blinded = 1;
  1481		return 0;
  1482	}
  1483	#endif /* CONFIG_BPF_JIT */
  1484	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

