Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FDDCA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 19:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qvwz9H5czi1T2bET1rcGtlq0MACGNFWYAMQiSkHpdX8=; b=utmGs+XvelQZcOmsFpzGcW6LkO
	pzHB9nVF+fbvenMIlOOPpJUXoI60S1E+jGfd6EPTXXOXDiC8MP6ppXCOV9oeQNGkQ5WfmFM1yWZJE
	3rcYEyF1GtnbCheSBoravd2lTRJReawKbuXYC/VBjPDBVEel7xZB1ZIN0D8tPatwWOT8jNO2pcqVr
	hWjKkYAcTFkqECxBAqha6NsUGZ6u28jAzAqYLh3oMN3VscRq9assMB6RvDgfId0UvH0alH5NjM8di
	U0Gls8ROJQGbrPmhxh2ERrEgD8A1G2+MH3t3gJiq2e8fAAsGTSSG7Cz9Ayx/phUfIUHHXrxcuPpt/
	QVIbWjbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCMaZ-0000000A5kZ-2Es5;
	Thu, 01 Oct 2026 19:37:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCMaY-0000000A5kR-2158
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 19:37:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 97E0560515
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 19:37:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 361241F008BC
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 19:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790883425;
	bh=qvwz9H5czi1T2bET1rcGtlq0MACGNFWYAMQiSkHpdX8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OYEkWZSGIPm9u5E7vvPyKgWBtWXoYDM0EGPIKCETLZ8/uJTQU6+6fMwQSj1CEDMG9
	 FEEP8B3Z/9kj0+e2SotAzqmeMPnIBCHDFQOFg0xrbc0jJCUxSPgWEOcUbRie4b8j5c
	 9RR+PHZ9l26jsi2i043ZuZn3uXED1Mm6U72f7Wijc09/6J0y8vHBHdIG+USOiIeFYj
	 WC2zyQWU2k7Jb9PHARWTCN6M6FeE34OaK28p/Q8j2R9egjckrpBv7vM0mfRN6kDiDO
	 yqsl0jruXuftKkvxc23FjyHcIjhLyHLPY+6FKwA1j8tONQgQTIt7IgO9/dMkXJJsOc
	 PxPefttg9aAyw==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba418c79ccso116568e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 12:37:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzXpOOCxcNhEtiM4Ox5FQ9+46eah5f+0t28J63AZax7bR12wJpvW0sNp/Wt2PB8wZ92u/BOjxJEawGgh4lEBfuA@lists.infradead.org
X-Gm-Message-State: AFq9FYJ43iI1QlNo/DiT3uqnMTqC3drbgPrheNDEtUfxUJmmqE2FK99o
	LHSxnjQLZQ5YvonYhn7OcokNWddIXrDMmOdagBpqoxP9YOGav4XmO5MQxyZHHS9HIEPg6H3A5zy
	9F0PWNjZzgZqSqOjgCW/X6O4Z3VOMm1k=
X-Received: by 2002:a05:6512:3a8e:b0:5ba:3db3:66d6 with SMTP id
 2adb3069b0e04-5bb9bc3baeemr71428e87.38.1790883423882; Thu, 01 Oct 2026
 12:37:03 -0700 (PDT)
MIME-Version: 1.0
References: <20261001-cv75-v5-v9-0-486cc289a4b8@ambarella.com>
 <20261001-cv75-v5-v9-4-486cc289a4b8@ambarella.com> <20261001-attempt-savior-5d4a0eed4320@spud>
In-Reply-To: <20261001-attempt-savior-5d4a0eed4320@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 21:36:50 +0200
X-Gmail-Original-Message-ID: <CAD++jL=tsETOFvC-AdethTdrGtet5neVanj3KyyB4EtEOpJ_Gg@mail.gmail.com>
X-Gm-Features: AclHuK8gO_d9ZPMvc-1W1f079XpNQoWfhmnQkIh3LHrwFtzhfvV51TArzhkyp58
Message-ID: <CAD++jL=tsETOFvC-AdethTdrGtet5neVanj3KyyB4EtEOpJ_Gg@mail.gmail.com>
Subject: Re: [PATCH v9 04/15] dt-bindings: gpio: pl061: add Ambarella CV75 variant
To: Conor Dooley <conor@kernel.org>
Cc: longzhao@ambarella.com, Arnd Bergmann <arnd@arndb.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>, 
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Thu, Oct 1, 2026 at 9:23=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
> On Thu, Oct 01, 2026 at 08:40:53PM +0800, Long Zhao via B4 Relay wrote:
> > From: Long Zhao <longzhao@ambarella.com>
> >
> > The CV75 GPIO banks sit on the AMBA PrimeCell bus but are not
> > register-compatible with the ARM PL061. Each bank is 32-bit and 32
> > lines, with extra mask/enable registers, so arm,pl061 must not be used
> > as a fallback compatible.
>
> What has this got in common with the pl061 beyond using the PrimeCell
> bus? Current reason for putting them together is a bit tenuous to me.

It was determined in early review that this is very clearly a modified
PL061 block. The basic registers are even named the same.
https://lore.kernel.org/linux-arm-kernel/CAD++jLk0LoOJk=3DTXin42AL3_z_7eVVk=
vMnYr1S8090C6A_B+dQ@mail.gmail.com/

PL061 is different and quirky and could not use gpio-mmio, while
with these changes to gpio-regmap it can handle its pecularities
and use a library which is a good thing on its own.

Yours,
Linus Walleij

