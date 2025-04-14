Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 827EFC369B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 10:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AZDog+CCBPyWUD3fn4lLMjM4NFwLCI3d6R4ftUBPgpA=; b=RD30ajh36yxaT/7sBU3iS8ePDM
	EDdZqwWunKxx8DgA6USXLUrywall+3Y8ORDV561hQ8hqIVl0f+xXa4RbtFq++NVvKHAupyy9AggZT
	S5ZDjU8AFMrg8yqB/+T7KLcrtoj9+PRUttffjkpAPeMonwQNFponSyNsK8ydyGjsPULqfdrJo40AL
	hFKpQab2KyHWmvCtcvCIwoMdbo183P4toJvqmAyn3naTol+IKPRmAa1eEacJRAHMN9afQ34H5Ijd0
	h7tB65B2xMby+cSNMIJD4tazJ1SBbZSfO1CqJVEIuiNhVBjv6kS7ZHseLFJaIr9zW3V3rD2Q3Ewv7
	Vx9ckojQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4HWV-00000001dR3-2FEA;
	Mon, 14 Apr 2025 10:58:43 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4H8S-00000001YhS-2Gnw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 10:33:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744626833; x=1776162833;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tNxmdbJyJCsDlhnWVkRufAgLz0rrYDPUHmfs4ziabXY=;
  b=MSCj6o7GQgj16wXved7ohGYn/BEzPwd4f3Ze+wSFtKqaSbmdMoY449qf
   stMuRWU65OhnrJuKvCnvLFqO+CDq9atxb3GIhHOMROf8tCvJVLJYTxtDL
   0AlcJKL3Wp3sM5+n8Xl2GAuInrPUhJxee/0tfamBUKn68cyQFySi1QB2g
   IikskHw0GkMdcH6euYjVniBH9dZzGT/ZUNlQsKnnUoZoWzxfTvXDG5K7q
   bIfUhARfNuMaEhdcBC45Kwr6KdDML+4Cv4JxeZ2nPgeLeKXlrmnmdvMrF
   JoNChKxAtpb4OryO1Rr6nQbY6UegjGh2xYiInzK7wrs65TNBVaNypSDzN
   w==;
X-CSE-ConnectionGUID: +Z7/Lw2rTL+vU+w582rJnw==
X-CSE-MsgGUID: HJjO/ygoTN2ZJnMxwWNBHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="71476337"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="71476337"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 03:33:51 -0700
X-CSE-ConnectionGUID: K/UBrM59Qzmd2+6CvrXB5A==
X-CSE-MsgGUID: udIF/dz9R7yGQ2Gt7RpjYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="130637665"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Apr 2025 03:33:44 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4H8I-000E4c-1U;
	Mon, 14 Apr 2025 10:33:42 +0000
Date: Mon, 14 Apr 2025 18:32:44 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@kernel.org>, Haibo Chen <haibo.chen@nxp.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Luke Wang <ziniu.wang_1@nxp.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Arnd Bergmann <arnd@arndb.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Josua Mayer <josua@solid-run.com>, imx@lists.linux.dev,
	linux-mmc@vger.kernel.org, s32@nxp.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] mmc: esdhc-imx: convert to modern PM_OPS
Message-ID: <202504141852.82kZm4nO-lkp@intel.com>
References: <20250411085932.1902662-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411085932.1902662-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_033352_602877_545B1324 
X-CRM114-Status: GOOD (  13.62  )
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

Hi Arnd,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.15-rc2]
[also build test ERROR on linus/master next-20250414]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnd-Bergmann/mmc-esdhc-imx-convert-to-modern-PM_OPS/20250414-092134
base:   v6.15-rc2
patch link:    https://lore.kernel.org/r/20250411085932.1902662-1-arnd%40kernel.org
patch subject: [PATCH] [v2] mmc: esdhc-imx: convert to modern PM_OPS
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250414/202504141852.82kZm4nO-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250414/202504141852.82kZm4nO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504141852.82kZm4nO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mmc/host/sdhci-esdhc-imx.c:1902:8: error: call to undeclared function 'sdhci_suspend_host'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1902 |         ret = sdhci_suspend_host(host);
         |               ^
