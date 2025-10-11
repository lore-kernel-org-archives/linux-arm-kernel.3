Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34C1CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 05:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQJv4LXC6HBWWiVXI3OgsUprz40TZVnLxYXWSmgwyY8=; b=Vx95xc03Y+m8NbMWfnhicOXK5+
	S/I8Jt/tSLMmIX+uCRiq534kULVWhISa/ukaVL0mpp5zyn7Ye1j68DLkIps4CAEpd5JqR6X/X+11J
	PLSs1I9Wyfp3jgMR4mXdGPMRdky1rx3l9KZSeZ2UPA5+uYF+L9+oWMEgelv2XzkvzIKcGAa2uo/bs
	LJhFijgDgbFaQStsCl/ZZA9ofsUechWhVVVxux4kfDwXPzb/mW8RgbdTFV6zKBZTIXy5zsGfv6fGm
	6g1QqG+QNbeT5iOBQ7+qMVsJAlS58nR9n4xeNdImY7XLxBRmh872cYxFSVUHStUOxpqvndLiCVa7U
	yiNokTAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7SER-00000009pLw-2Vcl;
	Sat, 11 Oct 2025 05:33:27 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7SEO-00000009pL5-23vG;
	Sat, 11 Oct 2025 05:33:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760160804; x=1791696804;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tICeZKtlPTGn6MN+AocuuzSNU12FNBC7lzLtzqfGuwQ=;
  b=TT73WF16fQqlWROEeFiairc8y9kzFwqelWIgF9kqS9ZwUkWQZUrc2L41
   b6POVeXg4Gkkue2PZ9esRFvrv1DcL/WjQTri/VSqxt8hbsrta1edhRufv
   NpAvabHXe/tahwZshdKCNWJhXas4IOBOYdeLPhFRdh8sb+TxfRfxNkNSb
   SeqRrsi2JD45OWxR5Fq2Nz2SbY3rgBfiYsnqrvMNrMTprt+KvCOq8FzWL
   TpUqWDbXtll75sHymeX+HIt3kIZbsq6GD1g2EO/rHeTa0ErsvR9yt20le
   qUzxXCIt+wGP65OO4Iiuy5rrYuZnMP2RyqxrLHCTpph8IT98tf4gOZdWL
   A==;
X-CSE-ConnectionGUID: J/DErsATTTSIspSnju4TKw==
X-CSE-MsgGUID: a8gGCFbNTUe5pyQJuYnLYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="62416211"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="62416211"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 22:33:20 -0700
X-CSE-ConnectionGUID: IPZXp56TS/iOLDMQYGX7lQ==
X-CSE-MsgGUID: C0av3SMDRfSz2cMTpx53hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="212094623"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Oct 2025 22:33:16 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7SEE-0003Xj-04;
	Sat, 11 Oct 2025 05:33:14 +0000
Date: Sat, 11 Oct 2025 13:32:51 +0800
From: kernel test robot <lkp@intel.com>
To: Sven =?iso-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>,
	Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kernel@pengutronix.de,
	Sven =?iso-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>
Subject: Re: [PATCH 16/16] media: rockchip: rga: add rga3 support
Message-ID: <202510111354.QeqIltfU-lkp@intel.com>
References: <20251007-spu-rga3-v1-16-36ad85570402@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251007-spu-rga3-v1-16-36ad85570402@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_223324_599295_5CF3133F 
X-CRM114-Status: GOOD (  10.60  )
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

Hi Sven,

kernel test robot noticed the following build warnings:

[auto build test WARNING on afb100a5ea7a13d7e6937dcd3b36b19dc6cc9328]

url:    https://github.com/intel-lab-lkp/linux/commits/Sven-P-schel/media-rockchip-rga-use-clk_bulk-api/20251010-104411
base:   afb100a5ea7a13d7e6937dcd3b36b19dc6cc9328
patch link:    https://lore.kernel.org/r/20251007-spu-rga3-v1-16-36ad85570402%40pengutronix.de
patch subject: [PATCH 16/16] media: rockchip: rga: add rga3 support
config: riscv-randconfig-002-20251011 (https://download.01.org/0day-ci/archive/20251011/202510111354.QeqIltfU-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510111354.QeqIltfU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510111354.QeqIltfU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/rockchip/rga/rga3-hw.c:144:15: warning: variable 'src_h' set but not used [-Wunused-but-set-variable]
     144 |         unsigned int src_h, src_w, dst_h, dst_w;
         |                      ^
>> drivers/media/platform/rockchip/rga/rga3-hw.c:144:22: warning: variable 'src_w' set but not used [-Wunused-but-set-variable]
     144 |         unsigned int src_h, src_w, dst_h, dst_w;
         |                             ^
>> drivers/media/platform/rockchip/rga/rga3-hw.c:144:29: warning: variable 'dst_h' set but not used [-Wunused-but-set-variable]
     144 |         unsigned int src_h, src_w, dst_h, dst_w;
         |                                    ^
>> drivers/media/platform/rockchip/rga/rga3-hw.c:144:36: warning: variable 'dst_w' set but not used [-Wunused-but-set-variable]
     144 |         unsigned int src_h, src_w, dst_h, dst_w;
         |                                           ^
   4 warnings generated.


vim +/src_h +144 drivers/media/platform/rockchip/rga/rga3-hw.c

   137	
   138	static void rga3_cmd_set_win0_format(struct rga_ctx *ctx)
   139	{
   140		u32 *cmd = ctx->rga->cmdbuf_virt;
   141		const struct rga3_fmt *in = ctx->in.fmt;
   142		const struct rga3_fmt *out = ctx->out.fmt;
   143		const struct v4l2_format_info *in_fmt, *out_fmt;
 > 144		unsigned int src_h, src_w, dst_h, dst_w;
   145		bool r2y, y2r;
   146		u8 rd_format;
   147		unsigned int reg;
   148	
   149		src_h = ctx->in.crop.height;
   150		src_w = ctx->in.crop.width;
   151		dst_h = ctx->out.crop.height;
   152		dst_w = ctx->out.crop.width;
   153	
   154		in_fmt = v4l2_format_info(in->fourcc);
   155		out_fmt = v4l2_format_info(out->fourcc);
   156		r2y = v4l2_is_format_rgb(in_fmt) && v4l2_is_format_yuv(out_fmt);
   157		y2r = v4l2_is_format_yuv(in_fmt) && v4l2_is_format_rgb(out_fmt);
   158	
   159		if (in->semi_planar)
   160			rd_format = RGA3_RDWR_FORMAT_SEMI_PLANAR;
   161		else
   162			rd_format = RGA3_RDWR_FORMAT_INTERLEAVED;
   163	
   164		reg = RGA3_WIN0_RD_CTRL - RGA3_FIRST_CMD_REG;
   165		cmd[reg >> 2] |= FIELD_PREP(RGA3_WIN_PIC_FORMAT, in->hw_format)
   166			      |  FIELD_PREP(RGA3_WIN_YC_SWAP, in->yc_swap)
   167			      |  FIELD_PREP(RGA3_WIN_RBUV_SWAP, in->rbuv_swap)
   168			      |  FIELD_PREP(RGA3_WIN_RD_FORMAT, rd_format)
   169			      |  FIELD_PREP(RGA3_WIN_R2Y, r2y)
   170			      |  FIELD_PREP(RGA3_WIN_Y2R, y2r)
   171			      |  FIELD_PREP(RGA3_WIN_CSC_MODE, RGA3_WIN_CSC_MODE_BT601_F);
   172	}
   173	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

