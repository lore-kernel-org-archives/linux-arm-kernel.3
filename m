Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39481CA101C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 14:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=APKSuSS/fVxVxNIRz7xmQz/WCEFPilAmQiDv33UmZds=; b=rcPL/jX4dwdgf7khyul8GsOGTT
	xG1o3BsjqxlpBtvrvCbnyzGn2+uEcbVlWzY7R/sVVIqtnUFKQDV+oLfv6ijS3umD5WgkwgVUDYR57
	92ySqdqWfpxasdCYYn5g5YzcE6JLL/tQcIkANbSXCSetLbdBFPqJHwtLyRQdNN+QMDowsTaSog0NQ
	S2XbZx+aNFXeYWhM1J2ejjLSS1f0zHMtiAAB7omb+AhwtRoC8ZnH+Goldbj43alEQKh2woIz6gpZ8
	Q2wpukp+udCqKVFnv5tz+PxZ6XCs7Ci/dmd6ZV9h0DIWtgXsglh0dyOFe3cas3Hyzro4s1tj+9vVY
	+J1a3DzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utomE-00000006l9P-45TT;
	Wed, 03 Sep 2025 14:47:59 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utm6V-00000006IVw-390l
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 11:56:45 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-30ccec928f6so3050409fac.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 04:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1756900600; x=1757505400; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APKSuSS/fVxVxNIRz7xmQz/WCEFPilAmQiDv33UmZds=;
        b=QKNsEhXqr48iJsAKusFTRmGN2BNiAOxoRYZNLtAmisNdbaGwyN/v0i5xz0sPazegV4
         ICvnVmLeRFQ2kdgwt11BNT1nJIIrgDK15zbVN5kXY1DRTfGgqcOvaNpc5YzHsbcWV0PD
         lXOzio3Dlku9YyQcn88uLMtmIBvnoqPWyFwHOHa5J3xdeM5OVGrCr9hEULriPM356iQ7
         4YRetSwkar9wRQTcuwK7ZUDNUXjVRKDVUokkM4hHd34hsKxCMBd7PKfU0O2SCXCnVai4
         buzeskAbDeJbUuUNAtKnbCf3Ek5MvsAN1AWuOV+AW6PM897eLRqgjo2mDXFnDHXh5Zdf
         aKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756900600; x=1757505400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=APKSuSS/fVxVxNIRz7xmQz/WCEFPilAmQiDv33UmZds=;
        b=Pv9qSFKGkOQb08g/MQFPHdxiPqzaXbqGxc9VigWH8MrZDpFQx4mFH70AAgq2igpRML
         H2hmJCxQDduWdGDVqpMyJQ04U7zBYSClnqsLU9yMfCXy6WtQbkJ7Z/YOfsXZKABs16ZI
         tL9PjM7dHTWimVHDpW3zXntlXkUqKcH0jpm/afEvX8wGuCRiGr5boUqB4cjwE3qNwrFK
         Eqs1qjxn3pZrkEIuhIn97i8fhmaE9QbjFsKaFugSGa5vtzcbwCogmCWY6ecp5eQ37i8i
         7vCme6Oub7ytcElbli9sPmJKCn87MHfX+Q6hPLRroLQMBU9ZIgxkCCnBZBkCf0K0Jq+z
         x+HQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3aDHNgS05e0XHAh5AjPS/CvlHwgmVhJr8+2fHQZGfDs1ykngPk0H54hSaJCDPRuQNyp8wqjXc/RUln64flHq+@lists.infradead.org
X-Gm-Message-State: AOJu0YzmUjJeLN/BShV/o7bznbit38wK9CPfMvAXatOPDJDUrsQVQKAN
	b10PT2ShDnDwYYqQblkM6+8MmbCADlowSE/XlrIX+Dvi6XwLn4ZQ6I8+E661WQby+9Kr6gw8e8B
	H+nGbK/gk/7aMk5TWxgNQxvLEZOaFFF62ynmmd/q0KQ==
X-Gm-Gg: ASbGnctwZBT3hx+7NIKHcDNRrBwvzJQMfGLNDEfq9cAAK+Ea5XCa0OOnaF5n85PgHrA
	a6eLo2zngnNoasuhNBRQDPSL6gNKVKW0icqIrr2IG9lWrWBEXasef/tagjP73K5bUQwiF8XyfGq
	K2UJtjw3EC+zm1HIfFFcZDujl9yznlPozqRsPd80TLNXbAmeFcA2R3/2N25Z8f9e8nmAmf11+04
	qYYe9yf5ljuP1Kpvkha1JatMsNS4Z8=
