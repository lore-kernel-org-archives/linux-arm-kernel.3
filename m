Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A50CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 17:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hDi+5M2k5Ml1K9ClJ80BwZv3vRmscPjpCQVBDoPQMTA=; b=c+FCOl+FNN+V6EtcUJC27X69um
	7TQ9ompFp07/WRNVCvtrtmmWNrwexMvViYsFIyJ2k9NJ6bMMjSxOxI2ILGVzMSlWE6bu4Ka6TyXhn
	wtZbwLjrRT8FmADaCjWJcJEzSY3EisCeKsIwx482DZHfonnJyX62iQzIkM26Sfg/oX00OTui5VTwD
	6tcR3BIqSGyuca0QGXvE0LjHxYn7O0YfDBVzcVzuwRNrLTc5LO2Nw6NMA8wo1PmQRn2eHjlp2po2Q
	hZCAAqZEfhhH6+Sz6q/Jw8yJsJfaPq/GezvgAOoEiakdjOJzoDVUWlToy9vzUZcTNd4i0NhK6IeP0
	tUaNHFpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9oEN-00000008asG-174M;
	Fri, 17 Oct 2025 17:27:07 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9oEL-00000008aru-2TOu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 17:27:06 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-57bd04f2e84so2681905e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 10:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760722023; x=1761326823; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDi+5M2k5Ml1K9ClJ80BwZv3vRmscPjpCQVBDoPQMTA=;
        b=Mwe6noKSCGE0okFSztpcMCZnXewgCN6AaEz/jgcGfA1h0zyuC5ut9n77YQ3Tx1csbD
         QrhAJKXwbxOgVQjtgsKjD5YLLWbsHBEee+rsuGP/3Yj++r2OMooeZTt2pFu766PaL40p
         8b8ogclFSIGJ4e7QVrAg8zSyB22bkRJ6gcINdJ/535Fqa4yWNYFvJrLXMJAwvzJrCHjz
         4WVvjLwAMgngP/G1wQEnp5UBkoa1SFWxaiTCFQLivqX1lhKIP/VuCqvlTsPeJGyjcQEk
         WIwCkND8Td/3dqFvAGu9FUIdbdGUh9TNTFwaJqs2XDUw84sPAVBZrTj3W7HjTumaYfdn
         cFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760722023; x=1761326823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hDi+5M2k5Ml1K9ClJ80BwZv3vRmscPjpCQVBDoPQMTA=;
        b=YUwPEVYqRyyORjRZxMiO9QAG2JkB7fUr53k4JhC8vFjpRUMsp6s/klp6v87edKX3Wn
         XQoHDxazIYBZZf3lYQfhj7+8L01lNX9lhwiVhkDkLmYEXnRA+fy2wL8ZYASCEiW1+fLA
         xyI23eEyHYOfuVkr4qZvRoCYkC9H2PHyTIUUfmwBQ35nhWtC2LavN88SQ7wGPkBHGUMx
         skWgk8qAvEQzdbyShXPo2nkGz2ilklMUxh+Tio8uy06sbhvfGW7Zp9nTHdPCsBUpFo4k
         qTUZjAbh1Vafvsf38Nh9qfnfeVKMviHsOByUD90rdaiy9KOU22SVKUUItwpB6fa1HihM
         QtuQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/T9wEQlwPdM0lCs8U/r1Vby8rLat3ZZCVLDHTu/UDkn2ezlgo3VruYoqkShtwLASD1zx4ORSkcFrXl3JOWiI7@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6ft3SGr0nk3u+eOF2kjwbBRP4rkxWiTboK1QsCiOlrBAqSOpf
	RBquNcwqDWcqgp9KHg8mOatGf8qFAvJVDKjQeggDJqfhMIzvm+V0F2IdSlCLNL3JUlibm+7nCRR
	uX1eBNnXyK06rJYyis3zBaPP2Yb5HrVIJxWMWnVgWIw==
X-Gm-Gg: ASbGncvzo4u4BA8NmaT3FRfsXxxcTek+sOHhGae0UTVxnNkIUAwMKOF/LhXph7ngwPi
	rVl3iRwr/sxEnE1APWHjNySD5FJNZ43/NzhHXL5k9CKIxFE/dG1HlklCq6HEYq5Tvae555RmbIH
	m7ibDsbMf9/BqfJZDBwr8HiirkuiNXR0KD/7oK/26/SL9NW35GjVyo91uGcS/VhGLedPXKFk80b
	x6ul/qqyGYm97vWVXyhWI4XhScY5Ss8XbKshnDGxbYcyhOr7iBPVU+oxvhieBO/ewBaQWDXlSpu
	8ZEKvES5GZPKkJdLMLSkm561FJs=
