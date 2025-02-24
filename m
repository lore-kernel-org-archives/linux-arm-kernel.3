Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FD9C021BB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 15:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fcCw3AeNxiuLROY15i384GckfNTJWyAJWt7jiVXEXzQ=; b=qqWEajnihnRxOfDJJBG6jozCfi
	+hNj9Ui7OQCrzt6WcDfO68VXWz/HtXgGEmfj6DTHPGm4tBtbOlBftchuOa4Gcerlqp2KaZUdHRlkw
	5XGFR1KHqfhL59FMfXGRDQEbp05qWWTXDj6YOcuEkClgHOfTVhvJ0iMUfB4CoD0gOl2NWQbvQ+otZ
	G8N6yMyQnVUiRcO/dVXMFvmuX3RsN73y4DxHyx8tGmZy93jJzVtUwq5rPfpy/KW+/RFuZ+T5kR38m
	Rp9hjMqtcNPLBIOBzad9BMP5gW4aCt2VXRpPeqqJBO5cbw0LtK0AG9zGQd/tcf3QRbAzqvHtAQGe+
	6s0P9pXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmaBw-0000000EFh5-1T8e;
	Mon, 24 Feb 2025 15:16:20 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZss-0000000EBse-0kTJ;
	Mon, 24 Feb 2025 14:56:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740408998; x=1771944998;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kLvQSsfByF9witrbdeJo0ttxnE3VKPGq/3+vWTmXkgc=;
  b=CSoNhnvUb1j1QlIAvBfxwdTIOvrwBTvIUMNnC+0w8R90QA4jqd5d9I0M
   rd9rxCdorz9sR+u7gWmLg+v1g5DZvKmmkOYcMdb2i4tV/dSi/OzbdnPo1
   Lwjj2j9V0AS7Qh68rHgryHd8KyKBXiAZL592zI7B3Volid7gISA2XZbQq
   7vuLO9h1s35pGJj7ZwTyginUkHTeaMrWEOtVFyMkJkQDh+jdNsyNrN4XX
   tGLJTYDZ2S8emYFt9JNHcJw8rQT9VB5x/KZqEp75TKFi70y0edl3kzqxn
   59wnWwFng7UOzOjrTJtRDPyYD2Mxynpes6pzs1+KakwfxmkuVS8bFc4lx
   A==;
X-CSE-ConnectionGUID: 9XbxVSBpTIWnaWJWZQ7sYw==
X-CSE-MsgGUID: XZrGshyNS0G5SpJ5oZswWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="40353115"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="40353115"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 06:56:37 -0800
X-CSE-ConnectionGUID: xQ/AlRxeSYueNaOP2pPq3w==
X-CSE-MsgGUID: xlXwXB39RReif3MX5BGDRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="115873701"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 24 Feb 2025 06:56:29 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmZsh-0008eZ-1E;
	Mon, 24 Feb 2025 14:56:27 +0000
Date: Mon, 24 Feb 2025 22:56:15 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Yan <andyshrk@163.com>, heiko@sntech.de
Cc: oe-kbuild-all@lists.linux.dev, hjc@rock-chips.com, mripard@kernel.org,
	cristian.ciocaltea@collabora.com, neil.armstrong@linaro.org,
	yubing.zhang@rock-chips.com, krzk+dt@kernel.org,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org, robh@kernel.org,
	sebastian.reichel@collabora.com, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH 3/6] drm/rockchip: Add RK3588 DPTX output support
Message-ID: <202502242201.3fE7QpMy-lkp@intel.com>
References: <20250223113036.74252-4-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250223113036.74252-4-andyshrk@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_065638_225611_B6A7B682 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.14-rc4]
[cannot apply to rockchip/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Yan/dt-bindings-display-rockchip-Add-schema-for-RK3588-DPTX-Controller/20250223-193323
base:   linus/master
patch link:    https://lore.kernel.org/r/20250223113036.74252-4-andyshrk%40163.com
patch subject: [PATCH 3/6] drm/rockchip: Add RK3588 DPTX output support
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20250224/202502242201.3fE7QpMy-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250224/202502242201.3fE7QpMy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502242201.3fE7QpMy-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "dw_dp_bind" [drivers/gpu/drm/rockchip/rockchipdrm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

