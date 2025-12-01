Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC9FCD116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 12:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k/9PFL5IhHkGogW0vgk1aBDJ8rlQab00yCimasHMJes=; b=c7rcQmWlm4NSO4m5ZemCQr2J/S
	Vx0ieLzGIuiy78MuGDKLN1Sd+70HwmqCZEhYMgJfLREiiE4Gd+bUG72ytUkm4kikZlWWXeg4EJlEX
	KenkSWHBZPw+KNo+LTCLlqX2xrr3JPHvHvGOTVcy9E0Jel/T5wn7X/Rv3jRU9Ke0PYUaJVQE59Hau
	bpLO6ZmIQl3iFPMqS8UMpv8Aq8m2/KtX2vxJ6Bu60FMwGQiNt4Mj1Ad+QkVVI21B3YC7BU+VKKMEN
	RDceOvYEPUzBpDzUN13KdkX97uSCYrneZRnBqp6bk3ywW5cHvlAuHeIFOuzWrX10R6Z7tJjKivhtI
	5xQuZ9mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ3VC-00000003bde-3yLQ;
	Mon, 01 Dec 2025 12:59:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ3VA-00000003bd6-3PBO;
	Mon, 01 Dec 2025 12:59:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 27EDE40DBA;
	Mon,  1 Dec 2025 12:59:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD63AC4CEF1;
	Mon,  1 Dec 2025 12:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764593976;
	bh=7IrvfZCnhHhrqTkTyCux4zzyumsKPggknQbCm+CYDjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FlLG1bv3qPdAiuw2BjeBJA4V1OfVX+WOn0nBONHr+PoYx4Fr4SqgDGTOlcK9rpjij
	 P4KzLyKCsc+FmlXb4CV6+KM1VN3+Awd4l7da997s/bLHC+UFfnhNc54oN9Fwu2dUrS
	 vCCW/aaAuvbkVYYlwf8xfWJlcVwfVcZBFcdOKJl0RBsDUKONApuLT98KYx1QL4btul
	 UnUbnJO5ODwWqNh9/wrPGrkaf+ACpQQ7q24OEfv8rMGIhRJzLlajS09+PAZGI55l0v
	 iFdSUgZI9IMG54dXZiVuOY4Nmt40LiKX7n1fTlMCfqaQUQLZe6TrE1IgKfc0JREpcq
	 Yaz0CSEoJMTiw==
Date: Mon, 1 Dec 2025 06:59:34 -0600
From: Rob Herring <robh@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Eric Anholt <eric@anholt.net>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Doug Berger <opendmb@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stefan Wahren <wahrenst@gmx.net>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>, linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 0/3] drm/vc4: Fixup DT and DT binding issues from
 recent patchset
Message-ID: <20251201125934.GA3004948-robh@kernel.org>
References: <20241220-dt-bcm2712-fixes-v5-0-cbbf13d2e97a@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220-dt-bcm2712-fixes-v5-0-cbbf13d2e97a@raspberrypi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_045936_886948_3304E146 
X-CRM114-Status: GOOD (  21.83  )
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

On Fri, Dec 20, 2024 at 06:11:10PM +0000, Dave Stevenson wrote:
> I missed the DT errors from the recent patchset[1] (DT patches
> in linux-next via Florian, DRM bindings patches on dri-misc-next)
> as Rob's bot report got spam filtered, so this is a fixup set.
> 
> Largely it was changes to number of interrupts or clocks in the
> bindings, so those are now covered.
> 
> I've fixed up the missing "interrupt-controller" flags for 2711
> and 2712 whilst here.

I found this is still warning a year later, so I fixed up the commit 
messages and applied.

The comments were a bit nitpicky for a v5 version IMO. However, you went 
to the trouble of preparing 5 versions of the series and we spent our 
time reviewing them, so why abandon them? 

It would be nice if the Broadcom folks spent some effort fixing the 
remaining DT warnings. I see little progress.

> 
> I can't get my head around what is meant to happen with ranges:
> "soc@107c000000: firmware: 'ranges' is a required property"
> The meaning seems obvious.

Adding "ranges" is probably not correct. Generally, 'firmware' is not 
MMIO and should not be under an MMIO bus (i.e. simple-bus).

> 
> However if I add it then I get:
> "firmware: '#address-cells', '#size-cells', 'dma-ranges', 'ranges' do
> not match any of the regexes: 'pinctrl-[0-9]+'
> from schema $id: http://devicetree.org/schemas/arm/bcm/raspberrypi,bcm2835-firmware.yaml#

If you add properties to the 'firmware' node, then you need to add those 
properties to its schema.

> 
> There's obviously some other flag I need to set in the bindings,
> but I can't work it out. We have similar errors for all the Pi
> platforms for one or more nodes.
> Please advise and I'll happily fix them all.

