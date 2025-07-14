Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899EBC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 00:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a3Q18K875un5VZmNY7VaRmfjjZyWz8evUK9QSEdILwk=; b=1ufrvhf30cFOtQd8J2IT00JPdR
	/FXgpmk8L69dBEbpo7Xxqw788nNqKwGKq1VWSCE/rxIat0yqDVNxcH+3mJ6uChP15mInU9xWC97pJ
	RuXSsEtWLZ57rSL+Ka2Gy/WPVfuQPsQ6gajThRPB42IJQ//DI04vubYEk7qYSxlGL/2koZmdnJDBQ
	4Xqy4dRKZa0aJJV9tqLFWNH/VYw4bWcHRbA6TSMXP9nqq8DehQlBGSd2oCVcM/9WgVZpDcdBiknWl
	CMCiJzBWT+30pv2XDlxOyyUCP3oI65VZeS6871Sz7uwqUoHR2o3UbGiz06GsKsdfoy8Mlg6dGExId
	/b2fb9Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub7SS-00000000rff-2TBG;
	Mon, 14 Jul 2025 00:54:16 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub7Q0-00000000rFc-1ghL;
	Mon, 14 Jul 2025 00:51:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752454304; x=1783990304;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1+sguk31ZPM7mDIsRtSsK9FeFCvoq25OnpwLLIVybKQ=;
  b=FbwcSwyVT1n8xUjSXiF2Q8Ylhug5aIPo+qVqwDcXk4ZsP/frjugQYSsW
   bjOvkEEIcasw6FAe0Ie09eU+GuzRtDtD/uPO8t1e9QLO3fXAniBdenULp
   LmpbJ8PAyJbIVC/7ht3SViRD5fVDza4+RGUIGSKqjzsFaSFXuMElE0cGx
   nMAOhqMvDykZ1VLP5bGK+/XoAc98hq7nQ/1I4pSr5EViXjv64jQ+aMIzA
   XXEIEhHtZjhwYzQbrRSS8ojcPYpYbdgbeJZm78UNLxLW4KCfVYXmcnjj0
   xd2i7AEkQ7AlGAWImJ/eXpRtMgJXMREOyZ8fU2h9OTI49b4k0jvM/WtYF
   Q==;
X-CSE-ConnectionGUID: wugVTz5eQAutMw1JABXYjg==
X-CSE-MsgGUID: yA3ul0kFTheebKri/NugPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54613459"
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; 
   d="scan'208";a="54613459"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 17:51:43 -0700
X-CSE-ConnectionGUID: kHd5RuKCQqqr/yZIGSbVwQ==
X-CSE-MsgGUID: /QOqQbl1RUGtNzq4G0dlNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; 
   d="scan'208";a="187802370"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jul 2025 17:51:40 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ub7Pu-0008O7-0p;
	Mon, 14 Jul 2025 00:51:38 +0000
Date: Mon, 14 Jul 2025 08:51:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Keke Li <keke.li@amlogic.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v2 5/8] media: v4l2-common: Introduce v4l2-params.c
Message-ID: <202507140820.LDrwmHML-lkp@intel.com>
References: <20250710-extensible-parameters-validation-v2-5-7ec8918ec443@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710-extensible-parameters-validation-v2-5-7ec8918ec443@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_175144_504570_328950C4 
X-CRM114-Status: GOOD (  12.63  )
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

Hi Jacopo,

kernel test robot noticed the following build errors:

[auto build test ERROR on a8598c7de1bcd94461ca54c972efa9b4ea501fb9]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacopo-Mondi/media-uapi-Introduce-V4L2-extensible-params/20250710-215847
base:   a8598c7de1bcd94461ca54c972efa9b4ea501fb9
patch link:    https://lore.kernel.org/r/20250710-extensible-parameters-validation-v2-5-7ec8918ec443%40ideasonboard.com
patch subject: [PATCH v2 5/8] media: v4l2-common: Introduce v4l2-params.c
config: x86_64-randconfig-008-20250713 (https://download.01.org/0day-ci/archive/20250714/202507140820.LDrwmHML-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250714/202507140820.LDrwmHML-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507140820.LDrwmHML-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/media/v4l2-core/v4l2-params.o: in function `v4l2_params_buffer_validate':
>> drivers/media/v4l2-core/v4l2-params.c:16: undefined reference to `vb2_plane_vaddr'


vim +16 drivers/media/v4l2-core/v4l2-params.c

    10	
    11	int v4l2_params_buffer_validate(struct device *dev, struct vb2_buffer *vb,
    12					size_t max_size,
    13					v4l2_params_validate_buffer buffer_validate)
    14	{
    15		size_t header_size = offsetof(struct v4l2_params_buffer, data);
  > 16		struct v4l2_params_buffer *buffer = vb2_plane_vaddr(vb, 0);
    17		size_t payload_size = vb2_get_plane_payload(vb, 0);
    18		size_t buffer_size;
    19		int ret;
    20	
    21		/* Payload size can't be greater than the destination buffer size */
    22		if (payload_size > max_size) {
    23			dev_dbg(dev, "Payload size is too large: %zu\n", payload_size);
    24			return -EINVAL;
    25		}
    26	
    27		/* Payload size can't be smaller than the header size */
    28		if (payload_size < header_size) {
    29			dev_dbg(dev, "Payload size is too small: %zu\n", payload_size);
    30			return -EINVAL;
    31		}
    32	
    33		/* Validate the size reported in the parameter buffer header */
    34		buffer_size = header_size + buffer->data_size;
    35		if (buffer_size != payload_size) {
    36			dev_dbg(dev, "Data size %zu and payload size %zu are different\n",
    37				buffer_size, payload_size);
    38			return -EINVAL;
    39		}
    40	
    41		/* Driver-specific buffer validation. */
    42		if (buffer_validate) {
    43			ret = buffer_validate(dev, buffer);
    44			if (ret)
    45				return ret;
    46		}
    47	
    48		return 0;
    49	}
    50	EXPORT_SYMBOL_GPL(v4l2_params_buffer_validate);
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

