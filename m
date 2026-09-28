Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBD8CA5FA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 19:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DVCYORH83Mdl0Gt8ikYu58Tz+uRUhq9ZJzLJhMmXjZQ=; b=20Zs2tHwxu10JkaA/P0OV4uIpg
	QM/bMjLtwmbZfu44lAiRdUrmBDi8J8RBb+cPKKCkJGpczLY7zCzyhlKMxIjw4rI1eyBbkKbBp87Ba
	MjBSL4/DUY4he5LS52+h2AhcGO2uz3gZOdBrxGirWfpcBvD1nLaNMMG6fVmQO8+YEXPHrtZXZgH8H
	AzbyBuzoJkxjsx+7Xvkf56ipq30e+LtDNONeCPoE2SY6qseea6HPh7rPsehO2L0hbNdQ5oFY710HE
	Yse4zMlwRPRcgq0zT8bokREDKcoYYTmGFWPHyo04v4/btH+HUFLpCcBGC6rZYyijc7XRyq2sWiuOa
	pbjMhu3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFD0-00000001Acr-0L5w;
	Mon, 28 Sep 2026 17:32:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFCy-00000001Aca-2ep1;
	Mon, 28 Sep 2026 17:32:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 168E3600E2;
	Mon, 28 Sep 2026 17:32:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C1831F000FF;
	Mon, 28 Sep 2026 17:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790616727;
	bh=DVCYORH83Mdl0Gt8ikYu58Tz+uRUhq9ZJzLJhMmXjZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dTTJOcwptb6dtMZSchc1Lofu3hSLpnFiqMkVGzX4i24kCkCaG/iGddLmgAfy9dhOP
	 V9T7CrALeOpd+ch2q5TE2cqbRaRBjJzAmaFRijbYMnvL6hjtTUbOqrX9fT7Mq1xJGd
	 beM7+4/VqZ7tJJh75zo1CBfH5u/yroD9KDXRfiDuksUIlJn5qDJHGjOiClin0XRGq3
	 hGuB4dbwy36SVluamPU6mYLjAVxoLWYf+/DYtu6XVi6QDofA6r3epPv++vQBPfJipa
	 seLWVZJYEXdq31uGKgrMQolSe2cfPDeW2Z8O2EK7e1tLe54GzD52cWpP/EVFTOL3b4
	 48SEqu6ci+0JQ==
Date: Mon, 28 Sep 2026 19:31:59 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Albert Esteve <aesteve@redhat.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/6] drm/bridge: Add a BPF-based MIPI-DSI panel driver
Message-ID: <arqi0etVHGajQAMe@beelink>
References: <20260928-drm-mipi-dsi-panel-ebpf-v1-0-5244926aace4@kernel.org>
 <20260928163711.GA210522@killaraus.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928163711.GA210522@killaraus.ideasonboard.com>
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

On Sep 28 2026, Laurent Pinchart wrote:
> Hi Maxime,
> 
> On Mon, Sep 28, 2026 at 06:22:00PM +0200, Maxime Ripard wrote:
> > Hi,
> > 
> > Panels in general, and MIPI-DSI panels in particular, are pretty
> > difficult to support and require pretty much a panel driver for each
> > panel produced. Most of them are pretty simple, and require an opaque
> > initialization sequence that is usually poorly documented.
> > 
> > This creates a tension between OEMs and distros because OEMs will
> > typically get a new panel to react to a sourcing issue during
> > production, and thus need some swift turnaround between getting their
> > new panel and it being operational in the OS. Distributions on the other
> > hand can take years to ship a kernel with that new panel driver.
> > 
> > To solve this, I followed the example of HID-BPF and wrote a panel
> > driver that will rely on BPF programs to perform the panel
> > initialization. That way, we can ship the programs separately from the
> > kernel, and with a different lifecycle. If this driver is accepted, the
> > plan is to have a userspace component started by udev to identify and
> > load the right BPF program for the panels found on the device.
> 
> Interesting idea.
> 
> How would that work for devices that want early display support ? In

Brain fart... Include a bpf VM in the bootloader? :)

> particular, how does it interact with your recent work on "fastboot"
> support (with the kernel drivers taking over a running display
> configured by the boot loader) ?
> 
> I'm also wondering about the incentives for vendors to upstream the
> code. How will we avoid having a proliferation of out-of-tree drivers ?

My 2 cents here from the HID-BPF point of view:
- as mentioned in my reply to Neil, the kernel enforce GPL licensed BPF
	only
- so vendors have to publish their code somewhere
- in HID-BPF, I decided to provide an "official" list of HID-BPF sources
	as part of the kernel (see drivers/hid/bpf/progs). I try to sync them
	with the userspace tree when time permits

So basically, distributions can say "we ship only BPF objects compiled
from the kernel tree". It doesn't mean they have to be in a released
kernel already to remove the friction, but in the process of being
released could be sufficient.

Cheers,
Benjamin

