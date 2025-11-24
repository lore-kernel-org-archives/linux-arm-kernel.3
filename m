Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC379CFD36B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 23:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JSHGeG0jpaMjzNhlxnkLby56trt5IVgXcaEJG3EKMpM=; b=E6SUohEz7yZk6QrhBG90wHVzBz
	U20+wVkpUtopgnf4GgBVg516/Kt90WAcX591I07RqJz5SVmQevJ+szLdzX4KRmxkstyRWiO59oyUp
	RT0S+fkyQKOmvGBey01bK5+KEzVe3NOJiworVy69NLG2Bc0HsRFbex8LYGdw1csqfhUhutnEqZtbJ
	Pyvw+J9xLvgVlPy15lUzornjBnY0lbtctIBa72vffZuRsng5FjYnjy3a3Lr1kJXF5OSlAN0Dlboib
	m0lMmpQwMhNMRvZ700IHx+9yVbHz2Js/fYG5HJwcqJj82NCIwfXoIA4PZo/zzs6iDGHPQwO9kfYH0
	wBCUQPiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNgDr-0000000CTJK-306i;
	Mon, 24 Nov 2025 23:43:55 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNgDp-0000000CTIp-11E9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 23:43:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764027833; x=1795563833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YrWfnZe2MPZnWLoIh8rERcUnyO9mqwiEoI+7VQUvgaI=;
  b=F1d0Oopkz4K7gDGtObtg98UnhgLyP8PhZiaqUeeozy6u6EYVIz+rxhDD
   Yxy8FKfwjb04tEdXoMeFXUWrQ1tKexBn0oJ2CasdgwCN3IklBr6NXdaqG
   KO6yA4zTi8jdiy9UYX9pKrhEDoRcZIXDSu4ZOzp/osx9ChcnxjbSzEJYS
   ZAL6LS+TeCgSiyR4MHVrZjIBKOpVG5tDahlP/FFYc3uMWp0Zl52FQKa0O
   CUcBktuZxemgCk3fmhJL6CsIZAhG4CqJgRqWae5a4lyImJuw9MwDozBvy
   4Ewhv5aYLs18YAeM25SnfvhsDr6bY65oRmKqzfl4i/UetjO/reAG7t967
   A==;
X-CSE-ConnectionGUID: 4PGS8owjS+Smhiif2V0q2w==
X-CSE-MsgGUID: nggOp1QcRAavE3i8uYd+CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="83656672"
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="83656672"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 15:43:50 -0800
X-CSE-ConnectionGUID: /oW5RhYbRj6XpepS+d2rUQ==
X-CSE-MsgGUID: 6mxuaXEQSby26DxFhDeiZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="192365847"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 24 Nov 2025 15:43:47 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNgDf-000000001DB-3xiU;
	Mon, 24 Nov 2025 23:43:43 +0000
Date: Tue, 25 Nov 2025 07:43:31 +0800
From: kernel test robot <lkp@intel.com>
To: Oliver Upton <oupton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Subject: [arm-platforms:kvm-arm64/feat_xnx 58/69]
 arch/arm64/kvm/at.c:1661:22: error: expected string literal before
 '__LSE_PREAMBLE'
Message-ID: <202511250700.kAutzJFm-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_154353_321148_AF2F5BEA 
X-CRM114-Status: UNSURE (   8.87  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/feat_xnx
head:   b11e3a28eae505407614e967167e0ffb62262ef0
commit: cdb7d03d475199ccc94a87254a91566c05038446 [58/69] KVM: arm64: Add helper for swapping guest descriptor
config: arm64-randconfig-002-20251125 (https://download.01.org/0day-ci/archive/20251125/202511250700.kAutzJFm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511250700.kAutzJFm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511250700.kAutzJFm-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/at.c: In function '__lse_swap_desc':
>> arch/arm64/kvm/at.c:1661:22: error: expected string literal before '__LSE_PREAMBLE'
    1661 |         asm volatile(__LSE_PREAMBLE
         |                      ^~~~~~~~~~~~~~


vim +/__LSE_PREAMBLE +1661 arch/arm64/kvm/at.c

  1653	
  1654	static int __lse_swap_desc(u64 __user *ptep, u64 old, u64 new)
  1655	{
  1656		u64 tmp = old;
  1657		int ret = 0;
  1658	
  1659		uaccess_enable_privileged();
  1660	
> 1661		asm volatile(__LSE_PREAMBLE
  1662			     "1: cas	%[old], %[new], %[addr]\n"
  1663			     "2:\n"
  1664			     _ASM_EXTABLE_UACCESS_ERR(1b, 2b, %w[ret])
  1665			     : [old] "+r" (old), [addr] "+Q" (*ptep), [ret] "+r" (ret)
  1666			     : [new] "r" (new)
  1667			     : "memory");
  1668	
  1669		uaccess_disable_privileged();
  1670	
  1671		if (ret)
  1672			return ret;
  1673		if (tmp != old)
  1674			return -EAGAIN;
  1675	
  1676		return ret;
  1677	}
  1678	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

