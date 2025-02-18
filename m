Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B80C021AE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 12:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8aKmlMmkGK0UfyeuqhRhT99w4TL2OYZoP6ekSWwvJ0Q=; b=r60BwUuE3sIbUQvUHfpobeZHsi
	nhNhhXZoXjSxAgFN2GgKJe9AYBHGp+b+UKNCXH/duSwZH4zrK2ug15tyIlqgrvduRQA1f2sAm0fTG
	5N2ObB4GViFbicSMuWdG6SQvdVxInJL+TphbYFl+L76r5NVS1ndmomJvlKZeKobuBKduqAT8e0/JS
	/gZu3NElUTJ8EAT+7/fbirFyqC7NyGrU0mw7be1TsIWMoLMVG+6YGynt4gbiW1bphQv/+f0LjCpU6
	LzNuyZf7pfHtH87wflq2XQInel1Wzt5wkEg0rPgV5Ey5wqaRM8WQ35vRf1EddVVQ3Vh94MOlQQtTB
	T3vHTuIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkMKZ-000000084Uy-2103;
	Tue, 18 Feb 2025 12:04:03 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkLzB-000000080AX-0OAq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 11:41:58 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5e02eba02e8so4546887a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 03:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1739878915; x=1740483715; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8aKmlMmkGK0UfyeuqhRhT99w4TL2OYZoP6ekSWwvJ0Q=;
        b=T/5kYqYUFBxDGV9itQAUtlh6ADTMZGH3PXnJ2hptHeSv5LQUgC5rV4NGIrCtYCFU2+
         NlnNPnTaFC9YwtvR/muVkX+jPl4seQ7h2iX/AvhrwIvdTpsZzWtHB2a7pEKBfuLxTbpb
         1lJOgtUa+gcmy1cCJ9V9Oz11ZOeCFbK6jv1sJlEwcgLblQ1zyOCptvNoDv6KA3BWHb9O
         7Ncm5ekYPPGheeKNDhEKrQennWbTCFVvS+FnWCuTwKLEeksDz7cCE4Csf8AQ7HcR1093
         SHeI86vY/HAbdLJIxDDEaIXaP+11H5GIGYYDeDg4XuIh7iHoogkoiSgWSMhlpOyLrpJh
         fDhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739878915; x=1740483715;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8aKmlMmkGK0UfyeuqhRhT99w4TL2OYZoP6ekSWwvJ0Q=;
        b=Up2PDFUiDAdlJPlPZs/ZpX/w7kWwkvR+Fbrvzv8fFNAO0dFDZetauxxrmwUXfofb93
         liFNymJGTKHQxWOynEVCZjeRefZ/0EW9U3XRbE0NxwrWX7RymlU4KXZednWXSvmlm5Ln
         BKuOmEnO0NudxDfbHuMCFAZ+zPmPLv7ted8I9yrdZ8fyNe04Y3iu6qBn4hd5bksvIjYe
         6hOWzcZUgMpiBpF83tkMv4R/y9Whfep/AkeTtv+eGX7PoIRvo5e/WMgLaEtNa3bai6PE
         ikA8Spl9DT9/t/aWq+QW6rf97FkWtCCzUMXDsfpGrFS4+AePqkhjzJZfdgKD7XjQnzZu
         98CQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+zWLKwDnUmDd5/eW50sn6dFrJYOv7F1hLyFJtAtDmh92Ts95SuvYPn8Fle4zKq7W5TI2INTdb4JA+BtUrS+rk@lists.infradead.org
X-Gm-Message-State: AOJu0Ywk/F0jHNgKgSChifjMCzvyAKQXRg8zt/9QdK/jflI4vrPvxXA7
	AsSJu/vNWjl0lWykTKcHqKrFKHa4rGUTO3AYGCwkSugL4F7oOAAVXmzuOH359QjUEdYtD1KUJPf
	kDjyLgbeenst8Aa660gdUL4HGnpuEJKuqRTj8bw==
X-Gm-Gg: ASbGncsPUpD7SyoG3y49cnkVTDy62P5Ydf7RiswQJn2sIrEQBRwID4lZVQKu9HT14/P
	uXd0LQIFwCv2VCl3epx4fZtqofoetP8AJa4/FR9Lv4GIK6WWGHxvHQWHrBghBpM5Bo8FV3WyN
X-Google-Smtp-Source: AGHT+IEPNee71mSksjXSeSsWHrS2KAR9wIT4sz1ud5v06geo9drLnl7hEt7tvSIgJJ+4DJzXS69UPDMhP8dla+sJ57w=
X-Received: by 2002:a17:907:c1f:b0:ab7:86af:9e19 with SMTP id
 a640c23a62f3a-abb70db8274mr1197625166b.43.1739878915362; Tue, 18 Feb 2025
 03:41:55 -0800 (PST)
