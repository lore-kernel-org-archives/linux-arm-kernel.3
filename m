Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A494D167FC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 10:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XI5Odb6Br9OANgGIB7bibAlV7TUObv+rM7BQBe7luTY=; b=l9Xc/L5cGF5kubbThDoxmr7zAL
	fFtUAsPGtBWdbzwwShfhcpdYpmNWXSR/U5T5yVG+F6F3Y+9IgVvTqEu8B+8/dN+87GDJBOiguQDc6
	d9n+wAC5J1qlxKNAsCiD8tTVlB1pWAymSUCbJxxNdF9vaiQ8gO7OHNt89Ywo5+/3PBMhzwQKXDZlR
	HBGuim8W7Uu/e85qBVHuyZWXZ8BIR7drClJ426F2UXTRp+IaGoLmcrE2z6wu18KgkbPOeIOWdkHrD
	JQdAZpiUjTlTfBVS1y91YcIQBvvdAdXOMOtytENROoqhaqv8nTo7JlHs/pU7poKlUuWGRN68bK8l5
	wwlyT5Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9aQ-000000027KG-1SOc;
	Fri, 09 Jan 2026 10:19:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9aO-000000027K3-3493
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 10:19:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CE4086016B
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Jan 2026 10:19:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86A36C19425
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Jan 2026 10:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767953955;
	bh=9hbsjUn6eYASbfA/oJT6XWtugpXGlLNjh8EPRyD3m04=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Q5HWPIYvfN0g+8t2ODLZ6RHYqLOPxZyUqAO8jXrlFFXbJfNk5PkQzNacBCGeWlOI4
	 zVWxIN+v/ND+H67OS1j4Vi913awzUf4IrWnMQVfD2Dpr24wELqnc2MFBMKJ1ZKLRm+
	 JVsn9pBwtUqBGoql22eIC2pTaZn/uEE9cygO2yg+h9puAJ1bsbFUfn6tnq0irE8nUt
	 /FagBI3fN0qA257T3lWotje4TpFQ1+rWcTinV80/YofYEx4LczcmTg2VUYLrf15CVW
	 3uX7arvzOc8Tv0ed/zvkpT7cPQwnGPex+YpZh2r/HPuz3I/px64pkGw3UDhomvDchG
	 HZz+igJUYk/GQ==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-78d6a3c3b77so31781517b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 02:19:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXeCT7y/2b6CL4UhBIT+GPt6lpVZKwZbyKG/kbU5OrTV92Faw5HTkQ5gZF6SQCgR1QhEkrWw6WUnQfFe55d8wVD@lists.infradead.org
X-Gm-Message-State: AOJu0YziN1YKt3g3UPXyN7OA4ywsS75IzZllhJiMKYfzF26zWdGx73Qg
	2jkJsZElLgq7C83bzMizYs/NWCDVjZMBNpGXgTMC1ExO1SVLNQojpi+aONHtIvWgvzQ1uklLIZ1
	BGMiSrWKasn3GK2svVlpvIX3lcTFu7NQ=
X-Google-Smtp-Source: AGHT+IF5GjxrLmuSZaExZjLaPOUjC/EsSoVJYPQqW4W2Vxtf6X+8zRZ62bSAxQ72fQzNPB0kphD/sc5lbPKYGJNdPlA=
X-Received: by 2002:a05:690e:130e:b0:640:ce59:128b with SMTP id
 956f58d0204a3-6470d2437b1mr10650880d50.2.1767953954886; Fri, 09 Jan 2026
 02:19:14 -0800 (PST)
MIME-Version: 1.0
References: <20251216112053.1927852-1-ye.zhang@rock-chips.com>
 <20251216112053.1927852-7-ye.zhang@rock-chips.com> <CAD++jLntu4LY=VHOMSXeLKXOBD9MTNziv47B0qkDjxUa1xAsng@mail.gmail.com>
 <85032ae4-4d82-4884-aa7c-b69fee76d509@rock-chips.com> <CAD++jLnH2vLNxTLj8Lw8RnOHxfitwi3G_8WCBtu+_=XL3ryH_w@mail.gmail.com>
 <a2f5c2b3-2168-41b4-917f-183ab72a4499@rock-chips.com>
In-Reply-To: <a2f5c2b3-2168-41b4-917f-183ab72a4499@rock-chips.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 9 Jan 2026 11:19:02 +0100
X-Gmail-Original-Message-ID: <CAD++jLkmieQpkJnAYyr7ys6m+v-=qNZaMoyKCtPFo+qjGwm8DQ@mail.gmail.com>
X-Gm-Features: AQt7F2pjRZjybV4xPqr9Y0E2i2C1kVX68rvkdaRtoGr0Zh5amDZGu50_yar2YJk
Message-ID: <CAD++jLkmieQpkJnAYyr7ys6m+v-=qNZaMoyKCtPFo+qjGwm8DQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] dt-bindings: pinctrl: rockchip: Add RMIO
 controller binding
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	tao.huang@rock-chips.com
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

Hi Ye,

thanks for agreeing on using standard bindings for
RMIO, we are making progress!

On Thu, Jan 8, 2026 at 1:19=E2=80=AFPM Ye Zhang <ye.zhang@rock-chips.com> w=
rote:

> **Regarding the primary IOMUX:**
> However, the RK3506 pinctrl support is built upon the existing
> `pinctrl-rockchip` driver infrastructure, which was originally designed
> around
> the `rockchip,pins` property. Refactoring the driver to support the stand=
ard
> `pinmux` binding (and the suggested nested node structure) is a significa=
nt
> undertaking that involves core logic changes and regression risks for old=
er
> SoCs. Mandating this refactoring as a prerequisite for RK3506 support
> would effectively block this SoC from being supported upstream for a
> long time.
>
> Could we allow RK3506 to follow the existing driver's style for now to
> ensure
> consistency and timely support?

"timely support" is of lesser concern to the kernel and DT
bindings which are more concerned with maintainability and long-term
longevity. The ambition is to work predictably and impersonal, such
as like the planets, or the plants.

> We agree that migrating to standard pinmux
> bindings is the right direction, but we believe it should be handled as a
> separate, dedicated project in the future rather than part of this
> enablement series.
>
> Hi Heiko,
> Do you agree with this?
> 1.        Use standard `pinmux` for RMIO in this series.
> 2.        Keep `rockchip,pins` for the primary IOMUX for now.
> 3.        Plan a future refactoring to migrate the primary IOMUX to
> standard bindings.

My main concern is this:

foo {
    rockchip,pins =3D <...>; // For IOMUX
    pinmux =3D <...>; /// for RMIO
};

I don't want to see this, because that will be *hopeless* to migrate
to both controllers using pinmux =3D <...>; how should you decide
which one to pick for each?

In that case it is better to do:

foo {
    rockchip,pins =3D <...>;
    rmio {
        pinmux =3D <....>;
    };
};

Because then you can later migrate to:

foo {
    iomux {
        pinmux =3D <....>;
    };
    rmio {
        pinmux =3D <...>;
    };
};

Yours,
Linus Walleij

