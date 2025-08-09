Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A375C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Aug 2025 13:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PP7SOmX6siCVOtGZt5oGa8AV8dlH5hPseDsRgqqzK6M=; b=fiI2hLIhTdXz8vc5WhLZm35q55
	O+z9hnCD6FkW03AckuzsRNP6w99IxR4vl5QJOF1G4/zwM0MyywiVBogNz6qNRigd1sO62wzbRNYK0
	eajdQF0wD7yYLHr8ZY0KVow9qQokYFNk5D7nIoWKTzcQReVk+PBWvuNjOwLewVyC1u6OgQIBdpA72
	ylbFvWFVvZ8A8FO2hMtFrv8SH6+HdOCn+DcNIg8ljfaYpc3f519pjn52X9eRP7pdaEy5pc1J33grv
	ss6NzVM+9as0tsm3wqayRMpGAtHwyKISqKrh1RSn4z6PRGrbVvkmh3TffBEcCicZurmiYCijZkq/H
	ttcj4psg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukjUm-00000004Vhy-37Ch;
	Sat, 09 Aug 2025 13:20:24 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukjSF-00000004VYg-3N2r;
	Sat, 09 Aug 2025 13:17:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754745468; x=1786281468;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RbSGZsdpzlkDff1hVs81RD6N3zPNN/x5VL/ZTxrfsUM=;
  b=ELaZUOoyNxap5/DSJyNIg9v6LkWIVPR4jitM7NQ9D7a3lQYbE1LYFLEm
   roXzyFycBipegUFgPq3/Tcn+F8W3RjXtESJRuFiktNbLo3MQ4GKBaVMXf
   qnX0srmUFp5KGiziwwbdpScSOsWhz+AUuepfsZi0d1GrQjhJFIRl1Ur4t
   ClPYyVj7BLQUWbbXKLMh3O3g53y5NQigM1OPwM+NTdvFAYeywJ1w7ML7A
   N9mwb4WcYeF5pFX8vXR/43bIMuZ3eijva9n0FKal4ugSn1sbXKlSMDgxL
   ttzRgxtmMSijrVdUFgGm1EkF92YrYM3xrRmKTg10VHhcmvHCr+bhoUpCq
   w==;
X-CSE-ConnectionGUID: WgdAVebLQmOkWPjQXZ2Ukg==
X-CSE-MsgGUID: OhAe51rpRi282/vNaOTZyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="67338569"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="67338569"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 06:17:45 -0700
X-CSE-ConnectionGUID: kuu25EDyQBWNUhQnZy+QVw==
X-CSE-MsgGUID: N+S8Ygg5TUKLxpj6LWRDqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="169746865"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 09 Aug 2025 06:17:42 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukjS7-0004o0-2h;
	Sat, 09 Aug 2025 13:17:39 +0000
Date: Sat, 9 Aug 2025 21:17:23 +0800
From: kernel test robot <lkp@intel.com>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 11/12] media: rkvdec: Add HEVC support for the VDPU381
 variant
Message-ID: <202508092052.AFrUDe6V-lkp@intel.com>
References: <20250808200340.156393-12-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808200340.156393-12-detlev.casanova@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250809_061747_985371_6296122D 
X-CRM114-Status: GOOD (  14.39  )
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

Hi Detlev,

kernel test robot noticed the following build errors:

