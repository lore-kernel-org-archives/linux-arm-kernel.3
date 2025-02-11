Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0A9C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 19:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JUV7D/7FHhEkhtKkdqUEVJvJ3is/GshkRVyHniVhIV8=; b=ftN2L8D3cAbxaaF//obHSuWsQC
	RnYcfjgEoDQoV9vi7VOzLWGc+HRHZySZdEPb+biu1STKlJtiTRbSIgx7Dqhg+laLqTFtqZCrjsN8H
	XW7vJLPucVQXGrqHtgiW47VOt0cXx3fTvGAZTrcruVlYANADBIdae7UQpyVUi5wweTf+hUeiUEzMo
	U794kypPiVTWxpGYWBWE6VwnE8WPJqHWPQv1tyU1ZuAu92kNmZdgU2FoW36bKYNbKNB6xo/95UEww
	KNukkA5QaXnu5WKG9IqYyuoW01srVMmDkvhsHJk7dRfQqHZdQlYl49C1m3Xk4q4uFViQnEGpiaD/6
	Xl5L2WeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thveu-00000004xgp-1NkN;
	Tue, 11 Feb 2025 19:11:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thuZN-00000004mYP-2Z1d
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 11 Feb 2025 18:01:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JUV7D/7FHhEkhtKkdqUEVJvJ3is/GshkRVyHniVhIV8=; b=F/gFF7oTCnyfN91z1UtW8Rssn5
	MgdgO3LRmRz9+6oV25oBlHTYXrswIoyWdWzS4EUX9YEe+YHf2L5bwOAuV31alXjsjT2IKi8MMF2J8
	tb3InCDTcfiZcHDkGtYcMm9FsAiWeiMTn/6QNfsa17/LRJAZsBLEvdQfkDmVHMlL5AQWYkk2bGncR
	8t37MS2HuEIxZQcDCb/r63ZaT8Lz9KumEcUG5pqYpEH0vMfk6nNUR6TafikwwBVYFGFhgLNV3C6D5
	5DAIEF94Fbja+ZQfOMeHizIZm6iHYd9+bVADiEBDVvAqUf8amuydN5E3ACKwL+5cFwwRR0Zey1LYu
	Rkv74lnw==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thuZK-00000000fH5-30TK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 18:01:12 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43956fcd608so3276275e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 10:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739296869; x=1739901669; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JUV7D/7FHhEkhtKkdqUEVJvJ3is/GshkRVyHniVhIV8=;
        b=fL51PVUdcDyOzuL+pPQ+YgJDcTGvCGsdZRbLMK2188V0VZDbJnb9i6QUXxWdf5+kvX
         MHbMRsyJuMr33BBXWE9eTiPImqHypEVoJ1wmzUslt2/qB66gcggVrSMDBjmVhP/LaXcN
         po3rmdk9irduGHEXRVCEHOggEdFBYAgJLWlX6hvU5YQX0hv8jz+7z2kr1xXCcQI07WdV
         KdKCg9NvEyBAGuMY+1UiE+K+v2XAXtA+FlHXYhAU86s78lexdmDtrOvFY4+xhV2r8vyb
         yXjABnYlRrqhLNAwpLNCuKPyH+6wtziR4u9hg6N8ADpL3PTR56SnZlS6JSHZTGYEJFwI
         9RZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739296869; x=1739901669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JUV7D/7FHhEkhtKkdqUEVJvJ3is/GshkRVyHniVhIV8=;
        b=V/AF7GOiED6TM+A3obZagdcvxmINevT4q/sZ/hlK7V0PWPOVKlisRbTuih3KtBojhO
         UyNJOw6/geJ0vJoe3FPoVZINqTmnNfELqWGp2G+PLH7zPrGZJ0nNi7AHaIclXPHZD7bG
         zPGIAc01ZhDm5W9/7KEpwtlZk6gNiD4ixWYmSxdV3iwdVRJyO24oBkQrfvd6Tk3ooEJz
         QVI+A1UvMDBLbk8ylNLDfsJx0Rv620VfGHh2mDsnmOXoR/8f/8JUSuUYORChNqJA8Ebz
         /xpxyo2QlrKaO8dBbFssPBDa6FPZ8PdP3fQNPTK/hgM5F2Z6bRqoudEJyNKzvSgBsk/a
         V0OQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBY9DfGSIXseW1/SU3qh6LnzR5CXYNDSnkViKlMprfaMgIsd9mwIlYYfZ3agps3qsMTW7ijOhAEpHWXvF245Wr@lists.infradead.org
