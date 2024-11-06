Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23C3D3E787
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 02:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w8a8+IO/gHzs/8HUWMdym7QT6xBD7UjDO0WtfEtRhaE=; b=Vr89o0zqVzYPcj
	gn4/ivtBdv6+gNTpg6YjETwrs21uIj0jbpjJdiob2c6R8aJ1BTlu/60raoW4fGWoniKLH0epkxr8L
	UZ1R3AITKkctPaxT0MaqZ8+uyn/fZdXD/xxwv4ucNx0SKUT1M7Y74AM+CCPV7D/7gbwYOom0cGfF7
	eumu2AZ1I3z0jGB/sK/YAeLTlFl1zuQ7DRfDYADPuu1dWcgppJZVGGsDUp+UHyME+m2kd958O0owh
	5MmgpU/QuwnhRBkpR6g+GK69NbkVdwn9TWUjKSEuDrB4vd9VIiq8Ete325tfA30oO7573TZdmeRs5
	+tG2uXznR24dteXx6ZHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8VgG-00000001Rzo-1EII;
	Wed, 06 Nov 2024 02:22:00 +0000
Received: from mail-lj1-f176.google.com ([209.85.208.176])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8VeX-00000001RkA-0nHm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 02:20:15 +0000
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb49510250so62513411fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 18:20:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730859608; x=1731464408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w8a8+IO/gHzs/8HUWMdym7QT6xBD7UjDO0WtfEtRhaE=;
        b=JmVenIqJE33+aQiLx5z1xByUdshvldBJzr8AL7T0a6qGCFGvKIaDbFelhrsMlRQ/h+
         hr3TOjyHKVtNiIP+iMJdJNGHjkJuoDJgnQVG5hs3Gac5QOybjfNWws3FnGiatPr/FsbE
         GgJSNY+6B0Z8WuPJnQ9FAQay6G65Rot3IdhSR8D5Dqen34UhXTwRRUuVwMVH5hrnKDj4
         SUZE/eUqDS1UNGWjh9wx9CMmnxLewyUrgO5suvmV+tU5bc7i/47yd98Sw+4ruOHSf8eC
         n935ZtdO6VsmRKRnf7NDyqCzllKemYV/2v1v8wsXBJqCisgl7mWuNASQgrW0sLGtQuNH
         5VaQ==
X-Forwarded-Encrypted: i=1; AJvYcCX10qksfIU56d8H9sG2do/1fCgcc11jSK3xtxNyJDz9FtrFd7F4I260E0INfhO5EM8sYgJm/fLNl7ujTzMQ+/0t@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0iUnyf3JZzmTv4tD1vhPnH0sfk3oTQrSqvnCVIcle6ImTlYeo
	W75halF2IELZPuNzdq5OXUk3r05++ovqJSE8MW4GO2npwrpzUW6M5T3UFiue
X-Google-Smtp-Source: AGHT+IGuy8P3mZjcQ3776mtPDYbcHXZRZ2xtuMFjvDrXYrIQz0kX80VphiVhXdLFbRik0Sa2H/0WUA==
X-Received: by 2002:a05:651c:1505:b0:2fb:6229:c597 with SMTP id 38308e7fff4ca-2fdec4ca7ecmr85739391fa.4.1730859607718;
        Tue, 05 Nov 2024 18:20:07 -0800 (PST)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fdef5d7cf9sm22739791fa.54.2024.11.05.18.20.05
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 18:20:05 -0800 (PST)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb59652cb9so55701931fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 18:20:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW7MhyqNEL8IwTSxQTJ4FAtRUfHpHpsDinhA+M0hTXVt51tgaZYdAHcc+cpocufkwTMxUDj4hI1ZOWP+umUGufh@lists.infradead.org
X-Received: by 2002:a05:651c:556:b0:2f6:649e:bf5c with SMTP id
 38308e7fff4ca-2fdec726444mr95931291fa.17.1730859605489; Tue, 05 Nov 2024
 18:20:05 -0800 (PST)
MIME-Version: 1.0
References: <129f0c754d071cca1db5d207d9d4a7bd9831dff7.1726773282.git.dsimic@manjaro.org>
 <bef0570137358c6c4a55f59e7a4977c4@manjaro.org> <CAGb2v66aody60h=Bpk49pxogq93FekmO48uThPET2RKxvx=OGw@mail.gmail.com>
 <cfc090cb87a8b926116d1a436694d17d@manjaro.org>
