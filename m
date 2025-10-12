Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A72CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 03:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=256r13TCdCgvqFNzf0g84twPKR75TD5EUO6rNRBp/gY=; b=UzkPhth7sUtbytT5vEe1NpGZYQ
	TvOXNCwel8dKaHvaOwQU/6mT+r2OWCG+ZKX0qHIrzQRVyP8jp6YzGJbawEj3nETfbF/V+UfCOdaoh
	hwJS0U0Tb8ynodfu78WSKG2KL9b/MY5ZCblm40GL6YZPvOTQ6k0KjN39NqRH39TtFeBMydbDczA7n
	Zt5tc8sn7Fq7AqVno+8aJCqQjSD+CQa93zMHPu3atQ1k7qlhVXHJjINGfPWItuNbuqfV5syzM/Mg8
	DV4Vks1mtBMIao2Kx5cvUXTv0lo9T22BW2zsdt8Bs0b7fEImBn+ez2ubp5su96A6ylHvsKqz3dynC
	ClGOE7yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7mWJ-0000000B2TX-2rJw;
	Sun, 12 Oct 2025 03:13:15 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7mWG-0000000B2So-0ySc;
	Sun, 12 Oct 2025 03:13:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760238792; x=1791774792;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LgCBazIKENUMWDtTVXVJ1949c/UQTOe/HuPTUIj7gzU=;
  b=XtinH/6xvJMopCAPbf1nxuSqsU8n9o9XQWFRhXPMrCH2ipvIiciRxSkL
   Zb2cyAEdrMkiw219lAHDF7LvIKml2uxrNNPydR9j6m0892FJjpJeX2Jwv
   ni3NflNCy6LCMvN+wfPJaaoRZyFoMulZCssBb8+5OrScFe/7BeiFldJ4D
   vqcCLxq/N0jDNnPjVEjFDXZPFDtmgOtUjo5OGm7MPbLA83MT5YPcXo1IX
   AYv7d6N8bficlzN60gkya64Bnj4JdU9xBS0GfIycVsSY+hDB2PIh4WpIT
   RqnCzQ9744/b0sZ9ZGuOfsqxPQd1iOmrrRDrUQd+rsx7B+m6wdSGt+O8i
   g==;
X-CSE-ConnectionGUID: s2S250s2SqOfEor0rtdR4w==
X-CSE-MsgGUID: pFrEeBeXTp+oMCgAWylF2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="62510338"
X-IronPort-AV: E=Sophos;i="6.19,222,1754982000"; 
   d="scan'208";a="62510338"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2025 20:13:07 -0700
X-CSE-ConnectionGUID: QdHrMtJ9SPmASB0zARVHzA==
X-CSE-MsgGUID: mgmTFntXSbm6mXD79aJaQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,222,1754982000"; 
   d="scan'208";a="186583057"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Oct 2025 20:13:03 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7mW5-0004AR-0j;
	Sun, 12 Oct 2025 03:13:01 +0000
Date: Sun, 12 Oct 2025 11:12:23 +0800
From: kernel test robot <lkp@intel.com>
To: Alok Tiwari <alok.a.tiwari@oracle.com>, michael.riesch@wolfvision.net,
	robh@kernel.org, s.hauer@pengutronix.de,
	dri-devel@lists.freedesktop.org, simona@ffwll.ch, airlied@gmail.com,
	tzimmermann@suse.de, mripard@kernel.org, hjc@rock-chips.com,
	heiko@sntech.de, andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alok.a.tiwari@oracle.com, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] drm/rockchip: vop2: use correct destination rectangle
 height check
Message-ID: <202510121013.tqU2DAEC-lkp@intel.com>
References: <20251011130450.123444-1-alok.a.tiwari@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011130450.123444-1-alok.a.tiwari@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_201312_339880_53AD25E4 
X-CRM114-Status: GOOD (  13.57  )
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

Hi Alok,

kernel test robot noticed the following build errors:

[auto build test ERROR on rockchip/for-next]
[also build test ERROR on linus/master v6.17 next-20251010]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alok-Tiwari/drm-rockchip-vop2-use-correct-destination-rectangle-height-check/20251011-210653
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20251011130450.123444-1-alok.a.tiwari%40oracle.com
patch subject: [PATCH] drm/rockchip: vop2: use correct destination rectangle height check
config: sparc64-randconfig-001-20251012 (https://download.01.org/0day-ci/archive/20251012/202510121013.tqU2DAEC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251012/202510121013.tqU2DAEC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510121013.tqU2DAEC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:1034:34: error: call to undeclared function 'drm_rect_heigh'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1034 |             drm_rect_width(dest) < 4 || drm_rect_heigh(dest) < 4) {
         |                                         ^
   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:1034:34: note: did you mean 'drm_rect_height'?
   include/drm/drm_rect.h:196:19: note: 'drm_rect_height' declared here
     196 | static inline int drm_rect_height(const struct drm_rect *r)
         |                   ^
   1 error generated.


vim +/drm_rect_heigh +1034 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c

   991	
   992	static int vop2_plane_atomic_check(struct drm_plane *plane,
   993					   struct drm_atomic_state *astate)
   994	{
   995		struct drm_plane_state *pstate = drm_atomic_get_new_plane_state(astate, plane);
   996		struct drm_framebuffer *fb = pstate->fb;
   997		struct drm_crtc *crtc = pstate->crtc;
   998		struct drm_crtc_state *cstate;
   999		struct vop2_video_port *vp;
  1000		struct vop2 *vop2;
  1001		const struct vop2_data *vop2_data;
  1002		struct drm_rect *dest = &pstate->dst;
  1003		struct drm_rect *src = &pstate->src;
  1004		int min_scale = FRAC_16_16(1, 8);
  1005		int max_scale = FRAC_16_16(8, 1);
  1006		int format;
  1007		int ret;
  1008	
  1009		if (!crtc)
  1010			return 0;
  1011	
  1012		vp = to_vop2_video_port(crtc);
  1013		vop2 = vp->vop2;
  1014		vop2_data = vop2->data;
  1015	
  1016		cstate = drm_atomic_get_existing_crtc_state(pstate->state, crtc);
  1017		if (WARN_ON(!cstate))
  1018			return -EINVAL;
  1019	
  1020		ret = drm_atomic_helper_check_plane_state(pstate, cstate,
  1021							  min_scale, max_scale,
  1022							  true, true);
  1023		if (ret)
  1024			return ret;
  1025	
  1026		if (!pstate->visible)
  1027			return 0;
  1028	
  1029		format = vop2_convert_format(fb->format->format);
  1030		if (format < 0)
  1031			return format;
  1032	
  1033		if (drm_rect_width(src) >> 16 < 4 || drm_rect_height(src) >> 16 < 4 ||
> 1034		    drm_rect_width(dest) < 4 || drm_rect_heigh(dest) < 4) {
  1035			drm_err(vop2->drm, "Invalid size: %dx%d->%dx%d, min size is 4x4\n",
  1036				drm_rect_width(src) >> 16, drm_rect_height(src) >> 16,
  1037				drm_rect_width(dest), drm_rect_height(dest));
  1038			pstate->visible = false;
  1039			return 0;
  1040		}
  1041	
  1042		if (drm_rect_width(src) >> 16 > vop2_data->max_input.width ||
  1043		    drm_rect_height(src) >> 16 > vop2_data->max_input.height) {
  1044			drm_err(vop2->drm, "Invalid source: %dx%d. max input: %dx%d\n",
  1045				drm_rect_width(src) >> 16,
  1046				drm_rect_height(src) >> 16,
  1047				vop2_data->max_input.width,
  1048				vop2_data->max_input.height);
  1049			return -EINVAL;
  1050		}
  1051	
  1052		/*
  1053		 * Src.x1 can be odd when do clip, but yuv plane start point
  1054		 * need align with 2 pixel.
  1055		 */
  1056		if (fb->format->is_yuv && ((pstate->src.x1 >> 16) % 2)) {
  1057			drm_err(vop2->drm, "Invalid Source: Yuv format not support odd xpos\n");
  1058			return -EINVAL;
  1059		}
  1060	
  1061		return 0;
  1062	}
  1063	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

