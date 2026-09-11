Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E92EC88E4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 08:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TH6m/QAEUlSnhzg5dBKQRCbf+WIWZExag9hTBql6h3k=; b=JLuCGWKe/wEM6l6ewDzQVoy5zW
	4mrLwnD9UDboD/Gc/QLD2d2FNGqNs/wwCR8fvqftIJ/l5duoTZWHxoJGmjnmEg/ngi2pZxo/vF9O4
	jVZ0cEn4UjF9XldK0fBNtbdsjnp1hCsO4DPg3JwICrUXNLHwQMdnmlkKB+h6reEgE7I1MWaMJWO76
	rw3LX8h/uz74yAl9Iw6+cA5jiPVB82Nu6eHzo9jKMB8YnTvTMVga2W88IOHpcFOBt24meTbLNJFQH
	zDlxUZIl0wzqKhtYaA9HXUwRrF9Svnneg1EzI0Sx4UzSzRAEvXWlzQdtuGoPqEDMT85lXOp3ptyp+
	9wNU3xJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wWc-0000000G7CT-2Osl;
	Fri, 11 Sep 2026 08:22:22 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wWa-0000000G7C3-2KjQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 08:22:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789114940; x=1820650940;
  h=date:from:to:cc:subject:message-id;
  bh=xjkrJ7Lwky/xqtsbWxDMavRok7pjROixcgIPJyaqUvY=;
  b=DdycfZYbPWaq/g6JhuC94XQ2OmqdL+0vglzfsuzzkdzZNzF3p3+S8gDZ
   6mrT75w4hhDfTxPT5LdPgufOhIxzjlsBuhzKDei4ZaTWVYHCCrLXfZrP7
   WI6x/OIGXY0lqyI1jkhluF5SruiU/0G54lDTFGXvO3FcFlMjEk34e77EY
   +g5uHmVHQ+YzeAlCUPDE0gZCLAfgmb9RU4HWAhBQOVdueYOLbiU05szV/
   Fgp/BSX4wUQJlyDfO9OxFc6R6Gs/xjT+MQdUVHHclYwU5HtJSMqMbQ22f
   ybY+1+ArAIJyLfzSozXCKDHS+nQanRf7NR1XA92mVpnB2v5l9a0+AJrgl
   g==;
X-CSE-ConnectionGUID: GBdP66B/Tkypfhukgu/LJA==
X-CSE-MsgGUID: +PADi03cT/KaEOikr37lBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89704798"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="89704798"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 01:22:13 -0700
X-CSE-ConnectionGUID: HcN+llh/QTCNPSeOjaCskQ==
X-CSE-MsgGUID: y3ZYdl0DS1uNFcWAn8bZdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="265662992"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 11 Sep 2026 01:22:10 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4wWN-000000000kV-2Vaq;
	Fri, 11 Sep 2026 08:22:07 +0000
Date: Fri, 11 Sep 2026 10:22:04 +0200
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove-7.3 223/295]
 include/linux/spi/spi-mem.h:218:9: error: expected expression before '{'
 token
Message-ID: <202609111051.jJL6JLa1-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_012220_632127_CFD440F7 
X-CRM114-Status: UNSURE (   9.27  )
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
head:   cf983087c51a9c74c3d4d3b353eb811ae5030823
commit: 775a75095f86749e6b3f0b57e7fe40d03110453d [223/295] mtd: spi-nor: remove controller_ops support
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260911/202609111051.jJL6JLa1-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609111051.jJL6JLa1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609111051.jJL6JLa1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mtd/spi-nor.h:11,
                    from drivers/mtd/spi-nor/winbond.c:7:
   drivers/mtd/spi-nor/winbond.c: In function 'winbond_nor_select_die':
