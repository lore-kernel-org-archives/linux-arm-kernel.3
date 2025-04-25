Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F019FC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 16:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NR8AY7/r7j1Bynibp57ezAgc4LFEr9BMoNMHriAH6oo=; b=1Xu5ex90w+TtCW
	jUU7QIh1QzUNM0xNopQXdxmS53JKAaUMFMDL2x+edt5FjyCKl/lNh3179ehh9bHTzOgfJcJihhQ5J
	Am7b/iRiSdrgENFI0AjU9t1SPaSeUjY3EERcpEIULFSsaVCSqvYyWAT54q84vr0slnPgBH/S5CozC
	j4417wD6SklDf44yUzf2jhdzGDbgQ1EBn9oCPMAmhQBGHH6NJilG5tOEr9LLv//5wLaLWBI18xRs5
	gPt37Uf/XwHdnjgV/yEgCaX8gKfZxyuiX1afUbI3iDq/nvOF9IcFd4x6zu2T+wZ6zV2EJT0YrI68v
	S93JRG6Rp6BK4Eze1okg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8LnM-00000000BWM-2Hgu;
	Fri, 25 Apr 2025 16:20:56 +0000
Received: from mail-lf1-f45.google.com ([209.85.167.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8KA4-0000000HSRY-2y9Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 14:36:18 +0000
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so2335379e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 07:36:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745591773; x=1746196573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NR8AY7/r7j1Bynibp57ezAgc4LFEr9BMoNMHriAH6oo=;
        b=cdA/8rDEzc0HAy+e4P/aqk1rc18dXGUNhBPWbmG2sJHyWJ3/5kzOMpRUYtP/dDPefT
         7+SAou/01LQnLaxrZQMb73g63P+yHgtBxTJ+xJI7AHG14VplD/KV91D+nPGuF9wcJCDW
         6nNkULFzOOjKVzatztKt1C1xlwTf5sl8/z4hmyrzRf+8vVYa5qL4fh+8KCAydNxcEAP7
         HMknxpfNuOqsbDfciz1nPTCS7wDGX1MEZQ615vUce6hhYPVFnbNGUsesHFbyb9lr/M3R
         18Si0YNsOphh4f4CnuedV8jiRxrQVDR1L21nECtsKKR728ZfqX0fYgolETFo1RcVVIC5
         XQng==
X-Forwarded-Encrypted: i=1; AJvYcCVoEVuzZtzO3pSdg0qFm/zrTq+TTO2ivbkBHY3PERKb26nlZNB74DMBRSLBgqn4TxNvDtsu45gmNF/Ms8je2/lR@lists.infradead.org
X-Gm-Message-State: AOJu0YwN8yeNB1MQSie5kNC8+BIxCdzhGgpQoQQ9qnrQBO1QnsFAK6xT
	LLg79Qm/ges7l+WyYz9v2oHccZNWpOo4xP6kt6yfrHTB49BgsOo1tGgg8O2zC4U=
X-Gm-Gg: ASbGncuRHlAICVkQkBvZFSc7O2mkWXaxxs2FUIUyHLIfRwb3e/bJCeHt2Tx+jRY+G6d
	D+4EXdrBXqQripWGbElMej9vg3/EEl+CAVHcik6erlrjp3P5PEE191aVzb/lbAnSRy/ZPKpVNhX
	daWISl+r6WZkxpPa6320eSy1vlUtKPoJP6WlafNjaFAvjJ/eKzu4uSbMyyHFwhRQLFdQT5VUX2o
	b8veg5RLm+I9i4DfE7kKEFyQJdK8ic948xME9Z1/lHbkL5VgH8yHW0cJc4OsUBOAso20/yPCCoG
	oxHxJachXE3xYgIFR/GKNLCpfpvamEt45gL7iHyyCVaa42cdzWVrOUKnjiH79zcpH2nRXYoT+Q=
	=
X-Google-Smtp-Source: AGHT+IECWHFGiWAAWFB/Qrrlo2X81YgS1aOwYBVuWcExCMpt1E521iaXuKDQOeUKO9hWDwjcXVik6w==
X-Received: by 2002:a05:6512:3c8e:b0:549:8f10:ec48 with SMTP id 2adb3069b0e04-54e8cbd8bc0mr764986e87.29.1745591773284;
        Fri, 25 Apr 2025 07:36:13 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb83cfsm611176e87.251.2025.04.25.07.36.12
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 07:36:13 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30c461a45f8so21504881fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 07:36:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXs/8mdrBTGPLYwWzHG52NRC3hH+oVfky5tGQqT0U0tmJjmXJM07tBy/5LghM6IRy+uggJAhhXxJJgz77QgzykR@lists.infradead.org
X-Received: by 2002:a2e:bc22:0:b0:30b:9813:b002 with SMTP id
 38308e7fff4ca-31907611d07mr9058331fa.30.1745591772086; Fri, 25 Apr 2025
 07:36:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250424-01-sun55i-emac0-v2-0-833f04d23e1d@gentoo.org>
 <20250424-01-sun55i-emac0-v2-3-833f04d23e1d@gentoo.org> <CAGb2v66a4ERAf_YhPkMWJjm26SsfjO3ze_Zp=QqkXNDLaLnBRg@mail.gmail.com>
 <20250425104128.14f953f3@donnerap.manchester.arm.com>
In-Reply-To: <20250425104128.14f953f3@donnerap.manchester.arm.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 25 Apr 2025 22:35:59 +0800
X-Gmail-Original-Message-ID: <CAGb2v65QUrCjgHXWAb72Sdppqg1AUxXyD_ZcXShtkRSHCQBbOg@mail.gmail.com>
X-Gm-Features: ATxdqUGytr4HbfY93aZiokaET82aJ2vi5Nhe3vDvbhoSCAK-s8uP_doJV3CtnsQ
Message-ID: <CAGb2v65QUrCjgHXWAb72Sdppqg1AUxXyD_ZcXShtkRSHCQBbOg@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] arm64: dts: allwinner: a523: Add EMAC0 ethernet MAC
To: Andre Przywara <andre.przywara@arm.com>
Cc: Yixun Lan <dlan@gentoo.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Corentin Labbe <clabbe.montjoie@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_073616_747438_CDEFFAB1 
X-CRM114-Status: GOOD (  21.96  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Apr 25, 2025 at 5:41=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> On Fri, 25 Apr 2025 13:26:25 +0800
> Chen-Yu Tsai <wens@csie.org> wrote:
>
> Hi Chen-Yu,
>
> > On Thu, Apr 24, 2025 at 6:09=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wro=
te:
> > >
> > > Add EMAC0 ethernet MAC support which found on A523 variant SoCs,
> > > including the A527/T527 chips. MAC0 is compatible to the A64 chip whi=
ch
> > > requires an external PHY. This patch only add RGMII pins for now.
> > >
> > > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > > ---
> > >  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 40 ++++++++++++++++=
++++++++++
> > >  1 file changed, 40 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/ar=
m64/boot/dts/allwinner/sun55i-a523.dtsi
> > > index ee485899ba0af69f32727a53de20051a2e31be1d..c9a9b9dd479af05ba22fe=
9d783e32f6d61a74ef7 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> > > +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> > > @@ -126,6 +126,15 @@ pio: pinctrl@2000000 {
> > >                         interrupt-controller;
> > >                         #interrupt-cells =3D <3>;
> > >
> > > +                       rgmii0_pins: rgmii0-pins {
> > > +                               pins =3D "PH0", "PH1", "PH2", "PH3", =
"PH4",
> > > +                                      "PH5", "PH6", "PH7", "PH9", "P=
H10",
> > > +                                      "PH14", "PH15", "PH16", "PH17"=
, "PH18";
> > > +                               allwinner,pinmux =3D <5>;
> > > +                               function =3D "emac0";
> > > +                               drive-strength =3D <40>;
> >
> > We should probably add
> >
> >                                   bias-disable;
> >
> > to explicitly turn off pull-up and pull-down.
>
> Should we? I don't see this anywhere else for sunxi, probably because it =
is
> the (reset) default (0b00).
> I wonder if we have a hidden assumption about this? As in: if no bias is
> specified, we assume bias-disable? Then we should maybe enforce this is i=
n
> the driver?

There isn't any assumption, as in we were fine with either the reset
default or whatever the bootloader left it in. However in projects at
work I learned that it's better to have explicit settings despite
working defaults.


ChenYu

