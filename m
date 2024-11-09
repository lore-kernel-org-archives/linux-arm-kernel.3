Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 266BCD5E386
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 22:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oVUvp6bF0WgH9mrjju9k6lFGR8fOtT651gPTln7646k=; b=BupojZXcTf1UF2ZeRyo0t6rXeI
	45wSG1EU2ejMxbBzoJJyv1XW11m1cEjNyYHdhKjRYbCStiLCpj9A4lOeIA+gi91vcWKxqiR5U7cMh
	gWw5tR6WpGixWIYzByOCad5aoeC6XmLH88Kh5k9NRVhoQAuM7rXpk40IoWX2ns9Yeq+5gbnkr05Jk
	iXAFKpTI1wW0NvJwy3QqkywlcgfZkOL/YRlp0tUwKfP5eXZgu0CzIZ42cCAIXfXKB8G1DEsqO4n7J
	H8zFe6xFHzLD7fyUpQYwRWw6qL8pPCGlathO9a3SBj/9mEfzdbJJ0vMHsOiGS7HTw0qexJqkxzMHm
	SV8W63Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9uEV-0000000E4LJ-1sm8;
	Sat, 09 Nov 2024 22:47:07 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9uCj-0000000E4Cr-1xvV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 22:45:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731192317; x=1762728317;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7mZVdy4HvTPq5DFlYE3+ppI/UE45cLaflLdyjAdTgGM=;
  b=PAvxjxm+c1CTzyWzZBJYThtCvdBOgGHfixA2V8vqlhkvmfy1aR8HHZBg
   i8roRQIziXYOlEHwsTzwvhXwHnCGjIEHdiDLXMBVEk1flnqwkHsjM/6/U
   hZwqFDSmcLS+lcLuyUuDf5H0serd8gtrh2UP6g/faIgVFqXRE4jvICN69
   Gwdk9iw0jn+Ndl9Pv5kFXfMl565Yi4bGn8C7z5us2G1AqPBu7T44xZe7L
   I2aRX5nmQAAgxpRSGKxzIVEtHTNyUX0K2YGj2XoKQ076pXgVECfbCTFQe
   vpZq58tDdMlaa6gn5qfB+PT6kHG3o3LBN8QviNR78f3W397dCEkStib+2
   w==;
X-CSE-ConnectionGUID: yEXXqYhlSnGCe8OprZduRQ==
X-CSE-MsgGUID: PVT9R/qNREW5taat7Zim5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11251"; a="30446919"
X-IronPort-AV: E=Sophos;i="6.12,142,1728975600"; 
   d="scan'208";a="30446919"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 14:45:09 -0800
X-CSE-ConnectionGUID: 9EXFqZK0SOSAAMztvcJVtg==
X-CSE-MsgGUID: jlVcUIPeQmG/SAB0UbUEUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,142,1728975600"; 
   d="scan'208";a="91267949"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Nov 2024 14:45:04 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9uCT-000sk6-2X;
	Sat, 09 Nov 2024 22:45:01 +0000
Date: Sun, 10 Nov 2024 06:44:27 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 3/7] drm/vc4: use drm_hdmi_connector_mode_valid()
Message-ID: <202411100659.T6WKBFbI-lkp@intel.com>
References: <20241109-hdmi-mode-valid-v3-3-5348c2368076@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241109-hdmi-mode-valid-v3-3-5348c2368076@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_144517_529992_297ACD25 
X-CRM114-Status: GOOD (  12.08  )
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

[auto build test ERROR on 929beafbe7acce3267c06115e13e03ff6e50548a]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/drm-display-hdmi-add-generic-mode_valid-helper/20241109-203557
base:   929beafbe7acce3267c06115e13e03ff6e50548a
patch link:    https://lore.kernel.org/r/20241109-hdmi-mode-valid-v3-3-5348c2368076%40linaro.org
patch subject: [PATCH v3 3/7] drm/vc4: use drm_hdmi_connector_mode_valid()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241110/202411100659.T6WKBFbI-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241110/202411100659.T6WKBFbI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411100659.T6WKBFbI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/vc4/vc4_hdmi.c:37:
   In file included from include/drm/drm_atomic_helper.h:31:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/vc4/vc4_hdmi.c:1762:61: error: passing 'const struct drm_display_mode *' to parameter of type 'struct drm_display_mode *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
    1762 |         return drm_hdmi_connector_mode_valid(&vc4_hdmi->connector, mode);
         |                                                                    ^~~~
   include/drm/display/drm_hdmi_state_helper.h:25:35: note: passing argument to parameter 'mode' here
      25 |                               struct drm_display_mode *mode);
         |                                                        ^
   4 warnings and 1 error generated.


vim +1762 drivers/gpu/drm/vc4/vc4_hdmi.c

  1749	
  1750	static enum drm_mode_status
  1751	vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
  1752				    const struct drm_display_mode *mode)
  1753	{
  1754		struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
  1755	
  1756		if (vc4_hdmi->variant->unsupported_odd_h_timings &&
  1757		    !(mode->flags & DRM_MODE_FLAG_DBLCLK) &&
  1758		    ((mode->hdisplay % 2) || (mode->hsync_start % 2) ||
  1759		     (mode->hsync_end % 2) || (mode->htotal % 2)))
  1760			return MODE_H_ILLEGAL;
  1761	
> 1762		return drm_hdmi_connector_mode_valid(&vc4_hdmi->connector, mode);
  1763	}
  1764	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

