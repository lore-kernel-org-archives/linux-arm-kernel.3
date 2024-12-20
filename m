Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A42B0E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 18:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6GTypMQlijOJKUm9wP9eDOFztTD3UokA0W/uK+gMKCw=; b=Mh/raunAlcxxjyIhISZoqy75zO
	NKGUIV1V8/w/fDvHtOvyHS5bQtDKF8WOB5Wgup51nKwC+AW3o8k+W0EL0K0pgdN3wAcorSl/sPjWY
	Nxm0zsoi0Z9k2WznQ03lT5WR2D8jd5DN3Oo6iIe8PSJpqZ1NE8KM6y8ei99/7UtemoJvpfrhgrZMg
	ymW1WNXi7vwpWra7NizaV/Pm34SmIGyXNucIobU+YceCsQ+ZQUAht/V6slrH2Z4meAuP+QP+vd4BY
	1f5kyB69ZTAVk4rylQ/zAzq83sjyfUMHiWgFe/XXsCMBR73tt3dQIupqoN/oIi4GzWqLOyy4Ub9gW
	eYt1r4og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOhjS-00000005nz2-3edy;
	Fri, 20 Dec 2024 18:28:14 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOhiI-00000005nqf-2OR1;
	Fri, 20 Dec 2024 18:27:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734719222; x=1766255222;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lVeG2+LVxzEoZ+Rnc836huFlQp02+Oj9SvSRKpveDbo=;
  b=TE2sNz4d8fsH7yf7xfr6MZ/YBbi8/DMQFbhYQx3YKhOFunLubhIYfd9q
   jUhuzZH4VIU8ZE6aMosYRk2oqlF2aXpnWNgV5hFaZzRqG9FEZ/ajM929P
   7OMEmI26tTwESOi17pzhYmt0wwy9hAzwNh9/M74vNGsHEhgxni4cHJzbb
   6eY3ypHgHpObWHJZsaDgN8S45s/EAdmEzQ4h5V686YNIBQ/cO+UAlhE0f
   /mdhzjOG4IIrboZHemXJTdOLwkTkkKxU1DaZFageLLDSBYNgiC4cuygsG
   4EfdYhz+swT2W+0fxMP5771L0dkOrRlp6wbMwnPmc2DJwj8kFVW5+aglV
   A==;
X-CSE-ConnectionGUID: I3B8dltRSbWvdm4jrqHcIg==
X-CSE-MsgGUID: KbHyC3MWSpixWbZISjX+rA==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="45882396"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="45882396"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 10:27:02 -0800
X-CSE-ConnectionGUID: K4pW+d6OTAmFjJn+m7+PFQ==
X-CSE-MsgGUID: lM36vNWZR1qKyNPD2rstbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="98354381"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Dec 2024 10:26:59 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOhiC-0001Wd-3B;
	Fri, 20 Dec 2024 18:26:56 +0000
Date: Sat, 21 Dec 2024 02:26:45 +0800
From: kernel test robot <lkp@intel.com>
To: mtk22730 <Cloud.Zhang@mediatek.com>, Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Cloud Zhang <cloud.zhang@mediatek.com>
Subject: Re: [PATCH] [v1] spi: spi-mtk-nor: Modify the clock architecture of
 nor controller
Message-ID: <202412210247.Brq06CHb-lkp@intel.com>
References: <20241212092206.14071-1-Cloud.Zhang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212092206.14071-1-Cloud.Zhang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_102702_624248_2ED1D500 
X-CRM114-Status: GOOD (  15.35  )
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

Hi mtk22730,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-spi/for-next]
[also build test WARNING on linus/master v6.13-rc3 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/mtk22730/spi-spi-mtk-nor-Modify-the-clock-architecture-of-nor-controller/20241212-172704
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/20241212092206.14071-1-Cloud.Zhang%40mediatek.com
patch subject: [PATCH] [v1] spi: spi-mtk-nor: Modify the clock architecture of nor controller
config: um-randconfig-002-20241220 (https://download.01.org/0day-ci/archive/20241221/202412210247.Brq06CHb-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 9daf10ff8f29ba3a88a105aaa9d2379c21b77d35)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412210247.Brq06CHb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412210247.Brq06CHb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/spi/spi-mtk-nor.c:10:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/spi/spi-mtk-nor.c:10:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:549:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     549 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:567:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     567 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/spi/spi-mtk-nor.c:10:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/spi/spi-mtk-nor.c:10:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:601:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     601 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:616:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     616 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:631:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     631 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:724:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     724 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:737:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     737 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:750:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     750 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:764:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     764 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:778:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     778 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:792:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     792 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/spi/spi-mtk-nor.c:746:19: warning: result of comparison of constant -22 with expression of type 'u8' (aka 'unsigned char') is always false [-Wtautological-constant-out-of-range-compare]
     746 |         if (!cnt || (cnt == -EINVAL)) {
         |                      ~~~ ^  ~~~~~~~
   14 warnings generated.


vim +746 drivers/spi/spi-mtk-nor.c

   737	
   738	static int mtk_nor_parse_clk(struct device *dev, struct mtk_nor *sp)
   739	{
   740		struct device_node *np = dev->of_node;
   741		int ret;
   742		const char *name;
   743		u8 cnt, i;
   744	
   745		cnt = of_property_count_strings(np, "clock-names");
 > 746		if (!cnt || (cnt == -EINVAL)) {
   747			dev_err(dev, "Unable to find clocks\n");
   748			ret = -EINVAL;
   749			goto out;
   750		} else if (cnt < 0) {
   751			dev_err(dev, "Count clock strings failed, err %d\n", cnt);
   752			ret = cnt;
   753			goto out;
   754		} else if (cnt > MAX_CLOCK_CNT) {
   755			ret = -EINVAL;
   756			goto out;
   757		}
   758	
   759		sp->clock_cnt = cnt;
   760	
   761		for (i = 0; i < cnt; i++) {
   762			ret = of_property_read_string_index(np, "clock-names", i,
   763					       &name);
   764			if (ret) {
   765				dev_err(dev, "failed to get clock string\n");
   766				return ret;
   767			}
   768	
   769			sp->clocks[i].name = name;
   770			sp->clocks[i].clki = devm_clk_get(dev, sp->clocks[i].name);
   771			if (IS_ERR(sp->clocks[i].clki)) {
   772				dev_err(dev, "get clock %s fail\n", sp->clocks[i].name);
   773				return PTR_ERR(sp->clocks[i].clki);
   774			}
   775		}
   776	
   777	out:
   778		return ret;
   779	}
   780	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

