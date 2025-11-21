Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D66CFC28C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 17:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h0Ln7Qy0WzK6KcwM+QrZ+sKZlNXZITj0EzL0IqlThdI=; b=JH/prLnHtai6bAOeG7/0ctbJsG
	KvkCxeqNwQd8W0IqyI1xO+tuzdtW7184SGwHA+9gAZakdd5IIfTp/vt3YbFcejOUj1ibHTYDPpFXl
	dkY+e7O4mqkU7AGQf8qlOpbmsLDAgkLtQwMZ2eXmeHKfwK4g6VGN5Nnqe+za4g+XvneLatQIlxY6s
	kaOQgyvTXB64A79QkCZr6mJPi/r3TbjGWkm5LiymWJBfF/pNB1PQF/jbIJdOh90YWLn1Nf5bMmj1k
	Vam0xfj9CZUs3XPck8avmWsvPHg8xzxEE0FLm0BObodUPU/4nxcZEpuq0twxMp6WAf6pqO1dzIf0G
	9vCfBWSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMUiC-00000008mog-0sOK;
	Fri, 21 Nov 2025 17:14:20 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMUiA-00000008moI-1EO4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 17:14:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763745259; x=1795281259;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=150knvdVimP1Sxf+IHS3A/Uh2qRTdjSQ1ygg39BCet0=;
  b=OzaXz1naJnKJSEtDak9zlYApSCxERwPr0cV97YD+ft3SorACLSOQVvVE
   C2LNGg7wA0Iqi4MR8cp+1OBvlXmZgW0XIZGLEZkBSi9/V9XlGru3bcXw9
   EDhXg5r+bHvLnz88vtE+jsRKT6etQvJa5KMECgKy51apU5Ercb7v12UHI
   YsA/mJH3YzEHolG5iH69OC5SKJ6BnGRIveVweqdH+sMZScXoL+srM62Wj
   L7y4wT990gErW3t+UcJd6do/fz/gphlTeX7/igYsfvYX3qIInI+L5sR7r
   I/wfUz0lenxYqcJAUMiTn7Mul40sMUCA086onjAgXhDDVXmxfgyTxvFDe
   Q==;
X-CSE-ConnectionGUID: lbgy9WOtR/K2GI4oLOG8vg==
X-CSE-MsgGUID: /Ro6fmhnQeS7dnqovSkuzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65792216"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="65792216"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 09:14:18 -0800
X-CSE-ConnectionGUID: qu6B9a0bRZ21y0YvoYxbGg==
X-CSE-MsgGUID: Ssd/qetKQuewq4dpfK3Qcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="196687127"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 Nov 2025 09:14:12 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMUi1-0006dT-2W;
	Fri, 21 Nov 2025 17:14:09 +0000
Date: Sat, 22 Nov 2025 01:13:52 +0800
From: kernel test robot <lkp@intel.com>
To: Eugen Hristev <eugen.hristev@linaro.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	tglx@linutronix.de, andersson@kernel.org, pmladek@suse.com,
	rdunlap@infradead.org, corbet@lwn.net, david@redhat.com,
	mhocko@suse.com
Cc: oe-kbuild-all@lists.linux.dev, tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org, jonechou@google.com,
	rostedt@goodmis.org, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org, tony.luck@intel.com, kees@kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: Re: [PATCH 03/26] mm/percpu: Annotate static information into
 meminspect
Message-ID: <202511220009.u6dJXVkB-lkp@intel.com>
References: <20251119154427.1033475-4-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119154427.1033475-4-eugen.hristev@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_091418_396777_8A96C99A 
X-CRM114-Status: GOOD (  12.29  )
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

Hi Eugen,

kernel test robot noticed the following build errors:

[auto build test ERROR on rppt-memblock/fixes]
[also build test ERROR on linus/master v6.18-rc6]
[cannot apply to akpm-mm/mm-everything rppt-memblock/for-next next-20251121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eugen-Hristev/kernel-Introduce-meminspect/20251119-235912
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock.git fixes
patch link:    https://lore.kernel.org/r/20251119154427.1033475-4-eugen.hristev%40linaro.org
patch subject: [PATCH 03/26] mm/percpu: Annotate static information into meminspect
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20251122/202511220009.u6dJXVkB-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511220009.u6dJXVkB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511220009.u6dJXVkB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/percpu.c:90:
>> mm/percpu.c:3350:25: error: '__per_cpu_offset' undeclared here (not in a function); did you mean '__per_cpu_start'?
    3350 | MEMINSPECT_SIMPLE_ENTRY(__per_cpu_offset);
         |                         ^~~~~~~~~~~~~~~~
   include/linux/meminspect.h:92:64: note: in definition of macro 'MEMINSPECT_ENTRY'
      92 |                                                .va = (void *)&(sym),            \
         |                                                                ^~~
   mm/percpu.c:3350:1: note: in expansion of macro 'MEMINSPECT_SIMPLE_ENTRY'
    3350 | MEMINSPECT_SIMPLE_ENTRY(__per_cpu_offset);
         | ^~~~~~~~~~~~~~~~~~~~~~~


vim +3350 mm/percpu.c

  3349	
> 3350	MEMINSPECT_SIMPLE_ENTRY(__per_cpu_offset);
  3351	/*
  3352	 * pcpu_nr_pages - calculate total number of populated backing pages
  3353	 *
  3354	 * This reflects the number of pages populated to back chunks.  Metadata is
  3355	 * excluded in the number exposed in meminfo as the number of backing pages
  3356	 * scales with the number of cpus and can quickly outweigh the memory used for
  3357	 * metadata.  It also keeps this calculation nice and simple.
  3358	 *
  3359	 * RETURNS:
  3360	 * Total number of populated backing pages in use by the allocator.
  3361	 */
  3362	unsigned long pcpu_nr_pages(void)
  3363	{
  3364		return data_race(READ_ONCE(pcpu_nr_populated)) * pcpu_nr_units;
  3365	}
  3366	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

