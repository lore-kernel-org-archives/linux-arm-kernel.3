Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18971D74957
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 02:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+28YvtVmu9Bo1lOAdMG6/JFKoHne9xXaAx6/btcFDwU=; b=yOD1gujq947fPBHvb/MJeVHtXP
	IXEuRMFst+RkgR3q4MVnlT5OdgwKH9LncWIaCiH3edljf7SpQHyX0nav6I0RmR/V1XsRkoyjfFfw7
	iSsSBYYd6BAoTZ1of/EPCHXyqkhL+4z42UGhCfA1uQt2Meja/89oSx+AbE1IQHkfD8gUb/u2LyyLI
	JPw9tlNc58uZnPTubBPLCyFRFm/x8jubdh0b9NdVKRttvrp9EdNXH8vZdyuqzFpe8KSZIoQLJCe6o
	86hvMRtGp7R24HEJzSlV+38N1GOIt6OJlSDvHriP225+28UsjUy1dKuUcrdyqgq3TjX+ZMF+S6VO0
	29UgW8EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5yTr-0000000GWXp-0rZF;
	Wed, 30 Oct 2024 02:30:43 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5xOB-0000000GPHJ-289e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 01:20:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730251247; x=1761787247;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wZDiMAaOhKiJUYkYEtwy19sskMyJZD0MGmAeOQbFpJU=;
  b=UG8ZgJswOBuZF3H5UvVKTGoel2ebvrRgbPaZGy9XPMi6r5XvnktRTKJc
   txZ6Nu2b18NEiJfvjxte2aZg+4vh/DBDGo7a2WOixYGhPTGcHDhR9ODun
   VRmXlnJocdAhK/hDGfbcl1RsL72XwSW0krZDG0LPj3C+u/pRENfaV56pL
   fZfjW9arqEHkB1r1zOINKFzQx2OTX9arLJauhDe9iCBGKXoQ1Qlo83/Lq
   6uQm1sl4GmCy++uYVhBd2Qngpy4Yhu8uegzH94AxgCZJm7qJGLmphFR9W
   Q4XLOCJg85aLYelybEw4hpBi4RG4D/werwF2o9uVLPGn9jVBTxAbGzg2z
   A==;
X-CSE-ConnectionGUID: 30i/525JT+OzLqVKmTsMeg==
X-CSE-MsgGUID: ju6xIu/HTzeq8jGMzHY56g==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="32776932"
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="32776932"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 18:20:42 -0700
X-CSE-ConnectionGUID: 7w0w8aZDTJqMuAYRh5XFng==
X-CSE-MsgGUID: XTZgTvcVS7SeqeGzux2ZdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="82062035"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Oct 2024 18:20:39 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5xO0-000eMm-33;
	Wed, 30 Oct 2024 01:20:36 +0000
Date: Wed, 30 Oct 2024 09:20:00 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?B?Q3Pza+FzLA==?= Bence <csokas.bence@prolan.hu>,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: atmel-quadspi: Create `atmel_qspi_ops` to support
 newer SoC families
Message-ID: <202410300915.VPL8EQQu-lkp@intel.com>
References: <20241029125843.2384307-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029125843.2384307-1-csokas.bence@prolan.hu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_182047_663484_AF39C439 
X-CRM114-Status: GOOD (  12.67  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Tudor Ambarus <tudor.ambarus@linaro.org>, Mark Brown <broonie@kernel.org>, oe-kbuild-all@lists.linux.dev, Varshini Rajendran <varshini.rajendran@microchip.com>, =?iso-8859-1?B?Q3Pza+FzLA==?= Bence <csokas.bence@prolan.hu>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Bence,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-spi/for-next]
[also build test ERROR on soc/for-next linus/master v6.12-rc5 next-20241029]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cs-k-s-Bence/spi-atmel-quadspi-Create-atmel_qspi_ops-to-support-newer-SoC-families/20241029-210231
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/20241029125843.2384307-1-csokas.bence%40prolan.hu
patch subject: [PATCH] spi: atmel-quadspi: Create `atmel_qspi_ops` to support newer SoC families
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20241030/202410300915.VPL8EQQu-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410300915.VPL8EQQu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410300915.VPL8EQQu-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/spi/atmel-quadspi.c: In function 'atmel_qspi_transfer':
>> drivers/spi/atmel-quadspi.c:446:68: error: 'struct spi_device' has no member named 'master'
     446 |         struct atmel_qspi *aq = spi_controller_get_devdata(mem->spi->master);
         |                                                                    ^~


vim +446 drivers/spi/atmel-quadspi.c

   442	
   443	static int atmel_qspi_transfer(struct spi_mem *mem,
   444				       const struct spi_mem_op *op, u32 offset)
   445	{
 > 446		struct atmel_qspi *aq = spi_controller_get_devdata(mem->spi->master);
   447	
   448		/* Skip to the final steps if there is no data */
   449		if (!op->data.nbytes)
   450			return atmel_qspi_wait_for_completion(aq,
   451							      QSPI_SR_CMD_COMPLETED);
   452	
   453		/* Dummy read of QSPI_IFR to synchronize APB and AHB accesses */
   454		(void)atmel_qspi_read(aq, QSPI_IFR);
   455	
   456		/* Send/Receive data */
   457		if (op->data.dir == SPI_MEM_DATA_IN)
   458			memcpy_fromio(op->data.buf.in, aq->mem + offset,
   459				      op->data.nbytes);
   460		else
   461			memcpy_toio(aq->mem + offset, op->data.buf.out,
   462				    op->data.nbytes);
   463	
   464		/* Release the chip-select */
   465		atmel_qspi_write(QSPI_CR_LASTXFER, aq, QSPI_CR);
   466	
   467		return atmel_qspi_wait_for_completion(aq, QSPI_SR_CMD_COMPLETED);
   468	}
   469	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

