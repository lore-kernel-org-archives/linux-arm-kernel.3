Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8EC2C7EE33
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 09:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4CWyVOg1ySsSGm3tCccXgrCtfZcjTGRY536tD9B4aXc=; b=AezRcSGImm13Y+yR6t1ianvkTD
	1XVAG1XQo9Vd67QWqi6Bmm55mUQwZvHiNyxscMfVCQAG88U4KGhn/8G7rPAQoQSHc6M8agndr+0iU
	0XEzHe22Hl0LhzXnYsVdriL8zolKuNQL5WNFlbagg9tu+GR8XffsW5BXGC90vsv5b+IGnWygLiper
	vTHfBY3WX8l8QrjpCmF7H43b/rpglk1A0gYSxdRtv4JNnwJ4rLXydW2hH1lcxL3c3yQ8ZnoPpc4qU
	ZgXmthNYWRBam/9as5+uIKbRuW/VaxAASYKXZummegEYj68p8rXlnhZVzp3G22EznXwN6/nuYJ79T
	vEWuMyMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMln-00000008Bf7-2Vgi;
	Wed, 25 Jun 2025 09:50:19 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uULl3-000000080lG-0OzV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 08:45:30 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-3105ef2a071so75829361fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 01:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750841127; x=1751445927; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4CWyVOg1ySsSGm3tCccXgrCtfZcjTGRY536tD9B4aXc=;
        b=sKqCOfjisO25w0LwzezHL9x+ABQavd/H28TwC3cGePWZfs9WqHiPvRb9N2eh/XsRKs
         7cSbj9qBGFkooIGUVS8p3fByOp/ZUJi3+zTK9wXEvcfghwkbVRPhDp7d6YhLeDKSKxtw
         FYimXFzZj4McR4/7hiNI8AW49kOP4EbyA+W2xdgo7hIjF6jRXMl77Bn4DqFGbj4MHIN/
         Er/QR9dufVhoopJOdxfOzYbywlOLFN7Ah3f7XCFSdl9mhkEH4d79VwefxkAxNm6GCYpo
         dywtiOokKOx7CPSK+B4XCHLlJJ+fwD/n9MLss77se3qPY2pAchk0QIFNVuSMzAlDM7nS
         MZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750841127; x=1751445927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4CWyVOg1ySsSGm3tCccXgrCtfZcjTGRY536tD9B4aXc=;
        b=RYzScyw76B28hHPd2wQklYEq60cn5HbYeRN42mXSlWmI6YdtVq8JNzPqGaJGA5Zqy4
         /P3f1f2bOHq2NYzyvA8rAs4STrrjgmH5Z/fIoWeCb6PPvmrpTu5FD462Oe5Zm02Ten9Y
         bC6Tn40fU9aAUIj4fIjQA49T843Ig2ZeQG2hKPtKzIffbBnvmvkmdrDG4pI6knR6T48e
         sdB+zRy9ShWK+ccIJVrl2o5xLS5mxpyZQEPfiyh6HKA7NVeaUXpPxOjhpnRxdI7i6K8+
         rpkUBuzT6QqHg4bjO3i9Vw+DaFAeY9YMFWUhz5WmwRSC9oDLQNCnOSmTfbFtYuNi6PeN
         Sb6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXTC1kuXOVxnBvllH8RXkNXFiBNRZHhEDOQdmHEcYL7EkNzIUWlc2TBpZiNDNkizbFAw1z8jKwZqcBHyMNjIij3@lists.infradead.org
X-Gm-Message-State: AOJu0YxuAFX6mki2W4/WFKOb20uAl7Vq6Os3PgKK8+g+y/wqWnwqvHoz
	7TYZgL4uIqKX6utro8+bY0kQKDIyOTdcyYalA/ZzGtdaU3B2IGjB4d5hWPZ7ZLaLT/UgLrhE6Ih
	ZKHYHVHDPIzBUZYkufqFFPC408WHFCr6o8rrHrezOGA==
X-Gm-Gg: ASbGncuCVXot4S++n1Noadhprekn/kprieSukIffS2j3/P5/vgUkq2RptodnVwilD+8
	sQfUMzcoqLBPQaocg/498h8MsxFHrqMmy90sMU16XebfuBI4ZfUZPEkVsLgqGOtuB5c8+bHgCFK
	0eVWW9e43UMcjq4C57pvYYrJ4oGKu2PSOcld8vypsvUXc=
X-Google-Smtp-Source: AGHT+IE+JyenPgPvT+Svvv9s+V0VraZ6su8hbOajVsCqvqbMTxCrk4fBzjbCyvVMQ0l2eId9Zjx6ak0ozUYWm+PwBYY=
X-Received: by 2002:a05:651c:4201:b0:32b:533a:ef76 with SMTP id
 38308e7fff4ca-32cc6490c2cmr5605931fa.13.1750841127084; Wed, 25 Jun 2025
 01:45:27 -0700 (PDT)
MIME-Version: 1.0
References: <8c282b89b1aa8b9e3c00f6bd3980332c47d82df7.1750778806.git.andrea.porta@suse.com>
 <9d31a4d7-ffd1-48ca-8df6-0ddc6683a49c@broadcom.com>
In-Reply-To: <9d31a4d7-ffd1-48ca-8df6-0ddc6683a49c@broadcom.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 25 Jun 2025 10:45:15 +0200
X-Gm-Features: AX0GCFs5reLO3eAptejwJU5aIb8qpce34Nq1CQTt9TXYf2HTB17zcNXvrt_8Yc4
Message-ID: <CACRpkdbAxyZK_f8y6mzX_eJ3UM5ZtuXEpSmXE+QpUXaHKw_NGg@mail.gmail.com>
Subject: Re: [PATCH stblinux/next] pinctrl: rp1: Implement RaspberryPi RP1
 pinmux/pinconf support
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Andrea della Porta <andrea.porta@suse.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof Wilczynski <kw@linux.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Derek Kiernan <derek.kiernan@amd.com>, 
	Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Saravana Kannan <saravanak@google.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Stefan Wahren <wahrenst@gmx.net>, 
	Herve Codina <herve.codina@bootlin.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, 
	Phil Elwell <phil@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	kernel-list@raspberrypi.com, Matthias Brugger <mbrugger@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_014529_145177_6F94598F 
X-CRM114-Status: GOOD (  18.16  )
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

On Tue, Jun 24, 2025 at 11:11=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
> On 6/24/25 08:36, Andrea della Porta wrote:
> > The current implementation for the pin controller peripheral
> > on the RP1 chipset supports gpio functionality and just the
> > basic configuration of pin hw capabilities.
> >
> > Add support for selecting the pin alternate function (pinmux)
> > and full configuration of the pin (pinconf).
> >
> > Related pins are also gathered into groups.
> >
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
>
> Linus, can I get an ack or reviewed by tag from you and take that in the
> next few days to go with the Broadcom ARM SoC pull requests? Thanks!

I was just very confused by the "stblinux/next" thing in the
subject ... what is that even. I thought the patch was for some
outoftree stuff.

But go ahead!
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

