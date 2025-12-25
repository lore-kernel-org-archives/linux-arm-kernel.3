Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA94E7AD4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 19:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VA94RCjiCWOhe4Ngi8gAvTZuUkcu1qengPVZYjV0WZQ=; b=qfZtV2DVzJySCUKEp/KgE0sDvW
	Xw8GjlzzwcgSrUNlTRsUAvOU8uy0MGt0BOqhlIZ40pCedrIrkLwWTlxp965yesMhOZ6b4/t7y23a0
	WxCJCB+/x5MYgytTV6XKHgW+yq6F3AZ0pYhbFekuwdSP+eHeLDU2dxDfkDgV3PBmWxdYOR8uk3IKq
	iiXnVbKOrdqX6bkXWpsBhe6xnnB5p0nhG5TUoaRw25nMSGS2TrUZJLA+6ibJk+MwymnA9p/4sliD1
	JnaHLhrWigK/9KJnRg6OCyRF4TxhgXoyidDR+UHKP3yvG+4fT3id7IGdbHk/z0rDJoFXK6548r1cj
	5UyFVpXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYr6l-00000000e2m-2h6Q;
	Thu, 25 Dec 2025 19:34:47 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYr6j-00000000e2H-0J3Q;
	Thu, 25 Dec 2025 19:34:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766691285; x=1798227285;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ofgh9KwqcvyPHGJk9JcqQvbMV1hNNHkzTXzpIoXFyf4=;
  b=VMLSpTqd8nUS3O1uKrXu6pfp8hWbAxiev6qDyVZBHJ81NMKrqoS+OFsw
   6icbtjV5qymn0n8NoPOObOFj1v0OO3Xy9ZvB9u2xGeutJUbueLb63YxzM
   pM4Ml01bJmVdOXAFP6ggTw6H0aaNG1y7uON3shb18gNRRsqQKu1RxFz0U
   EapPGCeMTpkBPlwu9prx7NyayNyGO4UY3baeEBWn8PjVJVfake2ra1xr1
   wZo3X2EoMnPgsQs7WVKUzzbcCGC2Bq4juw2y9GWDdGJFGbhWmzP4OWL0E
   F8nkOCVDupubC79+xJ5NnSDCnc2ZBpZgPQrEEyKNnY2YQBH4IoyE8R4oE
   A==;
X-CSE-ConnectionGUID: H6Jw1emxQ5CsxK2pPTURQQ==
X-CSE-MsgGUID: zGCI4V7YSQm95GFob8akOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="79202573"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="79202573"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 11:34:42 -0800
X-CSE-ConnectionGUID: LGfeeNPqSG2YVJuVAIHuUg==
X-CSE-MsgGUID: 9T8ro8cvQtWOoKl7kiFAwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="200280863"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 25 Dec 2025 11:34:36 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYr6Q-000000004Ph-2y69;
	Thu, 25 Dec 2025 19:34:29 +0000
Date: Fri, 26 Dec 2025 03:33:36 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH 01/12] i2c: add i2c_adapter-specific printk helpers
Message-ID: <202512260303.nUGs1vi7-lkp@intel.com>
References: <20251223-i2c-printk-helpers-v1-1-46a08306afdb@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223-i2c-printk-helpers-v1-1-46a08306afdb@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_113445_356048_8975029E 
X-CRM114-Status: UNSURE (   9.71  )
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

Hi Bartosz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on cc3aa43b44bdb43dfbac0fcb51c56594a11338a8]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/i2c-add-i2c_adapter-specific-printk-helpers/20251223-185417
base:   cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
patch link:    https://lore.kernel.org/r/20251223-i2c-printk-helpers-v1-1-46a08306afdb%40oss.qualcomm.com
patch subject: [PATCH 01/12] i2c: add i2c_adapter-specific printk helpers
config: x86_64-randconfig-013-20251225 (https://download.01.org/0day-ci/archive/20251226/202512260303.nUGs1vi7-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512260303.nUGs1vi7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512260303.nUGs1vi7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/pci/saa7134/saa7134-i2c.c:31:9: warning: 'i2c_dbg' macro redefined [-Wmacro-redefined]
      31 | #define i2c_dbg(level, fmt, arg...) do { \
         |         ^
   include/linux/i2c.h:775:9: note: previous definition is here
     775 | #define i2c_dbg(adap, fmt, ...) dev_dbg(&(adap)->dev, fmt, ##__VA_ARGS__)
         |         ^
   1 warning generated.


vim +/i2c_dbg +31 drivers/media/pci/saa7134/saa7134-i2c.c

^1da177e4c3f415 drivers/media/video/saa7134/saa7134-i2c.c Linus Torvalds        2005-04-16  30  
45f38cb3b80311a drivers/media/pci/saa7134/saa7134-i2c.c   Mauro Carvalho Chehab 2015-05-13 @31  #define i2c_dbg(level, fmt, arg...) do { \
45f38cb3b80311a drivers/media/pci/saa7134/saa7134-i2c.c   Mauro Carvalho Chehab 2015-05-13  32  	if (i2c_debug == level) \
45f38cb3b80311a drivers/media/pci/saa7134/saa7134-i2c.c   Mauro Carvalho Chehab 2015-05-13  33  		printk(KERN_DEBUG pr_fmt("i2c: " fmt), ## arg); \
45f38cb3b80311a drivers/media/pci/saa7134/saa7134-i2c.c   Mauro Carvalho Chehab 2015-05-13  34  	} while (0)
45f38cb3b80311a drivers/media/pci/saa7134/saa7134-i2c.c   Mauro Carvalho Chehab 2015-05-13  35  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

