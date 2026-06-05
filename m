Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F1FCD8C85
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 22:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ASI/Ub/JEtT4EKfj0fwBEiEH80u/0dqFtTJS0kVCOY8=; b=sU3P70doJaEJfRHqo9o5PgVwIX
	uykDCkKUJ35irIHlXQVDnQKsWMyatyHIppTfPGGZJZqlUa+IFj3F283NbvJufKSIHZGDXaxrRAL9Z
	9Q2yOXPLG1HwRpedwhR6E9ko1FMXCCKQe/F25xts/gxKrQSgx2mXaiEAzwGVV/02WUCyuzUizGZAE
	spUPx3fc/ShtEoQIS1Jt+Vlg43DpjxBK3GBxrHi1avML4CpWVy2OEA9XR3jEHFgvwqqR4ltLKQxQN
	bu0H+AYhx678qFLraBZ7sZl9HS2BFK72wz7+HQxnoKJcMndInfGo+zWXXfOgDsdkK77UCBGf6mJ5d
	iLwgZg+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVciX-00000001EsL-2RoR;
	Fri, 05 Jun 2026 22:08:41 +0000
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVciQ-00000001EXj-1uQa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 22:08:36 +0000
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-96358d0a024so1712776241.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 15:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780697313; x=1781302113; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ASI/Ub/JEtT4EKfj0fwBEiEH80u/0dqFtTJS0kVCOY8=;
        b=g5XKEJxwOz80e6T/QnqhsbKbYt2XGSe8Wt0OyOSY4nusfXWD7432+UHluWQf/ZwfP7
         KvTyc2e/8K0pWcmD8/M8oTJjy95zLVCVoYl+OnVCRzuqT5fT7UAguOD+62k6WFV2ZUYj
         DpzlGbCJ4JWaRvsFJFym6DN6NRxk6licKm0yM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780697313; x=1781302113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ASI/Ub/JEtT4EKfj0fwBEiEH80u/0dqFtTJS0kVCOY8=;
        b=cJ4Zt8s1AW7rHqVzhhwInclh2xkn0D3inQ+udsy3XJSg4wz8rPyVNUVu75jyOgbbVP
         WxGTX+q9fEWQfAKhDR+sWzA+M4JWtI9FZIj/FZxrX5TUKM3DMaRctdajY0tyiETP/p31
         j2X1Si8lwvCryn5MjzRnolELiL1K5c3iUanHjh7phbibiOP8mazdVgGGgtn9Wb/RD8zK
         flQ22SSJKhVEYi1gqiL7+C0TPuk0FJO508frtwWahac9jRmzf4jB5sJo3hW5YVTkXL98
         2XW0bKLWUQXyp/GBPbYUWGCsbLFXdiLijXhthXTYXh+rkpJOs/gkxar1Oa+3eAlR5uKW
         0Gsg==
X-Forwarded-Encrypted: i=1; AFNElJ+8yTxzPYexhsDaVfk8MQxNzFc6lJMe343KV5BI3Npk8lCi7qd+DhH1QR7ercgIOGJqIEbuhwq4TLrJ+ktaKnbH@lists.infradead.org
X-Gm-Message-State: AOJu0YzCw97OZccFTzFHJsEZDinBlZAbTQrirMVD5BiS7b31mkpPXXkv
	e0HbDgRzF2KaWb+8XY3jJa4WuNCgGqMMPZUNTyGjcU1QQXRftH6eUoBHzCQZyhC1AWw8W4BO+G2
	8+38=
X-Gm-Gg: Acq92OHxbOjRAKUegCidYzw/drm8pSJAueT4p5qwTDspuPbz8cVXIWv3dLcAFLIpq1Z
	4aMNLVPaxnWrMxARyzXHCezsxSWJXfg11tta3qNajoUzzCaBf9+S2XAVVRrUuPLPT9JqVUmoNa2
	W18BaY5xgr8jqPJG1fVH5sfTf2YuWw/NWcCUr5TRuhOjVprlaH+Z7wGEBpwmjF2BVRlfrGQHb0h
	IBTKJnJuXea5RDfg/nDEk8no/DZjBMzlfKOFA742pTPXgxHsNUhiaoLEVqoXCtN6lTBAuklDDAM
	4XWqZhJSVnH08jXvXXEZAHG8YHzTmDHUQPe1nyl2CI3OLItdWO/kU85PVO+1LRmseQVvDLlKN4b
	qUgipsaiku835e7r/VLmS2KLgxxvt0NLPXEKwfT5QAzaTJsFCcG58EPF5fDvUB/eK0Wfic+JdPv
	xjQi9xATCY+n2igBuTw/WMqn6prRpGxeOJpxN+mqhHyC8IRF138LRwzUqrj3BKMz7dpy1tdSSU
