Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C32D29C2A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 13:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=chB5b0rt82JcysgedumeHVaiY8n8X+8y2Qmtz5rmwLo=; b=ipXMLIeP1f/Q34JMIWLa0yOZ1/
	rIwkDYuwR32FOo1J/71oq4K653IIq+iKY3OmiknAj2zqkb2lUX0GzCW6wK3vpaStxFzcovDW7mfAB
	6K/48xk0ghoMw+M3GzM7lP6kaHTPbuM6FloRqXJUmMlqBIf9M2zslAlZhAiXHfNWL09ASB0jluAbY
	jJHHWfpqsrAV2O4AK0VlgCNAWQfKI+/R3bzrS9HEmJFMjS8XqJfkQs3SlmOXKO8aefLnOSzUlqPLW
	y8qxgm+O4HmyBNdI40v2RdyJwLTjttbTrQ93dWG1y0BllBXbFH9XLa/9xka4exiiozzRbnzmkSe3i
	0xE2cHlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpXP-00000002BI6-3ZI7;
	Mon, 19 Jan 2026 13:43:24 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpXM-00000002BHJ-1Xdr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 13:43:22 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-5014b7de222so43260401cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 05:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768830198; x=1769434998; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=chB5b0rt82JcysgedumeHVaiY8n8X+8y2Qmtz5rmwLo=;
        b=H6kzGEl5AK3KlUScz0UTBdeq9Bv43kattHcoFhP4sIbiQhnLTfmQL4g+yG6NhyCwjE
         gSKIssCpnvP78F0SU54348Q/zAbKmx668XFuP4HSjh+jL2wdFLsI73GtHNX3BTDtJHyf
         fCGksdD/gAg1QXR3eE5WandQXymBHZPAACTUR8bnsuUm9sufTZXEtWeiLV4JIMKn3D6n
         LbIVNtXtcv3uK6yelEx8TmS4Bpj/xc9kTxKmfhkzAeAn8M62wG1/C8ZLP0tm8T8eg1+I
         YctlaXEoObWL8344Bnmj0TbDi/ohQDnFERAhWj+PXUk+pGlz6oW1McS+mDxPtt82a0F1
         uM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768830198; x=1769434998;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=chB5b0rt82JcysgedumeHVaiY8n8X+8y2Qmtz5rmwLo=;
        b=rDcDAJndes3MdMRksE+9hcM3GtxXxcDZuQn8JnvoxrV1dJkKIs0u44mrBNM/iXrHQA
         RQeG7GGXqKuHxWGVd0nANNYf+DfJan+vc/nmdUOWbvR5ud43o83fsbQRw2Xj39kL1amt
         IpkAFGsLJ4IzYOCkGLsYmb8hV6rSdzcWHnO4amI0vLkiertqi+zhAFmCzBp8h+cfho8i
         j+VbIodQparGit5CCML5K9tF51czb3wC4mdutY8ADoGWZmcysxQkUr4TulbcmZr4fAOz
         T0UyEQ/ODgyuulhe5Q/lr2ez4F8QJPo24/9rSmG+Mz8jCKAgGEIdZZIiJ7RinVHFnOKF
         8EWg==
X-Forwarded-Encrypted: i=1; AJvYcCVHe1lrJ6whDG94y0OGQ6EMgjXzCkdl7yQDpjQ76W0FnFGfAaOcZN29iMltHGG9jIvUr7LL6zZTg29NEPlf8RhL@lists.infradead.org
X-Gm-Message-State: AOJu0Yxy7nEOqXFg44eYcZ8O7pEpu/LJzP+UbyVNBf1jWpVDS3VlhmZM
	BHNPfDe1kCHk9GbRV9w4CrQKr8w0RtNfNaII6sB2IIESBW56NqcHIBRRXhZOqDvvnIn9W4aQVMv
	0RoWVyVCIhjkFc2ToIXV1RgqqFq3FjWY=
X-Gm-Gg: AY/fxX4/C6xC2I2esGF3L2aJYT32EOSRGbYoe8Q2uSpq/B5PrtDSWH3L3ZvglZaq+ps
	XnTXghv9kQG6OaCRPwfhr4/BgiBtLv18LAAwUJhTfB5goshMfxP5ieFBsKHiMkjGeQgpQNk37Zn
	AWBWr9ns808jd8si63b3UnwjX57cn46K6xF6/LcaDH7QH14QDLaC8YgQ548lREKzNqdZSzVWxEE
	gN7vN1hZZC0hDYrbzfDcFzsjAzEFmxGkhdBfeFHZnNWXkVTLkC0iEYk0hCUA1oLFgTrak8wbOBF
	MdbM7akYE5StPaP4XOn4lNM7r/PUirpcLuREKg==
X-Received: by 2002:ac8:5a93:0:b0:4ee:1f22:3613 with SMTP id
 d75a77b69052e-502a179b7d7mr149743011cf.62.1768830197715; Mon, 19 Jan 2026
 05:43:17 -0800 (PST)
