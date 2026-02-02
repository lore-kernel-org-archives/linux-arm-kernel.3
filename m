Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954DBE7DF11
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 18:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hP28cdxrwSqvRO3deSNeh79vlUUMJieXCHAu3kVx4q4=; b=A7JMG5KYXNmgN/LFEWZ7iF9xB1
	ZIx/pz7bxzOXwICA0sff3QLki30KVncgPqkzGVlJv3uWj//LAkhZZN2Dz7Lpr6q/RQQbDTgK3dDdi
	MRRY0QjJ5XNYXWgndWpc2uKbYNhUP9OXAyiut//BS+Un5YaDNQQ6+0gFTWdEEx8xFw0uM3SMuZbAy
	Nv6wuyHsVshGuaxiEy9VBSdW4lLCrw6szIYz0jJxU7HObGOnqs+wXLCn0sglZkxtwXfJHujOrlJ8e
	+O8ogvsd2uxHMwD2kWBKvqjHw6vCAuxoaHUd9RFxsuotPZ3cbhpH2t9+eHGHxsuLL77ehQrlSw5cQ
	yASnjQwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmyJS-00000005Ork-0wJ5;
	Mon, 02 Feb 2026 18:06:14 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmyJO-00000005Oqr-21Zy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 18:06:12 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-658d4059b79so7065400a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 10:06:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770055567; cv=none;
        d=google.com; s=arc-20240605;
        b=jOPpEpNpSp7GnHxuHk8KisWPR0qwXHKQM04lpeNACItXYKcJR2ibNhX5FOC6yCPL60
         R6kAoVBG6v3mnYTDonPvTFPKc/zn0LgYI69LGTKEZu7S4TyYwLtSI6JzIWgi258ke0Qx
         bVJFp1DoeT5PU/uQxs4/aKn36Tblyn2YF3kaABXKTM5+rr6iM40+09IoXnJclJ1JYFkq
         /QKxNefcZC0J0KZUZ61qRv+IP11HPyy57BM9l7v5OdFIkYsXPEAtsydXL/YURx/pmw6r
         xTquPFsTicPWmMwE9EVwytffvEq6vyIQZHiVADKBFBqZbusbPbM6E1cZXdsEFRbjcgCR
         KDkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hP28cdxrwSqvRO3deSNeh79vlUUMJieXCHAu3kVx4q4=;
        fh=3Nkk2QaJs/z+M1ybxlTrP8f+PkoK6xRnwu9Zcnkwy2I=;
        b=Km6RFSWV5knBZLYE3JxzpLkzEo0DIoNNozuW47nJqVpRw3PpjLmG/V1jlpW5i4NN7I
         e3/hCWT+PJPWkipIVwYLEpbPiKsaJaQJYOM5usitVY8TTJwVeQnbpHJdJD7V9jo7YbLD
         7zj+nhOR2gvg74Np+w7Gk9W2Hy+4WKyJt8sHXtK99E7CKrdgxIhsitcCi+DS/KHNJTpg
         A28Zd/WsAX9X6jkuDqICBv01zdqEgR1iFduW0Bm74tEIozVFhpNkK0K1IZFiN3e+RXam
         q1f9bXL/3neD4D481FtnLK/e538ZjxV66S+IcN/n1BfdPmqLufychamZnGijf2zpWvlp
         2u/w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770055567; x=1770660367; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hP28cdxrwSqvRO3deSNeh79vlUUMJieXCHAu3kVx4q4=;
        b=Viq91pAtTryaKmIlQoqp8G30dutCPW9gQpwIsVHIMi/rJ3s83uwUG7FmiH8VADOZgt
         DuiaYTVGia/9HsjjSla13soTludwUc4I5RkX0p3O/hsx4jGG9JHU0z0q0qru06pYpoJH
         LdIiIoABm6GCpat6ON65J0A035RBaakkheBEvcaQhmwQ2w0ma6bdy9Jq/DstREpy8gbQ
         uqb9sDcCSvMY5ijdKMh3AIMgDegw2gVuvkNltLET3Tk1dn8Iadfb6hPzw0mL51uqkmoY
         uDJ+e6V4SsAPHWNfWr29XzUmCDuCyXSH2wtO7Uy9RKZmpliio/pHVHLAaNBzenQzt3He
         iWrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770055567; x=1770660367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hP28cdxrwSqvRO3deSNeh79vlUUMJieXCHAu3kVx4q4=;
        b=pomfWHSvQxj1eilyLc3SFCuKR8rVsTECGIJBOluM1nBCmwDCQmT0NsoWzW1JvAfLej
         dr2P9F21KECUIBsHFXa1CgHACmxzmplpgqdcLaQ8zyi8CBAHdIqWwMOlium5pv8fUdlQ
         iXG0mGCOJGBZ/roAb8wMLtMCfI9Jr4CYq5meszFem08jkZOvZa3XNr9pazjjDWVhbBAg
         e+DCtu+rTfEqiRDIQ1CTLO4zzyAgKj258pw2e6y9ddxsXityxXCeeCj5Q/vljhUgNUgk
         A4RK7bRhSx538wXAbILVqeBzlfKqKJ+zYSg17aLxfl3G1eQMxtc452CHzWnXW0S/PQNi
         EO+g==
