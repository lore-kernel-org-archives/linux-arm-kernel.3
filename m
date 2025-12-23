Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F0DE6F06C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 09:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GTGEyTW46XThYDSb3nGfOTcnTXkOQCNX3Dl5sNqjw6Y=; b=hWdUao8kgF9OrqxXY0A69FtOs7
	gevbSC9sy/wI1P7D8xZMdpwXeR4hwhRFu6ktDVzX1D8Xgzszl4qrwLEJ971hy1sOmtBUXhoN3rKDr
	a6iH/DFAfhpDOPLqZj8LbZEGXijraohQ3gZUOw91nWLTSKH2VQWsgL0aj+xWAB6jbxXyrxlZxhfS2
	AZ5EWTotWfkprNSsgBYY7ff6Tus6xe6ZlGzh9Yb1huwe8ACzhwCDOyFi5iy73kc9MhpE2/9FbVvvR
	EvdVUhUUlL5ZLboANCU+c85n6egi3bnmKzVzroZBHymjqHaeT3gjXOS5Rio8rZRDAauhjcHkgaKQJ
	L/UZ9sUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXyen-0000000EkM3-3rm5;
	Tue, 23 Dec 2025 09:26:17 +0000
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXyel-0000000EkLe-2FR6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 09:26:16 +0000
Received: by mail-vk1-xa2a.google.com with SMTP id 71dfb90a1353d-55b1dde0961so3512879e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 01:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766481973; x=1767086773; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GTGEyTW46XThYDSb3nGfOTcnTXkOQCNX3Dl5sNqjw6Y=;
        b=NtliWllDKHuQqmY+sabNCyrBQBg36stdPgQWAynuRrwFODXo8SftmDcjbpDXNQPKbP
         sJ2fBKgmZnuRFcCK57Axe/CfZFv54v/2gYAzr+WlYe1xYMHjtMrl0KtiQdKe2A5P8C1y
         5jSocfTpRmykNYxmfGAOj4PeLx+kfPbMvlJ0CHKQ4gpFo9Jt+z5U+JjZnM5bMtAH7Nif
         7wNlmAXIWKVimpXy2GIO0xhfUXp7Oiu6xK+l86G2nq0hXMzbBB2dTxKb5btul7ULWCmI
         CouLO09EcEQftQOd85mNqR31CCkW1SFlTNLYZoJpYh01awPIRWh3TIiCGa4LDjE72MdR
         slrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766481973; x=1767086773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GTGEyTW46XThYDSb3nGfOTcnTXkOQCNX3Dl5sNqjw6Y=;
        b=KWyAz9o4FqBtKfxhqvwGFX9IFTdE9a7BhZRIVg9+k6DQL5ODWpBmB5N/Xd3P/+aVaz
         v3XH3DU2f/xlzXpqxGHFuzCWUH3xznvITcm42oAF/3XlBhvLEhazws2qWkvEIO7a0ZpL
         4CYGnjyO+i8kQTvbQfcyVJTXhwRf8skFO6fwO3bvFFsiEVDepldM9qFSilv7yMO1/ALn
         SJAvb3ANmvJWOKhhRu3AfAEIUr+Gylr6jH8Z/6AJvI+T+mT7xeJ4T5OAVhBnWNoaAJrn
         4vwEB3B1dAmIe8ACyjr4n6umO479sA57pQZ1fZPviryCVFW7JHHBlP2kFRF0XEmXA0YK
         wsKw==
X-Forwarded-Encrypted: i=1; AJvYcCV0kwUdjCK9Aua3nh7tc9qMtfYMG0N02RIKlJvP6NEwDwlJZuXA6AZz1S1Ih6LKGBydMynX+jl1fEMSx6NYc0VM@lists.infradead.org
X-Gm-Message-State: AOJu0YzSOcJsQpxAQAdKlg91i3RlJt9kdcOy8d4VP2VAtrqEOxG+4kHw
	EPHOzj+em3s9CqqCnFFzMWwqfyPEXBM1nUkMUn02dmna3aT1H2eBnesVLB43wiOcNcxIixqJN3F
	p4YyKsbFemGWAc2/LsyN0YIDprBuGYEA=
