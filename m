Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45BF8FB44C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 07:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/w9I7mamhI8PwCgAU7GnFmsVE4pO3utIWT5dv1gRVLE=; b=WIEGL70VC2UNqSEjXs75NoYVsZ
	32uCLoct5VeNRFk+jJ+BqXsElVWUxNoOfEvaRDMU41w7cbP1+rhjPQ4OtwGv2ENqFb9LzB5BYCRV+
	VtsOgwemgq4WCiZkQue4TntQVEqw8Tt+ET4/BKtoo/awOzW1UoLgz5fJoSv2b2vdX4fuCsDIlw5Zg
	HL1q/4PGjfl/zTWjpBwx2wLJQsRrlK5ngZxxnDGS3H/wxLJd6J+qEonExOyMZVMrzOdIgx9GPuHpu
	9yynaDt0Pl5sQLtls5Qids6Xal38TLn0bvZkEeAMm61d76hJ0eKk5UISeUc4g1bq5diO442Vo7Lep
	RMa0Cz3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGAj3-0000000CmTl-0cTq;
	Fri, 24 Apr 2026 07:13:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGAj2-0000000CmSd-10At
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 07:13:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7206D60121
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 07:13:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17169C4AF09
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 07:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777014799;
	bh=tLZ/GDek49sI5Zs/eZ/fXFs5/EAJg95zumCgRfB6mFI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZqTAkPNFuRt4zBNN91MjsuvIMRLyywfrnFCAPb7T7f0WzSHRKVAzABlzj6MTWuHbO
	 DipU6fp9WKBSaiUKDif7XxbY2cwSKQFsZVjec2UqA6paA98OtJdhzXApvhX9eQM1B5
	 KWVQ48tVMzv2gxHax2ms3LlSmP4v3rQ1z0m6p71HyPxmc48Q4c4VbWzKoOQ3d0NGMI
	 BtrWK5VwCDE+cOiJ6a45f6dCGhdjqDGEPtZGrNrAcJkWy4okptGPbEExz8hJJUsr+s
	 jnkuFrOqTdX49kDYy4u6sIUy7EAaa7WILsMvqfJfS7CRoujVTv8Ba4S9IT2zFRoh/G
	 moZTOHfwajdSQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a283c44478so12718839e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 00:13:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+cBmjbRZXZ9chvC+niR1fg0IGC6m9ouGj8DipQR9WPl3XOmf4cWko8bv2zvLDIjR9b/vhgDLIsfYw3COD397Ed@lists.infradead.org
X-Gm-Message-State: AOJu0YzYNGrSOiX9gv+cBvmzY7/4GonHLFGgZH43J7p58H51kZl0IgOA
	Yv53dpQBMn1XDci4iflqIR2DvhGRxcodSPtVX0MUkZ3ml/cUBVlxRI1NEBEH9FWbiU7e1NrmGGr
	jgGItxMhdYKJsrLeB+L/2WVzN7S3zfHM=
X-Received: by 2002:a05:6512:3b0b:b0:5a2:c0ab:b57f with SMTP id
 2adb3069b0e04-5a4172bfef2mr9090696e87.14.1777014797734; Fri, 24 Apr 2026
 00:13:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260421-send-v5-0-ace038e63515@gmail.com> <20260421-send-v5-8-ace038e63515@gmail.com>
In-Reply-To: <20260421-send-v5-8-ace038e63515@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Apr 2026 09:13:06 +0200
X-Gmail-Original-Message-ID: <CAD++jL=_eDY_mG_QBreSrZiho0hUrDSciedq=vrxXaTiMwrSyg@mail.gmail.com>
X-Gm-Features: AQROBzAS_qKgmsidFIdx7V3XpX1JGmVrzkG_9S8znjc0YtyWq-b8e9KYfjIHcLw
Message-ID: <CAD++jL=_eDY_mG_QBreSrZiho0hUrDSciedq=vrxXaTiMwrSyg@mail.gmail.com>
Subject: Re: [PATCH v5 8/8] ARM: defconfig: Add a zx29 defconfig file
To: =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Drew Fustini <fustini@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, soc@lists.linux.dev, linux-serial@vger.kernel.org
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

On Tue, Apr 21, 2026 at 10:24=E2=80=AFPM Stefan D=C3=B6singer
<stefandoesinger@gmail.com> wrote:

> This enables existing drivers that already are (UART) or will be (USB,
> GPIO) necessary to operate this board even if they aren't declared in
> the DTS yet.
>
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

*I* personally (as SoC maintainer) think that having a few more defconfigs
is fine, even helpful.

But I would defer this to the more senior SoC maintainers because I think
their stance is something like:

- We have multi_v7_defconfig for compile testing

- We know that binary gets way to big for your system: it's for build
  testing and perhaps booting in QEMU or systems with many MB of
  RAM, not for actually running it on products.

- You are encouraged to keep your own defconfig out-of-tree.

However I even challenged this myself by adding a defconfig for memory
constrained Broadcoms a while back (NACKed/ignored ;) so if it was all
up to me I would merge this.

Yours,
Linus Walleij

