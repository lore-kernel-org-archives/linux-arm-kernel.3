Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CC6C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 16:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9E/uzw/2mWDqrPKrh3O+mIF43zjnsnolCipqhB98e+4=; b=cpSK18Ce/YsMxdj6zrobIzQp1S
	53NsBlXCydD8b91uPspNicEo143HdnjqEHcYPSuQIRs3AcPcxK20oYUjfQJqqzEKYdwbeOrd81sxX
	cCbPtUhQT8G9C80obXsDgjXLmNUaLs4EpncziBlWQebr6ofP3mywdOMt/Sf3a1hkIBkBMy1GauNA9
	vMJOrZEuUa4y4TqBk+8JOBwR76jvKiY/+N+C6GB7iYmAkXa7a1hKOMsDqC7QugiD5nuxEPvjAzLAf
	RTz+AmMz+txr+hZNO6CnYPR6cv9AkRl7uWKD+qXm8im0W28N0YUg0DHXeJ8V5dzIlQEqdxGeGpv6u
	ooYW+5jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRvuY-0000000Akpw-1zcu;
	Wed, 18 Jun 2025 16:45:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRu5l-0000000AUk0-10OP;
	Wed, 18 Jun 2025 14:48:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9E/uzw/2mWDqrPKrh3O+mIF43zjnsnolCipqhB98e+4=; b=aZM/Fh6UvRNY8JQ3Wcgt5dFVhL
	neLzfRZV+BLno/RPfhMbXSLDzUS9QtcAZIHKJ/F14d8dnXKioFYkWJR9pIj2u6NWJzxe99Wq8XDxm
	HRTi3w4kmyC/IwoWVJUgyeEwrtx2YQqE7UPM/z1wciwqalmoSy5VNGdEF/Q4+azVgF11zIIUdX1jQ
	NkQBjabgDKttqrO5WwmA7Xgkt+74GgD7cArgX9z5UxKbAxviwtO3+F7yA9nMBB1TGECplDNqEROAy
	iB3FFNgpziPkIJq1ZEgIJEsS05nodLRvwypqhfJOHzg/TX+6wXMSEyBE+zD/637Zk76sLtSp514Pt
	1RUfKuvg==;
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRu5i-000000047Bs-3XCA;
	Wed, 18 Jun 2025 14:48:44 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-4a5a196f057so150621311cf.3;
        Wed, 18 Jun 2025 07:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750258119; x=1750862919; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9E/uzw/2mWDqrPKrh3O+mIF43zjnsnolCipqhB98e+4=;
        b=j7WFN/x+wM535P3c8DIkBJ44NKqpbe5RKTAHP67XaqCPP1XuSGLdL+cwZw82tVOa+p
         nKF9/DiW6WL6CqZdeaFIigazwU3glgiko3R3cPoVgAFleEV5yYhDvTF/fJI7sqU27Y3p
         F3aLCbKV82LHkTl6eRLeSkmo4dEy82wgQwprL1ABTHupqglgLI0MCJihdTnboNj561op
         2YD1tQ3AySi70yBSokSz1LaBo2Rwg5eNnv76t6LrpKF0vuCSFAl4npaJro0RUWTJV5Xz
         4QQ3GiT1GarTZw5PABLyi/8t43yLckmTDtb4eQPI4hwCmp685Vvr2U1I/2qZtDDtWdfB
         xQSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750258119; x=1750862919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9E/uzw/2mWDqrPKrh3O+mIF43zjnsnolCipqhB98e+4=;
        b=TRpNZIq/oRKkEA+35rfutH1aGqQZztZxYLG7jGbmrxyTNIkSNm0XacuYIb1fbhBjA0
         XDuwYX5ZcOgg8S+8UGy3z0bk+f6wRVGiwyAi3zhH5y/phw5uSeGZJ7wigTfOuhZs8jh6
         GGCsyt6f8Qzo37yYWKLE41SMp+0Qe+dSmdTwI5UajSCQXyJNJ1QBoWz67OVXXxKQfPE9
         A5IW1kV2LCtJrMSKvhs1wa0Hh4iMsYSlAHLn+JgBIfsbhDlcmA7MOdxkxYt5YLzT7qmn
         btEVfTJgTl3xGKuiUa8ny0tcW45q7IK5nwkSyC51azcZIcOuj69W89g36wZ9v1RBjsct
         5sDw==
