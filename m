Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09006D35666
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 02:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BYLo5dPNAy3hTk6Iv3SLrLkvk1w9STY5rT12OSXJS28=; b=3YcEp4i5I7JRq74VIY+Dkd72zh
	XEoAhPfc7iOxZC099g6A1WE9EAXhkjAT1gTXB7pdR4ln1br9tc3owBjjWu5myiKra2J+g6v+R983y
	MoHJz8BT0Ph66qlPfh5Xk73eJhr/27G37GydToSJUGpGdf47iE2u/dH48cmjZDA6B0AkOqsZAr9GI
	hzn5GIQhkYycSg+X7DEnldQT+ntlQM+DcsjpbRETXSvXoW2UWLJIa0N4VAaW+jNXrgH0jxnnPV5xs
	37bz/WP/RVUoiPdujo0Yqr+iD/22783pEqHh6AGjgiLsPPSlxz+2uuvxuQZM7bDeJl/pNviXvf//i
	DKnsdTKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkvHy-0000000FJZ2-1BjA;
	Wed, 28 Jan 2026 02:28:14 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkvHw-0000000FJYf-0sir
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 02:28:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769567292; x=1801103292;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AsLaV6WjLigGQB+1fL0zxdBAPWzCg6IZSXz0Q9HxAG8=;
  b=JQIhNAyT/l0MdqE5FS+0uokeWUkYeMu9WENXfnMhl09vj0iTiddrJZ8v
   qiL2Mze7eo8DFteI09+v5jYgKHQsyA8NvskseibfjqOBG5iySm79nHbrB
   XpfrpjCeBHiy9xFoZaxwofu+9RaJaSRMeSwLKmO8HP+PKdW5JzgjTsR8S
   RKT9f9GKfXEVMN3rN8WpYA8TXbss12ulmyFfGONUsnEBbiPYexPeOgFJk
   uUZEQJbHihFxZBGiOprphQG2rWoE9NW8szCmYrUAtUrmGNUlahfW3py1s
   rUIZionkKNyuQlFk5rWhdtDTDSJYT7wpRX5LPrHH0PRd5bzsX8jdIadmQ
   w==;
X-CSE-ConnectionGUID: joIRRkw0RP+9sobJjfvIVg==
X-CSE-MsgGUID: tOmkkq0aQhSpFgPYtndRTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="81881454"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="81881454"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 18:28:11 -0800
X-CSE-ConnectionGUID: Y8t6OJ+RTyODRg9E9tlaNw==
X-CSE-MsgGUID: 1pnRvin1TRWKvOKkPfe5QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="207277691"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 Jan 2026 18:28:07 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkvHo-00000000Z8y-1XK9;
	Wed, 28 Jan 2026 02:28:04 +0000
Date: Wed, 28 Jan 2026 10:27:05 +0800
From: kernel test robot <lkp@intel.com>
To: Joey Lu <a0987203069@gmail.com>, airlied@gmail.com, simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, ychuang3@nuvoton.com, schung@nuvoton.com,
	yclu4@nuvoton.com, a0987203069@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/nuvoton: add MA35D1 display controller driver
