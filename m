Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75AA4CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 21:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n7Rb+Gc4bzsX0WrGoFt7okZVsdi4ux/eNHzNp2DsalU=; b=sq/JEpTyWQrXk4gfx4aZSbhmPW
	8QngR4rqaK5BGx/NlvDDWmBY1PT/ZzKYuj/e2VOS6YtVbcRNqe4DATQvjBN+Sy42/aS4igXUmbT7K
	aqmuKkPWF7wi3wzAb8cIDvtXmB9gZtCwJO2T3M1oPYWmbuwcn7d/sTvLKENT9VXfmVKk8BV3WLF5z
	d4mD9OUYuU/IBP9XV/VZkYqxPeO86FlqJMgi0CXHV2Q1B1QNN3EzVXKUpNlrmV89HvwQaOeGRJbuZ
	rWsJrt4C6Z0dfwcU+rg3HwWXyyt70pbXNsmFRbOTAuOWVsrDUQ37LiS/hbFlngMgoBaP7bAUFJOuk
	G00+pzyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYo6-00000002DEl-19KW;
	Tue, 02 Sep 2025 21:44:50 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utUQX-000000016HM-0IAT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 17:04:14 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7724cacc32bso2127197b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 10:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756832650; x=1757437450; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n7Rb+Gc4bzsX0WrGoFt7okZVsdi4ux/eNHzNp2DsalU=;
        b=J3BmKZ6HZ3D1U6Un+pRncdik4k7h/kJYyzOg5YFJKP8y9Xw76T+jPEQua97DSsmMQe
         HfFm2qcQKyT6Z8aKYKR0wvcyDhY4iJzhoRv9dnI/mT32N3T8MgHQ7M7zfCvQ9xrMVrSM
         XLXWBE8gC82acLo0UVQXChonyfOw+74bv5Na0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756832650; x=1757437450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n7Rb+Gc4bzsX0WrGoFt7okZVsdi4ux/eNHzNp2DsalU=;
        b=VJr4owq/3KDdmQtG9w4205R9uaL7St2Sl3bz+AaW5InxJvOeAqYHbfofzIz8S4KNfj
         BC3qbKnO52eMwcm3cD1Ov/YBcq3CUFPsdLST6eRHuab+kTqlv+jUsj1+1mgWZOkK/cyx
         BQucAqvoQ1YCN/7jkyaTtXkbgNSTmsrpgrGty6v1MCrcRDdEOiHByDCvo/S4aN8pau4D
         Azkp89SVqJKDgu390rdKR2rkSDIIyFN1iIRlqTD/rcHycYoQnjyogPenIE99Dc7ptiJ6
         KXcxWrXHKkXXOWjszHiWsoOgm3OdQxXmyDNBmlpJ7KZAc4V1CwnKPUR+07aQ5dMA3rBC
         GgyA==
X-Forwarded-Encrypted: i=1; AJvYcCUB1rbUQSw9s+trZMvIsNllH0WEKoa07b1R34LmjzhGcM0MB8qDlO8yNj42exigQRYz0+Ca8wt5plB3CiKiYg0M@lists.infradead.org
X-Gm-Message-State: AOJu0YzAaBF9Cti5Qz/gmyrUxHFKILzliyjQ6Mo6b4iSYciNDCQg7n9p
	YdFFEq2S9MPwc5Sv76AfxW7atDb1hIMLznlA95B+HXOaJaKw82I1Kcl+Pkv++EIYgEGmXA3YU5F
	EOxc=
X-Gm-Gg: ASbGncvdFDSe1/s23w6FyPMhADjP152ActoQmtm3IPBA93P2kjLObobbJJyzfTBvISq
	u8hPjd6PobWjNY3ENgTmlLXTjvTikKPHrK9PaZiIufSgo6bMRxxuoGD2SCACVvvy2X7Q/P4YRom
	CO4XM/YeVNdeOuxDOyauyux8aldpoFzJ0k3mPCvHKlJMt1J3E/MaPEMw3XfzD8HVPD0x1+d111g
	RHpSsxJkCKmGPr/SWgDi3cCxNA97jjI0PgjheAh/JdE2K4TeJw0W4viOiw+V+/HTI1aK1ipX5Qx
	ljB7015lkWbU7j5Nsf0t2rH8aD0JL1N2jwVAEYBfWMHtCeaJtq+nv4tQWqmk9+tkazvp3eHxPig
	exLxfLnlJzdxDubEhMZWUbhpDJ+MoAFr3XxYYXLHBIxdrjEvRs+zPYv32QMw9eh8LqBRJAQNTtp
	3Y
