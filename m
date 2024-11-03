Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C09D10C0D
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 03:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fFplHKSI7AcTIgeLiuy9Oc1WXlpzuQnkW4ZpUONwxMM=; b=BYoDndcedwLZJuaGnme6b8nGbp
	vBiX+TpO82GFigTzMks5m1h5NAWUzX9XFq+4czp1usCMgv/SivvohVlETX7VoObxs0ZRkMSxNZT9B
	bSbEQ1lm7ts+BWqGdQm4Jz6zmKDtmpsD+7pcDHxsdZLE4ky1EdYo8O8sgDv+gyp8VGH5/zfoUpJpH
	svDm4R44mBbAfRzyzh6nmciejf1WRBRx9gndoTCOSNhU08RkLQoz45LtlIEJt9ASTXT8MzBjFGo9P
	OnHFuJhlaQFFntN3LffZs5bG4kTPZpANTMYclhKU5o9q2WKs3vGH4Be0Z6H3Q8K82uiLvwvoqSVUj
	hTOwB2BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Rgd-0000000Atif-1PDy;
	Sun, 03 Nov 2024 03:53:59 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Rew-0000000Atbn-2UJo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Nov 2024 03:52:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730605934; x=1762141934;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z1S9UO18U2DBwIjGsUknPmpPF7pOiS9tbHRuIQ4GTJY=;
  b=VuS4kigFre6XR1yBHpvKORffYe0G7DzoKVz2A4wZWnFTKIAvbfQ+PGLN
   b8uRXy1iCJJWqtOVmIWuQyuRA9KLIyfw1zgHetyR6EpjyCXJZCY0eICdF
   qfipuMOqX3V4wfBkKQcldLSGeFiREE+xfYLEJtJ3xkk8Emo101jSuZoxl
   O09utbN8927xYSUzsEGQloY5cPDF/G0jB/z6JKnXM6HJaDJ4y/BexkqxK
   6EzFfllNdBulvieu342z8SMbSG6QHMjEMKUKFEiSkUHqR23twTuWIv3fb
   HGtQXUWlUOGlcEN0dCouiJIC1mghd4oxS7Frpmz91BUTzZ/KUQDp/kI3e
   w==;
X-CSE-ConnectionGUID: MTroBDyTQZ+IRHVs4My1ig==
X-CSE-MsgGUID: 0Jl3Q9TTSGyMuvBJP4as6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40871672"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40871672"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 20:52:11 -0700
X-CSE-ConnectionGUID: M+BNBSwTTn+D04QXHh9V2Q==
X-CSE-MsgGUID: r6kpZJV9S2ymbI/LIwYcBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,254,1725346800"; 
   d="scan'208";a="82850665"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 02 Nov 2024 20:52:11 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7Req-000jer-1K;
	Sun, 03 Nov 2024 03:52:08 +0000
Date: Sun, 3 Nov 2024 11:51:44 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:pci/apple-host-bridge-hook 6/7] ERROR: modpost:
 "msi_create_parent_irq_domain" [drivers/pci/controller/pcie-apple.ko]
 undefined!
Message-ID: <202411031109.VooDLSXC-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_205214_699231_27D62742 
X-CRM114-Status: UNSURE (   8.10  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git pci/apple-host-bridge-hook
head:   4109e0e2e9d3fb7de4ae6f3bade444cdc07c9b9a
commit: a6ad040d8cacc42d4ca565d71469ae10dd9cb371 [6/7] PCI: apple: Convert to MSI parent infrastructure
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20241103/202411031109.VooDLSXC-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241103/202411031109.VooDLSXC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411031109.VooDLSXC-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "msi_create_parent_irq_domain" [drivers/pci/controller/pcie-apple.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

