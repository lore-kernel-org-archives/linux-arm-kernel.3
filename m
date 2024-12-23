Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82694E7718E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 11:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fk7MGcc0UPnD2/Tewni5a5nHodnS01G5/qRyy3ZbDWo=; b=pMObv+lrQ1b+8ul+gq9bj48pZz
	knt/PELDXtPSJlF0Zz9GXJTplZGzNRZ1iQmvbmoVW3Kp+cmBiXYKYgQsAzFTrtK7pKleoWH2nlfzw
	Nd6SeScOROkC+S9FqKLzuhsGPB8Y5cAs6ft9JSCjpBNXHqhrUoUIQP4smNEMJgwZfYHyruF/Hxrym
	LeCrfd5t5ETembBnMnX6plWYb/mK8fQRxuNfWzM7uoJYlgglVpwO5wgLPrIn3TpZwSZPsxItmyDvl
	bh2v8Sb18h1riWrs1mvovXjn0b+aQ1aUyxbQVDQpHJrZ17MTMfz9lBd5FKLBxDWjCehv9YHEPRUHx
	HQo38CJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPgUl-00000009suP-0fnH;
	Mon, 23 Dec 2024 11:21:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPfMp-00000009lPB-3732
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Dec 2024 10:08:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Fk7MGcc0UPnD2/Tewni5a5nHodnS01G5/qRyy3ZbDWo=; b=oxTMnFHepTfla5kvrkalUlEOf4
	PCDHmwdqetsP0cL37TCRUv3UmbI7+IDV1YBaz7d0uuOOq0njW6oM0rD/prZG5XFQqUUKhuCgdTHl+
	PIELNeWJyYmkVE/GLXORNHIQyf831l77wG5KKLa1UubOmxvrmdHL7Vt/wRBFypSrzyUaVYyBuSuAm
	Osz3R4AYspKPW+IwN1DIENK/rM580iBXmFK/hjcWjNbYjJPhwyU8mDw5pBenBnjcRrNO1cxzLHHzQ
	69b3/4hAbFwy/fYgQoD/IJiS+z5OS/pQhqSRtStO/xBfc/kEKqNuGVKGg3kiNWXkdgTP0zBbLaoLI
	gezXnIbQ==;
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPfMm-00000006JYI-3U7F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 10:08:50 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-53ffaaeeb76so4209095e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 02:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734948525; x=1735553325; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fk7MGcc0UPnD2/Tewni5a5nHodnS01G5/qRyy3ZbDWo=;
        b=Ap+kaRL/QNElnKFxYwuXz/LFFKdKbBbV+9tOSxHQaMcZERMLcrw4xyxWKtkIZsT648
         Gi1YK5BrKGam9jGquY1b9VdrkynHUcfLIBQYQg/cB0q+9kvV+uhqVHzE2l+is4DZLY3t
         yCKW9kRk4HGcAeUt/intv2n/FKWWVsAPQmx4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734948525; x=1735553325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fk7MGcc0UPnD2/Tewni5a5nHodnS01G5/qRyy3ZbDWo=;
        b=wMOKx0jgAxY81QIw++DyEK/GsYMxT661hHuPbMliPxBguUyERVW4FBAKlxw8n+NJ6t
         OOCs8Ft6++4rJNWaji1Gwog0WfKwDK3ZZlHOfMGWOVxc1KD/u+On1PbQ1NZqVQG3lhzr
         NXjUCxWUxAmPdty+bkYnNYHmJp0auVVTCBCsEAdK5mUIs5G4Kxu9QLvoE9paANPzI9B0
         uAgw4K+yP0lnKwvhC1QeMozKJjHnRnLK49L5uaYCtFgUkvc+zLeGmJSXgQzsy6ZxVec4
         4tMM3jmyd7iYbZVuvp3u3IR1IDYeEpef7eyD+brSkgTupXPyD+67SBK4K1PzQutkmOTC
         y0IQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKCPqaQpFycYmf6KVrnJwCOCJktKt/sPb6IsKl6jy/QyAOBFl5QJWPBSZSe3O2Czwu+Q/LvoffFRlHyP+izUem@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4QPRMVJDpoGeVxu0hsSbkyXCsSqRztMjLnosrICP/jbpJFg1y
	qw32yyWwU8pIX/Bn7nQXDLBhFxFFflG+rPY9ABjUzvqmyTQIZeOf8DDDSc4RBGbvaTK1zrs/I3u
	g4iQ1InW6veKdHe9WsTQCSDTStkhhC/McMko8+ob96WjfJhs=
X-Gm-Gg: ASbGncuGpGIZbYHMMNdUpG0NzDT1kdEO4SrXZU28MerjEzZqHsphCx9gqzvo9qfLFWd
	mUY2/OGfPTCMYwd69j2m5tkN3ly2SR/XtrVlw0PiypwBLsTkSjMGLm6++wVEW3VDZcQ==
X-Google-Smtp-Source: AGHT+IE1GbkeOMwKvJXveGcLyXZ44I3grNvdvMJNIb79mDo0zVej4a2EPyn7Fplxeyh9tvSXWx1drrNo+zpMiVd8f2I=
X-Received: by 2002:a05:6512:3b0b:b0:542:2930:4376 with SMTP id
 2adb3069b0e04-54229533e06mr3724081e87.20.1734948525145; Mon, 23 Dec 2024
 02:08:45 -0800 (PST)
