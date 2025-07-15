Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9AACC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 20:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sq2CjF7l+besw1ZeKs/NEZSe/PtB82XT3dJtEgbj7pI=; b=UjUtMNP9GEoKPCpUZL98LFORN7
	d09jatpbx031BVQgoELyQ0bsSJVRE89LDhFFaLJYSlPzqJ5ZsCEemHag17CFXjXXx4WL+E+7dnQct
	LEB37+A/KX+yO7ciwTstLD5Z11M6q84hSUTUSYun5ZLJffDKUufuy2j8Z7xXwsMyZaLuzCMt0NiMW
	tRDDNy7oJbD+ABMp/jAEYQSKN0z9hodKt/q6gKqPvTqkBg9Bbl2YMuuFILozJE8ocIWzaDLCQEYSD
	W+ztvYK6nit52EYYGmdqKM93Oh9MWz2bpavoPduoKxxTyb3EF+aJwMXXjUbuKVHYEHKGsh8tJyA60
	C5MYJ3HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubm5Q-000000069x3-2Xe0;
	Tue, 15 Jul 2025 20:17:12 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubm2z-000000069pb-1KUg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 20:14:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752610481; x=1784146481;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eS6Mpdyp46gQ6nUgwPSL7+/IQm0H6qYJBJumRgSICho=;
  b=Ks5G7kaM5VfAS2AqzrP1n02l2moS3VYRGnp5H1vImqIkfUWIo+157Q22
   sY1Ytub6JBhL/fw/A42WlVPn+xNT/oCgkbrlMuZJ9CEzcoGsqACYlwbcp
   Fx+JlBhp6xS+5lR5gXRMuIeOo2WVzbwgmnm1HLVSX946Mb4cKse9vXGdG
   +WoSf7kBWlinvOnz38zifNxD4q8L65iphCsWDSDYNJrPZ0doCXPrn3+wu
   6jfZ6cC0rFR14JCskNJ0D+aiXeztaKRwkup+ZIVEZeIUWL2dK0Zgyd/uL
   nbTmYKHSHiCZPVONHwjuPA8XG0+hSXK/JJo0rxgPG6BCht98jaMtkSa3+
   g==;
X-CSE-ConnectionGUID: IcKpwHeHTLO8hVag1tN0Kw==
X-CSE-MsgGUID: ZGqSIKJqRjS5nBBlUdgOUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="42473896"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; 
   d="scan'208";a="42473896"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 13:14:39 -0700
X-CSE-ConnectionGUID: swZoM0+0REi7GGWqObo93g==
X-CSE-MsgGUID: nZzgw5MpQzKGR4ifrqa3mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; 
   d="scan'208";a="161631582"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 15 Jul 2025 13:14:34 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubm2p-000BVn-1r;
	Tue, 15 Jul 2025 20:14:31 +0000
Date: Wed, 16 Jul 2025 04:13:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jacky Chou <jacky_chou@aspeedtech.com>, bhelgaas@google.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	joel@jms.id.au, andrew@codeconstruct.com.au,
	linux-aspeed@lists.ozlabs.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
	linus.walleij@linaro.org, p.zabel@pengutronix.de,
	BMC-SW@aspeedtech.com
Subject: Re: [PATCH v2 08/10] PCI: Add FMT and TYPE definition for TLP header
Message-ID: <202507160314.e3odwyX7-lkp@intel.com>
References: <20250715034320.2553837-9-jacky_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715034320.2553837-9-jacky_chou@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_131441_394377_6DFD81FC 
X-CRM114-Status: GOOD (  12.42  )
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

Hi Jacky,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus robh/for-next linusw-pinctrl/devel linusw-pinctrl/for-next linus/master v6.16-rc6 next-20250715]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacky-Chou/dt-bindings-soc-aspeed-Add-ASPEED-PCIe-Config-support/20250715-114814
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20250715034320.2553837-9-jacky_chou%40aspeedtech.com
patch subject: [PATCH v2 08/10] PCI: Add FMT and TYPE definition for TLP header
config: i386-buildonly-randconfig-004-20250715 (https://download.01.org/0day-ci/archive/20250716/202507160314.e3odwyX7-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250716/202507160314.e3odwyX7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507160314.e3odwyX7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:1:
   In file included from ./usr/include/linux/pci.h:21:
>> usr/include/linux/pci_regs.h:1234:39: warning: // comments are not allowed in this language [-Wcomment]
    1234 | #define PCI_TLP_FMT_3DW_NO_DATA         0x0  // 3DW header, no data
         |                                              ^
   1 warning generated.
--
   In file included from <built-in>:1:
>> ./usr/include/linux/pci_regs.h:1234:39: warning: // comments are not allowed in this language [-Wcomment]
    1234 | #define PCI_TLP_FMT_3DW_NO_DATA         0x0  // 3DW header, no data
         |                                              ^
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

