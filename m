Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72DBC0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 04:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W+ac/mznBbI8mYN5cF+80SdkSapmBtg1Uk/QlDfucw4=; b=SSkRB0Fln5iV9hYepclxPysj5x
	qeWQJhjzwiQEcWewHeIrZC+zU3VzuHGFQLEXMdrTErOc9pggCVAnjsj7sdhWZobYjGoCIOxoKbM21
	Uu14X/kKFuU/PGpV+EchhsoJoEIfcoeX87dx5zMq8K6y0ZFZZhhungRmdwVwi0FSzvy/IZAhsymFi
	ReGY6ncE1AuzQq0nQEjDCpJxYQRmMGqtWTJMpEeS8t84DmnyyiQrp7v808124o/kT5r4RxtbjrUyV
	3nRE87yKFOKX9ftXWGdkVqNXif7O0IZS0NlOiGdO6MriPCxfJ1YlrW1t70/+AhN5TUIqtV4RbpqI3
	uVII+7ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thi99-00000002W01-49Nh;
	Tue, 11 Feb 2025 04:45:19 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thi7k-00000002Vt1-3PuD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 04:43:54 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3d147331fb5so101055ab.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 20:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739249032; x=1739853832; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W+ac/mznBbI8mYN5cF+80SdkSapmBtg1Uk/QlDfucw4=;
        b=IAP0MeqoLVyY9x9FBSDS10EFe53XXwfrCepV3xcsA9nVMVDMBKswF6palYZdEGrW8W
         REWzhMoMob9RWLiyjmhc69QzHtSHDXjcpUwWPTTeJqqIHnQ7qAhXbdeeyubqW+h8TGIw
         qKdMK1A6jD/KFYNiw+zipm+mqoXxlCBFZ0Wg0yDzLZbppblQJbmRLEJ5HqLW8JMNRDKY
         XSt9OjSbQP2Z31rj18y530ENFRoqPCCG0gqkKQRySKfKGqZjFccQDhAq/8GXhNM33WAa
         bM5nfsUvnXG/QNzaAty2qKnbgamRmrZiGAlVGPR/GBtpiHTqrBB3DuVlGefD22oCaXhB
         jbSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739249032; x=1739853832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W+ac/mznBbI8mYN5cF+80SdkSapmBtg1Uk/QlDfucw4=;
        b=N/A5K/SL0RJivaGZBKolxOaNsAIodM1HGRt0N6vLCIltcg2SciQ4cN2p4YaR3SzdGO
         fjyxmzBWDvvSwLpo9rqMiK37V3XAMM4+TFrpiXA/aRLGffnQZQ3RyZvjfroz+xOnxJjv
         4XFAzddFzSjvk70Pd4alSHCoT0UHB3MyvIaB8zq++XcTqxxKNGbY/IlE/u/qYw9Oa7sK
         4itC8TKIyDtvtBvctyc47dI14zKSgyuk3y5TmX7v3Y7TyDZltAqH7TrW39OySepgx3qo
         vePsFIsYDSN4uc7XB2uBqMzasttGttR2eNRiwrsm1qR26HKnsJHD/If2MiefFgxKbBjV
         xsWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqTfBKuigPdqsv2X4xVOVNXtEm//qTdJw7JogL5qpvwusptalIhvZmN2L1vkCuKuoPGM1iFBn50wVwaW00ibaO@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9HYEG4EMkJwGvM01OZcSO1lQTB2gUdz9BcCmrbpKaSgrESkVC
	zo5dcBQMLpKBVORqLIup2Hxec8Hp1KpKXY+nYyEmUPoutXU4YvpoaTpoR2d8bzhGfSvIvXOGS0j
	AjrsUSjOLFTPwwwjPzE0Oi+0yTBty5eU0MKkY
X-Gm-Gg: ASbGnct09Bm9pxnl/imcHvXPOK1pUSXS3etbx72+KKepxADwNtgZuNpc/lc9jh5rwBh
	0ygJCMQY+kSvH+mSqxbstSaomSWl2NVOYMEBR518WBefkmYJPjA9Xmo1T6YI1SmscGkzFauMO/g
	==