MIME-Version: 1.0
References: <20241030070224.1006331-1-wenst@chromium.org> <20241030070224.1006331-2-wenst@chromium.org>
 <CAGXv+5HVy41qee6kwVUeLV_DfA0=wk2X77kv81rBKAZDGE6mww@mail.gmail.com>
 <bbaa0c8f-9702-4252-a674-e46fb51f0a2a@collabora.com> <CAGXv+5GHP1M1rKwR8j+bN8GmpxWtpkfLTnvBdkg5wOvWanc-kw@mail.gmail.com>
 <35392d9d-56a3-4db8-b500-6272d0bd275c@collabora.com> <CAGXv+5H_=He4+vBcaoVbtO05c6hPWV46OTRfR+S8XVuvk_EaYg@mail.gmail.com>
In-Reply-To: <CAGXv+5H_=He4+vBcaoVbtO05c6hPWV46OTRfR+S8XVuvk_EaYg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 23 Dec 2024 18:08:34 +0800
Message-ID: <CAGXv+5F2SvGZL+XKi+6wHf0ejgsxMMMSNnXQMU6T51OTdD2SBg@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: mediatek: mt8183-kukui-jacuzzi: Drop
 pp3300_panel voltage settings
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_100849_096139_D598111A 
X-CRM114-Status: GOOD (  36.83  )
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

On Tue, Dec 10, 2024 at 4:40=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Tue, Dec 10, 2024 at 4:27=E2=80=AFPM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Il 04/11/24 14:47, Chen-Yu Tsai ha scritto:
> > > On Mon, Nov 4, 2024 at 9:19=E2=80=AFPM AngeloGioacchino Del Regno
> > > <angelogioacchino.delregno@collabora.com> wrote:
> > >>
> > >> Il 04/11/24 14:00, Chen-Yu Tsai ha scritto:
> > >>> On Wed, Oct 30, 2024 at 3:02=E2=80=AFPM Chen-Yu Tsai <wenst@chromiu=
m.org> wrote:
> > >>>>
> > >>>> The pp3300_panel fixed regulator is just a load switch. It does no=
t have
> > >>>> any regulating capabilities. Thus having voltage constraints on it=
 is
> > >>>> wrong.
> > >>>>
> > >>>> Remove the voltage constraints.
> > >>>>
> > >>>> Fixes: cabc71b08eb5 ("arm64: dts: mt8183: Add kukui-jacuzzi-damu b=
oard")
> > >>>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > >>>
> > >>> I see that the other three patches were merged and included in the =
pull
> > >>> request, but not this one. Were there any concerns?
> > >>>
> > >>
> > >> Sorry I forgot to actually provide an explanation for that - yes, I =
do have some
> > >> comment about this one.
> > >>
> > >> Despite this being a load switch, it's still switching power from re=
gulator A to
> > >> target device X, so this is technically still providing 3.3V to devi=
ce X.
> > >>
> > >> Think about how a "regular" full-fledged regulator works: you can (s=
ometimes) set
> > >> a voltage, and then you can ENABLE the VOUT for said regulator (/rai=
l): this kind
> > >> of "load switch" does exactly the same as the ENABLE switch for a fu=
ll-fledged
> > >> regulator.
> > >
> > > But it does not provide regulation. One cannot "set" the voltage on a=
 load
> > > switch; one can only set it on its upstream supply, if that supply pr=
ovides
> > > regulation.
> > >
> > > IIRC Mark said some years ago that if a regulator doesn't regulate th=
e
> > > voltage, then the voltage constraints should not be given. The constr=
aints
> > > are then derived from its upstream supply.
> > >
> > > That's the guideline I've followed for all the regulator related chan=
ges
> > > I've done over the years. Does that work for you?
> > >
> >
> > Ok, let's go with that then.
> >
> > There's only one problem - patches 2 to 4 don't apply for whatever reas=
on, is there
> > any dependency?
>
> I believe they were already applied in the previous cycle? At least
> they were dropped from my branch automatically after a recent rebase.

Ping? This one still hasn't been merged.

ChenYu

> ChenYu
>
> > Cheers,
> > Angelo
> >
> > >> So, this is switching on and off a power rail that is derived from a=
 source rail,
> > >> practically creating... well, a "new" rail, with...
> > >>
> > >>    VIN=3Dsomewhere-3.3v,
> > >>    VOUT=3Dsomewhere-still-3.3v
> > >>
> > >> Any objections/doubts/etc? :-)
> > >
> > > I agree with most of it, except the part that I laid out above about =
the
> > > load switch not providing regulation.
> > >
> > >> P.S.: I'm writing fast, sorry if anything appears unclear, feel free=
 to shoot more
> > >>         questions in case :-)
> > >
> > > No, it's pretty clear, and I believe one of the common interpretation=
s
> > > I see. Thank you for the quick response.
> > >
> > >
> > > Thanks
> > > ChenYu
> > >
> > >> Cheers,
> > >> Angelo
> > >>
> > >>>
> > >>> ChenYu
> > >>>
> > >>>> ---
> > >>>>    arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi | 2 --
> > >>>>    1 file changed, 2 deletions(-)
> > >>>>
> > >>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dts=
i b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> > >>>> index 783c333107bc..7bbafe926558 100644
> > >>>> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> > >>>> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> > >>>> @@ -35,8 +35,6 @@ pp1800_mipibrdg: pp1800-mipibrdg {
> > >>>>           pp3300_panel: pp3300-panel {
> > >>>>                   compatible =3D "regulator-fixed";
> > >>>>                   regulator-name =3D "pp3300_panel";
> > >>>> -               regulator-min-microvolt =3D <3300000>;
> > >>>> -               regulator-max-microvolt =3D <3300000>;
> > >>>>                   pinctrl-names =3D "default";
> > >>>>                   pinctrl-0 =3D <&pp3300_panel_pins>;
> > >>>>
> > >>>> --
> > >>>> 2.47.0.163.g1226f6d8fa-goog
> > >>>>
> > >>
> >
> >

