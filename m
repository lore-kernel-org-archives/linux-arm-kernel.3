Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3446CCA0FF6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 19:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7CClwCv0zfIyfXt+CnyLrMXFDS8Rdm/1O46USkOffuA=; b=dRnL9YBdUN8C+IaaGkd+75Ur5B
	DoW6s5Z7mRuitKDWMiR8cGanVsUeQkDqiMSjOsN9XIN0JfN1VxCFEyyhKryR6Z4hY1PyZQmQbP9lX
	62VqI8nNzkHTz2yVQWFG76r6LQL/dTOJzWxwBuWlks1H4Tl39UfX8un83EbSqI/ZM40V/KeTKvPZO
	tICfY4Ns/UUbakJC3wWgWNA1tIIIaQW0c/vCWodUlizqzTEF8x2LOwd6SHAUOi1LJtKRqDsCHbVJs
	RtOvSYd373iFchs5vi9Vby1dmcCbgJYSCdBqEiSWEaPFvcBvnHPRw4cR5xQAfG5mvGSHx/UL4HFnm
	ZVCG0XzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urLc3-0000000GZRR-1RA4;
	Wed, 27 Aug 2025 19:15:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urJ5D-0000000GBrM-0hri
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 27 Aug 2025 16:33:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7CClwCv0zfIyfXt+CnyLrMXFDS8Rdm/1O46USkOffuA=; b=Y0AqCVJM6ircUHnaw3tf7hNXHC
	IdupBlfEmFD/IJB6lA2yrL7gAB2Zn4WI9xpEZn4rs2iq9nyupA9JsGsGnLaQw0CByPEEjdPQot7Rg
	jrOpSMQJeADoEEne+ZNFrUxzTcdlA/btxJunadhpt6cYNlEmLvqanisSs59CNaw/v/rqwAQTZJVFZ
	5CYsa6+RadfHMfFnUtINI7kN4OLGjWsgUy1wmnUkJ4o3OU7249J76QtADdNrd4x1Ekc+SL7rK6xPi
	t4RHwvppNx37v4mF+SPSwUrK7Yswp4DnNyhG+/UcBGDyuf6ifbrKOmcAAcM0WQ1MbAvA4Zby0aRT3
	htFlevGA==;
Received: from mgamail.intel.com ([192.198.163.10])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urJ59-00000002TM1-1iui
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 16:33:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756312387; x=1787848387;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tnTA/PNxi7uOQgEmoAZ2b1rNPAWX95IlTIWABbktj2E=;
  b=DfucyX8ghgjIL9uamdQEpYiTmBYm774qwx8f1hlNd2KqwqXNCjmV7OXx
   gMTkn860Ys8pDbqLnf3X5pi49wtoMowZlfwBgwzTppuk+LsayyizBy5Gt
   YyPAOy8RO3PWoiG6SR64lT4wtTra08/KgCoU8K5hEaekSEGaJQcE+Er6M
   ZbObDQqKUffhzB5db26LAEcHz3s2lLIGRlcu0F9DgAkffYrMqqIC5QSR4
   agdEq0AWKPwN3zV89RqZlWYHhGqT3x4YFDjiy6ruStaoxizF+6vlKOIeL
   yK8U9Xo1xCWMnFa7/lifWHr5SkJS/2jXupebaoaPFjK064gaCRtQ6qBMk
   w==;
X-CSE-ConnectionGUID: 9OCfD0erT3OfVOPcEWUyPA==
X-CSE-MsgGUID: bFPIGJq+SL+tTCMBdnjoLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="69939972"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="69939972"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 09:33:01 -0700
X-CSE-ConnectionGUID: rsYzn5mVRVy6Xw1pxl621w==
X-CSE-MsgGUID: LXp69DIGTUqK7FFQVmGRRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="170708925"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 27 Aug 2025 09:32:51 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urJ4T-000T4N-1n;
	Wed, 27 Aug 2025 16:32:49 +0000
Date: Thu, 28 Aug 2025 00:29:09 +0800
From: kernel test robot <lkp@intel.com>
To: Guoniu Zhou <guoniu.zhou@nxp.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH 2/5] media: nxp: imx8-isi: Simplify code by using helper
 macro
