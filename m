Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA87ECA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 09:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WooDL/KYFFTLcmuL4/zwwe5nLEMkzFYyCGa/v7j46HM=; b=VqV9DxmMZNhywqzxd1U5/C+ayx
	Os+LgGVKu9xbO6bUWBt8dQRTVaj0CDtbSJ6D3xejBXM7sxBSDXrGg8uxmma9wuS5jjK9EWjmwu5S8
	xd6tO1d9p/4FLVptxDY2pvjhJUHc3H4ohlAmgtOjQl1ZiFosQUo4I96sWqC9i1dU9i0cEbXS9HZoI
	Q0QhE1AFIjToSb06J1ParAx6gNs0q7XC+dMTnoxpRIcSzG0AGLDOHvLqehYTsiiJZynrWyRqe1G9n
	Og+a7FpLEfWOQruWvHwMMATa+V4pVqWGxZ7o50fQbf/96ZhcJmhgH+oe50sp3FX+jLL5+fhiFpDAS
	AeFYfb+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTkr-00000002vDG-3uXe;
	Tue, 29 Sep 2026 09:04:05 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTkq-00000002vCb-0unI;
	Tue, 29 Sep 2026 09:04:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790672644; x=1822208644;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=fjTgkfgps1Gk7j6xMRcB1fFz/DjnVOKoczfByJwdpzQ=;
  b=Vu5aeqK7pQWJWUBgvtimQhagMDH7K5s9rS57iSmS/3bTi29QzzvyfRTy
   fxou6XhW89xPX99kxRsa8I02i1Wd2w2VaR7iIs2jmIooKmWpxr6xB9kUe
   6SY8t2eU7zYN6bJiEnj1JxdYU1BzXWOdr/hVcBllZy6TUmQ9ROXFf93pi
   jCIbXkecNVV3VyZaBZGGPzx0MDE8L4IXyqvkvptXNQgHFmaul3WQfN8J0
   pXCfCy4c6EGAHadPz3WkTWBRcxjiTJSw1rNjVsWcZCuE+GQbmcuRgHYtw
   aqJw3D89KCMuFQHXwOz+bdkTf6//8kZlDK6NcfmMzYMRingh+2vrZVpF3
   A==;
X-CSE-ConnectionGUID: H5+2kP2ZSCqqttgYBXeU3w==
X-CSE-MsgGUID: Qtd4ZX70TZGwT4gvvjkN6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="91405280"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="91405280"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 02:04:03 -0700
X-CSE-ConnectionGUID: L4F6TTbPScOGpDGQ/vD63w==
X-CSE-MsgGUID: px97l+LIQsul4lmsr50Xug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="271804384"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.233])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 02:03:55 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt
 <justinstitt@google.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Albert Esteve <aesteve@redhat.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Javier Martinez Canillas
 <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, llvm@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <mripard@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [PATCH 0/6] drm/bridge: Add a BPF-based MIPI-DSI panel driver
In-Reply-To: <20260928-drm-mipi-dsi-panel-ebpf-v1-0-5244926aace4@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260928-drm-mipi-dsi-panel-ebpf-v1-0-5244926aace4@kernel.org>
Date: Tue, 29 Sep 2026 12:03:52 +0300
Message-ID: <054ef52478fc93fc213a9dae23ea77f73094aaf2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_020404_273806_C9FF1DC5 
X-CRM114-Status: GOOD (  19.29  )
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

On Mon, 28 Sep 2026, Maxime Ripard <mripard@kernel.org> wrote:
> Panels in general, and MIPI-DSI panels in particular, are pretty
> difficult to support and require pretty much a panel driver for each
> panel produced. Most of them are pretty simple, and require an opaque
> initialization sequence that is usually poorly documented.
>
> This creates a tension between OEMs and distros because OEMs will
> typically get a new panel to react to a sourcing issue during
> production, and thus need some swift turnaround between getting their
> new panel and it being operational in the OS. Distributions on the other
> hand can take years to ship a kernel with that new panel driver.
>
> To solve this, I followed the example of HID-BPF and wrote a panel
> driver that will rely on BPF programs to perform the panel
> initialization. That way, we can ship the programs separately from the
> kernel, and with a different lifecycle. If this driver is accepted, the
> plan is to have a userspace component started by udev to identify and
> load the right BPF program for the panels found on the device.

I'd think for most panels it would suffice to have a declarative
language describing what to do at what points in time. For example, at
poweron, enable this GPIO, wait a little, write this set of DSI
commands, etc. You rarely need actual programming, or even ability to
read-modify-write something.

It could be, say, YAML converted to some binary representation. Maybe
that could be in the DT, or maybe you could override it with the
firmware loader. And obviously any vendor "blob" could be trivially
converted back to YAML and upstreamed.

Where that falls short, you could always have a dedicated driver, or
extend the declarative stuff.

Now, the question is, how much more BPF solves over that, without
requiring a dedicated driver, and is the added complexity worth it?

FWIW, on the Intel platforms that support DSI, all of the
initialization, poweron/poweroff, backlight on/off etc. sequences like
that are stored in the BIOS, defined by the OEM. A plethora of DSI
panels, one driver. Don't look at it for examples how to implement it,
but I think the basic idea is workable.


BR,
Jani.


-- 
Jani Nikula, Intel

