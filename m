Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683B4CCD1A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 01:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XO35lBBC4ddV+bdwyi/ucd2PVqWcbQoEc2OaTfrtdyc=; b=fbK62iqlu+pIglmkc36LIOT4PL
	z64fOGsOA7PhyCEwfC4h4UN/wPxbJ+T4oIgjY737wnSUOy0hhBZkA9jENL9kYB8g+OQ68g3WtgpcC
	vGNl9SwyUSh4IBPadlfvfUGlfuF05OB475byDttzv3jiC3QjgyIINVEa6T7D/7KWfsVQzpRPSwkBK
	WIPl0O3KerCTmbustjXb5LyvSIzIHFGBtNl6K1j1ktnnd0Jv6n8sr6wD93ymNszB4qlUJ0jFcdSsx
	tVSXFJjD3DrYRFBPZduDx75YBc2eHrahcPRsDswh8NdjUS3G1+L3b+sZjIZgwkgHjVwxxv2zarO61
	w3btunwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB1ZU-0000000FVuT-16q1;
	Tue, 21 Oct 2025 01:53:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB1ZR-0000000FVtj-3yEC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 01:53:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2228245DCC;
	Tue, 21 Oct 2025 01:53:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58C0EC4CEFB;
	Tue, 21 Oct 2025 01:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761011633;
	bh=gEFXq3ZbGcZ2wLt1kNCnmyzf7qCy7XGcSSRG5SuAU8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lhSer6FAbofHcgD61qoh5QzZYC4905I96PcCZWfI86ac1ynePuJi3fg0VrjU9ztAo
	 XkR6dgKlCQnBR0dsVJeZNZPgnQB/RUGODC9QoLTYhQjR6KMtKOAmjqopw3rdEynIfH
	 Vmbx1RjuwgnyFqnleQEZTrdFrVMapKDurCZ6J2JRxqY/dHT6Ar+xeS0eD68/DIOKvI
	 Ysb7LH67G5pD87/ezpN+lEAEQPCuYRmpogqeTZbdxOD/3O1PmZOJawv0JS8N3wEeMx
	 +kifMX87l6Y3ReoHxNohaM65naJhnkJwFJXQEKTfd9ZAYoODmDf/CaWQMRURoY0Bxa
	 xbw5EKuNfqZIA==
Date: Tue, 21 Oct 2025 07:23:38 +0530
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
Message-ID: <rvsyll4u6v4tpaxs4z3k4pbusoktkaocq4o3g6rjt6d2zrzqst@raiuch3hu3ce>
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <hyzzrjn7jzo3tt3oyg7azijouawe3zopfjzq6zfhoo6e6z2m4t@ssl5vl4g557e>
 <zk4ea5cibrkp4vttuy4evrqybf76b3nop5lnyck4ws4nyf2yc4@ghj2eyswsoow>
 <CAMRc=MdWmO4wvX6zpzN0-LZF1pF5Y2=sS8fBwr=CKMGWHg+shA@mail.gmail.com>
 <rfr5cou6jr7wmtxixfgjxhnda6yywlsxsei7md7ne3qge7r3gk@xv6n5pvcjzrm>
 <CAMRc=Me9Td5G9qZV8A98XkGROKw1D2UeQHpFzt8uApF8995MZw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Me9Td5G9qZV8A98XkGROKw1D2UeQHpFzt8uApF8995MZw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_185354_029960_BD242096 
X-CRM114-Status: GOOD (  28.00  )
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

On Tue, Oct 07, 2025 at 02:29:01PM +0200, Bartosz Golaszewski wrote:
> On Tue, Oct 7, 2025 at 12:09 AM Manivannan Sadhasivam <mani@kernel.org> wrote:
> >
> > > >
> > > > Not always... For something like shared reset line, consumers request the line
> > > > as GPIO and expect gpiolib to do resource manangement.
> > > >
> > >
> > > They could use the reset API and it would implicitly create a virtual
> > > device that requests the reset GPIO and controls its enable count.
> > > Except that some devices also do a specific reset sequence with delays
> > > etc. That would require some additional logic in reset-gpio.
> > >
> >
> > I was referring to the PCIe PERST# line, for which the 'reset-gpios' property
> > already exist in the schema. Now, you want me to model this simple GPIO as a
> > fake reset controller and use it the PCIe Bridge nodes through 'resets'
> > property?
> >
> 
> No, not at all. It's just that a shared `reset-gpios` property is
> pretty common and Krzysztof implemented the reset-gpio driver[1] to
> address it. Drivers that request a reset control via the OF interface
> will notice that there's no `resets` property but if there's a
> `reset-gpios`, the reset core will create a virtual device binding to
> the reset-gpio driver which requests the GPIO in question (once!) and
> registers with the reset subsystem providing shared reset control to
> users. Basically the abstraction Srini mentioned minus any reset
> sequence.
> 
> That only happens if the driver uses the reset API. If you go with the
> GPIOLIB then none of this matters. I definitely don't want to change
> the existing DT sources either but I want to find out if the code in
> this series is suitable (with some modifications) for supporting the
> PERST# line or if the logic behind it is more complex and possibly
> requires separate, more fine-grained handling.
> 

All PCI controllers relied on '{reset/perst}-gpios' property for handling the
PERST# signal. Now if we change it to a reset line, then the drivers have to
first detect it as a reset line and use the reset APIs, if not fallback to gpiod
APIs (for DT backwards compatibility), which will add unncessary churn IMO.

But if there is no way the GPIO subsystem is going to support shared GPIOs, then
we have to live with it.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