Message-ID: <202508280040.QKK6nZ3x-lkp@intel.com>
References: <20250827-isi_imx93-v1-2-83e6b4b50c4d@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-isi_imx93-v1-2-83e6b4b50c4d@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_173307_932337_32381B5B 
X-CRM114-Status: GOOD (  10.65  )
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

Hi Guoniu,

kernel test robot noticed the following build errors:

[auto build test ERROR on a75b8d198c55e9eb5feb6f6e155496305caba2dc]

url:    https://github.com/intel-lab-lkp/linux/commits/Guoniu-Zhou/media-dt-bindings-nxp-imx8-isi-Add-i-MX91-ISI-compatible-string/20250827-175809
base:   a75b8d198c55e9eb5feb6f6e155496305caba2dc
patch link:    https://lore.kernel.org/r/20250827-isi_imx93-v1-2-83e6b4b50c4d%40nxp.com
patch subject: [PATCH 2/5] media: nxp: imx8-isi: Simplify code by using helper macro
config: riscv-randconfig-002-20250827 (https://download.01.org/0day-ci/archive/20250828/202508280040.QKK6nZ3x-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250828/202508280040.QKK6nZ3x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508280040.QKK6nZ3x-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c:36:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      36 |         val = GASKET_CTRL_DATA_TYPE(fd->entry[0].bus.csi2.dt);
         |               ^
   drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c:19:36: note: expanded from macro 'GASKET_CTRL_DATA_TYPE'
      19 | #define GASKET_CTRL_DATA_TYPE(dt)               FIELD_PREP(GENMASK(13, 8), (dt))
         |                                                 ^
   drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c:70:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      70 |         val = DISP_MIX_CAMERA_MUX_DATA_TYPE(fd->entry[0].bus.csi2.dt);
         |               ^
   drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c:60:49: note: expanded from macro 'DISP_MIX_CAMERA_MUX_DATA_TYPE'
      60 | #define DISP_MIX_CAMERA_MUX_DATA_TYPE(x)        FIELD_PREP(GENMASK(8, 3), (x))
         |                                                 ^
   2 errors generated.


vim +/FIELD_PREP +36 drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c

f48498ad0a4106e Guoniu.zhou 2023-06-29  25  
f48498ad0a4106e Guoniu.zhou 2023-06-29  26  static void mxc_imx8_gasket_enable(struct mxc_isi_dev *isi,
f48498ad0a4106e Guoniu.zhou 2023-06-29  27  				   const struct v4l2_mbus_frame_desc *fd,
f48498ad0a4106e Guoniu.zhou 2023-06-29  28  				   const struct v4l2_mbus_framefmt *fmt,
f48498ad0a4106e Guoniu.zhou 2023-06-29  29  				   const unsigned int port)
f48498ad0a4106e Guoniu.zhou 2023-06-29  30  {
f48498ad0a4106e Guoniu.zhou 2023-06-29  31  	u32 val;
f48498ad0a4106e Guoniu.zhou 2023-06-29  32  
f48498ad0a4106e Guoniu.zhou 2023-06-29  33  	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_HSIZE, fmt->width);
f48498ad0a4106e Guoniu.zhou 2023-06-29  34  	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_VSIZE, fmt->height);
f48498ad0a4106e Guoniu.zhou 2023-06-29  35  
f48498ad0a4106e Guoniu.zhou 2023-06-29 @36  	val = GASKET_CTRL_DATA_TYPE(fd->entry[0].bus.csi2.dt);
f48498ad0a4106e Guoniu.zhou 2023-06-29  37  	if (fd->entry[0].bus.csi2.dt == MIPI_CSI2_DT_YUV422_8B)
f48498ad0a4106e Guoniu.zhou 2023-06-29  38  		val |= GASKET_CTRL_DUAL_COMP_ENABLE;
f48498ad0a4106e Guoniu.zhou 2023-06-29  39  
f48498ad0a4106e Guoniu.zhou 2023-06-29  40  	val |= GASKET_CTRL_ENABLE;
f48498ad0a4106e Guoniu.zhou 2023-06-29  41  	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_CTRL, val);
f48498ad0a4106e Guoniu.zhou 2023-06-29  42  }
f48498ad0a4106e Guoniu.zhou 2023-06-29  43  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

