Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6015DCCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 23:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hPtraaaE2ty+yYr55MtGb7iISG1JlCIBHq6fVL1HHl4=; b=vkoso+dIEfG5PUOy9t4eeWHdXz
	sbRbCxy0x9wr8qgdhwLXVuKJwvSrcyxOi+O/6VoyJCmFBKXvT/ku5DRM8C+E+5CWm7rA5U7u1ai55
	TiYvt/i64d/uo3hn6yikVtrghtPy8Ca3aNdZsFHGpX3ch3yKWQTeKNABHutxREqqaVxloTvvkdFtz
	soiyd/NtvCKxe1JREO/F7o8T/F81C6p0ha3QiYmLkb+Hujz43HEerg3A+FyLdbl1lVduIt5cH15Rt
	BDl8LE0Q0GPf23Wk5KdWjB7iuMb1lga0T9vZfX6HkTDnpcCskdCsxEtxdGjgojOXeHqklT4ATJLT1
	8y/lONew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBhqD-00000004V0R-307i;
	Wed, 22 Oct 2025 23:02:01 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBhqA-00000004Uzf-2UQd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 23:02:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761174119; x=1792710119;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZYwSymkxgPomBYdrpYf7dCnYDn0jDU8UBAylZmQcrtc=;
  b=Zq1ekb73s0k88c7q1wiANRQxT0lpMf6DiPrw5ayhc23RUSzz4VMz6+ob
   oy3kGpFNcmO2xntUtEcPTQyqwjLJn/iHvddfz3u8w6Dj/m1NYjfBN1ARA
   2KLaS55YeOMmxT3v+VG7nvCAqOnRZvJfQyOAh2tWKpw9QFWdRE32nYu7i
   SVqzntAyWoEvednROfqti6h/kCluO30YGkj04v4BLCnoikWG+l2/2nLSQ
   1kkRQouzECzY8UktqrC12HrMN2bCqNXeTVxznEH6TT+/i90gQQ19qS6e4
   019LjOqEYHjhfdVdaTk0qT9fmNTLBz5da04PnT0qRLcV5Qinn8eh1wMgw
   w==;
X-CSE-ConnectionGUID: i6d4aFClTxqi02n0rQ1sfA==
X-CSE-MsgGUID: oBI2JqOLQ92YvxAhKLJWuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74452896"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="74452896"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 16:01:57 -0700
X-CSE-ConnectionGUID: LjP14FD2T+GasfUkjwUPmQ==
X-CSE-MsgGUID: 3Eb6PqzwQiC4NlyV/Mxo0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="183893778"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 22 Oct 2025 16:01:34 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBhpd-000CoP-1L;
	Wed, 22 Oct 2025 23:01:30 +0000
Date: Thu, 23 Oct 2025 07:01:10 +0800
From: kernel test robot <lkp@intel.com>
To: Nas Chung <nas.chung@chipsnmedia.com>, mchehab@kernel.org,
	hverkuil@xs4all.nl, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org, jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com, marek.vasut@mailbox.org,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Ming Qian <ming.qian@oss.nxp.com>
Subject: Re: [PATCH v4 8/9] media: chips-media: wave6: Add Wave6 control
 driver
Message-ID: <202510230606.Ycv5XHv1-lkp@intel.com>
References: <20251022074710.575-9-nas.chung@chipsnmedia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022074710.575-9-nas.chung@chipsnmedia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_160158_710106_3E9C5B9C 
X-CRM114-Status: GOOD (  12.61  )
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

Hi Nas,

kernel test robot noticed the following build errors:

[auto build test ERROR on shawnguo/for-next]
[also build test ERROR on linuxtv-media-pending/master robh/for-next linus/master v6.18-rc2 next-20251022]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nas-Chung/media-v4l2-common-Add-YUV24-format-info/20251022-155246
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20251022074710.575-9-nas.chung%40chipsnmedia.com
patch subject: [PATCH v4 8/9] media: chips-media: wave6: Add Wave6 control driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20251023/202510230606.Ycv5XHv1-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510230606.Ycv5XHv1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510230606.Ycv5XHv1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/chips-media/wave6/wave6-vpu.c:131:6: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     131 |                           REMAP_CTRL_INDEX(i) |
         |                           ^
   drivers/media/platform/chips-media/wave6/wave6-regdefine.h:83:32: note: expanded from macro 'REMAP_CTRL_INDEX'
      83 | #define         REMAP_CTRL_INDEX(x)                     FIELD_PREP(GENMASK(15, 12), (x))
         |                                                         ^
   1 error generated.
--
>> drivers/media/platform/chips-media/wave6/wave6-vpu-core.c:135:3: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     135 |                 FW_VERSION_MAJOR(core->attr.fw_version),
         |                 ^
   drivers/media/platform/chips-media/wave6/wave6-vpu-core.c:143:4: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     143 |                         FW_VERSION_MAJOR(core->res->compatible_fw_version),
         |                         ^
   2 errors generated.