X-Forwarded-Encrypted: i=1; AJvYcCW1uewIqAhzrShcHEgIg0VoPi8Th9FxYMUnVpZX6uEHjDX7JtufnP8t/VjdxPf9PZTD//koRFv+ZU17opgZfWtD@lists.infradead.org, AJvYcCXrnbuESCR3GFYjE4NPNzVBho9A0QMp/vcIFR4qBOIg7lLjLL3SFt1EfDD4J6Su3KIhw672kYxJnSTF5aXHWMQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwXM5F5nsAuOv2tNSsCq/CjxQS6YznMlveAhZMaQePbIlkQQfXa
	fVRA7tnf+ggnfwbtWlfLNkVa1vmOxcmQNmHgR0xmH4oNRs3UDkE2o3Z1i66tRcznvJXT+2hwNcq
	NLbF1vclGm3xdN4nE1OhW5bdqgM4OZDc=
X-Gm-Gg: ASbGncveDiT3K5/wlNwBA9Z4YMraZ9GSE1XsvR2GQO4agzS+R5QDfGYXzUa3KBSQKVI
	YkS9IbE1kYRWgOvtEt1qRUCf4h+wFwq7OdUELsl8DBX9usQO1j3oKHurVFQXPvzG142YJLWJrJd
	rkGiHw0E9Cnjt4OCG+WfBMk/HJE7hVISXc9DKMhk2O7lBZ
X-Google-Smtp-Source: AGHT+IEbIb82kGHtuh6ygsi/4BRy8ZstxcD/xdyUKnyNWJ/L/+rSBgep91TjG1bWb6qk0ezqJmvSXC+ZNxOtpoO/Vl0=
X-Received: by 2002:ac8:7d0e:0:b0:4a6:c5ea:6fc with SMTP id
 d75a77b69052e-4a73c5b0a8bmr237877781cf.42.1750258118686; Wed, 18 Jun 2025
 07:48:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <80ACAAAE-F522-4199-9048-ADE69F6E1128@gmail.com> <CABjd4YyVJv0NmF9LsGWQ-O44MGjT5=FFeUjbg5rJ6XkNgjxb+g@mail.gmail.com>
 <3286422.5fSG56mABF@workhorse>
In-Reply-To: <3286422.5fSG56mABF@workhorse>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 18 Jun 2025 18:48:27 +0400
X-Gm-Features: AX0GCFtn17PCAtrv2cU3B3JX5Fm9l__TWgBDoQ7i4VVK1BJdOUr0X0UJ246hzQw
Message-ID: <CABjd4Yy0rjET+TyA3pNGrzfKd1xKKG1AjWFFLsgb+mgDpu_TRg@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: rockchip: list all CPU supplies on ArmSoM Sige5
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	XiaoDong Huang <derrick.huang@rock-chips.com>
Cc: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_154842_937794_6CF32BDA 
X-CRM114-Status: GOOD (  44.53  )
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

