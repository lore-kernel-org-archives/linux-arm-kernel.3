Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58A2C79FBF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 15:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=egjXlTO+DDdBNX7oUJIbp/5S5+lAPsCv98LOkwHuUVM=; b=sGyHwtpK9OPpn171sh2tqVU28D
	tzGsy17AWSLR3LzOa894b/+RFz0KZka3rRNoUMc+qfTnb+ybTguKpSicQ+28x9dcTKHmGiYSpryC7
	3X7N3nHkWbrhx9OzX3dLiNXTjoOK0prYvvg7bqpHoSoWk6A8OlGICVYc/yWoj7hCotRrgX3way1Qa
	SK95u3rYLuK93mlQ2OoIPnntj561f+qgaFXxZpGUJsh+JyiZ4AvYtzGmq8tiNborvRbwmR0zNdSFG
	4HUOyWNAJPHsb+tYd6tQfnxbASYt205uILZNaFN3ehDV//rdG7GGLdc4/MArbjPghEg1EKjnAMgmi
	StBTj+BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gwB-0000000EqfD-2ziy;
	Thu, 10 Sep 2026 15:43:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gw7-0000000EqdH-3sTN
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 15:43:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=egjXlTO+DDdBNX7oUJIbp/5S5+lAPsCv98LOkwHuUVM=; b=iMuN1fagw2gG2yLeRar7Iuudpu
	heDh6HMMxTFiefdXu8OLhikIR/epUH4vc3zmbsuA8UnNIXidxapjcXda8cXk5U3dPuz5F0tJ9IdN0
	jLODh0aNmp1+jR+J3UrHnx49lNghTZjv0NyXZMYGJqchtdXwVd2bIujxFSfi2Q0b1BqyoEFLdDCF9
	eAuEhi6PIMkxc6sc2JIWC2HqqCAKWVTqhhBtK0r4NjpIOXVPx+HUnMb6JufIrtftakpj4nuaG3tGG
	iiusGqfv8l7AHdwWZR5HqFbbmuJhcx3cPvGEuvkg/7Br25AE7b6YqngazdAOdTc2z+v7vfqQzT7Jo
	OJWOdO3g==;
Received: from mgamail.intel.com ([198.175.65.15])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4gw4-00000002h4Q-0T8v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 15:43:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789055016; x=1820591016;
  h=date:from:to:cc:subject:message-id;
  bh=kl710Ogpmd2+II85avk0ufWudsJiE1q8vjfpO/pbOOs=;
  b=XDCR2B5ZCmbMNcGhQO+UUOo8FiKsUw86BJxqNRc5HpGx5ksGjmX4CHwQ
   VsgRFs2tMPd82HRxK4fE6ZiaZSEVho8sbPrgxvkkMNEl4UCSkQDTXcGUm
   Ap76bmbk6DRTCtw6JqT4V9ANnLqAWCy/k0zZ5nrHHpOqkycRh8GFdwjXP
   OjqLspFtlic0QkuE4muKeWZXMHL31QHSKJZ7D4Ix0r67f8KbDW4JpV46J
   yq4Ju8+QrGWDXU7Egu/3oi/4wtYvXRlFcGsEeJINGCTEttWxqilM29z50
   cxLgUjmfX1F+5nMtWRWAKT5uurTpcc1MuPK1lWDdyHe3XZwGM4yasfnra
   Q==;
X-CSE-ConnectionGUID: 4YoXmvC8QcyaiOQ6k8dn2g==
X-CSE-MsgGUID: kK9FpVU+RJKtrCrSUSLOIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="93200681"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="93200681"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 08:43:34 -0700
X-CSE-ConnectionGUID: 73AamxUcTFy3XN6APV26IQ==
X-CSE-MsgGUID: SFh3gaiUQn+2GCfL8nAJPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="301572123"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 10 Sep 2026 08:43:32 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4gvy-000000000Rc-0PWd;
	Thu, 10 Sep 2026 15:43:30 +0000
