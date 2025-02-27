Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF157C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 06:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L4aCnxLzwSEwOxcPCyq5qN6j7mdgUS+RvMXUN/jDcQ4=; b=SioJqSr/IrqHNHkQY7tE0tc9+E
	jkhu7IKkocMfox/6kLf6GX4C7vaN4EsuQHJ7yabEotbZNob2r1ab0R7lyimCzyqkSi6xRhlP0+Tm7
	H/1ENiHtPGLZePirNKVeWzmMOOPMVVRtzHnzYAhgHMoVWLg6ESUGMCJrRhPHXnHyN1CxIUSycLSMC
	e0zlPCFwbXCyXoi83EKiUXCC6V0qxhEjUYOR0+gUzUpjDw3d7gTBgFoSl+vAG85OqI7X7Jtgo1oCZ
	ID+oB8WxxPNctGGdxSTaie5r27vfujCnXvGCbJnwsc8hSRS+cfg1KJOvrjbqPd5z8v1CVVm2xgs4d
	tSHZ6juA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnWym-00000006RJp-2vNd;
	Thu, 27 Feb 2025 06:02:40 +0000
Received: from [192.198.163.16] (helo=mgamail.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnWu6-00000006QUx-169V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 05:57:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740635870; x=1772171870;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2SafO12uI4h/H25nQ13IVaO/mucCyOzb83y4kdC0s7E=;
  b=M8X07JonQpr5Y2m0dWCfz5XWPY4n3vEEO8yOnQMh0iwWupQjW4tS68R+
   wquGznzy4w/bLBkKiYhN14+Ufh3ZRFdLYu8smEcPl5a6kuJkQ72aeCxBL
   vJBZk17IDJRg9f42wcijYybbuH5v0jhi6dO6kIgahax7Efrixpot7vA0V
   xErsLBIDtSbQ6vPsvxPdIOQ6toK5oLRg4BfIxST8S3zx7X1/QgdMA7y4V
   X1ardlYPHOYROyHuBq4MhAbRWhvZAPjIjgh+eBEfXcPZhvA6ZAm9yBMzN
   6OtL/7/g/KtO72cmzlQbLiVEM8/iube2SnIKO1uqz4qRk8VxWWL+5Zipz
   Q==;
X-CSE-ConnectionGUID: ep85KZarRtGmD3SEnQgURw==
X-CSE-MsgGUID: 66o7P6JlT5esvnKBsSxtMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="29113637"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="29113637"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 21:57:49 -0800
X-CSE-ConnectionGUID: 1O0BGv2cRtizHUdxu57vMA==
X-CSE-MsgGUID: gCMMkIefR4GuMUemt9rdFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="154113781"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 26 Feb 2025 21:57:43 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnWtn-000Cvi-2T;
	Thu, 27 Feb 2025 05:57:37 +0000
Date: Thu, 27 Feb 2025 13:57:22 +0800
From: kernel test robot <lkp@intel.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	Arnd Bergmann <arnd@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Will Deacon <will@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Holger Dengler <dengler@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	Jarkko Sakkinen <jarkko@kernel.org>, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH] crypto: lib/Kconfig - Select and hide arch options
Message-ID: <202502271317.S0YZiPk1-lkp@intel.com>
References: <Z76aUfPIbhPAsHbv@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z76aUfPIbhPAsHbv@gondor.apana.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_215750_308927_180B20D7 
X-CRM114-Status: GOOD (  11.70  )
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

Hi Herbert,

kernel test robot noticed the following build errors:

[auto build test ERROR on herbert-cryptodev-2.6/master]
[also build test ERROR on next-20250226]
[cannot apply to soc/for-next linus/master v6.14-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Herbert-Xu/crypto-lib-Kconfig-Select-and-hide-arch-options/20250226-125220
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/Z76aUfPIbhPAsHbv%40gondor.apana.org.au
patch subject: [PATCH] crypto: lib/Kconfig - Select and hide arch options
config: s390-randconfig-002-20250227 (https://download.01.org/0day-ci/archive/20250227/202502271317.S0YZiPk1-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502271317.S0YZiPk1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502271317.S0YZiPk1-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: arch/s390/crypto/chacha-glue.o: in function `chacha20_s390':
>> chacha-glue.c:(.text+0x30e): undefined reference to `chacha_crypt_generic'
   s390-linux-ld: arch/s390/crypto/chacha-glue.o: in function `chacha_crypt_arch':
   chacha-glue.c:(.text+0x3f6): undefined reference to `chacha_crypt_generic'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

