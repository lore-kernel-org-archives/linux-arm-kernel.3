Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A44E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 08:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sOUvJSCroFD0KCytXgmkZjSfl4sfftW4avujGnTnXVw=; b=k8IPTASJJ36W2x2SCiMs5xRvjo
	QYqiVFznsFjr1l5F9VmeLAUZy91O9cYudLBnJfxpdBog4ueM/O0HdTQG89uBw3tUOLl28kCODkbzN
	BVyHRw5WBR5+JO/SmWJZ82/ciHc1VFbXam8irRI3eNnXo4gFRAEhLDvzOd33mp0VF43YsvML+P63w
	2xEShcI6vmwkBMH8LJVurbE1nmqUXlVyFzEU7/GGrKGfrkKsUjYrFgocvCBArtirR19XY7C6q/EEh
	qcTprev035NykE3yg1ExizFuQHd+YsOIyypf9hcFO4p5dFn9jukd/Ry6Xd8+1M88cm6ZKJxEricyX
	QDi+qebg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvor-0000000AkQH-3idM;
	Tue, 10 Dec 2024 08:42:13 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvn3-0000000AkBa-0wn0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 08:40:22 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-54024ecc33dso795996e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 00:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733820019; x=1734424819; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sOUvJSCroFD0KCytXgmkZjSfl4sfftW4avujGnTnXVw=;
        b=nx2IJVe9I3KZmb5rQG2skS07fmdSzVHbUq7jTlArC2byk6baQBkaWKTAS2CwdI2G4J
         Vz3ql1+fcskdfpQxmKsM2DZlsTnJeo581GtvMH/V20XIxCquiil6dQxdavzgbaP4vJCX
         6dZjcwfYuuAp/GRPpNjWxHBHxbtIhT6LmjkVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733820019; x=1734424819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sOUvJSCroFD0KCytXgmkZjSfl4sfftW4avujGnTnXVw=;
        b=OU/+O5pevjpKY8nsv5agoieXchM3+4RS8tVdcsmAgOq4qlLPrfVjp9fBYDlpKukI3J
         2tky65dbgcstB35ADDqPNI3FOYUtsi1514ZVf8VMiMCF+xWd/4+9WV7se1smzHqz81CH
         ANUKxw0Ruw5h2RBo3fTkNBLhTa6z4ihxMuZHoFFTiltajd3aAVnM5QCoxqhakj5aMQTj
         +AwTNGV2lKVZoGbw1n5yTjaWTS+Z7MZjThthdpyUgn2/9appInZBUAGOgJAsueVSz44p
         HWbkyeWO3UFPNxPQMQKlmT61yhMTniFOrKqkseKYJUUWsytYtCJmZJ2zIdN+vlCY00bF
         OG2g==
X-Forwarded-Encrypted: i=1; AJvYcCVlLnabv7FadlRKCx2Pbi4wiVsAu6HKV1Zt8UJXT0+HrKRxNdIT3NXdJRrz748RlincMHW+bXdXt+61fXfpzu81@lists.infradead.org
X-Gm-Message-State: AOJu0YxEPTBsdcSetHHFgvgx1kFIih1cb+1mLR13x9Qa35flEZ1ffzZ6
	842+YPgUX+qIR3zx4zU6AJFozGL03hQ5878H336aMHyznrf61p7cYJoSu1sYfeIo1pHc9koovyJ
	0dXqXhzge+W3Jq2e4BzzA6gO7haKjzUoXZLZz
X-Gm-Gg: ASbGncuZX29MO2xhVCmSgv5ptR1RNzFgNeAlc8BBwxDQfA+ZC+iAWXjdTMg+4dfF4uu
	1UZkVkIi709IjwOPamK/Qe9RKWTGvVSuOtUjTrbdI2E5c3KsQoQO//HRmJOYUlp4=
X-Google-Smtp-Source: AGHT+IEcKKrV7NtntOv/HjB/G1zq4DlNB44Pf3+LGaARGt/ovezLGp7A3gf192BysZYg6DvlHdDVPiDTJwrr5ZbymyQ=
X-Received: by 2002:ac2:4f10:0:b0:53e:3a01:cf4f with SMTP id
 2adb3069b0e04-540240c0f8amr1339484e87.14.1733820019366; Tue, 10 Dec 2024
 00:40:19 -0800 (PST)
MIME-Version: 1.0
References: <20241030070224.1006331-1-wenst@chromium.org> <20241030070224.1006331-2-wenst@chromium.org>
 <CAGXv+5HVy41qee6kwVUeLV_DfA0=wk2X77kv81rBKAZDGE6mww@mail.gmail.com>
 <bbaa0c8f-9702-4252-a674-e46fb51f0a2a@collabora.com> <CAGXv+5GHP1M1rKwR8j+bN8GmpxWtpkfLTnvBdkg5wOvWanc-kw@mail.gmail.com>
 <35392d9d-56a3-4db8-b500-6272d0bd275c@collabora.com>
