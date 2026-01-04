Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB04C2A074
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Jan 2026 11:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B7wtThxuIrxI34G/qu3Mne57Lsg6mbZY3DRvshd8Nng=; b=nq1SUXieeP5Qtct9AOpwxz+lr3
	mOsF8i6edlyrFMAdfUJW/eiGsvkHtwqiK5wBEHJ6IgA2wOoNW+h7OJ6VdgK1ym9muIwkAQafSdz4t
	hGnzp5jYS0VTrHZ7QOesHSn4UaZP+FgsRSK/A14BlvNsf/0SUfkq0HYAQvS6+KZ8OstFP+X0bOoyk
	z8H1TD6Dxq+eRJCWoHmk45CKEXyccHquev3zjjlqCJSGJnPL/JT8vBLa2qB5cvgeHyFenL7pZg9Qj
	0jJg5IqfD/u+bP1D4aquqmS4U3LR31H+N4iQhE9AZwNlff+yLxYgVitlB0hMhOVDMPCCRChk+DL0Q
	svjvKg9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcMXg-0000000ACTV-17wZ;
	Sun, 04 Jan 2026 11:45:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcMXd-0000000ACSc-1YhC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Jan 2026 11:45:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 61C56440A2
	for <linux-arm-kernel@lists.infradead.org>; Sun,  4 Jan 2026 11:44:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44571C4AF0C
	for <linux-arm-kernel@lists.infradead.org>; Sun,  4 Jan 2026 11:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767527099;
	bh=UJmd/RUuc8kvXGdj1yLXTt0tcEL4280vqD8fV3f882w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Cg7UMARt7QUJwPWBD9T+bOjhUn6d/+c+hNn0FR+uMbWvqrb7/n9MLts7caS49DJkF
	 OQah1x368eMjg5W21HTv1Ef9+DHSCbLVYph3jX6D5lkWKi5qT4fdSbErocHRthZJz4
	 X06hftKfXtkkAz3/BIX0Ageje0ZQh6EmSGQ8FL9SCO2gSJo6eayH+9jHUK5fyOPE3/
	 JQk1DnogBQ8uEQB2oUv0I32CBnpuwQw/+JBp3+sZmIrKbQRVJjNIdCT8AIGiNVMlnH
	 7Mj/NT/NQEk6FHxkB2CTf5aXKmCrSNgaHwOjhqUdwlJak51zZDPkT77xXzn3LLYT20
	 lgdyEfkCD4AcQ==
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6466d8fd383so10649542d50.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Jan 2026 03:44:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXYzZP26DKJGGQOhCHNB4jbyI0FRoaGqznHNpZQ99iwY8jI0fFqnv8J614Jo1mRFnnNzb/DKWxIxU3hpsew9kp3@lists.infradead.org
X-Gm-Message-State: AOJu0YxO4Vt8roECljgE/sL/a80k5jAgYTVocIX/R/h+Emr22650P4LH
	wOluX/tN7/hgdKDW0kz8DOMXOZR+IaraYmacEyAxVD/EYxXbfeyfdcrPYKaLLsMwZ+Kx0WFEDbA
	iy4S7xdbsDsuCuurD1LDQta8vPT7h4YI=
X-Google-Smtp-Source: AGHT+IEg3DaZt0YbBBc1tGezgqWn4TsJbUX2OEwOcSIQLrbHB84o22MN0yY/1FtAcAVCX+iV8p02b8Dygwa19reZFf0=
X-Received: by 2002:a53:b163:0:b0:640:d174:3839 with SMTP id
 956f58d0204a3-6466a8a66d9mr27719698d50.36.1767527098556; Sun, 04 Jan 2026
 03:44:58 -0800 (PST)
MIME-Version: 1.0
References: <20251216112053.1927852-1-ye.zhang@rock-chips.com>
 <20251216112053.1927852-7-ye.zhang@rock-chips.com> <CAD++jLntu4LY=VHOMSXeLKXOBD9MTNziv47B0qkDjxUa1xAsng@mail.gmail.com>
 <85032ae4-4d82-4884-aa7c-b69fee76d509@rock-chips.com>
In-Reply-To: <85032ae4-4d82-4884-aa7c-b69fee76d509@rock-chips.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 4 Jan 2026 12:44:47 +0100
X-Gmail-Original-Message-ID: <CAD++jLnH2vLNxTLj8Lw8RnOHxfitwi3G_8WCBtu+_=XL3ryH_w@mail.gmail.com>
X-Gm-Features: AQt7F2rYL5D4zs_GjxYPSmiyYP8LYXnbe2QAtqp2dHlaiukECPzoU61iv3jhlis
Message-ID: <CAD++jLnH2vLNxTLj8Lw8RnOHxfitwi3G_8WCBtu+_=XL3ryH_w@mail.gmail.com>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_034501_453795_71A404F8 
X-CRM114-Status: GOOD (  18.92  )
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

On Sat, Dec 27, 2025 at 3:46=E2=80=AFAM Ye Zhang <ye.zhang@rock-chips.com> =
wrote:

> I understand your preference for standard bindings.  However, there is a
> specific constraint here: the RMIO acts as a secondary layer of muxing,
> sitting behind the primary IOMUX controller.
>
> The existing Rockchip pinctrl binding uses the vendor-specific
> rockchip,pins property for the primary IOMUX configuration.  If I were
> to use the standard pinmux property for RMIO, the node would contain
> mixed bindings like this:
>
> node {
>      /* Primary IOMUX (existing binding) */
>      rockchip,pins =3D <1 RK_PB1 16 &pcfg_pull_none>;
>      /* Secondary RMIO  */
>      pinmux =3D <(RMIO_ID << 16) | (RMIO_PIN << 8) | RMIO_FUNC>;
> };
>
> Since this node describes a single hardware pin configuration that
> requires two separate hardware settings (Primary Mux + Secondary RMIO),
> I thought keeping the secondary config as a vendor-specific property
> (rockchip,rmio) alongside rockchip,pins would be more consistent and
> less confusing than mixing legacy custom bindings with standard pinmux.

I see the concern but I would say two wrongs doesn't make one right.

The DT binding people will have to say what to do here, but ideally
I would say the primary IOMUX should be modified to *also* *additionally*
support the standard bindings and deprecating the old rockchip,pins,
and then you can consistently use the pinmux=3D<>; binding in new
trees for both pinmuxes.

I understand that maybe you are only working on this other controller
and might feel that the primary IOMUX is none of your concern,
but someone has to stand up and take the responsibility for the system
as a whole, if no-one else then the Rockchip SoC maintainer, else
we get throw-over-the-wall-engineering.

Yours,
Linus Walleij

