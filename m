Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 512ECC982C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 17:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ljrz3/ym5aL3W5hSXMvMnSrl28+5TPjOO+yW6zlyHRo=; b=ne9SVb05puROABDKlcUO1G6Q08
	bwh26Y38z2hr+AMEQCdIXrkpXI+BgvGkWtn4k5cvSr2G0/Mm/de07SkTAR4kXQdFvVZrVUtMSblji
	BCt6swQ8czr/7fOvbEMibwj0knPkXUtHlP0U4ODZrANtYyKC/7PqbUXsbEwqF+AEEb42A6bZYGAX5
	cxl2LruYJuqldETYW1Cq4NbGJDI+HN/AtNb4muYHk2gPGG8ATycTGgyyvLummJifK1Ea8V0oQdwTA
	4M0HMFcYI2elQp+Tkl3Fj1UatbXuwnTp+5IOqG42t6on6k+M26xFliQOo0dF2UK79OPfF/w/30FZr
	plE9rUjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6t9w-00000009q4x-0YOS;
	Wed, 16 Sep 2026 17:11:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6t9u-00000009q4T-3WC6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 17:10:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3117743D27
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 17:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 190C71F0089F
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 17:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789578658;
	bh=Ljrz3/ym5aL3W5hSXMvMnSrl28+5TPjOO+yW6zlyHRo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bkqqu8zpSudVqSwPAfClBSGzFquPbiDxvce8sshFCNObsZ20EVP/0+iQzww+yfp8h
	 Knbx0yTBFbbg49xHF8gW8s+G3B1aFJGWbztT0XAQo30gHGaiqTduMHKVHXb7kB+H6c
	 mvn+fXe6B9Bz6mDWQt54CzQN3zDlB8QudJtk3YxqvGM41WtbLCgA8GZ3SFkd3DzgTj
	 cDE5eAQR4RDiHyjmkUOBumOtsbxf0ByycNeNrGtmIcoPk44EridtqKqIQbfeAXkKup
	 qO7xUIYCvHiXN41Z9HY9sqJ/dg4bKfxhSrL6uuSJx6mY/Bt5IyiN8xytKMeVJebbia
	 27Eoxxefe5HTw==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f15b79so1163636e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 10:10:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw0zBYlJPJd2LzPvI7z9Ve5ZPh9bbzI+FGN87cuIdFUxCuR38zMuvKYIvTMoCwnbRsnnr8y5JnbC9tiw07NPzgR@lists.infradead.org
X-Gm-Message-State: AFuF++nYy7fFlPzQygAArIaAcWQ8iA0X6urFJ13gLAdFEAfYF112I/hd
	tBo0EScsNqNkMhDvWp5MqH7Zg70bK1nko3x1c5oTb5vbBmzmWLTU0LRndmhpn6goRJszvgm7f/l
	eHpxJp5pSiF2aChxzd/5RmK9X3SUGDrw=
X-Received: by 2002:a05:6512:1329:b0:5b7:65c0:8b92 with SMTP id
 2adb3069b0e04-5b8b6624616mr2095448e87.12.1789578656776; Wed, 16 Sep 2026
 10:10:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260910133519.459011-1-andre.przywara@arm.com>
In-Reply-To: <20260910133519.459011-1-andre.przywara@arm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 19:10:43 +0200
X-Gmail-Original-Message-ID: <CAD++jLnR-pyB8ZZXwn0ffDBQ5n3eWoqMnbxH59B1U6oDHDiRTA@mail.gmail.com>
X-Gm-Features: AcwNN1WMRMLXV0VY47rk_rDL7ZhlcD1BjU6erIZy7wdE15mC-YpMq3fTzq6SO-U
Message-ID: <CAD++jLnR-pyB8ZZXwn0ffDBQ5n3eWoqMnbxH59B1U6oDHDiRTA@mail.gmail.com>
Subject: Re: [PATCH 0/7] pinctrl: sunxi: Add Allwinner A733 support
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Yixun Lan <dlan@gentoo.org>, 
	Enzo Adriano <enzo.adriano.code@gmail.com>, 
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
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

On Thu, Sep 10, 2026 at 3:35=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:

> more than a year(!) after the RFC, now the first "proper" version of the
> pinctrl and GPIO IP support for the new Allwinner A733 SoC.

Perseverance and grit!

Patches applied for 7.4.

Look into Sashikos comments and address with follow-up
patches if applicable, I'm not a friend of the perpetual back-and-forth
Sashiko causes and prefer to just apply and fix in-tree.

Yours,
Linus Walleij

