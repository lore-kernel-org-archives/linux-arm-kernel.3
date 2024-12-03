Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00410E74AD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 20:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9H/VKKsxPqkwnn4Ovq0/TVybkjv9IaqZ2/k70fdkS4w=; b=nMY/rpDZu1uF19zUblOgG8U9xC
	pHTeMTUKVaMU+yvlIerQ57CA+AQPpI9LzEIakDMVJHgArnvu9ThYGSTlIBfBVl5HLF+USTSBTf1gQ
	UVd5HQqWIrFY7aXao+/mqH9FVO6EEHEAi1qRbc7TgRh14MgO9hKEfVUeeDd4CjmsWnoUXCxsGReQ4
	UYWkusqXLeXRBKoVtsOZjK4hOTOqMN1kAEytXaNVP+B62lKSkj5PaEJCznKHjECs4CB8/i+oB/hoI
	mSYEyNmbkZ/M8yEB9Vb67UoH/C1Huy0iJpthAt1PMPJyNpiQUTyKNrxAB7xXndaZK++aX9DkSTJtz
	sWYDShyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIZSW-0000000AcoR-25tR;
	Tue, 03 Dec 2024 20:25:24 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIZRU-0000000Achr-1UYE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 20:24:21 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5d0c8ba475bso4861570a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 12:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733257458; x=1733862258; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9H/VKKsxPqkwnn4Ovq0/TVybkjv9IaqZ2/k70fdkS4w=;
        b=GdNFkDr2vesgRb7zjNRBhk+IWQGXZkC4K3eYloTr+6zhW1AZXz5gfiWT6SfYYLdqg0
         uS/w/U4gkue/l1kXAPy3S9jdxN1ngIrP+nEyk2VajhfXVwmt45K1Mhk9XRl+T3h0TfdD
         XvoTcJzfWKX/A8up43LUhpnOqnr3kauorF9aCofLTq9Jv+3rdxUcByNGWDNQkDeKuzw0
         o2p1WK5mq/ZgGiIxFKkZBi7TVgj34MaLJ4u17mvmpOpSSVpjzyjOEF1Zpufp63pJnSwP
         BK11m/yykMKPymZuPVKKK/I5MzVGm7rhb4JFtSnW4jPJSdFf887IM27Lt1o6aVI8ouUW
         /LIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733257458; x=1733862258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9H/VKKsxPqkwnn4Ovq0/TVybkjv9IaqZ2/k70fdkS4w=;
        b=M6AfSzNhVaGuzmyX+sn3EMDSTJ9OYbXBQw7nHhf0PrXhPZyvQZmmXjuhtDnujHtPeb
         +0Vmu103aXsWGAS/ijYJEfk1RZjTJfkx9IKFo9SwpbMdsRRYCXa5tMn+yYdKX8g+ZPb8
         JPbHWCMDQ9KSsYSPMNAsxNIN97iGJ8EeaNQLCokTzJnxdHpxHQcpL4dA4E3IYq0y405Y
         k8tGXjivlyJz0P4gxoiyioIUgG070HD+dwfw1l9CwpLrliHV879Eq4PkXz3ETq1np6yG
         W+k/kodmkNN9nciCvYHid6pYkpPWFx3y41/KrOIF5DQiabaP4oCT8KcgkOE5CX28t3zX
         Ng5A==
X-Forwarded-Encrypted: i=1; AJvYcCXByO+b7vzF+ysGMy+F1YEKhmd0UqZHDaYzJJ95Rm3yrNbEdKRU/IVyUYF1EI2pukTrVU3jdtqWCPmgtvJo/QDX@lists.infradead.org
X-Gm-Message-State: AOJu0YwgHiYgq9zaLSfo2vwo7vw+PM095cA/Dvwu63kGpvq94t18XY4B
	1JOS/pmgTduPxhAbWq1nxVOQ18Yg/XMnvtQW/SdG+iA+KP+n73I+XVENSP4T50Td64W1oG+5IVJ
	q+m1MPqRgap4fBXu6fWKbdpjY8Pc=
X-Gm-Gg: ASbGnctHvz8yfdFMXYEcLrucl+5/jk6AaXtvY9o5jOxnbbSsjTdwNIag1E7AgrdVZZq
	4hCmbJ8d0Dgu1gAC5+8hj2cMtsYb/HMkZ
X-Google-Smtp-Source: AGHT+IED64HAONqQrir/0SLtu04gZNnEVK81RYiQzhjfvbIpkN0hS/WjQiGMGqysENw73UqcV2tjL/kgzHI8NZJANkI=
X-Received: by 2002:a05:6402:5216:b0:5d0:80fb:87ba with SMTP id
 4fb4d7f45d1cf-5d10cb5683dmr3904970a12.14.1733257457782; Tue, 03 Dec 2024
 12:24:17 -0800 (PST)
MIME-Version: 1.0
References: <20241128154556.2743839-1-simons.philippe@gmail.com> <CAGb2v64b-m8XoXWXyPFLZKpfTJd2beE_QjUUbf17o4y_rfTmJg@mail.gmail.com>
In-Reply-To: <CAGb2v64b-m8XoXWXyPFLZKpfTJd2beE_QjUUbf17o4y_rfTmJg@mail.gmail.com>
From: Philippe Simons <simons.philippe@gmail.com>
Date: Tue, 3 Dec 2024 21:24:06 +0100
Message-ID: <CADomA48EED-yfwdR8O+3Xd0YKzn=QodECfmdiuFUu9YPWn0GdQ@mail.gmail.com>
Subject: Re: [PATCH] Update H700 opp values
To: wens@csie.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_122420_420342_33A92212 
X-CRM114-Status: GOOD (  23.26  )
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

