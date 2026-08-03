Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66CAFC55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 16:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kPUuUdXNlj9HGEt2H/gq9i9+yKMP/RfrBRw+r1bpfmE=; b=JcXwNZxtdCB5IhIZTxVz5hkBH6
	iBAOn1PlxX26pUj81T5jMvNs5fWSQmrKTWOMnxLdWEdO96DOQKRXIzyZGImWoNhT0MCi5iY9aCFUP
	WnXJhY1OPmiQUdFLr/aRBHoQYxSmoWpLxCbFBxDRsZ3s0o7BbiNXwATh6o9zgYbvIFbo/c8u3APnl
	ON2IfGQFy0VXiukry+LL4RzohD4+k7NHcgdwS8rJmF3qDh9SdkIm7Y+aXBHHAV7Y00MUWJdDFw/UC
	x/Dxljcvb8fOfLQHoI3w5INPAB2REt8uJxcIKvRrTlCfDBA0w0YNTp5NqLCPIP3dtEEXRT/YDwQ5P
	fgQ+gC7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvE5-000000001DY-1gHc;
	Mon, 03 Aug 2026 16:09:17 +0000
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvE3-000000001CI-11G0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 16:09:16 +0000
Received: by mail-ua1-x934.google.com with SMTP id a1e0cc1a2514c-9667ea2fc22so519847241.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 09:09:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785773354; cv=none;
        d=google.com; s=arc-20260327;
        b=PsiOq+W4kOvF245e1ZfWYDgdTYjL696KDsXMqyl9MVfkw0ZWlufva9ESDROOI+uTzj
         uVbAUksEMKoUz4V9RPjW/KToW2wYaUoKTE7qjbnO7qfdYWUG2on55lYRtUlDPS+acadQ
         xowDIa2X4FDjC5of1SC9p3bog+tvHKdcLFjg2AHbeu2QYSCUhWpPCInt85xaWfnJbjJC
         auOmkBjrhS7ErH8+2TQKrMakx1ClZ3uElyqJVh2DZ43zT1XTDGWiqpO+vBJh/HGrTJ8g
         E+qfOGKFGybWh7Y0NqV9KxP+JSr7xF8PMHpeQKEPS2Pl3+HmjxYJe+TarM6x4bEglFxI
         AKlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kPUuUdXNlj9HGEt2H/gq9i9+yKMP/RfrBRw+r1bpfmE=;
        fh=UMH34lRXHn0bOBuh5nc7v0Lw+tQIs0twGxbnbNwIxNs=;
        b=d32u9NPAyCtrP5C5sX7orSAf91/dUelHatlcTRFlHik2s6aIIQMIIBHVNuSvSsq2iR
         ArTmjg0sN4E0Snxzb1omcP3TGjLtJPeC10NynKXRszJFKMoM63StOCicsQREmXAQWUFz
         DJHaE9/aP+2x7WAK8sqRF2dtQdWmCFqhPhuxccfwfGd2MIgyQmAch023+Fuxk5YCDMx5
         hO3zGkxhAuySxlbx5ifNMxkXXEjSw4FrZFZFY0a7RPDEzEXFmcvlpR9N2+0UnzQ6LiMI
         FnuNpjyJPDYoaxW4vCIjs53jzFYSdKZe29hW9+E7mzdEv5WHWTRvUeCCw9tHXAFtFqUN
         kyLQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785773354; x=1786378154; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kPUuUdXNlj9HGEt2H/gq9i9+yKMP/RfrBRw+r1bpfmE=;
        b=lQ+MW7/oKFokt2VfPS18YVXVAYwNABmZAzMcb9fxVzSBS9ETPy01DRS30b3qpNmnPu
         X++CuwIh/w7gHmYFxCnS1xYt09x/XfhXKPEw+Sx/XZBvlBbtw+rGRdss7sKBHV/QhkC7
         LriRaUdlJVV8i0GfpIGcvYkK50qwmA7BcQJwupf3ELuZYC3Jnsduair5X0QNm9PvoyWb
         sMZFHmdNQLLmEbwtYPlwLeL+TIryyKCphS+3VbEWQ6lBLX6/T9fqRaJHnT8QqTUAXzM4
         c7TW2uVs2iavJIa79MojKFzcvWG/NzyJoZ5K56ZpWWnxcIFO/WtejiJunZvhmusZSy/V
         /zJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773354; x=1786378154;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kPUuUdXNlj9HGEt2H/gq9i9+yKMP/RfrBRw+r1bpfmE=;
        b=dZ7zUFRLCmtezl4Ei4wljKCiVUZpCSUVQCXUdba5ZSPblufHTEnvlGoYqRFOX1hGKK
         xhtj8xZMzImRzv/jnNfbmaQ19wt+fgRhX8xRhaqhXCrOTFiiYqoK5Mvwry88tpCD/3kq
         /uLB9fhFwNQOeB3pKkTISR4T3NVbcDG9enYYGG7/Z9C4HlUhjGr8laiZWF/+MmHbpUuU
         uckLXQYn4YJ6uvWwj42SrscnmSSDnaihasM5Gtx853VCijOX8atILsj5zQVgY/FAqBu3
         JKprjtnUfZMUXhDR/OMqJ1NxoljJuSiMSokOEJ1/LNdxWuYUYCLXRuH5R5LzjSCzK1Qo
         EciQ==