Message-ID: <202601281037.qP5gX0kK-lkp@intel.com>
References: <20260126085727.2568958-4-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126085727.2568958-4-a0987203069@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_182812_314082_AED914A7 
X-CRM114-Status: GOOD (  12.97  )
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
[cannot apply to robh/for-next linus/master v6.19-rc7 next-20260127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joey-Lu/dt-bindings-display-nuvoton-add-MA35D1-DCU-binding/20260126-170258
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260126085727.2568958-4-a0987203069%40gmail.com
patch subject: [PATCH 3/3] drm/nuvoton: add MA35D1 display controller driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260128/202601281037.qP5gX0kK-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601281037.qP5gX0kK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601281037.qP5gX0kK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/nuvoton/ma35_drm.h:18,
                    from drivers/gpu/drm/nuvoton/ma35_plane.c:23:
   drivers/gpu/drm/nuvoton/ma35_plane.c: In function 'ma35_layer_blend_mode_select':
>> drivers/gpu/drm/nuvoton/ma35_plane.h:141:9: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     141 |         FIELD_PREP(MA35_SRC_BLENDING_MODE, MA35_ALPHA_BLEND_ONE)
         |         ^~~~~~~~~~
   drivers/gpu/drm/nuvoton/ma35_plane.c:177:24: note: in expansion of macro 'MA35_BLEND_MODE_SRC'
     177 |                 *reg = MA35_BLEND_MODE_SRC;
         |                        ^~~~~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/nuvoton/ma35_crtc.c: In function 'ma35_crtc_atomic_enable':
>> drivers/gpu/drm/nuvoton/ma35_crtc.c:97:15: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
      97 |         reg = FIELD_PREP(MA35_DISPLAY_TOTAL_MASK, mode->htotal) |
         |               ^~~~~~~~~~
   drivers/gpu/drm/nuvoton/ma35_crtc.c: In function 'ma35_crtc_get_scanout_position':
>> drivers/gpu/drm/nuvoton/ma35_crtc.c:228:17: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     228 |         *hpos = FIELD_GET(MA35_DISPLAY_CURRENT_X, reg);
         |                 ^~~~~~~~~


vim +/FIELD_PREP +141 drivers/gpu/drm/nuvoton/ma35_plane.h

   137	
   138	/* configs for blend modes */
   139	#define MA35_BLEND_MODE_CLEAR	0
   140	#define MA35_BLEND_MODE_SRC	\
 > 141		FIELD_PREP(MA35_SRC_BLENDING_MODE, MA35_ALPHA_BLEND_ONE)
   142	#define MA35_BLEND_MODE_DST \
   143		FIELD_PREP(MA35_DST_BLENDING_MODE, MA35_ALPHA_BLEND_ONE)
   144	#define MA35_BLEND_MODE_SRC_OVER \
   145		(FIELD_PREP(MA35_SRC_BLENDING_MODE, MA35_ALPHA_BLEND_ONE) | \
   146		FIELD_PREP(MA35_DST_BLENDING_MODE, MA35_ALPHA_BLEND_INVERSED))
   147	#define MA35_BLEND_MODE_DST_OVER \
   148		(FIELD_PREP(MA35_SRC_BLENDING_MODE, MA35_ALPHA_BLEND_INVERSED) | \
   149		FIELD_PREP(MA35_DST_BLENDING_MODE, MA35_ALPHA_BLEND_ONE))
   150	#define MA35_BLEND_MODE_SRC_IN \
   151		FIELD_PREP(MA35_SRC_BLENDING_MODE, MA35_ALPHA_BLEND_NORMAL)
   152	#define MA35_BLEND_MODE_DST_IN \
   153		FIELD_PREP(MA35_DST_BLENDING_MODE, MA35_ALPHA_BLEND_NORMAL)
   154	#define MA35_BLEND_MODE_SRC_OUT \
   155		FIELD_PREP(MA35_SRC_BLENDING_MODE, MA35_ALPHA_BLEND_INVERSED)
   156	#define MA35_BLEND_MODE_DST_OUT \
   157		FIELD_PREP(MA35_DST_BLENDING_MODE, MA35_ALPHA_BLEND_INVERSED)
   158	#define MA35_BLEND_MODE_SRC_ATOP \
   159		(FIELD_PREP(MA35_SRC_BLENDING_MODE, MA35_ALPHA_BLEND_NORMAL) | \
   160		FIELD_PREP(MA35_DST_BLENDING_MODE, MA35_ALPHA_BLEND_INVERSED))
   161	#define MA35_BLEND_MODE_DST_ATOP \
   162		(FIELD_PREP(MA35_SRC_BLENDING_MODE, MA35_ALPHA_BLEND_INVERSED) | \
   163		FIELD_PREP(MA35_DST_BLENDING_MODE, MA35_ALPHA_BLEND_NORMAL))
   164	#define MA35_BLEND_MODE_XOR \
   165		(FIELD_PREP(MA35_SRC_BLENDING_MODE, MA35_ALPHA_BLEND_INVERSED) | \
   166		FIELD_PREP(MA35_DST_BLENDING_MODE, MA35_ALPHA_BLEND_INVERSED))
   167	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

