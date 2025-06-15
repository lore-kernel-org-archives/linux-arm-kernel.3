Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C132EC71135
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Jun 2025 16:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jp7O6Jg1aWaKvBHu7wKcv8nngRfkIIG/oXFx1uRaGaE=; b=jFRGaZBR0lFPj/e1EGTqTfNZo5
	+3RaCZmKFNCL+ZAcoZFVN+3Wcadx1tOqKgsMnZkw6HIzxata5Du+GjYj2IgQaGN0brQWJf0bdYkAJ
	jTcvv3FxQ7qpEOFREUHEf3GIIefWOQxLJbuYAa32FzPRqIcX6K6bj1bpoG/bC+drQqEcA5izTyzkp
	0LkmvIpVUTRTkCurEPNpl870bxVNE91bRPJrJyWe1U4AF5jy4T0bViq1Rje+TRBGmxPSheVvze3cn
	KW0Fx2d1w1Oq5f1Va6utPI6WCIqKOhLYUQpvdAzsID69odLq024reAGeKChPgDDS4V4yXPvC/tpRQ
	97D/TwZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQq8h-00000002eMW-3kvv;
	Sun, 15 Jun 2025 16:23:23 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQq6V-00000002eGN-1EFO;
	Sun, 15 Jun 2025 16:21:08 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-4a4312b4849so45554231cf.1;
        Sun, 15 Jun 2025 09:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750004466; x=1750609266; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jp7O6Jg1aWaKvBHu7wKcv8nngRfkIIG/oXFx1uRaGaE=;
        b=FJUcfCztUEsRJB3dDjHCDLajC2oFCGdX9WtVynQCJkV0k36eljBjbcvxfgpu/1DQh6
         nSqhmvS1nIz7NWNYmdiA5k6Rf7Qt2mkdm5m+9hegMwMY7Frzw0l2YSLsD9TMmbYyrzCU
         5YbPEm8S1yKwhDiXVpl7zP9SrI5lJ2oCZ7S5B+24rjIV23yrrLcZqAGNCIhTA4umww4g
         nLykPdWKN7oeKmNPUQdTFqVXwVOHxQz7fzUXhd+WxUjEUs4vleeUR2J73c2bi1yM3ZzG
         +0JuFs9ISqBDHVvKoXpSDcujAS5N3OzQEAOBKSi6L1t7oMHLQ5l5+aqzIANOI6LQOHIl
         bifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750004466; x=1750609266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jp7O6Jg1aWaKvBHu7wKcv8nngRfkIIG/oXFx1uRaGaE=;
        b=bECSd9IK0CSgyKb4FciIL+/yaSbT+f/c2blX4Bf0w3rCnkZFhudWPfKycnBy+bd7ev
         0v4z3OPf1G7GBQsb2K8836Nc2T6VdlyIMAaAV7w9YXx1Nsh3YUaDZet5LZNoPzHC9CwU
         n/Ht0fRr67e+W+83IAEURRNj9uIkYQzP2mgyemYMaTNJtMXEfOCRStjIurxehPwSjE2w
         m+KDwj8xl/rZgPYOGWE3MRDfKTUI+B6g8JYsqSslYkAToytib4sfoNV1XieAqUnxdn7O
         oUqyM3YimV5dKfuEpmUa53eKCn1WAlZfKMfAc8tcob1PPIC9zgDGTelHd61vwrg6RC2q
         UcMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVx9evlw0rrAzeB/o+sTHk4Zq0UBlAGqj36vY9odtBnjNUikV1AH4IBfHaAeYV4Y254rngncLXpepEMent7YZ+T@lists.infradead.org, AJvYcCWuOz/s/GMS/47m1qoR1SzdYtr4uG8+mMrH/O3dw1Hb9RhY3fN+yOn33n2Y6b0jJ+2Plu/KuAW7hYIHbl4O9Wc=@lists.infradead.org
