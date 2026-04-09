Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A28E9DE64
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 08:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IPSiwVuVCP9ir6ejj9LHt4ETPGa3LGlzkf6ixpxGZ98=; b=tB4nFTOt5ztjDgqvgdod/bJitP
	DQhZFEHMSOkuQo1FDHxex6CgMPv+IJ124bRrnTvGeBrVkaOQ44A5t7MerELWr1cy38q43NC69uk0r
	oksGT048ZoD7IEmNdprvkOlX7kJjFHhO4voThtJTaiMcnwHqbaYX0ePYRQonUDhufD8dzRFGzopoF
	/5FBDA/GQYIiDLY2PD6OajVTma9jJu8Wl1bmtT8sT4A3NkcI5XFKMPPn8G51vFGdTl8dxZUyCM/+e
	/0dy47gs6MGY649bmX/rHS40LqW1s0dvifeInRUx8/BFCf+cRZyanHZmwWECpGQGFvr8GdWn2+Cqh
	mU4hZyng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAkOr-00000009u8k-2YCL;
	Thu, 09 Apr 2026 08:06:05 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAkOp-00000009u64-1eag;
	Thu, 09 Apr 2026 08:06:04 +0000
Date: Thu, 9 Apr 2026 10:05:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1775721958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IPSiwVuVCP9ir6ejj9LHt4ETPGa3LGlzkf6ixpxGZ98=;
	b=dsi6d1qfpOVKliDwS50vMZnH0jbegdSuHzyydezr+emC+cLPe8t5ixEI/5pZC2AyyZjWZ0
	Vh2F13TfOOcb2W9sAeaE7/uKU7ShXpSOhHWTbZqAcjtJC9LBKkwgodUiq4Hyb0XvVdpEfD
	YOWINl01U6Nv3OCOGYgBocoJtc7gr9PMjWjFjF289LQI5ICYC+qFwhVOpRu4tk3xPPt8Z2
	nuRczOH5ASeIEuyUHWyyNkjDMszVqpwB542AJr1MgzkGfTrewSvbLBr2loE585Ucbc6FtS
	f3ybhfilU8jIBzWxVLTM0x8bCHf7/vbgTz3U2blDK8iMCwMyFMRc6wuGPiT5Yg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1775721958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IPSiwVuVCP9ir6ejj9LHt4ETPGa3LGlzkf6ixpxGZ98=;
	b=m/6xsiiY2sy5BQM3VnWr4suVEXfvMtjeM9n7diD8yakbjKqfzHsm9zV1iIFNBj7A+v463a
	nkVrgNu9fvetSoCQ==
From: Gregor Herburger <gregor.herburger@linutronix.de>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Srinivas Kandagatla <srini@kernel.org>, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] nvmem: Add the Raspberry Pi OTP driver
Message-ID: <addd5ZpuUdKBV7Bn@gregor-framework>
References: <20260408-rpi-otp-driver-v1-0-e02d1dbe6008@linutronix.de>
 <20260408-rpi-otp-driver-v1-2-e02d1dbe6008@linutronix.de>
 <251100fe-db96-4d83-899a-cd764582d698@gmx.net>
 <adaw1rr3WlDjvyQp@gregor-framework>
 <90f54202-6eb6-4c44-b029-a4e0dafad861@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90f54202-6eb6-4c44-b029-a4e0dafad861@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_010603_603336_7EF3B943 
X-CRM114-Status: GOOD (  21.79  )
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

On Wed, Apr 08, 2026 at 10:03:47PM +0200, Stefan Wahren wrote:
> Am 08.04.26 um 21:47 schrieb Gregor Herburger:
> > Hi Stefan,
> > 
> > thanks for the review.
> > > Is there any reason, why we cannot register this driver in
> > > rpi_firmware_probe() like hwmon and clk driver?
> > > 
> > > I like to avoid the complete dt-binding from patch 1.
> > The private OTP registers are not available on all Raspberries. Afaik
> > only on 4 and 5. So I think these registers must be described through
> > the device tree. Therefore the bindings are needed.
> This binding doesn't represent some kind of hardware, it's just some
> firmware interface. A proper DT binding would describe the MMIO address
> range for OTP access.

I think it does represent real hardware. Although it is hidden through the
firmware. Not all hardware must be MMIO addresses. 

The only driver that does not have a DT node is the hwmon driver. All
other drivers (clock, gpio, touchscreeen, reset, pwm) do have a DT
binding. Looking at the comment in rpi_register_clk_driver this
seems to be some legacy behaviour for older DTs for the clock driver. 

> If you need some distinction between the Raspberry Pi generations there are
> firmware tags to do this.

So what is your suggestion? What tags do you mean?

I don't understand why you want to avoid the dt-binding. What is the
problem with dt-bindings?
What is the benefit of registering the driver in rpi_firmware_probe?

Imho describing this in the DT is the more natural way to do this. E.g.
if in the future there is a raspberry pi with a 64Byte otp it could easily
be supported by adding a devicetree property and add it to the driver.

Regards
Gregor

