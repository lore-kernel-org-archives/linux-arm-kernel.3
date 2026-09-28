Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A2ACA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 16:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iYA0hFIaMdYn488gGkJqtLh/o+HH8Ayao7MCR8wMWY0=; b=DJ1nZMLyT20rYl6Gr2n10YGG9E
	XkB1HnGDUXXosgV9PlV7plxQV+v1c2Hox2jE6aDeaPK2KnaczjN47ZpdtBbUE/NnrYIe0o/3tMSCX
	QVw9U/dO0qE/HoLiWXvaDm+Wdyj+oTl/K7TwLj/PPLQPIJsPWPO1tN4yjXLF+2igc+SNKp232pj5M
	jU3ZvPGD4zXd+OqKpD+z1ApNFF7cnAc+DtSi4s1my3eDmw60Agsk6bc8H82NkHLCO1INm0/J1OfwU
	Zj6xZVVn80bnRGPlQ10/ors5jC7y1zU9+rb0WLTmfSXwU49/twquFKpPQYxqgxOU6KYlIMltNDP/c
	oSgdS0OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBELu-000000013BF-3KLL;
	Mon, 28 Sep 2026 16:37:18 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBELs-000000013AO-13yn;
	Mon, 28 Sep 2026 16:37:17 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D2BE68FD;
	Mon, 28 Sep 2026 18:35:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790613323;
	bh=79ekLGQx1Tor6z02KqQn9lGJBkxxAMsnhhsc0gv/Pv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tgwwdITKp4bfEl3NckTRce+gdM4AqUQST43w9pHEv3HmzcSUOqUmik84htz5qPg3X
	 OcLpOr9Mikj4IUIaukMWgueo2gjofH/ExaxDKh1qFqsWzuUQvNYFgZg4MLBuMKQJqT
	 zLI18YDW8IyTiyPLslMQtK6pLIx4CdsGLPz0oBLc=
Date: Mon, 28 Sep 2026 19:37:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Albert Esteve <aesteve@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
	llvm@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [PATCH 0/6] drm/bridge: Add a BPF-based MIPI-DSI panel driver
Message-ID: <20260928163711.GA210522@killaraus.ideasonboard.com>
References: <20260928-drm-mipi-dsi-panel-ebpf-v1-0-5244926aace4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260928-drm-mipi-dsi-panel-ebpf-v1-0-5244926aace4@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_093716_446882_9AC09EB0 
X-CRM114-Status: GOOD (  35.40  )
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

Hi Maxime,

On Mon, Sep 28, 2026 at 06:22:00PM +0200, Maxime Ripard wrote:
> Hi,
> 
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

Interesting idea.

How would that work for devices that want early display support ? In
particular, how does it interact with your recent work on "fastboot"
support (with the kernel drivers taking over a running display
configured by the boot loader) ?

I'm also wondering about the incentives for vendors to upstream the
code. How will we avoid having a proliferation of out-of-tree drivers ?

> This driver is fully functional and works with both 5" and 7" Touch
> Display 2 panels for the RaspberryPi. However, it breaks away from the
> typical panel driver in multiple ways:
> 
> - BPF programs can only be loaded by userspace. This leaves us with two
>   choices: 
> 
>   * We prevent the driver from loading until the script itself is
>     loaded. This has the side effect of preventing any other output to
>     be used until the initramfs is ran at the earliest, and possibly
>     ever if the loader isn't installed for example.
> 
>   * Or we probe the driver all the time, but only report it as connected
>     once a program has been registered. This is somewhat unconventional,
>     but allows the other outputs to be functional, *and* allows the user
>     to force the output if their panel doesn't require any
>     initialization or during debugging. I chose this solution.
> 
> - It's not a panel driver, but a bridge one, which is also pretty
>   unconventional. This is required because panel drivers don't have
>   access to a detect callback that is required for the above, but I also
>   think that the recent work from Luca blurs the line from panels and
>   bridges and we'll end up going that road anyway.
> 
> Let me know what you think,
> Maxime
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
> Maxime Ripard (6):
>       dt-bindings: display: Add panel-mipi-dsi-bpf generic panel binding
>       drm/panel: Add generic MIPI-DSI panel driver with BPF init sequences
>       drm/panel: dsi-bpf: Add BPF program build infrastructure and helper header
>       drm/panel: dsi-bpf: Add Raspberry Pi 7-inch panel BPF program
>       drm/panel: dsi-bpf: Add Raspberry Pi 5-inch panel BPF program
>       [DO NOT MERGE] arm64: dts: broadcom: Add Raspberry Pi ILI9881C DSI panel overlays
> 
>  .../bindings/display/panel/panel-mipi-dsi-bpf.yaml | 184 +++++++++
>  arch/arm64/boot/dts/broadcom/Makefile              |   8 +
>  .../bcm2711-rpi-4-b-dsi-ili9881-5inch.dtso         |  22 +
>  .../bcm2711-rpi-4-b-dsi-ili9881-7inch.dtso         |  22 +
>  .../dts/broadcom/bcm2711-rpi-4-b-dsi-ili9881.dtsi  |  65 +++
>  drivers/gpu/drm/panel/Kconfig                      |   3 +
>  drivers/gpu/drm/panel/Makefile                     |   1 +
>  drivers/gpu/drm/panel/bpf/Kconfig                  |  28 ++
>  drivers/gpu/drm/panel/bpf/Makefile                 |  10 +
>  .../gpu/drm/panel/bpf/panel-bpf-mipi-dsi-core.c    | 452 +++++++++++++++++++++
>  .../gpu/drm/panel/bpf/panel-bpf-mipi-dsi-kfuncs.c  | 278 +++++++++++++
>  drivers/gpu/drm/panel/bpf/panel-bpf-mipi-dsi-ops.c | 242 +++++++++++
>  .../gpu/drm/panel/bpf/panel-bpf-mipi-dsi-trace.c   |   4 +
>  .../gpu/drm/panel/bpf/panel-bpf-mipi-dsi-trace.h   | 246 +++++++++++
>  drivers/gpu/drm/panel/bpf/panel-bpf-mipi-dsi.h     | 264 ++++++++++++
>  drivers/gpu/drm/panel/bpf/progs/Makefile           |  93 +++++
>  .../panel/bpf/progs/Raspberrypi__dsi-5inch.bpf.c   | 266 ++++++++++++
>  .../panel/bpf/progs/Raspberrypi__dsi-7inch.bpf.c   | 271 ++++++++++++
>  .../gpu/drm/panel/bpf/progs/panel-bpf-mipi-dsi.h   |  95 +++++
>  19 files changed, 2554 insertions(+)
> ---
> base-commit: 6e375de99d0c420169481fcd36064177ab55b09d
> change-id: 20260928-drm-mipi-dsi-panel-ebpf-d78b72a9c47f

-- 
Regards,

Laurent Pinchart