X-Gm-Message-State: AOJu0YyIn8gj5PJNUmYzSf9wpT19KVCZ+RnvuqmC0Bneeol/ZrP3aihi
	3/S3ZhCPlcVnl8OSQ8XG/2+SNA9rY0s+inSTZebVpgilM+r8r05eFTIomALS2DMqfmkUioyIYwa
	52e1Y4I3qaFtJpP8MhBRgA+CgcII=
X-Gm-Gg: ASbGncu44MDM7jXmn63HWuZVWNDSea2lD5EjrMk2F5L+AOQ1lcdVJ4TPfOIh5kXOC2W
	FcjkKkZ4LY70+Br7ut8saoGywroV/HmINDRaK6NfDcXUM/R2RsHPHfpuPrn/jP9R6Vfc7xNzdwy
	1kAAOWqn9l0Lht
X-Google-Smtp-Source: AGHT+IHcQ845RxBvXCqNmZWlyCfvxPz8/imRu/MMQzqaMkKRPhh0DXC4Vt/2tERs91TjyTpJDufKRRzRoTuvGlYQLAQ=
X-Received: by 2002:a05:600c:3b92:b0:434:f8e5:1bb with SMTP id
 5b1f17b1804b1-4395817a562mr2331075e9.12.1739296868563; Tue, 11 Feb 2025
 10:01:08 -0800 (PST)
MIME-Version: 1.0
References: <20250206105435.2159977-1-memxor@gmail.com> <20250206105435.2159977-8-memxor@gmail.com>
 <20250210095607.GH10324@noisy.programming.kicks-ass.net> <CAADnVQKefT6iQVQ66QTCeRCMs_am4cC3pBt1Ym1fxfeeQVDDWA@mail.gmail.com>
 <20250211101146.GB29593@noisy.programming.kicks-ass.net>
In-Reply-To: <20250211101146.GB29593@noisy.programming.kicks-ass.net>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 11 Feb 2025 10:00:57 -0800
X-Gm-Features: AWEUYZk5eSpapY-FzUEHzQMtVjTuyU3F0mPDQ4oZZjvclBX8VhXOaAxZ4UQug3A
Message-ID: <CAADnVQJjNzMapuJvOni2gPHhxRo=C7_FCXBpG2bb9ctN8L7rcA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 07/26] rqspinlock: Add support for timeouts
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kumar Kartikeya Dwivedi <memxor@gmail.com>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, Barret Rhoden <brho@google.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Will Deacon <will@kernel.org>, 
	Waiman Long <llong@redhat.com>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Josh Don <joshdon@google.com>, Dohyun Kim <dohyunkim@google.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kernel Team <kernel-team@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_180110_861771_EEE2255A 
X-CRM114-Status: GOOD (  14.66  )
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

On Tue, Feb 11, 2025 at 2:11=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Mon, Feb 10, 2025 at 08:55:56PM -0800, Alexei Starovoitov wrote:
> > On Mon, Feb 10, 2025 at 1:56=E2=80=AFAM Peter Zijlstra <peterz@infradea=
d.org> wrote:
> > >
> > > On Thu, Feb 06, 2025 at 02:54:15AM -0800, Kumar Kartikeya Dwivedi wro=
te:
> > > > @@ -68,6 +71,44 @@
> > > >
> > > >  #include "mcs_spinlock.h"
> > > >
> > > > +struct rqspinlock_timeout {
> > > > +     u64 timeout_end;
> > > > +     u64 duration;
> > > > +     u16 spin;
> > > > +};
> > > > +
> > > > +static noinline int check_timeout(struct rqspinlock_timeout *ts)
> > > > +{
> > > > +     u64 time =3D ktime_get_mono_fast_ns();
> > >
> > > This is only sane if you have a TSC clocksource. If you ever manage t=
o
> > > hit the HPET fallback, you're *really* sad.
> >
> > ktime_get_mono_fast_ns() is the best NMI safe time source we're aware o=
f.
> > perf, rcu, even hardlockup detector are using it.
>
> perf is primarily using local_clock(), as is the scheduler.

We considered it, but I think it won't tick when irqs are disabled,
since the generic part is jiffies based ?

