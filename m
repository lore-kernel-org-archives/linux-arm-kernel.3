Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D24CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Sep 2025 12:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UsESWwnwp015hRUHy0tyfeYRri9Veb0bA0cwbwBzOD4=; b=25jzH4bNoLyX6tIYi6JHofik0x
	ChEP3shy29QpoIDGrg66c+bB5XHr3NY7LqBTIYvRYjHJj7CiTzPGf6Z10x7BT+EAhpFiFp0nfOwpC
	/a+N0xtGCtgP70XdPHR8y8Ynl8OOPR5xdBYnSbwdptW9DcPqtKTNKDrTgY5gwUl7MadpFX4vAuHRV
	bNFj/UT0lqMjLI1wjK3gBwLXdGupqrPCuHX8Y8dI6yU/q3OAgZ9/6vBtCZxesK+onFLFUGuCW5hSM
	jc2pD91lQgM0SxqU6scw9M+JexnXIh/nY6+w8HSdErX0DwVZjb1uQKMPBs5wQrgKbpgt85ZeShPUz
	xtUBCdyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2UM5-00000009mcM-0rSU;
	Sat, 27 Sep 2025 12:48:49 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2UM3-00000009mbB-1bUp;
	Sat, 27 Sep 2025 12:48:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758977327; x=1790513327;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0W45DesrwvOL7dwAbK4Wk7k7PmMheNSI1z8Zd+4XNIw=;
  b=MILHCeOzXJ2wuvHHzEi4M7vNrEv6fqI3D7w3cb25fvmIwkkcjuKOmEgS
   5IXkOklmy28bB2yxhHYkAMqLDOiCkE0w86ispFEbKrT+cCjygymj53Mh4
   dR9Z8OBhjBBHhdJRYf48nBHT4VC0Olt6Qu6e7t3kXYWZdupO0Xppt38+j
   Bj3dMlxuqTVhM1Ruyuw5RGpirodfJ+BiSpJwp1FqgBIjJNv3F/pG42VQJ
   l9nD/gF5gFRE/VlMs52746UBWnEmCG6/Ujqp6q79w4Ej8ILKDFa6WHl2x
   04CW5HjG3410bErfNDzN6zzJRM5pMDtHalJXjk86C6g4v7NYn9bNTzZiB
   A==;
X-CSE-ConnectionGUID: IchtO2O4QXaZY+e6pg8d+w==
X-CSE-MsgGUID: Idcy6ueJTLG2FYN1F2oTKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="86734725"
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; 
   d="scan'208";a="86734725"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2025 05:48:45 -0700
X-CSE-ConnectionGUID: EtxiiekZTFm3ZEexcFIrlg==
X-CSE-MsgGUID: PAlpPQWsRdGdV4Lp7P0oNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; 
   d="scan'208";a="208568713"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 27 Sep 2025 05:48:38 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2ULr-00073X-2Y;
	Sat, 27 Sep 2025 12:48:35 +0000
Date: Sat, 27 Sep 2025 20:48:05 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Liu Ying <victor.liu@nxp.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/9] drm/display: hdmi-state-helpers: warn on unsupported
 InfoFrame types
Message-ID: <202509272013.GAc17rsa-lkp@intel.com>
References: <20250927-limit-infoframes-2-v1-1-697511bd050b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250927-limit-infoframes-2-v1-1-697511bd050b@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_054847_437244_58D937D1 
X-CRM114-Status: GOOD (  10.22  )
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

Hi Dmitry,

kernel test robot noticed the following build errors:

[auto build test ERROR on bf2602a3cb2381fb1a04bf1c39a290518d2538d1]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/drm-display-hdmi-state-helpers-warn-on-unsupported-InfoFrame-types/20250927-090630
base:   bf2602a3cb2381fb1a04bf1c39a290518d2538d1
patch link:    https://lore.kernel.org/r/20250927-limit-infoframes-2-v1-1-697511bd050b%40oss.qualcomm.com
patch subject: [PATCH 1/9] drm/display: hdmi-state-helpers: warn on unsupported InfoFrame types
config: x86_64-buildonly-randconfig-002-20250927 (https://download.01.org/0day-ci/archive/20250927/202509272013.GAc17rsa-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250927/202509272013.GAc17rsa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509272013.GAc17rsa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/display/drm_hdmi_state_helper.c:924:17: error: use of undeclared identifier 'it'
     924 |                 dev_warn_once(it->dev, "unsupported HDMI infoframe 0x%x\n", frame->any.type);
         |                               ^
>> drivers/gpu/drm/display/drm_hdmi_state_helper.c:924:63: error: use of undeclared identifier 'frame'
     924 |                 dev_warn_once(it->dev, "unsupported HDMI infoframe 0x%x\n", frame->any.type);
         |                                                                             ^
   drivers/gpu/drm/display/drm_hdmi_state_helper.c:953:17: error: use of undeclared identifier 'it'
     953 |                 dev_warn_once(it->dev, "unsupported HDMI infoframe 0x%x\n", frame->any.type);
         |                               ^
   3 errors generated.


vim +/it +924 drivers/gpu/drm/display/drm_hdmi_state_helper.c

   916	
   917	static int clear_infoframe(struct drm_connector *connector,
   918				   struct drm_connector_hdmi_infoframe *old_frame)
   919	{
   920		int ret;
   921	
   922		ret = clear_device_infoframe(connector, old_frame->data.any.type);
   923		if (ret == -EOPNOTSUPP)
 > 924			dev_warn_once(it->dev, "unsupported HDMI infoframe 0x%x\n", frame->any.type);
   925		if (ret)
   926			return ret;
   927	
   928		return 0;
   929	}
   930	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

