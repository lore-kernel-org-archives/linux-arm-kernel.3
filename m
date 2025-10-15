Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5E1CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 23:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iK6GuNI3fRMzybeSWKAw1V2MEONYtsyZW75mcPhcQ9M=; b=i/OKpx+71ntKb5Mio0UdAacfOE
	FmlTE/VoVD3+9ZGDvM/0/pBbahhKa+g0vyrkK1hY0VIxt6Nn8YAOCfBYfbWb4mGkK1fg9ONmFXd0R
	C5m4ttbjO/Dz0AsJ9B3cqvnGvRaeTIIUAIwZifoHf9PP+XdVuGyEJhXqxvZM0C5X4rsSZ6dhMKwt3
	IG7BoY1S6qDSfmhTBswnRoGGPaCdBKggLQdoQgdycC9vhgCNsyJdwyXmjuPkHjKo6W1XmGlE6ZMhB
	ALfUi3TcdMfSj3fC3qhn06NHQJ2kdPIu0OA4aJKGMMBDrfy1sRpvazS77dwqpekvXjwTNSWf2Erlm
	iHu+1csA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9B9w-000000036O5-1jnb;
	Wed, 15 Oct 2025 23:43:56 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9B9t-000000036Ng-1hqR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 23:43:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760571833; x=1792107833;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0xdTqDw9WUR1MHTE6JTRUHIGJ2mKZvvcYBTUUih42x4=;
  b=a5o3gs9AZb8CUFfXSyUmRQfHAoX0vMwZp6q0ZFmaWy1Qx3poVi89VagL
   u2Acliqsw1/wWSMEUQrTWA9Dmp+oszcf8s3ntcMTfjtetOLInqQ5Ap8d3
   dtMfRNdbfD7QYmHq5M8AVwx3fgY8UIfJnaSb2BRmY3npSYAth39VrrpdE
   TEhz/l0/0dSxhTF30dUazvECdqp5m/WXfQpzvptqNvUHg3Typxofd4kLf
   TR3JEZhhDRJqFhMqbfKV8pI5WmRJjIQGE071inZu0WEGl0tYOyfN3AHvn
   3j0/zo9wmvYpAIKb3c4hL8qpxPIP+3ApYsjVagd+/321lF2tCKKljl2dg
   g==;
X-CSE-ConnectionGUID: HKL9XZ51RlWrC6x2r/si1g==
X-CSE-MsgGUID: LwaY7BvqTA2DAI/jKf/IXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="74204115"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="74204115"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 16:43:52 -0700
X-CSE-ConnectionGUID: Hso+wECATpWtOfTbPJ+EBQ==
X-CSE-MsgGUID: NhZgz1k0SL+mUJXovZND2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="181853552"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 15 Oct 2025 16:43:48 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9B9g-0004Id-38;
	Wed, 15 Oct 2025 23:43:42 +0000
Date: Thu, 16 Oct 2025 07:43:07 +0800
From: kernel test robot <lkp@intel.com>
To: Lizhe <sensor1010@163.com>, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk, jonas@kwiboo.se,
	chaoyi.chen@rock-chips.com, david.wu@rock-chips.com
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Lizhe <sensor1010@163.com>
Subject: Re: [PATCH net-next] net: dwmac-rk: No need to check the return
 value of the phy_power_on()
Message-ID: <202510160726.OejMgsW0-lkp@intel.com>
References: <20251015040847.6421-1-sensor1010@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015040847.6421-1-sensor1010@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_164353_514286_E7F8CA97 
X-CRM114-Status: GOOD (  10.44  )
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

Hi Lizhe,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Lizhe/net-dwmac-rk-No-need-to-check-the-return-value-of-the-phy_power_on/20251015-121214
base:   net-next/main
patch link:    https://lore.kernel.org/r/20251015040847.6421-1-sensor1010%40163.com
patch subject: [PATCH net-next] net: dwmac-rk: No need to check the return value of the phy_power_on()
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251016/202510160726.OejMgsW0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510160726.OejMgsW0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510160726.OejMgsW0-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c: In function 'rk_gmac_powerdown':
>> drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c:1670:9: error: implicit declaration of function 'phy_power_on'; did you mean 'rk_phy_power_on'? [-Wimplicit-function-declaration]
    1670 |         phy_power_on(gmac, false);
         |         ^~~~~~~~~~~~
         |         rk_phy_power_on


vim +1670 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c

7ad269ea1a2b7d Roger Chen            2014-12-29  1662  
229666c14c75ae Vincent Palatin       2016-06-15  1663  static void rk_gmac_powerdown(struct rk_priv_data *gmac)
7ad269ea1a2b7d Roger Chen            2014-12-29  1664  {
32c7bc0747bbd8 Jonas Karlman         2025-03-19  1665  	if (gmac->integrated_phy && gmac->ops->integrated_phy_powerdown)
32c7bc0747bbd8 Jonas Karlman         2025-03-19  1666  		gmac->ops->integrated_phy_powerdown(gmac);
fecd4d7eef8b21 David Wu              2017-08-10  1667  
8f6503993911f0 Russell King (Oracle  2025-06-16  1668) 	pm_runtime_put_sync(gmac->dev);
aec3f415f7244b Punit Agrawal         2021-09-29  1669  
7ad269ea1a2b7d Roger Chen            2014-12-29 @1670  	phy_power_on(gmac, false);
7ad269ea1a2b7d Roger Chen            2014-12-29  1671  	gmac_clk_enable(gmac, false);
7ad269ea1a2b7d Roger Chen            2014-12-29  1672  }
7ad269ea1a2b7d Roger Chen            2014-12-29  1673  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

