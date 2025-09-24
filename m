Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F42CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 15:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AGkkH3On4e9g/uKbOlSYkJKHveGl2HpttCc7mFGVIhA=; b=nOxG6gxviEABteCVs8ctEitw2T
	kfEUC2YJ3Hu2MRb7mkZ/nB37mpyf8rRJZ03QUBfuUBQ238aG9Zo8LhqV4gePUz/SDRkJRljjyS/iw
	SykuoEF2yvAii6aiC4ZCC3gVsHitN2dqUo9NR0iaAohvX5jitxelEsoqRmENDXo4zfUAEiFdKqMap
	86KzWMhX/w37a4+x5BifGbwjlCKjP8vTZah8ug9NizNB7KuddB6UOii/TE+3vlpL13oUoHTWI78Jl
	LQDIonMDvoiiEScbs9agnuoH29dUnLfyOOTLEuCVpuIOy5Z3DsMqhHesMs23fQA1ZgwWdelfJiEhe
	IXuXYwFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1RKM-00000001ByW-1NXa;
	Wed, 24 Sep 2025 15:22:42 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1RKJ-00000001BuJ-0OcJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 15:22:41 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-77e87003967so2855219b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 08:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758727356; x=1759332156; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AGkkH3On4e9g/uKbOlSYkJKHveGl2HpttCc7mFGVIhA=;
        b=do3KsaJeuLF6NtY5s98xTARdq31/vv/L8HzT4fjzjBEIVrO8JaLn+vTEY7mlKlIGEF
         57Okhp56pkZXWQVah2E7bY9rWB+qBqBzBwDA2K5xOYT1gwoK9var7CtHmg3yBerhj+LO
         2JKTD0ZzioyxxT39Zu7F02A4sS1H/tRjGkJfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758727356; x=1759332156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGkkH3On4e9g/uKbOlSYkJKHveGl2HpttCc7mFGVIhA=;
        b=P+vPJuL6ViaeMO6+jyQnMOHmTTgORptskKeTl2Paf7JElPos6bU4aylYw9Gq1paNT2
         Myi0gunHBJBNpxxHoBbffCmjlMFbxE4WqlO9p6NuQ9iNnF+pxF7jR5NDHajufqwNyQ2V
         iC0olfCSDV39lpljIDtO8dEb/Zt1JimTijfENVTrP8Hnu7/T7RkeIGdeDldBop0orj30
         KlbqgKtAf3rFeblJrF/kH96fPT7eiDl2hpzxWxUNZfGxSvb6UI5MkBMTkbzLgG+w7s+a
         1T1OCom5UfA6Sj0dXDlvS7lUPl1iArIt9FMb3HO/rHOYuMKMv4etHZ89S0CE8fnU7yLh
         6OZw==
X-Forwarded-Encrypted: i=1; AJvYcCVg4tCrOZX2FQBckiETPF+lei72t6h8+5oLaIijTEDlrO85GvFOqcWNy+KwLY8AjjOWVgxU8CYcq2+NjdYgQIbK@lists.infradead.org
X-Gm-Message-State: AOJu0YzBZqXWqkMjjBP9d3YwOhdyOXDH0NZJwKMwt/5R3zEJ143J3KbY
	kzIQT+az2dHEvB48RnJd+7qwPMknwPODHMWFnwI51zSbIvigRV1u8pVP+9CFnNcIoBXr2vDz/uY
	qoXw=
X-Gm-Gg: ASbGncvhJ+OzYqQvszccWUVxeDG0zI7ed331k2WtGgi1as/iJrysl+4Wh0lyXW1Tn5Z
	a3mSh4WqWy4LoOcOshIvtlRVaHHo+42q77TRezfpuu1hIvUSBOjbk41NiWXZf4Bj966JQneWJnU
	BUv5cz5EKxHKayVDnhougfjCkKCwz018TKyjc6IwPw430A57tRuYeiAvNERjftJlRLdAflq7uHd
	MUk31sfE9kZ2QDwrQVAJ3YnrG+ajDpylgV0YbsQkWIJlmYbVoxk57AXdAN2ik3R73i/ISXnvnSf
	k8pDNwEw8ZENBOIgPD4uX9haLWBH29W9BDGFyyLLg9kTI3lShUFcc6Ebd+xfQG1h9qIOI32z0w3
	dSbVj652h/3cqz7533bMOqdkdLCsl9h64ZCb70WUC+70758zb3LhNc20b2n+C4g7bJg==
X-Google-Smtp-Source: AGHT+IGr3ejAGMBw8WxkFRZ79IaFNyYvIKfYHJJgupu5TXrQXzP0vRWI6vgzs3it8LN/f/DtJRkXIg==
X-Received: by 2002:a05:6a20:e292:b0:24f:f79d:66bc with SMTP id adf61e73a8af0-2e7c33cafc7mr19342637.24.1758727355572;
        Wed, 24 Sep 2025 08:22:35 -0700 (PDT)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com. [209.85.214.172])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b55149526cfsm15457534a12.36.2025.09.24.08.22.33
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 08:22:34 -0700 (PDT)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-279e2554b6fso28288325ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 08:22:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWVo4xQDBU8S/7rc6GnOQrZOm6wTWURbP5JmCgvopji/yNeSEd85UZzbWTF1JJYlWQb3brZQS8Vozfy2oQsd53h@lists.infradead.org
X-Received: by 2002:a17:902:c94d:b0:278:daab:7940 with SMTP id
 d9443c01a7336-27ed4a3dfa8mr1337745ad.17.1758727353184; Wed, 24 Sep 2025
 08:22:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250827100959.83023-1-cuiyunhui@bytedance.com>
 <20250827100959.83023-2-cuiyunhui@bytedance.com> <CAD=FV=WiZ5=4Ck3G2gme=ey6uYQhi-3Wo32DpLj9P53wxGCojw@mail.gmail.com>
 <CAEEQ3wnHzL6KVaW=RAkoMNSoM+HW11n=5miFwkw7=LQw+375Gw@mail.gmail.com>
In-Reply-To: <CAEEQ3wnHzL6KVaW=RAkoMNSoM+HW11n=5miFwkw7=LQw+375Gw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 24 Sep 2025 08:22:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XYGmayve1ujv9oqRrJaq-D6g7pRygvQf31WfEMsT3g8Q@mail.gmail.com>
X-Gm-Features: AS18NWDf2q3VkrTezxWiqMq5MaW03lcJwh8tH3BwlSFCZCG9Jd79C5JfcXHF2sY
Message-ID: <CAD=FV=XYGmayve1ujv9oqRrJaq-D6g7pRygvQf31WfEMsT3g8Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250924_082239_137658_57200098 
X-CRM114-Status: GOOD (  23.15  )
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

On Tue, Sep 23, 2025 at 7:41=E2=80=AFPM yunhui cui <cuiyunhui@bytedance.com=
> wrote:
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
> >
> > That being said, I did a quick look at your patch. I'm pretty sure you
> > can't just move the arm64 "watchdog_hld.c" to be generic. Won't
> > hw_nmi_get_sample_period() conflict with everyone else's (x86 and
> > powerpc)?
>
> After discussing whether to remove watchdog perf, it still seems
> necessary to keep advancing with it. For the code, we just need to
> decorate hw_nmi_get_sample_period() with __weak, right?

That would probably work, but IMO you should make sure you can figure
out how to at least compile the x86/powerpc kernels to confirm.

-Doug

