Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7534E109022E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 14:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2qZmPjwf9sxJxy3MIbxj/C2IpScaTeLYjR+ICQrWCi8=; b=l2QY2R8TfIeZC8
	k5l2faMZN7OWENW0tDcgIbpAYxcUprJ307nhw7w16EhnfqpoYfLAhooTOT7A9rk4T5+qQQvhW7GEq
	2ZIEQIu0NlLjAdWy+F1lta0SqhWUlARoN57B/vpkq2vdbdKbgwagRvkm3WrbWysMpQkWFKiUDnFdz
	miWZ1sh3Ccp9q/X7PNq6jhztRIYI4vuBS5LXHoRgePZ8eT2i/lm7/prnVwmZeHXh15Bd+XPcD+XYp
	j4AAuB/S1SoNI22wa6SyeFNzJ9FGlW7PWU04XYbqsqmKUnNUq1oThOdFvKM9q1sHBJTvwOEPTfcru
	SmcCuhRYTklxXybA0Uvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3E1n-0000000Ajiv-3VvV;
	Thu, 19 Mar 2026 14:07:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3E1m-0000000Ajia-1CJe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 14:07:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5BD304386A
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 14:07:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CA5AC2BCAF
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 14:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773929229;
	bh=2qZmPjwf9sxJxy3MIbxj/C2IpScaTeLYjR+ICQrWCi8=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=ootwNNm4cuQxYY4EJRwzOCAabm63S0eKokeqZ0ji686cHJCQmo1YwIRPncnFpXhD5
	 Hv4IVZ0w5vdWtUb+CIuIUjDPY45pSfruqBJZV41WyE0LZSgNzndGqulgugmT6hr3uD
	 kYgP5ab58lgplsOMNHjUfoGb2h+HWHQXBURkEgDS1FA6YfxijSbA8QH7uC8nHyRIAP
	 eZ24RTjHBRvyqdIrIjawFcypJjx8lZjodzgdCfLGQ3cKz+iEV3MGSegtZp068OQ881
	 OwRq3o0wu+lnqHyNE3zoWp3X6p+DhCYdATKJ4ozgAPF3kKufzmvJVeq1cRvMabgFgj
	 qt4kOfXi1KQZQ==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38bcda08c76so8672931fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 07:07:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWb9GjCmNj/dWWCGn5RdUWgmJA5TZlYd14GbR08rQdtF2d9kNY0We08IJGec0OGSlqgsrMXUhAeC5/yqVQDQHbZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxrKwBOqH5LURbw4dXsybrKkTGdr5/Y1/G32dBDTkAs0YU6Ax4e
	UARFYY9RfqSd6ce6+FDSVQy7h1RQQr/Zy8VG7nJ53Zef9IE26DttXJRsNKKjJ5zh6uL4693movr
	bR7X5iGVZXZiaOnbjE6Q+oxtsqZMfu5g=
X-Received: by 2002:a2e:ab83:0:b0:38a:7fc1:8da4 with SMTP id
 38308e7fff4ca-38bd57d7b01mr30183221fa.13.1773929227663; Thu, 19 Mar 2026
 07:07:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260314-rc2-boot-hang-v3-1-0b48221181a9@mmpsystems.pl> <CAD++jLnVNT=_rrykAx82RE8SeBsBBdN6gFMcDUYwYj0KOpF0Ug@mail.gmail.com>
In-Reply-To: <CAD++jLnVNT=_rrykAx82RE8SeBsBBdN6gFMcDUYwYj0KOpF0Ug@mail.gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 19 Mar 2026 22:06:55 +0800
X-Gmail-Original-Message-ID: <CAGb2v64mBzT0_4a5qfDFVzSgZQkmkyi0TLz9qLWVtUnsG47TwA@mail.gmail.com>
X-Gm-Features: AaiRm507880ksTyPae_Tfo3kI5iCdDkoO5nmPHO2zqtp2PgnkBXyA4BbQFNuT5U
Message-ID: <CAGb2v64mBzT0_4a5qfDFVzSgZQkmkyi0TLz9qLWVtUnsG47TwA@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: sunxi: fix gpiochip_lock_as_irq() failure
 when pinmux is unknown
To: Linus Walleij <linusw@kernel.org>, Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_070710_362497_940389FC 
X-CRM114-Status: GOOD (  18.53  )
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

On Thu, Mar 19, 2026 at 9:46=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> On Sat, Mar 14, 2026 at 9:10=E2=80=AFAM Michal Piekos
> <michal.piekos@mmpsystems.pl> wrote:
>
> > Fixes kernel hang during boot due to inability to set up IRQ on AXP313a=
.
> >
> > The issue is caused by gpiochip_lock_as_irq() which is failing when gpi=
o
> > is in unitialized state.
> >
> > Solution is to set pinmux to GPIO INPUT in
> > sunxi_pinctrl_irq_request_resources() if it wasn't initialized
> > earlier.
> >
> > Tested on Orange Pi Zero 3.
> >
> > Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> > Suggested-by: Chen-Yu Tsai <wens@kernel.org>
>
> Should this have a Fixes: tag and should it be applied as an urgent fix?

Fixes: 01e10d0272b9 ("pinctrl: sunxi: Implement gpiochip::get_direction()")

> Tag for stable?

The original patch wasn't tagged for stable. And it doesn't seem like it
was auto picked.

> Also: is there consensus with Andre that this is the way to proceed?

As Andre mentioned, the mux value for "disabled" is different between
generations. So we likely need to make the value part of
|struct sunxi_pinctrl_desc|.

Michal, can you respin a version so that we can get this fixed in the
same release?


ChenYu

