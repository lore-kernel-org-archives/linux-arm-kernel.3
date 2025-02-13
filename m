Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC559C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 18:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aixNwfpNLYxCXcI5ccF3I2q6OoCStOmv5r5FC5BMOR4=; b=DfAiyVoNtOV5SHiDAfBOzwhS96
	YL9PB00x+VOXGUbrlaKQx0Tod+JXwKgoMSSbctuCPVbj4ovQhujAXEkT7EYet/XeNf5XAAPI0hl3d
	hToH6bxFwOy+rNSxPjOfy5/vHF2dWQJ62zuamMqRe/GnKADzRLlHeDAW6q0uR3PwG9CNbF8XeS3dl
	vZhap/Hr0ZGyqYZqmxZqA0ARqatxvROJOFvnV+tp6vvSt0ApKH36SpCO/zwuw/1qN85v2ZFqD/6RL
	p3Wnx+h8EXrLox6mJwzuMagIvRAo41EQBbYb0UFohDv/ZElnjIJjVLc5DYxEDsRZJzxYVGkmik+xc
	d5M3PJIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tieFT-0000000CIWJ-2RFW;
	Thu, 13 Feb 2025 18:47:43 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tic3s-0000000BlTc-1zwX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 16:27:37 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso187943866b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 08:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1739464055; x=1740068855; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aixNwfpNLYxCXcI5ccF3I2q6OoCStOmv5r5FC5BMOR4=;
        b=DGfu8/4dVQF6lmnYBbB6nDUwiQwmCLR8mff9z1+Gcki3mRmb/LTdhOAnTeB7mZEsuR
         gagOSRgzSlFkMHtFG7sOyLlj89hyOhYUCrlqb0qVgOWqjIc2WZpzN+bxhb4oUptu6pzd
         LcUBfqTTZZzX+HJHkO7184eKlgA9BzXw3L+7LTmCIzwKkgPR549AiWaYpF5W1e4vQ9AO
         dfepHGcT2IuYgLi3RKNCQT9ygQLFG5T8T0Ku8G1qpbJJxntCIQaV9Ptq9CaiNPetVPEY
         LyFchHrYr/tggrROOPPxO/tj2AD1K72EAHVzar8Wuanai2/6B/yJ8n32hO4GsB2nDvJJ
         Cxhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739464055; x=1740068855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aixNwfpNLYxCXcI5ccF3I2q6OoCStOmv5r5FC5BMOR4=;
        b=HEJU/BkmX5zZNqXoHU6+YKI5mTexzy5ZQrfl4ffjB/lzsmA4iwdUYZEwR/AgJEqnfc
         mL4/amddh7D8wKDZbtK2j+PZpoZPzkKxFkY9l8SoBD0LTeR7X3GGMs3N+zd3hK/lnbFD
         rULsggv7LxWNYDyhnfq7sJskc3d0o/M/RVnWhszStnAQ/vl2iF2tKTwxPQIaTLhfkdoC
         FxmaW3KEJFUzE3R4u+cK2Aq2umek2bni+FLRDFKpXwndwvbAlnQLG24JeaP0Fp156J9I
         ZtCLcHxUquww4fdjnfgi/hjdB/XfSLJn7vJ8XqKWjuSMijIKbDfK2qF/BEaaEn9qpwm/
         KavA==
X-Forwarded-Encrypted: i=1; AJvYcCXQ0VQ1O8MZcLtfj8NNf2PHYM6EscnFIuv/An5jePV7135HZTvOSqJ1DnpOB+slTBv1C/wMBydgLZvH7z5ueDwJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxb0T+2tJME5mlgbHLitv0oZRyl7RVZyWHkg8ZRriEDeHk0QYBt
	RwbdXhlR4dz5aesAo9ljUA65jy8f5wwPjcbKEDYzLuLFtq6zqF1hNMk9CyGNgQOJyzH/NOduOWS
	Thkt9lDDwHIENCiCpQyZpyXISdTYHoFk/35dyQw==
X-Gm-Gg: ASbGnctquwYEuNe7cFlvZl8wLzhIS7G2KDB5kzrtNvURctDiig8KSiS8xNW9Oep1ctj
	TuRHklSxQ2XBXIYdHim5swJtsJje5unUdnJlGgCDxbJIWNp0xYyt8A4qs+Vi2znjRxX7coVY5v3
	RKeOJfRyYwEP1ebmvTBKHPaIZ9+6MD
