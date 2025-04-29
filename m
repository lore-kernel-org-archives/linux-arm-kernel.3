Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A9CCC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 21:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y1nuu73zjClx2psq7xdas0e4BatM4ucgjTEBi/N9T8k=; b=t9NFA9CuUKcPKPECGJy6PWTZmB
	JUWZyAMPFpuobnp+qPfe8allaOi9li9SILVJsP9H38athsaI1jLl56de6BId43XMaGpwIPIssfbUV
	Vg73f/pThkbZlbJQq6LIMuAgaFySOw6vogxRsFw1nvi2IixmdPiJWv4Ors0NaYSBoQfqthV1hTU2t
	8OYZilY1eJYBNO5vYbugSrhbm9xzVi8j3ryP/TG5Ii3fSggbyoDeycydLInF0wy0wvqPncqWxeP8H
	EFTs/vR9mzPqh/cWlNW8OwXjou58/TvrImDR21V4+meCb/ss7Bnup2ahlBRmepeZbAUTthEAW9RBt
	Vz+EY8cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9sde-0000000AsVr-0MUU;
	Tue, 29 Apr 2025 21:37:14 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9sbi-0000000AsC6-1aCI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 21:35:15 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-6f2b04a6169so71724036d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 14:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745962513; x=1746567313; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y1nuu73zjClx2psq7xdas0e4BatM4ucgjTEBi/N9T8k=;
        b=fbDFwyBG85aW6ibHwTbM6jyO8fmEIao2sBHMhOzLd1Qf+ZC4wZ9qsNx/xAULJjcVu2
         B3AhgplB8qGV4wllMw5naytA3lkXa3vU+ZKhLolss5jRfh5h8D1AegtwYi3sMzvP85I/
         VFRufGgIypbwua7rKiJcQQM+f9MRPWRXRc0uD9tYn9QPzQPxkMlxA4k1ew/Du2cqaLt9
         tUaDIXaXsQifudB6rFp5kJm8AAfC6UpeQ3d7fy9LH/b/tYD3xDLrPTKz20P5aj/kqAYR
         lWcTIqBn+yDVDJGsxepaGnIw0DpY+uIDZsvtnDz9gP9DhckhcK2voW3eYE0y3XjLfgYG
         fn9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745962513; x=1746567313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y1nuu73zjClx2psq7xdas0e4BatM4ucgjTEBi/N9T8k=;
        b=TO+bqSYhzIGkPawHuBdyaMvzBEFFa6D3kSQnEUoqGVNb74zgRz3d690Y/ruffovPzy
         BzxAhtZ7n1Y6ND4JwK2CDkiC2JdwZfQ1RxOyJD7jNQ6xRTEdyvxolpW4H7f9MmbZ5kJr
         mTJXyUI4RfzeNHwCynpS72gBWG6wkeUdIx7Eg/ditiqEcIwYG6Q4BNx1EUPePlsSTAj2
         qSOa6H0il0yk8z24n0973+onwTpkAlzYlHQL5ZvgJhjI3oW+/TMjwp87vBTa+G32ONWD
         jM/HXRpiPuaGFS8i2QjO4k8wgSHXkDezpuXvv3DsWw31tAKubZkqo0EEcLW+NDqvYt0e
         zaPg==
X-Forwarded-Encrypted: i=1; AJvYcCV1e6uawJsIU3yzwAET9ng/u209C3DDLSbc3m4LwWT8Tb+Nbv5H445IXmTxrYp6feuluU4d9WV/gBzITEraRXDl@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1F2ZeUb28ClnKR8bOhTtPTV4+x7zO+8dYEpeefD7dLTGQVkSb
	6l+nPLi7F1Yau3WJ2HBbdFCaIJaYSfZH5Wztv+CRD0noLRHb+K6hEg7lgzOIJgyPvC+ccUCpLYa
	BcZdjDC3qCW99SPlAnFY5+6uKakIOe7uw8GU=
