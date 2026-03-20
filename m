Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F9E108B8EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 10:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Of1GTO29+yjjKMoSpTK0dYyRr27IYqJgiYG8Z21ueZY=; b=Ji70OjRzWHMx/etFLNbWN9GhUy
	NWub+MJNBmr2tl8/q9+a6UoHbdIh5bQp0fHKe+9Muj5kuChGeD7idbhiCzoXOblaX6TrZ5QnWHkIY
	VoIYMBtP1FgHY2Kno0HPXnmDPVPTHocgu9ErgvIC/YE1zRpfD8tqCSWAVp9vMiU3ehjP+DEL6dI+k
	R6KFEtUKT8g0pxe+JhOxIAAyevdczi1f6LayMPEOMc+HTIuw+R6cj9ky+FjSVDj6ynoG7pQ31Sf+T
	LvOHw7ZAJtM5NHNhZiDGr/AxBl5RaamWilRBiZ+3KfReILWg83ALGsEyORCmRBMjiyxw1+7hoa2Wn
	9BQnsu5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3X4O-0000000Cb8w-1d9d;
	Fri, 20 Mar 2026 10:27:08 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3X4L-0000000Cb88-2WLH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 10:27:06 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b886fc047d5so308314566b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 03:27:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774002423; cv=none;
        d=google.com; s=arc-20240605;
        b=APzcMSdQctFHWWc65yubADxYTcaokgaTAJFepflN7V+enb8ayZHEfL+kA2B2vWgflD
         PWNoF8VnoauXJL0fCD7lemtjNsWJMYui5CNUGAo4pTLXdhgpUxOYeizgmWYJJvUbGwwt
         T7nNQYURPhM4ur2wKIGsGX5O9lm+NvEm2EuxOmjOW04FqvXaav/+v72iGrbzcebSls6Z
         x8g3jNdvhwRfWekRCVe4tpXvTZ1qUc5ik1ETDUoHaiNKNbTyH5PDbmuzTIK8syyugZbZ
         qtdCHDmQzwfxnSdjy8quO8FUiNbeUwOBd+O3H9gq6TpXDqtrRymSSKA9tkEFXcVFUU14
         5YJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Of1GTO29+yjjKMoSpTK0dYyRr27IYqJgiYG8Z21ueZY=;
        fh=zvoLoU1DgcO48zagFAnxOn5VVZ3r1UgkNSssLUDs4sg=;
        b=DoyGcV9yh23JHCT5VpeNs2NT+yr3niIhWe7vkQSLDUoqBlIBJe2TSqRtKw1AkfElbW
         1/i6J/M7syraGGJwaQRTQay4koVrZU+IxsUjRm0I+gZLZtmPICJoUc1bgJbGFeG8yG8H
         1Jo4yNxSBK+IgX4YFEI29JmSb1yEaM6S8J7lrGlsieDto4UAE3oTqDij5vzLKUPvFbmw
         +QasY2Qm7fXZQkrqLZ7hqFr87OfvtYZ54rOjnVG8F8NrKc7HFDGWS5Cdn0Hm49riTwwb
         B7Dsz7DXibVTM6HRtVtpO8m9FKg45mAY1N+cAsq6VWQ6tDt+/I/PgTnLpoXI29QH4VvR
         re3g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774002423; x=1774607223; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Of1GTO29+yjjKMoSpTK0dYyRr27IYqJgiYG8Z21ueZY=;
        b=ftaRdp1KR2+vSB83oxVj+doIy/9galtfQprQR5hyRVBhEgmKGokrx2sfdaZK1I4z3n
         fAjws9dzq+NIq7z8SYpghYWUIG346IDNFxkuoWc1eD+mAaxCTs4x/g/w57dqwYB41fTB
         C7FV9icRNS06AKML/GVcpzYoGCeWlv9oNh20bs9X5qoAAgfXsgmi+6/QNfWPoDmxknu4
         p8tKtQxqJSEIYsCWqOWZDwYXhNDcHrAWADoi274wMNRB44XfESnp4DrdFT9OndBWO8DR
         yTw3DXY0CL6OSPVb9DsO6Jx1nBXVNOmvFtZmHXrVDk1ihEJ1XL3NJijqfU5BRXbW82uL
         //6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774002423; x=1774607223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Of1GTO29+yjjKMoSpTK0dYyRr27IYqJgiYG8Z21ueZY=;
        b=Tb4WDlpUxBckeGJxk0/Q+0kw95ydzy2E3FN02VAw6d9PoO0K/uObxyrfwpcRZy7eY5
         NAiY/kgYrPIogwQ0bP+hFh8Pbs7PhwcVQzFMIzm51YHdXjDJfk96vOKsiU8FjaZWbNHm
         nY2FS699WH20KhddmvRhSOaxLFSSGVNRHvhUar2k6BjrG7t+WLMFp+q40n3sMeCwaQwC
         d2j/002Vci360huAA31NZGbrKjMX/xxuhDsNmhBwDdJ5cOBmRnEWzWI+nf80da82ySHG
         KPv3i7bMBJa++SfaKBUsFZauuKADrJMa/1vTERUt8qXoUqlywUpvrWoqKO0Faof7JS0K
         VSrg==
