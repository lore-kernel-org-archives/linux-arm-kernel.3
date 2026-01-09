Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9119D167E7
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 09:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lvCUtx5/2N6twY/MV8/RmcXhUWl3SJF3OjQzxVTOGEc=; b=2aErtN3MIDAdlLu5nT9NmmdYJQ
	FxlxgSZkHejhRNFUd++HvSgvfIVNB38usRWgyakZQsA5nt8PKnTbPv8NcsBO8stuaX2X34jojegGb
	tPTJszwvwCkkahsnuF1W4zHDbL/Bx2Bl9Rj2YWJQIyUdZjMwDu+0ViT9PP2ZrH99uUnfQeoqH0i0K
	RV8UYPEiP+dJ3MN+L6Sm5vh4X0gIQqQm78jbub8NCiutTM7nyk5znz2J6FbMN8sKWBMYxJtFO0xKw
	vMaY9kFOHpZX4DOsnU5UYnXI44h+yAjYXKR2rMCr3XJ+0oEy9VVLJsoahPRd136vvHUIzJ9HCtsJG
	Sn/2ANpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8vb-000000022Hu-2LBn;
	Fri, 09 Jan 2026 09:37:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8va-000000022HA-0z6T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 09:37:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9F4C16016F
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Jan 2026 09:37:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A51AC4AF0B
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Jan 2026 09:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767951425;
	bh=lvCUtx5/2N6twY/MV8/RmcXhUWl3SJF3OjQzxVTOGEc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=k1S3mpbtE5aWq83pkglx9bxMuO9rIIJA40veSBfR3Ih4DhKbrF09vPpCntWkkcKqJ
	 c3tJglconk7xfWKzG78I3NbeoRpn8SoXCrd3WP8z79QqESQkt2dmu7RexgMir5cDYT
	 XhJW3TlcDFbbSZ4DEYm1d/f5uXevc5v2hez0epEcVrHtASveXcbQ3TaCqkcG32MpaY
	 dYpFd80GxfdygOSXiZBHEDD4JE7BFQvYhYNGIGDAAKt6nbgTs9t18fnmPocMbJxe0D
	 aW0PuvpwhqdCYlOm9XyhlcgkNuAds1V+1Wm4d2jidvbXgdzMA6ujScLHfERK1i4NTf
	 QHw9UmQJqOutQ==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-383153e06d6so10699401fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 01:37:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVJXb1QdUyvh2J1OXXvF+BkjJ0nuZLRW2Rzmga1mC5paqArrWEoctY2Z07mNlm3Cs+tsFaGjY1nG8DIh18bCLsp@lists.infradead.org
X-Gm-Message-State: AOJu0YyRNM6Q/4J1UOMGI4Zel3EyfxzDEBujJfSJceBJpSG5/0qrF7SK
	G0mjIrS1RlqVKa8QPVcd50zjeEDo5kanakGMcrRtsfpZ4h4c/8avnf2x/hbdVkymOF1y9ufuI4Z
	snHMT6wci7bJYZ8XPGu3MdOX+Amizx142q5ZQLF4AsQ==
X-Google-Smtp-Source: AGHT+IFl7lnr3xeQRc2OvTUUx0HFKlM0skfhqeLO8tp3RwjpL9OqVuzKeQVVVivvxwSKJCafm3YmaKxp+HBxFH5PPf4=
X-Received: by 2002:a05:651c:2113:b0:383:f43:ed30 with SMTP id
 38308e7fff4ca-3830f43f012mr13768501fa.12.1767951423985; Fri, 09 Jan 2026
 01:37:03 -0800 (PST)
MIME-Version: 1.0
References: <20260106085253.20858-1-bartosz.golaszewski@oss.qualcomm.com> <CAD++jLmdBefq9JJrfw27Y-FkvywJ9bzJBSOo1RXmS0HjoC5h+Q@mail.gmail.com>
In-Reply-To: <CAD++jLmdBefq9JJrfw27Y-FkvywJ9bzJBSOo1RXmS0HjoC5h+Q@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 9 Jan 2026 10:36:52 +0100
X-Gmail-Original-Message-ID: <CAMRc=McuAJLXdJq+=-bjCsjrSiWrrXr=A9NT+odX+E0P16VWjA@mail.gmail.com>
X-Gm-Features: AQt7F2qWdpw_3OR4mrvwg0EsRFwrEYR_jU3XFkmlc84d4RNtw-j5Dmht-iVh7Zg
Message-ID: <CAMRc=McuAJLXdJq+=-bjCsjrSiWrrXr=A9NT+odX+E0P16VWjA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: amlogic-a4: mark the GPIO controller as sleeping
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Jan 9, 2026 at 10:35=E2=80=AFAM Linus Walleij <linusw@kernel.org> w=
rote:
>
> On Tue, Jan 6, 2026 at 9:53=E2=80=AFAM Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> > The GPIO controller is configured as non-sleeping but it uses generic
> > pinctrl helpers which use a mutex for synchronization. This will cause
> > lockdep splats when used together with shared GPIOs going through the
> > GPIO shared proxy driver.
>
> BTW it is a very *welcome* side-effect of the new shared GPIO rework
> that it just happens to find these old bugs, I'm very pleased with this :=
)
>

Actually, I was surprised I was getting so many bug reports and then
it turned out, there was a bug that caused a lot of false-positives to
turn up when scanning the devicetree for shared pins. I just queued a
fix for that so it should slow down now.

Bart

