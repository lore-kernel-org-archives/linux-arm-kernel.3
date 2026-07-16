Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D21C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 09:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D5AXjA9Tcy5dG64KZLElqY/MzuwlW4GyobQ/vNPe094=; b=wg90TclP1y5C0gUS7x+QqlZaCY
	WU9RQcgv6lMfn+xxDXSecp8tj97zXPH2bWBriowT0HF7XcJhk7GSNusTNIFuHmYByAYad/Ix0sa+M
	C69rinKheKwhJDEJ/YGY5MYLib1hXYHlJe3tuNq4FkmD/D9ya1+4e9L52VdWBnv0t28EWIbey77aN
	jHWyUo5+WJDebb/wZOCT+OJWWOz6CO8EB1ruTLBaq1/q8HlVwYqeVDPK7D4I/q6oqIL8IDBc63Fxm
	7vCRN8RDjMqgwT+FI9t6K/jkL7G5/ePvrgz7LChYyDlGx4FGAi99JqVpeN4U774puRrfwTzBVR531
	G2Hxaxsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIKZ-0000000GqyQ-1tCZ;
	Thu, 16 Jul 2026 09:24:35 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIKW-0000000GqxW-3iVo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 09:24:34 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-848882fdb18so3284753b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 02:24:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784193872; cv=none;
        d=google.com; s=arc-20260327;
        b=TYReVOZERXaQPEevt4qF69zeOpvRE9bTnvq48Xs4reMRJqkrdITuzUnk2mleiK3x9r
         Pmcy69PT/63UfQyRyAfTUXQ49Z2Mp27C9UMrnYvnmKseHhfAntXiH1U8ygBatrzKLE0P
         jXW+t8Canxc5Qglyl4onMih49X9/0E7PZMFktFj6XDK0eyhRwWbShczR5nDHX7JCsO/s
         RE+7FZMBeMBwe9MN4qdQJL5zzxB4p/os4eklLHEHjCyW759iH+xU3dxA2SOuUa9PMNur
         sRxMmyCFTJuNGLpKOKLkeSzrLwYyTxS5F6UHUbkCT0yrVNEMm/scb+VWUHPIEe+vfpzi
         ivCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D5AXjA9Tcy5dG64KZLElqY/MzuwlW4GyobQ/vNPe094=;
        fh=nVuhWUz735NxdrowA7XdLbgtUJSzxIOOvmD2hmKENIw=;
        b=UAc25BD7YkH2FYXIloEEFPprqSnguutu1BVBH8qIBB7HRMYL/fYstPT0SzC9n4ZIUO
         lCkjTuz4JxjxdynKFrLUzjuw2lRPNjZIDme6kpIaV5xg4ZHO1b9zFf2ViXwiHka0gzun
         Hx6RX1Zjhb3kuyn75wtHlc/qiV8hsZRP4LkXuO2VOaNOJFOPgacUQHforE5dT8oBgJoJ
         xDWDwbQ2qX6DsGSbQdovZZxkiHlulLD6l9C08W4x1PQcQGvBs8AO7Eiej7kxM0MLrVAl
         ER9yq8bgBnVDyrK7vrr8OiAhcNDshqByYbaywOB1hqggu/B8YXdYnFX+JxhmIcanlSTT
         7KKw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784193872; x=1784798672; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D5AXjA9Tcy5dG64KZLElqY/MzuwlW4GyobQ/vNPe094=;
        b=TQ+SWxfvv/D+8UZKHloSrncTRRyNdw2TXKWN9bKh5WC0LEg4lxrWo57q1RASAPgWxD
         DOrmXOEJU7TzErUOSuPkuuC3Lyk3MH66kp8xrqcc0I4tw/ggChQF0benGNBZRUZ1R+73
         KAvIAF/V19Dd5QyXcV8i8H8iPy2/+ufctkNZmk9jLfugR1YTfHc5jjd52ZnCiiPndgyJ
         bY1Dwt8SrLq1WJs6C3xzADQB7cfms4xloxM0w0TzotCRSBDtJEbG3/5DY7wjZ4+F/V55
         3f9IDCplltGTr+74bE1kfjsNZ5F++oGdfAHI1iF/5XrSwd3yMpYxl3Cu7u88n8c7A6C6
         9FfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784193872; x=1784798672;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D5AXjA9Tcy5dG64KZLElqY/MzuwlW4GyobQ/vNPe094=;
        b=TXaKuwJw12tJhK875/1zpjjGZ3WH7N7hraIJZSoaQPbvKrNQI0DrvG92nLZzxQdGrK
         BMcOwzMY4oa+gsWJ8kiyGbi+MgZWzeMBPACDi9LBZGiqW3GHC+JRae+gLban2sGijHyR
         hmE9d6mkQSnRXeqLSloLzzPdGxZArg2gFfVq5D7ASWrOMbSMa4FvK5bkCugsx5iXglGF
         WVKyvVAyJe6mqD/XgZbb4PdtUT3mZ4ta8QRiZISDA4DIDQxc2JAdPtGJPF2aUUXR2Khe
         K8DJRBO903M0yannVOCdrYcp0xUPyjI7sWleoMNbV6hzU69JWNBmm6MdwL9La+MzrMxV
         c0vA==
X-Forwarded-Encrypted: i=1; AHgh+RqQRHXp0qoXqR3jEpcdjGw9Z0V0jkbj4fnfGV/SQOtS1kX3/ix7zxGMzj7vallKNqbh04ARI/+Yfyz2E7JKwLBJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwZ/HB5e0csDNtIScHZ/piIx2T1efN01beDDnmg9c9lQLDydv6z
	2/5sna/mzvU+7U426F+1a/uLfd9UQ2bA2Zl0tMKI6OvBOEOgK5zKK8TIk4kq3AHh3GUzpQEYnAK
	9qDsxmIiSnrQ3OtSf2ce3Ul+V4EUUz3s=
