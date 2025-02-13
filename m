Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E933CC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 19:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pc5xOt1/QclHDVF4gV8SYATUmoTr4CZXBItKLp1Nk98=; b=VxcCfPJEbs2D7hHhb8nxZgaZfN
	F6mK05J8tGjh1ypFZckUaIL/j79oHe3HpY+xvupzbAbj1UmrdEmDM1NKi78hKaTYH5rtjVBOzBxy1
	rXpIstPTjq8qb7cv8Tuth7eYTeaqFTEFjZ823+O62SQgEkcK7LQYI5fnM1ASbkpb8bqhidxARRaJ6
	5HYDaMFMp9//BS9ivSM2xGwAJ1GvFfGgAuzehjxOPwnQjJLLn6/glQcDftQeKAllywoqoFNOmTbYE
	+t2ep6u1gigjtgwr6iwpCac/ZC3FTGDtsojzvM/VTrIRr3DfeGIuaRp1h32IuH9FMdjEWyRT/IoPJ
	iXFVXo+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tif8G-0000000CRn9-2UAm;
	Thu, 13 Feb 2025 19:44:20 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tieSx-0000000CKcj-3Mqg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 19:01:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739473300; x=1771009300;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q+9A+XPhqjom/iRBeDIijWx64bo72hPGQfck4ws9+vI=;
  b=SftDiA/lFd1yRiCNcLZMVU0efZqoIf+a3rlFjjL9ueXu+U5d8dMGkgrU
   3KsIOxIvIr/qR/LgHPFBtGl8hZbqdaEIB+/Vwqkw05aJUgal+1qwJrlGU
   n8nyc7MnF/0U0zEAmcfTPj3T54WNhuHQJjOx33DBav5KP6oatc+YTjFhj
   afT0UZBdhfQe4iIAqV73FES3l0NrE0aKjCVG7wxKBnaeKb9IXDegOSGqI
   LQrvOp/p/15TcIkE5wQ3q2mUm+J1XzJVBD3U4ah8wDLkD+yafAGWTqJTs
   SV4adrOvC1rBnK4wwIB+GMNXrrZtndTamdladhB7WdKpbw34lVgh1ZkyF
   Q==;
X-CSE-ConnectionGUID: DtyTVig2SiapPCXMMHlUmQ==
X-CSE-MsgGUID: H0uIiw3SQomIKt1p1RxdRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="39904419"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="39904419"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 11:01:38 -0800
X-CSE-ConnectionGUID: 5CWKBrssRMGyGx6vOVkWSA==
X-CSE-MsgGUID: 6oLgLwqdRvqCFTMmNE6hwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="113208216"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Feb 2025 11:01:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tieSX-0018bj-14;
	Thu, 13 Feb 2025 19:01:13 +0000
Date: Fri, 14 Feb 2025 03:00:33 +0800
From: kernel test robot <lkp@intel.com>
To: Denzeel Oliva <wachiturroxd150@gmail.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: Re: [PATCH v1] arm64: dts: exynos: r8s: enable UART interfaces and
 aliases
Message-ID: <202502140220.nEdgzjof-lkp@intel.com>
References: <20250213000226.277-1-wachiturroxd150@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213000226.277-1-wachiturroxd150@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_110139_877739_7E3FD9E5 
X-CRM114-Status: GOOD (  10.58  )
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

Hi Denzeel,

kernel test robot noticed the following build errors:

[auto build test ERROR on krzk/for-next]
[also build test ERROR on linus/master v6.14-rc2 next-20250213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Denzeel-Oliva/arm64-dts-exynos-r8s-enable-UART-interfaces-and-aliases/20250213-080512
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20250213000226.277-1-wachiturroxd150%40gmail.com
patch subject: [PATCH v1] arm64: dts: exynos: r8s: enable UART interfaces and aliases
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20250214/202502140220.nEdgzjof-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502140220.nEdgzjof-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502140220.nEdgzjof-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/exynos/exynos990-r8s.dts:122.1-10 Label or path usi_uart not found
>> Error: arch/arm64/boot/dts/exynos/exynos990-r8s.dts:127.1-10 Label or path serial_0 not found
>> Error: arch/arm64/boot/dts/exynos/exynos990-r8s.dts:131.1-13 Label or path usi_bt_uart not found
>> Error: arch/arm64/boot/dts/exynos/exynos990-r8s.dts:136.1-10 Label or path serial_1 not found
   FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

