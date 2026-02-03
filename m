Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73266E8B377
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 22:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w/NeTfWxrtJHPNNaMMCZ032N2P2OX2QhjqvdNaOned4=; b=oqCGJDxJa7b9i38aqcdlDNGZOe
	h5RJAxRltPGtqi/FXuNUrLy2znJH1AUEuJspJeOgdiK48McmSsJiaVkHhcEwpz04kmIIafBnwl0OP
	oTQyG+gcJz6SSibq/rCb4LxHQOPaz41O2EuWxX5YV2mRMcvY1DuDj4PxcMVGJw+fcQxZB0+DPT8sd
	O7goH//y2VSd1ZRu/s2LsEwWH/IMgIaop41VonKB0+NKyxUn5pYPL4nWumJnqeOAmX4wJxJs1jAG9
	AMjLaty8nK4Z3SWjasYuO/+wk9JcR3AVPTgGgP9XqeDxllq4SDE5sIccnzQBaV3e30QV2OWd/KDBY
	rG0zn7Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnPJX-00000007WEo-3SKY;
	Tue, 03 Feb 2026 22:56:07 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnPJS-00000007WEB-2xdN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 22:56:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770159363; x=1801695363;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EpGvoxDrKuv7hIK1fCK6uHMFVNI2vX0KggMpEgCxAwY=;
  b=AfNPAkVraBvXBon+0PhhfUEf2hVi1bgR59mgSpSvKTm7Zrb2RsXF4Xgn
   wsPRqQIBYyX8N4Vpkty2LXw2vc5L5hjvyLVyDDHPP5ywgUWvOYjAr3XwJ
   iZa6a2KxMTsq2mb2VoAMqXQv1NeaHvALGyRmaq3Av0kIDRSICQqM5NN1k
   l74KaXPXtMwjBaay45vOoTQjze9kZW3WCLf/QVKBiyEAXbtcn//kxMv9e
   Wm2c+06bvU39ZJN4jjVv5T/7RW+jmVGNXzHKGB+uup/ty0GK2XMTgEpxh
   9RflBx7rHCxahEQSL446uld+5H3EMiJlXTxO6vg0mgLOXw1hytnvgD+eA
   g==;
X-CSE-ConnectionGUID: TDvqvbiXTV+O6WSaoonVgA==
X-CSE-MsgGUID: nzwMviZ7TmGKk5A0voaf6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71402297"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="71402297"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 14:55:59 -0800
X-CSE-ConnectionGUID: GQiDoYA+Qam4UgwOSktzIQ==
X-CSE-MsgGUID: C6nqfGIRQr21qCll8mjDRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="214138905"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 03 Feb 2026 14:55:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnPJJ-00000000hFi-1tvB;
	Tue, 03 Feb 2026 22:55:53 +0000
Date: Wed, 4 Feb 2026 06:55:46 +0800
From: kernel test robot <lkp@intel.com>
To: Alain Volmat <alain.volmat@foss.st.com>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH 08/13] media: stm32: dcmipp: add pixel pipes helper
 functions
Message-ID: <202602040608.vLI553iq-lkp@intel.com>
References: <20260202-stm32-dcmipp-pixel-pipes-support-v1-8-8d8d51f5e014@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202-stm32-dcmipp-pixel-pipes-support-v1-8-8d8d51f5e014@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_145605_701990_D992C5D6 
X-CRM114-Status: GOOD (  10.12  )
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

Hi Alain,

kernel test robot noticed the following build warnings:

[auto build test WARNING on eb4ee870747c3a77a9c3c84d84efb64bd481013a]