Date: Thu, 10 Sep 2026 17:42:42 +0200
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove-7.3 226/294]
 drivers/mtd/spi-nor/spansion.c:100:9: error: call to undeclared function
 'spi_nor_controller_ops_write_reg'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202609101458.dCAUeSAA-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_164336_537526_4FD44AD9 
X-CRM114-Status: UNSURE (   9.24  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove-7.3
head:   3ac93c1e700558259ea604f7d4f37e26820fba15
commit: 62e3b560c8fdcab6be5dce819f3b76df95cd95dc [226/294] mtd: spi-nor: remove controller_ops support
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20260910/202609101458.dCAUeSAA-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609101458.dCAUeSAA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609101458.dCAUeSAA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mtd/spi-nor/spansion.c:100:9: error: call to undeclared function 'spi_nor_controller_ops_write_reg'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     100 |                 ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_CLSR,
         |                       ^
   1 error generated.
--
>> drivers/mtd/spi-nor/winbond.c:122:9: error: call to undeclared function 'spi_nor_controller_ops_write_reg'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     122 |                 ret = spi_nor_controller_ops_write_reg(nor,
         |                       ^
   drivers/mtd/spi-nor/winbond.c:424:9: error: call to undeclared function 'spi_nor_controller_ops_write_reg'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     424 |                 ret = spi_nor_controller_ops_write_reg(nor,
         |                       ^
   2 errors generated.


vim +/spi_nor_controller_ops_write_reg +100 drivers/mtd/spi-nor/spansion.c

d534fd9787d592 Takahiro Kuwano 2023-07-26   83  
91f3c430f622be Takahiro Kuwano 2023-04-07   84  /**
91f3c430f622be Takahiro Kuwano 2023-04-07   85   * spansion_nor_clear_sr() - Clear the Status Register.
91f3c430f622be Takahiro Kuwano 2023-04-07   86   * @nor:	pointer to 'struct spi_nor'.
91f3c430f622be Takahiro Kuwano 2023-04-07   87   */
91f3c430f622be Takahiro Kuwano 2023-04-07   88  static void spansion_nor_clear_sr(struct spi_nor *nor)
91f3c430f622be Takahiro Kuwano 2023-04-07   89  {
d534fd9787d592 Takahiro Kuwano 2023-07-26   90  	const struct spansion_nor_params *priv_params = nor->params->priv;
91f3c430f622be Takahiro Kuwano 2023-04-07   91  	int ret;
91f3c430f622be Takahiro Kuwano 2023-04-07   92  
91f3c430f622be Takahiro Kuwano 2023-04-07   93  	if (nor->spimem) {
d534fd9787d592 Takahiro Kuwano 2023-07-26   94  		struct spi_mem_op op = SPANSION_OP(priv_params->clsr);
91f3c430f622be Takahiro Kuwano 2023-04-07   95  
91f3c430f622be Takahiro Kuwano 2023-04-07   96  		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
91f3c430f622be Takahiro Kuwano 2023-04-07   97  
91f3c430f622be Takahiro Kuwano 2023-04-07   98  		ret = spi_mem_exec_op(nor->spimem, &op);
91f3c430f622be Takahiro Kuwano 2023-04-07   99  	} else {
91f3c430f622be Takahiro Kuwano 2023-04-07 @100  		ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_CLSR,
91f3c430f622be Takahiro Kuwano 2023-04-07  101  						       NULL, 0);
91f3c430f622be Takahiro Kuwano 2023-04-07  102  	}
91f3c430f622be Takahiro Kuwano 2023-04-07  103  
91f3c430f622be Takahiro Kuwano 2023-04-07  104  	if (ret)
91f3c430f622be Takahiro Kuwano 2023-04-07  105  		dev_dbg(nor->dev, "error %d clearing SR\n", ret);
91f3c430f622be Takahiro Kuwano 2023-04-07  106  }
91f3c430f622be Takahiro Kuwano 2023-04-07  107  

:::::: The code at line 100 was first introduced by commit
:::::: 91f3c430f622befb1b11f07df3bf7163f46adda6 mtd: spi-nor: spansion: Add a new ->ready() hook for multi-chip device

:::::: TO: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
:::::: CC: Tudor Ambarus <tudor.ambarus@linaro.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

