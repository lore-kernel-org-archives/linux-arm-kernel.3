Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A34CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 06:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=34s2Mll4HzW2HPp7Os9sQvlGHWO63oFARqHF3SVEuHE=; b=XvjK07zhfb75ZN
	kfT+qrxQRmfhgTh/mvKS1ffcUOlXWbAr9hzRda0HMdZ5bVx3fbWFZpsHjfETYyib+kEHcP8cdoJX/
	qybXpc8fhxB+f9Vt924P8vUcEVygR6EQFbRWMwACN06WRnIuB6yPJG76UrAoZMVxZrYpcj/fGJV+D
	judXq/GuSVc9sDxa9Bmk+LXKagTHidxeInLKrp65JAjGm4Jec+jYXNndzhw4EfLl64LBtUHgy4FnC
	dVYwkDopSq/LvjrdZKe1tRqyB2MTiYLLjHul+rsf8jgnfocu+XlJsyCABk8YoUwh08stLwTS0/AAh
	kplXt95puUwbH0Vg1BUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO8Fk-0000000AFVm-2yPo;
	Sat, 16 May 2026 06:12:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO8Fi-0000000AFVC-3kfK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 06:12:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D665344484
	for <linux-arm-kernel@lists.infradead.org>; Sat, 16 May 2026 06:11:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7E8DC2BCB7
	for <linux-arm-kernel@lists.infradead.org>; Sat, 16 May 2026 06:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778911917;
	bh=m8zHdqHB9qoOb8ZczozE6BpuIl3ezBnhCyalX5zcN7g=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=iGigTyEgF37MpZsfozbubez7CVe4rUBHolYZ96FNCTLC/Cy7RBUP7RYt45zXs0kFk
	 V9MWnzl9ipefOjZu0Ac1E8DOoKNt3xZaJCKkqJfZKqoxhvOH+LqUm78qChT+OBqxrc
	 +/1GpDI6dFDn6kE8dUpIUOvWoPVQUxhYfd1/jO6MXz/itbDBXEWPVJSlRLyt0RqB2D
	 nijCXZraaoQn+W2hnkL+5fRr2ZuaN5CKeAakFNXUF9QpRLQBcIIdfDXQkvNUvLWWOk
	 F3wC0aYIg50suUq8WkGP3zJdVm7ad1y23IVWa4EPHJNYL62l+VmFE/+7WT/071bzj8
	 YjD+oSyWECjqg==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38e800deae4so6817201fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 23:11:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8XgoUKk/m3SbExneWsdNBJiBVdZv02lgbkDjMlTswLVb2sk1cXKSUn+2itNN8gK1Yw0uhme97Q7Nl8h84ow5Mj@lists.infradead.org
X-Gm-Message-State: AOJu0YxbAFXQByKzcenXA7isuWKUNkUYLds9FX2piZHQLYOBvMrTOC00
	OOsZPUVZH71kOZv3gDmpEFbobsfjnPsH1na3QJipDwvjRHfQhF0GLeoyVpXWzXEux0wzTfbcuyT
	vCE4Dwq6gxTrMJbnJobM+cdv8PoagyMY=
X-Received: by 2002:a05:651c:4188:b0:385:dde5:1bf3 with SMTP id
 38308e7fff4ca-39561adf7damr18828581fa.6.1778911916095; Fri, 15 May 2026
 23:11:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260511221741.25888-1-andre.przywara@arm.com>
 <CAGb2v64u4sqwiiQcEBg-XvmJ2DLEpSj-_AWNbp14RAp-GXP7OA@mail.gmail.com>
 <ee9fca66-d079-4ad7-9cb3-5077e8a4f6d6@arm.com> <CAGb2v66drOyBgNU0hFo356MKTFnggNmyzrANok+-U31NzZCUEw@mail.gmail.com>
 <20260515235112.3d2a0c5e@ryzen.lan>
In-Reply-To: <20260515235112.3d2a0c5e@ryzen.lan>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 16 May 2026 14:11:52 +0800
X-Gmail-Original-Message-ID: <CAGb2v67ZyUTfKK21-H5duAA0xNoHCQOUKN=WYtbN7fqWaqyE4g@mail.gmail.com>
X-Gm-Features: AVHnY4IeD7gLniZO5qjqEwQ99zb5tdOVe4q7o-In43rzrp6IN3-fWSvLkRMCMZU
Message-ID: <CAGb2v67ZyUTfKK21-H5duAA0xNoHCQOUKN=WYtbN7fqWaqyE4g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: Cubie A5E: enable SPI flash
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_231158_979054_71E6B66D 
X-CRM114-Status: GOOD (  43.39  )
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