--
>> drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c:34:4: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      34 |                         FW_VERSION_MAJOR(inst->dev->attr.fw_version),
         |                         ^
   drivers/media/platform/chips-media/wave6/wave6-vpuapi.h:125:29: note: expanded from macro 'FW_VERSION_MAJOR'
     125 | #define FW_VERSION_MAJOR(x)     FIELD_GET(FW_VERSION_MAJOR_MASK, (x))
         |                                 ^
   1 error generated.
--
>> drivers/media/platform/chips-media/wave6/wave6-hw.c:237:13: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     237 |                 reg_val = INSTANCE_INFO_CODEC_STD(std);
         |                           ^
   drivers/media/platform/chips-media/wave6/wave6-regdefine.h:99:38: note: expanded from macro 'INSTANCE_INFO_CODEC_STD'
      99 | #define         INSTANCE_INFO_CODEC_STD(x)              FIELD_PREP(GENMASK(31, 16), (x))
         |                                                         ^
>> drivers/media/platform/chips-media/wave6/wave6-hw.c:308:28: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     308 |         attr->support_decoders |= STD_DEF1_HEVC_DEC(std_def1) << W_HEVC_DEC;
         |                                   ^
   drivers/media/platform/chips-media/wave6/wave6-regdefine.h:125:33: note: expanded from macro 'STD_DEF1_HEVC_DEC'
     125 | #define         STD_DEF1_HEVC_DEC(x)                    FIELD_GET(GENMASK(2, 2), (x))
         |                                                         ^
   drivers/media/platform/chips-media/wave6/wave6-hw.c:362:12: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     362 |         reg_val = CREATE_INST_CORE_INFO_CQ_DEPTH(COMMAND_QUEUE_DEPTH) |
         |                   ^
   drivers/media/platform/chips-media/wave6/wave6-regdefine.h:145:44: note: expanded from macro 'CREATE_INST_CORE_INFO_CQ_DEPTH'
     145 | #define         CREATE_INST_CORE_INFO_CQ_DEPTH(x)       FIELD_PREP(GENMASK(10, 8), (x))
         |                                                         ^
   drivers/media/platform/chips-media/wave6/wave6-hw.c:405:12: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     405 |         reg_val = DEC_PIC_BS_OPTION_STREAM_END(p_dec_info->stream_end) |
         |                   ^
   drivers/media/platform/chips-media/wave6/wave6-regdefine.h:259:43: note: expanded from macro 'DEC_PIC_BS_OPTION_STREAM_END'
     259 | #define         DEC_PIC_BS_OPTION_STREAM_END(x)         FIELD_PREP(GENMASK(1, 1), (x))
         |                                                         ^
   drivers/media/platform/chips-media/wave6/wave6-hw.c:438:20: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     438 |         info->pic_width = DEC_PIC_SIZE_WIDTH(reg_val);
         |                           ^
   drivers/media/platform/chips-media/wave6/wave6-regdefine.h:299:34: note: expanded from macro 'DEC_PIC_SIZE_WIDTH'
     299 | #define         DEC_PIC_SIZE_WIDTH(x)                   FIELD_GET(GENMASK(31, 16), (x))
         |                                                         ^
   drivers/media/platform/chips-media/wave6/wave6-hw.c:561:12: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     561 |         reg_val = SET_FB_PIC_SIZE_WIDTH(p_dec_info->seq_info.pic_width) |
         |                   ^
   drivers/media/platform/chips-media/wave6/wave6-regdefine.h:167:36: note: expanded from macro 'SET_FB_PIC_SIZE_WIDTH'
     167 | #define         SET_FB_PIC_SIZE_WIDTH(x)                FIELD_PREP(GENMASK(31, 16), (x))
         |                                                         ^
   drivers/media/platform/chips-media/wave6/wave6-hw.c:650:12: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     650 |         reg_val = SET_DISP_SCL_PIC_SIZE_WIDTH(inst->scaler_info.width) |
         |                   ^
   drivers/media/platform/chips-media/wave6/wave6-regdefine.h:250:42: note: expanded from macro 'SET_DISP_SCL_PIC_SIZE_WIDTH'
     250 | #define         SET_DISP_SCL_PIC_SIZE_WIDTH(x)          FIELD_PREP(GENMASK(31, 16), (x))
         |                                                         ^
   drivers/media/platform/chips-media/wave6/wave6-hw.c:732:12: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     732 |         reg_val = DEC_PIC_BS_OPTION_STREAM_END(p_dec_info->stream_end) |
         |                   ^
   drivers/media/platform/chips-media/wave6/wave6-regdefine.h:259:43: note: expanded from macro 'DEC_PIC_BS_OPTION_STREAM_END'
     259 | #define         DEC_PIC_BS_OPTION_STREAM_END(x)         FIELD_PREP(GENMASK(1, 1), (x))
         |                                                         ^
   drivers/media/platform/chips-media/wave6/wave6-hw.c:789:21: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     789 |         result->ctu_size = DEC_PIC_TYPE_CTU_SIZE(reg_val);
         |                            ^
   drivers/media/platform/chips-media/wave6/wave6-regdefine.h:310:43: note: expanded from macro 'DEC_PIC_TYPE_CTU_SIZE'
     310 | #define         DEC_PIC_TYPE_CTU_SIZE(x)                (16 << FIELD_GET(GENMASK(11, 10), (x)))
         |                                                                ^
   drivers/media/platform/chips-media/wave6/wave6-hw.c:1074:12: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1074 |         reg_val = CREATE_INST_CORE_INFO_CQ_DEPTH(COMMAND_QUEUE_DEPTH) |
         |                   ^
   drivers/media/platform/chips-media/wave6/wave6-regdefine.h:145:44: note: expanded from macro 'CREATE_INST_CORE_INFO_CQ_DEPTH'
     145 | #define         CREATE_INST_CORE_INFO_CQ_DEPTH(x)       FIELD_PREP(GENMASK(10, 8), (x))
         |                                                         ^
   drivers/media/platform/chips-media/wave6/wave6-hw.c:1217:18: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1217 |         reg->src_size = SET_PARAM_SRC_SIZE_HEIGHT(p_enc_info->height) |
         |                         ^
   drivers/media/platform/chips-media/wave6/wave6-regdefine.h:359:40: note: expanded from macro 'SET_PARAM_SRC_SIZE_HEIGHT'
     359 | #define         SET_PARAM_SRC_SIZE_HEIGHT(x)            FIELD_PREP(GENMASK(31, 16), (x))
         |                                                         ^
   drivers/media/platform/chips-media/wave6/wave6-hw.c:1304:13: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1304 |         reg->sps = SET_PARAM_SPS_DEFAULT_SCALING_LIST(p_param->en_scaling_list) |
         |                    ^
   drivers/media/platform/chips-media/wave6/wave6-regdefine.h:363:48: note: expanded from macro 'SET_PARAM_SPS_DEFAULT_SCALING_LIST'
     363 | #define         SET_PARAM_SPS_DEFAULT_SCALING_LIST(x)   FIELD_PREP(GENMASK(31, 31), (x))
         |                                                         ^
   drivers/media/platform/chips-media/wave6/wave6-hw.c:1346:13: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1346 |         reg->sps = SET_PARAM_SPS_DEFAULT_SCALING_LIST(p_param->en_scaling_list) |
         |                    ^
   drivers/media/platform/chips-media/wave6/wave6-regdefine.h:363:48: note: expanded from macro 'SET_PARAM_SPS_DEFAULT_SCALING_LIST'
     363 | #define         SET_PARAM_SPS_DEFAULT_SCALING_LIST(x)   FIELD_PREP(GENMASK(31, 31), (x))
         |                                                         ^
   drivers/media/platform/chips-media/wave6/wave6-hw.c:1594:18: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1594 |         reg->pic_info = SET_FB_PIC_INFO_STRIDE(p_enc_info->stride);
         |                         ^
   drivers/media/platform/chips-media/wave6/wave6-regdefine.h:165:37: note: expanded from macro 'SET_FB_PIC_INFO_STRIDE'
     165 | #define         SET_FB_PIC_INFO_STRIDE(x)               FIELD_PREP(GENMASK(15, 0), (x))
         |                                                         ^
   drivers/media/platform/chips-media/wave6/wave6-hw.c:1953:17: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1953 |         reg->src_fmt = ENC_PIC_SRC_FMT_C_FMT_IDC(c_fmt_idc) |
         |                        ^
   drivers/media/platform/chips-media/wave6/wave6-regdefine.h:542:40: note: expanded from macro 'ENC_PIC_SRC_FMT_C_FMT_IDC'
     542 | #define         ENC_PIC_SRC_FMT_C_FMT_IDC(x)            FIELD_PREP(GENMASK(30, 28), (x))
         |                                                         ^
   15 errors generated.