MIME-Version: 1.0
References: <CAMEGJJ3=W8_R0xBvm8r+Q7iExZx8xPBHEWWGAT9ngpGWDSKCaQ@mail.gmail.com>
 <20250213171435.1c2ce376@bootlin.com> <a3c5103c-829a-4301-ba53-6ef9bd1e74e7@lunn.ch>
 <CAMEGJJ3-JXhin_Ht76EqUNAwLiNisa9PrCrdUzCgj=msGZfb5A@mail.gmail.com>
 <821d4c74-09b0-4c1b-b8ef-f8c08d0f6b5b@lunn.ch> <CAMEGJJ0QbzCScfTRA_pw_8A=iMYMAAFs69zFNLwcOxF5Syugpw@mail.gmail.com>
 <20250213195304.3a2df02c@bootlin.com> <CAMEGJJ0kGCj=tjM6KswbG_+ZFkzMwPY+06BXCU0qSnbBKz0=ug@mail.gmail.com>
 <20250213220639.373da07b@bootlin.com> <CAMEGJJ2_HVKfsE3P22baadbzxSDAX=yTr=m76YuXa5A2cJsJig@mail.gmail.com>
 <20250217165306.3f055b94@bootlin.com> <CAMEGJJ13476pKJb441o5X0Y+rbfromj5-3V-j2KZiOt326OL4A@mail.gmail.com>
 <20250217185559.2e56bd75@bootlin.com>
In-Reply-To: <20250217185559.2e56bd75@bootlin.com>
From: Phil Elwell <phil@raspberrypi.com>
Date: Tue, 18 Feb 2025 11:41:43 +0000
X-Gm-Features: AWEUYZmepFe2lsLe25Me9NjAHmXEX0-yOAHWU0twEqpljxZQoXOSSXs2uoT9kzs
Message-ID: <CAMEGJJ2m+Qjk4L5xFJZk+X7XSiop_63BH9gsrykLwz3+VMAQfA@mail.gmail.com>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_034157_243303_E0909294 
X-CRM114-Status: GOOD (  29.30  )
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

On Mon, 17 Feb 2025 at 17:56, Herve Codina <herve.codina@bootlin.com> wrote:
>
> On Mon, 17 Feb 2025 17:03:34 +0000
> Phil Elwell <phil@raspberrypi.com> wrote:
>

<snip>

> > The job of the nexus node would be to translate a generic request for
> > a numbered resource to a specific request for an RP1 resource with
> > arbitrary properties. The arbitrary properties could be GPIO offsets,
> > which are board specific, while the node supplying the resource is
> > provided by the overlay. This means that an entry in the table,
> > described by a single property, could have contributions from the base
> > DT and the overlay, which is not possible since overlays overwrite
> > whole properties.
>
> Hum, I am a bit lost.
> Some DT example (base and overlay) could help me to understand.

I could, but I think it is becoming a distraction.

<snip>

> > I think I can see how that could be made to work for GPIOs. It looks
> > as though the GPIO subsystem is the only one making use of
> > of_parse_phandle_with_args_map. Interrupts seem to have an open-coded
> > equivalent, and iommus. What about I2C and PWM?
>
> Support for PWM has been recently accepted.
>   https://lore.kernel.org/all/ufl4kwrjyp4zid4muvghefevqc6hk3zyvxnsu72fxd4f46fzg6@hufkci2dzjid/
>
> For i2c, nexus node is not suitable.
>
> Nexus node works well when resources are indexed (gpio line in a gpio chip
> for instance). For bus controller there is no index.
> I mean we never refer a i2c bus controller using <&i2c-ctrl 12>.
>
> For i2c, I proposed i2c bus extension:
>   https://lore.kernel.org/all/20250205173918.600037-1-herve.codina@bootlin.com/

I don't see in principle why an address-cells of 0 should cause a
problem - it's a degenerate case, but it's still conceptually valid.

However, we seem to be having to invent a lot of new infrastructure -
some of it already supported by the kernel, some of it not - because
we have made the mistake of using a discoverable bus for a
point-to-point link on a PCB. I don't see how this is fundamentally
different to the USB-attached Ethernet controller on e.g. the Pi 3B.
Despite the fact that the Ethernet interface is discoverable, it has a
Device Tree declaration (see
arch/arm/boot/dts/broadcom/bcm283x-rpi-smsc9514.dtsi) in order that
the firmware can supply a MAC address. Yes, the RP1 DT declaration is
significantly larger, but size shouldn't matter for what seems to be
objections based on tenets.

Phil

