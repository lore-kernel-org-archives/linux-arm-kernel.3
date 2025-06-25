Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC428C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 20:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5G/XrJPOa3jtF6P+lrfSOEFcVocWUEiY6CM9D1rbFR8=; b=AYETUreFlpTo75zaf9Ix4+zuYE
	XCffiQSewpgVrZ3NnCezG2f1QtM6czVVM/zqs/2pS41pbiVXlzyS2ROhnQwxC947RKjNPAXvdFjoz
	xvfYnbfma+BmDDiKXzJx1tt2zUSGRacFqDdGRRRCB50X+1f2PKx6c5ktyqer0F0rW6I3wVfg/k/Hk
	0QD1FDsRMeOq75obSrlqpUPePgEYscCtrn90YtBlkp3HEOHqF3TNo1ruT1EfolBnFcHczBu5Fpcrg
	sBoZb/Zp6XWVJCgTUSxUJIfwkIWYhsb4FrCkS3EZS2wwLCnhwwta98roXL2UyboDsEm4XqoB55qqP
	GycZ4WXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUWPI-00000009oEj-1fyU;
	Wed, 25 Jun 2025 20:07:44 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUSsw-00000009GSb-2TVr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 16:22:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750868527; x=1782404527;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ou8QHMFdgetDzK5dLd56qGIJObazJQu5Eap283Iz/b8=;
  b=FtsCiTKiYt020/+qnyXRPX2JoG/mheA4Q2wr+Y6uy6iAwZzo1kmU77g1
   WXrJZEL7hEWrRsEZ/3Z7zWPc7G65PPUZVNW7kMWvGS+pms/6Yp2atf6sb
   fycGG0HRqxch5e6S+IZQezy7kHn0hdFcJxeE/7Ati3rOUFhrmXwdpro4H
   /REVvD8I85npUxSg+KRDQKG7GVKpjHTBjnCrWkRs2wBVUALeV1T8dVFFo
   hF7/2nl4vW0DFwNRNa/02jyLP24MCuH3QWsL3f7h/QrbBkfILlB5YuxXj
   SNPYMS4xekMvlOxrjDnErPBBA1GRU7O/nBqyzMgyJPoMxw+JTlI7QeoaJ
   Q==;
X-CSE-ConnectionGUID: wT4/KHPNTjuQ+1rXLoSaGw==
X-CSE-MsgGUID: NzTEYkL9S5SzsopFbrQ7xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53013155"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="53013155"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 09:22:05 -0700
X-CSE-ConnectionGUID: HE36SdgBRouSxKN5A3ZuUA==
X-CSE-MsgGUID: VNv6kMPsT8Gfurry55xSsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="175913297"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Jun 2025 09:21:59 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUSsm-000TIU-3C;
	Wed, 25 Jun 2025 16:21:56 +0000
Date: Thu, 26 Jun 2025 00:21:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>, james.morse@arm.com,
	linux-cxl@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-mm@kvack.org, gregkh@linuxfoundation.org,
	Will Deacon <will@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Davidlohr Bueso <dave@stgolabs.net>
Cc: oe-kbuild-all@lists.linux.dev, Yicong Yang <yangyicong@huawei.com>,
	linuxarm@huawei.com, Yushan Wang <wangyushan12@huawei.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, H Peter Anvin <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH v2 5/8] arm64: Select
 GENERIC_CPU_CACHE_INVALIDATE_MEMREGION
Message-ID: <202506260055.YivRG9iE-lkp@intel.com>
References: <20250624154805.66985-6-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624154805.66985-6-Jonathan.Cameron@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_092206_704960_09E9FA30 
X-CRM114-Status: GOOD (  12.52  )
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

Hi Jonathan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on driver-core/driver-core-testing]
[also build test WARNING on driver-core/driver-core-next driver-core/driver-core-linus arm64/for-next/core linus/master nvdimm/libnvdimm-for-next v6.16-rc3]
[cannot apply to nvdimm/dax-misc next-20250625]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Cameron/memregion-Support-fine-grained-invalidate-by-cpu_cache_invalidate_memregion/20250624-235402
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20250624154805.66985-6-Jonathan.Cameron%40huawei.com
patch subject: [PATCH v2 5/8] arm64: Select GENERIC_CPU_CACHE_INVALIDATE_MEMREGION
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20250626/202506260055.YivRG9iE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250626/202506260055.YivRG9iE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506260055.YivRG9iE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/cache.c:31:5: warning: no previous prototype for 'cpu_cache_invalidate_memregion' [-Wmissing-prototypes]
      31 | int cpu_cache_invalidate_memregion(int res_desc, phys_addr_t start, size_t len)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/base/cache.c:41:6: warning: no previous prototype for 'cpu_cache_has_invalidate_memregion' [-Wmissing-prototypes]
      41 | bool cpu_cache_has_invalidate_memregion(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/cpu_cache_invalidate_memregion +31 drivers/base/cache.c

b51d47491c68ae Yicong Yang 2025-06-24  30  
b51d47491c68ae Yicong Yang 2025-06-24 @31  int cpu_cache_invalidate_memregion(int res_desc, phys_addr_t start, size_t len)
b51d47491c68ae Yicong Yang 2025-06-24  32  {
b51d47491c68ae Yicong Yang 2025-06-24  33  	guard(spinlock_irqsave)(&scfm_lock);
b51d47491c68ae Yicong Yang 2025-06-24  34  	if (!scfm_data)
b51d47491c68ae Yicong Yang 2025-06-24  35  		return -EOPNOTSUPP;
b51d47491c68ae Yicong Yang 2025-06-24  36  
b51d47491c68ae Yicong Yang 2025-06-24  37  	return scfm_data->invalidate_memregion(res_desc, start, len);
b51d47491c68ae Yicong Yang 2025-06-24  38  }
b51d47491c68ae Yicong Yang 2025-06-24  39  EXPORT_SYMBOL_NS_GPL(cpu_cache_invalidate_memregion, "DEVMEM");
b51d47491c68ae Yicong Yang 2025-06-24  40  
b51d47491c68ae Yicong Yang 2025-06-24 @41  bool cpu_cache_has_invalidate_memregion(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