>> include/linux/spi/spi-mem.h:218:9: error: expected expression before '{' token
     218 |         {                                                       \
         |         ^
   drivers/mtd/spi-nor/winbond.c:22:9: note: in expansion of macro 'SPI_MEM_OP'
      22 |         SPI_MEM_OP(SPI_MEM_OP_CMD(WINBOND_NOR_OP_SELDIE, 0),            \
         |         ^~~~~~~~~~
   drivers/mtd/spi-nor/winbond.c:115:14: note: in expansion of macro 'WINBOND_NOR_SELDIE_OP'
     115 |         op = WINBOND_NOR_SELDIE_OP(nor->bouncebuf);
         |              ^~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/winbond.c: In function 'winbond_nor_write_ear':
>> include/linux/spi/spi-mem.h:218:9: error: expected expression before '{' token
     218 |         {                                                       \
         |         ^
   drivers/mtd/spi-nor/winbond.c:16:9: note: in expansion of macro 'SPI_MEM_OP'
      16 |         SPI_MEM_OP(SPI_MEM_OP_CMD(WINBOND_NOR_OP_WREAR, 0),             \
         |         ^~~~~~~~~~
   drivers/mtd/spi-nor/winbond.c:409:14: note: in expansion of macro 'WINBOND_NOR_WREAR_OP'
     409 |         op = WINBOND_NOR_WREAR_OP(nor->bouncebuf);
         |              ^~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/mtd/spi-nor.h:11,
                    from winbond.c:7:
   winbond.c: In function 'winbond_nor_select_die':
>> include/linux/spi/spi-mem.h:218:9: error: expected expression before '{' token
     218 |         {                                                       \
         |         ^
   winbond.c:22:9: note: in expansion of macro 'SPI_MEM_OP'
      22 |         SPI_MEM_OP(SPI_MEM_OP_CMD(WINBOND_NOR_OP_SELDIE, 0),            \
         |         ^~~~~~~~~~
   winbond.c:115:14: note: in expansion of macro 'WINBOND_NOR_SELDIE_OP'
     115 |         op = WINBOND_NOR_SELDIE_OP(nor->bouncebuf);
         |              ^~~~~~~~~~~~~~~~~~~~~
   winbond.c: In function 'winbond_nor_write_ear':
>> include/linux/spi/spi-mem.h:218:9: error: expected expression before '{' token
     218 |         {                                                       \
         |         ^
   winbond.c:16:9: note: in expansion of macro 'SPI_MEM_OP'
      16 |         SPI_MEM_OP(SPI_MEM_OP_CMD(WINBOND_NOR_OP_WREAR, 0),             \
         |         ^~~~~~~~~~
   winbond.c:409:14: note: in expansion of macro 'WINBOND_NOR_WREAR_OP'
     409 |         op = WINBOND_NOR_WREAR_OP(nor->bouncebuf);
         |              ^~~~~~~~~~~~~~~~~~~~


vim +218 include/linux/spi/spi-mem.h

c36ff266dc82f4a Boris Brezillon 2018-04-26  216  
0fefeade90e74bc Miquel Raynal   2024-12-24  217  #define SPI_MEM_OP(__cmd, __addr, __dummy, __data, ...)		\
c36ff266dc82f4a Boris Brezillon 2018-04-26 @218  	{							\
c36ff266dc82f4a Boris Brezillon 2018-04-26  219  		.cmd = __cmd,					\
c36ff266dc82f4a Boris Brezillon 2018-04-26  220  		.addr = __addr,					\
c36ff266dc82f4a Boris Brezillon 2018-04-26  221  		.dummy = __dummy,				\
c36ff266dc82f4a Boris Brezillon 2018-04-26  222  		.data = __data,					\
0fefeade90e74bc Miquel Raynal   2024-12-24  223  		__VA_ARGS__					\
c36ff266dc82f4a Boris Brezillon 2018-04-26  224  	}
c36ff266dc82f4a Boris Brezillon 2018-04-26  225  

:::::: The code at line 218 was first introduced by commit
:::::: c36ff266dc82f4ae797a6f3513c6ffa344f7f1c7 spi: Extend the core to ease integration of SPI memory controllers

:::::: TO: Boris Brezillon <boris.brezillon@bootlin.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

