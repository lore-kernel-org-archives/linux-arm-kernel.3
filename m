Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3867DCA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 16:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z/JuR+/4PnQWakm3YwFnqVG9W3eOVnOiXBXWphPR1hk=; b=CzJjO4FD1T7Rnl22fvGVqv3nr0
	i6YFH8HurS+3vMD2au7QdgkvHf1+P7GinIXz2Jgsoz5dqFZ6o4RPOn9mEeIVA5MbK/TC+3Cc1PeCW
	+Jm+88141B7zMkbm0q4l8Dvw7qPxzfz6JXB5m7MZp0locmB6lmW6nG05gKKHzwhfXYEMjbP2BcIEg
	Y82Rqcfuf61DT41JmRwxCGMLg2Lvi43lJ8+zh5nwzhgnECYkCqdmDbhp1fQc17FwrELTYlfJBCEJI
	n/C06PdOtqsxwdf1imvjEizyFIvlw2GV5fBtFjf0colqwPbqfDsfniX1nslsdzqo6PJzJtF+HzV6o
	LgtVvYGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvI0y-0000000BqPt-2KSj;
	Sun, 07 Sep 2025 16:13:16 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvHy6-0000000BpAj-1ZT4;
	Sun, 07 Sep 2025 16:10:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757261418; x=1788797418;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3Zl6AVEGt9WisPqSWtg4X6buSc0QYXVLZOjy94tByxw=;
  b=VpezvTXOwZfHrgdKKP0duzQ+K42ExCN7x3L0Zpet9i/SkCL5GGYp2kxb
   VZo6gu9IT003yltT3bEiKoZ7hXqugrAmGliFPJ5FS3skx3UyDAemJ+KIO
   mekgvtUs0536mlDnH7dXCh/VJR+BmMd2m0WMM47rVPOoONfiwXxtaZUgw
   4e7tys0bkUZAs4oskofm95diYPOcbgwI4sBps16GMVvPEQSiRaQ19M9dY
   Q6lOT62EkJnBF9vAnzBVYKzBoCKkcmZRfn9MaUMYBnEnkKjxgN0Pc49st
   P8vgRWwyf5lY80il/BWOUpTDO/SPGoESLot+/VQjtHQ8WbrfUDwtDZ2Aq
   w==;
X-CSE-ConnectionGUID: CYuEiBmxQziHoSr1aAN2pg==
X-CSE-MsgGUID: yeBBlJuxRwuHs+KdUUuIqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59462262"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59462262"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2025 09:10:17 -0700
X-CSE-ConnectionGUID: Wh9M8o7RQ9iMYMUnx7+mHg==
X-CSE-MsgGUID: SztYKZBBSQ+peDyIbxLBCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,246,1751266800"; 
   d="scan'208";a="172951477"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 Sep 2025 09:10:14 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvHy0-0002MN-0C;
	Sun, 07 Sep 2025 16:10:12 +0000
Date: Mon, 8 Sep 2025 00:09:25 +0800
From: kernel test robot <lkp@intel.com>
To: WeiHao Li <cn.liweihao@gmail.com>, heiko@sntech.de, robh@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	WeiHao Li <cn.liweihao@gmail.com>
Subject: Re: [PATCH v1 1/4] phy: rockchip: inno-usb2: Add usb2 phy support
 for RK3368
Message-ID: <202509072227.wBI6dBl4-lkp@intel.com>
References: <20250905125318.7956-2-cn.liweihao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905125318.7956-2-cn.liweihao@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_091018_491616_99A0A77D 
X-CRM114-Status: GOOD (  11.55  )
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

