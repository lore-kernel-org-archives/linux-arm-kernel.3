Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00C7D1BDE7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 21:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ugNUhpXR/bASrUNhgTwITqLm9OLQBzEh89uHisljEms=; b=Npigz1/52vl/RE3l78fCxM75IS
	EKkG7W0itH4ICuMZ6SDF6UvS+HLCLWDD8i02zuSS4myGPNs3UC7v0jLURhIbhxcaSPzYyJG3sZnyE
	NCyaBmX7Jg2bKzlfgrw2evECxG5CziCNMFStIQ87TB9sHoSUVZOGFE6kDYpEZmHbFS7esNfm0hdq9
	ApX0WuCVzw8J2LmuYjH7HbjPZ42QSVVNHtkw5dkUVcAdZ4WxyZnegAB/XfOBNbqfukfQfA462xkl8
	sGVTioLlr/mCsxshV1Y2wsRmTtWW4nZx+uhenb4KkWO4941VVK4gBpudA1bL6JFr/+9I/2cTUtwRX
	BF5USnXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQugN-00000007BIW-07m4;
	Wed, 03 Dec 2025 21:46:43 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQugK-00000007BI0-3JUs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 21:46:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764798401; x=1796334401;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rKF7qiTP7ByQAwRp02xxNApztqUA1IF+VqvGoxJ0Z88=;
  b=hXleYnCUxtjlIvwv2iZi+t4cciKyoo8+CPq3wEz1tYZPY0m29/Ulkghx
   tGdhLz71045bTDLKFZL8mvhSkb7J5NmPjghhIhweGEAxdTMwh/RmQkGGY
   twhIzbsNeDX0aj8VLqsgyVhBdXvvtfmcZVYPrOgX08udmW5IJlOSRdhQo
   MmoynzapFkMxX0dhDdKYalefiMq1CTBzuGm4xyaHr03IjRTBP3aCe1xw5
   WshCeasTbTMX0dot85oIwbxBrpqOhaHMKe6gxhMCHK0mn55DsGPTIfYPH
   4ETc1fUgUWxmutW3GjxxLExVHdsTR/NMMgcFoGxqsHbEzUvun5xQDUjGG
   Q==;
X-CSE-ConnectionGUID: 4geN7QpmTs+JBEJeeNXvRw==
X-CSE-MsgGUID: 5jDk8TL/T6GjZry8723zNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="78159432"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="78159432"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 13:46:39 -0800
X-CSE-ConnectionGUID: YJX5cxpaRFGTIdQ9q8I2tA==
X-CSE-MsgGUID: r2+ADqXMQiy4dStaUFcV5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="199928360"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 Dec 2025 13:46:34 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQugC-00000000DBR-0dEO;
	Wed, 03 Dec 2025 21:46:32 +0000
Date: Thu, 4 Dec 2025 05:45:39 +0800
From: kernel test robot <lkp@intel.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <frank.li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH 2/2] media: nxp: Add i.MX9 CSI pixel formatter v4l2 driver
Message-ID: <202512040513.mvgeYlO0-lkp@intel.com>
References: <20251203-csi_formatter-v1-2-eb9e1147b49e@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203-csi_formatter-v1-2-eb9e1147b49e@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_134640_848155_2CEE89F6 
X-CRM114-Status: GOOD (  11.76  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on 1f2353f5a1af995efbf7bea44341aa0d03460b28]

url:    https://github.com/intel-lab-lkp/linux/commits/Guoniu-Zhou/media-dt-bindings-Add-CSI-Pixel-Formatter-DT-bindings/20251203-143208
base:   1f2353f5a1af995efbf7bea44341aa0d03460b28
patch link:    https://lore.kernel.org/r/20251203-csi_formatter-v1-2-eb9e1147b49e%40nxp.com
patch subject: [PATCH 2/2] media: nxp: Add i.MX9 CSI pixel formatter v4l2 driver
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20251204/202512040513.mvgeYlO0-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251204/202512040513.mvgeYlO0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512040513.mvgeYlO0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/nxp/imx9-csi-formatter.c:786:12: warning: 'csi_formatter_runtime_resume' defined but not used [-Wunused-function]
     786 | static int csi_formatter_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/nxp/imx9-csi-formatter.c:776:12: warning: 'csi_formatter_runtime_suspend' defined but not used [-Wunused-function]
     776 | static int csi_formatter_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx9-csi-formatter.c:763:12: warning: 'csi_formatter_system_resume' defined but not used [-Wunused-function]
     763 | static int csi_formatter_system_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx9-csi-formatter.c:758:12: warning: 'csi_formatter_system_suspend' defined but not used [-Wunused-function]
     758 | static int csi_formatter_system_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/csi_formatter_runtime_resume +786 drivers/media/platform/nxp/imx9-csi-formatter.c

   775	
 > 776	static int csi_formatter_runtime_suspend(struct device *dev)
   777	{
   778		struct v4l2_subdev *sd = dev_get_drvdata(dev);
   779		struct csi_formatter *formatter = sd_to_formatter(sd);
   780	
   781		clk_disable_unprepare(formatter->clk);
   782	
   783		return 0;
   784	}
   785	
 > 786	static int csi_formatter_runtime_resume(struct device *dev)
   787	{
   788		struct v4l2_subdev *sd = dev_get_drvdata(dev);
   789		struct csi_formatter *formatter = sd_to_formatter(sd);
   790	
   791		return clk_prepare_enable(formatter->clk);
   792	}
   793	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