X-Received: by 2002:a05:6102:c91:b0:6cc:16d2:3100 with SMTP id ada2fe7eead31-6fef1098102mr3668205137.13.1780697312971;
        Fri, 05 Jun 2026 15:08:32 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96414113f1bsm8045662241.8.2026.06.05.15.08.30
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 15:08:30 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-6c4db0bf752so1576996137.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 15:08:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/XyjAg5cipSqS8S/QfZ3DT/qmEcN7kIZs+CppeCU5LALH0yA8qPnx4sepfCZcoZg3plQsuAUUwnthUHmbWUDVp@lists.infradead.org
X-Received: by 2002:a05:6102:548c:b0:639:1e8b:ecd9 with SMTP id
 ada2fe7eead31-6fefa23308cmr3363451137.20.1780697309372; Fri, 05 Jun 2026
 15:08:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1780496779.git.kas@kernel.org> <6172eafcb9de6e626c0f1c36426d67e1e562ed32.1780496779.git.kas@kernel.org>
 <CAD=FV=U4eJ__dQc1e8CGgj5sMDNrD1MgEEy9Cgj9M5n-WmYAXA@mail.gmail.com> <aiM69AZXtGduS4VY@thinkstation>
In-Reply-To: <aiM69AZXtGduS4VY@thinkstation>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 5 Jun 2026 15:08:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VLs6+PjaoobSaNV9ZZ0v+aNceP8OwQuwCDsUr7uhakVQ@mail.gmail.com>
X-Gm-Features: AVVi8CeXTZbZ_bCiZKWuqK0BkpwxT8zq1PPYmubKztyrw4PW0_2EbW1xDkadtwM
Message-ID: <CAD=FV=VLs6+PjaoobSaNV9ZZ0v+aNceP8OwQuwCDsUr7uhakVQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: wire SDEI NMI into the hardlockup watchdog
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Petr Mladek <pmladek@suse.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Usama Arif <usama.arif@linux.dev>, 
	Breno Leitao <leitao@debian.org>, Julien Thierry <julien.thierry.kdev@gmail.com>, 
	Lecopzer Chen <lecopzer.chen@mediatek.com>, Sumit Garg <sumit.garg@kernel.org>, kernel-team@meta.com, 
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_150834_507728_1FB26D58 
X-CRM114-Status: GOOD (  30.42  )
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

On Fri, Jun 5, 2026 at 2:12=E2=80=AFPM Kiryl Shutsemau <kirill@shutemov.nam=
e> wrote:
>
> On Fri, Jun 05, 2026 at 01:03:05PM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Wed, Jun 3, 2026 at 7:36=E2=80=AFAM Kiryl Shutsemau <kirill@shutemov=
.name> wrote:
> > >
> > > From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> > >
> > > Select HAVE_HARDLOCKUP_DETECTOR_ARCH so the framework takes its backe=
nd
> > > from this driver. A per-CPU hrtimer checks its buddy's heartbeat and
> > > signals event 0 at a stalled CPU, which runs watchdog_hardlockup_chec=
k()
> > > NMI-like.
> > >
> > > The source is chosen at boot: SDEI if firmware provides it, otherwise=
 a
> > > perf-NMI counter (pseudo-NMI) fallback -- one image covers both.
> > >
> > > Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> > > ---
> > >  arch/arm64/Kconfig          |   1 +
> > >  drivers/firmware/Kconfig    |   3 +
> > >  drivers/firmware/sdei_nmi.c | 247 ++++++++++++++++++++++++++++++++++=
+-
> > >  3 files changed, 248 insertions(+), 3 deletions(-)
> >
> > I'm a little confused about this patch. We already have a buddy
> > hardlockup detector using the hrtimer, and it's even been improved
> > recently to trigger in a smaller time bound. It looks as if you're
> > duplicating bits of the perf and buddy detector here?
> >
> > I don't think you need this patch at all. The existing buddy detector
> > + patches #1 and #2 in your series should be sufficient.
>
> You're mostly right.
>
> Buddy + #2 covers the console case (the remote branch triggers the
> culprit's backtrace, which #2 makes deliverable), and #4 gets the wedged
> CPU's registers into the vmcore.
>
> The one thing this patch adds that a config can't is boot-time source
> selection: PERF-compiled kernels have no detector on a pseudo_nmi=3D0
> boot, and PREFER_BUDDY costs the pseudo-NMI machines perf
> self-detection. But that's arguably out of scope for the patchset.
>
> I'll drop this patch in v2 and run PREFER_BUDDY here. If a runtime
> perf->buddy fallback ever materializes, the gap closes entirely.

Sure. If you're interested in trying to make pref vs. buddy coexist,
that should be done in a platform-agnostic way. Feel free to post
patches for that. I know we discussed this previously. Ah, here they
are:

https://lore.kernel.org/r/20250916145122.416128-1-wangjinchao600@gmail.com

I think those got bikeshedded to death and nobody cared enough to keep push=
ing.

FWIW, my belief is that the buddy detector is superior in every way
except that it can't detect when all CPUs lock up simultaneously.
...though I wonder if a nicer way to solve the "all CPUs locked up" is
to just NMI-enable the "bark" interrupt of a hardware watchdog timer.
That ought to be quite easy...

-Doug

