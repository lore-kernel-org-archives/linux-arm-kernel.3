Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0ACEFCE4C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 22:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n9YgFzJeU6iVrx+xDJlXNhmiX2UbJXq6xpTde0QURWA=; b=PPr6lVdg4C64tjJ9splCeTzFQo
	1xBlAFqi4i+j5JkBEvhktS0cwwUWDkLIPZedQF/286g3SmZR53h8v+eOfvjxCsIgG+/L/7uvgxT3R
	lX6UYK/hNi2cl9LQx/q6VY5oMIt7Qsq7MAlWOxm6PiNT23iFd3T1RtlxS+hNtvpeC4BZCADHPP7Uc
	VsCllQ8ZKtkkbe94SD8eUtN4nhCfILWDQJNhr/Ucpfa1j9L7uADHFZH0VpDuOUJrU6hG1SatlBaF7
	rHzM9X/DJAa2WS8dyt4XlpbTEtMFax0HlPy5hhQU23cCJ6OAs3qOkyztOmbhy6vMuw7w88chRcDdk
	zP+RtVYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxuTZ-00000000Z1Y-3ud1;
	Wed, 04 Mar 2026 22:13:53 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxuTV-00000000Z19-0u2x;
	Wed, 04 Mar 2026 22:13:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772662429; x=1804198429;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8viQ62Vl8rOScrYYff4z3W73/71vqWr9R5SU1cx41TU=;
  b=BWf8trcmwG9u9XXu97fveeQxH11W0nEdt/ITZsW9Dz8rkJFSPW0PFvaX
   PHaP2x9NmnZolGRBI4et/ZuDwCX8pOTHDjs+4M76HVRapsyUuu5uO/xmB
   eu7hDNV0n7QlNjoWp1S06hHDqtAsQ5l+KyRZ3uDnhaj0P5Ggh8ONNbRJd
   I/NPBB/DI03M/46Px7AiPPMkOv1HqhduUJs5nKQ+ba5UVkaigbA3ogsFi
   nBsv4QejqMQaRasBkJxqdWXqvv20igF4+FKnetQ+S+CgcPTmvhQNZxNz7
   CL5CZI2qlhP62k7WcfbqNz1m2PKdFtklES8gbBAy2jGUvX7ghMBkWWDQA
   w==;
X-CSE-ConnectionGUID: nwruu2y7SCaS0VnkwjfErg==
X-CSE-MsgGUID: vVI74DhuQfqX8QaHOCKEAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="61309896"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="61309896"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 14:13:42 -0800
X-CSE-ConnectionGUID: vKgF8lqPSuuf9WEb103q4w==
X-CSE-MsgGUID: 4DnBmdg1RWOursf8+vRWaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="223440410"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Mar 2026 14:13:38 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxuTF-000000004a9-1tK7;
	Wed, 04 Mar 2026 22:13:33 +0000
Date: Thu, 5 Mar 2026 06:13:31 +0800
From: kernel test robot <lkp@intel.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org, kevin-kw.huang@airoha.com,
	macpaul.lin@mediatek.com, matthias.bgg@gmail.com,
	kernel@collabora.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: Re: [PATCH net-next 2/2] net: phy: Introduce Airoha AN8801/R Gigabit
 Ethernet PHY driver
Message-ID: <202603050606.eulVmYcb-lkp@intel.com>
References: <20260304-add-airoha-an8801-support-v1-2-0ae4ee5a2f9d@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304-add-airoha-an8801-support-v1-2-0ae4ee5a2f9d@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_141349_270312_C05D6720 
X-CRM114-Status: GOOD (  11.54  )
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

Hi Louis-Alexis,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ed0abfe93fd135dac223e87a3c945017b1fa8bfc]

url:    https://github.com/intel-lab-lkp/linux/commits/Louis-Alexis-Eyraud/dt-bindings-net-Add-support-for-Airoha-AN8801-R-GbE-PHY/20260304-174023
base:   ed0abfe93fd135dac223e87a3c945017b1fa8bfc
patch link:    https://lore.kernel.org/r/20260304-add-airoha-an8801-support-v1-2-0ae4ee5a2f9d%40collabora.com
patch subject: [PATCH net-next 2/2] net: phy: Introduce Airoha AN8801/R Gigabit Ethernet PHY driver
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260305/202603050606.eulVmYcb-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603050606.eulVmYcb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603050606.eulVmYcb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/air_an8801.c:258:6: warning: variable 'pbus_data_h' is uninitialized when used here [-Wuninitialized]
     258 |         if (pbus_data_h < 0)
         |             ^~~~~~~~~~~
   drivers/net/phy/air_an8801.c:240:30: note: initialize the variable 'pbus_data_h' to silence this warning
     240 |         int pbus_data_l, pbus_data_h;
         |                                     ^
         |                                      = 0
   1 warning generated.


vim +/pbus_data_h +258 drivers/net/phy/air_an8801.c

   236	
   237	static int __air_buckpbus_reg_read(struct phy_device *phydev,
   238					   u32 addr, u32 *data)
   239	{
   240		int pbus_data_l, pbus_data_h;
   241		int ret;
   242	
   243		addr |= AN8801_PBUS_ACCESS;
   244	
   245		ret = __phy_write(phydev, AIR_BPBUS_MODE, MII_MMD_CTRL_ADDR);
   246		if (ret < 0)
   247			return ret;
   248	
   249		ret = __phy_write(phydev, AIR_BPBUS_RD_ADDR_HIGH, upper_16_bits(addr));
   250		if (ret < 0)
   251			return ret;
   252	
   253		ret = __phy_write(phydev, AIR_BPBUS_RD_ADDR_LOW, lower_16_bits(addr));
   254		if (ret < 0)
   255			return ret;
   256	
   257		ret = __phy_read(phydev, AIR_BPBUS_RD_DATA_HIGH);
 > 258		if (pbus_data_h < 0)
   259			return pbus_data_h;
   260	
   261		pbus_data_l = __phy_read(phydev, AIR_BPBUS_RD_DATA_LOW);
   262		if (pbus_data_l < 0)
   263			return pbus_data_l;
   264	
   265		*data = (pbus_data_h << 16) | pbus_data_l;
   266		return 0;
   267	}
   268	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