MIME-Version: 1.0
References: <20260119-ufs-rst-v1-1-c8e96493948c@gmail.com> <b0904cb5-3659-41cc-8395-79eec9e82f01@cherry.de>
In-Reply-To: <b0904cb5-3659-41cc-8395-79eec9e82f01@cherry.de>
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 19 Jan 2026 17:43:09 +0400
X-Gm-Features: AZwV_Qg3fDBDn37sLa59WhlzNgabNqw_H45Z3ujw8yrw_76pBFKSvwfPEz_39iE
Message-ID: <CABjd4YzJud4ZZQ_GrOOSnfEVG7wgHmPSf9w8oQhLVSx6WXgN5A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Explicitly request UFS reset pin on RK3576
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_054321_239794_FAE07906 
X-CRM114-Status: GOOD (  35.34  )
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

Hi Quentin,

On Mon, Jan 19, 2026 at 3:08=E2=80=AFPM Quentin Schulz <quentin.schulz@cher=
ry.de> wrote:
>
> Hi Alexey,
>
> On 1/19/26 10:22 AM, Alexey Charkov wrote:
> > Rockchip RK3576 UFS controller uses a dedicated pin to reset the connec=
ted
> > UFS device, which can operate either in a hardware controlled mode or a=
s a
> > GPIO pin.
> >
> > Power-on default is GPIO mode, but the boot ROM reconfigures it to a
> > hardware controlled mode if it uses UFS to load the next boot stage.
> >
> > Given that existing bindings (and rk3576.dtsi) expect a GPIO-controlled
> > device reset, request the required pin config explicitly.
> >
> > This doesn't appear to affect Linux, but it does affect U-boot:
> >
> > Before:
> > =3D> md.l 0x2604b398
> > 2604b398: 00000011 00000000 00000000 00000000  ................
> > < ... snip ... >
> > =3D> ufs init
> > ufshcd-rockchip ufshc@2a2d0000: [RX, TX]: gear=3D[3, 3], lane[2, 2], pw=
r[FASTAUTO_MODE, FASTAUTO_MODE], rate =3D 2
> > =3D> md.l 0x2604b398
> > 2604b398: 00000011 00000000 00000000 00000000  ................
> >
> > After:
> > =3D> md.l 0x2604b398
> > 2604b398: 00000011 00000000 00000000 00000000  ................
> > < ... snip ...>
> > =3D> ufs init
> > ufshcd-rockchip ufshc@2a2d0000: [RX, TX]: gear=3D[3, 3], lane[2, 2], pw=
r[FASTAUTO_MODE, FASTAUTO_MODE], rate =3D 2
> > =3D> md.l 0x2604b398
> > 2604b398: 00000010 00000000 00000000 00000000  ................
> >
> > (0x2604b398 is the respective pin mux register, with its BIT0 driving t=
he
> > mode of UFS_RST: unset =3D GPIO, set =3D hardware controlled UFS_RST)
> >
> > This helps ensure that GPIO-driven device reset actually fires when the
> > system requests it, not when whatever black box magic inside the UFSHC
> > decides to reset the flash chip.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: c75e5e010fef ("scsi: arm64: dts: rockchip: Add UFS support for R=
K3576 SoC")
> > Reported-by: Quentin Schulz <quentin.schulz@cherry.de>
> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> > This has originally surfaced during the review of UFS patches for U-boo=
t
> > at [1], where it was found that the UFS reset line is not requested to =
be
> > configured as GPIO but used as such. This leads in some cases to the UF=
S
> > driver appearing to control device resets, while in fact it is the
> > internal controller logic that drives the reset line (perhaps in
> > unexpected ways).
> >
> > Thanks Quentin Schulz for spotting this issue.
> >
> > [1] https://lore.kernel.org/u-boot/259fc358-f72b-4a24-9a71-ad90f2081335=
@cherry.de/
> > ---
> >   arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi | 7 +++++++
> >   arch/arm64/boot/dts/rockchip/rk3576.dtsi         | 2 +-
> >   2 files changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi b/arch/ar=
m64/boot/dts/rockchip/rk3576-pinctrl.dtsi
> > index 0b0851a7e4ea..20cfd3393a75 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi
> > @@ -5228,6 +5228,13 @@ ufs_rst: ufs-rst {
> >                               /* ufs_rstn */
> >                               <4 RK_PD0 1 &pcfg_pull_none>;
> >               };
> > +
> > +             /omit-if-no-ref/
> > +             ufs_rst_gpio: ufs-rst-gpio {
> > +                     rockchip,pins =3D
> > +                             /* ufs_rstn */
> > +                             <4 RK_PD0 RK_FUNC_GPIO &pcfg_pull_none>;
>
> The SoC default is pull-down according to the TRM. Can you check please?
> For example, the Rock 4D doesn't seem to have a hardware pull-up or
> pull-down on the line and the UFS module only seems to have a debouncer
> (capacitor between the line and ground). So except if the chip itself
> has a PU/PD, this may be an issue?

The SoC default is indeed pull-down (as stated both in the TRM and in
the reference schematic from RK3576 EVB1). Which I believe means that
the attached device should be held in a reset state until the driver
takes over the control of the GPIO line (which, in turn, is consistent
with the observed behavior when reset handling is not enabled in the
driver but the reset pin is in GPIO mode).

Are you concerned that the chip might unintentionally go in or out of
reset between the moment the pinctrl subsystem claims the pin and the
moment the driver starts outputting a state it desires? This hasn't
caused any observable issues in my testing, but I guess we could
explicitly set it to &pcfg_pull_down for more predictable behavior in
line with what's printed on the schematic.

Best regards,
Alexey