[auto build test ERROR on linuxtv-media-pending/master]
[also build test ERROR on linus/master next-20250808]
[cannot apply to rockchip/for-next sailus-media-tree/master sailus-media-tree/streams v6.16]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Detlev-Casanova/media-rkvdec-Switch-to-using-structs-instead-of-writel/20250809-041049
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20250808200340.156393-12-detlev.casanova%40collabora.com
patch subject: [PATCH v2 11/12] media: rkvdec: Add HEVC support for the VDPU381 variant
config: i386-buildonly-randconfig-005-20250809 (https://download.01.org/0day-ci/archive/20250809/202508092052.AFrUDe6V-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250809/202508092052.AFrUDe6V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508092052.AFrUDe6V-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c:119:39: error: field has incomplete type 'struct v4l2_ctrl_hevc_ext_sps_st_rps'
     119 |         struct v4l2_ctrl_hevc_ext_sps_st_rps    st_cache;
         |                                                 ^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h:68:15: note: forward declaration of 'struct v4l2_ctrl_hevc_ext_sps_st_rps'
      68 |         const struct v4l2_ctrl_hevc_ext_sps_st_rps      *ext_sps_st_rps;
         |                      ^
   1 error generated.
--
>> drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c:261:23: error: subscript of pointer to incomplete type 'const struct v4l2_ctrl_hevc_ext_sps_lt_rps'
     261 |                         run->ext_sps_lt_rps[i].lt_ref_pic_poc_lsb_sps;
         |                         ~~~~~~~~~~~~~~~~~~~^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h:69:15: note: forward declaration of 'struct v4l2_ctrl_hevc_ext_sps_lt_rps'
      69 |         const struct v4l2_ctrl_hevc_ext_sps_lt_rps      *ext_sps_lt_rps;
         |                      ^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c:263:26: error: subscript of pointer to incomplete type 'const struct v4l2_ctrl_hevc_ext_sps_lt_rps'
     263 |                         !!(run->ext_sps_lt_rps[i].flags & V4L2_HEVC_EXT_SPS_LT_RPS_FLAG_USED_LT);
         |                            ~~~~~~~~~~~~~~~~~~~^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h:69:15: note: forward declaration of 'struct v4l2_ctrl_hevc_ext_sps_lt_rps'
      69 |         const struct v4l2_ctrl_hevc_ext_sps_lt_rps      *ext_sps_lt_rps;
         |                      ^
>> drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c:263:38: error: use of undeclared identifier 'V4L2_HEVC_EXT_SPS_LT_RPS_FLAG_USED_LT'
     263 |                         !!(run->ext_sps_lt_rps[i].flags & V4L2_HEVC_EXT_SPS_LT_RPS_FLAG_USED_LT);
         |                                                           ^
>> drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c:299:77: error: subscript of pointer to incomplete type 'const struct v4l2_ctrl_hevc_ext_sps_st_rps'
     299 |         const struct v4l2_ctrl_hevc_ext_sps_st_rps *rps_data = &run->ext_sps_st_rps[idx];
         |                                                                 ~~~~~~~~~~~~~~~~~~~^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h:68:15: note: forward declaration of 'struct v4l2_ctrl_hevc_ext_sps_st_rps'
      68 |         const struct v4l2_ctrl_hevc_ext_sps_st_rps      *ext_sps_st_rps;
         |                      ^
>> drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c:310:38: error: incomplete definition of type 'const struct v4l2_ctrl_hevc_ext_sps_st_rps'
     310 |         ref_rps_idx = st_rps_idx - (rps_data->delta_idx_minus1 + 1); /* 7-59 */
         |                                     ~~~~~~~~^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h:68:15: note: forward declaration of 'struct v4l2_ctrl_hevc_ext_sps_st_rps'
      68 |         const struct v4l2_ctrl_hevc_ext_sps_st_rps      *ext_sps_st_rps;
         |                      ^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c:311:31: error: incomplete definition of type 'const struct v4l2_ctrl_hevc_ext_sps_st_rps'
     311 |         delta_rps = (1 - 2 * rps_data->delta_rps_sign) *
         |                              ~~~~~~~~^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h:68:15: note: forward declaration of 'struct v4l2_ctrl_hevc_ext_sps_st_rps'
      68 |         const struct v4l2_ctrl_hevc_ext_sps_st_rps      *ext_sps_st_rps;
         |                      ^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c:312:15: error: incomplete definition of type 'const struct v4l2_ctrl_hevc_ext_sps_st_rps'
     312 |                    (rps_data->abs_delta_rps_minus1 + 1); /* 7-60 */
         |                     ~~~~~~~~^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h:68:15: note: forward declaration of 'struct v4l2_ctrl_hevc_ext_sps_st_rps'
      68 |         const struct v4l2_ctrl_hevc_ext_sps_st_rps      *ext_sps_st_rps;
         |                      ^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c:317:41: error: incomplete definition of type 'const struct v4l2_ctrl_hevc_ext_sps_st_rps'
     317 |                 used_by_curr_pic_flag[j] = !!(rps_data->used_by_curr_pic & (1 << j));
         |                                               ~~~~~~~~^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h:68:15: note: forward declaration of 'struct v4l2_ctrl_hevc_ext_sps_st_rps'
      68 |         const struct v4l2_ctrl_hevc_ext_sps_st_rps      *ext_sps_st_rps;
         |                      ^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c:318:34: error: incomplete definition of type 'const struct v4l2_ctrl_hevc_ext_sps_st_rps'
     318 |                 use_delta_flag[j] = !!(rps_data->use_delta_flag & (1 << j));
         |                                        ~~~~~~~~^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h:68:15: note: forward declaration of 'struct v4l2_ctrl_hevc_ext_sps_st_rps'
      68 |         const struct v4l2_ctrl_hevc_ext_sps_st_rps      *ext_sps_st_rps;
         |                      ^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c:376:77: error: subscript of pointer to incomplete type 'const struct v4l2_ctrl_hevc_ext_sps_st_rps'
     376 |         const struct v4l2_ctrl_hevc_ext_sps_st_rps *rps_data = &run->ext_sps_st_rps[idx];
         |                                                                 ~~~~~~~~~~~~~~~~~~~^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h:68:15: note: forward declaration of 'struct v4l2_ctrl_hevc_ext_sps_st_rps'
      68 |         const struct v4l2_ctrl_hevc_ext_sps_st_rps      *ext_sps_st_rps;
         |                      ^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c:381:38: error: incomplete definition of type 'const struct v4l2_ctrl_hevc_ext_sps_st_rps'
     381 |         st_rps->num_negative_pics = rps_data->num_negative_pics;
         |                                     ~~~~~~~~^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h:68:15: note: forward declaration of 'struct v4l2_ctrl_hevc_ext_sps_st_rps'
      68 |         const struct v4l2_ctrl_hevc_ext_sps_st_rps      *ext_sps_st_rps;
         |                      ^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c:383:38: error: incomplete definition of type 'const struct v4l2_ctrl_hevc_ext_sps_st_rps'
     383 |         st_rps->num_positive_pics = rps_data->num_positive_pics;
         |                                     ~~~~~~~~^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h:68:15: note: forward declaration of 'struct v4l2_ctrl_hevc_ext_sps_st_rps'
      68 |         const struct v4l2_ctrl_hevc_ext_sps_st_rps      *ext_sps_st_rps;
         |                      ^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c:387:47: error: incomplete definition of type 'const struct v4l2_ctrl_hevc_ext_sps_st_rps'
     387 |                 st_rps->used_by_curr_pic_s0[i] = !!(rps_data->used_by_curr_pic & (1 << i));
         |                                                     ~~~~~~~~^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h:68:15: note: forward declaration of 'struct v4l2_ctrl_hevc_ext_sps_st_rps'
      68 |         const struct v4l2_ctrl_hevc_ext_sps_st_rps      *ext_sps_st_rps;
         |                      ^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c:391:40: error: incomplete definition of type 'const struct v4l2_ctrl_hevc_ext_sps_st_rps'
     391 |                         st_rps->delta_poc_s0[i] = -(rps_data->delta_poc_s0_minus1[i] + 1);
         |                                                     ~~~~~~~~^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h:68:15: note: forward declaration of 'struct v4l2_ctrl_hevc_ext_sps_st_rps'
      68 |         const struct v4l2_ctrl_hevc_ext_sps_st_rps      *ext_sps_st_rps;
         |                      ^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c:396:14: error: incomplete definition of type 'const struct v4l2_ctrl_hevc_ext_sps_st_rps'
     396 |                                 (rps_data->delta_poc_s0_minus1[i] + 1);
         |                                  ~~~~~~~~^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h:68:15: note: forward declaration of 'struct v4l2_ctrl_hevc_ext_sps_st_rps'
      68 |         const struct v4l2_ctrl_hevc_ext_sps_st_rps      *ext_sps_st_rps;
         |                      ^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c:402:47: error: incomplete definition of type 'const struct v4l2_ctrl_hevc_ext_sps_st_rps'
     402 |                 st_rps->used_by_curr_pic_s1[j] = !!(rps_data->used_by_curr_pic & (1 << (i + j)));
         |                                                     ~~~~~~~~^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h:68:15: note: forward declaration of 'struct v4l2_ctrl_hevc_ext_sps_st_rps'
      68 |         const struct v4l2_ctrl_hevc_ext_sps_st_rps      *ext_sps_st_rps;
         |                      ^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c:406:38: error: incomplete definition of type 'const struct v4l2_ctrl_hevc_ext_sps_st_rps'
     406 |                         st_rps->delta_poc_s1[j] = rps_data->delta_poc_s1_minus1[j] + 1;
         |                                                   ~~~~~~~~^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h:68:15: note: forward declaration of 'struct v4l2_ctrl_hevc_ext_sps_st_rps'
      68 |         const struct v4l2_ctrl_hevc_ext_sps_st_rps      *ext_sps_st_rps;
         |                      ^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c:411:14: error: incomplete definition of type 'const struct v4l2_ctrl_hevc_ext_sps_st_rps'
     411 |                                 (rps_data->delta_poc_s1_minus1[j] + 1);
         |                                  ~~~~~~~~^
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h:68:15: note: forward declaration of 'struct v4l2_ctrl_hevc_ext_sps_st_rps'
      68 |         const struct v4l2_ctrl_hevc_ext_sps_st_rps      *ext_sps_st_rps;
         |                      ^
>> drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c:427:42: error: invalid application of 'sizeof' to an incomplete type 'struct v4l2_ctrl_hevc_ext_sps_st_rps'
     427 |         if (!memcmp(cache, run->ext_sps_st_rps, sizeof(struct v4l2_ctrl_hevc_ext_sps_st_rps)))
         |                                                 ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h:68:15: note: forward declaration of 'struct v4l2_ctrl_hevc_ext_sps_st_rps'
      68 |         const struct v4l2_ctrl_hevc_ext_sps_st_rps      *ext_sps_st_rps;
         |                      ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +119 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c

   115	
   116	struct rkvdec_hevc_ctx {
   117		struct rkvdec_aux_buf			priv_tbl;
   118		struct v4l2_ctrl_hevc_scaling_matrix	scaling_matrix_cache;
 > 119		struct v4l2_ctrl_hevc_ext_sps_st_rps	st_cache;
   120		struct rkvdec_vdpu381_regs_hevc		regs;
   121	};
   122	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