vim +/FIELD_PREP +131 drivers/media/platform/chips-media/wave6/wave6-vpu.c

   123	
   124	static void wave6_vpu_remap_code_buf(struct wave6_vpu_device *vpu)
   125	{
   126		dma_addr_t code_base = vpu->code_buf.dma_addr;
   127		u32 i, reg_val;
   128	
   129		for (i = 0; i < wave6_vpu_get_code_buf_size(vpu) / W6_MAX_REMAP_PAGE_SIZE; i++) {
   130			reg_val = REMAP_CTRL_ON |
 > 131				  REMAP_CTRL_INDEX(i) |
   132				  REMAP_CTRL_PAGE_SIZE_ON |
   133				  REMAP_CTRL_PAGE_SIZE(W6_MAX_REMAP_PAGE_SIZE);
   134			wave6_vdi_writel(vpu->reg_base, W6_VPU_REMAP_CTRL_GB, reg_val);
   135			wave6_vdi_writel(vpu->reg_base, W6_VPU_REMAP_VADDR_GB,
   136					 i * W6_MAX_REMAP_PAGE_SIZE);
   137			wave6_vdi_writel(vpu->reg_base, W6_VPU_REMAP_PADDR_GB,
   138					 code_base + i * W6_MAX_REMAP_PAGE_SIZE);
   139		}
   140	}
   141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