X-Gm-Gg: ASbGnctUnCyvrs8ogdFG2myM3Z+OnA45xxIMnr5AfxOBrVw3tgEcKi2ZqYlLR2LNGaD
	6uZfrWVC0Oo2iO/y7uMCefgYfxX5sXxiBTg236LheaRrFsUvT403lBJPRorVtc8s6jZfba3PKHT
	6Is7OZHWOOW2KlX9X2YEaHhK90Mw64ml1f/IpQCmDOSxIAxO6XgA0=
X-Google-Smtp-Source: AGHT+IHdGBlsyLmHS0F3JdjDWgppCwC6kObHYfd9Irsj3QIg9RtclmbdpOnv6QueauuKbKvJEGgnE7theqdRIDiBF68=
X-Received: by 2002:a05:6214:2525:b0:6f2:d25e:8cfc with SMTP id
 6a1803df08f44-6f4fe03cfccmr6404496d6.9.1745962512631; Tue, 29 Apr 2025
 14:35:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250421215818.3800081-1-yabinc@google.com> <20250421215818.3800081-2-yabinc@google.com>
 <48640298-effa-42d4-9137-a18a51637f03@linaro.org> <aAeQcgmL-iqGbG_g@gmail.com>
 <20250422141026.GH28953@e132581.arm.com> <CALJ9ZPNLgEBxOmDim-vztUknEETwdL-Z2gJ8K9s44TiPgKZgHg@mail.gmail.com>
 <f03715ac-a4ac-415d-8daa-1914384319fb@linaro.org> <CALJ9ZPMiJ4oZerKWb4TL8swh8K3tfj70LTL+WibTRN-vB8rqvw@mail.gmail.com>
In-Reply-To: <CALJ9ZPMiJ4oZerKWb4TL8swh8K3tfj70LTL+WibTRN-vB8rqvw@mail.gmail.com>
From: Yabin Cui <yabinc@google.com>
Date: Tue, 29 Apr 2025 14:35:00 -0700
X-Gm-Features: ATxdqUH8QFOp7_4_6WS0YFJZ66Ou2QkaCWdN15e__QKEKbCxBuIPL53duQQlwB8
Message-ID: <CALJ9ZPNPDtSy2rSeZ04bzXp+OFDTDJ5_he5e9raBbd022Hr5ig@mail.gmail.com>
Subject: Re: [PATCH 1/2] perf: Allow non-contiguous AUX buffer pages via PMU capability
To: James Clark <james.clark@linaro.org>
Cc: Leo Yan <leo.yan@arm.com>, Ingo Molnar <mingo@redhat.com>, Ingo Molnar <mingo@kernel.org>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Mike Leach <mike.leach@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Liang Kan <kan.liang@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_143514_415646_C8970725 
X-CRM114-Status: GOOD (  41.64  )
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

On Tue, Apr 29, 2025 at 10:02=E2=80=AFAM Yabin Cui <yabinc@google.com> wrot=
e:
>
> On Mon, Apr 28, 2025 at 1:56=E2=80=AFAM James Clark <james.clark@linaro.o=
rg> wrote:
> >
> >
> >
> > On 23/04/2025 8:52 pm, Yabin Cui wrote:
> > > On Tue, Apr 22, 2025 at 7:10=E2=80=AFAM Leo Yan <leo.yan@arm.com> wro=
te:
> > >>
> > >> On Tue, Apr 22, 2025 at 02:49:54PM +0200, Ingo Molnar wrote:
> > >>
> > >> [...]
> > >>
> > >>>> Hi Yabin,
> > >>>>
> > >>>> I was wondering if this is just the opposite of
> > >>>> PERF_PMU_CAP_AUX_NO_SG, and that order 0 should be used by default
> > >>>> for all devices to solve the issue you describe. Because we alread=
y
> > >>>> have PERF_PMU_CAP_AUX_NO_SG for devices that need contiguous pages=
.
> > >>>> Then I found commit 5768402fd9c6 ("perf/ring_buffer: Use high orde=
r
> > >>>> allocations for AUX buffers optimistically") that explains that th=
e
> > >>>> current allocation strategy is an optimization.
> > >>>>
> > >>>> Your change seems to decide that for certain devices we want to
> > >>>> optimize for fragmentation rather than performance. If these are
> > >>>> rarely used features specifically when looking at performance shou=
ld
> > >>>> we not continue to optimize for performance? Or at least make it u=
ser
> > >>>> configurable?
> > >>>
> > >>> So there seems to be 3 categories:
> > >>>
> > >>>   - 1) Must have physically contiguous AUX buffers, it's a hardware=
 ABI.
