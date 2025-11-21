Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E07CFC28D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 15:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w9k2T4tG23heSDGRFCTHUPgEZ33I1v2w5qaXmCFP3rY=; b=agM5JBW5f+Le/+gd67MdubEM71
	dzYDLY+YYihrlI90ygS1aBs6KTRjPJUTrYc5KWhrWS2kJueq4ipdEYR8Z0dENGtb+j1dsa2tYvzUy
	beG8MDcnBZ17ihviSHKwxRgZBdW9KhgIcpTt8zJoJtOjZpLgSc3jYqbeKEbelXTGGsPAScsbHuTdF
	MNbRXEDusMNfMHvFeTjG+LGIvRtvb12jADsrIYLaPHGTVphluKg5ci/yn5E5IoHU6L2Y9CiYGuwa/
	L5/PXjDMf4GSMotNLt0dXNObad/od2j371H7TqtUrgoUMmqHB9cRMjgDkSTAHtNfmhzrnZTpxii9M
	qKDLPXAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMTNk-00000008eGR-1snk;
	Fri, 21 Nov 2025 15:49:08 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMTNh-00000008eG1-0nh6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 15:49:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763740145; x=1795276145;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I+eZM8y4822ZhQguud4i5d0RspiKKU1aFhvwdNevmxw=;
  b=dLOevbYUXc0IY8KXrrKmb4MJnxoiV+GJWfnpPsPuL5mIVM3eTFY8+68F
   xi7WuLEfKbT5mOGjfChwRoZSJmmI4FOqhSleBLfr4wB5uA2ZCkIXGXmdX
   nnVsx9mMTnWHp0rMJ4pLJhJ9PrwCYSDLBjeJPqEKqpWtNiVwHr2nlKMpo
   UbOESuG31EC0sfEb2T/CsiGNwJTTGfX52762JOwZ7oRgHLO+s+Bl1uVap
   ZYT4GNkFkNw3oRB03AFwR23Vz99pUeJkhxidojusVK6NC8NYpgKOXzsy6
   NLIPAY/gzOs3UkpOadmtLvf3TB3LF9kMa1JKQSbmB4ZvIaHWdyLUrFAr7
   Q==;
X-CSE-ConnectionGUID: +czuyMrcR7mAgewq6y/W4A==
X-CSE-MsgGUID: 2UzUDlCnQ3azTwlu/Dfutw==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="69702102"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="69702102"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 07:49:03 -0800
X-CSE-ConnectionGUID: os19VIQmS+WQt9HVXi79qQ==
X-CSE-MsgGUID: lfxCkzQeT+eS4DRpKuSLHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="191022926"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 21 Nov 2025 07:49:02 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMTNa-0006YF-2B;
	Fri, 21 Nov 2025 15:48:58 +0000
Date: Fri, 21 Nov 2025 23:48:22 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Subject: [linusw-nomadik:b4/mcde-drm-regression-thirdfix 4/4]
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c:552:34: error: use of
 undeclared identifier 'state'
