Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F82FD9E12
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 21:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=evoulquWEv6hlJEoBoysjj0vlRqs9YFBr1x0BCbaXAI=; b=IcoXr2rpsEOKdiU3liHTqiW+4A
	S9Q+QhqsAJYCdrWCrSJgwcpY325KMR1WTaQZvLAEJ9ENPydAAFvb8txohLCRSvyV0Zsr74N0/R55W
	t1T4T6+CdvxrWZWyvDSlMx/hHOcL4G+b3OgeKFr8+ugwCA3cGHLZCdJs/GRW91GUHsmf4BycSdPx4
	qsrm8EIxtjPXjrqzqA70UUqmotnKh4vxv5pdvg5UhIw2OXBzFDf+lumWl9M8axnrSPSarNxlnYsw3
	zSU6pYNZQlelWCjU2uiugG/ulHw6c838PKrnU1uub6BcpPGgVwxKs1J3Q5hdvz/9cyQU4GEu7FqYR
	wSt03v6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vviiP-00000007DGr-2WqG;
	Thu, 26 Feb 2026 21:16:09 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vviiK-00000007DGP-0CVM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 21:16:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772140564; x=1803676564;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YwPQeyGBzJcABYucg90H9LmrLb/nelrgO9edJ4pmwS0=;
  b=hThFmu2z5OaLQgZQS8qf1Ie31lW0RE4Q3RH74FAB804r7BO1XdbG651r
   DQrwmbUu9KsqjoOVf3G+HG6Yhdt0KEwoaC/4Df5VweEKfhy05M2Kelldh
   VYUyL5LeCkSNi9/bKTH31vu72pmsT9Pf8EEWqMAImofUltAfQNlPqJgHI
   K2i/d0bHzzin9GdhicOt88YuxR+oorrEYFaSlSuFlaoQeaK2eBU8WLM1E
   P+cIfnu2GDJnyu1Xz/D+u//s8N2xdDpk2dJ84JBNbEtKhk+GZX+NVn314
   XJE3+GJYo8upfclhss/ANGouy5w0n1z/jOXliLVD3d1JQmWM6nVWFsDQ5
   w==;
X-CSE-ConnectionGUID: Nz1Xgs/hSWKqwvte8cfqQQ==
X-CSE-MsgGUID: T37GK8iETm2VkwSCme0DHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="72422790"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="72422790"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 13:16:02 -0800
X-CSE-ConnectionGUID: KF8q2MCfQ7KO5yyM2PuPtA==
X-CSE-MsgGUID: booS3pxyQp61NWJ++rs5Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="216816235"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 26 Feb 2026 13:15:57 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vviiA-000000009sp-1VpU;
	Thu, 26 Feb 2026 21:15:54 +0000
Date: Fri, 27 Feb 2026 05:15:49 +0800
From: kernel test robot <lkp@intel.com>
To: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	Jiwei Fu <jiwei.fu@nxp.com>, Forrest Shi <xuelin.shi@nxp.com>,
	Alexandru Taran <alexandru.taran@nxp.com>,
	Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
Subject: Re: [PATCH 5/9] accel/neutron: Add GEM buffer object support
Message-ID: <202602270531.MP8x6wo3-lkp@intel.com>
References: <20260226-neutron-v1-5-46eccb3bb50a@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226-neutron-v1-5-46eccb3bb50a@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_131604_102832_7FE4ACA5 
X-CRM114-Status: GOOD (  13.35  )
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

Hi Ioana,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f]

url:    https://github.com/intel-lab-lkp/linux/commits/Ioana-Ciocoi-Radulescu/drm-gem-dma-Add-flag-for-bidirectional-mapping-of-non-coherent-GEM-DMA-buffers/20260226-221222
base:   6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
patch link:    https://lore.kernel.org/r/20260226-neutron-v1-5-46eccb3bb50a%40nxp.com
patch subject: [PATCH 5/9] accel/neutron: Add GEM buffer object support
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260227/202602270531.MP8x6wo3-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602270531.MP8x6wo3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602270531.MP8x6wo3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/accel/neutron/neutron_gem.c:52:6: warning: variable 'gem_obj' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
      52 |         if (drm_WARN_ON(drm, !IS_ALIGNED(dma_obj->dma_addr, NEUTRON_BO_ALIGN))) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:789:2: note: expanded from macro 'drm_WARN_ON'
     789 |         drm_WARN((drm), (x), "%s",                                      \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     790 |                  "drm_WARN_ON(" __stringify(x) ")")
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:779:2: note: expanded from macro 'drm_WARN'
     779 |         WARN(condition, "%s %s: [drm] " format,                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     780 |                         dev_driver_string(__drm_to_dev(drm)),           \
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     781 |                         dev_name(__drm_to_dev(drm)), ## arg)
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:163:36: note: expanded from macro 'WARN'
     163 | #define WARN(condition, format...) ({                                   \
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     164 |         int __ret_warn_on = !!(condition);                              \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     165 |         if (unlikely(__ret_warn_on))                                    \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     166 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     167 |         unlikely(__ret_warn_on);                                        \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     168 | })
         | ~~
   drivers/accel/neutron/neutron_gem.c:67:21: note: uninitialized use occurs here
      67 |         drm_gem_object_put(gem_obj);
         |                            ^~~~~~~
   drivers/accel/neutron/neutron_gem.c:52:2: note: remove the 'if' if its condition is always false
      52 |         if (drm_WARN_ON(drm, !IS_ALIGNED(dma_obj->dma_addr, NEUTRON_BO_ALIGN))) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      53 |                 ret = -EFAULT;
         |                 ~~~~~~~~~~~~~~
      54 |                 goto out_put;
         |                 ~~~~~~~~~~~~~
      55 |         }
         |         ~
   drivers/accel/neutron/neutron_gem.c:38:32: note: initialize the variable 'gem_obj' to silence this warning
      38 |         struct drm_gem_object *gem_obj;
         |                                       ^
         |                                        = NULL
   1 warning generated.


vim +52 drivers/accel/neutron/neutron_gem.c

    33	
    34	int neutron_ioctl_create_bo(struct drm_device *drm, void *data, struct drm_file *filp)
    35	{
    36		struct drm_neutron_create_bo *args = data;
    37		struct drm_gem_dma_object *dma_obj;
    38		struct drm_gem_object *gem_obj;
    39		size_t size;
    40		int ret;
    41	
    42		if (!args->size || args->pad)
    43			return -EINVAL;
    44	
    45		size = ALIGN(args->size, NEUTRON_BO_ALIGN);
    46	
    47		dma_obj = drm_gem_dma_create(drm, size);
    48		if (IS_ERR(dma_obj))
    49			return PTR_ERR(dma_obj);
    50	
    51		/* We expect correctly aligned buffers, but double-check */
  > 52		if (drm_WARN_ON(drm, !IS_ALIGNED(dma_obj->dma_addr, NEUTRON_BO_ALIGN))) {
    53			ret = -EFAULT;
    54			goto out_put;
    55		}
    56	
    57		gem_obj = &dma_obj->base;
    58		ret = drm_gem_handle_create(filp, gem_obj, &args->handle);
    59		if (ret)
    60			goto out_put;
    61	
    62		args->map_offset = drm_vma_node_offset_addr(&gem_obj->vma_node);
    63		args->size = gem_obj->size;
    64	
    65	out_put:
    66		/* No need to keep a reference of the GEM object. Freeing is handled by user */
    67		drm_gem_object_put(gem_obj);
    68	
    69		return ret;
    70	}
    71	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

