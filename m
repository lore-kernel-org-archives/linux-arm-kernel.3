Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE47CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 11:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r4gea6dVaV+pJlHZZUkUTN78DK4gqSCobp9kI7mnfs4=; b=Dwxy2getOhgKlBLSZGGACv5D75
	F7Xd/fiUqBChRqJrD6H7sIeUa7sW8zOu7KgjP/WTpvaSTZXFh8c+IYzxjRLf45rGHrBpXhFNsXbka
	3mVdd1D9U1xdHZJqSLVhFZw6fLQvluMNRJLCt2R6y2iKrY5H+zQOTjY54DW6H+G5xiHqFRxWA63K/
	e44hiNvFH9kz6h19wgFWncfSt1A/6Nzpji/U4lhczqNGx7olXuH0W8LOLOQ1UCnsiGUf0WWydiYot
	woGPFfigH4j2YISdA6IKVEnbkZq8hh+aXm4mRZmLyR4IYxvIxQIv6vbGuSlhUmPGPSux3xN8WEtRP
	Hcxx5rsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQ2c-00000002MLy-3OXm;
	Wed, 07 Oct 2026 11:42:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQ2b-00000002MLi-3EGJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 11:42:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8719744515
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Oct 2026 11:42:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BF901F008BC
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Oct 2026 11:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791373353;
	bh=r4gea6dVaV+pJlHZZUkUTN78DK4gqSCobp9kI7mnfs4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SZLQH/OEJH98cZ/qo6xG6O6X1fUZJTqQDFPyi/kxmSOHy+9Jz8pXY9ldGyGlMwR+Y
	 dIh+PvylgLo+zp1Zm7yS7NwD3BY0S6spMTSs3Yv+25rSdl3/H8caYzwjndXbENTbR4
	 89CFYpfN82627PT+CJctBv+bBhRghWnCO7v4z1LNfNOz805GByJi0qsvz6lNlZqL31
	 RER49kLVV2mavo4+6BjXh/Fl6Se1ziUn4cC0NYuUavC3Xac9g0fMvoghHUZ61gO2lc
	 rX3MdGICW9BiZFAgrr7ZUanvylF3tBTVv4+WB/MMYohVSwEulxMnh7/bp8USbloCpV
	 QYPFYHCArZc/Q==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3a75f960be3so42405211fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 04:42:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxLIpmG+V7pelaV6Mhp8vdQTp8pCKFPwf+M61ijBnUTQUTrfowGqVCkJYSesUUgzngM3Okqo2BUES9jpfsO5Xwy@lists.infradead.org
X-Gm-Message-State: AFq9FYIXpMXIGN1kaMXNCWNGgZUFncxAyv1paOAE0MnxBOjHRVLzWCaz
	7PLCQOXEkNGgKpCKRvMCwSKMCbIkHQJYjC+mdjbmbG49YO2ocXke5i6rEyqNKMHwsEBflIOqXvD
	MYKIw+NRrqr+MPqjBMbjDgQnunUUZe/U=
X-Received: by 2002:a05:651c:1602:b0:3a6:6f3d:c804 with SMTP id
 38308e7fff4ca-3a9a2cc0600mr4595861fa.19.1791373352182; Wed, 07 Oct 2026
 04:42:32 -0700 (PDT)
MIME-Version: 1.0
References: <20261006-b4-cs75xx-v2-0-b7d6e1e24d44@gmail.com> <20261006-b4-cs75xx-v2-9-b7d6e1e24d44@gmail.com>
In-Reply-To: <20261006-b4-cs75xx-v2-9-b7d6e1e24d44@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 13:42:20 +0200
X-Gmail-Original-Message-ID: <CAD++jL=PFhz-99kM+0K-g+xNGbcwds6oEUa2owRS__rzZoz52g@mail.gmail.com>
X-Gm-Features: AclHuK-sWswIxgClINF2jGtjRrgaftdNbg9RcmXzfCzhKd4iDM_Uo4JDtA63Z6k
Message-ID: <CAD++jL=PFhz-99kM+0K-g+xNGbcwds6oEUa2owRS__rzZoz52g@mail.gmail.com>
Subject: Re: [PATCH RFC v2 09/10] ARM: multi_v7_defconfig: Enable Cortina
 Systems CS75xx support
To: filipp.dunsky@gmail.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	Jason Li <jason.li@cortina-access.com>
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

On Tue, Oct 6, 2026 at 8:17=E2=80=AFPM Fil Dunsky via B4 Relay
<devnull+filipp.dunsky.gmail.com@kernel.org> wrote:

> From: Fil Dunsky <filipp.dunsky@gmail.com>
>
> Enable the Cortina Systems CS75xx platform and its UART driver with
> console support, as used on the Securifi Almond+ router.
>
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

