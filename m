Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E387E909D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 16:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e44I+gmR/Crii5lzJC5/nGh/rjAXjynQw2DgvMzop3k=; b=KrquxcT1IK0vVk
	/Hqq/CszhjNcGvRNAG8RgkufsQ9HzluH9OIe03vWzg2RgIkXOD4+KlWuiPgtoHmWgFdq2aP1PxL3Z
	HQF+ciaREhp5JE1KTweOpRGLdtU9l37Y1tGvSUkphR/oK47uZB/5HK+Bv3Wdo4IqN9FUIkJw3jjLn
	tPrj9ePHbVUITzzsFFxYSwgAg3YnG9yPZiGZUBY1B5VQQehvp5Si+dNUXs6cqKsQWU3Vj05l0oCLg
	drkujzjZjpU2bqE7fAjKCjSjEwfzLN/9RCVK2Z55EX0yuL1eBWznAhVzbVcebEdPMgM71WQS4qFRG
	umu5/MW40JefdauQEQsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsOAx-00000008adP-2ZuF;
	Tue, 17 Feb 2026 16:43:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsOAv-00000008acH-0QoP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 16:43:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 318844056A
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 16:43:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 118F6C4CEF7
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 16:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771346626;
	bh=e44I+gmR/Crii5lzJC5/nGh/rjAXjynQw2DgvMzop3k=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=uEinzWkhfejDthNLMSVfdDkyp7ZNlrdBHapzEqlt5sMHX0GPeazD25p14sZ81t/uP
	 HOrdojvB5kGpj12bhyOuJ1+NgVk2RiV7+qSI9tGm/wnhbpZCNvcdXrGLqPwWPyenKo
	 Jyoy0TVyjv5wQnb0OynEUCkF+uCIHjzS03bMZM8Qc+A+eguT/vzoLHG9nZKr3s3hX+
	 55+uvw0F81gURTjMubgsUf5EPcuMTdpMLNo3DU9nDCsS9BHJdnHeSf24uJjVJigij2
	 OcoKwaIgZ0ZNsA4Bf/weRPvx5MybGAtP4B5zNkEWklkrxEyo/qfnDPCpsuqbMHgaoK
	 3LsEw+fwntDyQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59e64657f0cso4297261e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 08:43:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUv6a53kvLgLFD0kW6Jfcs1ItLO2yhfkqRa7RAB/3ZBimI38naNn99DeO87tRHjcQU0/hGlflx88JTq1GXxpyf6@lists.infradead.org
X-Gm-Message-State: AOJu0YzRtE8LAoAqWwq+cocmOOQ4xetb+yDPY07k2vk0dWWBufphTL3T
	cgBjjY5g1LIevlZIvHNgpJGy2B6k4Vrp44LVu2A9XcXT2WAA26Gldfxp+oEh1eyejmC8hrA41rk
	7gNBeyIXkhwx723FHT8SkKd06lVqIyuI=
X-Received: by 2002:a05:6512:114a:b0:59e:340:e557 with SMTP id
 2adb3069b0e04-59f6d357cd8mr3391698e87.19.1771346624454; Tue, 17 Feb 2026
 08:43:44 -0800 (PST)
MIME-Version: 1.0
References: <20260216160946.2977985-1-wens@kernel.org> <20260217163208.5db4cd1e@orionap.fritz.box>
In-Reply-To: <20260217163208.5db4cd1e@orionap.fritz.box>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 18 Feb 2026 00:43:31 +0800
X-Gmail-Original-Message-ID: <CAGb2v67NcduBxxrFeVkhi7eKyBBcMKy6dptHFrtZg2-Xs2Nf7w@mail.gmail.com>
X-Gm-Features: AaiRm50IgvwBli9VJ3oskhBXlgPk6-8kaHQNo2uOGlyvC7LHA0MeNNq9rzrpr3Q
Message-ID: <CAGb2v67NcduBxxrFeVkhi7eKyBBcMKy6dptHFrtZg2-Xs2Nf7w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: Implement gpiochip::get_direction()
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	James Hilliard <james.hilliard1@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_084349_182294_9C7CCE41 
X-CRM114-Status: GOOD (  23.57  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Feb 18, 2026 at 12:32=E2=80=AFAM Andre Przywara <andre.przywara@arm=
.com> wrote:
>
> On Tue, 17 Feb 2026 00:09:45 +0800
> Chen-Yu Tsai <wens@kernel.org> wrote:
>
> > After commit e623c4303ed1 ("gpiolib: sanitize the return value of
> > gpio_chip::get_direction()"), a warning will be printed if the
> > gpio driver does not implement this callback.
>
> I am curious how this could slip through? Did the get_direction()
> callback become mandatory at one point, but no one noticed that it was
> missing for sunxi? It looks like the situation was even worse before that
> patch, as it was dereferencing the function pointer without any check?

Digging deeper, my attribution is incorrect. The actual commit that
triggers the warning is 471e998c0e31 ("gpiolib: remove redundant callback
check"), in which a check of .get_direction before calling it was removed.
So I believe this just landed for the next release.

Thanks for spotting that. I'll send a v2 to add that information.

> > Implement it for the sunxi driver. This is simply a matter of reading
> > out the mux value from the registers, then checking if it is one of
> > the GPIO functions and which direction it is.
>
> Mmh, it feels a bit backwards to resort to the function name *string* for
> comparison, when it's always 0 for in and 1 for out (which we actually se=
t
> in pinctrl-sunxi-dt.c now). But the mux value for IRQ is different betwee=
n
> SoC generations, and I guess for historic reasons function strings are a
> thing in pinctrl, so this is probably the best solution after all:

Yeah, I was a bit undecided, but using the raw values for in / out and then
having a string comparison for irq made things even weirder.

> > Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
>
> FWIW:
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>


Thanks!