In-Reply-To: <cfc090cb87a8b926116d1a436694d17d@manjaro.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 6 Nov 2024 10:19:51 +0800
X-Gmail-Original-Message-ID: <CAGb2v67fLPf-yKObuds3LC77gT_W_OmgSK5y2KotRC-Zn9aL7w@mail.gmail.com>
Message-ID: <CAGb2v67fLPf-yKObuds3LC77gT_W_OmgSK5y2KotRC-Zn9aL7w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: pinephone: Add mount matrix to accelerometer
To: Dragan Simic <dsimic@manjaro.org>
Cc: linux-sunxi@lists.linux.dev, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Ondrej Jirman <megi@xff.cz>, Andrey Skvortsov <andrej.skvortzov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_182013_269103_CD6DE3AE 
X-CRM114-Status: GOOD (  35.22  )
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

On Sat, Oct 26, 2024 at 12:11=E2=80=AFAM Dragan Simic <dsimic@manjaro.org> =
wrote:
>
> Hello Chen-Yu,
>
> On 2024-10-25 16:47, Chen-Yu Tsai wrote:
> > On Wed, Oct 23, 2024 at 5:11=E2=80=AFAM Dragan Simic <dsimic@manjaro.or=
g>
> > wrote:
> >> On 2024-09-19 21:15, Dragan Simic wrote:
> >> > The way InvenSense MPU-6050 accelerometer is mounted on the user-fac=
ing
> >> > side
> >> > of the Pine64 PinePhone mainboard, which makes it rotated 90 degrees
> >> > counter-
> >> > clockwise, [1] requires the accelerometer's x- and y-axis to be
> >> > swapped, and
> >> > the direction of the accelerometer's y-axis to be inverted.
> >> >
> >> > Rectify this by adding a mount-matrix to the accelerometer definitio=
n
> >> > in the Pine64 PinePhone dtsi file.
> >> >
> >> > [1] https://files.pine64.org/doc/PinePhone/PinePhone%20mainboard%20b=
ottom%20placement%20v1.1%2020191031.pdf
> >> >
> >> > Fixes: 91f480d40942 ("arm64: dts: allwinner: Add initial support for
> >> > Pine64 PinePhone")
> >> > Cc: stable@vger.kernel.org
> >> > Helped-by: Ondrej Jirman <megi@xff.cz>
> >> > Helped-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
> >> > Signed-off-by: Dragan Simic <dsimic@manjaro.org>
> >>
> >> Just a brief reminder about this patch...  Please, let me know if some
> >> further work is needed for it to become accepted.
> >
> > There's no "Helped-by" tag, and checkpatch would complain. The closest
> > would be either Suggested-by or Co-developed-by, but with the latter
> > you would also need their Signed-off-by.
>
> Thanks for your response.  You're totally right about checkpatch.pl
> not supporting Helped-by tags, but including neither Suggested-by
> nor Co-developed-by would fit very well in this case, because the
> associated level of credit falls right somewhere between what's
> indicated by these two tags.
>
> > I can change it to Suggested-by if that's OK with you.
>
> I've created and submitted a patch [*] that adds support for Helped-by
> tags to checkpatch.pl.  Let's see what kind of feedback that patch
> will receive, and then we'll be able to move forward accordingly.

There doesn't seem to be any activity. Maybe also try adding it to the

    Documentation/process/submitting-patches.rst

document?


ChenYu


> [*]
> https://lore.kernel.org/linux-kernel/0e1ef28710e3e49222c966f07958a9879fa4=
e903.1729871544.git.dsimic@manjaro.org/T/#u
>
> >> > ---
> >> >
> >> > Notes:
> >> >     See also the linux-sunxi thread [2] that has led to this patch,
> >> > which
> >> >     provides a rather detailed analysis with additional details and
> >> > pictures.
> >> >     This patch effectively replaces the patch submitted in that thre=
ad.
> >> >
> >> >     [2]
> >> > https://lore.kernel.org/linux-sunxi/20240916204521.2033218-1-andrej.=
skvortzov@gmail.com/T/#u
> >> >
> >> >  arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi | 3 +++
> >> >  1 file changed, 3 insertions(+)
> >> >
> >> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> >> > b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> >> > index 6eab61a12cd8..b844759f52c0 100644
> >> > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> >> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> >> > @@ -212,6 +212,9 @@ accelerometer@68 {
> >> >               interrupts =3D <7 5 IRQ_TYPE_EDGE_RISING>; /* PH5 */
> >> >               vdd-supply =3D <&reg_dldo1>;
> >> >               vddio-supply =3D <&reg_dldo1>;
> >> > +             mount-matrix =3D "0", "1", "0",
> >> > +                            "-1", "0", "0",
> >> > +                            "0", "0", "1";
> >> >       };
> >> >  };
> >>

