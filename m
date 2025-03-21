Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248DAC35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 09:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iFVSnaEFehYviDaI8WC9Ww2XhK/F7xqHGZT+habFMIE=; b=jTZ8t5lyvzJAb7q7uEmgh4ydmT
	OURudJGmm9OpO5oDoHsY0lZsIXHmauvMdsy5qIkyVUHhOpMUYRyJqQMw+/83gBpGOLnIDg300G3LM
	NmLOKTifqsVG465aJElWW/4NeV7VYimIkZsEmyS59oNm1VJSCu3rRkrlcgjQdTDSEs8wOHp+jSPd3
	RYiAGcQwTbTGzPzuNzbLOvegLxt7vp9F9HQ7XYKfFbkSJVZJexIj6bnpRUFZTFfX2CMXzZFqogZwQ
	f0wvOIlvdIhbhkM07uyML5ttNJvfHtHpbNNfD8qBUh35qvz2PpRFytRXkKCm7jrGWPVNPcFDNLFXM
	2V9QYovw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvYNX-0000000EKSH-1IaU;
	Fri, 21 Mar 2025 09:09:23 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvYLG-0000000EKEZ-3oZt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 09:07:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742548023; x=1774084023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ul7CfSeUaWuBtceyuR/J8GsjwNrCXI8nP0Rj5T3ooAg=;
  b=EAkl0KbA5Qe9tVUu9gVP5mUBGvoEPqvofb7E6KMyy2ljnH9uPmGPX1Hf
   AS6GkVPsGk3CoKdH+OnHrPbIS8w3F70Jm/4b2z8BYr7A8LKJsIub5sE8y
   J+0LZPmkgUYQNSu9WRxG5JlUDUvOjrzpgqoTY4CgVafrLJHnhHN/Te85t
   LIgNAA5p0q1GbS8LW0XkBeWnvxfHZlRPBsDu3GQ2EJVa1sb8D7syIQATI
   GFqm5TPuYDZjf1sohlgZGMOqQ2GM2HJGn/PocEgCa3/NIkSc/z7jrZ/qX
   EnJ5ZYm6JVjp4aMEyFOH4PxHTq4OdvNbxNaq+y+4Eoeltwjn398Wbwc3p
   Q==;
X-CSE-ConnectionGUID: m0vKU/ZnTjWxybUbTNK8bA==
X-CSE-MsgGUID: IEdQJZY9S0iHMsEoLq6TIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="47583918"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; 
   d="scan'208";a="47583918"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 02:07:00 -0700
X-CSE-ConnectionGUID: NLm5nu8kRa2bHPPy2QjZGw==
X-CSE-MsgGUID: wPJkXU+wTAy/Byg6qJHEnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; 
   d="scan'208";a="123866876"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 21 Mar 2025 02:06:58 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvYKx-0001CN-1v;
	Fri, 21 Mar 2025 09:06:45 +0000
Date: Fri, 21 Mar 2025 17:06:04 +0800
From: kernel test robot <lkp@intel.com>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	arm@kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: [soc:soc/drivers 20/24] undefined reference to `__ffsdi2'
Message-ID: <202503211748.QH9oyt9m-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_020703_019436_0799AB8B 
X-CRM114-Status: UNSURE (   8.54  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/drivers
head:   ba8755ab541fc629948233125db870d4dbf00a75
commit: ee7f8ed72990f28657b5bf598e695fcf4633f4ed [20/24] platform: cznic: turris-omnia-mcu: Refactor requesting MCU interrupt
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250321/202503211748.QH9oyt9m-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250321/202503211748.QH9oyt9m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503211748.QH9oyt9m-lkp@intel.com/

All errors (new ones prefixed by >>):

   alpha-linux-ld: drivers/platform/cznic/turris-omnia-mcu-gpio.o: in function `omnia_mcu_request_irq':
>> (.text+0x2660): undefined reference to `__ffsdi2'
>> alpha-linux-ld: (.text+0x2668): undefined reference to `__ffsdi2'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

