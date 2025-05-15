Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED0F6C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 21:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gNK29hO0VrvSr3wP+WL4NxJXJES4OpUpi9uC9xfsBHI=; b=3fq60Nm3DfKhAmj9iQ2NATrFxT
	JNWIhaSaFV5iKxptEBDzI2gbsvjbhEU9hJMF/D66cE5bgpNOy4lDPgBZ6/XKSGqScO2QG//nagS0Q
	Jc9OLAfOI/dAzT8aBgpdOR2sPVEFEdYOEUH95M7LtDTLK1n8T9WFb/FZO4kf8+tcfQj7VMVpCWBTM
	uclbCjtD7YOX9zh2/pXrkKE5cCPVF4eeTSQKVDpi6+bfHzwSo/mJh89xEcEqzFm2B/2pZyS/52Qov
	uKbRQsvloZBsZZ3V8DBeL7KBH/a6N1GUVod6JwYvi6arV5RbV1kNLm2eblA19oIGiMKFUxDQBtE5o
	MHFPJLBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFgUS-00000001vtX-04xK;
	Thu, 15 May 2025 21:51:44 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFgSP-00000001vjS-1PlV;
	Thu, 15 May 2025 21:49:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747345777; x=1778881777;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RoCc345vfJVENvuSRJcrRZFcN774itnQr3aMxr0Fyfw=;
  b=kdo6o/yhOVlDVUvxceLUJylE98iwENvx1LskZAI4coxu/X3oT7fJ5NY4
   yOBj0xl3TLbwgMaFo4G2P1BmdmXH0HAZGsjuXWoADfuHJNqPOS4xkftdO
   Xm1ckHldvOS6ZktGaUxgjXEO5Am4DHqYLvOyijyvB+ScZRVW+1KI7bWWd
   XW+YpochDqJ1zc7IcHzADG+pV9hc68OlKxwrIxEWyNQCClOzORjGmnwDP
   4iGXbFAQOm64NCJSWxpMNlJ3f0ww8QIAWpLlshb7nY+wYJ5uVg8IUA7NU
   aJrAu6b8r3kI32zthVDvdeoLw1WnUjqxqFBtNyHDYpLNzXIi1OvVTLo+X
   A==;
X-CSE-ConnectionGUID: ejlHZeKrT9+xpYMaBCmfuA==
X-CSE-MsgGUID: jCYEgzgqTiyHrxOJVExYxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="74706562"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="74706562"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 14:49:33 -0700
X-CSE-ConnectionGUID: gPxS+KsDQICu4S9djjz6WA==
X-CSE-MsgGUID: lV50IQaLQZ+PFDXaZT8Gcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="138895866"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 May 2025 14:49:27 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFgSD-000Ilz-07;
	Thu, 15 May 2025 21:49:25 +0000
Date: Fri, 16 May 2025 05:48:39 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Markus Elfring <Markus.Elfring@web.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Val Packett <val@packett.cool>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Michael Riesch <michael.riesch@wolfvision.net>
Subject: Re: [PATCH v7 07/14] media: rockchip: add driver for mipi csi-2
 receiver
Message-ID: <202505160513.MZRCAdXI-lkp@intel.com>
References: <20240220-rk3568-vicap-v7-7-7581fd96a33a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240220-rk3568-vicap-v7-7-7581fd96a33a@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_144937_418313_F99871A2 
X-CRM114-Status: GOOD (  10.10  )
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

Hi Michael,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Riesch-via-B4-Relay/Documentation-admin-guide-media-add-rockchip-camera-interface/20250514-235450
base:   82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3
patch link:    https://lore.kernel.org/r/20240220-rk3568-vicap-v7-7-7581fd96a33a%40collabora.com
patch subject: [PATCH v7 07/14] media: rockchip: add driver for mipi csi-2 receiver
config: i386-kismet-CONFIG_VIDEO_V4L2_SUBDEV_API-CONFIG_VIDEO_ROCKCHIP_CSI-0-0 (https://download.01.org/0day-ci/archive/20250516/202505160513.MZRCAdXI-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250516/202505160513.MZRCAdXI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505160513.MZRCAdXI-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API when selected by VIDEO_ROCKCHIP_CSI
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
     Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
     Selected by [y]:
     - VIDEO_ROCKCHIP_CSI [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && (ARCH_ROCKCHIP || COMPILE_TEST [=y]) && V4L_PLATFORM_DRIVERS [=y] && PM [=y] && COMMON_CLK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

