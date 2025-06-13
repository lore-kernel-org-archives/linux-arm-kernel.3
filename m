Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F1DC71135
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 12:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pCiDW5WSRWR2OtMnmC7qwHUfLvLFk2UOGMdaCJ74JQk=; b=DzUMzDcroDAmrUsohLVc2gp2mG
	RbwXVfa2skVmS6Kc/PiUqnBJIjMGER5mtLQDh69FOsXJx+Djge4KpjEaqyiobLQKWMzTTnmnxGy8F
	YpvCkQujXWxdapy9becX87tc49LTlzKim3cO2RLLGS/XeFSPhZAtlzeeoi+q20eZ0mdpEVxViidD7
	HESsKy1FAkmL/mHzgxGhzYLNUphcyDiHVr/vXJf4WbTRR2p+/3brlbrrOn84RF/nKSp9QB25U/O8f
	lCfa0x6T1AYfBbpsB7kFa3rrcKQGcfF46coa5ibdvoEMlRWOUwmuS6QzxU2COIT2sRfYQcHDqqLiW
	70JDc52Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ3QC-0000000GM2a-0NKd;
	Fri, 13 Jun 2025 12:22:12 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ3Gu-0000000GLGU-3Urr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 12:12:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749816757; x=1781352757;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q8gbfUYNETamHMlqMO9QOqlu77JO0RYCF9BXmbQkWK8=;
  b=eke9G0B1fKklklVkRVh/s2iVN2eQDEZmjoBIV3Z7u3nGmHhkWYPgg1JK
   aZ9lD0GNPFm7ry17M1FKSCVeqQVM7EPDfuaii2p0R5WVz5A/dgjVPuRxn
   gaflIAsCc+wj8b2enmfBjvjlEbQEVUOOIzNTx5R7lxOo7i/G177dGaJ44
   TZFICWQIo7AOnLtjwnsoY94Z3cgHKCqA0SeVsjvUrDtTbXdToV/5sEmiA
   4KlVIy9M00x0LLUR12KAdwN9pyEQtYeAqozR+BYXlP4q3lC6Tk3MKfuxh
   IIIYlmW18oGU4K838nmRf2T7ZOF0dKmZ3p7Tz48OnlzUp9NWKM1nLtXcd
   g==;
X-CSE-ConnectionGUID: +UTA8CGzQc+RR3Qd+Lj8mA==
X-CSE-MsgGUID: vf49XRgNRH2wPLT8lWfRdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="52012648"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="52012648"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 05:12:36 -0700
X-CSE-ConnectionGUID: Kd6ix5V9Q0OrAW95lrLS1w==
X-CSE-MsgGUID: OJffvJHpS2u3WKMrqEw+4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="185055534"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Jun 2025 05:12:32 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQ3Gm-000CZu-2y;
	Fri, 13 Jun 2025 12:12:28 +0000
Date: Fri, 13 Jun 2025 20:11:48 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Gerlach <matthew.gerlach@altera.com>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, maxime.chevallier@bootlin.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	richardcochran@gmail.com, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev,
	Matthew Gerlach <matthew.gerlach@altera.com>,
	Mun Yew Tham <mun.yew.tham@altera.com>
Subject: Re: [PATCH v5] dt-bindings: net: Convert socfpga-dwmac bindings to
 yaml
Message-ID: <202506131908.dH1ks6AW-lkp@intel.com>
References: <20250612221630.45198-1-matthew.gerlach@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612221630.45198-1-matthew.gerlach@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_051236_911013_CF5109F2 
X-CRM114-Status: GOOD (  11.63  )
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

Hi Matthew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on net-next/main net/main linus/master v6.16-rc1 next-20250613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Gerlach/dt-bindings-net-Convert-socfpga-dwmac-bindings-to-yaml/20250613-062051
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250612221630.45198-1-matthew.gerlach%40altera.com
patch subject: [PATCH v5] dt-bindings: net: Convert socfpga-dwmac bindings to yaml
reproduce: (https://download.01.org/0day-ci/archive/20250613/202506131908.dH1ks6AW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506131908.dH1ks6AW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/net/altr,gmii-to-sgmii.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/firmware/intel,stratix10-svc.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/ti,tps6131x.yaml
   Warning: arch/riscv/kernel/kexec_image.c references a file that doesn't exist: Documentation/riscv/boot-image-header.rst
   Warning: drivers/clocksource/timer-armada-370-xp.c references a file that doesn't exist: Documentation/devicetree/bindings/timer/marvell,armada-370-xp-timer.txt
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

