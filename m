Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF6EC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 18:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zCyaallTEZbcZi+JylNVW9wmEI/TBI8/RQryPjwOpa8=; b=ZB8QEtfZlIb59WcVP3sP4iDE+o
	X6INgD0nZCgHMfzSMCEg6mLiGTpKa8eLojHO+1IqaKLwBVDWTMJiwhxLzCbTGg9Wn0H/coqn1WoUG
	y1AOUk6LM/8b0VT7sZq5989oT8INCXWw/EiikoDP/LDLbQr6A8iTbDZ/6WjFepqvexSVkGEv/RbxN
	oIbkhMo/YBuK8Qf8E884yDJxjrW78snEeGBBOjnBXPAihHO/kCNrgZuWzrDUk+JCZGkNlQ8JcdetN
	/OSyhmHCBVnpIuN5Yy/CqyPKalrTK0Ud8wL4vNZrUyVpWGFififhzOHMARIFDLcTT6Dfu+sSyGZ5y
	jD8F176A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tidrn-0000000CDSC-2riK;
	Thu, 13 Feb 2025 18:23:15 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tid2G-0000000C10Y-3ZWy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 17:30:02 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ab7c501bbecso169242066b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 09:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1739467799; x=1740072599; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCyaallTEZbcZi+JylNVW9wmEI/TBI8/RQryPjwOpa8=;
        b=P8sDOwxKiXpDYS1ijWJPqQxDSQoLNdfR69srmP6ciN7de4nKIXcfDe9d0xrDfKFbWf
         aZExNXg3frtc0bh4hUnmDkt5TEMrbHFCZARr45KfUeXX5yhA0OaLTXZnsPp3G+xARmKk
         tTe7Yqor1AfgtkZwMMVdYwBkRbjo/wdGmjft0Y8fCz0hlXq3lTnMUOCtuQ1fwk4EhzjE
         f/XAphzFWB3PrtCICSGJ35Lf8hu8wPKcsvCG539ZjKFRXiFx7T2c0wO5QPt2c3ji/zT0
         glNLfS/Q7vTQlnN99QLFN1RuLK1pkqQKGeIqbCztPd7YI1rMN6Dyn8C64PN5e7QE39Ax
         oO8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739467799; x=1740072599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zCyaallTEZbcZi+JylNVW9wmEI/TBI8/RQryPjwOpa8=;
        b=S7cXu9ZZNc9L1/yQ13IhYqdjFKioGjpbnFe7/ehAm8A1tsl3k/O1taRjTD/FYJln6l
         nHF2Fg/pW0TUtwNIXUUYEb0rOHlJfmADOAlj4h0DoghYzvmf/J4oP3M4ms4iFWuq9+ii
         iIDfv7kYhpriiGUhpPB+sGJ2ULhMp1dGVFeEZXrO4+3L52rNt1BsaXKavpDxhnqEuFR+
         64Fz+qaOThsd9R8j8vknrcRuvPaUeGSMvAsk4IRiiq99rdpeDNjEMAPUP1cnWN4PJSGx
         czfJ4WcDzkM7l1zIp4xBqSn8kZsESsBN4jgmowq5sMfY4aaB9bN4+eq19DtX9oRHPcab
         gfCA==
X-Forwarded-Encrypted: i=1; AJvYcCVpL62u8jc1f6apdod3moiXzsk+fJk9vWTaqcQXieSDgrCJpSJ8hcsKkB8JvWasIkOtSwAKMRDKMZZPEFlto2SJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyDKYiqd0Vkh8Zf0PPxhVpmZs64NIZhdXLv378B6z2fuMBCvHbD
	tmU0Dns6h+vsa+92nG0kQdCkD9jdaRWXsROLFj06RVbvzCcUmPK2eSQZUMC8k0dv9tf0JDXk7lA
	NnC0ntGrpE3V2U3GQUjvZtZdKnpFCTbjC9WJbnw==
X-Gm-Gg: ASbGncsQLRhEJaS2XF0iVCrS8PUoyrt5tsxxnbs7xPUz2n8epj3spd3SlqY5S+WZ84U
	cklI6Tzj9koDY3k67yBX1/BkDWX/i5IIXbANQfxjjQB+O/An2pe/v5XRcmre1wkDHbIXIUwhiF9
	ZuMobknKBEExsj6uFq+Yrydtq7DWKv
