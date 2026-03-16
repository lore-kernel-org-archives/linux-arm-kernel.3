Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E9CF013F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 09:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IHP2z/7YeWXK6Tx4xtubEup0KBNca0fnUaaTxKTXo0I=; b=fN0uvyT11UnEWY2UTEC6bgQAjc
	y3SpqF1aHTYxc16H2WQIUPSW1+X0Ll6XERujm5qsLunIyeY76ZT7ylfwf8pmmIb3AuvHFeR158RIh
	KGvxPLvX9SDX+n2W6j459L3YrL0Gltpv7sFE82+Z6zzZ120TzIMoIyY9shJpncqm7JQFAib+VTBwj
	gd2z3S9kwYaMD703dfwiTu/fXq9fjnAFSt9su79vUL8o/ud09IdbEAU1aD0iaqKWJWJypfqPyV3Tp
	o/NgFH2YqbD9NFVDZwsKEhnqKsuyifTq8P9Eek6DJU49VsvQBdrEuL9DarO3n4KVxEwYxoTirtB0z
	S4/ex84Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23wW-00000003bZj-2zdg;
	Mon, 16 Mar 2026 09:08:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23wW-00000003bZc-0Zxa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 09:08:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 38BC060130
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 09:08:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9D89C19424
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 09:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773652133;
	bh=IHP2z/7YeWXK6Tx4xtubEup0KBNca0fnUaaTxKTXo0I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Cfd1p+jed+2I/+2rf19TdHKMBG9ibfRW/HVz7if3RgCQ2iNPhdaNOoT+I75rCqZQH
	 AVaUTQSd31nvk37LrOLbBXgA5vNPDyDMwvwjdaqxcRp1NGmDpvIHaiAOVzJB1YgxlP
	 Lfz3fmmzsfU83Gr42fXaDXbDnsO0wQXUmZpJuc7x+haIvz06VIrzbcWo89sHUfK2s/
	 aTlUiplClTZhbyXL0sChAnoQ0tO5nzSpcYgr9jsPmaBGv/Qfx7qLuNXMRahLWCqLWf
	 e1gjniiKFm4b+kHj/kJK2iTW0amUuhEVND1nH5A+b+baD/JUF93pZTimp9QfS6zxwf
	 ojRbZEiflMygg==
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-64cb577e79cso4614536d50.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 02:08:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW15Sn++t2GyKNx1NipRpNzZ8PNAH9ROD9q2j9VVpoM7BG2Eaj4BnwLTR9xppDOPm/fL2GtCplcnNzhbKSKlXoZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg+VY81zZRxNoN0h80b1D/kgf5EJDzbnW47473r3xtvy1EI07r
	1ol/BfJbk7IxlcZP0ShuIYmlaMPiJaF1ZWbwgiPVJhXF6/oBczpV13fcQIKzw4/NM/EwXpdo/K6
	TjlyU+ZYDcR0Mt8Bcq/pI9Jd//+XVJ7c=
X-Received: by 2002:a05:690c:7344:b0:798:4f55:2c59 with SMTP id
 00721157ae682-79a1c188c09mr124992917b3.39.1773652133121; Mon, 16 Mar 2026
 02:08:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260313000652.11470-1-andre.przywara@arm.com>
 <a4cfb10e4701da0649ef648136496a962be5870d.camel@icenowy.me> <20260315014205.471d6834@ryzen.lan>
In-Reply-To: <20260315014205.471d6834@ryzen.lan>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Mar 2026 10:08:42 +0100
X-Gmail-Original-Message-ID: <CAD++jLmO-wpxYZJw2PCoqD73Kom2s1_5GT7CXQGMi+ED6sh-1A@mail.gmail.com>
X-Gm-Features: AaiRm53q4gewf2JyuIj82fugjLAoB6_CrhPdB9DI4ls4pXU8cNr5OY8BWc8rHig
Message-ID: <CAD++jLmO-wpxYZJw2PCoqD73Kom2s1_5GT7CXQGMi+ED6sh-1A@mail.gmail.com>
Subject: Re: [RFC PATCH] pinctrl: sunxi: convert to GPIO_GENERIC
To: Andre Przywara <andre.przywara@arm.com>
Cc: Icenowy Zheng <uwu@icenowy.me>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
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

On Sun, Mar 15, 2026 at 1:44=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
> On Sat, 14 Mar 2026 13:14:25 +0800
> Icenowy Zheng <uwu@icenowy.me> wrote:

> > Ah, is this a userspace API break?
>
> Was that ever a guaranteed user space API? Or just something
> that everyone relied on because it was always the same (until it
> wasn't)? Similar to /dev/mmcblk0 being the SD card?

As Torvalds has pointed out, if it has users (that complain) it's an ABI.

However if a tree falls in the forest and no-one is there to hear it
fall, it is a philosophical question whether it makes a sound or not.
https://en.wikipedia.org/wiki/If_a_tree_falls_in_a_forest_and_no_one_is_aro=
und_to_hear_it,_does_it_make_a_sound%3F

The ABI has been broken since the first introduction of dynamic
GPIO devices, because anything specifying -1 as base will
get some random semi-predictable global GPIO numbers.

> And ignoring the ill-fated old-style sysfs interface for now, how does
> this work with libgpiod? Would it still use the absolute pin numbers?

No.

There is also a new sysfs that enables you to export chip-local
lines, and this is what you get with CONFIG_GPIO_SYSFS.
The old ABI is available behind CONFIG_GPIO_SYSFS_LEGACY
and if the users don't enable this, then they don't have a
problem with this patch.

> I mean looking at that warning about the forced GPIO numbering we
> get, using base =3D -1 seems to be the recommended way?

It is.

Unless there are users that love the old ABI (for Sunxi, I *doubt it*)
I think the patch should be applied.

Yours,
Linus Walleij

