Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83DEBC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 03:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gaFXjoAtd+IbRhI4mu0R6YpwOiUc+WZONKRbcL1DsHk=; b=zlrud1Ot4dqeBZ5H+cH7UvE2Zy
	rFVv98iK/yLqMkYY6KgIoP21aPX3awY3ZzWmYCkN+/GHWZOuCuhvkskt/FcpK+JbKzOeyRHb0d0b9
	onusg01DTyzDcrHw3K5gDhWNTsU7S4t+HItlA6qIgjuENCM4yWzbfMvQpa9mEls6DrzWJg8e5B4bj
	m8tzvRlMYXndcOap000l/OKAS3oNm9IURIPcS83/CdmmNQkpijtL0Fiq9RjsJO1AHuBcEzYyO12/J
	g6Xu6EW+Hd3m3NRcjCJwXQy0bRnMSVY91iMlgCGIOW1os8hnrnwXn+sg8nQTox35uzMKP+kzT73dg
	/J7EROMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSS4X-0000000EdUj-0lac;
	Fri, 20 Jun 2025 03:05:45 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSS0I-0000000Ed9O-3BuK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 03:01:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750388482; x=1781924482;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f7V5rYWc1EwjcgrxpnoH3ziozc2NpXhZC+YcuAXFxeE=;
  b=WGAsEGrR+nJVnfuYmiZcc3gNAPZMQp6CmS0ujfRnVZFIjlR1lLHmdj7W
   i52FVFNfb3OBNH3Rm/Xy5lGzzjqptaCDSSBE+AhZJlJKK57AVACQTS7eo
   NFWjdljfgDaS3pzVHR3ijqAysCbprU41W1HwFOExPiXqjWNSN78iLrC5i
   mTP5H/ktDVEU7pX6JDd9tDKx8Cd440/X+6z6fWsnc0JaQbpgRspG31cnj
   WWKjbf7XMYnHC51roS2n3U9fcwfDsZz4iq2jLELuo5Iu2CMSXK2x/fjfi
   QoksG8KI63Swud/4izrqRyT+qWz5aCHRWw54kcF9b21LCmDsF6Wio/128
   A==;
X-CSE-ConnectionGUID: aXve5viUTbC6XP6JxzV6ZQ==
X-CSE-MsgGUID: XZsKjNmdTPCol3NaQRSVWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="51871297"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; 
   d="scan'208";a="51871297"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 20:01:20 -0700
X-CSE-ConnectionGUID: AscknAMsTSqjYgMPwfOSEw==
X-CSE-MsgGUID: zF1ixVj+S4iOTJcojkyKRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; 
   d="scan'208";a="181664045"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Jun 2025 20:01:17 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSS0B-000LJu-1o;
	Fri, 20 Jun 2025 03:01:15 +0000
Date: Fri, 20 Jun 2025 11:00:18 +0800
From: kernel test robot <lkp@intel.com>
To: Ovidiu Panait <ovidiu.panait.oss@gmail.com>, clabbe.montjoie@gmail.com,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	linux-crypto@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, wens@csie.org, jernej.skrabec@gmail.com,
	samuel@sholland.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Subject: Re: [PATCH 10/10] crypto: sun8i-ce - implement request batching
Message-ID: <202506201006.eQ2P1PuC-lkp@intel.com>
References: <20250619122316.2587236-11-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619122316.2587236-11-ovidiu.panait.oss@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_200122_811053_00F5A02F 
X-CRM114-Status: GOOD (  11.31  )
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

Hi Ovidiu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on next-20250619]
[cannot apply to sunxi/sunxi/for-next herbert-crypto-2.6/master linus/master v6.16-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ovidiu-Panait/crypto-sun8i-ce-remove-channel-timeout-field/20250619-202957
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20250619122316.2587236-11-ovidiu.panait.oss%40gmail.com
patch subject: [PATCH 10/10] crypto: sun8i-ce - implement request batching
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20250620/202506201006.eQ2P1PuC-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506201006.eQ2P1PuC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506201006.eQ2P1PuC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c: In function 'sun8i_ce_dump_task_descriptors':
>> drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c:178:52: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size 7 [-Wformat-truncation=]
     178 |                 snprintf(task, sizeof(task), "TASK %d:", i);
         |                                                    ^~
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c:178:46: note: directive argument in the range [-2147483641, 2147483646]
     178 |                 snprintf(task, sizeof(task), "TASK %d:", i);
         |                                              ^~~~~~~~~~
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c:178:17: note: 'snprintf' output between 8 and 18 bytes into a destination of size 12
     178 |                 snprintf(task, sizeof(task), "TASK %d:", i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +178 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c

   171	
   172	static void sun8i_ce_dump_task_descriptors(struct sun8i_ce_flow *chan)
   173	{
   174		for (int i = 0; i < chan->reqs_no; ++i) {
   175			struct ce_task *cet = &chan->tl[i];
   176			char task[CE_MAX_TASK_DESCR_DUMP_MSG_SIZE];
   177	
 > 178			snprintf(task, sizeof(task), "TASK %d:", i);
   179			print_hex_dump(KERN_INFO, task, DUMP_PREFIX_NONE, 16, 4,
   180				       cet, sizeof(struct ce_task), false);
   181		}
   182	}
   183	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

