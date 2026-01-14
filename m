Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CC4D31A28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 08:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C/NnyVVxCgBClNBVo/1YIzVFqn3Nm57ufCsyfbrWaiA=; b=v3FkTs1Gi1zRLeBSkl8akCi7go
	VfEkl8WXfQqj0E0ME2pBf9DxxDh186C2uzkk0NdOFAcleysWCiW8yIbraAtACz+tYhI3Nm73/1htJ
	s3UqhbzNhYdIDrK2WqdQSNd0OcvwWhFvkBqpqCl9KFnfeKpyTfOXsl2mTiXkJOpCPFzC2WZajuYn+
	gAi3y+Qo8vCkguu8pzLVGCgRl7NvHSXGLx7Of+TepwzYV6CLLplKlI/kZ7FJjsxrBZ+o6D6jbEvYc
	QoQTfcW7O0Q9EkeVqW9usvk4mvLzqTBzJq0KNoEyouh7hQ2I0WbcbXZwSuiiTcfVbBbzwjJsZUH/L
	Qs3bkcvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwPe-00000008NKP-2KOK;
	Wed, 14 Jan 2026 08:39:34 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwPc-00000008NIs-00rZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 08:39:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768379972; x=1799915972;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FpbGobcUnn9BvrhoRngQbgrWv8+ZNcmz4Jg3YXrezBk=;
  b=e8wX8cklr+40k53+IkadO5BTU5GBmlQZ3YJjUm/C/fWw54bBOd3/lzlR
   qftAARhHKge7G5YQ30JWbRLmyUz4y7tbIZscx7zTGmJ41eLWde2bj3gex
   l38gSfcYYP0x30wXFhzn49s8BYo94A3BWlSFzXc8LDDES9VK6ggpXkcNE
   RLkUtyqPB+F1IITeOIKII29EANyYD2In72eaAiPBsHTLA3DVdoEfQ6o4u
   om68VJlF7AG2d0N42Gv6i0/tC6cVLGyicTABAVfrkVAFxGG3myoXdP8KA
   S3Vr99gZ8wrUEP2Ux5PQ/PdJvtBTICPa6vgXqFraRVFYJWz2Wr1j0aVJg
   w==;
X-CSE-ConnectionGUID: UnrgK5wNQ2mE3iJUG4swYA==
X-CSE-MsgGUID: Vqne/6L2S8mKMMXXcQL07A==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="80394581"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="80394581"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 00:39:28 -0800
X-CSE-ConnectionGUID: d7i21hmySbO6IqYbAmb+Lw==
X-CSE-MsgGUID: I70zfkCESle5ChLBYCnRuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="209079255"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Jan 2026 00:39:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfwPU-00000000G5I-1s7m;
	Wed, 14 Jan 2026 08:39:24 +0000
Date: Wed, 14 Jan 2026 16:38:45 +0800
From: kernel test robot <lkp@intel.com>
To: junan <junan76@163.com>, catalin.marinas@arm.com, will@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, junan76@163.com
Subject: Re: [PATCH] arm64: kconfig: Make STRICT_KERNEL_RWX visable.
Message-ID: <202601141630.sCPCgSYw-lkp@intel.com>
References: <20260114013859.498148-2-junan76@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114013859.498148-2-junan76@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_003932_054042_CDEE33DE 
X-CRM114-Status: GOOD (  11.74  )
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

Hi junan,

kernel test robot noticed the following build errors:

[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on linus/master v6.19-rc5 next-20260114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/junan/arm64-kconfig-Make-STRICT_KERNEL_RWX-visable/20260114-094935
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20260114013859.498148-2-junan76%40163.com
patch subject: [PATCH] arm64: kconfig: Make STRICT_KERNEL_RWX visable.
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20260114/202601141630.sCPCgSYw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601141630.sCPCgSYw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601141630.sCPCgSYw-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: arch/arm64/mm/mmu.o: in function `map_entry_trampoline':
>> mmu.c:(.init.text+0x578): undefined reference to `rodata_enabled'
   aarch64-linux-ld: arch/arm64/mm/mmu.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `rodata_enabled' which may bind externally can not be used when making a shared object; recompile with -fPIC
>> mmu.c:(.init.text+0x578): dangerous relocation: unsupported relocation
>> aarch64-linux-ld: mmu.c:(.init.text+0x584): undefined reference to `rodata_enabled'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

