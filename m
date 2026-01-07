Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA33CEFD1E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 12:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aC4dQpwWY67Pr1s8pD1vOs3Ml5RZB/U6tmfYOtjNAxE=; b=1XyQSz1HIYGhw9dqEgRYjdAobm
	lgSNvd5xdqd5YAc2k8Okw/Wf57gTSebsQGBbtMN9hk9BZsdNA0QXT3RPd4K43i8Sw5hB1yiKEvAI8
	/8WhQt6/tCtYP1VhfKlvch7oQ1S7SkHUX0WGWPn9ypdAWfhWqDg5Ol0qRz62JH1zRJX0COHSb/1/a
	EWcl6HADAY3S+jSK+5dgFIjvFHiQtN4/MV57nMPQvQvP5vk/9Klwi5y4IjlA47ju0Ma2twlE6Gtx/
	vx7gfK8oGWuEfbqcd7GhA2QyZHno61oAg6oJx79ZTOuh0uZh7FeqIKKoE8TAswxnVdXqJe/fcbVpI
	Ts76Q+5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdSZp-0000000Ets2-073f;
	Wed, 07 Jan 2026 12:23:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdSZm-0000000Etqh-2aCd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 12:23:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9395F60126;
	Wed,  7 Jan 2026 12:23:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D62BFC19422;
	Wed,  7 Jan 2026 12:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767788625;
	bh=U+amxbSOoYQbK/xsz0wmkUqTLQp0tiL1lBiG3B9K0nk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q41OJl5w7VkYd4FjA2qYUC7vz/pZwWhX3C8Suuom+WLMcUNk7owgmQH9EpuVIil/Q
	 ZLNnnA3U4lXTkGAytypr4npJrQ/7bUs1OijZDZw/bBzbt0JWdzsCJYbweBBfRRzQbc
	 v2XOOniMcbwCsWbgj4jjA415aZKljbY7AX1dVyTxE+eLhHqrm9jB0ZRKo1LXVOqtGZ
	 mumRWJ67sOf1t1L4j6H4h1+dKEU+wPlzY5DA9MdJA1Ve5Bq1wr5lhOfaeXCEZtj9Eb
	 cQ92gCQ9db3s5k3M0bjON4WVUM30Q3JaxI9pI6x+S6GlEqSF4Rclqt+8PuPBT62WSl
	 EXU53e0m02YYw==
Date: Wed, 7 Jan 2026 17:53:32 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>, 
	Mika Westerberg <westeri@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v4 00/10] gpio: improve support for shared GPIOs
Message-ID: <o6zgxnr7gmzd5mwmkccbe7ch7baj3lxuecltzo24ukj2vfujxu@bxnaci5oqsic>
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <fimuvblfy2cmn7o4wzcxjzrux5mwhvlvyxfsgeqs6ore2xg75i@ax46d3sfmdux>
 <uc7utm7tbtmkk6osaoydibd5evtpm246sjrpkx3lpclpk4srea@a4g65oduswau>
 <p4fwvwbhwbdpiqvspjq4stjyuxy5pqvdei3wfianw4aeujmgbx@utumnrffangf>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <p4fwvwbhwbdpiqvspjq4stjyuxy5pqvdei3wfianw4aeujmgbx@utumnrffangf>
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

On Wed, Jan 07, 2026 at 02:12:28PM +0200, Dmitry Baryshkov wrote:
> On Wed, Jan 07, 2026 at 05:17:09PM +0530, Manivannan Sadhasivam wrote:
> > On Wed, Nov 26, 2025 at 06:27:13PM +0200, Dmitry Baryshkov wrote:
> > > On Wed, Nov 12, 2025 at 02:55:29PM +0100, Bartosz Golaszewski wrote:
> > > > Bjorn, Konrad: I should have Cc'ed you on v1 but I just went with what
> > > > came out of b4 --auto-to-cc. It only gave me arm-msm. :( Patch 7 from
> > > > this series however impacts Qualcomm platforms. It's a runtime dependency
> > > > of patches 8 and 9. Would you mind Acking it so that I can take it into
> > > > an immutable branch that I'll make available to Mark Brown for him to
> > > > take patches 8-10 through the ASoC and regulator trees for v6.19?
> > > > 
> > > > Problem statement: GPIOs are implemented as a strictly exclusive
> > > > resource in the kernel but there are lots of platforms on which single
> > > > pin is shared by multiple devices which don't communicate so need some
> > > > way of properly sharing access to a GPIO. What we have now is the
> > > > GPIOD_FLAGS_BIT_NONEXCLUSIVE flag which was introduced as a hack and
> > > > doesn't do any locking or arbitration of access - it literally just hand
> > > > the same GPIO descriptor to all interested users.
> > > > 
> > > > The proposed solution is composed of three major parts: the high-level,
> > > > shared GPIO proxy driver that arbitrates access to the shared pin and
> > > > exposes a regular GPIO chip interface to consumers, a low-level shared
> > > > GPIOLIB module that scans firmware nodes and creates auxiliary devices
> > > > that attach to the proxy driver and finally a set of core GPIOLIB
> > > > changes that plug the former into the GPIO lookup path.
> > > > 
> > > > The changes are implemented in a way that allows to seamlessly compile
> > > > out any code related to sharing GPIOs for systems that don't need it.
> > > > 
> > > > The practical use-case for this are the powerdown GPIOs shared by
> > > > speakers on Qualcomm db845c platform, however I have also extensively
> > > > tested it using gpio-virtuser on arm64 qemu with various DT
> > > > configurations.
> > > > 
> > > > I'm Cc'ing some people that may help with reviewing/be interested in
> > > > this: OF maintainers (because the main target are OF systems initially),
> > > > Mark Brown because most users of GPIOD_FLAGS_BIT_NONEXCLUSIVE live
> > > > in audio or regulator drivers and one of the goals of this series is
> > > > dropping the hand-crafted GPIO enable counting via struct
> > > > regulator_enable_gpio in regulator core), Andy and Mika because I'd like
> > > > to also cover ACPI (even though I don't know about any ACPI platform that
> > > > would need this at the moment, I think it makes sense to make the
> > > > solution complete), Dmitry (same thing but for software nodes), Mani
> > > > (because you have a somewhat related use-case for the PERST# signal and
> > > > I'd like to hear your input on whether this is something you can use or
> > > > maybe it needs a separate, implicit gpio-perst driver similar to what
> > > > Krzysztof did for reset-gpios) and Greg (because I mentioned this to you
> > > > last week in person and I also use the auxiliary bus for the proxy
> > > > devices).
> > > 
> > > Hi,
> > > 
> > > I'm sorry if this was already reported and fixed. On Qualcomm RB5
> > > platform with this patchset in place I'm getting the following backtrace
> > > (and then a lockup):
> > > 
> > 
> > On Rb3Gen2 this breaks UFS:
> > 
> > 	ufshcd-qcom 1d84000.ufshc: cannot find GPIO chip gpiolib_shared.proxy.4, deferring
> 
> CONFIG_GPIO_SHARED_PROXY=y ?
> 

Ah, it was selected as =m and not part of initramfs, so it didn't get loaded.
Building it as =y fixed the issue. But that was such an implicit dependency.

Also, it should only be used for shared GPIOs, isn't it? But on my board, UFS is
not using a shared GPIO. So why is it coming into the picture?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

