Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9BBCA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 22:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rXq3sk0b5j6u45a9CW2UEsFy+jV3+6YxcNYu19hQgAM=; b=UKqwpkMdiwPwaPwGnhRtOXPNja
	nUIrsmA7uuUii+mcHzeL5hb7C3cHtMWluaKoriEBhKzvaKqI188+DsEoCbuAM6c34z04JLU3gie1J
	uLxu81gBEUc7l5en2oUwENF5g0VTJNw0ElVVgUtT+bkHJtfRDrfaTxggkItC+FPpSIZYRXOCAv+qL
	8qv0UX+t5IC3j122ex4yUBV/5cF+l7uItmsPKw083CWqGnXMCr+hQ0kB4ggwHiEe3VMF/p+z7g2nP
	2ci1ErkZcgcbbuTPkhq0x0vusf80ZEBsMNQbAnyqTAmX7j+4PcX03EIq99hKpIp75MfrTs4G56Gm/
	aWjKt7Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBgJF-00000004hWp-31it;
	Tue, 29 Sep 2026 22:28:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBgJE-00000004hWd-2Rnr;
	Tue, 29 Sep 2026 22:28:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F198F43765;
	Tue, 29 Sep 2026 22:28:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9861D1F000FF;
	Tue, 29 Sep 2026 22:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790720903;
	bh=rXq3sk0b5j6u45a9CW2UEsFy+jV3+6YxcNYu19hQgAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NNnxeGjEGa2lNFXQY4Jt8RsbdsDI2wc8Zt4KAWsug0FBbZjoRZzn8arTtFcgouBrS
	 l+sfIQE8bWIkRCtjSKTe2ld6W2GKOJAHd7i1fLUnhKNB8PHZIhUMakbFnyGcBE8GNK
	 eZYJysdjyAXMPFHJp2MNckOIGNE1znNiNefIUcRngdEcAoWA768zqTorf/lOl49rxS
	 YORcCbRLMNwWEiHkpcKWjD5G8R2zA7QeOR8LplKWQALfyhKKeRSY5NzDIpG0o6Bapo
	 s7SGsU5WGHJ7Wql0St4LqfGFJxvE6K9HztquQ/4T4rgw7UdsYi0cl5G/bHlHMe1jlL
	 peOZDphH/qfxw==
Date: Tue, 29 Sep 2026 17:28:22 -0500
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
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
Subject: Re: [PATCH 1/6] dt-bindings: display: Add panel-mipi-dsi-bpf generic
 panel binding
Message-ID: <20260929222822.GA2933878-robh@kernel.org>
References: <20260928-drm-mipi-dsi-panel-ebpf-v1-0-5244926aace4@kernel.org>
 <20260928-drm-mipi-dsi-panel-ebpf-v1-1-5244926aace4@kernel.org>
 <20260928204059.GA515872-robh@kernel.org>
 <artyl8fD3zzng8Uh@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <artyl8fD3zzng8Uh@houat>
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

On Tue, Sep 29, 2026 at 10:39:24AM +0200, Maxime Ripard wrote:
> Hi,
> 
> I'll merge the two discussions in that thread.
> 
> On Mon, Sep 28, 2026 at 03:40:59PM -0500, Rob Herring wrote:
> > On Mon, Sep 28, 2026 at 06:22:01PM +0200, Maxime Ripard wrote:
> > > Most MIPI-DSI panel drivers follow an identical pattern: acquire
> > > regulators and GPIOs, perform a reset pulse with specific timing,
> > > send a vendor-supplied sequence of DSI commands, then enable the
> > > display. The only truly panel-specific part is the init sequence
> > > and power-on/off timing.
> > > 
> > > The panel-mipi-dsi-bpf driver replaces per-panel kernel modules
> > > with a single generic driver whose panel-specific behavior is
> > > provided by BPF programs loaded from userspace at runtime,
> > > following the HID-BPF model. This enables new panel support
> > > without kernel patches.
> > > 
> > > Panel DT nodes use a two-entry compatible with the panel-specific
> > > string first and "panel-mipi-dsi-bpf" as fallback. The generic
> > > driver matches on the fallback, while the first compatible is used
> > > to identify which BPF program to load.
> > 
> > If you need the 1st compatible anyways, what is the point of the
> > second one?
> 
> The whole point of this driver is that you don't need to modify the
> kernel when you add support for a new panel.

What reads the most specific compatible?

> > Also, I assume there is at least some panel supported in the kernel
> > you might want to convert to this. That panel would not have the
> > fallback (and the DT is fixed).
> 
> Yeah, that's true. I'd still need to identify the parts though. I guess
> using a generic compatible but a specific model would work?

What? You can't add a generic compatible in these cases.

> 
> > And I agree with Neil's comment. At least until we start embedding BPF 
> > into DT directly. ;)
> 
> And from Neil:
> 
> > I don't see how this can be a valid hardware description, bfp is a
> > software implementation and has nothing to do in the bindings.
> 
> I'm quite a bit surprised by that argument though.
> 
> We have in the main dt-schema repos bindings like:
> 
> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/options/u-boot.yaml

Self contained in a node that's specifically not h/w.

> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/bootph.yaml
> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/post-init-providers.yaml

Extra hints that are safe to ignore.

> 
> Or, in Linux:
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/misc/google,android-pipe.yaml

Virtual h/w which tends to have special needs.

> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml

Shrug. Weird Qcom shit...

> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/sound/simple-card.yaml

Just a container... Though I can't say I really like any of the audio 
bindings.

All really irrelevant to this discussion other than the panel binding...

> 
> All of them have been reviewed or acked by you, and yet none of them
> relate to any hardware description.

There are things which aren't h/w, but this is h/w and we've already 
made decisions about how panels in particular are represented. We of 
course have some remanents of how we don't want to do things.

> panel-mipi-dsi-spi is a generic panel that will load a firmware, and
> quite similar to this one. google,android-pipe and qcom,fastrpc don't
> attach to anything and will just open a tunnel to userspace, which is
> somewhat equivalent but more dramatic than what this driver is doing.
> simple-card or its variations will just instantiate a kernel driver from
> the DT and is used pretty much everywhere.
> 
> I reused the binding from panel-mipi-dsi-spi for this. It was reviewed
> by rob, and acked by a panel maintainer, and 4 years ago, so we're way
> past the "oh but we didn't know what we were doing back then" argument.
> 
> So, let's phrase this differently: what's different about the
> description than panel-mipi-dsi-spi, or any other binding already in
> tree?

There's all of 3 panels supported. Compared to all the other panels we 
have, hardly the rule over the exception. You can always fine "bad" 
examples or exceptions.

That one defines a single supply. Any other MIPI SPI panel with 
different supplies or GPIO controls probably has its own binding. Trying 
to parameterize that in DT doesn't work. We've rejected trying to do 
that in DT over and over. What's your story here for that?


> If it's the BPF part, BPF is not Linux-only, and there's hardware with
> direct BPF support these days, so it can be considered OS-agnostic and
> not an implementation detail.

Really that's the least of my concerns.

Rob

