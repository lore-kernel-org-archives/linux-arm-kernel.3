Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88113D0C601
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 12:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jz4KhIOAyjfj6jjIzN0DBGlJwIdvm5FBAhHUlXxPgTU=; b=hkhRjsd9XE4eYl48c//Lk5k+89
	fxQbSQwNaTmwWmbzip/PDb54dzYSTwaeBMHNcRyJHr8kS4b3fR5NFp4r4LpJGmn8dq5/igas3Z4xr
	3dp5FVcdSJjTcyk5cCBOvPA6ZSfvPKood5cp1nORm7EXT0gyfgx9TKhT6fyVzpC15J+14F7eOJwcc
	uQh79z4OER5Lkwo0zrAkJO2SRZjNpK/8aKW0tpkOlRvlI+HA9dT23fXSs+hYEk0B5AszlzYw9KaeV
	RSmTnqud4CtRWd1F2CkaipH9v48rvgXynASLLcj16uqTva7V7v9JlmVAnSbJXNijcJsbuwcD3YB0h
	tn2+Zbvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4JCW-00000003cHQ-1UBO;
	Fri, 25 Oct 2024 12:13:56 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4J8s-00000003bxA-2hHY;
	Fri, 25 Oct 2024 12:10:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729858211; x=1761394211;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a0NkGOWfPXvuC0pRrY2V1xNhHthWDgHcKYifaYQcMuI=;
  b=grndIlirvwmJWQAfbj0CBCEvDKEt2cRMzFOmud3jEV+/q3q6JNn3tedq
   YAUT+KvT4A80W6gqhuJ1+sPOj4u44TKBL8eMV1QrjUq7ipz4IKzEiJzFK
   2Xbp9miwo1fprcOd8tllz0202o+r6DBoy5jcNERIs3yXOYo2W50y1eXGM
   1hM5RwysnEzDj99nt/gw40PhO7JLp2zHuRy2jFowL5LQo6NamvtXr2C1G
   JsZ/a32s4nERx/6npfu3lUBW9lEmSBHelAeit0YKvBnihrQphf0sYNVyl
   wIH3xXHdMLQLnyQq3fHc/FluqnzI9CRj/zAuuRAMiI4yWtHrMAWL9Nprm
   g==;
X-CSE-ConnectionGUID: ubzR/FmMTcKhdEdgJi37NA==
X-CSE-MsgGUID: 93fZiRAtRS28ih9ixdA6lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29692404"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29692404"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 05:10:10 -0700
X-CSE-ConnectionGUID: UO8b6M5ER5iqox+HpdnRPg==
X-CSE-MsgGUID: g74Ybz18R9a361uG3aHnZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="111711060"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 Oct 2024 05:10:03 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4J8j-000YD2-0w;
	Fri, 25 Oct 2024 12:10:01 +0000
Date: Fri, 25 Oct 2024 20:09:47 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Maxime Ripard <mripard@kernel.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 22/37] drm/vc4: txp: Add BCM2712 MOPLET support
Message-ID: <202410251938.rnvcIesU-lkp@intel.com>
References: <20241023-drm-vc4-2712-support-v1-22-1cc2d5594907@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023-drm-vc4-2712-support-v1-22-1cc2d5594907@raspberrypi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_051010_759043_91D529DE 
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

Hi Dave,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 91e21479c81dd4e9e22a78d7446f92f6b96a7284]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Stevenson/drm-vc4-Limit-max_bpc-to-8-on-Pi0-3/20241024-005239
base:   91e21479c81dd4e9e22a78d7446f92f6b96a7284
patch link:    https://lore.kernel.org/r/20241023-drm-vc4-2712-support-v1-22-1cc2d5594907%40raspberrypi.com
patch subject: [PATCH 22/37] drm/vc4: txp: Add BCM2712 MOPLET support
config: arc-randconfig-r111-20241025 (https://download.01.org/0day-ci/archive/20241025/202410251938.rnvcIesU-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241025/202410251938.rnvcIesU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410251938.rnvcIesU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/vc4/vc4_txp.c:513:27: sparse: sparse: symbol 'bcm2712_mop_data' was not declared. Should it be static?
>> drivers/gpu/drm/vc4/vc4_txp.c:527:27: sparse: sparse: symbol 'bcm2712_moplet_data' was not declared. Should it be static?

vim +/bcm2712_moplet_data +527 drivers/gpu/drm/vc4/vc4_txp.c

   526	
 > 527	const struct vc4_txp_data bcm2712_moplet_data = {
   528		.base = {
   529			.name = "moplet",
   530			.debugfs_name = "moplet_regs",
   531			.hvs_available_channels = BIT(1),
   532			.hvs_output = 4,
   533		},
   534		.encoder_type = VC4_ENCODER_TYPE_TXP1,
   535		.high_addr_ptr_reg = TXP_DST_PTR_HIGH_MOPLET,
   536		.size_minus_one = true,
   537		.supports_40bit_addresses = true,
   538	};
   539	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

