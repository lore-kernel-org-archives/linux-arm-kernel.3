Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCA5D41159
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 10:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oukpAtlluYrS906comPVvuyt8RKE46zpf0Ozi7F6Omk=; b=4AA2VIpS6beiKvHm1NtoUjjWK5
	TO2bVftP341GvQMDrHxJAj94ejmG9Bm1w/chXNKDpQH6e2rlM5PF7Zhc3mGLvssDxz46h+OBc5GeS
	l34orD6h5qxsXa2Idy8u6hmL+tdXcCZ7U2B6iquc6yPRNp4t6mNd18soDoM9v+ghY7pMcl0NY6f6n
	tdCzMopDbsOJedSF0rk0/IoR9rKaHEoINkBkT3QMvIGiKhS9Pw9oQGBoemKcxaLIIJvuKi+ytkhpV
	YeRg0bs0BT8RixGz1wl8ifM7duPIBPkChLLzMP0F/HlCZ7XBMkSvvFZphrdv4IBF+iA/n2Xnx+NvG
	6P7l8yqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgKKl-0000000C80R-1tK9;
	Thu, 15 Jan 2026 10:12:07 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgKKi-0000000C7ze-2Iq0;
	Thu, 15 Jan 2026 10:12:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768471924; x=1800007924;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tx5ox7cf+WJOeQAnUn6eddrERLDC/s/3WemE93oK43A=;
  b=POF05RWlkKz1INdDgo6JSw+jRw776MhGmLx71NRKSglQu4lCqqs5f1cG
   /ZRXTjemP2lFiMndn1v6CI/rIYa0ogrmtpHb+YiHdmlduTuYeOe5QTLCc
   S5JefrjdEnJwa/AJSogzNLBRDF3qajt/amw9gxJCJbcfwDbZh3GRl12tP
   WS9bhl1tIpgK67gphrndT9AU9mP1BWRcy/kuWycCA/GNWJKN7EIghiocF
   jSUV3GWunPWra5ADaemPh3uCyFPHdpkuVfzdg5vN3jHWokyzHgFDuZpV6
   njVGc+G8LxlbKbNewQiCpHOUx3YXwut+009qjVfGM/vz2Ev+irKpPhuU8
   g==;
X-CSE-ConnectionGUID: jPlpBMicS/qBiHXkxNJV1A==
X-CSE-MsgGUID: I4pFq5mpS9Orvn/b/6n4fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="95253467"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="95253467"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 02:12:02 -0800
X-CSE-ConnectionGUID: pTIX+ck0SgKrV1X6qCteVg==
X-CSE-MsgGUID: bH39DakyT76AUG+yMF9u4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="235630095"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 Jan 2026 02:11:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgKKY-00000000HpY-2zGP;
	Thu, 15 Jan 2026 10:11:54 +0000
Date: Thu, 15 Jan 2026 18:11:39 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 03/14] phy: qcom-sgmii-eth: add .set_mode() and
 .validate() methods
Message-ID: <202601151714.J1BAilHy-lkp@intel.com>
References: <E1vg4vs-00000003SFt-1Fje@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vg4vs-00000003SFt-1Fje@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_021205_030234_E5F603D7 
X-CRM114-Status: GOOD (  12.36  )
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

Hi Russell,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Russell-King-Oracle/net-stmmac-qcom-ethqos-remove-mac_base/20260115-054728
base:   net-next/main
patch link:    https://lore.kernel.org/r/E1vg4vs-00000003SFt-1Fje%40rmk-PC.armlinux.org.uk
patch subject: [PATCH net-next 03/14] phy: qcom-sgmii-eth: add .set_mode() and .validate() methods
config: microblaze-randconfig-r073-20260115 (https://download.01.org/0day-ci/archive/20260115/202601151714.J1BAilHy-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.3.0
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601151714.J1BAilHy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601151714.J1BAilHy-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/phy/qualcomm/phy-qcom-sgmii-eth.c: In function 'qcom_dwmac_sgmii_phy_speed':
>> drivers/phy/qualcomm/phy-qcom-sgmii-eth.c:294:24: error: 'PHY_INTERFACE_MODE_SGMII' undeclared (first use in this function)
     294 |         if (submode == PHY_INTERFACE_MODE_SGMII ||
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/qualcomm/phy-qcom-sgmii-eth.c:294:24: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/phy/qualcomm/phy-qcom-sgmii-eth.c:295:24: error: 'PHY_INTERFACE_MODE_1000BASEX' undeclared (first use in this function)
     295 |             submode == PHY_INTERFACE_MODE_1000BASEX)
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/phy/qualcomm/phy-qcom-sgmii-eth.c:298:24: error: 'PHY_INTERFACE_MODE_2500BASEX' undeclared (first use in this function)
     298 |         if (submode == PHY_INTERFACE_MODE_2500BASEX)
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/PHY_INTERFACE_MODE_SGMII +294 drivers/phy/qualcomm/phy-qcom-sgmii-eth.c

   288	
   289	static int qcom_dwmac_sgmii_phy_speed(enum phy_mode mode, int submode)
   290	{
   291		if (mode != PHY_MODE_ETHERNET)
   292			return -EINVAL;
   293	
 > 294		if (submode == PHY_INTERFACE_MODE_SGMII ||
 > 295		    submode == PHY_INTERFACE_MODE_1000BASEX)
   296			return SPEED_1000;
   297	
 > 298		if (submode == PHY_INTERFACE_MODE_2500BASEX)
   299			return SPEED_2500;
   300	
   301		return -EINVAL;
   302	}
   303	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

