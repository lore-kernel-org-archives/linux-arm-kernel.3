Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C92B7D34088
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 15:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ozYJGIsbDHDqzuv5LUTky9lnsUA5jSKZrHj+JWfGB8o=; b=BkAjO2cjCLdOWAB3fILbit405W
	dYLd0yb46kf0xpS/xDzXbyxJLG2lFh0eWlcnZVd8YUkP8FsxbFq8p1wE/PHRRufBoy4heigt83s+r
	bjcezSqwUlktY6Pf4OwbeM+9iw2y3rIutqGZUNptdhm4NDy7iBwqRgsSvdBvoTBkTV7rjhy2whJfs
	lNaqPbKKfY40P53+c44XJwm+GBOse2nDc2tBIcJC+3bnjaAmoLHY+OLdtUkhBIeTg5CTsmUE0sIY9
	yfP5VDrSqtElbLgQ0A/has2M/29yiersndUa3IPQq+zY6xWzFeqjneBYT/Tgd2R8gFUk5EHtlpcWa
	3jOITLOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklBL-0000000EZ9d-1vGO;
	Tue, 27 Jan 2026 15:40:43 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklBI-0000000EZ8r-0Ter
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 15:40:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769528440; x=1801064440;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XhBC5KV+PtVVZ/Z9sK8gsPhmkVrcEIqlnIPPBjBhYdM=;
  b=Y7YPzRTApFepT3xt9yjjHUWv/KgZtbneSfzC5Ayba9TrLH7B/lz0CyLo
   fhrmgKmXrLByI9Y6wnsraSmtjrKNfGrJofKBT+c5dKjZ77V9ta49KcjEJ
   6JK3MPTRY8x8DjifD2ei8v3PIqLh8A4gOPdLt6+S5uu0rG1md5zErDG9X
   mUc5nwe4wPAyIt7n394B+1q0zLb13mU0/g5Bz8I7nEvDbui/wxXqEMkXN
   /1khU51AOsnthcqwLcweNDk3lzL7lett3r7fRO5kDchjGvEY5Bi/Rabvk
   5ixB+UwuO6C30K8OivSkUoS1rE86/wHncfxI7K2UJZC1aTGwK/g87TCSd
   Q==;
X-CSE-ConnectionGUID: EWFbPO+4REqPwHeySQBT/g==
X-CSE-MsgGUID: YVPo4lbeSe6vzWcjP5cbrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70816144"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="70816144"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 07:40:39 -0800
X-CSE-ConnectionGUID: YkjinVAERv2ujCwRoSLWag==
X-CSE-MsgGUID: XSHPA9EtQ96q7JmKxOnzAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="208058802"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Jan 2026 07:40:35 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vklB9-00000000YcG-3qcQ;
	Tue, 27 Jan 2026 15:40:31 +0000
Date: Tue, 27 Jan 2026 23:39:34 +0800
From: kernel test robot <lkp@intel.com>
To: Joey Lu <a0987203069@gmail.com>, airlied@gmail.com, simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
	a0987203069@gmail.com, linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/nuvoton: add MA35D1 display controller driver
Message-ID: <202601272315.09SFioVt-lkp@intel.com>
References: <20260126085727.2568958-4-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126085727.2568958-4-a0987203069@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_074041_060027_3A93EF23 
X-CRM114-Status: GOOD (  14.42  )
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

Hi Joey,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next]
[cannot apply to robh/for-next linus/master v6.19-rc7 next-20260126]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joey-Lu/dt-bindings-display-nuvoton-add-MA35D1-DCU-binding/20260126-170258
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260126085727.2568958-4-a0987203069%40gmail.com
patch subject: [PATCH 3/3] drm/nuvoton: add MA35D1 display controller driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260127/202601272315.09SFioVt-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601272315.09SFioVt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601272315.09SFioVt-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/gpu/drm/nuvoton/ma35_plane.c:177:10: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     177 |                 *reg = MA35_BLEND_MODE_SRC;
         |                        ^
   drivers/gpu/drm/nuvoton/ma35_plane.h:141:2: note: expanded from macro 'MA35_BLEND_MODE_SRC'
     141 |         FIELD_PREP(MA35_SRC_BLENDING_MODE, MA35_ALPHA_BLEND_ONE)
         |         ^
   drivers/gpu/drm/nuvoton/ma35_plane.c:337:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     337 |         reg = FIELD_PREP(MA35_OVERLAY_POSITION_X_MASK, x) |
         |               ^
   drivers/gpu/drm/nuvoton/ma35_plane.c:360:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     360 |                 reg = FIELD_PREP(MA35_PRIMARY_FORMAT_MASK, format) |
         |                       ^
   drivers/gpu/drm/nuvoton/ma35_plane.c:384:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     384 |                 reg = FIELD_PREP(MA35_OVERLAY_FORMAT_MASK, format) |
         |                       ^
   drivers/gpu/drm/nuvoton/ma35_plane.c:441:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     441 |         reg = FIELD_PREP(MA35_CURSOR_X_MASK, x) |
         |               ^
   drivers/gpu/drm/nuvoton/ma35_plane.c:483:4: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     483 |                         FIELD_PREP(MA35_CURSOR_HOTSPOT_X_MASK, new_state->hotspot_x) |
         |                         ^
   drivers/gpu/drm/nuvoton/ma35_plane.c:537:4: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     537 |                         FIELD_PREP(MA35_CURSOR_HOTSPOT_X_MASK, new_state->hotspot_x) |
         |                         ^
   7 errors generated.