It seems I was looking at the correct source of instabilities, but
not with the correct solution.

incorrect cpu voltages were indeed causing the crashes but only
because the cpu regulator was missing the property
regulator-ramp-delay. The patch can be discarded, I'll post a new
that adds the missing properties on the regulators.

Philippe

On Fri, Nov 29, 2024 at 6:13=E2=80=AFAM Chen-Yu Tsai <wens@csie.org> wrote:
>
> On Thu, Nov 28, 2024 at 11:46=E2=80=AFPM Philippe Simons
> <simons.philippe@gmail.com> wrote:
> >
> > My H700 (RG35XX-H, RG40XX-V and RG CubeXX) devices are very unstable,
> > especially with some OPPs.
> > Crashes were fairly easy to reproduce with any dynamic cpufreq governor
> > and some load on CPU, usually in matter of minutes.
> > Crashes manifested randomly as simply hanging or various kernel oops
> >
> > Manufacturer (Anbernic) is using more conservative mircrovolt values,
> > so let's use these.
> > While using performance gov seems stables at 1.5Ghz, it still crashes
> > using a dynamic gov (even with Andre reparenting patch), so let's drop
> > it for now, like manufacturer does.
> >
> > Signed-off-by: Philippe Simons <simons.philippe@gmail.com
> > ---
> >  .../dts/allwinner/sun50i-h616-cpu-opp.dtsi    | 19 +++++++++----------
> >  1 file changed, 9 insertions(+), 10 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-cpu-opp.dtsi b/a=
rch/arm64/boot/dts/allwinner/sun50i-h616-cpu-opp.dtsi
> > index dd10aaf47..ac13fe169 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h616-cpu-opp.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-cpu-opp.dtsi
> > @@ -50,24 +50,21 @@ opp-1008000000 {
> >                         opp-microvolt-speed2 =3D <950000>;
> >                         opp-microvolt-speed3 =3D <950000>;
> >                         opp-microvolt-speed4 =3D <1020000>;
> > -                       opp-microvolt-speed5 =3D <900000>;
> > +                       opp-microvolt-speed5 =3D <950000>;
>
> It seems that you are encountering the issues on this particular binning.
> Could you mention that in the commit message?
>
> It's not very obvious that H700 =3D=3D a particular speed bin of H616.
>
> ChenYu
>
> >                         clock-latency-ns =3D <244144>; /* 8 32k periods=
 */
> >                         opp-supported-hw =3D <0x3f>;
> >                 };
> >
> >                 opp-1032000000 {
> >                         opp-hz =3D /bits/ 64 <1032000000>;
> > -                       opp-microvolt =3D <900000>;
> > +                       opp-microvolt =3D <950000>;
> >                         clock-latency-ns =3D <244144>; /* 8 32k periods=
 */
> >                         opp-supported-hw =3D <0x20>;
> >                 };
> >
> >                 opp-1104000000 {
> >                         opp-hz =3D /bits/ 64 <1104000000>;
> > -                       opp-microvolt-speed0 =3D <1000000>;
> > -                       opp-microvolt-speed2 =3D <1000000>;
> > -                       opp-microvolt-speed3 =3D <1000000>;
> > -                       opp-microvolt-speed5 =3D <950000>;
> > +                       opp-microvolt =3D <1000000>;
> >                         clock-latency-ns =3D <244144>; /* 8 32k periods=
 */
> >                         opp-supported-hw =3D <0x2d>;
> >                 };
> > @@ -79,7 +76,7 @@ opp-1200000000 {
> >                         opp-microvolt-speed2 =3D <1050000>;
> >                         opp-microvolt-speed3 =3D <1050000>;
> >                         opp-microvolt-speed4 =3D <1100000>;
> > -                       opp-microvolt-speed5 =3D <1020000>;
> > +                       opp-microvolt-speed5 =3D <1050000>;
> >                         clock-latency-ns =3D <244144>; /* 8 32k periods=
 */
> >                         opp-supported-hw =3D <0x3f>;
> >                 };
> > @@ -93,7 +90,10 @@ opp-1320000000 {
> >
> >                 opp-1416000000 {
> >                         opp-hz =3D /bits/ 64 <1416000000>;
> > -                       opp-microvolt =3D <1100000>;
> > +                       opp-microvolt-speed0 =3D <1100000>;
> > +                       opp-microvolt-speed2 =3D <1100000>;
> > +                       opp-microvolt-speed3 =3D <1100000>;
> > +                       opp-microvolt-speed5 =3D <1160000>;
> >                         clock-latency-ns =3D <244144>; /* 8 32k periods=
 */
> >                         opp-supported-hw =3D <0x2d>;
> >                 };
> > @@ -102,9 +102,8 @@ opp-1512000000 {
> >                         opp-hz =3D /bits/ 64 <1512000000>;
> >                         opp-microvolt-speed1 =3D <1100000>;
> >                         opp-microvolt-speed3 =3D <1100000>;
> > -                       opp-microvolt-speed5 =3D <1160000>;
> >                         clock-latency-ns =3D <244144>; /* 8 32k periods=
 */
> > -                       opp-supported-hw =3D <0x2a>;
> > +                       opp-supported-hw =3D <0x0a>;
> >                 };
> >         };
> >  };
> > --
> > 2.46.1
> >

