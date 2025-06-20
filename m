Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E61DBC71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 14:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1t6PGTJKQEggA93pitXthJFJmYTge6aCgfricxPdEFU=; b=XFfJ6iV0QTaB+f
	eaFhtf+1+8btHMgpaEF/ipHMY5TPBNbr5KEii+WoRjJdSA7pAlG/Tpx59UcB/LFGyhQNNbeX8Ngkm
	Z0tEflVVlwwBrDHaKtaMU06JU+qA1Ex2LCGWv82qg+0qd0zgjgkeNzVPxwZ/poOIv8HNojKwWtfQG
	zkN+R9NIg3zBNvcjrQ586GBjT4Tkd42ueuvyFcP44aV1GhQ5qAAKbnIlgZCvNID9wNJUN1i6vI/F1
	7EJIYJ1lcDLXcKd7bEjdb/T9qKmeuei8F7Z80ToTjoXgvQ8HfBWfX7N4LzS7Jm/GWfj5E8JSYN6Aq
	5TzdJkhUnHDlGhCBxg1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uScUY-0000000FpGq-0Paj;
	Fri, 20 Jun 2025 14:13:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uScSI-0000000Fouk-3rFh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 14:11:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 460EE5C547F
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 14:08:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77EECC4CEEF
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 14:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750428657;
	bh=DWLqTlt7qScs/eSqGbluIhMQJKPILMhDxFv5Fnv72L4=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=aFeoPcWJMnJJuG3uY3WNTldZ7QqXEuKax9osUXOEC/BlfQ1pDs/Ov32VZ9Yv4XTQ3
	 lQNKx47qX7paNjvfsENL661ABeLP57dDabdE8wAbR6KbZlLbLbAxHshHP1FS91ipKV
	 1qxD/0ClURf6XbmNjlDkptniJkAKl7CbKFFv0L2pDGmKCNUBqJNUuFf9/uKdIVnQLV
	 gD/9g272BlMPwerwzPvHgNVqsQVekFAs+d5f6aW1HOaoINhfR1rWmL/BGmuHXVvJFU
	 N+FEDu2G/WFhCjaEpSzlLmkI20ssityG/Qv+1D26ykwJ6604NFpWL45MkFmSEFF53m
	 4F9qg45KlUzfw==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-32ac52f78c1so17932831fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 07:10:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXXJsCO2fCyELdEAt94K240So20+c4EL/Q6g2GbLt0zAVI/L3M2A330l4LDDAcsRmoi7IkN/aUTdd8V7zu4fSva@lists.infradead.org
X-Gm-Message-State: AOJu0YzNjshAWr0zVNulCRpDP4JvrNU0OX1fP44edfduzt1KMfJXvCGM
	w00RHoYl+01dSNhqVYWbr5mB5mzDV5vW9W2BR8SFQ+P0FlOpp1LrAlNFiV3lqspJCIe+6gjBf7M
	ilGlMCuqjp4RNOk1iJ/Ubl/infw53Wzk=
X-Google-Smtp-Source: AGHT+IH8CF2NEra9No6azeD1GCngMtpDBipIwRYnL5TXqwOKzg1LS0rA27TzN6NN9wS6furzgVnYmCLyy13aH/I5tbY=
X-Received: by 2002:a05:651c:2006:b0:32a:74db:f3c1 with SMTP id
 38308e7fff4ca-32b992d7c61mr6520011fa.24.1750428655837; Fri, 20 Jun 2025
 07:10:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250619173007.3367034-1-wens@kernel.org> <20250619173007.3367034-5-wens@kernel.org>
 <20250620145508.4d483885@donnerap.manchester.arm.com>
In-Reply-To: <20250620145508.4d483885@donnerap.manchester.arm.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 20 Jun 2025 22:10:44 +0800
X-Gmail-Original-Message-ID: <CAGb2v66unLq4qiWDVVOLk3Aez2FTswXGXo7BVipeE-r4uhfcaQ@mail.gmail.com>
X-Gm-Features: AX0GCFv8LAvHWHMZ_VtGp4DmOmmFrWvOE56WxoB2hq-SW0Ou_bsSiN3oBifigJ8
Message-ID: <CAGb2v66unLq4qiWDVVOLk3Aez2FTswXGXo7BVipeE-r4uhfcaQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: allwinner: a523: Add UART1 pins
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_071059_038669_26EEEAEF 
X-CRM114-Status: GOOD (  20.36  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Jun 20, 2025 at 9:55=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> On Fri, 20 Jun 2025 01:30:06 +0800
> Chen-Yu Tsai <wens@kernel.org> wrote:
>
> > From: Chen-Yu Tsai <wens@csie.org>
> >
> > UART1 is normally used to connect to the Bluetooth side of a Broadcom
> > WiFi+BT combo chip. The connection uses 4 pins.
> >
> > Add pinmux nodes for UART1, one for the RX/TX pins, and one for the
> > RTS/CTS pins.
>
> Interestingly there is only one possible set of pins for UART1, so the
> naming is correct. Which would also mean we can insert the pinctrl-0
> property in the UART DT node in the .dtsi file already.

I'd leave it to the user, since it's possible to use it in either 2 pin
or 4 pin configuration.

> Regardless, checked against the manual:
>
> > Signed-off-by: Chen-Yu Tsai <wens@csie.org>
>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Thanks!
ChenYu

>
> Cheers,
> Andre
>
> > ---
> >  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm6=
4/boot/dts/allwinner/sun55i-a523.dtsi
> > index 30613a0b1124..6f62201fd739 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> > @@ -168,6 +168,20 @@ uart0_pb_pins: uart0-pb-pins {
> >                               allwinner,pinmux =3D <2>;
> >                               function =3D "uart0";
> >                       };
> > +
> > +                     /omit-if-no-ref/
> > +                     uart1_pins: uart1-pins {
> > +                             pins =3D "PG6", "PG7";
> > +                             function =3D "uart1";
> > +                             allwinner,pinmux =3D <2>;
> > +                     };
> > +
> > +                     /omit-if-no-ref/
> > +                     uart1_rts_cts_pins: uart1-rts-cts-pins {
> > +                             pins =3D "PG8", "PG9";
> > +                             function =3D "uart1";
> > +                             allwinner,pinmux =3D <2>;
> > +                     };
> >               };
> >
> >               ccu: clock-controller@2001000 {
>