X-Google-Smtp-Source: AGHT+IG0BaNIVPDR7FfZJvyiOGPCoPZopmgn1ujG4nteHm1tv30NpPEoADGrxdxfnVSC0YYQ8kfCDA==
X-Received: by 2002:a05:6a20:42a3:b0:243:78a:827a with SMTP id adf61e73a8af0-243d6f59555mr16664059637.50.1756832649780;
        Tue, 02 Sep 2025 10:04:09 -0700 (PDT)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com. [209.85.215.174])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77248cfbc9esm9236843b3a.99.2025.09.02.10.04.07
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 10:04:07 -0700 (PDT)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b4f9d61e7deso390703a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 10:04:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWKWE0FscDC7qVBWnNRPs5g0iNmtngOen5J03qEe0XECfTd0IXnsIeMUr7HX20KgnMhFJlVs7vqSz9Z33lGnrOz@lists.infradead.org
X-Received: by 2002:a17:903:384b:b0:240:84b:a11a with SMTP id
 d9443c01a7336-249448f24abmr161721465ad.17.1756832646700; Tue, 02 Sep 2025
 10:04:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250827100959.83023-1-cuiyunhui@bytedance.com>
 <20250827100959.83023-2-cuiyunhui@bytedance.com> <CAD=FV=WiZ5=4Ck3G2gme=ey6uYQhi-3Wo32DpLj9P53wxGCojw@mail.gmail.com>
 <CAEEQ3wmBvevbkP8XmwR0_q_1QWQsie5g0UUxTFm6ovS1m41pEQ@mail.gmail.com>
In-Reply-To: <CAEEQ3wmBvevbkP8XmwR0_q_1QWQsie5g0UUxTFm6ovS1m41pEQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 2 Sep 2025 10:03:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UzUCPtwuQRFR0SkAkh63MbzMefxNYmiOBxCemL3P_+EQ@mail.gmail.com>
X-Gm-Features: Ac12FXykSrYm05H2zP7oRG7JrK-8ugSYBV29nSAU-8Tvd7BMAeSBbf3oz6aTBn8
Message-ID: <CAD=FV=UzUCPtwuQRFR0SkAkh63MbzMefxNYmiOBxCemL3P_+EQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 1/2] watchdog: refactor watchdog_hld functionality
To: yunhui cui <cuiyunhui@bytedance.com>
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
X-CRM114-CacheID: sfid-20250902_100413_105005_768F8A79 
X-CRM114-Status: GOOD (  22.59  )
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

Hi,

On Sun, Aug 31, 2025 at 10:57=E2=80=AFPM yunhui cui <cuiyunhui@bytedance.co=
m> wrote:
>
> Hi Doug,
>
> On Sat, Aug 30, 2025 at 5:34=E2=80=AFAM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Wed, Aug 27, 2025 at 3:10=E2=80=AFAM Yunhui Cui <cuiyunhui@bytedance=
.com> wrote:
> > >
> > > Move watchdog_hld.c to kernel/, and rename arm_pmu_irq_is_nmi()
> > > to arch_pmu_irq_is_nmi() for cross-arch reusability.
> > >
> > > Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> > > ---
> > >  arch/arm64/kernel/Makefile                   | 1 -
> > >  drivers/perf/arm_pmu.c                       | 2 +-
> > >  include/linux/nmi.h                          | 1 +
> > >  include/linux/perf/arm_pmu.h                 | 2 --
> > >  kernel/Makefile                              | 2 +-
> > >  {arch/arm64/kernel =3D> kernel}/watchdog_hld.c | 8 ++++++--
> > >  6 files changed, 9 insertions(+), 7 deletions(-)
> > >  rename {arch/arm64/kernel =3D> kernel}/watchdog_hld.c (97%)
> >
> > I'm not a huge fan of the perf hardlockup detector and IMO we should
> > maybe just delete it. Thus spreading it to support a new architecture
> > isn't my favorite thing to do. Can't you use the buddy hardlockup
> > detector?
>
> Why is there a plan to remove CONFIG_HARDLOCKUP_DETECTOR_PERF? Could
> you explain the specific reasons? Is the community's future plan to
> favor CONFIG_HARDLOCKUP_DETECTOR_BUDDY?

I don't think there are any concrete plans, but there was some discussion h=
ere:

https://lore.kernel.org/all/CAD=3DFV=3DWWUiCi6bZCs_gseFpDDWNkuJMoL6XCftEo6W=
7q6jRCkg@mail.gmail.com/

-Doug

