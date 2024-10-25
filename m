Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E1ED0BB56
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 15:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fMcatHSssIzBAMp8NeTODM9A2XszLfMDJPzpLz8VH0Y=; b=VnZvHgMFfzXWXb
	PQOgRpi6/7fAmkkXKhsVrXVmXiyo+9EKDTMWPeecO4EV3IqbiAREoS+ZkXJiToqVtkxiXnebYlWXe
	+ypfOhn+caXOtnmiKHU0SODXGqly+yniKRFwE3rUNbsrB74IxzmfyQrxP9erRsqTg8Jcuf2cxxXT5
	WRzcisyP/n2AzeCmgntl5AjbaMSpgxtk5FF8cPHxms7c+MqqPqPdjdssLeHGgxDEDl7WzMdNr05vM
	Wc7ZCOEi+eLr6rfACqkla9AuuBrzjP6g5a35NEL6z8IvyWsS4DsFedrqMZRwwYjexzoZvD13045wB
	Jo8jNc2jRASgllX93RRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Lx5-00000004A3A-3gj5;
	Fri, 25 Oct 2024 15:10:11 +0000
Received: from mail-lf1-f52.google.com ([209.85.167.52])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4LbL-000000044vw-2ZuY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 14:47:45 +0000
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539f0f9ee49so2291740e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 07:47:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729867658; x=1730472458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fMcatHSssIzBAMp8NeTODM9A2XszLfMDJPzpLz8VH0Y=;
        b=F+WI3/uMX6QuDU4cmrYs1UW1H6zb0MA3M6wUYsmtq9qrPujgw0COHwO+4cQs8lMlk2
         lrFBT0GxkoA1NIIk39lZdvdNDfea+IVvTgH5l93Pd62EiE8cA5n5oSmqvqPuXY8mXbKn
         VY2e6X5YFz6GLwXptsWreA+kncxmSVJoiIAlShD1O+9fBJja4HZrVGk8m6LjhqcdPTqQ
         XzqdUwnGx8Ox67JCc7dFEtDPSisQzXNS/pSLjxe8JIItqper7v/HNfnlvqSSheGbwgzi
         fre1u6m8l2P9o7522oC6/ipw9hpsGm9D+PHNpcWKwSbcuLx5jfcbhR+SnfpjB+rDLfzR
         q08Q==
X-Forwarded-Encrypted: i=1; AJvYcCWx+YAYUEIM7OExRddYMAchq0h3FNL+anxi6CFFPNr7HaQ8qBaKQ1IuR+GRTxpycgv9/jkoNoaA//XPYeqVI70h@lists.infradead.org
X-Gm-Message-State: AOJu0YygV6gq1awocnM/+VuB2qqumYBQfvpHmJhWFgLteVzgUBZPOE2z
	ZAxkMJjGosEKjtjuLOH+9zvHdMAueRNxz2Bq3Gk/kcJKyoh9IZ/MPsNs+Y2J7H8=
X-Google-Smtp-Source: AGHT+IEFl4/1koM0pFqBZSTv2lejff9CMNfmefwOWKt+gxw8boLa+MeYG5MKa5/dsRgAU+t5lZqwmQ==
X-Received: by 2002:a05:6512:1314:b0:52f:d0f0:e37e with SMTP id 2adb3069b0e04-53b23e69b3dmr3830510e87.42.1729867658368;
        Fri, 25 Oct 2024 07:47:38 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e10a47asm206801e87.1.2024.10.25.07.47.38
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 07:47:38 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fb58980711so20883641fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 07:47:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVJfiTp7uAQmMZXhMZ6lI6yKBwrmuwwittdBYcCyFmxBWKuR1UdRpOw+LkEengky6zAHpSAM1jBjqrL16mRVN44@lists.infradead.org
X-Received: by 2002:a05:651c:50b:b0:2fa:dc24:a346 with SMTP id
 38308e7fff4ca-2fca82143ecmr39122861fa.21.1729867657676; Fri, 25 Oct 2024
 07:47:37 -0700 (PDT)
MIME-Version: 1.0
References: <129f0c754d071cca1db5d207d9d4a7bd9831dff7.1726773282.git.dsimic@manjaro.org>
 <bef0570137358c6c4a55f59e7a4977c4@manjaro.org>
In-Reply-To: <bef0570137358c6c4a55f59e7a4977c4@manjaro.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 25 Oct 2024 22:47:25 +0800
X-Gmail-Original-Message-ID: <CAGb2v66aody60h=Bpk49pxogq93FekmO48uThPET2RKxvx=OGw@mail.gmail.com>
Message-ID: <CAGb2v66aody60h=Bpk49pxogq93FekmO48uThPET2RKxvx=OGw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241025_074743_728429_ED3FF27F 
X-CRM114-Status: GOOD (  26.29  )
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

On Wed, Oct 23, 2024 at 5:11=E2=80=AFAM Dragan Simic <dsimic@manjaro.org> w=
rote:
>
> Hello,
>
> On 2024-09-19 21:15, Dragan Simic wrote:
> > The way InvenSense MPU-6050 accelerometer is mounted on the user-facing
> > side
> > of the Pine64 PinePhone mainboard, which makes it rotated 90 degrees
> > counter-
> > clockwise, [1] requires the accelerometer's x- and y-axis to be
> > swapped, and
> > the direction of the accelerometer's y-axis to be inverted.
> >
> > Rectify this by adding a mount-matrix to the accelerometer definition
> > in the
> > Pine64 PinePhone dtsi file.
> >
> > [1]
> > https://files.pine64.org/doc/PinePhone/PinePhone%20mainboard%20bottom%2=
0placement%20v1.1%2020191031.pdf
> >
> > Fixes: 91f480d40942 ("arm64: dts: allwinner: Add initial support for
> > Pine64 PinePhone")
> > Cc: stable@vger.kernel.org
> > Helped-by: Ondrej Jirman <megi@xff.cz>
> > Helped-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
> > Signed-off-by: Dragan Simic <dsimic@manjaro.org>
>
> Just a brief reminder about this patch...  Please, let me know if some
> further work is needed for it to become accepted.

Thanks.

There's no "Helped-by" tag, and checkpatch would complain. The closest
would be either Suggested-by or Co-developed-by, but with the latter
you would also need their Signed-off-by.

I can change it to Suggested-by if that's OK with you.


ChenYu

> > ---
> >
> > Notes:
> >     See also the linux-sunxi thread [2] that has led to this patch,
> > which
> >     provides a rather detailed analysis with additional details and
> > pictures.
> >     This patch effectively replaces the patch submitted in that thread.
> >
> >     [2]
> > https://lore.kernel.org/linux-sunxi/20240916204521.2033218-1-andrej.skv=
ortzov@gmail.com/T/#u
> >
> >  arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> > b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> > index 6eab61a12cd8..b844759f52c0 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> > @@ -212,6 +212,9 @@ accelerometer@68 {
> >               interrupts =3D <7 5 IRQ_TYPE_EDGE_RISING>; /* PH5 */
> >               vdd-supply =3D <&reg_dldo1>;
> >               vddio-supply =3D <&reg_dldo1>;
> > +             mount-matrix =3D "0", "1", "0",
> > +                            "-1", "0", "0",
> > +                            "0", "0", "1";
> >       };
> >  };
>

