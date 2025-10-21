Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A5CCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 12:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3cvXtn5V3UFFlWiour87LsQ22KfnHunhwwWD65loTaI=; b=RRJRayQNBQRfsbLvWit6jKnXl/
	DTtlEhrqiypGzj+2FuVxAnELlRdSuRaCPAFqDEYeS3vNIJFFpbOkgT5/QX1oeBkncvKvXKi3jPkex
	X/nX6g/x4FkZcOO0UcejJla5V1JgJuoC9KcgL11PQPD8x1TVmaQP33Xn1YAizSTWmSwsY54EEn4i6
	gFQ8Q6Uz67pJs7UbK7ozWQX/yZ5H5nIFPdOCImJM79GlexMoGi/l/+wrAu17Vd4NQPJo3bIpywm4r
	SSmzgV6N3Das9SHqZot1EVMEBDFF+X0ARpsiuBuob4a2S0taxfNUBaS6BmmBUMOh7nBAO2MqwcZ9e
	H6Y6tS4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBsv-0000000H3F2-10gc;
	Tue, 21 Oct 2025 12:54:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBst-0000000H3Dd-3a52
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 12:54:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0493B60415;
	Tue, 21 Oct 2025 12:53:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55553C4CEF1;
	Tue, 21 Oct 2025 12:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761051234;
	bh=UY2OSllcqRDaiG/AFNpJ3ozdueOD0RXvdE2EaOV+UH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MK13Bz8u0aFDcU4UaydmuPJ94/RJsUSk49QV9YFFxyqro787NvORkZoXkPqM8E0Or
	 CcLkp8Kp/iS+s/2nVgTWhzegXbjFKaG0dQnO4B6QFI1ixEDoPBJOt7XSEtVyWXmW/9
	 qKmvDCQDJqrwKvumbdyVJKcuXpfHUfwwRDi51VQT4mskKM6g5KasWj5mm7PRLqrE6c
	 B3CXCoFC5SN3tUmZYJSoGHIhQnDn1PoTiBLDFfvYKSSvnaVl4L60rXy8axwUHaedHu
	 j8Yx061Fz6PO6hC23FWr0/8ddRTTlSHTU5475hpeZjVw44HqQt6f44aw9jA8WSg+3y
	 KYUTqxRmLDd2w==
Date: Tue, 21 Oct 2025 18:23:29 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
Message-ID: <ibdmghl5dg3oda2j5ejp35ydky4xkazewhdvskm7p32vstdegr@36pj32b6dt44>
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <hyzzrjn7jzo3tt3oyg7azijouawe3zopfjzq6zfhoo6e6z2m4t@ssl5vl4g557e>
 <zk4ea5cibrkp4vttuy4evrqybf76b3nop5lnyck4ws4nyf2yc4@ghj2eyswsoow>
 <CAMRc=MdWmO4wvX6zpzN0-LZF1pF5Y2=sS8fBwr=CKMGWHg+shA@mail.gmail.com>
 <rfr5cou6jr7wmtxixfgjxhnda6yywlsxsei7md7ne3qge7r3gk@xv6n5pvcjzrm>
 <CAMRc=Me9Td5G9qZV8A98XkGROKw1D2UeQHpFzt8uApF8995MZw@mail.gmail.com>
 <rvsyll4u6v4tpaxs4z3k4pbusoktkaocq4o3g6rjt6d2zrzqst@raiuch3hu3ce>
 <CAMRc=Me+4H6G+-Qj_Gz2cv2MgRHOmrjMyNwJr+ardDR1ndYHvQ@mail.gmail.com>
 <fydmplp5z4hjic2wlmvcy6yr3s5t5u4qsgo7yzbqq3xu2g6hdk@v4tzjj3ww4s6>
 <CAMRc=McGuNX42k_HdV20zW+buACBTmTZEHWgS-ddRYsvnfwDSg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McGuNX42k_HdV20zW+buACBTmTZEHWgS-ddRYsvnfwDSg@mail.gmail.com>
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

On Tue, Oct 21, 2025 at 02:22:46PM +0200, Bartosz Golaszewski wrote:
> On Tue, Oct 21, 2025 at 2:20 PM Manivannan Sadhasivam <mani@kernel.org> wrote:
> >
> > >
> > > And with the implementation this series proposes it would mean that
> > > the perst signal will go high after the first endpoint pwrctl driver
> > > sets it to high and only go down once the last driver sets it to low.
> > > The only thing I'm not sure about is the synchronization between the
> > > endpoints - how do we wait for all of them to be powered-up before
> > > calling the last gpiod_set_value()?
> > >
> >
> > That will be handled by the pwrctrl core. Not today, but in the coming days.
> >
> 
> But is this the right approach or are you doing it this way *because*
> there's no support for enable-counted GPIOs as of yet?
> 

This is the right approach since as of today, pwrctrl core scans the bus, tries
to probe the pwrctrl driver (if one exists for the device to be scanned), powers
it ON, and deasserts the PERST#. If the device is a PCI bridge/switch, then the
devices underneath the downstream bus will only be powered ON after the further
rescan of the downstream bus. But the pwrctrl drivers for those devices might
get loaded at any time (even after the bus rescan).

This causes several issues with the PCI core as this behavior sort of emulates
the PCI hot-plug (devices showing up at random times after bus scan). If the
upstream PCI bridge/switch is not hot-plug capable, then the devices that were
showing up later will fail to enumerate due to lack of resources. The failure
is due to PCI core limiting the resources for non hot-plug PCI bridges as it
doesn't expect the devices to show up later in the downstream port.

One way to fix this issue is by making sure all the pwrctrl capable devices
underneath a PCI bridge getting probed, powered ON, and finally deasserting the
PERST# for each one of them. If the PERST# happens to be shared, it will be
deasserted once at the last. And this order has to be ensured by the pwrctrl
core irrespective of the shared PERST#.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

