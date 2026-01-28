Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9DED25B48
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 12:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DffyQC4Cucd/5UZil+qyIvLPTptHa4pIhfTfJoQ1+uM=; b=2Zw8KYF8tTWPvMg9hVvhYQOhkd
	SZNDJQRiieQfdu1OhsuOoZlBZWhGeV5aGo+qYdEt0fZmz2mvd8XUBovFM3MCjs1zQxiKjkPx2kINL
	SgFpvO3YoZBOnqIgSnq9NwTgZJKpyvIFxSOhWadF2Q15ZLfaer5DvDyjUeHTPRZkVnCzOYcubQOVQ
	v3Bg5wqCReL0Q/OOGNmTqbtLgETVRBV9dBSlW6MmNbrtSMV5IB52YNKUMlMBOSdt0jcq3vo9R4l31
	eyjZPOIdpWFT6gJwFlo0OqYhrA4gwUbdlEUb/PvfGayiYfJGlXWjO4AIyVMTLwiGxAbrkxINYph43
	P3V99Rpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl4VT-0000000Fz3v-2s5S;
	Wed, 28 Jan 2026 12:18:47 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl4VQ-0000000Fz38-2DaF;
	Wed, 28 Jan 2026 12:18:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769602725; x=1801138725;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=irHF387VhKHjsOnpsnW9NUk3sxxbxWzln/uy9xgtwqM=;
  b=D3OHmmEsjUklNavAl49U2/+ZfpomUTMO1jjMRswpLZR97IBYtFJ31ZBt
   x7kJaa0yX5t/Qk8q31MGwUPlZCST8PYhx0Lpz68DKE0O6Elu4oEPxDqrU
   +BPHwQTUWado9qgbNEwNnSzJYKltBR6Tn6AotiHHc8g4HOwJCjYfwmMF7
   o+tm0cE70FtexmZQZ8AQXSnyIfHfM3pYfeNM+SWXI/IR2C+dzj8rSmsMG
   Y/gdiiIxoTKxWEuZegNM3JP6xnIkYvPvqLrYjLeoV/yVprGSrcB/hOcB2
   YyEIkj+mE7is7w9kjaeEVUMBeafqfjw/s/ndCi1uEDhEemqO4Hkl5O+dS
   Q==;
X-CSE-ConnectionGUID: VQkGhQ5uRUe0FiiquH5crg==
X-CSE-MsgGUID: j38+SUOERP6su/DVFanKVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="93469833"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="93469833"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 04:18:43 -0800
X-CSE-ConnectionGUID: Q7Z5V0R1RjCKaaK9/1JSxA==
X-CSE-MsgGUID: tIAdhHReTWOiiIA7g/WWbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="212353797"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 28 Jan 2026 04:18:35 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vl4VE-00000000ZeC-2fMW;
	Wed, 28 Jan 2026 12:18:32 +0000
Date: Wed, 28 Jan 2026 20:18:08 +0800
From: kernel test robot <lkp@intel.com>
To: "Kalyazin, Nikita" <kalyazin@amazon.co.uk>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"kernel@xen0n.name" <kernel@xen0n.name>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"maz@kernel.org" <maz@kernel.org>,
	"oupton@kernel.org" <oupton@kernel.org>,
	"joey.gouly@arm.com" <joey.gouly@arm.com>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>,
	"seanjc@google.com" <seanjc@google.com>,
	"tglx@kernel.org" <tglx@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
	"luto@kernel.org" <luto@kernel.org>
Subject: Re: [PATCH v10 01/15] set_memory: set_direct_map_* to take address
Message-ID: <202601282023.vzRHJBfU-lkp@intel.com>
References: <20260126164445.11867-2-kalyazin@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126164445.11867-2-kalyazin@amazon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_041844_957065_F9FB8343 
X-CRM114-Status: UNSURE (   9.83  )
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

Hi Nikita,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0499add8efd72456514c6218c062911ccc922a99]

url:    https://github.com/intel-lab-lkp/linux/commits/Kalyazin-Nikita/set_memory-set_direct_map_-to-take-address/20260127-005641
base:   0499add8efd72456514c6218c062911ccc922a99
patch link:    https://lore.kernel.org/r/20260126164445.11867-2-kalyazin%40amazon.com
patch subject: [PATCH v10 01/15] set_memory: set_direct_map_* to take address
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20260128/202601282023.vzRHJBfU-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601282023.vzRHJBfU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601282023.vzRHJBfU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/loongarch/mm/pageattr.c:211:16: error: redefinition of 'addr' with a different type: 'unsigned long' vs 'const void *'
     211 |         unsigned long addr = (unsigned long)addr;
         |                       ^
   arch/loongarch/mm/pageattr.c:209:48: note: previous definition is here
     209 | int set_direct_map_invalid_noflush(const void *addr)
         |                                                ^
   1 error generated.


vim +211 arch/loongarch/mm/pageattr.c

   208	
   209	int set_direct_map_invalid_noflush(const void *addr)
   210	{
 > 211		unsigned long addr = (unsigned long)addr;
   212	
   213		if ((unsigned long)addr < vm_map_base)
   214			return 0;
   215	
   216		return __set_memory((unsigned long)addr, 1, __pgprot(0),
   217				    __pgprot(_PAGE_PRESENT | _PAGE_VALID));
   218	}
   219	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

