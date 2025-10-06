Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E09CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 22:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vQsWYbYRxK3LQRlbomlHUdqUb0LiF7FKXW1s0uc8skw=; b=cGOm7/2aGCAqtDy2SFZX/MHmwq
	lRljuxLTBuE42RSTB7KGGC/S9OCxuwMw7NeuD7ItsFkCkABfvCUnPdoYaHGOhz8RxYyrwnq3yzWQs
	yUI0qxWD/5W2IEwTE6+XPq0vrw5xbefbrLtW381O41iapuIAmjCzSlsl5Ha+AKb7Wrma1rlTAA7Lc
	8wiR8FEzq9/mhgvg9Y1u7RHvWIkrg/JvDLFyKpyHCF6tPo5ap5K72PKoPUiHmKxSwj2QlNpc9Tltw
	ByoQ73YhuT7gZPThInHVfnqI/yRVthKdSL/guRl6Fd2gKTnBt78ioDmE74K912mJ32mnrz12xe7Zm
	/+Em2lGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5tOK-00000000tSF-1HkQ;
	Mon, 06 Oct 2025 22:09:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5tOH-00000000tRs-3vuG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 22:09:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D573D419E5;
	Mon,  6 Oct 2025 22:09:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A569FC4CEF5;
	Mon,  6 Oct 2025 22:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759788548;
	bh=HwUN7J8ArjHOInDdcpqRzu7gnAEX4XfnbmUq6Y2Ey+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OadGq4OTA3RaVEV5z0R+a2vo8JhA0rY/4gwcSliNnqiGvKEaC6en4KpK3lQIE5r5C
	 9BDESevRDb5QPgUdzajGh9H4oclojsoUntXwDy2qVmjzJ7S+Ci5zAiXseQ3s8byF1u
	 Vizrr++wLQsWdhF3Ymz3zmpWxrcsovG8aoWHo25KGyM9Mbz39aNzwn2VIfaNaHA9pE
	 b3Ygaa1ca+/BULJ33M62ORf0IFYxn1x+xSgVvbCANPBxP1PA09IfbI3xHSZ43qnoZq
	 RzOhyVjVXhiN1+rANDljbbRtwkLlBD+4jFZmv8QPG58xaSp8+PWYrifUn3D9iJBn7o
	 +dQMGmfQmR9ng==
Date: Mon, 6 Oct 2025 15:09:06 -0700
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
Message-ID: <rfr5cou6jr7wmtxixfgjxhnda6yywlsxsei7md7ne3qge7r3gk@xv6n5pvcjzrm>
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <hyzzrjn7jzo3tt3oyg7azijouawe3zopfjzq6zfhoo6e6z2m4t@ssl5vl4g557e>
 <zk4ea5cibrkp4vttuy4evrqybf76b3nop5lnyck4ws4nyf2yc4@ghj2eyswsoow>
 <CAMRc=MdWmO4wvX6zpzN0-LZF1pF5Y2=sS8fBwr=CKMGWHg+shA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdWmO4wvX6zpzN0-LZF1pF5Y2=sS8fBwr=CKMGWHg+shA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_150910_015273_18E97446 
X-CRM114-Status: GOOD (  24.48  )
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

On Mon, Oct 06, 2025 at 06:10:59PM +0200, Bartosz Golaszewski wrote:
> On Mon, Oct 6, 2025 at 5:43 PM Manivannan Sadhasivam <mani@kernel.org> wrote:
> >
> > On Wed, Sep 24, 2025 at 11:25:12AM -0700, Dmitry Torokhov wrote:
> > > Hi Bartosz,
> > >
> > > >
> > > > The practical use-case for this are the powerdown GPIOs shared by
> > > > speakers on Qualcomm db845c platform, however I have also extensively
> > > > tested it using gpio-virtuser on arm64 qemu with various DT
> > > > configurations.
> > >
> > > How is this different from the existing gpio-backed regulator/supply?
> > > IMO GPIOs are naturally exclusive-use resources (in cases when you need
> > > to control them, not simply read their state), and when there is a need
> > > to share them there are more appropriate abstractions that are built on
> > > top of GPIOs...
> > >
> >
> > Not always... For something like shared reset line, consumers request the line
> > as GPIO and expect gpiolib to do resource manangement.
> >
> 
> They could use the reset API and it would implicitly create a virtual
> device that requests the reset GPIO and controls its enable count.
> Except that some devices also do a specific reset sequence with delays
> etc. That would require some additional logic in reset-gpio.
> 

I was referring to the PCIe PERST# line, for which the 'reset-gpios' property
already exist in the schema. Now, you want me to model this simple GPIO as a
fake reset controller and use it the PCIe Bridge nodes through 'resets'
property?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

