Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69ED3C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 17:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/kI0MeCwDvYv0Wh30GWoZdjCYcRbXpo9EtHLGZXTJag=; b=MCu8dhz9kjJwFfSsAkrDaHZJJz
	wjquRfo1IT5aMCf9vEz79iHCLECSflJzH8BTuM8gqvvFxuxS2jkAedb3zYGncbvjre2U8YN5yC88s
	2xu5zYSDqWHHLUji1miXk1oHjocCcYbWuQplYLzxRIW8L0IGlc3/SQPjrwlQxlebbj7gJGZkikKHi
	UVTEd1o3JxOtjO+Zqv2iIaB25EPCW/L5R1qGTHWaja5DC0/T4kdXnH9D2XG6h3bmstZWjl5PhG1ij
	IybwX2C3zzyzVwKnAElJRk1jtmTUQ+0p/5x5RXIzsTmx1I7Dlqv0qg2Gz4ht0rytdUuW5fRAWtEhl
	Sp27l1Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thtco-00000004bg1-2Vcl;
	Tue, 11 Feb 2025 17:00:42 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thtNH-00000004ZNT-01as
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 16:44:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739292279; x=1770828279;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5rJQAJq527Lk85pSJ91MPUwDf6CsxpOeMkQW2gyUeH8=;
  b=aOtIIDgqrdCuLZCufWgU79gqbP/J8iKu9XROG4ER6S4fUxzgVO9NUhyU
   5H7MKAlqyCjUw4gM7k7eKN4qENzu4ER83Y8bNne+jpYLliUZnlTqVUt3n
   8RkhrlQQ4uLAm+mXasu0kUOBl6TiDZsm41mrdQa+Y4TXF5RPBE0fg7sry
   aPL97mmKRLUDzB+oR0JI+fBkWk26rOHpUs1w5fEG19rEZ94niuCbw9e3F
   Yqz7S+BE0lnohk9sjasupN1gYltt9CTJ/aO8gvvwXepMTRoAuiYzTSIiw
   doE8+doUqLmYwEGcLTT2q8/SGl4WZpFzYBFlmt9VsdOURYPbwPObE+rIX
   Q==;
X-CSE-ConnectionGUID: EeEaQFeOQESxR6QMiZymWA==
X-CSE-MsgGUID: wDVxlr1vS4uIOKeixymHLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="65276379"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="65276379"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 08:44:38 -0800
X-CSE-ConnectionGUID: +zJ1WdFLSeeeU8elakmM8g==
X-CSE-MsgGUID: 8vGt2TkySjyr0vt7tUOPfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="117486346"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Feb 2025 08:44:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thtNA-0014SJ-0u;
	Tue, 11 Feb 2025 16:44:32 +0000
Date: Wed, 12 Feb 2025 00:43:41 +0800
From: kernel test robot <lkp@intel.com>
To: Nas Chung <nas.chung@chipsnmedia.com>, mchehab@kernel.org,
	hverkuil@xs4all.nl, sebastian.fricke@collabora.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
	jackson.lee@chipsnmedia.com, lafley.kim@chipsnmedia.com,
	Nas Chung <nas.chung@chipsnmedia.com>
Subject: Re: [PATCH 8/8] media: chips-media: wave6: Improve debugging
 capabilities
Message-ID: <202502120017.COEwtixF-lkp@intel.com>
References: <20250210090725.4580-9-nas.chung@chipsnmedia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210090725.4580-9-nas.chung@chipsnmedia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_084439_087078_48E0E509 
X-CRM114-Status: GOOD (  12.25  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on linuxtv-media-pending/master]
[also build test WARNING on arm64/for-next/core robh/for-next linus/master v6.14-rc2 next-20250210]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nas-Chung/media-platform-chips-media-wave5-Rename-Kconfig-parameter/20250210-171144
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20250210090725.4580-9-nas.chung%40chipsnmedia.com
patch subject: [PATCH 8/8] media: chips-media: wave6: Improve debugging capabilities
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20250212/202502120017.COEwtixF-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502120017.COEwtixF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502120017.COEwtixF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c: In function 'wave6_vpu_dec_handle_dst_buffer':
>> drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c:261:13: warning: variable 'buf_size' set but not used [-Wunused-but-set-variable]
     261 |         u32 buf_size;
         |             ^~~~~~~~