X-Google-Smtp-Source: AGHT+IEHpzGOhWWzUiRDzPOLNzp9YXUJMsGD72YcUx4PUeutR3aym3wR77yLoxsgRGXTk2VSMsiRI1k+qJ+nezQ3KC8=
X-Received: by 2002:a17:907:86a7:b0:ab7:c284:7245 with SMTP id
 a640c23a62f3a-ab7f339c875mr683201066b.18.1739467799148; Thu, 13 Feb 2025
 09:29:59 -0800 (PST)
MIME-Version: 1.0
References: <CAMEGJJ3=W8_R0xBvm8r+Q7iExZx8xPBHEWWGAT9ngpGWDSKCaQ@mail.gmail.com>
 <20250213171435.1c2ce376@bootlin.com> <a3c5103c-829a-4301-ba53-6ef9bd1e74e7@lunn.ch>
 <CAMEGJJ3-JXhin_Ht76EqUNAwLiNisa9PrCrdUzCgj=msGZfb5A@mail.gmail.com> <20250213180733.11999e07@bootlin.com>
In-Reply-To: <20250213180733.11999e07@bootlin.com>
From: Phil Elwell <phil@raspberrypi.com>
Date: Thu, 13 Feb 2025 17:29:47 +0000
X-Gm-Features: AWEUYZklu9_MY3YY8SePLjBKtjUgGs0eTYBH-ezMm1VNb2UMos7_-NKxbQAJTns
Message-ID: <CAMEGJJ2FB-wwyOtjjCmPJ-vUDpZaV-8MMXxV13qXnKxYSzt9pw@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] Add support for RaspberryPi RP1 PCI device using
 a DT overlay
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Andrea della Porta <andrea.porta@suse.com>, Arnd Bergmann <arnd@arndb.de>, 
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
X-CRM114-CacheID: sfid-20250213_093000_892433_D6F02F4B 
X-CRM114-Status: GOOD (  30.06  )
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

Herv=C3=A9,

On Thu, 13 Feb 2025 at 17:07, Herve Codina <herve.codina@bootlin.com> wrote=
:
>
> On Thu, 13 Feb 2025 16:30:44 +0000
> Phil Elwell <phil@raspberrypi.com> wrote:
>
> > Hi Andrew,
> >
> > On Thu, 13 Feb 2025 at 16:27, Andrew Lunn <andrew@lunn.ch> wrote:
> > >
> > > On Thu, Feb 13, 2025 at 05:14:35PM +0100, Herve Codina wrote:
> > > > Hi Phil,
> > > >
> > > > On Thu, 13 Feb 2025 15:18:45 +0000
> > > > Phil Elwell <phil@raspberrypi.com> wrote:
> > > >
> > > > > Hi Andrea,
> > > > >
> > > > > The problem with this approach (loading an overlay from the RP1 P=
CIe
> > > > > driver), and it's one that I have raised with you offline, is tha=
t
> > > > > (unless anyone can prove otherwise) it becomes impossible to crea=
te a
> > > > > Pi 5 DTS file which makes use of the RP1's resources. How do you
> > > > > declare something as simple as a button wired to an RP1 GPIO, or =
fan
> > > > > connected to a PWM output?
> > >
> > > Where is this button or fan? On a pluggable board? Isn't that what
> > > overlays are for, and they are stackable. So when you probe the
> > > pluggable board via its eeprom etc, you find the overlay and load it?
> >
> > In the Raspberry Pi ecosystem it would be the firmware that applies
> > the overlay, and it can't do that if the resources the overlay refers
> > to are not yet present in the dtb.
>
> What do you mean by the 'the resources are not yet present in the dtb' ?

Consider the fan connector on the Pi 5 PCB. It is wired to GPIO 45 on
RP1. In our current Pi 5 dtb there is an instance of pwm-fan whose
"pwms" property links to rp1_pwm node, which declares a PWM block on
RP1. Similarly, the camera and display ports make use of I2C
interfaces on RP1. The camera and display overlays, applied by the
firmware, have references to those interfaces.

If RP1 is not present in the dtb then neither of those scenarios -
board features and overlays applied the firmware - will work because
the necessary nodes and symbols are not present until the kernel has
started running, at which point dtb has been handed over.

> Also what you call the 'firmware' is the bootloader ? the kernel ?
> Can you tell me who is the 'firmware' what is the mecanisme it uses to
> load the overlay.

In the case of the Pi 5, the firmware is an EEPROM image containing
code run by the VPU embedded processor. It can load overlays using the
same mechanisms it uses to load the kernel - SD/EMMC, NVME, USB, TFTP,
etc. The same problem would exist for U-boot. Even though RP1 has a
standard XHCI controller, U-boot wouldn't be able to detect it and
make use of it, say to load a kernel from a USB stick, because it
isn't declared in the DTB.

Phil