On Wed, Jun 18, 2025 at 6:06=E2=80=AFPM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> Hello,
>
> +Cc Jonas Karlman as he is intimately familiar with RK3576 clock shenanig=
ans by now,
>
> On Wednesday, 18 June 2025 15:51:45 Central European Summer Time Alexey C=
harkov wrote:
> > On Sun, Jun 15, 2025 at 8:00=E2=80=AFPM Piotr Oniszczuk
> > <piotr.oniszczuk@gmail.com> wrote:
> > >
> > >
> > >
> > > > Wiadomo=C5=9B=C4=87 napisana przez Alexey Charkov <alchark@gmail.co=
m> w dniu 9 cze 2025, o godz. 16:05:
> > > >
> > > > On Sun, Jun 8, 2025 at 11:24=E2=80=AFAM Piotr Oniszczuk
> > > > <piotr.oniszczuk@gmail.com> wrote:
> > > >>> Wiadomo=C5=9B=C4=87 napisana przez Alexey Charkov <alchark@gmail.=
com> w dniu 5 cze 2025, o godz. 15:42:
> > > >>>> Alexey,
> > > >>>> I see you are using rk3576 board like me (nanopi-m5)
> > > >>>> Have you on your board correctly working cpu dvfs?
> > > >>>> I mean: [1][desired clocks reported by kernel sysfs are in pair =
with [2[]cur clocks?
> > > >>>> In my case i see mine cpu lives totally on it=E2=80=99s own with=
 dvfs:
> > > >>>
> > > >>> Hi Piotr,
> > > >>>
> > > >>> I haven't tried to validate actual running frequencies vs. reques=
ted
> > > >>> frequencies, but subjective performance and power consumption see=
m to
> > > >>> be in line with what I expect.
> > > >>
> > > >> well - my subjective l&f is that  - currently - my rk3576 seems =
=E2=80=9Eslower" than i.e. 4xA53 h618.
> > > >
> > > > In my experience, native compilation of GCC 14 using 8 threads on
> > > > RK3576 (mainline with passive cooling and throttling enabled): 2 ho=
urs
> > > > 6 minutes, on RK3588 (mainline with passive cooling via Radxa Rock =
5B
> > > > case and throttling enabled but never kicking in): 1 hour 10 minute=
s
> > >
> > > by curiosity i looked randomly on 3576 vs 3588:
> > > multithread passmark: 3675 (https://www.cpubenchmark.net/cpu.php?cpu=
=3DRockchip+RK3576&id=3D6213)
> > > multithread passmark: 4530 (https://www.cpubenchmark.net/cpu.php?cpu=
=3DRockchip+RK3588&id=3D4906)
> > >
> > > assuming 3588 as baseline, 3576 is approx 20% slower on multithread p=
assmark (has ~0,8 comp power of 3588)
> > > 70 min compile on 3588 should take something like ~86min on 3576.
> > > In your case 126min compile on 3576 shows 3576 offers 0,55 comp power=
 of 3588.
> > > Roughly 3576 should do this task in 40min less than you currently see=
 i think
> > >
> > >
> > > > Can't see how u-boot would affect CPU speed in Linux, as long as yo=
u
> > > > use comparable ATF images. Do you use the same kernel and dtb in al=
l
> > > > these cases? Also, what's your thermal setup?
> > >
> > > yes. in all cases only change was: uboot & atf
> > > thermal is based on recent collabora series (+ recent pooling fix for=
 clocks return from throttling)
> > >
> > > >
> > > >
> > > > Not sure UX is a particularly good measure of CPU performance, as l=
ong
> > > > as you've got a properly accelerated DRM graphics pipeline. More
> > > > likely 2D/3D and memory.
> > >
> > > indeed.
> > > For quantified look i=E2=80=99m looking on v.simple approach to estim=
ate real clock is http://uob-hpc.github.io/2017/11/22/arm-clock-freq.html
> > > by curiosity i looked what it reports on a53/a55/a72/a76 and it is su=
rprisingly accurate :-)
> > > on mine 3576 with collabora uboot+mainline atf is hows 800MHz (and in=
 perf. gov it seems to be constant)
> > >
> > > >
> > > > There might be some difference in how PVTPLL behaves on RK3576 vs.
> > > > RK3588. But frankly first I would check if you are using comparable
> > > > ATF implementations (e.g. upstream TF-A in both cases), kernels and
> > > > thermal environment :)
> > >
> > > all tests: the same 6.15.2 mainline + some collabora patches
> > >
> > > diffs were:
> > > 1.collabora uboot[1] + mainline atf 2.13
> > > 2.collabora uboot[1] + rockchip rkbin bl31 blob
> > > 3.vendor uboot (bin dump from friendlyelec ubuntu image)
> > >
> > > on 1/2 i see kind of issue with clock values (i.e. perf gov gives con=
stant 800MHz on mainline atf).
> > > 3 seems to perform better - (i.e. perf gov gives constant 1500MHz so =
all is snappier/faster)
> >
> > There is indeed something weird going on. I've tried running sbc-bench
> > [1], and even though I observe dynamically varying CPU frequencies
> > after boot with schedutil governor, once sbc-bench switches the
> > governor to "performance" and goes through the OPPs in descending
> > frequency order, the CPUs seem to get stuck at the last applied low
> > frequency. Even after max frequency gets reverted from 408 MHz to
> > something higher, even after I switch the governor to something else -
> > no matter what. Only a reboot gets the higher frequencies 'unstuck'
> > for me.
> >
> > These are all observed at around 55C SoC temperature, so throttling is
> > not an issue. Regulators are stuck at 950000 uV - way above 700000 uV
> > that the 408 MHz OPP requires (and power readings seem to match: I'm
> > getting about 2.3W consumption at 408 MHz in idle vs. normal idle
> > reading of 1.4W at around 1 GHz).
> >
> > Not sure what's going on here, and I don't remember seeing anything
> > similar on RK3588. Thoughts welcome.
>
> This may once again be a "accidentally uses wrong clock IDs" type
> situation. The other possibility is that we're getting confused
> between what we think the clock rate is and what SCMI actually set
> the clock rate to.
>
> Things to check is whether the right clock controller (scmi vs cru)
> and the right clock id (check ATF source for this) is used.