Hi WeiHao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on robh/for-next arm/for-next arm/fixes arm64/for-next/core clk/clk-next kvmarm/next shawnguo/for-next soc/for-next linus/master v6.17-rc4 next-20250905]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/WeiHao-Li/phy-rockchip-inno-usb2-Add-usb2-phy-support-for-RK3368/20250905-205804
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20250905125318.7956-2-cn.liweihao%40gmail.com
patch subject: [PATCH v1 1/4] phy: rockchip: inno-usb2: Add usb2 phy support for RK3368
config: arc-randconfig-r132-20250907 (https://download.01.org/0day-ci/archive/20250907/202509072227.wBI6dBl4-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce: (https://download.01.org/0day-ci/archive/20250907/202509072227.wBI6dBl4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509072227.wBI6dBl4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/phy/rockchip/phy-rockchip-inno-usb2.c:1867:34: sparse: sparse: Initializer entry defined twice
   drivers/phy/rockchip/phy-rockchip-inno-usb2.c:1873:34: sparse:   also defined here

vim +1867 drivers/phy/rockchip/phy-rockchip-inno-usb2.c

  1849	
  1850	static const struct rockchip_usb2phy_cfg rk3368_phy_cfgs[] = {
  1851		{
  1852			.reg = 0x700,
  1853			.num_ports	= 2,
  1854			.clkout_ctl	= { 0x0724, 15, 15, 1, 0 },
  1855			.port_cfgs	= {
  1856				[USB2PHY_PORT_OTG] = {
  1857					.phy_sus	= { 0x0700, 8, 0, 0, 0x1d1 },
  1858					.bvalid_det_en	= { 0x0680, 3, 3, 0, 1 },
  1859					.bvalid_det_st	= { 0x0690, 3, 3, 0, 1 },
  1860					.bvalid_det_clr = { 0x06a0, 3, 3, 0, 1 },
  1861					.idfall_det_en	= { 0x0680, 6, 6, 0, 1 },
  1862					.idfall_det_st	= { 0x0690, 6, 6, 0, 1 },
  1863					.idfall_det_clr	= { 0x06a0, 6, 6, 0, 1 },
  1864					.idrise_det_en	= { 0x0680, 5, 5, 0, 1 },
  1865					.idrise_det_st	= { 0x0690, 5, 5, 0, 1 },
  1866					.idrise_det_clr	= { 0x06a0, 5, 5, 0, 1 },
> 1867					.ls_det_en	= { 0x0680, 2, 2, 0, 1 },
  1868					.ls_det_st	= { 0x0690, 2, 2, 0, 1 },
  1869					.ls_det_clr	= { 0x06a0, 2, 2, 0, 1 },
  1870					.utmi_bvalid	= { 0x04bc, 23, 23, 0, 1 },
  1871					.utmi_id	= { 0x04bc, 26, 26, 0, 1 },
  1872					.utmi_ls	= { 0x04bc, 25, 24, 0, 1 },
  1873					.ls_det_en	= { 0x079c, 15, 15, 1, 0 },
  1874				},
  1875				[USB2PHY_PORT_HOST] = {
  1876					.phy_sus	= { 0x0728, 8, 0, 0, 0x1d1 },
  1877					.ls_det_en	= { 0x0680, 4, 4, 0, 1 },
  1878					.ls_det_st	= { 0x0690, 4, 4, 0, 1 },
  1879					.ls_det_clr	= { 0x06a0, 4, 4, 0, 1 }
  1880				}
  1881			},
  1882			.chg_det = {
  1883				.opmode		= { 0x0700, 8, 0, 0, 0x1d7 },
  1884				.cp_det		= { 0x04b8, 30, 30, 0, 1 },
  1885				.dcp_det	= { 0x04b8, 29, 29, 0, 1 },
  1886				.dp_det		= { 0x04b8, 31, 31, 0, 1 },
  1887				.idm_sink_en	= { 0x0718, 8, 8, 0, 1 },
  1888				.idp_sink_en	= { 0x0718, 7, 7, 0, 1 },
  1889				.idp_src_en	= { 0x0718, 9, 9, 0, 1 },
  1890				.rdm_pdwn_en	= { 0x0718, 10, 10, 0, 1 },
  1891				.vdm_src_en	= { 0x0718, 12, 12, 0, 1 },
  1892				.vdp_src_en	= { 0x0718, 11, 11, 0, 1 },
  1893			},
  1894		},
  1895		{ /* sentinel */ }
  1896	};
  1897	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

