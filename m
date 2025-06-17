Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 409DDC71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 13:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KHM+FC5F21A0w5HnAlNQ9XJ1XuyuuGnszHfWO7/B/xs=; b=TVNETbs5TcJWI+zAVq/dHAVH/E
	Y7oya9+2K7uNpyswMPL6k5j5wA4/qwPDkjuPjMza8hby2EDK0Zh4s8/JtX5JBPapE+fXm4VKn69FU
	txCLZCY0J0d4MgJgkR1ijBAyI3jx5WPdvi/gRnmwQJo31Zhdr3M2Wd54PAUGKpcobsRnwHyXbrJle
	XHUdmwsXwW4Yz+knNr/WIm7EJZ2S0ld/GYtNEEesGOd591oodzjRD3LIXmJeJ5jiZiejSKDljnRpu
	yEAykR39GiB3ps6cnQXOjurVgi8uWbQ+Caw3kYW+p5kWrPJS0nz25lnpO+8Ca2uE5nnZCzmqTWlJM
	PYER+3jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWQm-00000007N7c-17Js;
	Tue, 17 Jun 2025 13:32:52 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWGu-00000007Kp0-00xH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 13:22:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750166560; x=1781702560;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iOPD9cZ13iOgVBjbX8yhidl9KIoVbx+QGRtLA2hgsws=;
  b=J+mBTikISvTSZpIhQDxVNtS7VqRXqKv6lDr321XuMUtSYwmfS/k+K8Xy
   Dj8E/st2HVBFeBKlHG9nguKh0Slr8Hk40CYRjTYZ1g2K8AlZevIz5WVtz
   NbtzUMu/K42wlqGYswVCKR2vbBuWYvxzgL5CDX4CRlGq2Lv3wuaIqqlqZ
   JyWQrw9ZMaPvKVNV9Niq92GlsBCTPSM87kzS7q0ZzylXG9bBoaDMO+wPf
   C3e+LAjU/AaM7KnYm8vgpMQH51jupIWKQ0l41tnr9uZJaoz8EpjPdM81U
   h/QXxV86qQHIcAZm8CxWdtjY+HWwNtYEq0mDLERfq1F8vhSpners1IZC7
   g==;
X-CSE-ConnectionGUID: tWGNfB/JQ++k4golIzD17g==
X-CSE-MsgGUID: C/wEKxm2T0+Tg8eENv6bEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52258073"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="52258073"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 06:22:35 -0700
X-CSE-ConnectionGUID: iojkX/jNRQS7IU1Sla552Q==
X-CSE-MsgGUID: zPQwlA+0SdOUc3vBWhem9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="149671819"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Jun 2025 06:22:32 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRWGk-000G0l-1V;
	Tue, 17 Jun 2025 13:22:30 +0000
Date: Tue, 17 Jun 2025 21:21:53 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Anderson <sean.anderson@linux.dev>,
	Mark Brown <broonie@kernel.org>, Michal Simek <monstr@monstr.eu>,
	linux-spi@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jinjie Ruan <ruanjinjie@huawei.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	David Lechner <dlechner@baylibre.com>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: Re: [PATCH v2 5/9] spi: zynqmp-gqspi: Support multiple buses
Message-ID: <202506172150.MoosHW24-lkp@intel.com>
References: <20250616220054.3968946-6-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616220054.3968946-6-sean.anderson@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_062240_082495_E4C69DD1 
X-CRM114-Status: GOOD (  13.37  )
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

Hi Sean,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-spi/for-next]
[also build test ERROR on linus/master v6.16-rc2 next-20250617]
[cannot apply to xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Anderson/dt-bindings-spi-Add-spi-buses-property/20250617-060356
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/20250616220054.3968946-6-sean.anderson%40linux.dev
patch subject: [PATCH v2 5/9] spi: zynqmp-gqspi: Support multiple buses
config: sparc-randconfig-001-20250617 (https://download.01.org/0day-ci/archive/20250617/202506172150.MoosHW24-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506172150.MoosHW24-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506172150.MoosHW24-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/spi/spi-zynqmp-gqspi.c: In function 'zynqmp_qspi_chipselect':
>> drivers/spi/spi-zynqmp-gqspi.c:469:25: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     469 |                         FIELD_PREP(GQSPI_GENFIFO_BUS_MASK, qspi->buses);
         |                         ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_PREP +469 drivers/spi/spi-zynqmp-gqspi.c

   453	
   454	/**
   455	 * zynqmp_qspi_chipselect - Select or deselect the chip select line
   456	 * @qspi:	Pointer to the spi_device structure
   457	 * @is_high:	Select(0) or deselect (1) the chip select line
   458	 */
   459	static void zynqmp_qspi_chipselect(struct spi_device *qspi, bool is_high)
   460	{
   461		struct zynqmp_qspi *xqspi = spi_controller_get_devdata(qspi->controller);
   462		ulong timeout;
   463		u32 genfifoentry = 0, statusreg;
   464	
   465		genfifoentry |= GQSPI_GENFIFO_MODE_SPI;
   466	
   467		if (!is_high) {
   468			xqspi->genfifobus =
 > 469				FIELD_PREP(GQSPI_GENFIFO_BUS_MASK, qspi->buses);
   470			if (!spi_get_chipselect(qspi, 0))
   471				xqspi->genfifocs = GQSPI_GENFIFO_CS_LOWER;
   472			else
   473				xqspi->genfifocs = GQSPI_GENFIFO_CS_UPPER;
   474	
   475			genfifoentry |= xqspi->genfifobus;
   476			genfifoentry |= xqspi->genfifocs;
   477			genfifoentry |= GQSPI_GENFIFO_CS_SETUP;
   478		} else {
   479			genfifoentry |= GQSPI_GENFIFO_CS_HOLD;
   480		}
   481	
   482		zynqmp_gqspi_write(xqspi, GQSPI_GEN_FIFO_OFST, genfifoentry);
   483	
   484		/* Manually start the generic FIFO command */
   485		zynqmp_gqspi_write(xqspi, GQSPI_CONFIG_OFST,
   486				   zynqmp_gqspi_read(xqspi, GQSPI_CONFIG_OFST) |
   487				   GQSPI_CFG_START_GEN_FIFO_MASK);
   488	
   489		timeout = jiffies + msecs_to_jiffies(1000);
   490	
   491		/* Wait until the generic FIFO command is empty */
   492		do {
   493			statusreg = zynqmp_gqspi_read(xqspi, GQSPI_ISR_OFST);
   494	
   495			if ((statusreg & GQSPI_ISR_GENFIFOEMPTY_MASK) &&
   496			    (statusreg & GQSPI_ISR_TXEMPTY_MASK))
   497				break;
   498			cpu_relax();
   499		} while (!time_after_eq(jiffies, timeout));
   500	
   501		if (time_after_eq(jiffies, timeout))
   502			dev_err(xqspi->dev, "Chip select timed out\n");
   503	}
   504	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