Clock IDs in the kernel seem to match those in ATF, but I've noticed
what appears to be a buffer overflow in some of the SCMI clock names
defined in the opensource TF-A (thanks GCC 15 and its zealous
warnings):

alchark@alchark-surface ~/trusted-firmware-a $ make
CC=3Daarch64-unknown-linux-gnu-gcc PLAT=3Drk3576 -j12
Building rk3576
  CC      plat/rockchip/rk3576/scmi/rk3576_clk.c
plat/rockchip/rk3576/scmi/rk3576_clk.c:1102:154: error:
initializer-string for array of =E2=80=98char=E2=80=99 truncates NUL termin=
ator but
destination lacks =E2=80=98nonstring=E2=80=99 attribute (17 chars into 16 a=
vailable)
[-Werror=3Dunterminated-string-initialization]
 1102 | stimer0_root, p_100m_24m, clk_stimer0_root_info,
&clk_scmi_ops_com_critical, rk3576_common_rates, false, true);
      |
                                              ^
plat/rockchip/rk3576/scmi/rk3576_clk.c:246:18: note: in definition of
macro =E2=80=98RK3576_SCMI_CLOCK_COM=E2=80=99
  246 |         .name =3D #_name,
         \
      |                  ^~~~~
plat/rockchip/rk3576/scmi/rk3576_clk.c:1103:154: error:
initializer-string for array of =E2=80=98char=E2=80=99 truncates NUL termin=
ator but
destination lacks =E2=80=98nonstring=E2=80=99 attribute (17 chars into 16 a=
vailable)
[-Werror=3Dunterminated-string-initialization]
 1103 | stimer1_root, p_100m_24m, clk_stimer1_root_info,
&clk_scmi_ops_com_critical, rk3576_common_rates, false, true);
      |
                                              ^
plat/rockchip/rk3576/scmi/rk3576_clk.c:246:18: note: in definition of
macro =E2=80=98RK3576_SCMI_CLOCK_COM=E2=80=99
  246 |         .name =3D #_name,
         \
      |                  ^~~~~
plat/rockchip/rk3576/scmi/rk3576_clk.c:1107:155: error:
initializer-string for array of =E2=80=98char=E2=80=99 truncates NUL termin=
ator but
destination lacks =E2=80=98nonstring=E2=80=99 attribute (17 chars into 16 a=
vailable)
[-Werror=3Dunterminated-string-initialization]
 1107 | ka_crypto_s, p_350m_175m_116m_24m, clk_pka_crypto_s_info,
&clk_scmi_ops_com, rk3576_common_rates, false, true);
      |
                                              ^
plat/rockchip/rk3576/scmi/rk3576_clk.c:246:18: note: in definition of
macro =E2=80=98RK3576_SCMI_CLOCK_COM=E2=80=99
  246 |         .name =3D #_name,
         \
      |                  ^~~~~
cc1: all warnings being treated as errors
make: *** [Makefile:1644:
/home/alchark/trusted-firmware-a/build/rk3576/release/bl31/rk3576_clk.o]
Error 1

And indeed, clock names such as "clk_stimer0_root" don't leave enough
space in .name for the null terminator (given that .name is defined as
char name[SCMI_CLOCK_NAME_LENGTH_MAX]; a.k.a. 16).

Not sure if the binary BL31 has a similar issue and if it can lead to
the observed weirdness in CPU frequency switching. Looping in XiaoDong
Huang who last touched those lines in the opensource TF-A - any
insights would be much appreciated!

Thanks a lot,
Alexey

