Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D78BC10775EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 17:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u8u7LSZca3RD8jyXgLn/1gKWfhjla4Ec5S6LSTWYmkQ=; b=fOAiHtc4RxDgBqZw9T+v3urYrF
	++uyaFnCnenKo/Qbxy6h6/7O9C6DceZ8LSerMY43Q7jfNypKlzp0J6Sg9Go2lu0yD41kO/ZL8y5DW
	VxbtJ05EFdg3+Ho7QCCwXODSbXLlF20v98jpgFR9voG5DK8PUUgou7LT92BFYgnk3Iu4tav4QZHgI
	rxncJUZrI2N7KZITtX1OGnu9bCmXl+1NY3IcAYgoSditXFu9GF86ZsAMrpwY/uroccC8WHFFWgWyc
	Wj1S/BQLsM52P1M4abe8IHfehd9Ih9rW+yZN9Sx1tktM0sAq1/PgqTq+zrH9UNkpGzKzzPB2AG+Em
	J6sH1aNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2uKi-000000091Ic-14fv;
	Wed, 18 Mar 2026 17:05:24 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2uKf-000000091Hs-0kak;
	Wed, 18 Mar 2026 17:05:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773853521; x=1805389521;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=FRwg2E9CLljwcNk6xTVAFoV/k9oE/5jF1+naOPnV9r4=;
  b=InLvy5jCXWuuy/fsi+SbucXet37p4D9GM3Nn7WEwYsKf1GFuBhfbnIjQ
   jYx8MAm3k3m6iXzQl+GNWfRENuQwaoRRd+o+9uByF3SUJZaMm2ZUfROWD
   9k7aR+ev78ETCEIf+sgu1ff69x5H3efOJ5m+IH2jA8ilDlDuXw0Cy7SNg
   JCcPMa/tixfnTBBcHBHmmTGtRKQK/ifU4E26Y3iM1kB6l/IWPu6OsSRD6
   f0VhyrS81iaX1H83yk9Thjp5lT+jHBisiWItVmTWDA4R4fmnQ3DEGFDMr
   cK2WOgLJHpY5gKzovMnwivXtC6RN8/og1NCTZdGFeXQhd4MVGno20VpL4
   w==;
X-CSE-ConnectionGUID: pCOIlR72RNq6k71w7TlrlA==
X-CSE-MsgGUID: M2ADU1mbTTeBsVJ6yUvZnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74948736"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="74948736"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 10:05:20 -0700
X-CSE-ConnectionGUID: I4g4cbSVQxWMegfWb/0kZg==
X-CSE-MsgGUID: a8hhyyakQLmEVdfMWq0wMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="222740621"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 18 Mar 2026 10:05:16 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2uKX-000000003Az-29FG;
	Wed, 18 Mar 2026 17:05:13 +0000
Date: Thu, 19 Mar 2026 01:04:38 +0800
From: kernel test robot <lkp@intel.com>
To: Pei Xiao <xiaopei01@kylinos.cn>, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, openbmc@lists.ozlabs.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, broonie@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Pei Xiao <xiaopei01@kylinos.cn>
Subject: Re: [PATCH v3 07/17] spi: orion: Use helper function
 devm_clk_get_enabled()
Message-ID: <202603190122.1OMLjae4-lkp@intel.com>
References: <5727aa84748872059e2a39eb67f1f08c0de6206b.1773733017.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5727aa84748872059e2a39eb67f1f08c0de6206b.1773733017.git.xiaopei01@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_100521_281995_A12AB255 
X-CRM114-Status: GOOD (  10.99  )
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

Hi Pei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-spi/for-next]
[also build test WARNING on next-20260317]
[cannot apply to atorgue-stm32/stm32-next rockchip/for-next xilinx-xlnx/master clk/clk-next shawnguo/for-next soc/for-next linus/master v7.0-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pei-Xiao/spi-axiado-Use-helper-function-devm_clk_get_enabled/20260318-110300
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/5727aa84748872059e2a39eb67f1f08c0de6206b.1773733017.git.xiaopei01%40kylinos.cn
patch subject: [PATCH v3 07/17] spi: orion: Use helper function devm_clk_get_enabled()
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260319/202603190122.1OMLjae4-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260319/202603190122.1OMLjae4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603190122.1OMLjae4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/spi/spi-orion.c: In function 'orion_spi_remove':
>> drivers/spi/spi-orion.c:798:27: warning: unused variable 'spi' [-Wunused-variable]
     798 |         struct orion_spi *spi = spi_controller_get_devdata(host);
         |                           ^~~


vim +/spi +798 drivers/spi/spi-orion.c

60cadec9da7b6c drivers/spi/orion_spi.c Shadi Ammouri    2008-08-05  793  
60cadec9da7b6c drivers/spi/orion_spi.c Shadi Ammouri    2008-08-05  794  
2e0de1efb233ab drivers/spi/spi-orion.c Uwe Kleine-König 2023-03-03  795  static void orion_spi_remove(struct platform_device *pdev)
60cadec9da7b6c drivers/spi/orion_spi.c Shadi Ammouri    2008-08-05  796  {
08e6c5038fee47 drivers/spi/spi-orion.c Yang Yingliang   2023-08-18  797  	struct spi_controller *host = platform_get_drvdata(pdev);
08e6c5038fee47 drivers/spi/spi-orion.c Yang Yingliang   2023-08-18 @798  	struct orion_spi *spi = spi_controller_get_devdata(host);
60cadec9da7b6c drivers/spi/orion_spi.c Shadi Ammouri    2008-08-05  799  
5c6786945b4e04 drivers/spi/spi-orion.c Russell King     2014-06-21  800  	pm_runtime_get_sync(&pdev->dev);
4574b886698dfa drivers/spi/spi-orion.c Andrew Lunn      2012-04-06  801  
08e6c5038fee47 drivers/spi/spi-orion.c Yang Yingliang   2023-08-18  802  	spi_unregister_controller(host);
5c6786945b4e04 drivers/spi/spi-orion.c Russell King     2014-06-21  803  	pm_runtime_disable(&pdev->dev);
60cadec9da7b6c drivers/spi/orion_spi.c Shadi Ammouri    2008-08-05  804  }
60cadec9da7b6c drivers/spi/orion_spi.c Shadi Ammouri    2008-08-05  805  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

