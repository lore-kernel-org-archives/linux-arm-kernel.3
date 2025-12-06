Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F197D3ABF5
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 05:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G8o3YfQY7hKsuCq2GLsjvkFbr9nr7lBsO97Pk1xNZ0Q=; b=j7b/7BL+2zdt4jOaMFfx6WGVI2
	1/TJb/HVqErsDBoEBSA8b8gKlV0bthAxbFiNkqMnHJwhi41ZS2GFQsIKH6sGO8soZe7PkyHZnisLL
	vVr9oNBCTEkriO1DydYfrVyyGTsF9htg34p3Ekp3DWwG14OaXIDuS6dcwDMruqC7erFtPo/1FrqEe
	mcfxF8YumD16iK6nWTW1AcrHBwNljDwbFYaRJGucaN3pV1BKLgDSLzilsDUd5K8fO9Ycf6xlbcEP5
	oEx7O3odb+gnhA0mf5Bf36zdB4z2ijP79qC3c11N0SF5C6wtiD3IEcT0A9pdnzynG/H4BpFM4jo6E
	4A3ZNxQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRkir-0000000AesU-3css;
	Sat, 06 Dec 2025 05:20:45 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRkip-0000000Aerc-04SU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 05:20:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764998443; x=1796534443;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZFjNsLDmNldfG/5D2Bo1Qfl2RpXTUFrxrN62ffaxeME=;
  b=jOnD4tXHFYfea9bqretoSovZs3Zr/piVDcxDyjjUrM+HDm47u7wWemS9
   CQ+bEegNxuE/26SIZlMI3/z7a63x7ORfPmYI1NblOUQKL+h38cv07qaf4
   OrX1QMoLBwa1S3yYFcqRXjTdW/Y87xE3OLzkAq41FrglfsR8rQqBvDFVd
   fJJBnQfAWaNmjWzhVeBDuEd9YAk7M9/m2md1pgCnMIJhMWBG0DTo26zV+
   j+LDgwxipCn3NmYzA4oJGW/fHtQtu0mGE7Yg1HaV4oPkxbAin0Wzbmwih
   GmaYMA0DyamZHF7ivdXbPG24FgnSJT9HxEjmcfIU9MXYqdGIgLGCJJEPN
   Q==;
X-CSE-ConnectionGUID: p2FLWLzuT8OOX2/zguhjZw==
X-CSE-MsgGUID: rcUJe8obTNSkbPbyUzy2lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="89684196"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="89684196"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 21:20:43 -0800
X-CSE-ConnectionGUID: M8sn2e1iS7WipgYPGUEVrg==
X-CSE-MsgGUID: FnNPjzW+SuyCFsShyfMMBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="200605245"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Dec 2025 21:20:40 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRkij-00000000Fsj-1Jo7;
	Sat, 06 Dec 2025 05:20:37 +0000
Date: Sat, 6 Dec 2025 13:19:46 +0800
From: kernel test robot <lkp@intel.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>,
	Mark Brown <broonie@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-spi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Patrice Chotard <patrice.chotard@foss.st.com>
Subject: Re: [PATCH 3/8] spi: stm32-ospi: Remove CR_TCIE and CR_TEIE irq usage
Message-ID: <202512061327.9CDC4SNs-lkp@intel.com>
References: <20251205-upstream_qspi_ospi_updates-v1-3-7e6c8b9f5141@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205-upstream_qspi_ospi_updates-v1-3-7e6c8b9f5141@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_212043_121817_87CA83BF 
X-CRM114-Status: UNSURE (   9.80  )
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

Hi Patrice,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7d0a66e4bb9081d75c82ec4957c50034cb0ea449]

url:    https://github.com/intel-lab-lkp/linux/commits/Patrice-Chotard/spi-stm32-ospi-Set-DMA-maxburst-dynamically/20251205-174931
base:   7d0a66e4bb9081d75c82ec4957c50034cb0ea449
patch link:    https://lore.kernel.org/r/20251205-upstream_qspi_ospi_updates-v1-3-7e6c8b9f5141%40foss.st.com
patch subject: [PATCH 3/8] spi: stm32-ospi: Remove CR_TCIE and CR_TEIE irq usage
config: sparc64-randconfig-002-20251206 (https://download.01.org/0day-ci/archive/20251206/202512061327.9CDC4SNs-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512061327.9CDC4SNs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512061327.9CDC4SNs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/spi/spi-stm32-ospi.c:16:
   drivers/spi/spi-stm32-ospi.c: In function 'stm32_ospi_wait_cmd':
>> drivers/spi/spi-stm32-ospi.c:246:48: error: 'struct stm32_ospi' has no member named 'io_base'; did you mean 'mm_base'?
     err = readl_relaxed_poll_timeout_atomic(ospi->io_base + OSPI_SR, sr,
                                                   ^~~~~~~
   include/linux/iopoll.h:102:3: note: in definition of macro 'poll_timeout_us_atomic'
      op; \
      ^~
   include/linux/iopoll.h:213:2: note: in expansion of macro 'read_poll_timeout_atomic'
     read_poll_timeout_atomic(op, val, cond, delay_us, timeout_us, false, addr)
     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/iopoll.h:255:2: note: in expansion of macro 'readx_poll_timeout_atomic'
     readx_poll_timeout_atomic(readl_relaxed, addr, val, cond, delay_us, timeout_us)
     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-stm32-ospi.c:246:8: note: in expansion of macro 'readl_relaxed_poll_timeout_atomic'
     err = readl_relaxed_poll_timeout_atomic(ospi->io_base + OSPI_SR, sr,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +246 drivers/spi/spi-stm32-ospi.c

   236	
   237	static int stm32_ospi_wait_cmd(struct stm32_ospi *ospi)
   238	{
   239		void __iomem *regs_base = ospi->regs_base;
   240		u32 sr;
   241		int err = 0;
   242	
   243		if (ospi->fmode == CR_FMODE_APM)
   244			goto out;
   245	
 > 246		err = readl_relaxed_poll_timeout_atomic(ospi->io_base + OSPI_SR, sr,
   247							(sr & (SR_TEF | SR_TCF)), 1,
   248							STM32_WAIT_CMD_TIMEOUT_US);
   249	
   250		if (sr & SR_TCF)
   251			/* avoid false timeout */
   252			err = 0;
   253		if (sr & SR_TEF)
   254			err = -EIO;
   255	
   256	out:
   257		/* clear flags */
   258		writel_relaxed(FCR_CTCF | FCR_CTEF, regs_base + OSPI_FCR);
   259	
   260		if (!err)
   261			err = stm32_ospi_wait_nobusy(ospi);
   262	
   263		return err;
   264	}
   265	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

