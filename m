Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E6ECAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 21:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eUaGoPV7fIM2EDuQxD1SxHaeYYbBNgBpqAELlef73FY=; b=flitxU2SGryhU7ijZPvLK5gS0l
	RPEU7Vd4cpa6q3pAopZktpD1k5Z0K10p20u87A/iK7lVHtZUqbQyt1BMSvDvvQEWrgKJq2pCQytL+
	Hn/rCZQ1fE2UtQzCvpNJG+UTBw8dcG48563wfzo3EuzSROuKkxeqUZN02EcP6+OHQo6e/85HYZD7b
	Ugw4LpbiSBkTtaH9lDGxiEhfZ8BZhVdEyT30y/H3xGqsx4ANx4F9STwt7pK5pZi8rdneya8gykAv1
	fWLamDFgcTqPuDEtR08cXN0O2IJpeGU4sw7w66QswSJFrr/BFY9ffu3ochlgSz1+FfkWl7aLd1My6
	r2GfUidA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0S5v-00000008IZ2-04L3;
	Sun, 21 Sep 2025 21:59:43 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0S5r-00000008IYc-3Stj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 21:59:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758491980; x=1790027980;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M2v7sfpTNNCmcFOkAb0KWsTGiwbSzGag6VBqaXtIdoQ=;
  b=Eb3bP6Gob509km8khJbyVpvDNCm2fouZQejACR/p4sdJL9AYiM8Jl8f4
   DPzygfzVP/DTDMuPE9ssJ1Q5gzEbj93Qcp8QNLELAWAvpmq2geozYbUns
   V2zXIHQv8XM0QmotjqWxfNE2UWodz3U9Uel9bhBEfCf+Xeus9VaTMbSbj
   8mH2MvNZ7Z89X9bpudFwE/2tToYE3c9LFGZXZWXJMmSeIlbSoCvYVM+9/
   ypISPjM+bqU6W/vZqBnypf1wsR5CxncCj6yWa7XwkL9eIIrYwKJEOR3ze
   S4iPQceKjfTkTSCJDI1IEeVQLAvIK8IJDHdRX4LTDWEs1Kvstkd4JtH78
   Q==;
X-CSE-ConnectionGUID: TnKcNAIKQ6mJttHWdUbwDg==
X-CSE-MsgGUID: 78A1ZkUzSCO2UydWlSJz4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60671427"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60671427"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 14:59:38 -0700
X-CSE-ConnectionGUID: l17xTKIzSS2SgRiJlaW/5w==
X-CSE-MsgGUID: C+Ft5zF3SlWfsyqfo6lDCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="181581299"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 21 Sep 2025 14:59:34 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0S5S-00012D-0Y;
	Sun, 21 Sep 2025 21:59:20 +0000
Date: Mon, 22 Sep 2025 05:58:14 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb+git@google.com>,
	linux-arm-kernel@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, herbert@gondor.apana.org.au,
	ebiggers@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Kees Cook <keescook@chromium.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 4/5] arm64/fpsimd: Require kernel NEON begin/end calls
 from the same scope
Message-ID: <202509220514.RnYqxP9V-lkp@intel.com>
References: <20250918063539.2640512-11-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918063539.2640512-11-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_145939_940269_9EF239CD 
X-CRM114-Status: GOOD (  12.01  )
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

Hi Ard,

kernel test robot noticed the following build errors:

[auto build test ERROR on f83ec76bf285bea5727f478a68b894f5543ca76e]

url:    https://github.com/intel-lab-lkp/linux/commits/Ard-Biesheuvel/crypto-arm64-aes-ce-ccm-Avoid-pointless-yield-of-the-NEON-unit/20250918-143859
base:   f83ec76bf285bea5727f478a68b894f5543ca76e
patch link:    https://lore.kernel.org/r/20250918063539.2640512-11-ardb%2Bgit%40google.com
patch subject: [PATCH 4/5] arm64/fpsimd: Require kernel NEON begin/end calls from the same scope
config: arm64-randconfig-r132-20250920 (https://download.01.org/0day-ci/archive/20250922/202509220514.RnYqxP9V-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250922/202509220514.RnYqxP9V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509220514.RnYqxP9V-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/dc_fpu.c:27:
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/dc_fpu.c: In function 'dc_fpu_begin':
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dc_trace.h:42:9: error: expected 'while' before 'trace_dcn_fpu'
      42 |         trace_dcn_fpu(begin, function, line, ref_count)
         |         ^~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/dc_fpu.c:86:9: note: in expansion of macro 'TRACE_DCN_FPU'
      86 |         TRACE_DCN_FPU(true, function_name, line, depth);
         |         ^~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/dc_fpu.c:106:11: error: 'else' without a previous 'if'
     106 |         } else {
         |           ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/dc_fpu.c: At top level:
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/dc_fpu.c:99:6: warning: 'dc_fpu_end' defined but not used [-Wunused-function]
      99 | void dc_fpu_end(const char *function_name, const int line)
         |      ^~~~~~~~~~


vim +42 drivers/gpu/drm/amd/amdgpu/../display/dc/dc_trace.h

8b198f6e94d669 Rodrigo Siqueira 2020-09-09  25  
8b198f6e94d669 Rodrigo Siqueira 2020-09-09  26  #define TRACE_DC_PIPE_STATE(pipe_ctx, index, max_pipes) \
8b198f6e94d669 Rodrigo Siqueira 2020-09-09  27  	for (index = 0; index < max_pipes; ++index) { \
8b198f6e94d669 Rodrigo Siqueira 2020-09-09  28  		struct pipe_ctx *pipe_ctx = &dc->current_state->res_ctx.pipe_ctx[index]; \
8b198f6e94d669 Rodrigo Siqueira 2020-09-09  29  		if (pipe_ctx->plane_state) \
8b198f6e94d669 Rodrigo Siqueira 2020-09-09  30  			trace_amdgpu_dm_dc_pipe_state(pipe_ctx->pipe_idx, pipe_ctx->plane_state, \
8b198f6e94d669 Rodrigo Siqueira 2020-09-09  31  						      pipe_ctx->stream, &pipe_ctx->plane_res, \
8b198f6e94d669 Rodrigo Siqueira 2020-09-09  32  						      pipe_ctx->update_flags.raw); \
8b198f6e94d669 Rodrigo Siqueira 2020-09-09  33  	}
13b5ca42ca9c96 Rodrigo Siqueira 2020-09-10  34  
13b5ca42ca9c96 Rodrigo Siqueira 2020-09-10  35  #define TRACE_DCE_CLOCK_STATE(dce_clocks) \
13b5ca42ca9c96 Rodrigo Siqueira 2020-09-10  36  	trace_amdgpu_dm_dce_clocks_state(dce_clocks)
13b5ca42ca9c96 Rodrigo Siqueira 2020-09-10  37  
13b5ca42ca9c96 Rodrigo Siqueira 2020-09-10  38  #define TRACE_DCN_CLOCK_STATE(dcn_clocks) \
13b5ca42ca9c96 Rodrigo Siqueira 2020-09-10  39  	trace_amdgpu_dm_dc_clocks_state(dcn_clocks)
96ee63730fa306 Rodrigo Siqueira 2021-07-26  40  
2d8471dc371f36 Rodrigo Siqueira 2021-07-26  41  #define TRACE_DCN_FPU(begin, function, line, ref_count) \
2d8471dc371f36 Rodrigo Siqueira 2021-07-26 @42  	trace_dcn_fpu(begin, function, line, ref_count)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

