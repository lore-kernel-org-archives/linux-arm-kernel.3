Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE8CCA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 10:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HeKGdzLU69O+ht9kbtWpEwDIRN8ghLkwCH+cdsIjxI4=; b=e5Md3I5tRpMqeQUohcOusdjcLj
	ETD4vEoo06LQb+LsFRPqRlPVapmqLa8qIMXQLhLOV+cCY3mzsvmMUWNOQ+D6fEwbJjgXx62XVsR4d
	mTk511gSdokHp0fSSOkj1LFvkMT7yQhK5NfRol+dYkOxY2HkCRPKHhjHyBPp8NO78Y5gtywAuK7eg
	9jnkGH2rQq+rURTGd+3p3NGhFjolEr4cT+avmeF8VIGT/1W5gvFVI/NnVSoVjxPzxaPcFjmsS9AHT
	p9Ig7h/ja/m3sRfIbr/Qk/d3ok4jwQiTFxDTT7o6FO1ZmI7mynCX2uj+y1g+cNhCk9u2X+6o53OMG
	XpD+WIKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBs0r-00000005oBH-1QCk;
	Wed, 30 Sep 2026 10:58:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBs0q-00000005oAz-1pYr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 10:58:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DD98440922
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 10:58:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1D521F00893
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 10:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790765891;
	bh=HeKGdzLU69O+ht9kbtWpEwDIRN8ghLkwCH+cdsIjxI4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=aHHWv3/e178Jqr0rII6QPV0nGBLTsgtyaBUunqajL5gZ701UOmTost9HSZ1zPVgHK
	 ss9UxAoBdmnNCjo+57n4x2ebsj7fFvxlFrZvLyGd7YeePDT6L8sdfA6SJQu7kMkI6g
	 5z1UVduBF9bHnoa4qclG2DpQNGikwFtdVNXSzlut0QZBtUofnPk4wtt/vy5TB6JHGJ
	 guAKSblDm4O1kmdgYDR2p9kN44ivlt4S1fiCykde9jD5ds7Az4UCwfQysxUExzfChV
	 2uB+E1JBbryZPPnrWuykoEB0KKJZdfPst+nuZ0V1UkM1Du9lLQ8hRM5aGFLD5VKQjR
	 mFD7H5hFpsjmw==
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a64b06fc66so36431411fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 03:58:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzfFJYKD8zZORZHRqEdOgurcXwMuG0jXh4g0VWi2zL8pnz70aLkSrgnqspokk9ndRp8Lu0M6+U7Ti2SiLQ0vGHx@lists.infradead.org
X-Gm-Message-State: AFq9FYIf3Jx4boDO+Wou1sk3/FYlEWdk8YCVH5liNLCaPoWnsH1K9KKE
	l/Z9gqIpE7y0oYdfhXL7k5s1va775St8Ya6jYZHrDBexlgus5tmlJmMIiDq7rSkJQ1mzNEZA8Bw
	Df7n/mKqr/w+DbpKxYMhh/N7Emv6JO0U=
X-Received: by 2002:a05:651c:a383:10b0:3a3:74b7:fc03 with SMTP id
 38308e7fff4ca-3a77920847emr2626851fa.15.1790765890554; Wed, 30 Sep 2026
 03:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com> <20260930-b4-cs75xx-v1-7-4617c4463529@gmail.com>
In-Reply-To: <20260930-b4-cs75xx-v1-7-4617c4463529@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 12:57:58 +0200
X-Gmail-Original-Message-ID: <CAD++jLkzcf7gJB82XT3-xb4jLujtWSNz1kT2r1-4N54rRfRNMA@mail.gmail.com>
X-Gm-Features: AclHuK-sa81U-5SW9SmnkIIIMk800EhJv2_agNorbcDVKJfOoCfwnayZ96qbERY
Message-ID: <CAD++jLkzcf7gJB82XT3-xb4jLujtWSNz1kT2r1-4N54rRfRNMA@mail.gmail.com>
Subject: Re: [PATCH RFC 07/10] tty: serial: Add Cortina Systems CS75xx UART driver
To: filipp.dunsky@gmail.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
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

Hi Filipp,

thanks for your patch!

On Wed, Sep 30, 2026 at 9:00=E2=80=AFAM Fil Dunsky via B4 Relay
<devnull+filipp.dunsky.gmail.com@kernel.org> wrote:

> From: Fil Dunsky <filipp.dunsky@gmail.com>
>
> Add a driver for the UARTs of the Cortina Systems CS75xx (Goldengate G2)
> SoCs. The block has transmit and receive FIFOs with full/empty status,
> a 24-bit baud rate divider clocked from the peripheral (APB) clock, a
> receive sampling point register and one interrupt line per port with
> per-cause enable and write-one-to-clear status registers.
>
> The driver is a rewrite of the vendor driver shipped with the Linux
> 2.6.36 and 4.9 based vendor kernels, using the current serial core API
> (uart_port_tx(), port lock helpers, deferred sysrq handling) and devm
> resource management. It supports the system console and earlycon.
> Hardware flow control is not supported.
>
> The ports are named ttyCS so that the driver can coexist with the 8250
> driver in multiplatform kernels, and PORT_GENERIC is used rather than
> allocating a new port type.
>
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>

Look at this in your Linux tree:
git log -p b61c8bf4694b5115766849378dcb8787ff54e65e

This is essentially a resurrection of that driver. It was deleted again
because it was merged prematurely. Cortina never came back to revise
the driver. (People run out of steam. Such things happen.)

Anyways, clearly this driver is not just for CS75xx so name it
cortina-uart.c simply, and update symbols accordingly. Kconfig
should be SERIAL_CORTINA etc.

Maybe
even the DT compatible should be something more generic.

Yours,
Linus Walleij

