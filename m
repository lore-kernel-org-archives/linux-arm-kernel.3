Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B442CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 15:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sVf2L+A98YMmDu62sFt34JBmTU4fODeNfn0ro0+o8Zg=; b=g8YQvzbXwDL857sHPoDe0FWrZ8
	HnLe0xtwAC2pJ2IRUKpyRz6AcuN+ELEEYjlsbSaxqGvnkDzIP/+W4cn3bkb7hbrXfHv7wL8Q1TzpT
	Qm7OVIn9rEoMvNjpnQ/wb01gxNSfgpAZrZilEbiLQ6S4lMJqnOaOanGVsV//hsgHFsE+xKj7VzzJx
	MtUKEmYBIp1JQEDeJdQNwfCUfXwX3z5uz8Ok1veM86UkQfVnHW23gzemc31FR7laYGLDCK4az3oTF
	tZXCRNOluziJ4I2JVtM3CMQxHZOKECDslOnPtPAvFOWT51jPgz/vmA3soOwWZaT1FtpkM0QeubxHu
	3sDfoPhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usNko-000000083wk-2D6R;
	Sat, 30 Aug 2025 15:44:34 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usNi4-000000083kW-0MQp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 15:41:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756568504; x=1788104504;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+iRaXVzECcvXTDXDtnzHEgBKOBeHUhWKVoYey/7sHQA=;
  b=aTRkv7Q0cynhIdI+5xnHu8T7TYAwcJ7I7dEoycyukY7pk19Cgfyne+e1
   gzzOhXVlXoso0VEmF0D7bwhIYrMpDYeSfBz/e3C7cTDcwp+Co0jdgkhuk
   sKufYDybG4htrDdMvlBRaKRASFIHkyvuzDJl1GchcPCHW46/OPMAxrBrz
   iFZ++HYiNO+OBHT73x0aWbEq8dqcneGalBRMUPpeeXwsvGp52Mczxscky
   +7lRbviossAa/nEL8R+GrYSD4Id3ihSgwOw2bkTKNNCB9OMNZhZW0lWhY
   NwP609rgBGTArm2puho6JnOY1JNQEPmtjUl/Ig0bdms8FSUi5tpMAtezi
   g==;
X-CSE-ConnectionGUID: +4BUTS1+QmG9eDGpBN0GUA==
X-CSE-MsgGUID: zHy9C1KvTzutOY3XPsOMzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="58933704"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="58933704"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 08:41:40 -0700
X-CSE-ConnectionGUID: 2BBGvx6DQ/eEQNu3xubSNg==
X-CSE-MsgGUID: fPRSJ2fiRj+oowIs6XSrxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="169912325"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 30 Aug 2025 08:41:36 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usNhi-000VT3-2q;
	Sat, 30 Aug 2025 15:41:26 +0000
Date: Sat, 30 Aug 2025 23:40:28 +0800
From: kernel test robot <lkp@intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Russell King - ARM Linux <linux@armlinux.org.uk>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	David Miller <davem@davemloft.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH net-next 1/5] arm64: dts: ls1043a-qds: switch to new
 fixed-link binding
Message-ID: <202508302350.uP3JO7bq-lkp@intel.com>
References: <fe4c021d-c188-4fc2-8b2f-9c3c269056eb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe4c021d-c188-4fc2-8b2f-9c3c269056eb@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_084144_139487_78D0CC88 
X-CRM114-Status: GOOD (  11.17  )
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

Hi Heiner,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Heiner-Kallweit/arm64-dts-ls1043a-qds-switch-to-new-fixed-link-binding/20250830-183341
base:   net-next/main
patch link:    https://lore.kernel.org/r/fe4c021d-c188-4fc2-8b2f-9c3c269056eb%40gmail.com
patch subject: [PATCH net-next 1/5] arm64: dts: ls1043a-qds: switch to new fixed-link binding
config: arm64-randconfig-002-20250830 (https://download.01.org/0day-ci/archive/20250830/202508302350.uP3JO7bq-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ac23f7465eedd0dd565ffb201f573e7a69695fa3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250830/202508302350.uP3JO7bq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508302350.uP3JO7bq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts:212.3-33 Properties must precede subnodes
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

