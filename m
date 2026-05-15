Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B6ACD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 16:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a4EXCGuqAKLFlT2ch+EyLK8KXtNwop1URIzzeLrAJG0=; b=z7TaC9BJDfTPnB
	oLsmKfBCOD1kS7TuZxt4iOUmi3A6h1ekNY+QhtA/HWDmqRrcEemIWxHEBuF4RX0WtPbbN7C3j8DJV
	s3CgylTLc76Wdz8Fe87H/x2AQxZOxTAZRQZoohMn3UcZBrRdT5wDApNOmuZ3MPOLJmnR/wC6Ssyrn
	0G/+wqcjq2mEHFKKNPxFpK9AKWhOBEoR98eOpRLejp2/eLeeCN171ZggYf89uwGM7kCeEOmtZ1EGs
	/ENBu8sbehylbeEg2eKXHShH+AqGKPX6w7FZuYVrUoaAHrpzRF3MZluoTATEsOsxu0tZt47JfQDTU
	7+If69Er+BCH2rB40b9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNv9O-00000008pbi-2mDv;
	Fri, 15 May 2026 16:12:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNv9N-00000008pbH-0lYh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 16:12:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E4AB84026B
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 16:12:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9202C2BCC7
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 16:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778861552;
	bh=ajfMeNlbacyrJhotvON69vV08gKAAPbB+tQGK/f4yF8=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=lNsiVpgzp/XRQAqxwaKH8NMC9j740bxLutzSLti6/867t9T6oFIX05Traa5lD5Nh+
	 QlCJAfzz796aQqNjkyXOObduMn9RyJ7i1k62pLM+jQXG1O7enPpH6BhoSgW+32+UJ5
	 s6PNasBCryu59ytr6teI9OLO88zIhs5SVmLvmOumTek3x62V/gU5aUeF57E+oJ2IA1
	 rs+9k5mA/O7Bk34GKOARd0wm8SZSKRIXQrUFuANdE5+jvhE4IWOHMyiZsHJOCL6T20
	 /M7G7Y+OKX/TlsM60dkUS1hKzzhfJnrqTsfZjxj0WjeJqnQjz3inzIZCz3jUknFSah
	 74iL8643V8RnA==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38e7d983f91so154481fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 09:12:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+wKP5iA08SFO0P8VL9lMtfBViyzwneE3gyIelsxOBS7biovo0f37a8MFSMGDv5lQaxXAS1hzCet0+Sg5v00X4R@lists.infradead.org
X-Gm-Message-State: AOJu0YxwtfovhD7aGEflDjfxr1J6ZeNaoHnwv0PJn77Qc8OTD+wbqo1W
	j+0TNhFsxT+8M/TIcuPaPG06pTN2mdGM0xF+CVKvnqwp86Y1NHMbVL06aHjuq4+nyf3FYJITm+M
	V4Orkveo2OFVLpOJn0h8gDZgZjUsFIAk=
X-Received: by 2002:a05:651c:1593:b0:394:331:c26d with SMTP id
 38308e7fff4ca-39561c07bf6mr16170691fa.6.1778861551206; Fri, 15 May 2026
 09:12:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260511221741.25888-1-andre.przywara@arm.com>
 <CAGb2v64u4sqwiiQcEBg-XvmJ2DLEpSj-_AWNbp14RAp-GXP7OA@mail.gmail.com> <ee9fca66-d079-4ad7-9cb3-5077e8a4f6d6@arm.com>
In-Reply-To: <ee9fca66-d079-4ad7-9cb3-5077e8a4f6d6@arm.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 16 May 2026 00:12:17 +0800
X-Gmail-Original-Message-ID: <CAGb2v66drOyBgNU0hFo356MKTFnggNmyzrANok+-U31NzZCUEw@mail.gmail.com>
X-Gm-Features: AVHnY4IAiy7whTy9FnGtvfBRFabJs2Ii_3tvaDmPh7Gdax0WMKu2QkVOACnxggs
Message-ID: <CAGb2v66drOyBgNU0hFo356MKTFnggNmyzrANok+-U31NzZCUEw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: Cubie A5E: enable SPI flash
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_091233_262567_FEA959BC 
X-CRM114-Status: GOOD (  29.52  )
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

On Wed, May 13, 2026 at 5:19=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> Hi Chen-Yu,
>
> thanks for chipping in!
>
> On 5/13/26 07:21, Chen-Yu Tsai wrote:
> > Hi,
> >
> > On Tue, May 12, 2026 at 6:18=E2=80=AFAM Andre Przywara <andre.przywara@=
arm.com> wrote:
> >>
> >> The Cubie A5E board comes with 16MiB of SPI NOR flash.
> >>
> >> Enable the SPI0 DT node and describe the configuration.
> >>
> >> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> >> ---
> >>   .../boot/dts/allwinner/sun55i-a527-cubie-a5e.dts  | 15 +++++++++++++=
++
> >>   1 file changed, 15 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b=
/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> >> index bfdf1728cd14b..7ad22fc85d1fd 100644
> >> --- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> >> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> >> @@ -344,6 +344,21 @@ &r_pio {
> >>          vcc-pm-supply =3D <&reg_aldo3>;
> >>   };
> >>
> >> +&spi0  {
> >> +       pinctrl-names =3D "default";
> >> +       pinctrl-0 =3D <&spi0_pc_pins>, <&spi0_cs0_pc_pin>,
> >> +                   <&spi0_hold_pc_pin>, <&spi0_wp_pc_pin>;
> >
> > This whole thing needs to be an overlay. The HOLD and WP pins
> > conflict with eMMC usage, so it seems that Radxa only populates
> > one or the other.
> >
> > If you look at the pictures on their official website, you'll see the
> > SPI NOR chip populated, but not the eMMC chip. On the linux-sunxi wiki
> > page, you'll see the opposite.
>
> Well, I have a hard time spotting any actual eMMC SKUs in the shops anywa=
y.
> But you are right, the hold and WP pins conflict with eMMC, whereas the
> other pins are not.
>
> > And you probably want to enable QSPI, like Sashiko mentioned.
>
> Well, in the interest of keeping this simple and enabling the usage of
> SPI flash for all the users out there, I'd rather drop the extra pins.
> This is mostly really useful for booting the firmware, maybe loading a
> tiny kernel or other data once, so performance is not a big concern in
> this use case. The BootROM surely does not use QSPI.

Given that the pins are tied on physically, if someone then enables mmc2
for a potentially present eMMC, the two pins could be toggled by the
MMC controller, causing the flash to misbehave. I'm slightly concerned
about this possibility.


ChenYu

> And as you say, if people are really interested in the last bit of
> performance, they can use an overlay.
>
> Cheers,
> Andre
>
> >
> >
> > ChenYu
> >
> >
> >> +       status =3D "okay";
> >> +
> >> +       flash@0 {
> >> +               compatible =3D "winbond,w25q128", "jedec,spi-nor";
> >> +               reg =3D <0>;
> >> +               spi-max-frequency =3D <40000000>;
> >> +               #address-cells =3D <1>;
> >> +               #size-cells =3D <1>;
> >> +       };
> >> +};
> >> +
> >>   &uart0 {
> >>          pinctrl-names =3D "default";
> >>          pinctrl-0 =3D <&uart0_pb_pins>;
> >> --
> >> 2.46.4
> >>
> >
>

