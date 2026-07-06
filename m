Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E74C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:References:MIME-Version:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mMOHKFFZAAczlMc6WVTA48dAzb0rmPjbxJcYFNK20Dw=; b=5EX8D+KJrE4pWWWHHLj3bAYr2H
	1maW8tPMfU6U9qGavnDwuCb9jtQu/DGuu5IDyyZjAcUBaqmoHhGE/DHBAbp7fXL0gTmsuwceckYP6
	gKll4p53yz7G0eYFqomvJmPovV5h+uLTG9x5KuHJ/7UNp72k7aZnFcK8VpSpogGEefz7jbRP2xV1w
	jQuIiBmKuqfEqQQlY9weTpd4OfEcckZ/w7m2Hicc2LSEqmmwX2U8mES7tid/5noZbaH2QPxf7UMhf
	7UvjkhoF1pHUEgVIzqnkkgbpLwsVHVDpnDIc94YUXrlBLBSDc9Lm73Ioz34xRHsS9wkJzhuZWJQ0s
	aPjzkPig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfUr-0000000BzvM-0HOh;
	Mon, 06 Jul 2026 09:20:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfUp-0000000Bzv3-29pB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:20:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C55460018
	for <linux-arm-kernel@lists.infradead.org>; Mon,  6 Jul 2026 09:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32E411F00A3E
	for <linux-arm-kernel@lists.infradead.org>; Mon,  6 Jul 2026 09:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783329610;
	bh=mMOHKFFZAAczlMc6WVTA48dAzb0rmPjbxJcYFNK20Dw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=c7ezCPs1TAZYrSCWESJaoMLcN7mbvuewNN6WqS1K8nCCyUWtiq9uoxQTwZ4MST6l6
	 gnZdA5WkNUybFyOwehuwKN12VmkTgmIdruDyFpYMF15fd9RYQXQc8eC/GjfpHBou7W
	 Sn818PHsFiisEq/9dKZSXvRImRaPPLI5mikbVOHLQb64lvI46yCjxcb8EoBp6JFOBo
	 VI8xY7ln/KI99rBgrn00pUtF8FP6AjtvNdAVa+tKakYzPjscvKqMg4LXwx964med2b
	 saFog7u7XctdEnSV/Z0rLpTMZukWd33MbrcLAHrl5pJ0rJY88uyGykvi+y45uWMTkg
	 u0ixVO5MfXBiQ==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39b1eb7bd9bso23360921fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:20:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpF8W/+rZtrBAA0H8zukIWifCg1U0Pt1kxDvmptisyYYxpeRytbIAUPlNGrR9YXCN13s5s47zw1q/ILkWtsve/J@lists.infradead.org
X-Gm-Message-State: AOJu0YybdDnK7Hvos7u54ClBMsEKFLfw8eM3Tv20EwpUonwIJkcAOgVN
	NaMtTKAWHacES0Qk22omRCJfemf3ljfbx/sWqWOgN5cnOpZy1UveC6tiR69VsFFWuu/DHOPqrVe
	J8Q/mAKGf86qXERGZERq3BKPlUNXlGudVqkAWfEgm3Q==
X-Received: by 2002:a05:651c:1141:b0:393:a31a:ab3c with SMTP id
 38308e7fff4ca-39b53cd3647mr17735411fa.25.1783329608951; Mon, 06 Jul 2026
 02:20:08 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 05:20:07 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 05:20:07 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAD++jLn0BSwS1CZ22CbZQnY4mKzikRwJrfO4sV=WVsSG93WzJg@mail.gmail.com>
MIME-Version: 1.0
References: <20260313000652.11470-1-andre.przywara@arm.com>
 <a4cfb10e4701da0649ef648136496a962be5870d.camel@icenowy.me>
 <20260315014205.471d6834@ryzen.lan> <CAMRc=MeorQJvA8TBosjnDU+x-FD6GhkbXwXOjCD0nmCs16ERfQ@mail.gmail.com>
 <72ccedfb-742c-4af7-8439-0f37fff2853d@arm.com> <CAD++jLn0BSwS1CZ22CbZQnY4mKzikRwJrfO4sV=WVsSG93WzJg@mail.gmail.com>
Date: Mon, 6 Jul 2026 05:20:07 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mfn_02MHq7+6a+EW3G3k-sBiwsWm=ZdgmRyUzzqxQ9wfw@mail.gmail.com>
X-Gm-Features: AVVi8CculI4vXkTb9WSQaLZ6xCxpZAUy7ZfCjLrW5Zsan3hxafIZ3f8Vh1j3nQY
Message-ID: <CAMRc=Mfn_02MHq7+6a+EW3G3k-sBiwsWm=ZdgmRyUzzqxQ9wfw@mail.gmail.com>
Subject: Re: [RFC PATCH] pinctrl: sunxi: convert to GPIO_GENERIC
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Icenowy Zheng <uwu@icenowy.me>, Jerome Brunet <jbrunet@baylibre.com>, 
	Andre Przywara <andre.przywara@arm.com>
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

On Fri, 3 Jul 2026 23:25:16 +0200, Linus Walleij <linusw@kernel.org> said:
> On Fri, Jul 3, 2026 at 3:53=E2=80=AFPM Andre Przywara <andre.przywara@arm=
.com> wrote:
>
>> Hi Bartosz, Linus,
>>
>> so I wanted to come back to this, posting a A733 v2, with this patch
>> included, and was wondering what the consensus on this matter would be?
> (...)
>> So personally I am leaning towards doing the change: most users can
>> typically adapt - or they don't care because they don't update their
>> kernels (beyond stable revisions). And to address the naming
>> ambiguities, we could push for more gpio-line-names. That would make
>> finding a GPIO much safer and easier, and works either way.
>
> I agree.
>
>> But if this patch's ABI breakage is a showstopper, I would need to know,
>> so that I can rebase the A733 pinctrl patches without this one being the
>> first patch in the series.
>
> I am *FOR* this change.
>
> Wikipedia has some policy like "avoid copyright paranoia", and
> some days I feel we need an "avoid ABI paranoia" policy.
> Rough consensus and running code.
>

Agreed. Let's do this.

Bart

