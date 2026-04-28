Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A918FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 07:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JDyyIsOimvOVYAykdNWZKhjjd5oP0AQTtkc3Kfujg3Y=; b=TGuKe0VrX/qlljsltJKZkVY0G8
	C33QdzgfPoDONiimY2OZwiZVJOmT2v1Aarm1RUtnyoRDY5QCK+g+IXbR+N+f4LSOvCbbZ0IVxjApI
	olZv02wefDsdycbQ0+z3iALGKTx2Arcdf1Yb224WscwKoIWq1TX072AXv/wOYDOUzXHpr9jLu/xCy
	gD3qHir3R25d0gQbBrGVrh09iUWCsyed+F2H0OZeWDNjscVSXCM4Du/tuvrm9RvhbY4vLbSczzWZh
	WJQZT+LBbrmjXQB74ivyFrKWuroPHkEmQ8T4Hjz3lQ7qPb97qrLyleTGsfJDaq75ZfDm0+rEnE9KA
	WnqqO2YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdIs-00000000pI1-007X;
	Tue, 28 Apr 2026 07:56:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdIo-00000000pGP-0RFk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 07:56:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5F86944826
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 07:56:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4288AC2BCB6
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 07:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777362977;
	bh=mONgEit9R4vFoFOnQs/B2jlcGJaczQDqVeFYi/9tOPI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=o6We98HuIasKWwwFlYwhX+BKxoUqi+zrJsC4aBmIZXLt3MH5sAdknnwoyflkpsCGM
	 P1Q9FVIucai16wlwGsICKWarGHDUcq0X8CbbQL7qyp3JkqyoxdnrNR+JEAa49KNaNb
	 +6wcFimWW3XNhkuPuI2YYwg55t/Sg7zHRyahY7GzK1uwd4KN86nP12acSd/GJRwukc
	 ap7W+ZnZ0+48t86WUh+rDfdN+X85rL7Vi9k4rlXprlZ18Hn4LY7YVa+rwjABFMD7w7
	 a1li2Sq9K9MMznS3uz57789JRz3a/pbc2m+TikvLx+Qd+h+WYuBk3yz8usk4un+C4u
	 jDqTcxoz8NtKA==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3878de20527so84590761fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 00:56:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9/sl6HNzKAL4NGNalLPPNHp6HgnS402+AdkMjxf3pn+6DOpm932LEnyEOnumsz6w1EA2W26UZ+0oqIVsmA4fKs@lists.infradead.org
X-Gm-Message-State: AOJu0Yykux+OI8T/ZahZgJJvXv0bUqloudJnGenKWgfQycD8hX4c1vgI
	RM4ZRR1aGUsS+LTEa2lLJBW1WsdR4oCpTEltdsTLSgOcznAcMG8EJyY6a7SsFmg5DwAHyxnVesk
	ndzTWvc9aU2XP84ywKh8DydtRqitNrFo=
X-Received: by 2002:a05:651c:3252:b0:38e:2822:a264 with SMTP id
 38308e7fff4ca-39240ceb8dcmr6535031fa.12.1777362975988; Tue, 28 Apr 2026
 00:56:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260427214311.331996-1-mohamedaymanworkspace@gmail.com>
In-Reply-To: <20260427214311.331996-1-mohamedaymanworkspace@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 28 Apr 2026 09:56:04 +0200
X-Gmail-Original-Message-ID: <CAD++jLk-oJuFzDODKnJ+cdxz=SgorAQhSTcJTVQkvnheH=xNPA@mail.gmail.com>
X-Gm-Features: AVHnY4LwETjjfhphkxYPHWzQ2Lf-bDt8NZvOiGfchSau94jYf8YV9Ei_wqqQVfQ
Message-ID: <CAD++jLk-oJuFzDODKnJ+cdxz=SgorAQhSTcJTVQkvnheH=xNPA@mail.gmail.com>
Subject: Re: [PATCH] gpio: ixp4xx: switch to dynamic GPIO base
To: Mohamed Ayman <mohamedaymanworkspace@gmail.com>
Cc: Imre Kaloz <kaloz@openwrt.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	"moderated list:ARM/INTEL IXP4XX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_005618_170015_50E4E903 
X-CRM114-Status: GOOD (  11.58  )
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

On Mon, Apr 27, 2026 at 11:43=E2=80=AFPM Mohamed Ayman
<mohamedaymanworkspace@gmail.com> wrote:

> Most IXP4xx platforms are Device Tree-based, and GPIO consumers
> use phandle-based descriptors rather than legacy integer GPIO numbers.
>
> Audit of the IXP4xx platform shows:
> - No gpio_request(), gpio_get_value(), or gpio_set_value() users
>   in arch/arm/mach-ixp4xx/
> - No platform data using fixed GPIO numbers
>
> This switches the gpiochip to dynamic base allocation, aligning
> with modern gpiolib expectations where GPIO numbers are not globally
> fixed and may be assigned dynamically.
>
> Set gpiochip.base =3D -1 to allow gpiolib to assign the GPIO base
> dynamically, avoiding global GPIO number space conflicts.
>
> Signed-off-by: Mohamed Ayman <mohamedaymanworkspace@gmail.com>

You're right and you beat me to it! No-one is dependent on the
fixed GPIO numbering for this platform.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

