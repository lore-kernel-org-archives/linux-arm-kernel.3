Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B29C606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 03:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hYkel+Mh;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N7LmbD8A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8Uj9OZsbv88tlXQeC3giO92nHVmp5niI8PEJKn2vPKI=; b=hYkel+MhTp9CaH02Df0rWbCIkS
	4ARcEQS30/fAXSzPdEmijZGG3qrxuiGzpOw+9eeldqb6Ai/xrkHDGvnQoygrjf4F2njsYhRvTHry7
	9NFtStVJG6U14y1/862HOLse3avHeZGLhBRrU4377UIxmpo6SwGISJJDKSBwh+I+2qYEGNiTLrOFo
	922BXa5CTEQXpQjOcQDjohRiYxdl7D8SxcEfmpsINIK+W8RGFyBZHUCeSJ5AN5CQaqA1/R3GnYxNN
	P4QlpBJZkQiOHOvuahs3Aj687Y7WDSs8M5E6O8h8vsojd4qrgFRinYNVwdeVilpQHJGWBuiR+2jwW
	f02+WaeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMzzD-0000000CujN-3UpY;
	Sat, 31 Oct 2026 03:42:31 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMzzA-0000000Cuia-3Dxp;
	Sat, 31 Oct 2026 03:42:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793418148; x=1824954148;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pLDMaA9u2DIya46UgXd1Q3O/zpB0FhmIJRX1KN0DRWI=;
  b=N7LmbD8AibCHRRnB09O6jV2dnm8XoQ3EQhrWgu9N73Fxp/SRgPaDhHAd
   B7nmBwHaYHTcmwwGpwXG7l94umLIdPueJe8TSwcQrH2tJucez0qdxZh7w
   ScWH5yFCZtaOCf+NP4JNcPvBJVyVR2/e8PjZeqyY89up9O8WJxe/mCakM
   YVqJuWwckl5O/rKH4x7lf0sm6qLRIH+rtVhgopiE3GgTPpHufEWJbv57B
   hQ+tdXDOeLU/MCjg6pckx3P1RSXWFBybUPkq+XO8exU5Rr5m/O4ZbI/F3
   ucG/9bFFAltjU7YfknyH+ivsBCNmboIurmYgxzAgYiRLdpQd5AgcWWfnn
   g==;
X-CSE-ConnectionGUID: j3ccPf4aQPmxjQfB7pxY4w==
X-CSE-MsgGUID: Tn39DXx3RpSa3oD9c70prg==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2188807"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2188807"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 20:42:27 -0700
X-CSE-ConnectionGUID: DlbAhomOT9OdKtm3J6iyBQ==
X-CSE-MsgGUID: tV3OVMKbQOieESNB2zVCiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5568179"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Oct 2026 20:42:24 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMzz3-00000000cVM-2DbZ;
	Sat, 31 Oct 2026 03:42:21 +0000