X-Gm-Gg: AfdE7cnQngUvYywT0d6GdZWIOQirKLkU074vmgtHjFmxYTV1LCWkgk9XmPqLs6fapDG
	8AGB4PZ7K2OV5Z1cDsnalXVgQGwdJIf2EngcCxX1YPjxBvCotCVPXtWO8TVIxcTz0cNRFhhuhbE
	PZmAsNS0jeXlF//njMi/j/lPgxBDxsAWx7/nQinZfo9w7eMfNHGHNP/QKKMBjl/fZF0/jp93YMR
	nKe/xNZQr3f6pXMLDDgixS/5hUrvirqjMGcAA84y7iUfdt3un5hT+8skwCcjiElWT7UIduAusq/
	2UoUQF6tna+55QQmYq49NqbqIf/LbCoji2kyxhQJqvk=
X-Received: by 2002:a05:6a00:f08:b0:847:8504:9946 with SMTP id
 d2e1a72fcca58-84a6726b83dmr5832591b3a.25.1784193872009; Thu, 16 Jul 2026
 02:24:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260713-nanopi-m6-v3-0-227567ffc5dc@gmail.com>
 <20260713-nanopi-m6-v3-11-227567ffc5dc@gmail.com> <20260713204131.C58091F000E9@smtp.kernel.org>
In-Reply-To: <20260713204131.C58091F000E9@smtp.kernel.org>
From: Joachim Eastwood <joachim.eastwood@gmail.com>
Date: Thu, 16 Jul 2026 11:24:20 +0200
X-Gm-Features: AUfX_myLtG8XdKEHnucqiDRzCNz_tCXXHKJzmB4U4Ch-HDmXpuQEg3jOwAHCgo8
Message-ID: <CAPSPb=v=ZDGJ41auxGgSOpKo69MycE=FtMyHf9sG9a3ju9PAaQ@mail.gmail.com>
Subject: Re: [PATCH v3 11/12] arm64: dts: rockchip: rk3588s-nanopi-r6:
 refactor to support M6 boards
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, 
	Diederik de Haas <diederik@cknow-tech.com>, Jonas Karlman <jonas@kwiboo.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_022432_933715_86A72772 
X-CRM114-Status: GOOD (  20.62  )
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

Hi,

On Mon, 13 Jul 2026 at 22:41, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] Unintentional restoration of `regulator-boot-on` for `vdd_npu_=
s0` during refactoring.
> - [Low] Dangling phandle reference `&vcc5v0_usb_otg0` in the common `.dts=
i` file.
> --
>
> --- Patch [11]: [PATCH v3 11/12] arm64: dts: rockchip: rk3588s-nanopi-r6:=
 refactor to support M6 boards ---
> commit 056adff75ec08989b96f09adc0efff6c3a5d662f
> Author: Joachim Eastwood <joachim.eastwood@gmail.com>
>
> arm64: dts: rockchip: rk3588s-nanopi-r6: refactor to support M6 boards
>
> FriendlyElec NanoPi6 series consists of four distinct boards; R6S, R6C,
> M6 and M6V2. Refactor FriendlyElec NanoPi R6 base dtsi in preparation
> for adding NanoPi M6 support.
>
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/ar=
m64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> > new file mode 100644
> > index 0000000000000..a8e532ad8b7a8
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
>
> [ ... ]
>
> > +&i2c2 {
> > +     status =3D "okay";
> > +
> > +     vdd_npu_s0: regulator@42 {
> > +             compatible =3D "rockchip,rk8602";
> > +             reg =3D <0x42>;
> > +             fcs,suspend-voltage-selector =3D <1>;
> > +             regulator-name =3D "vdd_npu_s0";
> > +             regulator-min-microvolt =3D <550000>;
> > +             regulator-max-microvolt =3D <950000>;
> > +             regulator-ramp-delay =3D <2300>;
> > +             regulator-boot-on;
>
> [Severity: Medium]
> Is the addition of regulator-boot-on here intentional?

Seems like I screwed up the refactoring of the code, and Sashiko caught me.
I will fix it and send out a new patch set later.

> This appears to accidentally revert a prior fix that removed the boot-on
> property for vdd_npu_s0 to save power during early boot.
>
> > +             vin-supply =3D <&vcc5v0_sys>;
> > +
> > +             regulator-state-mem {
> > +                     regulator-off-in-suspend;
> > +             };
> > +     };
> > +};
>
> [ ... ]
>
> > +&u2phy0_otg {
> > +     phy-supply =3D <&vcc5v0_usb_otg0>;
>
> [Severity: Low]
> Does this create a dangling phandle reference in the common dtsi file?
>
> Since the vcc5v0_usb_otg0 regulator was left in the board-specific
> rk3588s-nanopi-r6.dtsi file, it looks like compiling a new board (like th=
e M6)
> that includes this common dtsi will fail to build if it doesn't also defi=
ne a
> regulator with this exact label.

I don't think this is really an issue. Both nanopi-r6.dtsi and nanopi-m6.dt=
si
will have those regulators defined.

Unless someone tells me this is bad practice I will keep this as it is.


best regards,
Joachim Eastwood

> > +     status =3D "okay";
> > +};
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713-nanopi-m=
6-v3-0-227567ffc5dc@gmail.com?part=3D11