X-Forwarded-Encrypted: i=1; AJvYcCUfX2Zy74DjZ2v9PO383Cw27DMhpTXVO3Mc0nH6aEzkgg/ZpqSZtvi5hM5pMiYY1VR4kZjmKAHEWgbClfU5kpVH@lists.infradead.org
X-Gm-Message-State: AOJu0YwZOyPPklfejiLD/16VEnVsAzKbt7kvlsde3qU0sZ6xNsaJE8vP
	QSgoCAPMBHp8BaZUSaUSmrhtMUlIV9H8hWCmid/Iu0VcSZ+zxvRMPjoRlLTQ9DXODgZ4EnXI4yF
	6MFi18HjQKblobffW7Z+mCrj3irn13Gg=
X-Gm-Gg: AZuq6aLHEUtAEswmTFjoyTIFp9g/45SnAgnTMdrVGUFUIb4/zF7478VeUD7NyRbFXba
	hdVVH2jX0DOUN9Ahutgyndpdmh6eB3cHGd5FOaUXRfcpuu2wBVI/69tuuskJsV9r23aaib4M82n
	ZDefhQvPLnhWr0BrJPs3Nx5rIU1eCEadnpR3S6MnvfryJ8iv8Wg5Na/On0BW+lkm40Tt1Jc/TbM
	46Q0KGNPa4rBt1bMannknTTYQFKbA7Pu8+ZpdCk6LNsoPiROYIuTetcWuYn3pILg68=
X-Received: by 2002:a05:6402:3582:b0:658:bd60:43d0 with SMTP id
 4fb4d7f45d1cf-658de5915d5mr6621282a12.21.1770055567216; Mon, 02 Feb 2026
 10:06:07 -0800 (PST)
MIME-Version: 1.0
References: <20240809073610.2517-1-linux.amoon@gmail.com> <aXtpg0V_sifQEWHJ@grimm-nixos-ssd-2>
 <aXyHITrZ89Mmn8_J@ryzen> <CANAwSgTQ-cdyzd2WjHMYCY33p7um3CpjMeTzRO7vcd0fTF6X9Q@mail.gmail.com>
 <aYB0ctHF1ZeIIzbq@ryzen>
In-Reply-To: <aYB0ctHF1ZeIIzbq@ryzen>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 2 Feb 2026 23:35:48 +0530
X-Gm-Features: AZwV_QhVyDIKKP1nVuDrTcVF0I-NAOiYLCyqmT1Lu3YFL9MwXYNqEXtkEO2A9s8
Message-ID: <CANAwSgSR7AYCvMXSo5UskTF3LJToOnPV9JE4XBAUzrCbWGKD_w@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: dw-rockchip: Enable async probe by default
To: Niklas Cassel <cassel@kernel.org>
Cc: Grimmauld <grimmauld@grimmauld.de>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_100610_677713_06B07493 
X-CRM114-Status: GOOD (  34.67  )
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

Hi Niklas,