Date: Sat, 31 Oct 2026 11:41:44 +0800
From: kernel test robot <lkp@intel.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Mika Westerberg <westeri@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH 1/4] thunderbolt: add platform nhi driver
Message-ID: <202610311159.EWCMURna-lkp@intel.com>
References: <20261030082539.1208733-2-chunfeng.yun@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030082539.1208733-2-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_204228_882213_81007FBB 
X-CRM114-Status: GOOD (  11.02  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Chunfeng,

kernel test robot noticed the following build errors:

[auto build test ERROR on westeri-thunderbolt/next]
[also build test ERROR on linus/master v7.3 next-20261030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chunfeng-Yun/thunderbolt-add-platform-nhi-driver/20261030-162536
base:   https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
patch link:    https://lore.kernel.org/r/20261030082539.1208733-2-chunfeng.yun%40mediatek.com
patch subject: [PATCH 1/4] thunderbolt: add platform nhi driver
config: arm64-randconfig-1003-20261031 (https://download.01.org/0day-ci/archive/20261031/202610311159.EWCMURna-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610311159.EWCMURna-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610311159.EWCMURna-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: drivers/thunderbolt/domain.o: in function `tb_domain_init':
>> drivers/thunderbolt/domain.c:909: multiple definition of `init_module'; drivers/thunderbolt/pci.o:drivers/thunderbolt/pci.c:753: first defined here
   aarch64-linux-ld: drivers/thunderbolt/domain.o: in function `tb_domain_exit':
>> drivers/thunderbolt/domain.c:935: multiple definition of `cleanup_module'; drivers/thunderbolt/pci.o:drivers/thunderbolt/pci.c:753: first defined here
   aarch64-linux-ld: drivers/thunderbolt/plat.o: in function `nhi_plat_driver_init':
   drivers/thunderbolt/plat.c:152: multiple definition of `init_module'; drivers/thunderbolt/pci.o:drivers/thunderbolt/pci.c:753: first defined here
   aarch64-linux-ld: drivers/thunderbolt/plat.o: in function `nhi_plat_driver_exit':
   drivers/thunderbolt/plat.c:152: multiple definition of `cleanup_module'; drivers/thunderbolt/pci.o:drivers/thunderbolt/pci.c:753: first defined here


vim +909 drivers/thunderbolt/domain.c

a8937f35cf39c3 Mika Westerberg 2025-11-06  907  
4bef343876ebc1 Chunfeng Yun    2026-10-30  908  static int __init tb_domain_init(void)
9d3cce0b613689 Mika Westerberg 2017-06-06 @909  {
d1ff70241a2751 Mika Westerberg 2017-10-02  910  	int ret;
d1ff70241a2751 Mika Westerberg 2017-10-02  911  
cba57ed6f1e752 Mika Westerberg 2025-08-12  912  	tb_configfs_init();
54e418106c765c Gil Fine        2020-06-29  913  	tb_debugfs_init();
ccc5cb8ad5d18e Rajmohan Mani   2021-04-01  914  	tb_acpi_init();
ccc5cb8ad5d18e Rajmohan Mani   2021-04-01  915  
d1ff70241a2751 Mika Westerberg 2017-10-02  916  	ret = tb_xdomain_init();
d1ff70241a2751 Mika Westerberg 2017-10-02  917  	if (ret)
ccc5cb8ad5d18e Rajmohan Mani   2021-04-01  918  		goto err_acpi;
d1ff70241a2751 Mika Westerberg 2017-10-02  919  	ret = bus_register(&tb_bus_type);
d1ff70241a2751 Mika Westerberg 2017-10-02  920  	if (ret)
54e418106c765c Gil Fine        2020-06-29  921  		goto err_xdomain;
54e418106c765c Gil Fine        2020-06-29  922  
54e418106c765c Gil Fine        2020-06-29  923  	return 0;
54e418106c765c Gil Fine        2020-06-29  924  
54e418106c765c Gil Fine        2020-06-29  925  err_xdomain:
d1ff70241a2751 Mika Westerberg 2017-10-02  926  	tb_xdomain_exit();
ccc5cb8ad5d18e Rajmohan Mani   2021-04-01  927  err_acpi:
ccc5cb8ad5d18e Rajmohan Mani   2021-04-01  928  	tb_acpi_exit();
54e418106c765c Gil Fine        2020-06-29  929  	tb_debugfs_exit();
d1ff70241a2751 Mika Westerberg 2017-10-02  930  
d1ff70241a2751 Mika Westerberg 2017-10-02  931  	return ret;
9d3cce0b613689 Mika Westerberg 2017-06-06  932  }
9d3cce0b613689 Mika Westerberg 2017-06-06  933  
4bef343876ebc1 Chunfeng Yun    2026-10-30  934  static void __exit tb_domain_exit(void)
9d3cce0b613689 Mika Westerberg 2017-06-06 @935  {
9d3cce0b613689 Mika Westerberg 2017-06-06  936  	bus_unregister(&tb_bus_type);
9d3cce0b613689 Mika Westerberg 2017-06-06  937  	ida_destroy(&tb_domain_ida);
719a5fe87ecd71 Mika Westerberg 2020-03-05  938  	tb_nvm_exit();
d1ff70241a2751 Mika Westerberg 2017-10-02  939  	tb_xdomain_exit();
ccc5cb8ad5d18e Rajmohan Mani   2021-04-01  940  	tb_acpi_exit();
54e418106c765c Gil Fine        2020-06-29  941  	tb_debugfs_exit();
cba57ed6f1e752 Mika Westerberg 2025-08-12  942  	tb_configfs_exit();
9d3cce0b613689 Mika Westerberg 2017-06-06  943  }
4bef343876ebc1 Chunfeng Yun    2026-10-30  944  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

