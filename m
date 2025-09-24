Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC1ACCAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 02:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KJ7ZD4HOO6vcvN2jhvcYNuUy+e/nu1npqP5xs4E4kvw=; b=zbA6oNW2M60AS8UND0tLaI5n2D
	JW6+RyFSedeMlYUvzJuPUHjIy8Qrj33jVqqTVWsXIJBWEHz3ndelv1vCtCJMHTqV28a6bVEUWYPyD
	Ch9iJXfT4MLtszwt+etx7y9IF7gxLI9yvBYpO2dxVvMObymGTFzJt2V5DV5/FVwB0ywN4G2Sea3Ej
	+YnpSHpd/KUZcaNZ+6GbE1II2rfgpiDM5MdZlGangNTqqdJ6yZlj2t+tTh12/+pCWBoAEvSkvgpEC
	Go8IQCPr6P017EjFNlKtu7NM0LHdWkO5XqyVf/H4YS0OszSNZHv4kjLyruos+4pnbhPNa3+qL7eFw
	/Fw2kvqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1FRf-0000000FNRW-10Ez;
	Wed, 24 Sep 2025 02:41:27 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1FRc-0000000FNQW-3JUM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 02:41:25 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-6335ef8e4c6so1010357eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 19:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758681683; x=1759286483; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJ7ZD4HOO6vcvN2jhvcYNuUy+e/nu1npqP5xs4E4kvw=;
        b=Uej9z9LM8zulwukzbwLyZKT7fDb2ZA7VGYsaKyz3WyD/4tjTtFySMNirbDQBg8dPnl
         W0y6l6xahVC4n0TqWMAh+3X7e30SHAiHOMJdIg9hjHotcr+qcg7V7xHkrex8acdAboOY
         mQqNKTsDGg7gB56FpkVQbQrdTh5W8KSxXI8piToP8/3RdbggEuhzo8eWIX0MSGGwPTsr
         hl90/SYI+gJzjHgwth6NJEdC8SGBmW8wjC3xB6VplJ3XPvh/tu4ohya/gjZa/oZg9qVk
         1G17koAe0lApDYD8H82mfW1/L+Q49342zeQlv4h8BFPyJflS97GBVCnMpZ56F5XPrl4O
         b3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758681683; x=1759286483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KJ7ZD4HOO6vcvN2jhvcYNuUy+e/nu1npqP5xs4E4kvw=;
        b=YxhGCsgpQip7FyXMLZAWeIsUGIbtF2ZcGBzAbKsJPd4K1j2gOSgSdbHe7Vd5GLXCbG
         XR2okVrGxBWR4jPdWrFZ3WzXdBhvDnVyxdKvrp5Xm96FcBMflSh+0tEpeibO3+ZZSNjG
         ZNTI7+6VgpeInFvQgwwbtj2f9qyB8RigFuoK8QlqQFUA3hyhHbZZVBm89FRdJGkzPQZb
         j2BoC43d127k3Pkb6CVGfPfKNql7EgyxsMyqdVZ3jioGvALeS79e1MMkPK55BtnnFZja
         ANRoHul57PtZJSHeTXtIHkqGVea3JgcxLUqyd89rbSDwKeWyOeCIBYV48hKLJI3EjhK0
         5kTA==
X-Forwarded-Encrypted: i=1; AJvYcCUO/SdX1UXAsGjMH5expPJboVK6iaaKJYKbcqIzZ8KBNJ4NTy23cKj8ULtdTnlSVIZUV4s+rTM8JTE1BRmj1yKB@lists.infradead.org
X-Gm-Message-State: AOJu0YzELF6CkGlile02nIAhXNJ4Q1T6D+2LIh47UkVyBKsWFiueyp6i
	x16pGh6DhyY4Z+NSXwYJyHVEwpqU9y/ffrCby/cESCJFLSv6VRVMUBwDz+J8HN2Sm5UeqtO7v+n
	Hv5CaIRruYca4nBwlfKCURtCMWDjKhlgcJ0NxmqBhfA==
