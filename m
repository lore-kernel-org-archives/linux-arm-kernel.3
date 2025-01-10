Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB1DE7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 12:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vvn3UJ8KcYi8Xn4IiRZ/+lCFvA2Kre2AjrZTdRXYxgo=; b=iCw7CifrzaDdaCo65P4AJKhHHi
	kq3r37KZMleZxRO8VPmzFlmAErQAkaOuasMx5Iofeps96kVnBH9Q6GxYpp1VdIbAVLoF6RwA3Ytht
	hiNbSThCTOsNNb9GkObgmN2zwwoyNZnmAjwDdNmgKQWOZ+yg53KyQ4suH4qOcyTescJGZvgXQu79U
	yHcv3Jb5eNHejWRW97r4WVMIiGWW1fW/UROl8wPUek/IMwTBsDSoyL+PhHshZhTSHAGsH6caRwt4+
	H82HGxZW9t47xqtaBkENXclKCwDiU7zMrgyJzZaLIFKT0Ul7qbsQK8BVyFO40gxsG1pVVbwIT5cIe
	ScnmlZ6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWDyo-0000000FEbd-2PSS;
	Fri, 10 Jan 2025 12:19:10 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWDwx-0000000FEKE-1MfU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 12:17:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736511435; x=1768047435;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pCaqy0TV70zpA2C9umleMdUaaugCzRAc7t3yONUx9G0=;
  b=f/IoV/waGLBz0/ULQ9Do3GIa8hBHmnuThcUE4li2q/l635JC07ozbmIU
   Rjal9MqrQcLXjnwEfGsOmPmgaHynTXiYvuxrnC1SrhfnOnvw88CHFg71f
   nQBXUMQk/UIbiXDi5VycNWlDkwOji4GuAeVmXbGShM0jcXFK24ngmFbaC
   VNYjEZ2Sqwx+1S4kM67HkwbJNnQ4s4glvBHvNDzU+bsIOxKpQgmd4L8fp
   //LAyXRZ7OpHCcuxjAoa9WUkcIHR4GcY+8MOK4ncM3jDmR0FsSki6/Ont
   Oz/ykhBgjp7rKP7Gu1HLQsxEX4KApnd6meBhio25z+jkJvxIxT4e1SHDM
   w==;
X-CSE-ConnectionGUID: 6bsgwd88RZSbz+FruWU7mg==
X-CSE-MsgGUID: 8/u3cjO6TPKqemOFCVQvOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="39619728"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="39619728"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 04:17:14 -0800
X-CSE-ConnectionGUID: kC9N6R1QRfergmtgNji9Mw==
X-CSE-MsgGUID: /b2WQs2yQ1ufe5UhGxwYRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="108722874"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Jan 2025 04:17:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWDwq-000JCl-0e;
	Fri, 10 Jan 2025 12:17:08 +0000
Date: Fri, 10 Jan 2025 20:16:15 +0800
From: kernel test robot <lkp@intel.com>
To: Yoshihiro Furudera <fj5100bi@fujitsu.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 1/2] perf: Fujitsu: Add the Uncore MAC PMU driver
Message-ID: <202501101956.vOyuZzUh-lkp@intel.com>
References: <20250109054544.2342442-2-fj5100bi@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109054544.2342442-2-fj5100bi@fujitsu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_041715_411426_F3C0151C 
X-CRM114-Status: GOOD (  13.72  )
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

Hi Yoshihiro,

kernel test robot noticed the following build errors:

[auto build test ERROR on arm-perf/for-next/perf]
[also build test ERROR on linus/master v6.13-rc6 next-20250110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yoshihiro-Furudera/perf-Fujitsu-Add-the-Uncore-MAC-PMU-driver/20250109-135249
base:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git for-next/perf
patch link:    https://lore.kernel.org/r/20250109054544.2342442-2-fj5100bi%40fujitsu.com
patch subject: [PATCH v3 1/2] perf: Fujitsu: Add the Uncore MAC PMU driver
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20250110/202501101956.vOyuZzUh-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501101956.vOyuZzUh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501101956.vOyuZzUh-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/perf/fujitsu_mac_pmu.c: In function 'fujitsu_mac_counter_start':
>> drivers/perf/fujitsu_mac_pmu.c:41:31: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
      41 | #define EVSEL(__val)          FIELD_GET(MAC_EVTYPE_MASK, __val)
         |                               ^~~~~~~~~
   drivers/perf/fujitsu_mac_pmu.c:110:24: note: in expansion of macro 'EVSEL'
     110 |         writeq_relaxed(EVSEL(event->attr.config), macpmu->regs + MAC_PM_EVTYPE(idx));
         |                        ^~~~~


vim +/FIELD_GET +41 drivers/perf/fujitsu_mac_pmu.c

    39	
    40	/* MAC_PM_EVTYPEx */
  > 41	#define EVSEL(__val)          FIELD_GET(MAC_EVTYPE_MASK, __val)
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