X-Forwarded-Encrypted: i=1; AHgh+RqYn5G0gfQXptZ4KZEN6OxXSO2p+Ppy6kD60zYb/KxHE8vCm6jpyxl7Ms3rYAUBxnwyamOSOuaOMKe1+ziq+giz@lists.infradead.org
X-Gm-Message-State: AOJu0YzaERbUXJMCXD665nhAioGTmxpm5ZfmY6g4af2m0CzTg4GIFxo7
	PvxAtsicLjEJCI+A1f2v8vRXqZn7EMM5adHB+PqjboXEucBu/Bn+D5J1ergTu66hLkW/tuouu0x
	mB/RA16nXNzFBREM5fNC/3yjDMCNU4Ps=
X-Gm-Gg: AR+sD12dPnQWRAnN/kts4DAs/7wMqwtYfXlGh/UPbj1eOG8CjbbutiGKAlKcEvg8qu3
	0rpInd9kW1gAZVIUikxfWrEzI9lohexXPDyKeGDmsel4xhLtCuBzfa9SzTp1bx2F4kL3PJkaAtZ
	iiNtm1U5uM3rZt+laKwgKKLaow2c+Pnrbcb3JM8vWg7JJUPLKguSukmYwROtDh6EHnyj2RIq+BE
	ZsUtb9FIEnH6Zh1qRvJMccfbY0XUMmErfebCFWVAp4h2rytpDtokQsR9aRmmuPrstObjXQBxrM8
	ISWqFbszbjZcLbMYhtl1EpgZjbV33QmNAjUJOz+E81Pp+vxNoTZF4BCGRLC0gneRqQWu+h39fOt
	icoIY2ZPoaEoJUb/QYJhfNkFgIP0uO6+qYg5Dv1yNu0cA5Jst3zYWrwKJAWZzIUDnDNh72YkhMI
	E+Q3UgSzzk01CTeOJWgi4JHeXG5Lg4zd/jek+Q
X-Received: by 2002:a05:6102:15a3:b0:738:be73:55e0 with SMTP id
 ada2fe7eead31-75b237677ffmr7059647137.12.1785773353603; Mon, 03 Aug 2026
 09:09:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <20260802-submit-acx00-of-dynamic-v1-v1-10-0a53cd9e21cc@gmail.com> <05b1e6a2-725e-4b8e-8629-249637bbcb81@lunn.ch>
In-Reply-To: <05b1e6a2-725e-4b8e-8629-249637bbcb81@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 3 Aug 2026 10:09:01 -0600
X-Gm-Features: AUfX_mx9mt9dbVrMmCFnN7qHq2KVIXtx4IDcN-1su1pyV_2ANjujEXVMup0YQWo
Message-ID: <CADvTj4o0JdjoO+FC4pO=qnjEQ8MRyzQdKp2Hxy9NsPU-gym5OQ@mail.gmail.com>
Subject: Re: [PATCH 10/21] net: phy: add X-Powers AC200 EPHY control driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, 
	Richard Genoud <richard.genoud@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	mfd@lists.linux.dev, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_090915_295119_2B0F7675 
X-CRM114-Status: GOOD (  18.40  )
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

On Mon, Aug 3, 2026 at 7:51=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +static int
> > +ac200_ephy_ctl_set_led_outputs(struct acx00_ephy_control *control,
> > +                            unsigned long outputs)
> > +{
> > +}
>
> > +static int
> > +ac200_ephy_ctl_set_led_polarity(struct acx00_ephy_control *control,
> > +                             bool active_low)
> > +{
> > +}
>
> I've not looked into the details, but these look like pinmux. Does
> this I2C device have a GPIO controller? Can these pins be used for
> other things than LEDs? Maybe you should be implementing a GPIO and
> pinmux driver. The Ethernet PHY driver can then just select the
> correct pinmux configuration.

These do not appear to be GPIO or muxable pins. The AC200
documentation describes them as three dedicated EPHY LED
outputs: link/activity, speed, and duplex. The bits in SYS_EPHY_CTL1
enable those output pads, while EPHY_CTL provides their shared
polarity setting. I have not found any documented GPIO data
registers or alternative functions for these pins.

Therefore, implementing a GPIO controller would expose capabilities
the hardware does not have, and a pinmux driver would only provide
a single fixed function. The callbacks exist because the LED function
belongs to the PHY, while the pad-enable and polarity registers are
reached through the AC200 I2C regmap rather than the PHY=E2=80=99s MDIO
registers.

>
> > +static int ac200_ephy_ctl_power_off_locked(struct ac200_ephy_ctl *priv=
)
> > +{
> > +}
> > +
> > +static int ac200_ephy_ctl_power_off(struct acx00_ephy_control *control=
)
> > +{
>
> > +}
> > +
> > +static int ac200_ephy_ctl_power_on(struct acx00_ephy_control *control,
> > +                                unsigned int phy_addr)
> > +{
> > +}
>
> These look like a regulator? The phylib core has support for
> regulators.

The external supplies are already represented as regulators. These callback=
s
do more than enable a supply: they sequence the package clock, reset and
shutdown controls, then program the PHY address, calibration and interface
state required before the normal Clause 22 endpoint becomes usable.

> Maybe take a step back and look at the overall architecture, and how
> Linux can represent these blocks.
>
>         Andrew