Message-ID: <202511212319.aUKKl3Vq-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_074905_241744_D9442CCC 
X-CRM114-Status: GOOD (  12.17  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git b4/mcde-drm-regression-thirdfix
head:   3e64b03a4bf2f67f43046af7e41c197df9fd6efb
commit: 3e64b03a4bf2f67f43046af7e41c197df9fd6efb [4/4] RFT: drm/rcar-du: Modify custom commit tail
config: arm-randconfig-003-20251121 (https://download.01.org/0day-ci/archive/20251121/202511212319.aUKKl3Vq-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511212319.aUKKl3Vq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511212319.aUKKl3Vq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c:552:34: error: use of undeclared identifier 'state'
     552 |         drm_encoder_bridge_disable(dev, state);
         |                                         ^~~~~
   drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c:553:39: error: use of undeclared identifier 'state'
     553 |         drm_encoder_bridge_post_disable(dev, state);
         |                                              ^~~~~
   drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c:554:24: error: use of undeclared identifier 'state'
     554 |         drm_crtc_disable(dev, state);
         |                               ^~~~~
   drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c:555:53: error: use of undeclared identifier 'state'
     555 |         drm_atomic_helper_update_legacy_modeset_state(dev, state);
         |                                                            ^~~~~
   drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c:556:48: error: use of undeclared identifier 'state'
     556 |         drm_atomic_helper_calc_timestamping_constants(state);
         |                                                       ^~~~~
   drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c:557:25: error: use of undeclared identifier 'state'
     557 |         drm_crtc_set_mode(dev, state);
         |                                ^~~~~
   drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c:563:23: error: use of undeclared identifier 'state'
     563 |         drm_crtc_enable(dev, state);
         |                              ^~~~~
   drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c:564:37: error: use of undeclared identifier 'state'
     564 |         drm_encoder_bridge_pre_enable(dev, state);
         |                                            ^~~~~
   drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c:565:33: error: use of undeclared identifier 'state'
     565 |         drm_encoder_bridge_enable(dev, state);
         |                                        ^~~~~
   drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c:566:43: error: use of undeclared identifier 'state'
     566 |         drm_atomic_helper_commit_writebacks(dev, state);
         |                                                  ^~~~~
   10 errors generated.


vim +/state +552 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c

   516	
   517	static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
   518	{
   519		struct drm_device *dev = old_state->dev;
   520		struct rcar_du_device *rcdu = to_rcar_du_device(dev);
   521		struct drm_crtc_state *crtc_state;
   522		struct drm_crtc *crtc;
   523		unsigned int i;
   524	
   525		/*
   526		 * Store RGB routing to DPAD0 and DPAD1, the hardware will be configured
   527		 * when starting the CRTCs.
   528		 */
   529		rcdu->dpad1_source = -1;
   530	
   531		for_each_new_crtc_in_state(old_state, crtc, crtc_state, i) {
   532			struct rcar_du_crtc_state *rcrtc_state =
   533				to_rcar_crtc_state(crtc_state);
   534			struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
   535	
   536			if (rcrtc_state->outputs & BIT(RCAR_DU_OUTPUT_DPAD0))
   537				rcdu->dpad0_source = rcrtc->index;
   538	
   539			if (rcrtc_state->outputs & BIT(RCAR_DU_OUTPUT_DPAD1))
   540				rcdu->dpad1_source = rcrtc->index;
   541		}
   542	
   543		/*
   544		 * Apply the atomic update.
   545		 *
   546		 * We need special ordering to make sure the CRTC disabled last
   547		 * and enabled first. We do this with modified versions of the
   548		 * common modeset_disables/enables functions.
   549		 */
   550	
   551		/* Variant of drm_atomic_helper_commit_modeset_disables() */
 > 552		drm_encoder_bridge_disable(dev, state);
   553		drm_encoder_bridge_post_disable(dev, state);
   554		drm_crtc_disable(dev, state);
   555		drm_atomic_helper_update_legacy_modeset_state(dev, state);
   556		drm_atomic_helper_calc_timestamping_constants(state);
   557		drm_crtc_set_mode(dev, state);
   558	
   559		drm_atomic_helper_commit_planes(dev, old_state,
   560						DRM_PLANE_COMMIT_ACTIVE_ONLY);
   561	
   562		/* Variant of drm_atomic_helper_commit_modeset_enables() */
   563		drm_crtc_enable(dev, state);
   564		drm_encoder_bridge_pre_enable(dev, state);
   565		drm_encoder_bridge_enable(dev, state);
   566		drm_atomic_helper_commit_writebacks(dev, state);
   567	
   568		drm_atomic_helper_commit_hw_done(old_state);
   569		drm_atomic_helper_wait_for_flip_done(dev, old_state);
   570	
   571		drm_atomic_helper_cleanup_planes(dev, old_state);
   572	}
   573	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