X-Forwarded-Encrypted: i=1; AJvYcCXGNXTkVVVrPB4eRaY31Ntxje0UMExemgiTpOcT3VUbCfSRI0relbTr5kqksbPtElyADIVzO8Iy16ibT7wFrhVV@lists.infradead.org
X-Gm-Message-State: AOJu0Yyd6N83M4Wp2Jl/I/XhRTuo7f5ANWik1ILaUgjKAMPJs5Ddo5FQ
	gSgTKS6tK4zXhRoSG17ANwQ3D0yqjjIAh/96R1sJuB1gNkjyLk6dSND1qTbl8MpoN7+zbz9zLBU
	KbGA74djI6ZdWtq0YPe2DsFRfveagRzA=
X-Gm-Gg: ATEYQzwJ32mFDKqLtwO0yX8ySfWZ9fRclQkq/0DbPHueBmJR7ElAroGSdRUSSZLzMdE
	f2eNItVEPauQp8fFvx7NpBPMTwMyyLhGcvIcFK26Poup2nq6ufqcXtnHZRWWEAVYc8S/WoUlebr
	O9KWpAPE0Vjix6wmDG7JY1TaGtc5xkzHshKmGmUmn1XxtiA/w/HfftsCnlPHTKI3IFbsWbDVJGz
	BIYuZhHtFdRNXyMd6akYG8NBkr1y+j1XxPQpBvbGvR5Q6io85Z+WNHDUnQnxeUK7o264hqgC5HL
	2n0Qh7c=
X-Received: by 2002:a17:906:2746:b0:b83:95c8:15d0 with SMTP id
 a640c23a62f3a-b982f4eca0fmr137601766b.52.1774002422707; Fri, 20 Mar 2026
 03:27:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260304132957.684616-1-midgy971@gmail.com> <20260319145120.99833-1-midgy971@gmail.com>
 <2053182.usQuhbGJ8B@phil>
In-Reply-To: <2053182.usQuhbGJ8B@phil>
From: Midgy Balon <midgy971@gmail.com>
Date: Fri, 20 Mar 2026 11:28:30 +0100
X-Gm-Features: AaiRm50aoIyNWdgdoBKg1CMZ-LC4yDu8KW38iE0PNSuQDdq7oh2keNG7d0JnC3k
Message-ID: <CA+GS1Y0CZA1sbLhoz5LM-dFCCRuWQOr-bYQUVGV4uotKUmy96A@mail.gmail.com>
Subject: Re: [PATCH v4] arm64: dts: rockchip: rock-3b: Model PI6C20100 as gated-fixed-clock
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, shawn.lin@rock-chips.com, 
	jonas@kwiboo.se, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_032705_666644_3E43510A 
X-CRM114-Status: GOOD (  29.81  )
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

Hello Heiko
  > Sorry for having to bring up the process again,
  but the patch
  > author should match the Signed-off-by line.

  Apologies for the inconsistency. I'll fix that in v5.

  > Also is the last name always "UPPER CASE" in your
   region?

  Yes it is standard practice in France to write family names in all
capitals to distinguish them from given names, especially when the
family name could be confused with a given name, not my case but I
comply.

  v5 sent separately.

  Best regards,
  Midgy BALON


