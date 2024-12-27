Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0191E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 14:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6HZwM074YdHmbBq0k6H05befZoQf1QFgqWA3jYb89v4=; b=hNG0R8iYxyAKLzkE1D/EG6JUHD
	PkR/xLxJwvKlLBnZqMm3SUHWBfwpbuohK4ZWpqcZBny2fwyRHx84n8t3LQxfJWXoYqdofxugZTU/M
	gUwX4u56qe1+oh+cQGSoT/JuE5SfzOsmL+MgQ4MZOsiuU+uuzFyGbGzSJY9lvraQK5X5/bRHgemWx
	NHgvnPaXNLYTegpSliFz5ZGHemElzl5LXJOFGQ5StXelHJITmtso9+wSc9p69o0wqd5dQjd0T8pvK
	g00dEyNsY/xfG5Z2M6PD2ucdJz1D4gvs2iRNBu7b0DP8gJNyKspM3B7Y6bbRMjbpGGN1xJISOcn+e
	BusGYQFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRB6e-00000000MSd-42bS;
	Fri, 27 Dec 2024 14:14:24 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRB5U-00000000MMU-1WgZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 14:13:13 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2f44353649aso7258239a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Dec 2024 06:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edgeble-ai.20230601.gappssmtp.com; s=20230601; t=1735308791; x=1735913591; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6HZwM074YdHmbBq0k6H05befZoQf1QFgqWA3jYb89v4=;
        b=poMNmyIL5z3Dw8YQagv/hZPaaYQtL9xwPsQ3TjHJUibMVMCYXDgz7/ZOEHQzUjRzVR
         XmWdotjtfsq9TSvv2FLkqBsBLTzxiTnp4rYDF3rVxBF5QGV5i+EH+m6weso4HTsI5SEe
         r/GqbQcHn9bU8Bm4TkSP30AoZWBkUqyzMOxQssHBjNEfH6Mz8sNj9oX5Hpqyw+GZalC7
         FZ6BYKu3jGYoLZO9C/AMwr/tNJzHXoIYyCr2ZGPkSj3Doal7oHuWj073xavJPyE9/gm5
         TN76P3B/Cypd402mfv4tgMSB6JoxPmoXq46TZm0f1WdPOsoN/LGjPonA+EZQmkZXkpbx
         o7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735308791; x=1735913591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6HZwM074YdHmbBq0k6H05befZoQf1QFgqWA3jYb89v4=;
        b=cYDW6O6Nd96pXfTxxvMsbnHgBJcRkseLPKMZDK+nYavEUY6xkv1pYDQJ5tF4NMASvZ
         Ur8Vkzgsul0SRWA1OaDYwYnoxQ1SAOSpJ9W/ZPA1cYb0B+1Vef0yXMVSio3yudVjGhoH
         wClYEi3+nBVUrVv//zjEEITFWB07GqNPgS/4q5ENwtNO/k1cWE2JNMfFU6nTaAoMJ9lT
         IBa24EOjiRnjVR8dCZAkAoEFbRXKosfkrIibTajg/iWkh+TYy+ww4zRMNQjaFJekMDH5
         L7EfHbNqUZw3TN5Bunq74YTJtgqSUglK6pDIBcO81N+kvwzlmh1CY0a+j+LzBXWUDt/k
         2SkA==
X-Forwarded-Encrypted: i=1; AJvYcCVLbAcunOzpB23n2MXA6gApL5ZXhDU/XhSRt86tIv63t4OfqCp54RdGhIZCmci98egzTupZQH1LKVQy45K/MGWP@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0KKrF4qHBfqZvYzDBSADyOom2Qc/DJDHGz9xnk2ZI+LfrZl3x
	i7PqQ15SnO+IxQtnP6RlW8VZ0zhNRCtb2VDy08CVcuhr+EcA+KL1/Z98RIc8tiHa8WVewzxuf+3
	LJaay1r+uqS2jy64TNErICs9gseai//td9C+dOIGtWdQAgV0W5QyvZg==
X-Gm-Gg: ASbGncsaZyWrZ0YqO7FstpTFJO/pN5EmAE3RqV5qlCmdK0AoLnFYCDbfCQsI4BLpzsL
	UHOT099nKaZzPu9YrqjWkTtK4Q2XW3hNUZlfi
