Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E51E606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 09:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LYsTG5Jx;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GXtbYwJO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9dTvHmvExgXL4658zs3vpBdkxj2etJxtu77jFSpqQsE=; b=LYsTG5Jx2+ayekFNNOes0/BoXa
	P24mzVtmy5fzYifPzPfPxIbXLNi+5VsQPJQLM9+shMxjS5ZViwcCdNTgEuqWCaufANqdU1NRCcr+t
	uU35bR38XdQz97T/uc9Uq4GkjscDHuvrKJHl4KloqhrKrXkfaA/Dv7P9ip669XvBS6HD+g9YWxBxd
	CAuxs9G3HxUvvavXiAH1t6E/V+iA2dXSthGevRo0jYe01x/LwkzwVqXG6Qtmpx5bRroLpviGTMn0+
	R8ZvJcZKfdx3t2rKbuJRUN/Svj19a20YQBCbmFsqsbdAQphU8GOAwmxIbfsT00tQ/QgobnYHdaqgb
	XlG5dhfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMivt-0000000BFGA-0Kan;
	Fri, 30 Oct 2026 09:29:57 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMivp-0000000BFEl-3Pfu;
	Fri, 30 Oct 2026 09:29:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793352594; x=1824888594;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EMqMfThf7wBi+xqcGlz73yvEPZiRd9YLlzGUba045ok=;
  b=GXtbYwJOTtOkFP4yS4lLVkGSK86FzzFoIZxfbZgwgMJzNhei3MBg30Mn
   uBKXbfeV0gMI5uEK2yxkLi+/MN7agJp/t09ESwHa4VkYJMFEYeyOo3FL2
   DCD3AaGoyFdsaU1DbXOZ22nYgcie6W/4yULbo8sRh035LnvR+mcLN2Lvj
   245dZBgXOT8O+Nb99xSn+6zm5//ZMkc9RPT10q+it2OyqSfXuXhJdp/PZ
   8StlX1oLcbdGfrcYZR5DlKSZARvUJbpvg5fwgKHM7oIBm7Hf0hD4dEfi7
   hHfAVNi8ONB5PQQIn5hJn7Zo/yGbTM1/m6YP2o8gcxnRoURoteTpp6uWs
   w==;
X-CSE-ConnectionGUID: lQ0Z6qmLSlqkl3nqRYY8SQ==
X-CSE-MsgGUID: MwSYXqqmQdKR0DQjdkfQTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2126347"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2126347"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 02:29:52 -0700
X-CSE-ConnectionGUID: A1XjQrnCRSGV8+6OT8/tjQ==
X-CSE-MsgGUID: G8pzq4FHSjeDHRV7HzC5bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5517732"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 Oct 2026 02:29:49 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMivh-00000000bXI-1r9z;
	Fri, 30 Oct 2026 09:29:45 +0000
Date: Fri, 30 Oct 2026 17:29:37 +0800
From: kernel test robot <lkp@intel.com>
To: Chaoyi Chen <kernel@airkyi.com>, Sandy Huang <hjc@rock-chips.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Andy Yan <andyshrk@163.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v2 1/3] drm/rockchip: vop2: Use
 drm_format_info_min_pitch() for plane offsets
Message-ID: <202610301711.Dm8BmGiV-lkp@intel.com>
References: <20261029081429.862-2-kernel@airkyi.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029081429.862-2-kernel@airkyi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_022953_889924_25831D50 
X-CRM114-Status: GOOD (  10.22  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Chaoyi,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on rockchip/for-next linus/master v7.3 next-20261029]
[cannot apply to linux-review/Chaoyi-Chen/drm-rockchip-vop2-Use-drm_format_info_min_pitch-for-plane-offsets/20261022-151735]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chaoyi-Chen/drm-rockchip-vop2-Use-drm_format_info_min_pitch-for-plane-offsets/20261029-161427
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20261029081429.862-2-kernel%40airkyi.com
patch subject: [PATCH v2 1/3] drm/rockchip: vop2: Use drm_format_info_min_pitch() for plane offsets
config: hexagon-randconfig-1001-20261030 (https://download.01.org/0day-ci/archive/20261030/202610301711.Dm8BmGiV-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c2ea4440d4b64c148de4fdfca1fc2c437a0701e4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261030/202610301711.Dm8BmGiV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610301711.Dm8BmGiV-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: drivers/gpu/drm/rockchip/rockchipdrm.ko: symbol '__hexagon_udivdi3' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

