Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D70AD6100A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 11:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RBEo/Svqm0cLFfg4wzSJrPaLy7zotxJ6WJBM+fy7R+I=; b=0kv+Cy857F6Kh3FibOVgnRiEgs
	x6rBw8odomx3RbSHvYQuPYN3MOGFCx9STUztvMVZO3lpiw0iQ8lobeW+B4bmujDop5nzjHgzmLEea
	/6f1PyT01cbZxYTZTJgfei/ibxqwV+j/hp1iTmfms410oyVYgtYB5VbI/JWt/k1iZez62x67JACJa
	a3pNyTEhQYwD7tMGlnFyY3pubO8XCcDynasc5/DdzVPRjfCexVmVGA4392j4LjgoT1CJszIB907X2
	PpeYFDcsGSMyAvNX5BPCd3qdtBsX7kNHMK5MlKCjZqqBKAAwymPIZDKVsajj82iQw/Mbfv6zMv+Sx
	mE1jsn3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlQDq-0000000030Z-3m1E;
	Thu, 29 Jan 2026 11:30:02 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlQDo-000000002zx-0qC8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 11:30:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769686200; x=1801222200;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UB4juRatoxAjJ3voumXxgnDhy7jKWgsXK0C2/0Q1LLs=;
  b=HUXkaBN5V5ta59XPAml+VcYPvCggbe1JoP08xRGhjn0YHu4OPCg2q/aj
   UOmin2tfnbxfDLjJKKFonpb5sxyztCiS1n3zCk1mxjtR611PLQtibxj7q
   06RDTVHgZjINeQnTgHMMhfn07cc3tU0k+kVxuZKAGqjpns9wj6JV0N6WA
   ghvjJ/eg48vPwT8TIFYsj3NH/xd4QuQm/UnZ1KQvFSFL1rQoN0IYl/HTV
   kmQ0nT6hexK8InBxTRz2mEeiaMO/RmEvQkU85F2yKLXG+fZxyqzCnYV/b
   jwuv1vvzIXXD6ncyzt9BhkzGcWRZlC4WHH80CbV2JCduDCbHRUeL/XX6R
   w==;
X-CSE-ConnectionGUID: CK67ALZvQpOvgcLDtQzWwQ==
X-CSE-MsgGUID: pFrOyo07R46X75PixSdO7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="58505808"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="58505808"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 03:29:59 -0800
X-CSE-ConnectionGUID: gqT750vBQPmTIOB1ggzl9A==
X-CSE-MsgGUID: l72yiMe7TB2WVPr+qRi90w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="213050661"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 29 Jan 2026 03:29:56 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlQDi-000000002Hd-1NJf;
	Thu, 29 Jan 2026 11:29:54 +0000
Date: Thu, 29 Jan 2026 12:29:21 +0100
From: kernel test robot <lkp@intel.com>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, nd <nd@arm.com>,
	"maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	Joey Gouly <Joey.Gouly@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	Timothy Hayes <Timothy.Hayes@arm.com>,
	"jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>
Subject: Re: [PATCH v4 35/36] KVM: arm64: selftests: Introduce a minimal
 GICv5 PPI selftest
Message-ID: <202601291246.oaOq5gRj-lkp@intel.com>
References: <20260128175919.3828384-36-sascha.bischoff@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128175919.3828384-36-sascha.bischoff@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_033000_256413_E76FA96A 
X-CRM114-Status: GOOD (  11.45  )
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

Hi Sascha,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on kvm/queue kvm/next]
[cannot apply to kvmarm/next linus/master kvm/linux-next v6.16-rc1 next-20260128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sascha-Bischoff/KVM-arm64-Account-for-RES1-bits-in-DECLARE_FEAT_MAP-and-co/20260129-022450
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20260128175919.3828384-36-sascha.bischoff%40arm.com
patch subject: [PATCH v4 35/36] KVM: arm64: selftests: Introduce a minimal GICv5 PPI selftest
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260129/202601291246.oaOq5gRj-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601291246.oaOq5gRj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601291246.oaOq5gRj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arm64/vgic_v5.c:171:11: warning: unused variable 'other' [-Wunused-variable]
     171 |         uint32_t other;
         |                  ^~~~~
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