--
   drivers/media/platform/chips-media/wave6/wave6-hw.c: In function 'wave6_vpu_dec_flush':
>> drivers/media/platform/chips-media/wave6/wave6-hw.c:1022:37: warning: variable 'fb' set but not used [-Wunused-but-set-variable]
    1022 |                 struct frame_buffer fb;
         |                                     ^~


vim +/buf_size +261 drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c

de204321b54004 Nas Chung 2025-02-10  254  
de204321b54004 Nas Chung 2025-02-10  255  static void wave6_vpu_dec_handle_dst_buffer(struct vpu_instance *inst)
de204321b54004 Nas Chung 2025-02-10  256  {
de204321b54004 Nas Chung 2025-02-10  257  	struct vb2_v4l2_buffer *dst_buf;
de204321b54004 Nas Chung 2025-02-10  258  	struct v4l2_m2m_buffer *v4l2_m2m_buf;
de204321b54004 Nas Chung 2025-02-10  259  	struct vpu_buffer *vpu_buf;
de204321b54004 Nas Chung 2025-02-10  260  	dma_addr_t buf_addr_y, buf_addr_cb, buf_addr_cr;
de204321b54004 Nas Chung 2025-02-10 @261  	u32 buf_size;
de204321b54004 Nas Chung 2025-02-10  262  	u32 fb_stride = inst->dst_fmt.plane_fmt[0].bytesperline;
de204321b54004 Nas Chung 2025-02-10  263  	u32 luma_size = fb_stride * inst->dst_fmt.height;
de204321b54004 Nas Chung 2025-02-10  264  	u32 chroma_size = (fb_stride / 2) * (inst->dst_fmt.height / 2);
de204321b54004 Nas Chung 2025-02-10  265  	struct frame_buffer disp_buffer = {0};
de204321b54004 Nas Chung 2025-02-10  266  	struct dec_initial_info initial_info = {0};
de204321b54004 Nas Chung 2025-02-10  267  	int consumed_num = wave6_vpu_get_consumed_fb_num(inst);
de204321b54004 Nas Chung 2025-02-10  268  	int ret;
de204321b54004 Nas Chung 2025-02-10  269  
de204321b54004 Nas Chung 2025-02-10  270  	wave6_vpu_dec_give_command(inst, DEC_GET_SEQ_INFO, &initial_info);
de204321b54004 Nas Chung 2025-02-10  271  
de204321b54004 Nas Chung 2025-02-10  272  	v4l2_m2m_for_each_dst_buf(inst->v4l2_fh.m2m_ctx, v4l2_m2m_buf) {
de204321b54004 Nas Chung 2025-02-10  273  		dst_buf = &v4l2_m2m_buf->vb;
de204321b54004 Nas Chung 2025-02-10  274  		vpu_buf = wave6_to_vpu_buf(dst_buf);
de204321b54004 Nas Chung 2025-02-10  275  
de204321b54004 Nas Chung 2025-02-10  276  		if (vpu_buf->consumed)
de204321b54004 Nas Chung 2025-02-10  277  			continue;
de204321b54004 Nas Chung 2025-02-10  278  
de204321b54004 Nas Chung 2025-02-10  279  		if (consumed_num >= WAVE6_MAX_FBS)
de204321b54004 Nas Chung 2025-02-10  280  			break;
de204321b54004 Nas Chung 2025-02-10  281  
de204321b54004 Nas Chung 2025-02-10  282  		if (inst->dst_fmt.num_planes == 1) {
de204321b54004 Nas Chung 2025-02-10  283  			buf_size = vb2_plane_size(&dst_buf->vb2_buf, 0);
de204321b54004 Nas Chung 2025-02-10  284  			buf_addr_y = wave6_get_dma_addr(dst_buf, 0);
de204321b54004 Nas Chung 2025-02-10  285  			buf_addr_cb = buf_addr_y + luma_size;
de204321b54004 Nas Chung 2025-02-10  286  			buf_addr_cr = buf_addr_cb + chroma_size;
de204321b54004 Nas Chung 2025-02-10  287  		} else if (inst->dst_fmt.num_planes == 2) {
de204321b54004 Nas Chung 2025-02-10  288  			buf_size = vb2_plane_size(&dst_buf->vb2_buf, 0) +
de204321b54004 Nas Chung 2025-02-10  289  				   vb2_plane_size(&dst_buf->vb2_buf, 1);
de204321b54004 Nas Chung 2025-02-10  290  			buf_addr_y = wave6_get_dma_addr(dst_buf, 0);
de204321b54004 Nas Chung 2025-02-10  291  			buf_addr_cb = wave6_get_dma_addr(dst_buf, 1);
de204321b54004 Nas Chung 2025-02-10  292  			buf_addr_cr = buf_addr_cb + chroma_size;
de204321b54004 Nas Chung 2025-02-10  293  		} else if (inst->dst_fmt.num_planes == 3) {
de204321b54004 Nas Chung 2025-02-10  294  			buf_size = vb2_plane_size(&dst_buf->vb2_buf, 0) +
de204321b54004 Nas Chung 2025-02-10  295  				   vb2_plane_size(&dst_buf->vb2_buf, 1) +
de204321b54004 Nas Chung 2025-02-10  296  				   vb2_plane_size(&dst_buf->vb2_buf, 2);
de204321b54004 Nas Chung 2025-02-10  297  			buf_addr_y = wave6_get_dma_addr(dst_buf, 0);
de204321b54004 Nas Chung 2025-02-10  298  			buf_addr_cb = wave6_get_dma_addr(dst_buf, 1);
de204321b54004 Nas Chung 2025-02-10  299  			buf_addr_cr = wave6_get_dma_addr(dst_buf, 2);
de204321b54004 Nas Chung 2025-02-10  300  		}
de204321b54004 Nas Chung 2025-02-10  301  		disp_buffer.buf_y = buf_addr_y;
de204321b54004 Nas Chung 2025-02-10  302  		disp_buffer.buf_cb = buf_addr_cb;
de204321b54004 Nas Chung 2025-02-10  303  		disp_buffer.buf_cr = buf_addr_cr;
de204321b54004 Nas Chung 2025-02-10  304  		disp_buffer.width = inst->src_fmt.width;
de204321b54004 Nas Chung 2025-02-10  305  		disp_buffer.height = inst->src_fmt.height;
de204321b54004 Nas Chung 2025-02-10  306  		disp_buffer.stride = fb_stride;
de204321b54004 Nas Chung 2025-02-10  307  		disp_buffer.map_type = LINEAR_FRAME_MAP;
de204321b54004 Nas Chung 2025-02-10  308  		disp_buffer.luma_bitdepth = initial_info.luma_bitdepth;
de204321b54004 Nas Chung 2025-02-10  309  		disp_buffer.chroma_bitdepth = initial_info.chroma_bitdepth;
de204321b54004 Nas Chung 2025-02-10  310  		disp_buffer.chroma_format_idc = initial_info.chroma_format_idc;
de204321b54004 Nas Chung 2025-02-10  311  
de204321b54004 Nas Chung 2025-02-10  312  		ret = wave6_vpu_dec_register_display_buffer_ex(inst, disp_buffer);
de204321b54004 Nas Chung 2025-02-10  313  		if (ret) {
de204321b54004 Nas Chung 2025-02-10  314  			dev_err(inst->dev->dev, "fail register display buffer %d", ret);
de204321b54004 Nas Chung 2025-02-10  315  			break;
de204321b54004 Nas Chung 2025-02-10  316  		}
de204321b54004 Nas Chung 2025-02-10  317  
de204321b54004 Nas Chung 2025-02-10  318  		vpu_buf->consumed = true;
de204321b54004 Nas Chung 2025-02-10  319  		consumed_num++;
de204321b54004 Nas Chung 2025-02-10  320  	}
de204321b54004 Nas Chung 2025-02-10  321  }
de204321b54004 Nas Chung 2025-02-10  322  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

