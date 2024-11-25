Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685F7D3B7F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 09:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kh3ciDN6Bp0nUzFmHsV625HPY3BH9f3OntoaIE7cARQ=; b=bzlI7MHQIwBpUHg8Wb1BdXPqWz
	8CeXNyWCyhUj8FQePpeTIcEuKr6CwS531jpSY/QEmwTP+QmQ9LeljdcTFI7f1R+m0lPJSlac4zKW7
	an9x8aTH1EuwadvpPYABpjzSbZmIgq3K79B6yhBgQOz+4mHMfnX+CTvkRZ0EfWahimh+Lsm3mjerq
	lzB/LpLUQzpuZYfnRUWU0RtIK4XsSCgwAlE/dHBtLU3oe7EJCn2sPglLFEQvDuap+pJ4/UG5ZwF7v
	agMGUo2fRAnBa1szu83Ds6RyLmXBwfKJxbIDbErbcfl4DrB7lsEl1ULR8EPJHSclenA+C1i7gebrS
	3wUG6ufg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFV2p-00000007Up6-28SU;
	Mon, 25 Nov 2024 09:06:11 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFV1s-00000007UgL-0Qi7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 09:05:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732525512; x=1764061512;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=1HEwJ06OdfnNR7EruhIW+OMlB4IJ53R9E6nB3+JJJdI=;
  b=OOA0ze30l1h8rtL1GvXL8oQzi2ZrchjO2WckMNExG6fHUg4i9ghYt8NL
   Oe2IQUQWrmDVR6XrBRdPWoxhc2ZjB3BBJNQsNznKUqc9JWabDm96bSlSt
   BAVsEAuwFINAg+GtAHp3EaDDen0E48Xag2rRNhMucejj+Jbg6KRTaAN4e
   Y+IgxP3RYzzHLty8hDKmPAAiNKwXMOM4FAZ0WZpoKDAHIoTaf6bmFuORn
   ycpcbkXyrsB02/bLI84hSaKRntFaqiuK9x3dM8teRPoLSuBX8UQ82lqOj
   kJGqcqQo8IunwiFuUddvowHaaQNeqk83q5z9TiOQ7dsWL/WYNi2rQccKX
   w==;
X-CSE-ConnectionGUID: bntV33lySv6DlkZ6oalmBw==
X-CSE-MsgGUID: a4JC+KaERHmSEBTUCoEZug==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="36400631"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="36400631"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 01:05:09 -0800
X-CSE-ConnectionGUID: R1kbqonqR++M9M/J5KxKdg==
X-CSE-MsgGUID: iccNDivmR82kc2bbOfKeJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="122049485"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.243])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 01:05:03 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sasha Finkelstein via B4 Relay
 <devnull+fnkl.kernel.gmail.com@kernel.org>, Hector Martin
 <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig
 <alyssa@rosenzweig.io>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sasha
 Finkelstein <fnkl.kernel@gmail.com>, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH 2/5] gpu: drm: adp: Add Apple Display Pipe driver
In-Reply-To: <20241124-adpdrm-v1-2-3191d8e6e49a@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com>
 <20241124-adpdrm-v1-2-3191d8e6e49a@gmail.com>
Date: Mon, 25 Nov 2024 11:04:59 +0200
Message-ID: <8734jfznt0.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_010512_200176_D4940EA5 
X-CRM114-Status: UNSURE (   8.02  )
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

On Sun, 24 Nov 2024, Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org> wrote:
> diff --git a/drivers/gpu/drm/adp/adp_drv.c b/drivers/gpu/drm/adp/adp_drv.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..36510194e18161ef6514885c764b2e7085c587e5
> --- /dev/null
> +++ b/drivers/gpu/drm/adp/adp_drv.c
> @@ -0,0 +1,814 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/anon_inodes.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/file.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/types.h>
> +
> +#include <asm/current.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_damage_helper.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_edid.h>
> +#include <drm/drm_fb_dma_helper.h>
> +#include <drm/drm_file.h>
> +#include <drm/drm_framebuffer.h>
> +#include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_gem_dma_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
> +#include <drm/drm_vblank.h>

Please only include what you use.

BR,
Jani.


-- 
Jani Nikula, Intel

