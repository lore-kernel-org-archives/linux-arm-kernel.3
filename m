Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05276107BCE8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 23:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GQzkI1YP70rsOy4iyQi3ymlvQNl9NOp+GKktgX8WIx0=; b=dpGzNIXEvj9To2yIJZksvwWcGy
	hOS7BPyHewnwZccizhGVq/9UFoXpNiZD6pt4nnwbsVU9oPGQitT3X5D6ZtqKxpuqMcPdSIFEat6ls
	SA46xpk1n2qY/IzYRxNo6RvITEZafWvgmYUVB26G8Sh9OxiOTq0Y4QO6Zv/hutDTMNTr84ATqLP93
	rPdc+ZUeJgrP6NuG/q6RjIrgVFSqaQPWk11cWNNGQgjsejqNrvk1pg5i7tbMRwnHr2+QpHcV1j7Ge
	Xdm4VBqBcwXWQ5AwPvNvY9hR/pDPLqPrhFUCnqj2ZmIBD6dKsS9nRjR8+Aee48aLWzoHmp7j6YUU8
	zl5NQPaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Bn8-00000001JSq-1g9R;
	Fri, 13 Mar 2026 23:19:38 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Bn5-00000001JSU-1IIo;
	Fri, 13 Mar 2026 23:19:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773443975; x=1804979975;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=taL4VuSTv2A1JaSTkD9QBZhRkJcauZHEdBcYGm6zPLA=;
  b=CCOIbhrhIeddhS2bnKpiJ83IhhqsrefNdd8yiHcX4QBx9gXOHyJD9AsW
   PEswpJdWqFLRF2fKse0LIx2P3J79M8vMYEyavN6X0qTvf+eotLxMfSxOD
   VkdN8fXEheTbrWMghbSS1IkR4T4bvMaLl3s2st4wXzJpT1vr7Nc13FRai
   v5x0GJddpICrcGnVDPHjgzgvgoPnjzpA+Be90A+yR+QoBPiZ8Mn6cMIKl
   X66lLS4PmoqadegbQ0tTl/5qmi4nWtq5ONaWp6WYyxB2Bnn5ncIyJR3Fg
   Ekhh70sBgbzI3ozSPJMzECT+bTW7PZX8llgWpBrGRux1h7lP87H5MybSJ
   A==;
X-CSE-ConnectionGUID: WcVUJHirSLiZr4yXJb8uNA==
X-CSE-MsgGUID: aP743cDPSgynSNxCRlZwQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="77163510"
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="77163510"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 16:19:30 -0700
X-CSE-ConnectionGUID: 20DZDlkLT22uPy9QR+yoag==
X-CSE-MsgGUID: I5XDbt38SwKG+gCbSTqdfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="217268540"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Mar 2026 16:19:25 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w1Bms-000000004OZ-3Iu0;
	Fri, 13 Mar 2026 23:19:22 +0000
Date: Sat, 14 Mar 2026 07:19:20 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Zhang <18255117159@163.com>, lpieralisi@kernel.org,
	jingoohan1@gmail.com, mani@kernel.org, kwilczynski@kernel.org,
	bhelgaas@google.com, helgaas@kernel.org,
	florian.fainelli@broadcom.com, jim2101024@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, robh@kernel.org,
	ilpo.jarvinen@linux.intel.com, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, claudiu.beznea.uj@bp.renesas.com,
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-omap@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: Re: [PATCH v8 1/5] PCI: Add pcie_get_link_speed() helper for safe
 array access
Message-ID: <202603140748.u17h0ZM8-lkp@intel.com>
References: <20260312163652.113228-2-18255117159@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312163652.113228-2-18255117159@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_161935_419701_EAC551EF 
X-CRM114-Status: UNSURE (   9.17  )
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

Hi Hans,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 80234b5ab240f52fa45d201e899e207b9265ef91]

url:    https://github.com/intel-lab-lkp/linux/commits/Hans-Zhang/PCI-Add-pcie_get_link_speed-helper-for-safe-array-access/20260313-220734
base:   80234b5ab240f52fa45d201e899e207b9265ef91
patch link:    https://lore.kernel.org/r/20260312163652.113228-2-18255117159%40163.com
patch subject: [PATCH v8 1/5] PCI: Add pcie_get_link_speed() helper for safe array access
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260314/202603140748.u17h0ZM8-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260314/202603140748.u17h0ZM8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603140748.u17h0ZM8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/pci/probe.c:793 expecting prototype for pcie_link_speed_value(). Prototype was for pcie_get_link_speed() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

