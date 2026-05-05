Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D2DCCD342F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 09:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=saiAoSq0Gjw4nVSv3lJIbi7mZbCEiUFubkklHZ6p6UU=; b=txKODzgKTedasmsBCaRWJL8qVH
	OEInDzuVOjYOin4BKV+dGqNUs6gPTc4E55UbRFYw4OTy5VOSFX17VZr9nBB8hJIUteN/RmwPigH0g
	jEDu2M+PJKpptjGk53jty8W8sgJGt90CmDX2E9j61qhnc3pEMApLExfv+qHJ0rQLwdeOmDs6UyCoD
	CIb0vHnyGQ8EW8YGIgV7HBumrcNOdtw/WpctxvJegSsz1RmeaH3Gl6tPXiId5OO4ojkoriW/1m13w
	Ew0stcjRvnIfELAPSZ5iInB2AnojQ8mz9itmbroOePD8ggQuz2wkx9aGUqQiH8nsP7z1nLPimqXbX
	4ygARAew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCT9-0000000FiqG-1pNe;
	Tue, 05 May 2026 09:53:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCT8-0000000FipO-1LzB
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 05 May 2026 09:53:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=saiAoSq0Gjw4nVSv3lJIbi7mZbCEiUFubkklHZ6p6UU=; b=GTQEaYCnM6SfYZ7aldH7yc6pK9
	/f1yhMUOfA8rYDqrryzw2wtpA66bWxJZI+dFbOfhFDFgGnx8i2Lg4rP0YaKzNjRchscwK/CB10Woe
	mkzARDkPVXUhPdhxSAFjIZthcJuPmgHgx5ARPYVBt8YJVTzlCXceaL5hBKqqkMUkhvLvprNsrvaof
	6s9eIwyGyMlXPr+aG/jzcp0WCUIp+dHBNW2vL7zUDmUFPM6pQXy98lWnzijALXLxRDjRIWUqPtYYW
	skOz0nIRchcY+QMsFjHoyDcprKpnpMFaoISz+gYjy3iBRnQ1Wtuke0RSXWGjtXSE3nqMazOynd+5H
	R5bX8DBg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCT4-0000000D5l5-17AX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 09:53:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E2B22417C0
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 09:53:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2A83C32781
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 09:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777974806;
	bh=saiAoSq0Gjw4nVSv3lJIbi7mZbCEiUFubkklHZ6p6UU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tFkqNMfKJt7Q7XONP/ZHfpv5V9+vnr/gtXNIn3ijNpCHDU1BoQiALetWJSt+PmgoS
	 BBlwwgPBnV78TtaJ+qqsAWJKwy04QPBJA7QgkL/YCiCCJmhmXsUMSvQROJgCTk9K72
	 LYLjeDL1f2ZcOtEecI6GzZ8O6zCTjFBwRHGdvn2D9E4/oieDtY8CGp2nuukUFWHL+R
	 Rjumx4xYqOtsQgaslMgTG4/ycuwRE3YzrV0FqhDjssIDQ72Weuuu02Y+IG7diGD6l4
	 SlDWqIxoESZZKTuqqpnwzyEzXhczNwyfeuSBgznwvsv2LGbvIddoalPj75rgpWWe2T
	 0tvUDQj+4WKlw==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3870778358aso35295841fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 02:53:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/zDOGkojcsH+EpeNKJU4pMHQ6kfZ0cJDFxjOXGWN/Qj57GWKwnN33tJ4GLCOgycZWDJjd2GE5/craBhaJ+Jo3Q@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd0Y2lWExcLq1tEHweUFbAEP8ocQMUlPfcCX3G+6/nF0Wc6RTg
	7+TvgQrHd5AwKRcfRUX26lOEtnzNyYCJKeRmM6uBgZGWmIomT0MyV9rpvaZY2pb0+iDW4qdV0ZW
	e3wBPLCiKFH0CMV6fc7w1H6+3qWho3Ww=
X-Received: by 2002:a2e:be8e:0:b0:38e:a8ef:b61 with SMTP id
 38308e7fff4ca-3937857c3bamr54490251fa.29.1777974805235; Tue, 05 May 2026
 02:53:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260429-send-v7-0-b432e00d2db8@gmail.com> <20260429-send-v7-5-b432e00d2db8@gmail.com>
In-Reply-To: <20260429-send-v7-5-b432e00d2db8@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 11:53:12 +0200
X-Gmail-Original-Message-ID: <CAD++jL=PzwbKFvLDX_b-UvQtd83qfb+Kaeg1Oibo5mzRaFjR3Q@mail.gmail.com>
X-Gm-Features: AVHnY4KMDuCZ2LITDqNfqa9EPfYGc-qnLM8XOIgJiicE6urZJdWk9Rb4jm-mXt0
Message-ID: <CAD++jL=PzwbKFvLDX_b-UvQtd83qfb+Kaeg1Oibo5mzRaFjR3Q@mail.gmail.com>
Subject: Re: [PATCH v7 5/6] ARM: dts: zte: Add D-Link DWR-932M support
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_105330_552052_27263887 
X-CRM114-Status: GOOD (  15.72  )
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

On Wed, Apr 29, 2026 at 9:14=E2=80=AFPM Stefan D=C3=B6singer
<stefandoesinger@gmail.com> wrote:

> This adds base DT definition for zx297520v3 and one board that consumes i=
t.
>
> The stock kernel does not use the armv7 timer, but it seems to work
> fine. The board has other board-specific timers that would need a driver
> and I see no reason to bother with them since the arm standard timer
> works.
>
> The caveat is the non-standard GIC setup needed to handle the timer's
> level-low PPI. This is the responsibility of the boot loader and
> documented in Documentation/arch/arm/zte/zx297520v3.rst.
>
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

