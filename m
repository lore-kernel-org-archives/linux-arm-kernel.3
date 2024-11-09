Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E8BD5E380
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 20:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A5hgD70qCUQr3rY/Gjv2rs9P2mrvhJe4sfaMEWTv73s=; b=RB2jKbn04cKi3qQIBl5DZFAYiu
	6ETLm7wQDO/m1AEGOpvQJzMwIbXMyEUS6RUCHxaRqf4lgiYtz6gDlMaRBcfMbzuz00KoLTR8V0jwo
	FnaGSI3n/RaD9+DN8AFyz5Nmi6e/0hbaDH/1Qy1RsbaoOmZgXlRRvsoFUhehSp/fUJR7h1lUoRUnV
	k+Fp6P3SkZsYj+StWz2naFEQGCsdcDl3SaETYzDQQfUT3Ev4UKM3WReE0yzW/wcUXc+QjJNCiSIHm
	tgC7B4n3I+S3ke7OUaeiwJhaJecqSmwsoysWZfWA/Q1ZS7I9UBjUHZJpth2I1/SoZ3FGYoLPwS4Iq
	x2vKXuOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9s8d-0000000DwIN-2Y6P;
	Sat, 09 Nov 2024 20:32:55 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9s6s-0000000DwAb-1sUg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 20:31:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731184266; x=1762720266;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lwc+6sp3mcJ5Ad0yQLyDMLqBIcNpYLMMzahip6ZIWmI=;
  b=TmeoMros/AU+v5uLUFNvHtpzx9Urj56oDBHVXh86nbhDY6cNVJoHCW18
   v2VVq9Jl0N/dinlMDB/qlfD8Qel1MeM8sYN2lIzZ+0dL914qFm4fv3/yg
   WqfTOgFd4pO5CKrttMcqBD6b1PRzDKtuvARlz3lyM9OERisyAIRqvcTqG
   On2SFFH87j4owphhDqgTq94WQJG/KdN+4utGL8QbOBinzuLPSpsi5Mmk0
   PL3ufZBv+ijeaIpQuHyGoTLuUChpxlx3DvIgNqf4eNii5mr04Drh7UCi+
   Q6gB+urF7rLPSNQtnbrzksQfUnOyCDq2ogKFCj6cXIfdfpEdBhh26ygSb
   w==;
X-CSE-ConnectionGUID: Ba51Nlz5ROiUB/yUUseNrA==
X-CSE-MsgGUID: uBL/fWscQs6brRTBqd9BSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11251"; a="31146954"
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; 
   d="scan'208";a="31146954"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 12:31:03 -0800
X-CSE-ConnectionGUID: SqYXoFcpRpS+1UQ6kzFulw==
X-CSE-MsgGUID: gbPkTUaOTr+b6WNW2HVVlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="91027501"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Nov 2024 12:30:58 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9s6i-000sby-0c;
	Sat, 09 Nov 2024 20:30:56 +0000
Date: Sun, 10 Nov 2024 04:29:58 +0800
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
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 3/7] drm/vc4: use drm_hdmi_connector_mode_valid()
Message-ID: <202411100456.0JcsAx2b-lkp@intel.com>
References: <20241109-hdmi-mode-valid-v3-3-5348c2368076@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241109-hdmi-mode-valid-v3-3-5348c2368076@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_123106_520532_9C08D2B1 
X-CRM114-Status: GOOD (  13.16  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on 929beafbe7acce3267c06115e13e03ff6e50548a]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/drm-display-hdmi-add-generic-mode_valid-helper/20241109-203557
base:   929beafbe7acce3267c06115e13e03ff6e50548a
patch link:    https://lore.kernel.org/r/20241109-hdmi-mode-valid-v3-3-5348c2368076%40linaro.org
patch subject: [PATCH v3 3/7] drm/vc4: use drm_hdmi_connector_mode_valid()
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241110/202411100456.0JcsAx2b-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241110/202411100456.0JcsAx2b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411100456.0JcsAx2b-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/vc4/vc4_hdmi.c: In function 'vc4_hdmi_encoder_mode_valid':
>> drivers/gpu/drm/vc4/vc4_hdmi.c:1762:68: warning: passing argument 2 of 'drm_hdmi_connector_mode_valid' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    1762 |         return drm_hdmi_connector_mode_valid(&vc4_hdmi->connector, mode);
         |                                                                    ^~~~
   In file included from drivers/gpu/drm/vc4/vc4_hdmi.c:35:
   include/drm/display/drm_hdmi_state_helper.h:25:56: note: expected 'struct drm_display_mode *' but argument is of type 'const struct drm_display_mode *'
      25 |                               struct drm_display_mode *mode);
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~


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