>> drivers/mmc/host/sdhci-esdhc-imx.c:1927:8: error: call to undeclared function 'sdhci_resume_host'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1927 |         ret = sdhci_resume_host(host);
         |               ^
   drivers/mmc/host/sdhci-esdhc-imx.c:1927:8: note: did you mean 'sdhci_remove_host'?
   drivers/mmc/host/sdhci.h:827:6: note: 'sdhci_remove_host' declared here
     827 | void sdhci_remove_host(struct sdhci_host *host, int dead);
         |      ^
>> drivers/mmc/host/sdhci-esdhc-imx.c:1953:8: error: call to undeclared function 'sdhci_runtime_suspend_host'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1953 |         ret = sdhci_runtime_suspend_host(host);
         |               ^
>> drivers/mmc/host/sdhci-esdhc-imx.c:1999:8: error: call to undeclared function 'sdhci_runtime_resume_host'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1999 |         err = sdhci_runtime_resume_host(host, 0);
         |               ^
   4 errors generated.


vim +/sdhci_suspend_host +1902 drivers/mmc/host/sdhci-esdhc-imx.c

95f25efe0ce22e Wolfram Sang      2010-10-15  1879  
04143fbaeb5799 Dong Aisheng      2016-07-12  1880  static int sdhci_esdhc_suspend(struct device *dev)
04143fbaeb5799 Dong Aisheng      2016-07-12  1881  {
3e3274ab9ff37f Ulf Hansson       2016-07-27  1882  	struct sdhci_host *host = dev_get_drvdata(dev);
a26a4f1baca55a Haibo Chen        2020-02-19  1883  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
a26a4f1baca55a Haibo Chen        2020-02-19  1884  	struct pltfm_imx_data *imx_data = sdhci_pltfm_priv(pltfm_host);
bb6e358169bf62 BOUGH CHEN        2019-01-07  1885  	int ret;
bb6e358169bf62 BOUGH CHEN        2019-01-07  1886  
bb6e358169bf62 BOUGH CHEN        2019-01-07  1887  	if (host->mmc->caps2 & MMC_CAP2_CQE) {
bb6e358169bf62 BOUGH CHEN        2019-01-07  1888  		ret = cqhci_suspend(host->mmc);
bb6e358169bf62 BOUGH CHEN        2019-01-07  1889  		if (ret)
bb6e358169bf62 BOUGH CHEN        2019-01-07  1890  			return ret;
bb6e358169bf62 BOUGH CHEN        2019-01-07  1891  	}
3e3274ab9ff37f Ulf Hansson       2016-07-27  1892  
a26a4f1baca55a Haibo Chen        2020-02-19  1893  	if ((imx_data->socdata->flags & ESDHC_FLAG_STATE_LOST_IN_LPMODE) &&
a26a4f1baca55a Haibo Chen        2020-02-19  1894  		(host->tuning_mode != SDHCI_TUNING_MODE_1)) {
a26a4f1baca55a Haibo Chen        2020-02-19  1895  		mmc_retune_timer_stop(host->mmc);
a26a4f1baca55a Haibo Chen        2020-02-19  1896  		mmc_retune_needed(host->mmc);
a26a4f1baca55a Haibo Chen        2020-02-19  1897  	}
a26a4f1baca55a Haibo Chen        2020-02-19  1898  
d38dcad4e7b48f Adrian Hunter     2017-03-20  1899  	if (host->tuning_mode != SDHCI_TUNING_MODE_3)
d38dcad4e7b48f Adrian Hunter     2017-03-20  1900  		mmc_retune_needed(host->mmc);
d38dcad4e7b48f Adrian Hunter     2017-03-20  1901  
af8fade4bd7bc7 Haibo Chen        2020-02-19 @1902  	ret = sdhci_suspend_host(host);
f6140462611308 Haibo Chen        2020-05-27  1903  	if (ret)
f6140462611308 Haibo Chen        2020-05-27  1904  		return ret;
f6140462611308 Haibo Chen        2020-05-27  1905  
f6140462611308 Haibo Chen        2020-05-27  1906  	ret = pinctrl_pm_select_sleep_state(dev);
f6140462611308 Haibo Chen        2020-05-27  1907  	if (ret)
f6140462611308 Haibo Chen        2020-05-27  1908  		return ret;
f6140462611308 Haibo Chen        2020-05-27  1909  
f6140462611308 Haibo Chen        2020-05-27  1910  	ret = mmc_gpio_set_cd_wake(host->mmc, true);
af8fade4bd7bc7 Haibo Chen        2020-02-19  1911  
af8fade4bd7bc7 Haibo Chen        2020-02-19  1912  	return ret;
04143fbaeb5799 Dong Aisheng      2016-07-12  1913  }
04143fbaeb5799 Dong Aisheng      2016-07-12  1914  
04143fbaeb5799 Dong Aisheng      2016-07-12  1915  static int sdhci_esdhc_resume(struct device *dev)
04143fbaeb5799 Dong Aisheng      2016-07-12  1916  {
cc17e1294b8aeb Dong Aisheng      2016-07-12  1917  	struct sdhci_host *host = dev_get_drvdata(dev);
bb6e358169bf62 BOUGH CHEN        2019-01-07  1918  	int ret;
cc17e1294b8aeb Dong Aisheng      2016-07-12  1919  
af8fade4bd7bc7 Haibo Chen        2020-02-19  1920  	ret = pinctrl_pm_select_default_state(dev);
af8fade4bd7bc7 Haibo Chen        2020-02-19  1921  	if (ret)
af8fade4bd7bc7 Haibo Chen        2020-02-19  1922  		return ret;
af8fade4bd7bc7 Haibo Chen        2020-02-19  1923  
19dbfdd3d5152d Dong Aisheng      2016-07-12  1924  	/* re-initialize hw state in case it's lost in low power mode */
19dbfdd3d5152d Dong Aisheng      2016-07-12  1925  	sdhci_esdhc_imx_hwinit(host);
cc17e1294b8aeb Dong Aisheng      2016-07-12  1926  
bb6e358169bf62 BOUGH CHEN        2019-01-07 @1927  	ret = sdhci_resume_host(host);
bb6e358169bf62 BOUGH CHEN        2019-01-07  1928  	if (ret)
bb6e358169bf62 BOUGH CHEN        2019-01-07  1929  		return ret;
bb6e358169bf62 BOUGH CHEN        2019-01-07  1930  
bb6e358169bf62 BOUGH CHEN        2019-01-07  1931  	if (host->mmc->caps2 & MMC_CAP2_CQE)
bb6e358169bf62 BOUGH CHEN        2019-01-07  1932  		ret = cqhci_resume(host->mmc);
bb6e358169bf62 BOUGH CHEN        2019-01-07  1933  
f6140462611308 Haibo Chen        2020-05-27  1934  	if (!ret)
f6140462611308 Haibo Chen        2020-05-27  1935  		ret = mmc_gpio_set_cd_wake(host->mmc, false);
f6140462611308 Haibo Chen        2020-05-27  1936  
bb6e358169bf62 BOUGH CHEN        2019-01-07  1937  	return ret;
04143fbaeb5799 Dong Aisheng      2016-07-12  1938  }
04143fbaeb5799 Dong Aisheng      2016-07-12  1939  
89d7e5c131228a Dong Aisheng      2013-11-04  1940  static int sdhci_esdhc_runtime_suspend(struct device *dev)
89d7e5c131228a Dong Aisheng      2013-11-04  1941  {
89d7e5c131228a Dong Aisheng      2013-11-04  1942  	struct sdhci_host *host = dev_get_drvdata(dev);
89d7e5c131228a Dong Aisheng      2013-11-04  1943  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
070e6d3ff5a696 Jisheng Zhang     2016-02-16  1944  	struct pltfm_imx_data *imx_data = sdhci_pltfm_priv(pltfm_host);
89d7e5c131228a Dong Aisheng      2013-11-04  1945  	int ret;
89d7e5c131228a Dong Aisheng      2013-11-04  1946  
bb6e358169bf62 BOUGH CHEN        2019-01-07  1947  	if (host->mmc->caps2 & MMC_CAP2_CQE) {
bb6e358169bf62 BOUGH CHEN        2019-01-07  1948  		ret = cqhci_suspend(host->mmc);
bb6e358169bf62 BOUGH CHEN        2019-01-07  1949  		if (ret)
bb6e358169bf62 BOUGH CHEN        2019-01-07  1950  			return ret;
bb6e358169bf62 BOUGH CHEN        2019-01-07  1951  	}
bb6e358169bf62 BOUGH CHEN        2019-01-07  1952  
89d7e5c131228a Dong Aisheng      2013-11-04 @1953  	ret = sdhci_runtime_suspend_host(host);
371d39fabcebc3 Michael Trimarchi 2018-01-04  1954  	if (ret)
371d39fabcebc3 Michael Trimarchi 2018-01-04  1955  		return ret;
89d7e5c131228a Dong Aisheng      2013-11-04  1956  
d38dcad4e7b48f Adrian Hunter     2017-03-20  1957  	if (host->tuning_mode != SDHCI_TUNING_MODE_3)
d38dcad4e7b48f Adrian Hunter     2017-03-20  1958  		mmc_retune_needed(host->mmc);
d38dcad4e7b48f Adrian Hunter     2017-03-20  1959  
3602785b341a95 Michael Trimarchi 2018-01-04  1960  	imx_data->actual_clock = host->mmc->actual_clock;
3602785b341a95 Michael Trimarchi 2018-01-04  1961  	esdhc_pltfm_set_clock(host, 0);
89d7e5c131228a Dong Aisheng      2013-11-04  1962  	clk_disable_unprepare(imx_data->clk_per);
89d7e5c131228a Dong Aisheng      2013-11-04  1963  	clk_disable_unprepare(imx_data->clk_ipg);
89d7e5c131228a Dong Aisheng      2013-11-04  1964  	clk_disable_unprepare(imx_data->clk_ahb);
89d7e5c131228a Dong Aisheng      2013-11-04  1965  
1c4989b000aeac BOUGH CHEN        2019-04-29  1966  	if (imx_data->socdata->flags & ESDHC_FLAG_PMQOS)
d1b98305916bc0 Rafael J. Wysocki 2020-02-12  1967  		cpu_latency_qos_remove_request(&imx_data->pm_qos_req);
1c4989b000aeac BOUGH CHEN        2019-04-29  1968  
89d7e5c131228a Dong Aisheng      2013-11-04  1969  	return ret;
89d7e5c131228a Dong Aisheng      2013-11-04  1970  }
89d7e5c131228a Dong Aisheng      2013-11-04  1971  
89d7e5c131228a Dong Aisheng      2013-11-04  1972  static int sdhci_esdhc_runtime_resume(struct device *dev)
89d7e5c131228a Dong Aisheng      2013-11-04  1973  {
89d7e5c131228a Dong Aisheng      2013-11-04  1974  	struct sdhci_host *host = dev_get_drvdata(dev);
89d7e5c131228a Dong Aisheng      2013-11-04  1975  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
070e6d3ff5a696 Jisheng Zhang     2016-02-16  1976  	struct pltfm_imx_data *imx_data = sdhci_pltfm_priv(pltfm_host);
17b1eb7f0bf3dc Fabio Estevam     2017-05-16  1977  	int err;
89d7e5c131228a Dong Aisheng      2013-11-04  1978  
1c4989b000aeac BOUGH CHEN        2019-04-29  1979  	if (imx_data->socdata->flags & ESDHC_FLAG_PMQOS)
d1b98305916bc0 Rafael J. Wysocki 2020-02-12  1980  		cpu_latency_qos_add_request(&imx_data->pm_qos_req, 0);
1c4989b000aeac BOUGH CHEN        2019-04-29  1981  
5c11f1ffb02244 Haibo Chen        2020-02-19  1982  	if (imx_data->socdata->flags & ESDHC_FLAG_CLK_RATE_LOST_IN_PM_RUNTIME)
5c11f1ffb02244 Haibo Chen        2020-02-19  1983  		clk_set_rate(imx_data->clk_per, pltfm_host->clock);
5c11f1ffb02244 Haibo Chen        2020-02-19  1984  
a0ad3087586d09 Michael Trimarchi 2018-01-04  1985  	err = clk_prepare_enable(imx_data->clk_ahb);
a0ad3087586d09 Michael Trimarchi 2018-01-04  1986  	if (err)
1c4989b000aeac BOUGH CHEN        2019-04-29  1987  		goto remove_pm_qos_request;
a0ad3087586d09 Michael Trimarchi 2018-01-04  1988  
17b1eb7f0bf3dc Fabio Estevam     2017-05-16  1989  	err = clk_prepare_enable(imx_data->clk_per);
17b1eb7f0bf3dc Fabio Estevam     2017-05-16  1990  	if (err)
a0ad3087586d09 Michael Trimarchi 2018-01-04  1991  		goto disable_ahb_clk;
af5d2b7b0d24f5 Ulf Hansson       2019-09-08  1992  
17b1eb7f0bf3dc Fabio Estevam     2017-05-16  1993  	err = clk_prepare_enable(imx_data->clk_ipg);
17b1eb7f0bf3dc Fabio Estevam     2017-05-16  1994  	if (err)
17b1eb7f0bf3dc Fabio Estevam     2017-05-16  1995  		goto disable_per_clk;
af5d2b7b0d24f5 Ulf Hansson       2019-09-08  1996  
3602785b341a95 Michael Trimarchi 2018-01-04  1997  	esdhc_pltfm_set_clock(host, imx_data->actual_clock);
a0ad3087586d09 Michael Trimarchi 2018-01-04  1998  
c6303c5d52d5ec Baolin Wang       2019-07-25 @1999  	err = sdhci_runtime_resume_host(host, 0);
17b1eb7f0bf3dc Fabio Estevam     2017-05-16  2000  	if (err)
a0ad3087586d09 Michael Trimarchi 2018-01-04  2001  		goto disable_ipg_clk;
17b1eb7f0bf3dc Fabio Estevam     2017-05-16  2002  
bb6e358169bf62 BOUGH CHEN        2019-01-07  2003  	if (host->mmc->caps2 & MMC_CAP2_CQE)
bb6e358169bf62 BOUGH CHEN        2019-01-07  2004  		err = cqhci_resume(host->mmc);
bb6e358169bf62 BOUGH CHEN        2019-01-07  2005  
bb6e358169bf62 BOUGH CHEN        2019-01-07  2006  	return err;
89d7e5c131228a Dong Aisheng      2013-11-04  2007  
17b1eb7f0bf3dc Fabio Estevam     2017-05-16  2008  disable_ipg_clk:
17b1eb7f0bf3dc Fabio Estevam     2017-05-16  2009  	clk_disable_unprepare(imx_data->clk_ipg);
17b1eb7f0bf3dc Fabio Estevam     2017-05-16  2010  disable_per_clk:
17b1eb7f0bf3dc Fabio Estevam     2017-05-16  2011  	clk_disable_unprepare(imx_data->clk_per);
a0ad3087586d09 Michael Trimarchi 2018-01-04  2012  disable_ahb_clk:
a0ad3087586d09 Michael Trimarchi 2018-01-04  2013  	clk_disable_unprepare(imx_data->clk_ahb);
1c4989b000aeac BOUGH CHEN        2019-04-29  2014  remove_pm_qos_request:
1c4989b000aeac BOUGH CHEN        2019-04-29  2015  	if (imx_data->socdata->flags & ESDHC_FLAG_PMQOS)
d1b98305916bc0 Rafael J. Wysocki 2020-02-12  2016  		cpu_latency_qos_remove_request(&imx_data->pm_qos_req);
17b1eb7f0bf3dc Fabio Estevam     2017-05-16  2017  	return err;
89d7e5c131228a Dong Aisheng      2013-11-04  2018  }
89d7e5c131228a Dong Aisheng      2013-11-04  2019  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