X-Google-Smtp-Source: AGHT+IHzNG/bae/flkHEvpbYr0cWRiFGYBcRlfIUCA0hkHWscwORrD9erXClVYnAWO9a+v6BZHjoa+d3ZcNUM1a30FA=
X-Received: by 2002:a05:6871:3686:b0:314:b6a6:68a8 with SMTP id
 586e51a60fabf-31963480bf7mr6232182fac.48.1756900599934; Wed, 03 Sep 2025
 04:56:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250827100959.83023-1-cuiyunhui@bytedance.com>
 <20250827100959.83023-2-cuiyunhui@bytedance.com> <CAD=FV=WiZ5=4Ck3G2gme=ey6uYQhi-3Wo32DpLj9P53wxGCojw@mail.gmail.com>
 <CAEEQ3wmBvevbkP8XmwR0_q_1QWQsie5g0UUxTFm6ovS1m41pEQ@mail.gmail.com> <CAD=FV=UzUCPtwuQRFR0SkAkh63MbzMefxNYmiOBxCemL3P_+EQ@mail.gmail.com>
In-Reply-To: <CAD=FV=UzUCPtwuQRFR0SkAkh63MbzMefxNYmiOBxCemL3P_+EQ@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 3 Sep 2025 19:56:28 +0800
X-Gm-Features: Ac12FXxqD3B_4az_DfqpBxwMDURjxHr7LFapX1M6NDjnkBWeIMm-90QquXtdgEE
Message-ID: <CAEEQ3wmLOjZxVh_vBhmctH-u_ZSxnyg0GiN-_e_4v8_pfxcbSw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 1/2] watchdog: refactor watchdog_hld functionality
To: Doug Anderson <dianders@chromium.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, atish.patra@linux.dev, anup@brainfault.org, will@kernel.org, 
	mark.rutland@arm.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, catalin.marinas@arm.com, 
	masahiroy@kernel.org, suzuki.poulose@arm.com, maz@kernel.org, 
	zhanjie9@hisilicon.com, yangyicong@hisilicon.com, mingo@kernel.org, 
	lihuafei1@huawei.com, akpm@linux-foundation.org, jpoimboe@kernel.org, 
	rppt@kernel.org, kees@kernel.org, thomas.weissschuh@linutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_045643_780438_07178905 
X-CRM114-Status: GOOD (  24.20  )
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

Hi Doug=EF=BC=8C

On Wed, Sep 3, 2025 at 1:04=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Sun, Aug 31, 2025 at 10:57=E2=80=AFPM yunhui cui <cuiyunhui@bytedance.=
com> wrote:
> >
> > Hi Doug,
> >
> > On Sat, Aug 30, 2025 at 5:34=E2=80=AFAM Doug Anderson <dianders@chromiu=
m.org> wrote:
> > >
> > > Hi,
> > >
> > > On Wed, Aug 27, 2025 at 3:10=E2=80=AFAM Yunhui Cui <cuiyunhui@bytedan=
ce.com> wrote:
> > > >
> > > > Move watchdog_hld.c to kernel/, and rename arm_pmu_irq_is_nmi()
> > > > to arch_pmu_irq_is_nmi() for cross-arch reusability.
> > > >
> > > > Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> > > > ---
> > > >  arch/arm64/kernel/Makefile                   | 1 -
> > > >  drivers/perf/arm_pmu.c                       | 2 +-
> > > >  include/linux/nmi.h                          | 1 +
> > > >  include/linux/perf/arm_pmu.h                 | 2 --
> > > >  kernel/Makefile                              | 2 +-
> > > >  {arch/arm64/kernel =3D> kernel}/watchdog_hld.c | 8 ++++++--
> > > >  6 files changed, 9 insertions(+), 7 deletions(-)
> > > >  rename {arch/arm64/kernel =3D> kernel}/watchdog_hld.c (97%)
> > >
> > > I'm not a huge fan of the perf hardlockup detector and IMO we should
> > > maybe just delete it. Thus spreading it to support a new architecture
> > > isn't my favorite thing to do. Can't you use the buddy hardlockup
> > > detector?
> >
> > Why is there a plan to remove CONFIG_HARDLOCKUP_DETECTOR_PERF? Could
> > you explain the specific reasons? Is the community's future plan to
> > favor CONFIG_HARDLOCKUP_DETECTOR_BUDDY?
>
> I don't think there are any concrete plans, but there was some discussion=
 here:
>
> https://lore.kernel.org/all/CAD=3DFV=3DWWUiCi6bZCs_gseFpDDWNkuJMoL6XCftEo=
6W7q6jRCkg@mail.gmail.com/
>
> -Doug
>

I=E2=80=99ve read your linked content, which details the pros and cons of p=
erf
watchdog and buddy watchdog.
I think everyone will agree on choosing one as the default.
It seems there=E2=80=99s no kernel/watchdog entry in MAINTAINERS=E2=80=94wh=
at=E2=80=99s next
for these two approaches?

Thanks,
Yunhui