On Sat, May 16, 2026 at 5:52=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> On Sat, 16 May 2026 00:12:17 +0800
> Chen-Yu Tsai <wens@kernel.org> wrote:
>
> > On Wed, May 13, 2026 at 5:19=E2=80=AFPM Andre Przywara <andre.przywara@=
arm.com> wrote:
> > >
> > > Hi Chen-Yu,
> > >
> > > thanks for chipping in!
> > >
> > > On 5/13/26 07:21, Chen-Yu Tsai wrote:
> > > > Hi,
> > > >
> > > > On Tue, May 12, 2026 at 6:18=E2=80=AFAM Andre Przywara <andre.przyw=
ara@arm.com> wrote:
> > > >>
> > > >> The Cubie A5E board comes with 16MiB of SPI NOR flash.
> > > >>
> > > >> Enable the SPI0 DT node and describe the configuration.
> > > >>
> > > >> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > >> ---
> > > >>   .../boot/dts/allwinner/sun55i-a527-cubie-a5e.dts  | 15 +++++++++=
++++++
> > > >>   1 file changed, 15 insertions(+)
> > > >>
> > > >> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.d=
ts b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> > > >> index bfdf1728cd14b..7ad22fc85d1fd 100644
> > > >> --- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> > > >> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> > > >> @@ -344,6 +344,21 @@ &r_pio {
> > > >>          vcc-pm-supply =3D <&reg_aldo3>;
> > > >>   };
> > > >>
> > > >> +&spi0  {
> > > >> +       pinctrl-names =3D "default";
> > > >> +       pinctrl-0 =3D <&spi0_pc_pins>, <&spi0_cs0_pc_pin>,
> > > >> +                   <&spi0_hold_pc_pin>, <&spi0_wp_pc_pin>;
> > > >
> > > > This whole thing needs to be an overlay. The HOLD and WP pins
> > > > conflict with eMMC usage, so it seems that Radxa only populates
> > > > one or the other.
> > > >
> > > > If you look at the pictures on their official website, you'll see t=
he
> > > > SPI NOR chip populated, but not the eMMC chip. On the linux-sunxi w=
iki
> > > > page, you'll see the opposite.
> > >
> > > Well, I have a hard time spotting any actual eMMC SKUs in the shops a=
nyway.
> > > But you are right, the hold and WP pins conflict with eMMC, whereas t=
he
> > > other pins are not.
> > >
> > > > And you probably want to enable QSPI, like Sashiko mentioned.
> > >
> > > Well, in the interest of keeping this simple and enabling the usage o=
f
> > > SPI flash for all the users out there, I'd rather drop the extra pins=
.
> > > This is mostly really useful for booting the firmware, maybe loading =
a
> > > tiny kernel or other data once, so performance is not a big concern i=
n
> > > this use case. The BootROM surely does not use QSPI.
> >
> > Given that the pins are tied on physically, if someone then enables mmc=
2
> > for a potentially present eMMC, the two pins could be toggled by the
> > MMC controller, causing the flash to misbehave. I'm slightly concerned
> > about this possibility.
>
> That's a good point, but that means it's really a hardware design
> issue: you cannot have SPI together with eMMC on this board.
>
> I don't know if Radxa ships the eMMC SKUs without SPI flash, I
> will try to query Tom Cubie about this.
>
> I would prefer to go with SPI flash, at least for now: I think that's
> what most users have, and the eMMC versions are rare so far? Since we
> don't have an eMMC node in the DT anyway, that should be fine for now.
> If someone adds eMMC support later, we would need to figure this out.
> We could mark one as disabled, and leave it up to users (or U-Boot)
> to decide which to enable.
> On the H6 there is a similar problem: PC5 is both SPI0_CS and MMC2_CMD,
> so on the PineH64 we disable the SPI flash, in favour of eMMC, which is
> more useful for users (but sunxi-fel SPI access and U-Boot SPI loading
> work nevertheless). But given the apparent prevalence of SPI boards vs.
> those with eMMC for the Cubie A5E, I would go with SPI on this one.
>
> Does that make sense? Any thoughts?

In that case it might be better to enable it with full QSPI. The pin
conflicts can also serve as a lockout against enabling both. Just need
to document it properly.


ChenYu

> Cheers,
> Andre
>
> > > And as you say, if people are really interested in the last bit of
> > > performance, they can use an overlay.
> > >
> > > Cheers,
> > > Andre
> > >
> > > >
> > > >
> > > > ChenYu
> > > >
> > > >
> > > >> +       status =3D "okay";
> > > >> +
> > > >> +       flash@0 {
> > > >> +               compatible =3D "winbond,w25q128", "jedec,spi-nor";
> > > >> +               reg =3D <0>;
> > > >> +               spi-max-frequency =3D <40000000>;
> > > >> +               #address-cells =3D <1>;
> > > >> +               #size-cells =3D <1>;
> > > >> +       };
> > > >> +};
> > > >> +
> > > >>   &uart0 {
> > > >>          pinctrl-names =3D "default";
> > > >>          pinctrl-0 =3D <&uart0_pb_pins>;
> > > >> --
> > > >> 2.46.4
> > > >>
> > > >
> > >
> >
>