X-Google-Smtp-Source: AGHT+IGwRttyOVlXZ4AOH109cli3Ic52EUSjmxRCKHx0nJtVDCigH5HefL9ERaeM+pDyuFAlbW6LgVEVHuDlh8T9ZWs=
X-Received: by 2002:a17:90b:53c5:b0:2ee:74a1:fb92 with SMTP id
 98e67ed59e1d1-2f452dfd236mr37291584a91.6.1735308791255; Fri, 27 Dec 2024
 06:13:11 -0800 (PST)
MIME-Version: 1.0
References: <20241227133420.169714-1-jagan@edgeble.ai> <8f40821508fde291aab01674618c0a2c@manjaro.org>
 <e03da44cd6ae417feeb3de3fbfbff7f9@manjaro.org>
In-Reply-To: <e03da44cd6ae417feeb3de3fbfbff7f9@manjaro.org>
From: Jagan Teki <jagan@edgeble.ai>
Date: Fri, 27 Dec 2024 19:43:00 +0530
Message-ID: <CA+VMnFwjbXbjb5nP6FBASOr0Tz+nSNTx0OoQu31xtLHkoWgE_g@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: rockchip: Add Rockchip RK3588M
To: Dragan Simic <dsimic@manjaro.org>, Kever Yang <kever.yang@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_061312_406486_DBBB5B50 
X-CRM114-Status: GOOD (  30.89  )
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

On Fri, 27 Dec 2024 at 19:37, Dragan Simic <dsimic@manjaro.org> wrote:
>
> On 2024-12-27 14:48, Dragan Simic wrote:
> > Hello Jagan,
> >
> > Please see a comment below.
> >
> > On 2024-12-27 14:34, Jagan Teki wrote:
> >> Rockchip RK3588M is the automotive-grade version of RK3588 SoC and
> >> is operated with -40 =C2=B0C to +85 =C2=B0C temparature.
> >>
> >> Add rk3588m specific dtsi for adding rk3588m specific operating points
> >> and other changes to be add in future.
> >>
> >> Signed-off-by: Jagan Teki <jagan@edgeble.ai>
> >> ---
> >>  arch/arm64/boot/dts/rockchip/rk3588m.dtsi | 7 +++++++
> >>  1 file changed, 7 insertions(+)
> >>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588m.dtsi
> >>
> >> diff --git a/arch/arm64/boot/dts/rockchip/rk3588m.dtsi
> >> b/arch/arm64/boot/dts/rockchip/rk3588m.dtsi
> >> new file mode 100644
> >> index 000000000000..0bbeee399a63
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/rockchip/rk3588m.dtsi
> >> @@ -0,0 +1,7 @@
> >> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> >> +/*
> >> + * Copyright (c) 2022 Rockchip Electronics Co., Ltd.
> >> + *
> >> + */
> >> +
> >> +#include "rk3588-extra.dtsi"
> >
> > I don't think we need or want a separate rk3588m.dtsi file for this
> > purpose, unless the RK3588M variant actually differs from the regular
> > RK3588 variant from the software standpoint.  The latter is already
> > described in rk3588.dtsi, so it should just be included in the new
> > board dts(i) file.
>
> Actually, after having a look at the downstream code, it seems that
> the RK3588J and RK3588M variants share the same OPPs, so actually
> rk3588j.dtsi should be used for the RK3588M variant.  Could you,
> please, confirm this?
>
> Alas, it seems we've got some serious issues in the OPPs currently
> defined in rk3588j.dtsi, which I'll double check to make sure I'm not
> going crazy, :) and submit a patch that fixes those OPPs.
>
> If you could confirm the RK3588M =3D=3D RK3588J assumption above, I can
> add some additional clarification to the rk3588j.dtsi file in the
> above-mentioned fixes.

As-far-as-i-know both OPPs were different due to computation grades J
for Industrial and M for Automotive. What I saw from downstream
linux-6.1-stan-rkr1 was a simple dtsi for M variant and might have
changes to add OPPs which I cannot be sure at this point of time. I
keep that dtsi as separate even though it is nothing as i was
expecting some future changes on OPPs or so.

Kever or Heiko can help here.

Thanks,
Jagan.

