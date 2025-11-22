Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A409ACFC510
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Nov 2025 00:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XnTxzMXAj4C+H3rJQAtbVjm3gxEOt7ieVLNhLtxygHk=; b=Q4HEGRhcHihlVSQCfABl06jAfr
	dt9F6ij8dZ+x9HHMsND0Fa/WLY4u8r9MuuXbLCEjGUATPr6ZLx0A6RKEMC+V3N6CN0lv/2YNV3Tpr
	MuK03PjHAv4/yO9ZPfvp8l0PbD+FTR3aKqIWrArhwg5m1TFE7ZyNVYB26HpXaRCpxY8Z6kRdw7Lo6
	gGcIvuQfBt3fLyjPCoW6rFcxZSGt+nRvTJgro31oG6WZac3Dg9t37fIHweG+fBGtrlBCCprPJT/Sp
	85mOcswrwEu7EP2cyjqCJLJ/dslWF5hTzZUTGUZD694t8N58g8QlxWBaXjsXmeAQmA3OhOdAaXpqn
	s1c+UYoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMb7m-000000095az-3WPx;
	Sat, 22 Nov 2025 00:05:10 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMb7i-000000095aa-0JZb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Nov 2025 00:05:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763769906; x=1795305906;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lKk63OBIxTgAZL2BQA9bHbccK1TAmQ6Nota8WFvpBkg=;
  b=lo+1hFAxH06+sytQZxKbwsDz0D4+BSsgFqQn+9GNccChG+4jv4Mn5OHt
   fK/gvRxyVI13LnIYqns1QtNh87sxMgAj3pfoQHY6JMRP8QQVEuiy7hb0P
   05ZCLzPmyYifqbRErYklia0iA4h5QCek86ussYMTzmrKDwBQ4kgBNiyBF
   +ZbUF+0Ldp70eI9mPN57stORcg1exZ+xWSjZnxHPRI9tXkVy3exhF5yJV
   Mp72Yv03CgCCjJWcug/Yi+SJylt1vYGLEoqb7U5tm6T5JIXpDrIGGC2kW
   TRp+QsrlFIk6I3ZS2EzUf1TbAjec22yRtgbtnefe8BNUsnjmWhfFWEUeD
   A==;
X-CSE-ConnectionGUID: 6VpE+u4jTGyLb3+jaomA8g==
X-CSE-MsgGUID: pc97GjOmRO+jcxX0rjDsDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="76980198"
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; 
   d="scan'208";a="76980198"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 16:05:05 -0800
X-CSE-ConnectionGUID: 0m1MqlNQSeC7xJO5WxDOzw==
X-CSE-MsgGUID: PhKw3WinTWa2mGSgArHQNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; 
   d="scan'208";a="196760418"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 Nov 2025 16:04:59 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMb7Y-0006zb-2u;
	Sat, 22 Nov 2025 00:04:56 +0000
Date: Sat, 22 Nov 2025 08:04:02 +0800
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
Subject: Re: [PATCH 01/26] kernel: Introduce meminspect
Message-ID: <202511220712.LEcYEMJx-lkp@intel.com>
References: <20251119154427.1033475-2-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119154427.1033475-2-eugen.hristev@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_160508_459364_13A5C050 
X-CRM114-Status: UNSURE (   9.74  )
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

Hi Eugen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rppt-memblock/fixes]
[also build test WARNING on linus/master v6.18-rc6]
[cannot apply to akpm-mm/mm-everything rppt-memblock/for-next next-20251121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eugen-Hristev/kernel-Introduce-meminspect/20251119-235912
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock.git fixes
patch link:    https://lore.kernel.org/r/20251119154427.1033475-2-eugen.hristev%40linaro.org
patch subject: [PATCH 01/26] kernel: Introduce meminspect
config: nios2-randconfig-r131-20251122 (https://download.01.org/0day-ci/archive/20251122/202511220712.LEcYEMJx-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511220712.LEcYEMJx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511220712.LEcYEMJx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/meminspect/meminspect.c:15:1: sparse: sparse: symbol 'meminspect_notifier_list' was not declared. Should it be static?

vim +/meminspect_notifier_list +15 kernel/meminspect/meminspect.c

    14	
  > 15	ATOMIC_NOTIFIER_HEAD(meminspect_notifier_list);
    16	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