X-Google-Smtp-Source: AGHT+IEnROQjyiNXa20y9fdKGDuy8cXUgGRQbjpjaM5VjMNNuXFx1RyY7/MYDJo1ov+PfI5vPHyhYoMIz6wqTgC382I=
X-Received: by 2002:a05:6512:3b96:b0:58a:f7e0:7284 with SMTP id
 2adb3069b0e04-591d84fed59mr1542688e87.13.1760722022961; Fri, 17 Oct 2025
 10:27:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
In-Reply-To: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 17 Oct 2025 19:26:51 +0200
X-Gm-Features: AS18NWBvQScHzFXgOzgmGaLsZFy2d0XcQpPFsgGo-dqtoYRGPaRXMw7LL4aRoyw
Message-ID: <CAMRc=Me4Fh5pDOF8Z2XY4MG_DYqPRN+UJh_BzKvmULL96wciYw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Bartosz Golaszewski <brgl@bgdev.pl>, Mark Brown <broonie@kernel.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Catalin Marinas <catalin.marinas@arm.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Will Deacon <will@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_102705_661246_06D734F9 
X-CRM114-Status: GOOD (  41.08  )
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

On Wed, Sep 24, 2025 at 4:51=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> Here's a functional RFC for improving the handling of shared GPIOs in
> linux.
>
> Problem statement: GPIOs are implemented as a strictly exclusive
> resource in the kernel but there are lots of platforms on which single
> pin is shared by multiple devices which don't communicate so need some
> way of properly sharing access to a GPIO. What we have now is the
> GPIOD_FLAGS_BIT_NONEXCLUSIVE flag which was introduced as a hack and
> doesn't do any locking or arbitration of access - it literally just hand
> the same GPIO descriptor to all interested users.
>
> The proposed solution is composed of three major parts: the high-level,
> shared GPIO proxy driver that arbitrates access to the shared pin and
> exposes a regular GPIO chip interface to consumers, a low-level shared
> GPIOLIB module that scans firmware nodes and creates auxiliary devices
> that attach to the proxy driver and finally a set of core GPIOLIB
> changes that plug the former into the GPIO lookup path.
>
> The changes are implemented in a way that allows to seamlessly compile
> out any code related to sharing GPIOs for systems that don't need it.
>
> The practical use-case for this are the powerdown GPIOs shared by
> speakers on Qualcomm db845c platform, however I have also extensively
> tested it using gpio-virtuser on arm64 qemu with various DT
> configurations.
>
> I'm Cc'ing some people that may help with reviewing/be interested in
> this: OF maintainers (because the main target are OF systems initially),
> Mark Brown because most users of GPIOD_FLAGS_BIT_NONEXCLUSIVE live
> in audio or regulator drivers and one of the goals of this series is
> dropping the hand-crafted GPIO enable counting via struct
> regulator_enable_gpio in regulator core), Andy and Mika because I'd like
> to also cover ACPI (even though I don't know about any ACPI platform that
> would need this at the moment, I think it makes sense to make the
> solution complete), Dmitry (same thing but for software nodes), Mani
> (because you have a somewhat related use-case for the PERST# signal and
> I'd like to hear your input on whether this is something you can use or
> maybe it needs a separate, implicit gpio-perst driver similar to what
> Krzysztof did for reset-gpios) and Greg (because I mentioned this to you
> last week in person and I also use the auxiliary bus for the proxy
> devices).
>
> First patch in the series is a bugfix targetting stable, I'm surprised
> nobody noticed the lockdep splat yet. The second adds a library function
> I use in a later patch. All remaining patches implement or use the
> shared GPIO support.
>

Mark,

I was working on extending this series with patches that make the
regulator subsystem aware of shared GPIOs managed by GPIOLIB. I admit
that after our previous discussions I was under the impression that
the regulator core not only manages the enable count of the underlying
non-exclusive GPIOs but also emits the relevant
REGULATOR_EVENT_ENABLE/DISABLE notifications for GPIO-driven
regulators when the physical pin actually gets enabled/disabled
respectively.

Upon a closer inspection it turns out that this is not the case - the
ENABLE/DISABLE events are emitted when the *logical* regulator is
enabled/disabled even if this does not involve a change in the state
of the shared pin.

Example: the tlv320aic3x.c codec driver may use a fixed regulator that
uses a shared GPIO pin. The regulator in question may get disabled but
its GPIO might not change state as it's still enabled by a different
regulator. The driver will still see the disable event and put the
codec in reset.

I'm not saying this behavior is incorrect, I'm just mentioning it as I
thought that there's a need for some GPIO descriptor notifier that
allows to signal the actual change in value to users but it doesn't
seem to be the case if we just want to maintain the current behavior.
The only change we need to support the existing NONEXCLUSIVE flag and
the new shared GPIOs at the same time - until we convert all users -
is providing gpiod_is_shared() and just making regulator core skip the
descriptor comparison and referencing via struct regulator_enable_gpio
if it sees that a GPIO descriptor is shared.

I will post a v2 early next week.

Bartosz

