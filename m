Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 372CCC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 09:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QvUE+Tu/IVZPes5fzG0I4LWpU80ablvAm40ZZxVqfz4=; b=vBxhlIX1tkAVRWokhBmb+irOb0
	k+aBfuFAJOAa6hJEIKQ5bqGr016IlgE9ZfF7O+S6gFX+re18CWUMXoiEJ3J+82sqxt4vqp6NYckon
	F4fdVH0wQI4W0WmNsW32GJc51DJr82LESjVXTRJg62Io9b8woWRlxnqdv0J3mizRvk3HgPmZnJi1w
	+Le6stO7uy8/uxOW4TCT3yt7DDkaNs2eanSyIcrwblK7UILlXi/nxUEtEj8BXGtqtFMEZx08QRnrD
	2HUtHa+X7vGlFKPoiYTvXMEtir8wj2NizUxJHYfDzcwEcmrz9i5BZpUXCBlGOUAKBJVb2zav8kpBI
	Gh8tQvGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toIrH-0000000DfNj-0lMl;
	Sat, 01 Mar 2025 09:10:07 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toIpi-0000000DfIE-466n
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Mar 2025 09:08:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740820111; x=1772356111;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bQUvH/LR1KxS95c+RJnGjDSETbksb7G0/CS5aZy0gsA=;
  b=mqW+vvzLnaUfHEwO3VeNwHHsZVQ9QjpxqFYXZU0YVNy5ZXWF9aFgEAXz
   MacjHuruaZmTGknAKq1dAIq0deh0VwIejHp3kiRNjzDvV1GoE89i/b0fi
   GdWPtJh0t3UgCsVee33X0QDKqtzu0bzbubVgY8oBAnZ0kHVroAYjm9jgE
   mkxmJirwfBuGTarKduqpA5SPkDbyZGuDuGJ7WYVY3WFCvsx11pMl9YgZ1
   17at3MVnHdvf0ZxVubuxaqnmuOrZ0jgg7Z+bJjAGjUptpMlWOcYp+pF9R
   hc/zIXA0VdKgh8QLY95M7jDvNtQQeSWHRJa0B7ldY1n9IaMD4tAItizPO
   w==;
X-CSE-ConnectionGUID: +LajsOPGR5enrHEjeOO5/Q==
X-CSE-MsgGUID: P8FbZ0KMTDW2NdR5vweH1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="41596831"
X-IronPort-AV: E=Sophos;i="6.13,325,1732608000"; 
   d="scan'208";a="41596831"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 01:08:25 -0800
X-CSE-ConnectionGUID: hUwnSczhT5aCxc0MFFZ1sQ==
X-CSE-MsgGUID: 4nOe0TxbSYe4812Pe2RycA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,325,1732608000"; 
   d="scan'208";a="117564427"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 01 Mar 2025 01:08:22 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toIpX-000G4Q-2G;
	Sat, 01 Mar 2025 09:08:19 +0000
Date: Sat, 1 Mar 2025 17:07:36 +0800
From: kernel test robot <lkp@intel.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: exynos: add initial support for
 Samsung Galaxy S22+
Message-ID: <202503011651.Vto3vDw7-lkp@intel.com>
References: <20250223123044.725493-4-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250223123044.725493-4-ivo.ivanov.ivanov1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_010831_057395_FBBF0355 
X-CRM114-Status: GOOD (  13.26  )
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

Hi Ivaylo,

kernel test robot noticed the following build errors:

[auto build test ERROR on krzk/for-next]
[also build test ERROR on robh/for-next krzk-dt/for-next pinctrl-samsung/for-next linus/master v6.14-rc4 next-20250228]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivaylo-Ivanov/dt-bindings-arm-samsung-document-g0s-board-binding/20250223-203243
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20250223123044.725493-4-ivo.ivanov.ivanov1%40gmail.com
patch subject: [PATCH v2 3/4] arm64: dts: exynos: add initial support for Samsung Galaxy S22+
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250301/202503011651.Vto3vDw7-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250301/202503011651.Vto3vDw7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503011651.Vto3vDw7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/boot/dts/exynos/exynos2200-g0s.dts:9:
>> arch/arm64/boot/dts/exynos/exynos2200.dtsi:8:10: fatal error: 'dt-bindings/clock/samsung,exynos2200-cmu.h' file not found
       8 | #include <dt-bindings/clock/samsung,exynos2200-cmu.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +8 arch/arm64/boot/dts/exynos/exynos2200.dtsi

b661f5fc96c5e9 Ivaylo Ivanov 2025-02-23  @8  #include <dt-bindings/clock/samsung,exynos2200-cmu.h>
b661f5fc96c5e9 Ivaylo Ivanov 2025-02-23   9  #include <dt-bindings/interrupt-controller/arm-gic.h>
b661f5fc96c5e9 Ivaylo Ivanov 2025-02-23  10  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

