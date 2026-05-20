Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4469CD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 06:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F5OWh7vDe8NWAJEl7Un5LdCvfs5C5QmSjVqPyrD3i3A=; b=b+c55Jm140/CZWTdLU9OEPR8vO
	ju+TtP1trDSwgBAb3k5n8ArPtJhE5GHZRldUyZ3davzfIima4vgRNlgDRBGSoQ3+qqqS3CN2xXpKC
	9u5xMJf4M4OKIsplQfoljsRs5xacHnOW0729+UUxLwLChpfYrQ/ny1LDe528x8Ygqan44n7K8P6FQ
	lhAoTe5MO6rWNgJdCTqllUIF1htOWuV4xaF/joSXDEvT9gwhCpbyLorlqEBJTddVZBITLzMivh8Pk
	or4WONsq85ZysRfs6ekKFzYTSMWti7GicT4wjd6f6dvaTy8m6AtyMGaue+lfs9uYhwx/oXHvxYYKC
	lG3ZisOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPaq4-00000003iut-3sXB;
	Wed, 20 May 2026 06:55:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPaq2-00000003itw-1MeD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 06:55:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5321E437DD
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 06:55:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 379091F00893
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 06:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779260129;
	bh=F5OWh7vDe8NWAJEl7Un5LdCvfs5C5QmSjVqPyrD3i3A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EIodqNHFKu2VMguG6saeXE9j+edQmczdI5zoWCbdBCwLYJVQfJlf/HZ+K2qBe+XTE
	 433t6U49lPuiqljHcabKaf//T/Ivu/dyQKc4BaXvdX4djVhBUNMag7oYL1NkNgogXo
	 EM5ac0RkE9gFIzlgt1MzQPfqcW5rPGqZBbxVchG0vCsQDN+qVou1OWDjyM3YrD6Zbf
	 cCmS8YYShE+bOPmlbpujetiKd33MxxlzzdJ000XqgzkfSNSGBZxDqNciAeozQZ4tZQ
	 weSOz1HzuK17mh4DwrHTOkvugB0nGBFiehKFfFegymqqe5RDgFSNsZadrrDVuBzajM
	 0+6grBEBV+Vew==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a4113ab355so5511750e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 23:55:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+BJhDxXlTUIzb9gx1jjSp9ibDyRlxiY+I2WZsHaIc5tjKtMpOh7OVtUFXuQTWTzsoT5QzaBICjvBpS15HYVU8/@lists.infradead.org
X-Gm-Message-State: AOJu0Yw19Zsq0FAtqpSIBJoJ21dSkbujumMVgl9EUKoUcKwQduL+nVmr
	t9SzsUWrd+p120v16WsldKmDlZH12PCFWUCf+wm7TnN0YqG58XSr++XDFD4uiDFtnScREQ1+i1r
	ensTJw5GcnrwXVNY9zZCHKlqtSQl4Eh1ZQp2d2EZpIA==
X-Received: by 2002:a05:6512:3d88:b0:5a8:6747:b053 with SMTP id
 2adb3069b0e04-5aa0e7322a9mr9105074e87.27.1779260127999; Tue, 19 May 2026
 23:55:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260309-gpio-hog-fwnode-v2-0-4e61f3dbf06a@oss.qualcomm.com>
 <20260309-gpio-hog-fwnode-v2-5-4e61f3dbf06a@oss.qualcomm.com>
 <ag0Dn66ZVnbTc7J2@google.com> <ag1GJygtLgngKQqj@google.com>
In-Reply-To: <ag1GJygtLgngKQqj@google.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 20 May 2026 08:55:15 +0200
X-Gmail-Original-Message-ID: <CAMRc=Mc=EohSiLTnmpVKJ_ECog0Km3iHSic0V_f6wKqB2z9aLg@mail.gmail.com>
X-Gm-Features: AVHnY4L05DYyj4JGkURacGAhkQpr2W67TrPmN7V2hcVAFkR5gQz7mSESeVfBauE
Message-ID: <CAMRc=Mc=EohSiLTnmpVKJ_ECog0Km3iHSic0V_f6wKqB2z9aLg@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] gpio: remove machine hogs
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Frank Rowand <frowand.list@gmail.com>, 
	Mika Westerberg <westeri@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_235530_390733_ACCDDF07 
X-CRM114-Status: GOOD (  14.13  )
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

On Wed, May 20, 2026 at 7:27=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> >
> > If there is no replacement maybe we can resurrect this? Or shoudl we
> > have add swnode support for hogs?
>
> Hmm, I guess it is already there so I should simply switch. Sorry about
> the noise.
>

Earlier in this series you have examples of using software node based
hogging, I hope you can use it?

Bart