X-Google-Smtp-Source: AGHT+IGh1IZYUOs4P7JSIz9yKatxKcYCpkTha4+Vt1XXHAvpLvRRPqSwJWHf/GTRbZo8Nm9ZR0QzY9EHYI9QcB0Oy7A=
X-Received: by 2002:a17:906:7956:b0:ab7:f221:f7b4 with SMTP id
 a640c23a62f3a-ab7f34738c0mr776743366b.43.1739464054629; Thu, 13 Feb 2025
 08:27:34 -0800 (PST)
MIME-Version: 1.0
References: <CAMEGJJ3=W8_R0xBvm8r+Q7iExZx8xPBHEWWGAT9ngpGWDSKCaQ@mail.gmail.com>
 <20250213171435.1c2ce376@bootlin.com>
In-Reply-To: <20250213171435.1c2ce376@bootlin.com>
From: Phil Elwell <phil@raspberrypi.com>
Date: Thu, 13 Feb 2025 16:27:23 +0000
X-Gm-Features: AWEUYZl0UFEHY2kV2h1h_cYG6cbTpw7bZVsKquFMakyrJEadnvQ1Edus79HpRwQ
Message-ID: <CAMEGJJ1++aeE7WWLVVesbujME+r2WicEkK+CQgigRRp2grYf=A@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] Add support for RaspberryPi RP1 PCI device using
 a DT overlay
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrea della Porta <andrea.porta@suse.com>, andrew@lunn.ch, Arnd Bergmann <arnd@arndb.de>, 
	"maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, bhelgaas@google.com, brgl@bgdev.pl, 
	Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, derek.kiernan@amd.com, 
	devicetree@vger.kernel.org, dragan.cvetic@amd.com, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, krzk+dt@kernel.org, kw@linux.com, 
	Linus Walleij <linus.walleij@linaro.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	"open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS" <linux-pci@vger.kernel.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, lpieralisi@kernel.org, 
	luca.ceresoli@bootlin.com, manivannan.sadhasivam@linaro.org, 
	masahiroy@kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, saravanak@google.com, Stephen Boyd <sboyd@kernel.org>, 
	thomas.petazzoni@bootlin.com, Stefan Wahren <wahrenst@gmx.net>, 
	Will Deacon <will@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_082736_525555_38453B10 
X-CRM114-Status: GOOD (  29.50  )
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

Hi Herv=C3=A9,

On Thu, 13 Feb 2025 at 16:14, Herve Codina <herve.codina@bootlin.com> wrote=
:
>
> Hi Phil,
>
> On Thu, 13 Feb 2025 15:18:45 +0000
> Phil Elwell <phil@raspberrypi.com> wrote:
>
> > Hi Andrea,
> >
> > The problem with this approach (loading an overlay from the RP1 PCIe
> > driver), and it's one that I have raised with you offline, is that
> > (unless anyone can prove otherwise) it becomes impossible to create a
> > Pi 5 DTS file which makes use of the RP1's resources. How do you
> > declare something as simple as a button wired to an RP1 GPIO, or fan
> > connected to a PWM output?
>
> The driver could be improved in a second step.
> For instance, it could load the dtbo from user-space using request_firmar=
e()
> instead of loading the embedded dtbo.
>
> >
> > If this is the preferred route to upstream adoption, I would prefer it
> > if rp1.dtso could be split in two - an rp1.dtsi similar to what we
> > have downstream, and an rp1.dtso that #includes it. In this way we can
> > keep the patching and duplication to a minimum.
>
> Indeed, having a rp1.dtsi avoid duplication but how the rp1.dtso in
> the the kernel sources could include user customization (button, fan, ...=
)
> without being modified ?
> At least we have to '#include <my_rp1_customizations.dtsi>'.
>
> Requesting the dtbo from user-space allows to let the user to create
> its own dtso without the need to modify the one in kernel sources.
>
> Does it make sense ?

I think I understand what you are saying, but at this point the RP1
overlay would no longer be an RP1 overlay - it would be an
RP1-and-everything-connected-to-it overlay, which is inherently
board-specific. Which user-space process do you think would be
responsible for loading this alternative overlay, choosing carefully
based on the platform it is running on? Doesn't that place quite a
burden on all the OS maintainers who up to now have just needed a
kernel and a bunch of dtb files?

If it is considered essential that the upstream Pi 5 dts file does not
include RP1 and its children, then Raspberry Pi are going to have to
walk a different path until we've seen how that can work. By splitting
rp1.dtso as I suggested, and perhaps providing an alternative helper
function that only applies the built-in overlay if the device node
doesn't already exist, we get to stay as close to upstream as
possible.

Phil