X-Gm-Message-State: AOJu0YybLf1zke5ygqAlk1H/vq3yqaBYgc3LbvFyLMGl3SushRC/pQwN
	MkkY2hiCvaebvMcFYEyWoV45qVpjnz6BAg3jaG769L2SBTzO8oQG54Qgf08NTRq19KM/TX2G1WW
	XqHHm0XNFAevTU5WEnTuOGV6ke+FpVC0=
X-Gm-Gg: ASbGncv4eYQ255ckQEQD9UzpfEBRdu3kHztbaKLocin4owRgRew2410QP+27jhqNp/U
	UqppffBwgcU/Xzqlun3yir1Fv5Rk5yc/p8Dub1XneWZf0GXzKlaLBcoiZ2+8nd2gWtHhxiBaAmx
	PiqZ3YArBA932of84bUz5STYJQL8gPpClX4Sd2QCp03tu/gg==
X-Google-Smtp-Source: AGHT+IFRUdBeIVHBLIhhVD74OXQUEBtMxUmA3npaAeY29ycZJNVeDhcqL4fcNY3KiRScIs0cAr7oIkSsjX57Jc/4Llk=
X-Received: by 2002:ac8:5cd2:0:b0:494:a148:b487 with SMTP id
 d75a77b69052e-4a73c47e332mr102634071cf.8.1750004466113; Sun, 15 Jun 2025
 09:21:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <20250603-sige5-updates-v1-1-717e8ce4ab77@gmail.com> <6656934.DvuYhMxLoT@workhorse>
 <CABjd4Yx05SCm+03jWbsEP-A5AuhL14wLj=+VdKyQgqMbnxi3xQ@mail.gmail.com>
 <512E950E-E8CB-443B-8E47-79F073D217E8@gmail.com> <CABjd4YxGQP=rH15EX12w36b7+82Dedf+rVH3v5V6gBwNv3V3iw@mail.gmail.com>
 <90218D7B-0CF5-4F5D-969A-909A44E6044F@gmail.com> <CABjd4Yw3FyVS0MBk2WdWKb24vkqrb09Tx3tj6B-xsmG1-Csk7w@mail.gmail.com>
 <80ACAAAE-F522-4199-9048-ADE69F6E1128@gmail.com>
In-Reply-To: <80ACAAAE-F522-4199-9048-ADE69F6E1128@gmail.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Sun, 15 Jun 2025 20:20:54 +0400
X-Gm-Features: AX0GCFvyfycTOtkz4ezDarF-FdHEZqxgkWW-GdCXjuH2q8WwDdHjjRYYdWxH-Gg
Message-ID: <CABjd4YwQrnoeFU5Nm8Vy-=rFW-tfQuzQfYi+B2zmBdj_=Qh6EQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: rockchip: list all CPU supplies on ArmSoM Sige5
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_092107_335897_BFAD7F8E 
X-CRM114-Status: GOOD (  27.77  )
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

On Sun, Jun 15, 2025 at 8:00=E2=80=AFPM Piotr Oniszczuk
<piotr.oniszczuk@gmail.com> wrote:
>
>
>
> > Wiadomo=C5=9B=C4=87 napisana przez Alexey Charkov <alchark@gmail.com> w=
 dniu 9 cze 2025, o godz. 16:05:
> >
> > On Sun, Jun 8, 2025 at 11:24=E2=80=AFAM Piotr Oniszczuk
> > <piotr.oniszczuk@gmail.com> wrote:
> >>> Wiadomo=C5=9B=C4=87 napisana przez Alexey Charkov <alchark@gmail.com>=
 w dniu 5 cze 2025, o godz. 15:42:
> >>>> Alexey,
> >>>> I see you are using rk3576 board like me (nanopi-m5)
> >>>> Have you on your board correctly working cpu dvfs?
> >>>> I mean: [1][desired clocks reported by kernel sysfs are in pair with=
 [2[]cur clocks?
> >>>> In my case i see mine cpu lives totally on it=E2=80=99s own with dvf=
s:
> >>>
> >>> Hi Piotr,
> >>>
> >>> I haven't tried to validate actual running frequencies vs. requested
> >>> frequencies, but subjective performance and power consumption seem to
> >>> be in line with what I expect.
> >>
> >> well - my subjective l&f is that  - currently - my rk3576 seems =E2=80=
=9Eslower" than i.e. 4xA53 h618.
> >
> > In my experience, native compilation of GCC 14 using 8 threads on
> > RK3576 (mainline with passive cooling and throttling enabled): 2 hours
> > 6 minutes, on RK3588 (mainline with passive cooling via Radxa Rock 5B
> > case and throttling enabled but never kicking in): 1 hour 10 minutes
>
> by curiosity i looked randomly on 3576 vs 3588:
> multithread passmark: 3675 (https://www.cpubenchmark.net/cpu.php?cpu=3DRo=
ckchip+RK3576&id=3D6213)
> multithread passmark: 4530 (https://www.cpubenchmark.net/cpu.php?cpu=3DRo=
ckchip+RK3588&id=3D4906)
>
> assuming 3588 as baseline, 3576 is approx 20% slower on multithread passm=
ark (has ~0,8 comp power of 3588)
> 70 min compile on 3588 should take something like ~86min on 3576.
> In your case 126min compile on 3576 shows 3576 offers 0,55 comp power of =
3588.
> Roughly 3576 should do this task in 40min less than you currently see i t=
hink
>
>
> > Can't see how u-boot would affect CPU speed in Linux, as long as you
> > use comparable ATF images. Do you use the same kernel and dtb in all
> > these cases? Also, what's your thermal setup?
>
> yes. in all cases only change was: uboot & atf
> thermal is based on recent collabora series (+ recent pooling fix for clo=
cks return from throttling)
>
> >
> >
> > Not sure UX is a particularly good measure of CPU performance, as long
> > as you've got a properly accelerated DRM graphics pipeline. More
> > likely 2D/3D and memory.
>
> indeed.
> For quantified look i=E2=80=99m looking on v.simple approach to estimate =
real clock is http://uob-hpc.github.io/2017/11/22/arm-clock-freq.html
> by curiosity i looked what it reports on a53/a55/a72/a76 and it is surpri=
singly accurate :-)
> on mine 3576 with collabora uboot+mainline atf is hows 800MHz (and in per=
f. gov it seems to be constant)
>
> >
> > There might be some difference in how PVTPLL behaves on RK3576 vs.
> > RK3588. But frankly first I would check if you are using comparable
> > ATF implementations (e.g. upstream TF-A in both cases), kernels and
> > thermal environment :)
>
> all tests: the same 6.15.2 mainline + some collabora patches
>
> diffs were:
> 1.collabora uboot[1] + mainline atf 2.13
> 2.collabora uboot[1] + rockchip rkbin bl31 blob
> 3.vendor uboot (bin dump from friendlyelec ubuntu image)
>
> on 1/2 i see kind of issue with clock values (i.e. perf gov gives constan=
t 800MHz on mainline atf).
> 3 seems to perform better - (i.e. perf gov gives constant 1500MHz so all =
is snappier/faster)
>
> as pvtpll is trying to reach target freq and ends with stable oper. freq =
for given cpu_vdd/temp/fab.cut - possible theory is: if cpu_vdd is wrongly =
driven, pvtpll programmed freq will way diff from req. (i.e. way too low).

It is an interesting line of thought. After all, RK3576 boards I
looked at use an I2C connected PMIC, while RK3588 use an SPI connected
one. If there is some bug in the I2C bus glue for the PMIC driver,  it
could theoretically report updated voltage without always updating it
properly.

I still believe it succeeds more often than not though, because I
observe measured power consumption of around 5W under full load vs.
around 1.4W in idle (on ArmSoM Sige5). Which doesn't rule out some
transient weirdness.

> monitoring vdd_big/vdd_lit shows constant 950mv for perf.gov (read from s=
ysfs; not verified with multimeter as i don=E2=80=99t have pcb pdf with com=
ponents layout so can=E2=80=99t identify i.e. vdd_big filtering caps c1007/=
c1008 to measure)

Measuring voltages to within 0.1V precision (not just resolution)
sounds like a big ask of a multimeter IMHO :)

Best,
Alexey