url:    https://github.com/intel-lab-lkp/linux/commits/Alain-Volmat/media-stm32-dcmipp-share-struct-dcmipp_device-among-subdevs/20260202-220852
base:   eb4ee870747c3a77a9c3c84d84efb64bd481013a
patch link:    https://lore.kernel.org/r/20260202-stm32-dcmipp-pixel-pipes-support-v1-8-8d8d51f5e014%40foss.st.com
patch subject: [PATCH 08/13] media: stm32: dcmipp: add pixel pipes helper functions
config: riscv-randconfig-r122-20260204 (https://download.01.org/0day-ci/archive/20260204/202602040608.vLI553iq-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602040608.vLI553iq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602040608.vLI553iq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelcommon.c:41:1: sparse: sparse: symbol 'dcmipp_pixel_formats_list' was not declared. Should it be static?

vim +/dcmipp_pixel_formats_list +41 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelcommon.c

    17	
    18	#define DCMIPP_ENT(id, pad) (1 << (2 * (id) + (pad)))
    19	#define DCMIPP_ISP_SINK			(DCMIPP_ENT(DCMIPP_ISP, 0))
    20	#define DCMIPP_ISP_SRC			(DCMIPP_ENT(DCMIPP_ISP, 1))
    21	#define DCMIPP_ISP_INOUT		(DCMIPP_ISP_SINK | DCMIPP_ISP_SRC)
    22	#define DCMIPP_MAIN_POSTPROC_SINK	(DCMIPP_ENT(DCMIPP_MAIN, 0))
    23	#define DCMIPP_MAIN_POSTPROC_SRC	(DCMIPP_ENT(DCMIPP_MAIN, 1))
    24	#define DCMIPP_MAIN_POSTPROC_INOUT					\
    25		(DCMIPP_MAIN_POSTPROC_SINK | DCMIPP_MAIN_POSTPROC_SRC)
    26	#define DCMIPP_AUX_POSTPROC_SINK	(DCMIPP_ENT(DCMIPP_AUX, 0))
    27	#define DCMIPP_AUX_POSTPROC_SRC	(DCMIPP_ENT(DCMIPP_AUX, 1))
    28	#define DCMIPP_AUX_POSTPROC_INOUT					\
    29		(DCMIPP_AUX_POSTPROC_SINK | DCMIPP_AUX_POSTPROC_SRC)
    30	#define DCMIPP_ALL_POSTPROC_SINK					\
    31		(DCMIPP_MAIN_POSTPROC_SINK | DCMIPP_AUX_POSTPROC_SINK)
    32	#define DCMIPP_ALL_POSTPROC_INOUT					\
    33		(DCMIPP_MAIN_POSTPROC_INOUT | DCMIPP_AUX_POSTPROC_INOUT)
    34	
    35	#define PIXMAP_MBUS(mbus, applicable_pipes)		\
    36		{						\
    37			.code = MEDIA_BUS_FMT_##mbus,		\
    38			.pipes = applicable_pipes,		\
    39		}
    40	const struct dcmipp_pixelpipe_pix_map
  > 41	dcmipp_pixel_formats_list[] = {
    42		/* RGB formats */
    43		/* RGB565 / RGB888 */
    44		PIXMAP_MBUS(RGB565_2X8_LE, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
    45		PIXMAP_MBUS(RGB565_1X16, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
    46		PIXMAP_MBUS(RGB888_3X8, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
    47		PIXMAP_MBUS(RGB888_1X24, DCMIPP_ALL_POSTPROC_INOUT | DCMIPP_ISP_INOUT),
    48		/* YUV formats */
    49		PIXMAP_MBUS(YUYV8_2X8, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
    50		PIXMAP_MBUS(UYVY8_1X16, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
    51		PIXMAP_MBUS(YUV8_1X24, DCMIPP_ALL_POSTPROC_INOUT | DCMIPP_ISP_SRC),
    52		/* GREY */
    53		PIXMAP_MBUS(Y8_1X8, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
    54		PIXMAP_MBUS(Y10_1X10, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
    55		PIXMAP_MBUS(Y12_1X12, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
    56		PIXMAP_MBUS(Y14_1X14, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
    57		/* Raw Bayer */
    58		/* Raw 8 */
    59		PIXMAP_MBUS(SBGGR8_1X8, DCMIPP_ISP_SINK),
    60		PIXMAP_MBUS(SGBRG8_1X8, DCMIPP_ISP_SINK),
    61		PIXMAP_MBUS(SGRBG8_1X8, DCMIPP_ISP_SINK),
    62		PIXMAP_MBUS(SRGGB8_1X8, DCMIPP_ISP_SINK),
    63		/* Raw 10 */
    64		PIXMAP_MBUS(SBGGR10_1X10, DCMIPP_ISP_SINK),
    65		PIXMAP_MBUS(SGBRG10_1X10, DCMIPP_ISP_SINK),
    66		PIXMAP_MBUS(SGRBG10_1X10, DCMIPP_ISP_SINK),
    67		PIXMAP_MBUS(SRGGB10_1X10, DCMIPP_ISP_SINK),
    68		/* Raw 12 */
    69		PIXMAP_MBUS(SBGGR12_1X12, DCMIPP_ISP_SINK),
    70		PIXMAP_MBUS(SGBRG12_1X12, DCMIPP_ISP_SINK),
    71		PIXMAP_MBUS(SGRBG12_1X12, DCMIPP_ISP_SINK),
    72		PIXMAP_MBUS(SRGGB12_1X12, DCMIPP_ISP_SINK),
    73		/* Raw 14 */
    74		PIXMAP_MBUS(SBGGR14_1X14, DCMIPP_ISP_SINK),
    75		PIXMAP_MBUS(SGBRG14_1X14, DCMIPP_ISP_SINK),
    76		PIXMAP_MBUS(SGRBG14_1X14, DCMIPP_ISP_SINK),
    77		PIXMAP_MBUS(SRGGB14_1X14, DCMIPP_ISP_SINK),
    78	};
    79	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

