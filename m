Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E42C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 10:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Gq4nGFZNJTZzYkHkDkUH8PNArTDwSYGDJlgALG0NWE=; b=uShDeoekTqGdimxhwUTA2Cdc+p
	E4U6MYyF31kOotPI5s6mIRxgpiqYHJzZtdSc58q/nVxtIyBhaRP8JCzkoWcuW36oZJiDxgvR1OnLA
	UssG9cuO32+H3IJzqKJS5ZLk1RYnee6UU2NXPfVwZjPXl/BDqbRXh3SIsDpueyDMORSBokR44tnE8
	g0jkepNLsOSvdhG5Rz8osL3LQYcAp9I0uPClCs2RlztDAZxjz4aWInNR4qPZEd2ekR0KBjV+E1dkq
	CsX6/bl4TIY/+Z1IL5C7coi0VgOvNwF9vFYnm9QYWntsb/O5Yk34FsJRXCsjvJQv3S95Dxb7jUGMc
	opOQP6Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDL63-00000003IQ1-0Ynt;
	Fri, 09 May 2025 10:36:51 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDKB5-0000000381b-2alJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 09:38:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746783479; x=1778319479;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xyOJtjUQ7Rqu2zBQdpb/wjJlsQkJeZeAW3fBuv8lBKE=;
  b=Dm1wrr3V2IEeWqiD7qlZQ4aFk5/7rprqD+sGU6+N8282o4OulqbdGIb0
   mEkkxVv4Mn2iR21KIpxcKOEknoZfLR6EJxso6s9psq90pKQimdcF4zd+0
   5nyQHgH7/g8vT6z9VmzhmwkjMFWqiDL0cG+XSgQaXNo/8Xk/71v0BWyi+
   t93d9mv0gxVoEFy6CY+b6Ag/dMS5pja9W+45ksEizbxWx27dXwJ7E6T2G
   0jutZM+fP6W0+r6bcoZwYbR/oBBRBpdPBAH00BY1mtaNMBeADhUzkCRsE
   LLvEFVmNrSKCIzidy3d9PvwXUlZ9a5ZdaICMnj9CubDg6+nDqAidgtweP
   g==;
X-CSE-ConnectionGUID: ka6fBBjkSLiuDfRRLepO2g==
X-CSE-MsgGUID: 8UAiNA+dQ+CjrsNCvJ2QdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59268811"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="59268811"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 02:37:56 -0700
X-CSE-ConnectionGUID: FcjoOz+LTqGzJSCXcsQPZw==
X-CSE-MsgGUID: LKHV/WWIQpqqcqFe3yg6Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="136959749"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 May 2025 02:37:51 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDKAv-000BsL-18;
	Fri, 09 May 2025 09:37:49 +0000
Date: Fri, 9 May 2025 17:37:41 +0800
From: kernel test robot <lkp@intel.com>
To: ming.qian@oss.nxp.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl
Cc: oe-kbuild-all@lists.linux.dev, nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-imx@nxp.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] media: amphion: Add H264 and HEVC profile and level
 control
Message-ID: <202505091722.oiKjnVNJ-lkp@intel.com>
References: <20250508053304.2057-1-ming.qian@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508053304.2057-1-ming.qian@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_023759_670500_485A6034 
X-CRM114-Status: GOOD (  10.99  )
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

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on b64b134942c8cf4801ea288b3fd38b509aedec21]

url:    https://github.com/intel-lab-lkp/linux/commits/ming-qian-oss-nxp-com/media-amphion-Add-H264-and-HEVC-profile-and-level-control/20250508-133520
base:   b64b134942c8cf4801ea288b3fd38b509aedec21
patch link:    https://lore.kernel.org/r/20250508053304.2057-1-ming.qian%40oss.nxp.com
patch subject: [PATCH v3] media: amphion: Add H264 and HEVC profile and level control
config: x86_64-buildonly-randconfig-001-20250509 (https://download.01.org/0day-ci/archive/20250509/202505091722.oiKjnVNJ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505091722.oiKjnVNJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505091722.oiKjnVNJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/amphion/vpu_color.c:17:
>> drivers/media/platform/amphion/vpu_helpers.h:74:38: warning: 'struct vpu_dec_codec_info' declared inside parameter list will not be visible outside of this definition or declaration
      74 | u32 vpu_get_h264_v4l2_profile(struct vpu_dec_codec_info *hdr);
         |                                      ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/amphion/vpu_helpers.h:75:36: warning: 'struct vpu_dec_codec_info' declared inside parameter list will not be visible outside of this definition or declaration
      75 | u32 vpu_get_h264_v4l2_level(struct vpu_dec_codec_info *hdr);
         |                                    ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/amphion/vpu_helpers.h:76:38: warning: 'struct vpu_dec_codec_info' declared inside parameter list will not be visible outside of this definition or declaration
      76 | u32 vpu_get_hevc_v4l2_profile(struct vpu_dec_codec_info *hdr);
         |                                      ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/amphion/vpu_helpers.h:77:36: warning: 'struct vpu_dec_codec_info' declared inside parameter list will not be visible outside of this definition or declaration
      77 | u32 vpu_get_hevc_v4l2_level(struct vpu_dec_codec_info *hdr);
         |                                    ^~~~~~~~~~~~~~~~~~


vim +74 drivers/media/platform/amphion/vpu_helpers.h

    73	
  > 74	u32 vpu_get_h264_v4l2_profile(struct vpu_dec_codec_info *hdr);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

