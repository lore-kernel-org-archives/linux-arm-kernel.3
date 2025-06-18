Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DCFC7115E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 17:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sjpDqdUdnROUzOr37FSSwpzItdKuL53Ug5lBdtcujlI=; b=wQs8rYb99t3OYkhlbA/4RGJKnm
	3IV5F9KjBew1yviHgUhS6mcFcuAi5WgBSkZcjdVc7bSaqm4W7DJ4KLgtGWvSNF4Faf1dSE5JS+rJ0
	BgsJY1eYl/pfKygw+NvqO9yNtTWkJqGaRKAbOmcmkkIbnMd0ZUNTBReK3PZlHvOg9Lm8cnei68G0+
	WsfgHHJgq5pAS7L3URHWEFE4LMlkm3TEYsd8kPbkuTxFoPBto5pIG76j32NDVxc31IFqWDm0GlXOo
	4VtpRTtOYxk0XPE/WYmMqliVfhnSUc2lj09ou41XRJc2N1TkTAHNckHETdwMdgVJcaFRxOBSZBldT
	fRMCTJoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRwAZ-0000000AnZO-3f29;
	Wed, 18 Jun 2025 17:01:51 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRtQs-0000000AOBo-0Khc;
	Wed, 18 Jun 2025 14:06:31 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1750255583; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UJT88ereqHexP126cH3BC60Ftrjp3MqaeRhOmqhcCwuQnxgVIIJAhsOQ1++RlHCmrnLJDj/lhBtBkjpJFTpZGKVnPq/ZG3SQqKEbqPbpXhRK3o2ym1wkv5s0rlaph8qAzRi7Y4y269Scq+BUlZTZcNVkQCql3r07e1qGoWADdWU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750255583; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=sjpDqdUdnROUzOr37FSSwpzItdKuL53Ug5lBdtcujlI=; 
	b=JII/6iHx9yKHuGNiWQYYxDWPsmXw2P8ma8rlDb+hPXjBdxY5tYLNZoRN11EvF+2l53WIxzSX+7/zpwHvt7r8ix5cvHZ+qHDwsObCKtP+T1aM6qXAUF2uT+IPCAWDX4Qa3AQkQ6ZFODJ5oOCvW7EclKrc7cuvGr42dgCuhlgyMvc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750255583;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=sjpDqdUdnROUzOr37FSSwpzItdKuL53Ug5lBdtcujlI=;
	b=KWKb9dyTTnE8TqT/+lG8I+cGzN4Z+SU2LVX/YPXnJA3oYWZzFxosbiZ7Mp2hPTwM
	2Y1wICXd9BawbTKCnENdQkVfLx27cEEsXOnvUrRWQlVkjnmgbqv51XXzr11PgIcqFvU
	7QLRs7lRFhhaKjUpPGZhAisMQIF8c3LDsBMZgL8g=
Received: by mx.zohomail.com with SMTPS id 1750255580611190.85093936823102;
	Wed, 18 Jun 2025 07:06:20 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>,
 Alexey Charkov <alchark@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH 1/4] arm64: dts: rockchip: list all CPU supplies on ArmSoM Sige5
Date: Wed, 18 Jun 2025 16:06:16 +0200
Message-ID: <3286422.5fSG56mABF@workhorse>
In-Reply-To: <CABjd4YyVJv0NmF9LsGWQ-O44MGjT5=FFeUjbg5rJ6XkNgjxb+g@mail.gmail.com>
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <80ACAAAE-F522-4199-9048-ADE69F6E1128@gmail.com>
 <CABjd4YyVJv0NmF9LsGWQ-O44MGjT5=FFeUjbg5rJ6XkNgjxb+g@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_070630_204312_AA71A080 
X-CRM114-Status: GOOD (  35.60  )
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

Hello,

+Cc Jonas Karlman as he is intimately familiar with RK3576 clock shenanigan=
s by now,

On Wednesday, 18 June 2025 15:51:45 Central European Summer Time Alexey Cha=
rkov wrote:
> On Sun, Jun 15, 2025 at 8:00=E2=80=AFPM Piotr Oniszczuk
> <piotr.oniszczuk@gmail.com> wrote:
> >
> >
> >
> > > Wiadomo=C5=9B=C4=87 napisana przez Alexey Charkov <alchark@gmail.com>=
 w dniu 9 cze 2025, o godz. 16:05:
> > >
> > > On Sun, Jun 8, 2025 at 11:24=E2=80=AFAM Piotr Oniszczuk
> > > <piotr.oniszczuk@gmail.com> wrote:
> > >>> Wiadomo=C5=9B=C4=87 napisana przez Alexey Charkov <alchark@gmail.co=
m> w dniu 5 cze 2025, o godz. 15:42:
> > >>>> Alexey,
> > >>>> I see you are using rk3576 board like me (nanopi-m5)
> > >>>> Have you on your board correctly working cpu dvfs?
> > >>>> I mean: [1][desired clocks reported by kernel sysfs are in pair wi=
th [2[]cur clocks?
> > >>>> In my case i see mine cpu lives totally on it=E2=80=99s own with d=
vfs:
> > >>>
> > >>> Hi Piotr,
> > >>>
> > >>> I haven't tried to validate actual running frequencies vs. requested
> > >>> frequencies, but subjective performance and power consumption seem =
to
> > >>> be in line with what I expect.
> > >>
> > >> well - my subjective l&f is that  - currently - my rk3576 seems =E2=
=80=9Eslower" than i.e. 4xA53 h618.
> > >
> > > In my experience, native compilation of GCC 14 using 8 threads on
> > > RK3576 (mainline with passive cooling and throttling enabled): 2 hours
> > > 6 minutes, on RK3588 (mainline with passive cooling via Radxa Rock 5B
> > > case and throttling enabled but never kicking in): 1 hour 10 minutes
> >
> > by curiosity i looked randomly on 3576 vs 3588:
> > multithread passmark: 3675 (https://www.cpubenchmark.net/cpu.php?cpu=3D=
Rockchip+RK3576&id=3D6213)
> > multithread passmark: 4530 (https://www.cpubenchmark.net/cpu.php?cpu=3D=
Rockchip+RK3588&id=3D4906)
> >
> > assuming 3588 as baseline, 3576 is approx 20% slower on multithread pas=
smark (has ~0,8 comp power of 3588)
> > 70 min compile on 3588 should take something like ~86min on 3576.
> > In your case 126min compile on 3576 shows 3576 offers 0,55 comp power o=
f 3588.
> > Roughly 3576 should do this task in 40min less than you currently see i=
 think
> >
> >
> > > Can't see how u-boot would affect CPU speed in Linux, as long as you
> > > use comparable ATF images. Do you use the same kernel and dtb in all
> > > these cases? Also, what's your thermal setup?
> >
> > yes. in all cases only change was: uboot & atf
> > thermal is based on recent collabora series (+ recent pooling fix for c=
locks return from throttling)
> >
> > >
> > >
> > > Not sure UX is a particularly good measure of CPU performance, as long
> > > as you've got a properly accelerated DRM graphics pipeline. More
> > > likely 2D/3D and memory.
> >
> > indeed.
> > For quantified look i=E2=80=99m looking on v.simple approach to estimat=
e real clock is http://uob-hpc.github.io/2017/11/22/arm-clock-freq.html
> > by curiosity i looked what it reports on a53/a55/a72/a76 and it is surp=
risingly accurate :-)
> > on mine 3576 with collabora uboot+mainline atf is hows 800MHz (and in p=
erf. gov it seems to be constant)
> >
> > >
> > > There might be some difference in how PVTPLL behaves on RK3576 vs.
> > > RK3588. But frankly first I would check if you are using comparable
> > > ATF implementations (e.g. upstream TF-A in both cases), kernels and
> > > thermal environment :)
> >
> > all tests: the same 6.15.2 mainline + some collabora patches
> >
> > diffs were:
> > 1.collabora uboot[1] + mainline atf 2.13
> > 2.collabora uboot[1] + rockchip rkbin bl31 blob
> > 3.vendor uboot (bin dump from friendlyelec ubuntu image)
> >
> > on 1/2 i see kind of issue with clock values (i.e. perf gov gives const=
ant 800MHz on mainline atf).
> > 3 seems to perform better - (i.e. perf gov gives constant 1500MHz so al=
l is snappier/faster)
>=20
> There is indeed something weird going on. I've tried running sbc-bench
> [1], and even though I observe dynamically varying CPU frequencies
> after boot with schedutil governor, once sbc-bench switches the
> governor to "performance" and goes through the OPPs in descending
> frequency order, the CPUs seem to get stuck at the last applied low
> frequency. Even after max frequency gets reverted from 408 MHz to
> something higher, even after I switch the governor to something else -
> no matter what. Only a reboot gets the higher frequencies 'unstuck'
> for me.
>=20
> These are all observed at around 55C SoC temperature, so throttling is
> not an issue. Regulators are stuck at 950000 uV - way above 700000 uV
> that the 408 MHz OPP requires (and power readings seem to match: I'm
> getting about 2.3W consumption at 408 MHz in idle vs. normal idle
> reading of 1.4W at around 1 GHz).
>=20
> Not sure what's going on here, and I don't remember seeing anything
> similar on RK3588. Thoughts welcome.

This may once again be a "accidentally uses wrong clock IDs" type
situation. The other possibility is that we're getting confused
between what we think the clock rate is and what SCMI actually set
the clock rate to.

Things to check is whether the right clock controller (scmi vs cru)
and the right clock id (check ATF source for this) is used.

Kind regards,
Nicolas Frattaroli

>=20
> Best regards,
> Alexey
>=20
> [1] https://github.com/ThomasKaiser/sbc-bench
>=20





