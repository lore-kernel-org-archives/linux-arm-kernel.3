Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F536D5CCBC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 15:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q3SORIHMVqx8TfNrC5y4XM03obScQJi2qO4kv74Sacw=; b=aK3hYoJ1sRMxVYCauivWaAB6QS
	r16fe2/HQ2RGsvoWhD6u9HoFiH8Apt9DLyg8xCetMYnZZq/hRgnkPRtRERUBcspm9gmLeO7GnbWIm
	uVbB8Bxe39ny/HwbD95zy7w1JZXVs7ymc1EGmUfBK84lfcGZh7eCzRL5+aS5htyWYIls5gneUYd6M
	qayXKt5gauIv4OSLLUC0QcghaGiXWNBAWLaxdBNGoXRaKLW+sWnaSH/pcW2gEbebsvIL3pnkaUeNw
	NcMGVVK1UjIWjR9khIGdDGcu8F7Rg0Qp6LxNSvYmeCxqHMHY314EVGZP9d9Zrp/q8L5lZ7frH5Ui/
	YwZTdbRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6AUp-00000000qcg-0aUv;
	Wed, 30 Oct 2024 15:20:31 +0000
Received: from mail-oa1-f51.google.com ([209.85.160.51])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ASF-00000000pjE-2AeC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 15:17:53 +0000
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2689e7a941fso3875018fac.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 08:17:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730301468; x=1730906268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q3SORIHMVqx8TfNrC5y4XM03obScQJi2qO4kv74Sacw=;
        b=ZfRcBJgM7Z7LT82MWar/vFQ57sPaYxLJQswDzOoHjw2YP0/8mUlNOFBqSN74cJO2xd
         qfexYhdllNlT2kUUSSCpFxJcSnzbmp/C/O/ehep47jYD3fvautt9GkNPCWm6IQ9QlpSn
         xL/mC5+qHxXvT2V5ulon9VZ5VVcef4w7PvDfGEYo4Mw7lJbLbyUiOP+84w74N0mSNocs
         m9UziZOYiq/XJOM7lGvkotP4U7M/zJjuDAGNdOuKKAdXh6L/1vw6QEQRsitsKHJax7SE
         DYjqcZfs34DI2ZtGL47rAkaYYne0OHbhDWeFpi4hGZh39wuuRzeLOhikxqo8rfBWYo1q
         91fA==
X-Forwarded-Encrypted: i=1; AJvYcCXKCpN3YizMQyC7pynMPUENuuY3RUFxSfFtOBsSAxnSP0x/plzLiR7CPHBvRIIPiQdiVZYtb41uL4/uYeL5B6Xg@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7aF4qqS7MmtIWqJ7fphiZfN/GYFONgRISLkjbcDKCgnrnZfge
	XfOVLa5HLyjuVJzfYXtA5KZKFYT5I1g5wsYD1zWoIfX2Kk7xXKzvETgPdMxu
X-Google-Smtp-Source: AGHT+IHx+UwWH9egjc0laTKCcEje6dFcL1iGPX4GoSdYG0uu6u5ktMoNpJibURLPwHC/KPCTzmSa/A==
X-Received: by 2002:a05:6870:64a4:b0:288:9848:92b0 with SMTP id 586e51a60fabf-29051db5d3amr14276772fac.39.1730301468475;
        Wed, 30 Oct 2024 08:17:48 -0700 (PDT)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com. [209.85.167.173])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-29035d211dcsm3459344fac.3.2024.10.30.08.17.47
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 08:17:48 -0700 (PDT)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3e5fef69f2eso3888515b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 08:17:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWoWk3HHJ6Aip0MtrjVxTGp+UgrIFnzAOGTTkl4H99ZfH+h5WyVntS63ESI5TbMFQQXe6yx1Vj4Ip9NsthIgoWa@lists.infradead.org
X-Received: by 2002:a05:6808:2391:b0:3e5:f4fa:5984 with SMTP id
 5614622812f47-3e63848f05emr14700373b6e.38.1730301467588; Wed, 30 Oct 2024
 08:17:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAMuHMdX-1bBphfFmEy708MeBePb2pF6rWj0xOjR4d9S-KVgA3A@mail.gmail.com>
 <CAOCHtYgRD_HTD1F-5+CQ3H1PK3Lbhb-ZdyqDYp3wN2wRK5vOUA@mail.gmail.com>
In-Reply-To: <CAOCHtYgRD_HTD1F-5+CQ3H1PK3Lbhb-ZdyqDYp3wN2wRK5vOUA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Oct 2024 16:17:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXcJ=Bbm2JF_gWigWwvtPzf-g6VRYy-kd53CBd_0jt+7A@mail.gmail.com>
Message-ID: <CAMuHMdXcJ=Bbm2JF_gWigWwvtPzf-g6VRYy-kd53CBd_0jt+7A@mail.gmail.com>
Subject: Re: BeagleBone Black Ethernet PHY issues
To: Robert Nelson <robertcnelson@gmail.com>
Cc: ext Tony Lindgren <tony@atomide.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Roger Quadros <rogerq@kernel.org>, 
	"open list:TI ETHERNET SWITCH DRIVER (CPSW)" <linux-omap@vger.kernel.org>, netdev <netdev@vger.kernel.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_081751_622282_0B46A52E 
X-CRM114-Status: GOOD (  18.50  )
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

Hi Robert,

On Wed, Oct 30, 2024 at 4:00=E2=80=AFPM Robert Nelson <robertcnelson@gmail.=
com> wrote:
> On Tue, Oct 29, 2024 at 12:18=E2=80=AFPM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > During the last few months, booting kernels on BeagleBone Black
> > sometimes fails with:

> What revision of the board do you have, Bx, Cx, etc.

This particular one is a C3.

> Only C3 has the new PCB with the phy 'reset' gpio line.

Indeed.

> https://openbeagle.org/beagleboard/beaglebone-black/-/blob/master/BBB_SCH=
.pdf?ref_type=3Dheads
>
> For pre-C3 boards, removing "C24" has fixed a large percentage of my
> boards in my ci test farm, while it's not a perfect fix as some still
> fail..

Yeah, C24 affects reset delay, too. But Rev. C3 does not have it
mounted.  My Rev. C (no known issues) should have it, and Rev. A5C
(the one that sometimes needs a manual reset after power-up) has only
1=C2=B5F instead of 2.2=C2=B5F.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

