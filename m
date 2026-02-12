Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73945EE3698
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 17:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b0bGfBtsshybJNoW1WLUiij5rh5sE0Hl/GX4YKD6038=; b=5Evt/VrkaYB/viKemdLfBdxvKD
	ByPJAhEV/LWrDmX1lx89CfNgxPS+yqkMwAcOBUorA+sPcn2EalbSIPB8ofZgt0RmGd6DaKzePP5RK
	xtceM4i+saLvWKBZk5zlGn0Mz+KqNzDVqP1uQ2XciLY/F3LCrmiB6Q7PMgAMM+9UrnJxGJhKVfNXE
	35ugfYqCAb0hGCoWUhqhJb42IHHK8K1MijRTHBtrmaL8c7k9Fmjv/VFhabsuPChNZT08elKs68VZp
	mUxLBhtywWnPEZtMQSMdQYtQQQA68PcQVZCLaFw07rtOdwDbJJhUqQ2TEmf8XtQjUUzgzXJqli4Mv
	wPCkgCig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqaW5-00000002S96-0q47;
	Thu, 12 Feb 2026 17:30:13 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqaW2-00000002S8f-2TEY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 17:30:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770917411; x=1802453411;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XBOcgJBc1RSlYmqobhoDkxo7B2GCI8X28c2EJGVXf2M=;
  b=HFZ0UwO2s3DufT3dmoaH8c5MdCTK+TLfVObL5IkjioQ25CtO2Lpd0vh9
   U0BeJmNrbLMbxkPDlc8hP2eGIUXe9Gi7HZic4sAhZS6ed2VkZgsd9GCJS
   ckN66rCqwpsCp0HOuSu3zXbIcZxP5gfNUn11AYW9Hgc/YS8igwe8uRQe1
   u8IApne72ONQMGZRCvbBmLVSxuHnt56L1W999hneSoQIezXcJMFWuVvI+
   Oi/HrFTANep8BowGDBb7PE/BoJ2WxGADpAfCfqDZXJxxRX2PVPhlYheLI
   QljO+4s/mO8XS3gA6aUiKQwYAnpUKYwAKDUqUYH6Y8iNcivSPQpu6IWLh
   w==;
X-CSE-ConnectionGUID: Ab8WG2OXT+6sCuCtkfWtmQ==
X-CSE-MsgGUID: P26I4KcYT76TRJn2S/nlzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="71124778"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="71124778"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 09:30:09 -0800
X-CSE-ConnectionGUID: vokpPQzjS12/nvQhQb0tIA==
X-CSE-MsgGUID: xGkuYLYkQLemyQ69LEKpyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="243258862"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Feb 2026 09:30:06 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqaVv-00000000rwq-1LsJ;
	Thu, 12 Feb 2026 17:30:03 +0000
Date: Fri, 13 Feb 2026 01:29:53 +0800
From: kernel test robot <lkp@intel.com>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [PATCH v2 3/9] bus: rifsc: use new CONFIG_STM32_FIREWALL_DEBUG
 switch
Message-ID: <202602130151.3v3igg2M-lkp@intel.com>
References: <20260212-stm32_risab-v2-3-02ef2859b596@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212-stm32_risab-v2-3-02ef2859b596@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_093010_668107_2CC5EE26 
X-CRM114-Status: GOOD (  11.28  )
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

Hi Gatien,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b]

url:    https://github.com/intel-lab-lkp/linux/commits/Gatien-Chevallier/dt-bindings-bus-document-the-RISAB-firewall-peripheral/20260212-182006
base:   05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
patch link:    https://lore.kernel.org/r/20260212-stm32_risab-v2-3-02ef2859b596%40foss.st.com
patch subject: [PATCH v2 3/9] bus: rifsc: use new CONFIG_STM32_FIREWALL_DEBUG switch
config: loongarch-randconfig-002-20260212 (https://download.01.org/0day-ci/archive/20260213/202602130151.3v3igg2M-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602130151.3v3igg2M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602130151.3v3igg2M-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/bus/stm32_rifsc.c:436:21: warning: attribute declaration must precede definition [-Wignored-attributes]
     436 | static const struct __maybe_unused stm32_rifsc_resources_names rifsc_mp21_res_names = {
         |                     ^
   include/linux/compiler_attributes.h:343:56: note: expanded from macro '__maybe_unused'
     343 | #define __maybe_unused                  __attribute__((__unused__))
         |                                                        ^
   drivers/bus/stm32_rifsc.c:424:8: note: previous definition is here
     424 | struct stm32_rifsc_resources_names {
         |        ^
   drivers/bus/stm32_rifsc.c:441:21: warning: attribute declaration must precede definition [-Wignored-attributes]
     441 | static const struct __maybe_unused stm32_rifsc_resources_names rifsc_mp25_res_names = {
         |                     ^
   include/linux/compiler_attributes.h:343:56: note: expanded from macro '__maybe_unused'
     343 | #define __maybe_unused                  __attribute__((__unused__))
         |                                                        ^
   drivers/bus/stm32_rifsc.c:424:8: note: previous definition is here
     424 | struct stm32_rifsc_resources_names {
         |        ^
   2 warnings generated.


vim +436 drivers/bus/stm32_rifsc.c

   435	
 > 436	static const struct __maybe_unused stm32_rifsc_resources_names rifsc_mp21_res_names = {
   437		.device_names = stm32mp21_rifsc_risup_names,
   438		.initiator_names = stm32mp21_rifsc_rimu_names,
   439	};
   440	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