X-Google-Smtp-Source: AGHT+IH62zwJb7vIiK9ERZyEtFIzirwQ84WAwSIX9q0lCtyh886O7Fe7cr+mPRTC7OAQyfkYd0fUaBmzY4ORVNBa/B8=
X-Received: by 2002:a05:6e02:17cb:b0:3a7:e3b3:2e3 with SMTP id
 e9e14a558f8ab-3d171e154dcmr1187055ab.17.1739249031726; Mon, 10 Feb 2025
 20:43:51 -0800 (PST)
MIME-Version: 1.0
References: <20250113194345.1537821-1-irogers@google.com> <CAP-5=fVoQRhd-8jyXfjc2dCuwt7_o1sU208aADT1FriwCNa9qw@mail.gmail.com>
 <Z6q7EZxAvskBE4H3@google.com>
In-Reply-To: <Z6q7EZxAvskBE4H3@google.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 10 Feb 2025 20:43:40 -0800
X-Gm-Features: AWEUYZlNlwzE1WVHvCpGkcFTuyztJRuv0e871Fx8DlqLQ64oyq26UJ8Sd2M_W_U
Message-ID: <CAP-5=fUTBJ_15f1WFuHjZzbWDwsAo3d90WX_hobfVWPjSOe3Vw@mail.gmail.com>
Subject: Re: [PATCH v1] perf sample: Make user_regs and intr_regs optional
To: Namhyung Kim <namhyung@kernel.org>
Cc: Tavian Barnes <tavianator@tavianator.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, James Clark <james.clark@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, Charlie Jenkins <charlie@rivosinc.com>, 
	Andi Kleen <ak@linux.intel.com>, Veronika Molnarova <vmolnaro@redhat.com>, 
	Michael Petlan <mpetlan@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	coresight@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_204352_859315_19C5316F 
X-CRM114-Status: GOOD (  23.39  )
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

On Mon, Feb 10, 2025 at 6:51=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> On Mon, Feb 10, 2025 at 10:15:22AM -0800, Ian Rogers wrote:
> > On Mon, Jan 13, 2025 at 11:43=E2=80=AFAM Ian Rogers <irogers@google.com=
> wrote:
> > >
> > > The struct dump_regs contains 512 bytes of cache_regs, meaning the tw=
o
> > > values in perf_sample contribute 1088 bytes of its total 1384 bytes
> > > size. Initializing this much memory has a cost reported by Tavian
> > > Barnes <tavianator@tavianator.com> as about 2.5% when running `perf
> > > script --itrace=3Di0`:
> > > https://lore.kernel.org/lkml/d841b97b3ad2ca8bcab07e4293375fb7c32dfce7=
.1736618095.git.tavianator@tavianator.com/
> > >
> > > Adrian Hunter <adrian.hunter@intel.com> replied that the zero
> > > initialization was necessary and couldn't simply be removed.
> > >
> > > This patch aims to strike a middle ground of still zeroing the
> > > perf_sample, but removing 79% of its size by make user_regs and
> > > intr_regs optional pointers to zalloc-ed memory. To support the
> > > allocation accessors are created for user_regs and intr_regs. To
> > > support correct cleanup perf_sample__init and perf_sample__exit
> > > functions are created and added throughout the code base.
> >
> > Ping. Given the memory savings and performance wins it would be nice
> > to see this land. Andi Kleen commented on doing a reimplementation,
> > which is fine but out-of-scope of what I'm doing here.
>
> Yeah, I like the core of the change.  Andi's concern is that it touches
> too many places.  It'd be nice if we can do that without allocating
> memory for regs and eliminating the perf_sample__{init,exit}.  But I'm
> not if it's possible.

Moving from no allocations to 2 possible allocations means there has
to be corresponding frees. Putting the frees into an __exit function
is the norm for this kind of cleanup. I don't see how you can move to
the approach presented without adding the frees and not introduce a
memory leak. I don't see what's actionable for me to do here.

Thanks,
Ian