On Mon, 2 Feb 2026 at 15:25, Niklas Cassel <cassel@kernel.org> wrote:
>
> On Sat, Jan 31, 2026 at 03:08:42PM +0530, Anand Moon wrote:
> > >
> > I=E2=80=99ve attempted to reproduce the warning but was unable to trigg=
er it locally.
> >
> > I have tested with the built-in module
> > CONFIG_R8169=3Dy
> > CONFIG_R8169_LEDS=3Dy
> >
> > As well as the module
> > CONFIG_R8169=3Dm
> > CONFIG_R8169_LEDS=3Dy
> >
>
> I'm running with:
> CONFIG_R8169=3Dy
> CONFIG_PHYLIB=3Dy
> CONFIG_REALTEK_PHY=3Dy
> CONFIG_REALTEK_PHY_HWMON=3Dy
>
I feel CONFIG_R8169 should not be built into the kernel image.
Since the driver is registered via module_pci_driver(rtl8169_pci_driver),
it is intended to be loaded as a module. In addition, this driver
requires external firmware
during initialization, which could make a built=E2=80=91in configuration pr=
oblematic.
Keeping it modular ensures proper firmware loading and avoids
early=E2=80=91boot failures.

> CONFIG_PCIE_ROCKCHIP_DW=3Dy
> CONFIG_PCIE_ROCKCHIP_DW_HOST=3Dy
> CONFIG_PHY_ROCKCHIP_NANENG_COMBO_PHY=3Dy
> (PHY for the PCIe 2x)
>
> $ cat /proc/cmdline
> root=3D/dev/nfs nfsroot=3D192.168.1.10:/srv/nfs/rootfs_rc,nfsvers=3D4 ip=
=3Ddhcp earlycon rootwait loglevel=3D8
>
> Considering that all PHY drivers (for both Ethernet and PCIe),
> and drivers (for both Ethernet and PCIe) are built as built-in,
> having nfsroot=3D on the kernel command line should be no issue.
>
> But, perhaps that is the reason why you cannot reproduce it?
Thanks for sharing your setup.
>
>
> > >
> > > Having async probing for the Rockchip PCIe controller driver, which i=
s
> > > used a LOT of rockchip based SoCs, is a good thing, so I don't think =
it
> > > is right to avoid enabling async probing just because it results in a
> > > splat on a single rockchip based board (rock5b).
> > >
> > Yes, this could help in the module probe pci module.
> >
> > Earlier, I thought gmac will control the r8169 module, but I was wrong.
> > Could you please try these changes at your end? These changes are
> > related to MIMO..
> >
> > $ git diff ./arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> > b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> > index b3e76ad2d869..fb3a8ba4085a 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> > @@ -477,7 +477,6 @@ &pcie2x1l0 {
> >  &pcie2x1l2 {
> >         pinctrl-names =3D "default";
> >         pinctrl-0 =3D <&pcie2_2_rst>;
> > -       reset-gpios =3D <&gpio3 RK_PB0 GPIO_ACTIVE_HIGH>;
> >         vpcie3v3-supply =3D <&vcc3v3_pcie2x1l2>;
> >         status =3D "okay";
> >  };
> > @@ -535,6 +534,12 @@ pcie3_vcc3v3_en: pcie3-vcc3v3-en {
> >                 };
> >         };
> >
> > +       rtl8211f {
> > +               rtl8211f_0_rst: rtl8211f-0-rst {
> > +                       rockchip,pins =3D <3 RK_PB0 RK_FUNC_GPIO &pcfg_=
pull_none>;
> > +               };
> > +       };
> > +
> >         usb {
> >                 usbc0_int: usbc0-int {
> >                         rockchip,pins =3D <3 RK_PB4 RK_FUNC_GPIO &pcfg_=
pull_none>;
> > @@ -550,6 +555,19 @@ &pwm1 {
> >         status =3D "okay";
> >  };
> >
> > +&mdio0 {
> > +       rgmii_phy0: ethernet-phy@1 {
> > +               /* RTL8211F */
> > +               compatible =3D "ethernet-phy-id001c.c916";
> > +               reg =3D <0x1>;
> > +               pinctrl-names =3D "default";
> > +               pinctrl-0 =3D <&rtl8211f_0_rst>;
> > +               reset-assert-us =3D <20000>;
> > +               reset-deassert-us =3D <100000>;
> > +               reset-gpios =3D <&gpio3 RK_PB0 GPIO_ACTIVE_LOW>;
> > +       };
> > +};
> > +
> >  &rknn_core_0 {
> >         npu-supply =3D <&vdd_npu_s0>;
> >         sram-supply =3D <&vdd_npu_s0>;
> >
>
> I tried your patch above, but I still see the splat.
>
> But as I said, I don't think the splat should be a showstopper.
Thanks for clarifying this issue. I will resubmit once I have
conducted further testing.
>
> Kind regards,
> Niklas

Thanks
-Anand