X-Gm-Gg: ASbGncvjKhFRE7sFB79aAIGUoc8Z2XGtK8ZzpavtXY6MntUCic9g5ak5dRqKICUktcN
	g6VvkzVRM8vDBUptfoDuSdaoFj+bxPY+/TqDeH+KKqojh18MWKCaMlKRze6P/zwpKbLnAOu4D7e
	9ZSbvvPd6OpMMwUyFr2sMhTYiSZ/kKJRPMGKC9dVtBmhkpgh1eydWA/RdezW+2KO+d+j8fGvf+6
	vyg5Yn/BtPsdxn6fJS0WPstyiJXPcA=
X-Google-Smtp-Source: AGHT+IGEpNk9DDtckp5YNfBhGfRHVJ45anN0NmcR9uT9RDyjMg5L8WQA0A/0mav6VX8Fgt6VaztuETs4XxHkt904xHk=
X-Received: by 2002:a05:6808:4fcf:b0:439:b9b3:af48 with SMTP id
 5614622812f47-43f2d4fa2f9mr2800409b6e.51.1758681683348; Tue, 23 Sep 2025
 19:41:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250827100959.83023-1-cuiyunhui@bytedance.com>
 <20250827100959.83023-2-cuiyunhui@bytedance.com> <CAD=FV=WiZ5=4Ck3G2gme=ey6uYQhi-3Wo32DpLj9P53wxGCojw@mail.gmail.com>
In-Reply-To: <CAD=FV=WiZ5=4Ck3G2gme=ey6uYQhi-3Wo32DpLj9P53wxGCojw@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 24 Sep 2025 10:41:12 +0800
X-Gm-Features: AS18NWB66CdU_tLMngkAZDvsu7vdd4uKDW0eFr5qi5AGo0Yw70dG5SNPb2ixTPc
Message-ID: <CAEEQ3wnHzL6KVaW=RAkoMNSoM+HW11n=5miFwkw7=LQw+375Gw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250923_194124_833968_165DA656 
X-CRM114-Status: GOOD (  18.66  )
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

Hi Doug,

On Sat, Aug 30, 2025 at 5:34=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Wed, Aug 27, 2025 at 3:10=E2=80=AFAM Yunhui Cui <cuiyunhui@bytedance.c=
om> wrote:
> >
> > Move watchdog_hld.c to kernel/, and rename arm_pmu_irq_is_nmi()
> > to arch_pmu_irq_is_nmi() for cross-arch reusability.
> >
> > Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> > ---
> >  arch/arm64/kernel/Makefile                   | 1 -
> >  drivers/perf/arm_pmu.c                       | 2 +-
> >  include/linux/nmi.h                          | 1 +
> >  include/linux/perf/arm_pmu.h                 | 2 --
> >  kernel/Makefile                              | 2 +-
> >  {arch/arm64/kernel =3D> kernel}/watchdog_hld.c | 8 ++++++--
> >  6 files changed, 9 insertions(+), 7 deletions(-)
> >  rename {arch/arm64/kernel =3D> kernel}/watchdog_hld.c (97%)
>
> I'm not a huge fan of the perf hardlockup detector and IMO we should
> maybe just delete it. Thus spreading it to support a new architecture
> isn't my favorite thing to do. Can't you use the buddy hardlockup
> detector?
>
> That being said, I did a quick look at your patch. I'm pretty sure you
> can't just move the arm64 "watchdog_hld.c" to be generic. Won't
> hw_nmi_get_sample_period() conflict with everyone else's (x86 and
> powerpc)?

After discussing whether to remove watchdog perf, it still seems
necessary to keep advancing with it. For the code, we just need to
decorate hw_nmi_get_sample_period() with __weak, right?


>
> -Doug
>

Thanks,
Yunhui

