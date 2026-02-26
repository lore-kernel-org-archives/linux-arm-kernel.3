Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5893BFC5926
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 10:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tqBtgm8EEJlORnmmvwKXhB2S/iDUlFPm2yQkC/D+Srk=; b=nQ8iRhgPkWzIozOLQ2kmJlKPCk
	4Eawq/ABK7gTCR1w7h7mSdFW9zBBxW65gDPEdy+Y//0Fr8RwLQUwgPIwDc21QGrjQDVUC3fzSGHuI
	0mPj1x0JQwav5nymi+9s747AdqboovJCYLjAAd6kaXKiHijc7YOpCFMM9mfE3Qd4QjKjsu5Z6rH17
	kK7nfl9ux9tbSS+R0BoY0h4VPXqqpaKe5VgV7fWdI9k/kdNqBUnI6nZT74SOZ+U6S3q7ka+FYTOcn
	aWTSKF49LwQGsjcGFbU01VAEu52VFDMJ7Y154CQvyuRFSzjpPffRgxu6a1S4XInNeEGEjjWrC1CBS
	+GSS83Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvYco-00000005ueJ-2kvy;
	Thu, 26 Feb 2026 10:29:42 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvYcl-00000005udw-22gQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 10:29:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772101779; x=1803637779;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=587btXg/pksuFB2qmSKC7x4NgEDzZdzpKT6zLzMapik=;
  b=iNOhDKNepuvrjfBZbSWuwPzQ6lzJz/NLUCliAxCMXtQMXfo/mAS9m4yi
   CzQoq/5n8onFxkpEOGle2R4dYPECsZ0KKFDaleT0sO/0N3SZyCEquszt8
   m6jXle6fqBIbCBVW2eMx7Sl2UzCR+kB5Pu3Q/7g+ZpK4Y6Rw7sIYxxLCF
   Iak2B6bYShwgxl72PJKR00fD0lPBS3HU4sMnedBSkVh7aN8o71bVDqN0p
   zD9N03FVjSC3u/bY+R5lZlUxQUMnfe0lYxRKUR6UwAUlTN4d3fOYTWA4T
   Jcx35mUVFOeF13bxULnTPezRDkM/iv+FOcyxPaNxSIEiqppHz81gF6B4S
   g==;
X-CSE-ConnectionGUID: GIH2287iRMO/dm+NSmCbvA==
X-CSE-MsgGUID: Jj7vVIp+SIq6Z0nkKijBow==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="75761995"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="75761995"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 02:29:37 -0800
X-CSE-ConnectionGUID: sZFd+mQNSyKkVlnbOv4SVA==
X-CSE-MsgGUID: +9uUq9jDRLuGHVx0T4nL2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="214090461"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 26 Feb 2026 02:29:34 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvYcL-0000000091Z-34qn;
	Thu, 26 Feb 2026 10:29:22 +0000
Date: Thu, 26 Feb 2026 18:29:10 +0800
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2 4/4] ARM: dts: BCM5301X: AC5300: set WAN MAC from nvram
Message-ID: <202602261850.DL7ZVo3w-lkp@intel.com>
References: <20260225230827.21715-5-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225230827.21715-5-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_022939_565514_78D81763 
X-CRM114-Status: GOOD (  11.43  )
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

Hi Rosen,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v7.0-rc1 next-20260225]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/ARM-dts-BCM5301X-EA9200-set-WAN-MAC-from-nvram/20260226-071232
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260225230827.21715-5-rosenp%40gmail.com
patch subject: [PATCHv2 4/4] ARM: dts: BCM5301X: AC5300: set WAN MAC from nvram
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260226/202602261850.DL7ZVo3w-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260226/202602261850.DL7ZVo3w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602261850.DL7ZVo3w-lkp@intel.com/

All errors (new ones prefixed by >>):

   also defined at arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac5300.dts:128.10-133.5
>> ERROR: Input tree has errors, aborting (use -f to force output)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

