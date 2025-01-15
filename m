Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A7AC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 21:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ocZ+ymLbnWlh0pOna7G/KIgz+bLTX/tfPSe3NxTLK9E=; b=zdv6e5421+DG6bS2uy+fCH1Cxw
	rDMzf5PfvkFdHVBxqKaeGi0VvuO/k4O4c8GcwlPQiu70Y7ZXeozTMx+RG0QTNDcdp5vWJbdI02D1y
	ZRwGHT5BuWCmbeRqHRW7DECmODcnIv5Ivh5EgNapCikCEjFownvTHq8uzhfMCUMmVcrKRl57ANyBD
	eo7NnzTJMMzlGYuhQD78pO2jMhrsLXwPNOwLR59c/+QpHH44O2zL6yQwW8et059P4Yu5XiAfrK5Yh
	4CSpe5jxkrNjiwGh7yFCg5G4hmTuJjuHlS+1vk2oUeTnRd8nX0nPtMa33pBlhWZQqPNOkGsrtN/dZ
	tcgYyVUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYAV1-0000000D4bZ-32au;
	Wed, 15 Jan 2025 21:00:27 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYAJC-0000000D2de-2XC2;
	Wed, 15 Jan 2025 20:48:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736974095; x=1768510095;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NBmFqEdQWXlXOmVjvWnaHQhn5HTvwDLz7apgLNcurQo=;
  b=Z5ixGcynaYTXL6PJSeNroahoPdOnKeL5Is4JBWNe3FYe6AXOKZW+zak9
   Xp+mcKYvbVtRpH3L8mpIw7QMWLE+Pm4gqOt76syEH2kO/by9HpK5VCng6
   5SRevxTh/JXXADueHvyKQlZNN2xgAu994oCp9RF+jGfQiN13Zf34HjVIa
   GV4nEzKEtkHY+nHxqt94SoSW4mTHahFUCsekRWCAAHqIm8yu1B4s07UD6
   ZlnQaZkpcQ3Ecduhy6kc1hDscYfLb21hhMAF7y0VzX1UMLyPVw0cbUy8w
   k+SCLeCo95sQa2h6Nq3XKRHwizhQ+mzxwKmVfG5Xetp0CNEdJvLvLhgKh
   w==;
X-CSE-ConnectionGUID: Uk4pvMv/QWGeOGKuqR2nhw==
X-CSE-MsgGUID: FR0OP/WuSnOTRBJc0+ZHoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37359037"
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; 
   d="scan'208";a="37359037"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 12:48:11 -0800
X-CSE-ConnectionGUID: wkYOM2pFTBG7tT3+IK/nSQ==
X-CSE-MsgGUID: Wb4Ztt1ATqGwNcp3rxZurw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105102930"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 15 Jan 2025 12:48:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYAJ2-000Qpv-1t;
	Wed, 15 Jan 2025 20:48:04 +0000
Date: Thu, 16 Jan 2025 04:48:00 +0800
From: kernel test robot <lkp@intel.com>
To: Yenchia Chen <yenchia.chen@mediatek.com>, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	yenchia.chen@mediatek.com, yj.chiang@mediatek.com,
	tbergstrom@nvidia.com, yujiaoliang@vivo.com,
	u.kleine-koenig@baylibre.com, treapking@chromium.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] serial: 8250_mtk: Add ACPI support
Message-ID: <202501160444.iXv8byKW-lkp@intel.com>
References: <20250114033324.3533292-1-yenchia.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114033324.3533292-1-yenchia.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_124814_693489_6286EE51 
X-CRM114-Status: GOOD (  11.79  )
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

Hi Yenchia,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on tty/tty-next tty/tty-linus usb/usb-testing usb/usb-next usb/usb-linus linus/master v6.13-rc7 next-20250115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yenchia-Chen/serial-8250_mtk-Add-ACPI-support/20250114-113715
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20250114033324.3533292-1-yenchia.chen%40mediatek.com
patch subject: [PATCH] serial: 8250_mtk: Add ACPI support
config: powerpc-randconfig-001-20250116 (https://download.01.org/0day-ci/archive/20250116/202501160444.iXv8byKW-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f5cd181ffbb7cb61d582fe130d46580d5969d47a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250116/202501160444.iXv8byKW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501160444.iXv8byKW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/8250/8250_mtk.c:662:36: warning: unused variable 'mtk8250_acpi_match' [-Wunused-const-variable]
     662 | static const struct acpi_device_id mtk8250_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/mtk8250_acpi_match +662 drivers/tty/serial/8250/8250_mtk.c

   661	
 > 662	static const struct acpi_device_id mtk8250_acpi_match[] = {
   663		{ "MTKI0511", 0 },
   664		{},
   665	};
   666	MODULE_DEVICE_TABLE(acpi, mtk8250_acpi_match);
   667	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