--
>> drivers/gpu/drm/nuvoton/ma35_crtc.c:97:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      97 |         reg = FIELD_PREP(MA35_DISPLAY_TOTAL_MASK, mode->htotal) |
         |               ^
>> drivers/gpu/drm/nuvoton/ma35_crtc.c:228:10: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     228 |         *hpos = FIELD_GET(MA35_DISPLAY_CURRENT_X, reg);
         |                 ^
   drivers/gpu/drm/nuvoton/ma35_crtc.c:284:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     284 |                 reg = FIELD_PREP(MA35_GAMMA_RED_MASK, r[i]) |
         |                       ^
   3 errors generated.
--
>> drivers/gpu/drm/nuvoton/ma35_interface.c:150:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     150 |         if (!interface) {
         |             ^~~~~~~~~~
   drivers/gpu/drm/nuvoton/ma35_interface.c:191:9: note: uninitialized use occurs here
     191 |         return ret;
         |                ^~~
   drivers/gpu/drm/nuvoton/ma35_interface.c:150:2: note: remove the 'if' if its condition is always false
     150 |         if (!interface) {
         |         ^~~~~~~~~~~~~~~~~
     151 |                 drm_err(drm_dev, "Failed to initialize encoder\n");
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     152 |                 goto error_early;
         |                 ~~~~~~~~~~~~~~~~~
     153 |         }
         |         ~
   drivers/gpu/drm/nuvoton/ma35_interface.c:145:9: note: initialize the variable 'ret' to silence this warning
     145 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +/FIELD_PREP +177 drivers/gpu/drm/nuvoton/ma35_plane.c

   167	
   168	static int ma35_layer_blend_mode_select(u32 mode, u32 *reg)
   169	{
   170		u32 ret = 0;
   171	
   172		switch (mode) {
   173		case MA35_ALPHA_CLEAR:
   174			*reg = MA35_BLEND_MODE_CLEAR;
   175			break;
   176		case MA35_ALPHA_SRC:
 > 177			*reg = MA35_BLEND_MODE_SRC;
   178			break;
   179		case MA35_ALPHA_DST:
   180			*reg = MA35_BLEND_MODE_DST;
   181			break;
   182		case MA35_ALPHA_SRC_OVER:
   183			*reg = MA35_BLEND_MODE_SRC_OVER;
   184			break;
   185		case MA35_ALPHA_DST_OVER:
   186			*reg = MA35_BLEND_MODE_DST_OVER;
   187			break;
   188		case MA35_ALPHA_SRC_IN:
   189			*reg = MA35_BLEND_MODE_SRC_IN;
   190			break;
   191		case MA35_ALPHA_DST_IN:
   192			*reg = MA35_BLEND_MODE_DST_IN;
   193			break;
   194		case MA35_ALPHA_SRC_OUT:
   195			*reg = MA35_BLEND_MODE_SRC_OUT;
   196			break;
   197		case MA35_ALPHA_DST_OUT:
   198			*reg = MA35_BLEND_MODE_DST_OUT;
   199			break;
   200		case MA35_ALPHA_SRC_ATOP:
   201			*reg = MA35_BLEND_MODE_SRC_ATOP;
   202			break;
   203		case MA35_ALPHA_DST_ATOP:
   204			*reg = MA35_BLEND_MODE_DST_ATOP;
   205			break;
   206		case MA35_ALPHA_XOR:
   207			*reg = MA35_BLEND_MODE_XOR;
   208			break;
   209		default:
   210			ret = -EINVAL;
   211		}
   212	
   213		return ret;
   214	}
   215	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

