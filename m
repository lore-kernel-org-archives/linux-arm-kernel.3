Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E5BBE7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 14:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3KwgxaP6FkpVeQa7wijeTQe8jb/qdggPnZ0hr39vUF4=; b=UyqUbsRQf9H3f6HYbu8zKEs5Pn
	oKf8xeIuzhxI8xIqXbBD+/cM0nCkKWTh4Hj9AwVfBwzvBeQ6WCSt5gKcl73u1r3maxDCqatO+fZjY
	h+9D+17BqsziiUomuVNhHQ+70dAfA0oE+IPOVW260J+iU6jkVPsgW1KO4g+gC35OCz3pTPpoPt3oI
	/U5jLbxGlDhgY7WvhhCAz5hgKytTzJNcDFJP4dl2ZydXPOb2GgOB/erzQRgb5FzjrkmuGDnKh+W6O
	sK8O1CSdvtEBp3BcqtlXpJrQvvlGJ2ETVbub1bmGth8fuk1f2ilzTwAwi8EXsy5yHro3Enpjl5f+3
	Gq/2pTmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIqOX-0000000Cq9H-43vr;
	Wed, 04 Dec 2024 14:30:25 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIqNX-0000000Cpvo-1ET7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 14:29:24 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-e3995f1fe30so4272946276.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 06:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733322562; x=1733927362; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KwgxaP6FkpVeQa7wijeTQe8jb/qdggPnZ0hr39vUF4=;
        b=UNvjNUHT5G5IOQrkeLEZIt0A+ycZadMJJDCF/kh3lZSND0BOjyLwlRXZckD/u+2KPV
         /TX5CPP0qlWaoSKoewRF9faS8mZitBGa/VLq5T43nx4So0C3j7/miwwYOsEF9ZA/U9ZY
         qbg8KUbfPe4yPAj6/yd6WkNRHN2CvS0WkO5h7SjxlyQGIDujhCt3phzo6m4AhMB8JNmp
         lQd07GoKj9d0jqt91pvfLfBMdzVFjoHu1WJKxBoxOQQFs4t8EP0gLZcsJomhT5ELAgM/
         JDHC2REcBju7PUAjPFLJY7WfhJkVRBycZSjI5Qybr9sWyd/gEPmUgPQra5XC3B8zeFhJ
         osLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733322562; x=1733927362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3KwgxaP6FkpVeQa7wijeTQe8jb/qdggPnZ0hr39vUF4=;
        b=bZllJEcr+E91zyj512SOQSC2awW17NPP32insdLxa8377UpGnjRrkhfE7hSoA2KKR7
         uQZTcNX2dY/LqtGPOem79Hng3OE0IyfhRgYSN/R9s2X62+ws+ker/CHtQDTHfNfVECrc
         G61qPJnOZVnNR9rUfDUqE1UZeJd/1GckTInDOEgx07UZAnF/WkYQ0M4dkdz+8o+xnV0V
         vV+l1HY5SgAJ9xKTfbNo/l862CtOk3XKlN5/OSFK6YVKfVR3pzqIdtcY9LhFr/8Cb5R9
         03Ddv93qe/BRwTGdG9v6yhv5hX7r1mgTfg+f8vrC52NUmHufQ12SliLjNOP626HjoAwl
         DntA==
X-Forwarded-Encrypted: i=1; AJvYcCWgAofG0uLhnWyUw6nc93qWVA/3tEWh8y3+vvR2yQidIE/Tcu0t7+x1irV5fp6iagwYvaaGYP0Gsu6Wtngzjjqr@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5Nxvhnkpw/vxPumbnzTV8SjxkUsddd0V+aPWn4k2pipuZoXHa
	xr0DT4dbf04TURcl5GtoR9TtXXBYj2Hty3bJ40m8FLxmQQTEdqvk+hwAOExjdW3m+AtOkVkwELw
	bslcV2Q5GhlwWcT3C8vhdvoU6eYNKE86+0v0hTA==
X-Gm-Gg: ASbGncuBTOTC36oIeFvGDtQIuDnpR83Cl/eF2Q1cNixJAOtbeJKrtm6RVinh3eprcw9
	OCk+2r5jRi2WFFIrGAZvnHKO3M8RwfQ==
X-Google-Smtp-Source: AGHT+IECLKVIlaO9LpFlpnhg3iVWERPQO26qkt8DgDJbDpaMcgWnOwIIFCN7yPb5xUaGHc4umafT0ZZYEPzoxyTvdHM=
X-Received: by 2002:a05:6902:1505:b0:e39:80b9:3344 with SMTP id
 3f1490d57ef6-e39d39ec8d0mr6282859276.3.1733322561825; Wed, 04 Dec 2024
 06:29:21 -0800 (PST)
MIME-Version: 1.0
References: <20241204102904.1863796-1-arnd@kernel.org> <20241204102904.1863796-16-arnd@kernel.org>
In-Reply-To: <20241204102904.1863796-16-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 4 Dec 2024 15:29:09 +0100
Message-ID: <CACRpkdahQhj5u9ATghszi-N2OYhFbvHF_W_eAMDAU+vhmvdrJA@mail.gmail.com>
Subject: Re: [PATCH 15/15] ARM: mark footbridge as deprecated
To: Arnd Bergmann <arnd@kernel.org>, Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Arnd Bergmann <arnd@arndb.de>, Aaro Koskinen <aaro.koskinen@iki.fi>, Andrew Lunn <andrew@lunn.ch>, 
	Ard Biesheuvel <ardb@kernel.org>, Daniel Mack <daniel@zonque.org>, 
	Gregory Clement <gregory.clement@bootlin.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	"Jeremy J. Peper" <jeremy@jeremypeper.com>, Kristoffer Ericson <kristoffer.ericson@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Ralph Siemsen <ralph.siemsen@linaro.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Russell King <linux@armlinux.org.uk>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_062923_329825_2D470EB7 
X-CRM114-Status: GOOD (  19.94  )
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

On Wed, Dec 4, 2024 at 11:30=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> Along with RiscPC and SA1100, these are the last remaining Intel StrongAR=
M
> machines. The Corel NetWinder used to be particular popular in the late
> 1990s, but was discontinued during the bankruptcy of rebel.com in 2001.
> The other machine is the DEC (later Intel) EBSA285 evaluation board that
> was made in small numbers in 1997 for software developers.

IIRC David Rusling at DEC was sending this board out to interested
developers.

> The footbridge/netwinder platform was the main target for the first Debia=
n
> 2.0 "Hamm" release on the Arm architecture back in 1998, but was dropped
> in Debian 6.0 "Squeeze" in 2011, which only supported ARMv4T and higher
> with the EABI based ports as ARMv4 hardware had fallen already out of
> use by that time.
>
> Link: http://netwinder.org/
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I am booting it occasionally, last time to test my KCFI patches.
But admittedly that is only to test it for other SA110 users. I remember
that Christoph had problems consolidating the DMA used in this
machine as well so it is standing in the way of useful work.

Apart from Ralph and me I know Marc Z has been known to boot
this machine, so paging him as well.

My machine is using an OABI RedHat MontaVista Hard Hat
derivative but the default userspace doesn't even have a /sys
directory so it's quite dated. I have a minimal homebrew
busybox userspace that I actually use for tests, admittedly
built with an OpenWrt compiler using the --fix-v4bx trick.

So from my point of view this system is on life support:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

