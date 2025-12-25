Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDD4E7AD62
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 18:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1xfbycelZ75qa+Dx6xRKK2JQ4OPBoymebBMBKQZ4tCM=; b=SpyZo5Y12zdZWwJK4NhFFBZYBk
	Dt/nTIC8NnVFx8O2z3VT0JfvJO4gon021Y5A85vssngEgz274BvucWtXCwRPLd65Tzezo99NJYKIA
	8QwmRw8YydNckAPw5RuID0QZtzihOFBt3ObvRPnkCmc4XkrwQi3XSeNDGqJNq9zr6UhsvDbwDZolZ
	wKx3JWgZBqIgne41T7+q4hMfOTZpHodEMyXfxGQdaGMMKg6N4vyLl0n+LGenbZx8FzsoCuMa+4ADe
	+gePKngY8BXHiWohKNb9DmZJSUoNq532Fr6+obB4dSXJbP93iIWGHbuXdZmnwzO+jNPb1HV3Af32W
	1+A8A5MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYq7d-00000000bmi-0MEk;
	Thu, 25 Dec 2025 18:31:37 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYq7Z-00000000bmE-1gy9;
	Thu, 25 Dec 2025 18:31:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766687493; x=1798223493;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yqnePlyRgEquO4uP2YmSaSpuW1av6DY6o/KZmR59zYs=;
  b=muDokLGA8EHbQLTOwt4S9dRZI3Z1xnh664Wy6WvaNJT2ZH2JgYfN/eNz
   SAXmAIMbEjQX+zuHepmf0QMUkpLDAqsltxAlJJ+Z7jfS+Bt/2txQgkK2d
   a4QbjHsg5v7ldIoRuBen3T+1bpY2pDw3gir4hKK+AEn4IBVQ3rWpbVILS
   JF8p8dv+s2SexG2sklNydGCUCEMiUfUJ/QBO1aWqnynK00zyxQpmCDtFM
   aJ5ZRYJpLKuhkaFd6Ri2j4srqos+BLGfHq62Gf5RvgmHkDhr8ueFZGtTK
   CkPkyDkxX+BvDokkP4bEj/j2XS+GTGICItY5EybvPnxp4juTM9weEjqkp
   g==;
X-CSE-ConnectionGUID: /fedSlUsRlaMAEKjIJO1lQ==
X-CSE-MsgGUID: ROQwP4YMSWyBSkecZRC4yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="91131212"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="91131212"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 10:31:32 -0800
X-CSE-ConnectionGUID: OUwZDa35RUKTYtnAQpRyrg==
X-CSE-MsgGUID: qkIViPLzR9y7Zfey6SE2FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="201171557"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 25 Dec 2025 10:31:26 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYq7Q-000000004NB-2qAZ;
	Thu, 25 Dec 2025 18:31:24 +0000
Date: Fri, 26 Dec 2025 02:30:49 +0800
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
Cc: oe-kbuild-all@lists.linux.dev, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-actions@lists.infradead.org,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH 01/12] i2c: add i2c_adapter-specific printk helpers
Message-ID: <202512260206.C1TExj8d-lkp@intel.com>
References: <20251223-i2c-printk-helpers-v1-1-46a08306afdb@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223-i2c-printk-helpers-v1-1-46a08306afdb@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_103133_534704_24353608 
X-CRM114-Status: GOOD (  10.82  )
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
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20251226/202512260206.C1TExj8d-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512260206.C1TExj8d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512260206.C1TExj8d-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/pci/saa7134/saa7134-i2c.c:31:9: warning: 'i2c_dbg' redefined
      31 | #define i2c_dbg(level, fmt, arg...) do { \
         |         ^~~~~~~
   In file included from drivers/media/pci/saa7134/saa7134.h:14,
                    from drivers/media/pci/saa7134/saa7134-i2c.c:10:
   include/linux/i2c.h:775:9: note: this is the location of the previous definition
     775 | #define i2c_dbg(adap, fmt, ...) dev_dbg(&(adap)->dev, fmt, ##__VA_ARGS__)
         |         ^~~~~~~


vim +/i2c_dbg +31 drivers/media/pci/saa7134/saa7134-i2c.c

^1da177e4c3f41 drivers/media/video/saa7134/saa7134-i2c.c Linus Torvalds        2005-04-16  30  
45f38cb3b80311 drivers/media/pci/saa7134/saa7134-i2c.c   Mauro Carvalho Chehab 2015-05-13 @31  #define i2c_dbg(level, fmt, arg...) do { \
45f38cb3b80311 drivers/media/pci/saa7134/saa7134-i2c.c   Mauro Carvalho Chehab 2015-05-13  32  	if (i2c_debug == level) \
45f38cb3b80311 drivers/media/pci/saa7134/saa7134-i2c.c   Mauro Carvalho Chehab 2015-05-13  33  		printk(KERN_DEBUG pr_fmt("i2c: " fmt), ## arg); \
45f38cb3b80311 drivers/media/pci/saa7134/saa7134-i2c.c   Mauro Carvalho Chehab 2015-05-13  34  	} while (0)
45f38cb3b80311 drivers/media/pci/saa7134/saa7134-i2c.c   Mauro Carvalho Chehab 2015-05-13  35  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