> > >>>        (PERF_PMU_CAP_AUX_NO_SG for Intel BTS and PT.)
> > >>>
> > >>>   - 2) Would be nice to have continguous AUX buffers, for a bit mor=
e
> > >>>        performance.
> > >>>
> > >>>   - 3) Doesn't really care.
> > >>>
> > >>> So we do have #1, and it appears Yabin's usecase is #3?
> > >
> > > Yes, in my usecase, I care much more about MM-friendly than a little =
potential
> > > performance when using PMU. It's not a rarely used feature. On Androi=
d, we
> > > collect ETM data periodically on internal user devices for AutoFDO op=
timization
> > > (for both userspace libraries and the kernel). Allocating a large
> > > chunk of contiguous
> > > AUX pages (4M for each CPU) periodically is almost unbearable. The ke=
rnel may
> > > need to kill many processes to fulfill the request. It affects user
> > > experience even
> > > after using PMU.
> > >
> > > I am totally fine to reuse PERF_PMU_CAP_AUX_NO_SG. If PMUs don't want=
 to
> > > sacrifice performance for MM-friendly, why support scatter gather mod=
e? If there
> > > are strong performance reasons to allocate contiguous AUX pages in
> > > scatter gather
> > > mode, I hope max_order is configurable in userspace.
> > >
> > > Currently, max_order is affected by aux_watermark. But aux_watermark
> > > also affects
> > > how frequently the PMU overflows AUX buffer and notifies userspace.
> > > It's not ideal
> > > to set aux_watermark to 1 page size. So if we want to make max_order =
user
> > > configurable, maybe we can add a one bit field in perf_event_attr?
> > >
> > >>
> > >> In Yabin's case, the AUX buffer work as a bounce buffer.  The hardwa=
re
> > >> trace data is copied by a driver from low level's contiguous buffer =
to
> > >> the AUX buffer.
> > >>
> > >> In this case we cannot benefit much from continguous AUX buffers.
> > >>
> > >> Thanks,
> > >> Leo
> >
> > Hi Yabin,
> >
> > So after doing some testing it looks like there is 0 difference in
> > overhead for max_order=3D0 vs ensuring the buffer is one contiguous
> > allocation for Arm SPE, and TRBE would be exactly the same. This makes
> > sense because we're vmapping pages individually anyway regardless of th=
e
> > base allocation.
> >
> > Seems like the performance optimization of the optimistically large
> > mappings is only for devices that require extra buffer management stuff
> > other than normal virtual memory. Can we add a new capability
> > PERF_PMU_CAP_AUX_PREFER_LARGE and apply it to Intel PT and BTS? Then th=
e
> > old (before the optimistic large allocs change) max_order=3D0 behavior
> > becomes the default again, and PREFER_LARGE is just for those two
> > devices. Other and new devices would get the more memory friendly
> > allocations by default, as it's unlikely they'll benefit from anything
> > different.
> >
> Good suggestion! I will upload a v2 patch for that.

Hi everyone,
I have sent the v2 patch for review, with the title
"[PATCH v2] perf: Allocate non-contiguous AUX pages by default".
Please help review it. Thanks!

> >
> > Thanks
> > James
> >

