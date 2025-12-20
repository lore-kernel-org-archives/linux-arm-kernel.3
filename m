Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8F8E668B4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Dec 2025 17:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lzSJWm5izWCrO11sMgHpPdDIC3n2gLW0RftWAKtpbzc=; b=dAQsgyAGuL2SoPnw/mm76DVX/J
	aag5kuh3jJ1AXxAFTzi8GqpiibbVf3yFRI/r9oj3n2JVwwicDANk+1Hb5p7swZi/V6Q/ZKeNfDL6s
	vJZ3DPwx2Gk5QTokpu4EkaWRnOAyFSyF11rDOBSpCbgK9/qWLG8gmuJ8zRbG0+RxMtcwwJpb2jHl5
	n37v4+odiDtq51e6llhGN4gjZSTydOfcoA9Dnaqq+g7gP7TMmnmewd3UcVEtedUi0haLeVYZjtk9x
	y35G6IFdjfdzXLlF6+TGGja+BxI/tl2mV/QU7Q4kWdW8vuraHO7DPAZMGrSOa3mHFzXcE+7reLvV7
	q2h1VM7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vX0YN-0000000Bm8Y-0aXr;
	Sat, 20 Dec 2025 17:15:39 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vX0YI-0000000Bm8C-3FoM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Dec 2025 17:15:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766250934; x=1797786934;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Hcqx9K9e2DdZM+fc4kG1hUDJm+AVPCZc+SF3IRp/b7A=;
  b=Ar1IZ9oosIkjf9zXWs530UDURTyZ8JdB3/nqNJmhI3rYo1ResbZcMrRf
   2a7KgQRwvGKOIjxq0DGP3h4Cjfxv9Dfrbq7VNCJS/4d0I7JcrXtemf990
   HZalWeY+dCXorxtXGldr88FE5/BtETog2FJGNbRicKId0bD+QLqxX9jpC
   D0y0US3YUibSpeW9W4FMwiNpCRAz/HEpcmC0KtiCKrzZhZEo/6oURBIC1
   s4Ht/A/Jcbylu3KbBm0eMZ4eAzMKTYS7Rb61cHxecsOeAocY18/6ZON66
   Sf1siF9fiDXJj1PuThGnZMMsQQmLl8HIj6tnGvBA1mj9afvsnhM+YNkpo
   g==;
X-CSE-ConnectionGUID: Nf4DTv4kQYudY5c9NuV0uA==
X-CSE-MsgGUID: PS3YV6dXQtCQ131TRGI8IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="67931012"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="67931012"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 09:15:34 -0800
X-CSE-ConnectionGUID: xj9DdeaKSq6vz1gN+HADYg==
X-CSE-MsgGUID: upGwtnYiSQCeULUBwleOSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199046442"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Dec 2025 09:15:30 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX0YB-000000004vl-3lXj;
	Sat, 20 Dec 2025 17:15:27 +0000
Date: Sun, 21 Dec 2025 01:15:12 +0800
From: kernel test robot <lkp@intel.com>
To: Alain Volmat <alain.volmat@foss.st.com>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH 01/12] media: stm32: dcmi: Switch from __maybe_unused to
 pm_sleep_ptr()
Message-ID: <202512210044.xNNW6QJZ-lkp@intel.com>
References: <20251218-stm32-dcmi-dma-chaining-v1-1-39948ca6cbf6@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218-stm32-dcmi-dma-chaining-v1-1-39948ca6cbf6@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_091534_909113_64FFAFD1 
X-CRM114-Status: GOOD (  11.71  )
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

Hi Alain,

kernel test robot noticed the following build warnings:

[auto build test WARNING on atorgue-stm32/stm32-next]
[also build test WARNING on robh/for-next linus/master v6.19-rc1 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alain-Volmat/media-stm32-dcmi-Switch-from-__maybe_unused-to-pm_sleep_ptr/20251219-024836
base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
patch link:    https://lore.kernel.org/r/20251218-stm32-dcmi-dma-chaining-v1-1-39948ca6cbf6%40foss.st.com
patch subject: [PATCH 01/12] media: stm32: dcmi: Switch from __maybe_unused to pm_sleep_ptr()
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20251221/202512210044.xNNW6QJZ-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210044.xNNW6QJZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210044.xNNW6QJZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/st/stm32/stm32-dcmi.c:2127:12: warning: 'dcmi_resume' defined but not used [-Wunused-function]
    2127 | static int dcmi_resume(struct device *dev)
         |            ^~~~~~~~~~~
>> drivers/media/platform/st/stm32/stm32-dcmi.c:2116:12: warning: 'dcmi_suspend' defined but not used [-Wunused-function]
    2116 | static int dcmi_suspend(struct device *dev)
         |            ^~~~~~~~~~~~


vim +/dcmi_resume +2127 drivers/media/platform/st/stm32/stm32-dcmi.c

  2115	
> 2116	static int dcmi_suspend(struct device *dev)
  2117	{
  2118		/* disable clock */
  2119		pm_runtime_force_suspend(dev);
  2120	
  2121		/* change pinctrl state */
  2122		pinctrl_pm_select_sleep_state(dev);
  2123	
  2124		return 0;
  2125	}
  2126	
> 2127	static int dcmi_resume(struct device *dev)
  2128	{
  2129		/* restore pinctl default state */
  2130		pinctrl_pm_select_default_state(dev);
  2131	
  2132		/* clock enable */
  2133		pm_runtime_force_resume(dev);
  2134	
  2135		return 0;
  2136	}
  2137	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

