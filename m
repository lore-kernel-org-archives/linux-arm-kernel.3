Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FB3CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 12:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ux1J3WazDwPEB/T2hZtxfxuMnxLXHcWYjmDzVYhb1gU=; b=vXNDfFYOiopmkjpNO9iQpvz/bC
	3ZBfdpr7HS22J/u/+jzcJ66TZnl7wR3yG84EiWnllG1TO5gSOHmYKlLLCaZGL5PzgDkwMOUTH0ahY
	0WusLnsL7mJVbkqArkk4uslhAY6MKsDQuApdWc0Gn491c2Lx34tEYpdoVWnRJok9tondOmFY84Dvq
	IWLgvYlzE5nRskrjpuiYMFlWInIEtbsmmapmzxHDthPrNBc1AHjwSDSBDyjOoNzc3w7gJJSPdq5v3
	moYY+tfocSbFm/hjHuqcUM9jJt8c1/HcwK5cRZtR9YEVCZ9qMSGW+sLiTeDofyeahjnoqwuIq861J
	tKHn1FlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBLd-0000000GwWW-2rzv;
	Tue, 21 Oct 2025 12:20:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBLc-0000000GwW7-3B4E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 12:20:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2D23E60403;
	Tue, 21 Oct 2025 12:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B49CC4CEF1;
	Tue, 21 Oct 2025 12:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761049207;
	bh=kM8hqpbBBEderQZ7K5It9tLsDk3Uhl2Kuy4s2NW4hIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fS9G2memMMz4jX0r7IZpahu8AsHG5Okw0+UeZz6kCEUhKzfiB6ty4K4xwjMdFImnY
	 1SdGyX448pAvDsnUlrmofzTMbzypcmLFXmVwwbw38aEXoudAFh0Y4iINEKCF5Hdf4I
	 Mtfmabv/gJFrkt5zGEpZ0ORWKNuOf1OUEH1p0MGnA23wimAYfefTk97kWtJwpSy+bY
	 JFx8tQ70Hp25UmPx7qXeUjCzsUpqxNS0spGWlUOQbnXhUbvXB9NXIuMGVoO3/vNbDs
	 frC3zo3LtikcIJdtgYyaYvSyUZB9D3b8PUUbTOnFhR7rTLpRylXfZWHZZAJowHvj2L
	 5V2ngxNGq7yFQ==
Date: Tue, 21 Oct 2025 17:49:44 +0530
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
Message-ID: <fydmplp5z4hjic2wlmvcy6yr3s5t5u4qsgo7yzbqq3xu2g6hdk@v4tzjj3ww4s6>
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <hyzzrjn7jzo3tt3oyg7azijouawe3zopfjzq6zfhoo6e6z2m4t@ssl5vl4g557e>
 <zk4ea5cibrkp4vttuy4evrqybf76b3nop5lnyck4ws4nyf2yc4@ghj2eyswsoow>
 <CAMRc=MdWmO4wvX6zpzN0-LZF1pF5Y2=sS8fBwr=CKMGWHg+shA@mail.gmail.com>
 <rfr5cou6jr7wmtxixfgjxhnda6yywlsxsei7md7ne3qge7r3gk@xv6n5pvcjzrm>
 <CAMRc=Me9Td5G9qZV8A98XkGROKw1D2UeQHpFzt8uApF8995MZw@mail.gmail.com>
 <rvsyll4u6v4tpaxs4z3k4pbusoktkaocq4o3g6rjt6d2zrzqst@raiuch3hu3ce>
 <CAMRc=Me+4H6G+-Qj_Gz2cv2MgRHOmrjMyNwJr+ardDR1ndYHvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Me+4H6G+-Qj_Gz2cv2MgRHOmrjMyNwJr+ardDR1ndYHvQ@mail.gmail.com>
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

On Tue, Oct 21, 2025 at 02:06:30PM +0200, Bartosz Golaszewski wrote:
> On Tue, Oct 21, 2025 at 3:53 AM Manivannan Sadhasivam <mani@kernel.org> wrote:
> > >
> > > That only happens if the driver uses the reset API. If you go with the
> > > GPIOLIB then none of this matters. I definitely don't want to change
> > > the existing DT sources either but I want to find out if the code in
> > > this series is suitable (with some modifications) for supporting the
> > > PERST# line or if the logic behind it is more complex and possibly
> > > requires separate, more fine-grained handling.
> > >
> >
> > All PCI controllers relied on '{reset/perst}-gpios' property for handling the
> > PERST# signal. Now if we change it to a reset line, then the drivers have to
> > first detect it as a reset line and use the reset APIs, if not fallback to gpiod
> > APIs (for DT backwards compatibility), which will add unncessary churn IMO.
> >
> 
> Ok so some platforms define perst-gpios while others use reset-gpios,
> I see now. Yeah, it's better to go with explicit GPIOs then.
> 
> > But if there is no way the GPIO subsystem is going to support shared GPIOs, then
> > we have to live with it.
> >
> 
> Well, there is going to be. We already de-facto have it but it doesn't
> work very well and is fragile (I'm talking about the non-exclusive
> flag). I very much intend to bring this upstream.
> 
> My question wrt PCI PERST# was whether this is useful for it because
> IIRC all endpoints sharing the signal will assert it (or rather their
> pwrctl drivers will) and then only deassert it once all endpoints are
> powered up. This would translate to the pwrctl driver doing the
> following for each endpoint:
> 
> perst = gpiod_get(dev, "perst");
> gpiod_set_value_cansleep(perst, 1);
> 
> Do the power up.
> 
> gpiod_set_value_cansleep(perst, 0);
> 
> And with the implementation this series proposes it would mean that
> the perst signal will go high after the first endpoint pwrctl driver
> sets it to high and only go down once the last driver sets it to low.
> The only thing I'm not sure about is the synchronization between the
> endpoints - how do we wait for all of them to be powered-up before
> calling the last gpiod_set_value()?
> 

That will be handled by the pwrctrl core. Not today, but in the coming days.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

