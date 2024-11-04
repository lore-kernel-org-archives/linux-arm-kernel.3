Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359E7D132D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 14:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LsymmwIGsuVs7v1n+LWpRRRaG0hjIy9yDhaEU8VEsww=; b=NoBjGy9Dam5YaxTEpULA3UVlCj
	vhP3CoMz646J99FnKO4odmhTwPXPdUuD+AOSzJXnYrtd+Mr0jv+BNg3Gxb15xfzMylSrvTZSRhPKa
	ib/lHetm1ymIQKIgGfDujDEmbD8pFWvOVdBQU4zAqLQBvCAX1KuOAVDkZfZPCrWhrz1mBRiBCXyt6
	/QXO+pEHjsokWV8svDoY0eKBcTI7UloGDKGPJIur8voghnBOuWaKQkfStMb/HDo9GwkCVF5jxbMGG
	JbKMtFlRUeKMslBbsqJJN/eKVFbk4E+lVucTwiSc6qxISHkKoBECT2PpHIaQ7Ub7f6rLImibkikAz
	zikp40rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7yO6-0000000E7Ec-1yog;
	Mon, 04 Nov 2024 14:49:02 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xQl-0000000Dvlf-28Li
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 13:47:45 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-539ee1acb86so4173998e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 05:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730728061; x=1731332861; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LsymmwIGsuVs7v1n+LWpRRRaG0hjIy9yDhaEU8VEsww=;
        b=PJEDeqgmyyq7+jF1ZWC6npCD5y2xiXanmVl9115qF04uLJ3dpZP2c83mlGLh4BKPXy
         XT0rcShCEccEXhAfan/bNc9b3pXp6aVxSPqIiFKmkQ32PgJ8Zp/yeVsMFSsPOhjOSh3U
         cdVL5q2SyrEt/WaDuRHt7xQHscMbeL0roCE6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730728061; x=1731332861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LsymmwIGsuVs7v1n+LWpRRRaG0hjIy9yDhaEU8VEsww=;
        b=xGkaDdEmx6RXHkAGBKoCo+1t/S3wj+abKRa31i95m/bytqnYLmHemgo+ldOv5zFJ6S
         BncGCgNLyDNIAC3rqMk71K7f+RtsBSfDh6RlFto2bzzjrSOBoiROCQcu3Wo4VXX25TqB
         6Id+vUKeG4AIR60kpg9Qm1bN07OLF66qGA/e/8bjjTNEx1Saju/upW3ahSIYuuod1l1G
         KF2W729rxfQUUko+VxWF8wOWHK0Ye1yyH7FUSQ1iUQayrtUM/U2WBkWjUDx98BQmFa8o
         15wYNtkTwzL8xjr7dnLb5sp4lPLq1uuLdcDaEVQax4TqubApNVnLkQGz8z7HsUkMdXLX
         yinQ==
X-Forwarded-Encrypted: i=1; AJvYcCXn3LvAwF301FBzo7hYGEQ7P2AeBTRvyvCxMPjk9SmVsZFp2711uTjyS/La1IcxcL/jvQKxEdI6cc+HryOR2oGY@lists.infradead.org
X-Gm-Message-State: AOJu0YxMG4LAW0UN9pn/u1gquTqBXfMxy9W1FvKTStNbx+5aZeiT+KNS
	tct0PZo3uaiJMRNKf838uc7gg5V94Cyrpu6eUiMvDQ+wmiq4IB2CBpWkqoxlkZdHNL9L88j2W3g
	XzT3Tzr1O8EzQ3soQEBtG95eL6/X3K4tnlvC1
X-Google-Smtp-Source: AGHT+IG6XUFtsKbcLLl53KOkLywI84S6ITEyyTl9D7WkFTQfnMFACCzmN85bTtyfiBZP6XY2rRglSKd6AWN+dPBO6zo=
X-Received: by 2002:a05:6512:230b:b0:539:9645:97ab with SMTP id
 2adb3069b0e04-53d65dfee01mr4788487e87.33.1730728061055; Mon, 04 Nov 2024
 05:47:41 -0800 (PST)