Le ven. 20 mars 2026 =C3=A0 09:48, Heiko Stuebner <heiko@sntech.de> a =C3=
=A9crit :
>
> Am Donnerstag, 19. M=C3=A4rz 2026, 15:51:20 Mitteleurop=C3=A4ische Normal=
zeit schrieb MidG971:
> > The Radxa ROCK 3B uses a PI6C20100 PCIe reference clock buffer to
> > provide a 100MHz reference clock to the PCIe 3.0 PHY and controllers.
> > This chip is currently modeled only as a fixed regulator
> > (vcc3v3_pi6c_03), with no clock output representation.
> >
> > The PI6C20100 is a clock generator, not a power supply. Model it
> > properly as a gated-fixed-clock, following the pattern established
> > for the Rock 5 ITX and other boards with similar PCIe clock buffer
> > chips.
> >
> > The regulator node is kept as-is since it controls the power supply
> > to the PI6C20100 chip via GPIO0_D4. The new gated-fixed-clock node
> > references this regulator as its vdd-supply and provides a proper
> > 100MHz clock output. The pcie3x2 node is updated to include the
> > pipe and reference clocks, matching the approach used in
> > rk3588-rock-5-itx.dts.
> >
> > Assisted-by: Claude:claude-3-opus
> > Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>
> > Signed-off-by: Midgy BALON <midgy971@gmail.com>
>
> Sorry for having to bring up the process again, but the patch
> author should match the Signed-off-by line.
>
> You can update the patch author with something like:
>   git commit --author=3D"Midgy BALON <midgy971@gmail.com>" --amend
>
> Also is the last name always "UPPER CASE" in your region?
>
> Thanks a lot for staying on this
> Heiko
>
>
> > ---
> >
> > Changes since v3 [1]:
> >  - Add Reviewed-by from Shawn Lin
> >
> > Changes since v2 [2]:
> >  - Fix AI attribution: use Assisted-by tag instead of Signed-off-by (Sh=
awn)
> >  - Add missing pipe clock (CLK_PCIE30X2_PIPE_DFT) to pcie3x2 clocks
> >    override (Shawn, referencing David's patch [3])
> >
> > Changes since v1 [4]:
> >  - Drop phy-supply approach entirely (Jonas, Shawn)
> >  - Model PI6C20100 as gated-fixed-clock instead
> >  - Wire reference clock to pcie3x2 controller
> >  - Follow pattern from rk3588-rock-5-itx.dts
> >
> > [1] https://lore.kernel.org/linux-rockchip/20260304132957.684616-1-midg=
y971@gmail.com/
> > [2] https://lore.kernel.org/linux-rockchip/20260304132957.684616-1-midg=
y971@gmail.com/
> > [3] https://lore.kernel.org/linux-rockchip/d981fa84-bd05-ac9d-98ca-89ee=
47177829@rock-chips.com/T/#m6a8289609e6a60691d3c06358b6322c7aa5e43d1
> > [4] https://lore.kernel.org/linux-rockchip/20260213151452.535527-1-midg=
y971@gmail.com/
> >
> >  arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts | 21 +++++++++++++++++=
+++-
> >  1 file changed, 20 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm=
64/boot/dts/rockchip/rk3568-rock-3b.dts
> > index c5f67dd6dfd9..1a2b3c4d5e6f 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> > @@ -56,7 +56,16 @@
> >               };
> >       };
> >
> > -     /* pi6c pcie clock generator */
> > +     /* PI6C20100 PCIe reference clock buffer (100MHz) */
> > +     pcie30_refclk: pcie-clock-generator {
> > +             compatible =3D "gated-fixed-clock";
> > +             #clock-cells =3D <0>;
> > +             clock-frequency =3D <100000000>;
> > +             clock-output-names =3D "pcie30_refclk";
> > +             vdd-supply =3D <&vcc3v3_pi6c_03>;
> > +     };
> > +
> > +     /* PI6C20100 power supply - active-high GPIO0_D4 */
> >       vcc3v3_pi6c_03: regulator-3v3-vcc-pi6c-03 {
> >               compatible =3D "regulator-fixed";
> >               enable-active-high;
> > @@ -553,6 +562,15 @@
> >  };
> >
> >  &pcie3x2 {
> > +     clocks =3D <&cru ACLK_PCIE30X2_MST>, <&cru ACLK_PCIE30X2_SLV>,
> > +              <&cru ACLK_PCIE30X2_DBI>, <&cru PCLK_PCIE30X2>,
> > +              <&cru CLK_PCIE30X2_AUX_NDFT>,
> > +              <&cru CLK_PCIE30X2_PIPE_DFT>,
> > +              <&pcie30_refclk>;
> > +     clock-names =3D "aclk_mst", "aclk_slv",
> > +                   "aclk_dbi", "pclk", "aux",
> > +                   "pipe", "ref";
> >       pinctrl-names =3D "default";
> >       pinctrl-0 =3D <&pcie30x2m1_pins>;
> >       reset-gpios =3D <&gpio2 RK_PD6 GPIO_ACTIVE_HIGH>;
> > --
> > 2.39.5
> >
> >
>
>
>
>