X-Gm-Gg: AY/fxX77CQFq7hHosqH1vHATh+5aTwFcLVyBmwjVqv0U1BhdHH6sKNbTF8Esb4UHcAo
	7ZTtRSz3Kzthlg6R8E/Ng6cP+4JjsjMUuWu4E1QljbRlg8B5KjRZ90HIpTuLSTNNDxrYEMs2FDa
	c246wdvDWi+zjGKC04Gza5uYcY5VIRRoZS4ZFahewdUZhp0CYCX6C2BBAV1Iv9zT9goPPA426nm
	yaTPjrEYjIiPL8cijAo0oys5+U8/kD3SQO1CdP03sI/FFZyXNGHOCth/QimLDq33tU5M5vGhNQp
	JXqt/Mg=
X-Google-Smtp-Source: AGHT+IGNdoIAhQtLGCBr8mC/SwI6VG9mNcrxVeUK7FLVxcyVEZlSIvEaWHvs6v2NaAD9i9XNu9ROrW3FCi+AlPV3bc8=
X-Received: by 2002:a05:6122:8c26:b0:559:ebd7:56e4 with SMTP id
 71dfb90a1353d-5615bceb93amr4461609e0c.5.1766481973546; Tue, 23 Dec 2025
 01:26:13 -0800 (PST)
MIME-Version: 1.0
References: <20251222-ventura2_initial_dts-v1-0-1f06166c78a3@gmail.com>
 <20251222-ventura2_initial_dts-v1-2-1f06166c78a3@gmail.com>
 <c069b452-df22-4afa-bf6a-c48949f40ebc@lunn.ch> <CAF7HswN_jEXOU_9K4LpLnbhvd+RD0qqELAHxMBbp=hGtMjS4kQ@mail.gmail.com>
 <35f3eba9-5ec4-4cba-8a64-fb521dc65b79@lunn.ch>
In-Reply-To: <35f3eba9-5ec4-4cba-8a64-fb521dc65b79@lunn.ch>
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Tue, 23 Dec 2025 17:26:02 +0800
X-Gm-Features: AQt7F2rfLXR1N_dAP9Rb-QfqDYef379P6Ra9zBB7wrWIZBUMZ5TM9ysNyWSrhdo
Message-ID: <CAF7HswN0hhJQ-gmE59cKTuPyzrs1A3rM8Xw+Z8i3_AsHRiNcug@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_012615_609377_06C5DC4D 
X-CRM114-Status: GOOD (  20.51  )
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

On Tue, Dec 23, 2025 at 5:13=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Tue, Dec 23, 2025 at 09:49:02AM +0800, =E8=AC=9D=E6=94=BF=E5=90=89 wro=
te:
> > On Mon, Dec 22, 2025 at 5:30=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wr=
ote:
> > >
> > > > +&mdio0 {
> > > > +     status =3D "okay";
> > > > +};
> > > > +
> > > > +&mac2 {
> > > > +     status =3D "okay";
> > > > +     phy-mode =3D "rmii";
> > > > +     pinctrl-names =3D "default";
> > > > +     pinctrl-0 =3D <&pinctrl_rmii3_default>;
> > > > +     fixed-link {
> > > > +             speed =3D <100>;
> > > > +             full-duplex;
> > > > +     };
> > > > +};
> > >
> > > That is an odd combination. You enable the MDIO bus, but don't have
> > > any PHYs on it, no phandles pointing to it. And you have this
> > > fixed-link. It makes me think you have an Ethernet switch on the bus,
> > > and this connects to it?
> > Thanks for the clarification.
> > Yes, there is an Ethernet switch in the design.
> > The MAC is connected to the switch via RMII using a fixed-link
> > configuration.
>
> What make/model of switch is it? Is it unmanaged, or does it use SPI
> or I2C for management?
The switch is connected via RMII to the MAC and is managed over MDIO.
On our board, MDIO is not wired directly to the processor; instead, we
use a USB-to-MPSSE bridge (FT2232) to toggle the MDIO signals for
switch management.
So the MDIO bus in the DTS is not used, and enabling it there was a mistake=
.
>
>         Andrew
Best Regard,
Kyle Hsieh