In-Reply-To: <35392d9d-56a3-4db8-b500-6272d0bd275c@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 10 Dec 2024 16:40:08 +0800
Message-ID: <CAGXv+5H_=He4+vBcaoVbtO05c6hPWV46OTRfR+S8XVuvk_EaYg@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: mediatek: mt8183-kukui-jacuzzi: Drop
 pp3300_panel voltage settings
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_004021_291565_71042C98 
X-CRM114-Status: GOOD (  34.71  )
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

On Tue, Dec 10, 2024 at 4:27=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 04/11/24 14:47, Chen-Yu Tsai ha scritto:
> > On Mon, Nov 4, 2024 at 9:19=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Il 04/11/24 14:00, Chen-Yu Tsai ha scritto:
> >>> On Wed, Oct 30, 2024 at 3:02=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.=
org> wrote:
> >>>>
> >>>> The pp3300_panel fixed regulator is just a load switch. It does not =
have
> >>>> any regulating capabilities. Thus having voltage constraints on it i=
s
> >>>> wrong.
> >>>>
> >>>> Remove the voltage constraints.
> >>>>
> >>>> Fixes: cabc71b08eb5 ("arm64: dts: mt8183: Add kukui-jacuzzi-damu boa=
rd")
> >>>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> >>>
> >>> I see that the other three patches were merged and included in the pu=
ll
> >>> request, but not this one. Were there any concerns?
> >>>
> >>
> >> Sorry I forgot to actually provide an explanation for that - yes, I do=
 have some
> >> comment about this one.
> >>
> >> Despite this being a load switch, it's still switching power from regu=
lator A to
> >> target device X, so this is technically still providing 3.3V to device=
 X.
> >>
> >> Think about how a "regular" full-fledged regulator works: you can (som=
etimes) set
> >> a voltage, and then you can ENABLE the VOUT for said regulator (/rail)=
: this kind
> >> of "load switch" does exactly the same as the ENABLE switch for a full=
-fledged
> >> regulator.
> >
> > But it does not provide regulation. One cannot "set" the voltage on a l=
oad
> > switch; one can only set it on its upstream supply, if that supply prov=
ides
> > regulation.
> >
> > IIRC Mark said some years ago that if a regulator doesn't regulate the
> > voltage, then the voltage constraints should not be given. The constrai=
nts
> > are then derived from its upstream supply.
> >
> > That's the guideline I've followed for all the regulator related change=
s
> > I've done over the years. Does that work for you?
> >
>
> Ok, let's go with that then.
>
> There's only one problem - patches 2 to 4 don't apply for whatever reason=
, is there
> any dependency?

I believe they were already applied in the previous cycle? At least
they were dropped from my branch automatically after a recent rebase.

ChenYu

> Cheers,
> Angelo
>
> >> So, this is switching on and off a power rail that is derived from a s=
ource rail,
> >> practically creating... well, a "new" rail, with...
> >>
> >>    VIN=3Dsomewhere-3.3v,
> >>    VOUT=3Dsomewhere-still-3.3v
> >>
> >> Any objections/doubts/etc? :-)
> >
> > I agree with most of it, except the part that I laid out above about th=
e
> > load switch not providing regulation.
> >
> >> P.S.: I'm writing fast, sorry if anything appears unclear, feel free t=
o shoot more
> >>         questions in case :-)
> >
> > No, it's pretty clear, and I believe one of the common interpretations
> > I see. Thank you for the quick response.
> >
> >
> > Thanks
> > ChenYu
> >
> >> Cheers,
> >> Angelo
> >>
> >>>
> >>> ChenYu
> >>>
> >>>> ---
> >>>>    arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi | 2 --
> >>>>    1 file changed, 2 deletions(-)
> >>>>
> >>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi =
b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> >>>> index 783c333107bc..7bbafe926558 100644
> >>>> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> >>>> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> >>>> @@ -35,8 +35,6 @@ pp1800_mipibrdg: pp1800-mipibrdg {
> >>>>           pp3300_panel: pp3300-panel {
> >>>>                   compatible =3D "regulator-fixed";
> >>>>                   regulator-name =3D "pp3300_panel";
> >>>> -               regulator-min-microvolt =3D <3300000>;
> >>>> -               regulator-max-microvolt =3D <3300000>;
> >>>>                   pinctrl-names =3D "default";
> >>>>                   pinctrl-0 =3D <&pp3300_panel_pins>;
> >>>>
> >>>> --
> >>>> 2.47.0.163.g1226f6d8fa-goog
> >>>>
> >>
>
>