MIME-Version: 1.0
References: <20241030070224.1006331-1-wenst@chromium.org> <20241030070224.1006331-2-wenst@chromium.org>
 <CAGXv+5HVy41qee6kwVUeLV_DfA0=wk2X77kv81rBKAZDGE6mww@mail.gmail.com> <bbaa0c8f-9702-4252-a674-e46fb51f0a2a@collabora.com>
In-Reply-To: <bbaa0c8f-9702-4252-a674-e46fb51f0a2a@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 4 Nov 2024 21:47:30 +0800
Message-ID: <CAGXv+5GHP1M1rKwR8j+bN8GmpxWtpkfLTnvBdkg5wOvWanc-kw@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: mediatek: mt8183-kukui-jacuzzi: Drop
 pp3300_panel voltage settings
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_054743_609819_9AF71F11 
X-CRM114-Status: GOOD (  29.91  )
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

On Mon, Nov 4, 2024 at 9:19=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 04/11/24 14:00, Chen-Yu Tsai ha scritto:
> > On Wed, Oct 30, 2024 at 3:02=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.or=
g> wrote:
> >>
> >> The pp3300_panel fixed regulator is just a load switch. It does not ha=
ve
> >> any regulating capabilities. Thus having voltage constraints on it is
> >> wrong.
> >>
> >> Remove the voltage constraints.
> >>
> >> Fixes: cabc71b08eb5 ("arm64: dts: mt8183: Add kukui-jacuzzi-damu board=
")
> >> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> >
> > I see that the other three patches were merged and included in the pull
> > request, but not this one. Were there any concerns?
> >
>
> Sorry I forgot to actually provide an explanation for that - yes, I do ha=
ve some
> comment about this one.
>
> Despite this being a load switch, it's still switching power from regulat=
or A to
> target device X, so this is technically still providing 3.3V to device X.
>
> Think about how a "regular" full-fledged regulator works: you can (someti=
mes) set
> a voltage, and then you can ENABLE the VOUT for said regulator (/rail): t=
his kind
> of "load switch" does exactly the same as the ENABLE switch for a full-fl=
edged
> regulator.

But it does not provide regulation. One cannot "set" the voltage on a load
switch; one can only set it on its upstream supply, if that supply provides
regulation.

IIRC Mark said some years ago that if a regulator doesn't regulate the
voltage, then the voltage constraints should not be given. The constraints
are then derived from its upstream supply.

That's the guideline I've followed for all the regulator related changes
I've done over the years. Does that work for you?

> So, this is switching on and off a power rail that is derived from a sour=
ce rail,
> practically creating... well, a "new" rail, with...
>
>   VIN=3Dsomewhere-3.3v,
>   VOUT=3Dsomewhere-still-3.3v
>
> Any objections/doubts/etc? :-)

I agree with most of it, except the part that I laid out above about the
load switch not providing regulation.

> P.S.: I'm writing fast, sorry if anything appears unclear, feel free to s=
hoot more
>        questions in case :-)

No, it's pretty clear, and I believe one of the common interpretations
I see. Thank you for the quick response.


Thanks
ChenYu

> Cheers,
> Angelo
>
> >
> > ChenYu
> >
> >> ---
> >>   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi | 2 --
> >>   1 file changed, 2 deletions(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/=
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> >> index 783c333107bc..7bbafe926558 100644
> >> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> >> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> >> @@ -35,8 +35,6 @@ pp1800_mipibrdg: pp1800-mipibrdg {
> >>          pp3300_panel: pp3300-panel {
> >>                  compatible =3D "regulator-fixed";
> >>                  regulator-name =3D "pp3300_panel";
> >> -               regulator-min-microvolt =3D <3300000>;
> >> -               regulator-max-microvolt =3D <3300000>;
> >>                  pinctrl-names =3D "default";
> >>                  pinctrl-0 =3D <&pp3300_panel_pins>;
> >>
> >> --
> >> 2.47.0.163.g1226f6d8fa-goog
> >>
>

