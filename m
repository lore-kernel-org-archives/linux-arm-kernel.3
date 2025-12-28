Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEBF3E784BE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 07:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JlI44dvrPAoqtIQY7DypRGNBi4+gn2YBqzltgHxTwaU=; b=m1FA1/HUnGLsS9agWNDZ57Gido
	x3XVKJdAkapiSQweYZ4pCwWQzUCWlPS7uCebO/xAm64pRE6Io0df8K3Q1MRGis8AxJhXRJmfqix2R
	w5jrtrDxMmAX3Fyc1YKTA0qwn0SkS8tkkEUl+ggJ36WfROhS+LC4b2Px8K83r0273G9ajIjweL+XP
	pocI6aXL6h1c4vmG7oFhEA4QhW7gFp2uCW7sUc3CrBF4iju3tiN4/GYDp+GDRUYV96i+7YE1HY9J+
	rZTgUJjghJOY6bi7fWhrjJKqYwHxwXPCHp0NaDuCGuls6W+PeXMYCip8rPO8EuVUkg+d+h5oH9J6I
	Y6n1QYDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZlag-00000002aG0-1wcW;
	Sun, 28 Dec 2025 07:53:26 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZlad-00000002aFQ-0WNA;
	Sun, 28 Dec 2025 07:53:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766908403; x=1798444403;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/NwBfCj//7UaV/4OmePD5UbzYZj1ijABh9/72JuycQ0=;
  b=Vxz3ayRPUOT8OiqUtcrQI5FFMR8MZWbpudlIsOKPycyd0ddy+n/H+gWH
   TPq6Mf/0BxZZx8dpIGGSzISO2VzteVGFYZlvU5m31gzbk9Y3r3xYi7C6l
   hiDJsbrNcGvJuLPHg6k103E0h9tJmIMpv42S6tFxF0rmqeM7aAayP4nUx
   nTy25TM6NZ6HbJvl7GumHfb3C/eoPnMPPj7o9JEdyhtPpS4YeM0innU7H
   bF3OvKGe5dw9m7387uKbxdiSe8P+gCGmsegwK+rwL4vkxhQnc7idKP9HL
   HcgwCdndKyp9VY8OCDY0fOPRBeZUB4KMDPwhzzR+DIZJ14GUMX0uR00nS
   g==;
X-CSE-ConnectionGUID: fyyQpdpoTGunorm+c74lYQ==
X-CSE-MsgGUID: Ah5sKifvStqCIgFggDZEJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="67766518"
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="67766518"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 23:53:22 -0800
X-CSE-ConnectionGUID: UEa8u94KT2q2ofB0p56tVw==
X-CSE-MsgGUID: kE97tfBeR5Knrr2ku/cjWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="205715352"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 27 Dec 2025 23:53:16 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZlaT-000000006Kr-3CZq;
	Sun, 28 Dec 2025 07:53:13 +0000
Date: Sun, 28 Dec 2025 15:52:27 +0800
From: kernel test robot <lkp@intel.com>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, Yunke Cao <yunkec@google.com>,
	Hans de Goede <hansg@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Pavan Bobba <opensource206@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	James Cowgill <james.cowgill@blaize.com>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	Jonas Karlman <jonas@kwiboo.se>,
	Diederik de Haas <didi.debian@cknow.org>
Subject: Re: [PATCH v7 14/17] media: rkvdec: Add H264 support for the VDPU381
 variant
Message-ID: <202512281536.56iWFq03-lkp@intel.com>
References: <20251218232829.337811-15-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218232829.337811-15-detlev.casanova@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_235323_240126_9A8996A5 
X-CRM114-Status: GOOD (  10.21  )
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

[auto build test ERROR on media-tree/master]
[also build test ERROR on linus/master v6.19-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Detlev-Casanova/media-uapi-HEVC-Add-v4l2_ctrl_hevc_ext_sps_-ls-t_rps-controls/20251219-074342
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20251218232829.337811-15-detlev.casanova%40collabora.com
patch subject: [PATCH v7 14/17] media: rkvdec: Add H264 support for the VDPU381 variant
config: arm-randconfig-r071-20251224 (https://download.01.org/0day-ci/archive/20251228/202512281536.56iWFq03-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251228/202512281536.56iWFq03-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512281536.56iWFq03-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__aeabi_uldivmod" [drivers/media/platform/rockchip/rkvdec/rockchip-vdec.ko] undefined!
>> ERROR: modpost: "__aeabi_ldivmod" [drivers/media/platform/rockchip/rkvdec/rockchip-vdec.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

