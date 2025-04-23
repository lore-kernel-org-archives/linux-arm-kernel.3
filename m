Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EEFFC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 19:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0xVavQGeHiKp7rEiymJ5kdyLh0t3H4T8Z/fRsD3R+Vc=; b=olNZqsFPS9Sgu7/eu7arfvr6kP
	XAj2gfjP8E3PvVeys/XFfxgyRgeQ1Zi8DBCb6Vx3NJ6IC1p0kLEl6oFyfkjHBG4HyOCZkpdd96LNe
	sDCUY3E+4DgYm0sLFmJ91e5YSGmtiG0gzYx2BdO8rvgk7Rj5pmmztjb523qqTYpIfh/UnhWlbb5mN
	I+O/EU0jxLzaB47chnXoIFiulpYesmpbfdB4eEZx12eTa3+ZMhaYghCDlfOyIkowvWIGcWXsx8Mnf
	OInwFFn6HRGJlyiYW7IbVVOBiS95ApwAzfDPBYudArbC6ov3llJJMs+D7wlA6dM4jmyZWv/zhzQKo
	uth2lr0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7gBR-0000000BrE7-4Bwe;
	Wed, 23 Apr 2025 19:55:02 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7g8u-0000000BqK2-0veY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 19:52:25 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-6eeb7589db4so3663156d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 12:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745437943; x=1746042743; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0xVavQGeHiKp7rEiymJ5kdyLh0t3H4T8Z/fRsD3R+Vc=;
        b=sm8LFw0pV+hFmV5U/d+hSv6Rd0PWb7JlNs+sWPEvNhHPYnljZMUnVvGeOhhOrtn6PY
         jNTDfNoCFybEfrabvtpcJaLsvEULIR9l/A8Azt6mmnPnNHseoJp18zWX/GHZMVhlORWZ
         sL/+HtZudZC/K+Kpng1lkOfktr4sVOcgDzxEUPXSrPB8ZZryTczWDTTPeK+I8j/OIID1
         c+EhkjNvQGkSUx4+izQx0bATmYF8JDc3hrnfsIoS32HyEv1+tXKT7PIwJh2rTvKSD0Yy
         5CDPwUClO5HdFyW+67fC3Qo06NN+sbDTjLIVZMNZI4jhzK8+xXxGkLTJ9dhHwHo5Y9aM
         u4Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745437943; x=1746042743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0xVavQGeHiKp7rEiymJ5kdyLh0t3H4T8Z/fRsD3R+Vc=;
        b=bmGtX5P6JbdHtAaDHh1okiNIjmQPEIP6QHYGu0ONF+S6fq6CCJeVYoUVuIh7UsooCq
         CVM6S1sDHRgUVFAsW3sfbqkUfDC8ftHZqbWUhLnI51L9KvL2aktbqy4Xk1yE19PPBHoO
         AFm3lPa/g9NXlCSshEHHOIvUgv2L/nJwJ/TgwAs5Kp6C+DkkK1wuaVHHaCli7B+Jfxi/
         J3grJOuQCKF/KVmpnjKElJMNwyk34ejB4IE1Zd9SGIMtZ2hL4eMtFxhsAc4uUqzyV/0z
         1McWPcu5rrEDCvdhp4JsuXXPLlc+U9amq5Z1zdppIDp6lStGIW+sKX+MbEuY/t+8Nzsy
         nvWw==
X-Forwarded-Encrypted: i=1; AJvYcCXPhpqiddZOjpFTkMulkJJYVMZ0djDi5MC5oiaUymMbqZ1tsgxpW2rnHL+ovBe7S4VlVcZy7QcRUHihCIntopwU@lists.infradead.org
X-Gm-Message-State: AOJu0Yxi+fcYjcQ8fhzZdzHpFNNcs3xmm53eD07pTaHQ08CF3SavXiDi
	NttIOqwvYeuFgdG84WJqGIc3uBOxVyhtZoIv3OfBaq+Hu39AM7JI7uH1/1kTJ2DmE2mU4SDcYMX
	URorac2taNI5kW7jl8K0MyDJi0vRZ3BYUKPo=
X-Gm-Gg: ASbGncuQWLOxhbWeCDuNgK3sNTXYud9XJ6RfH4vh37HqGqskO+PF8ZGkUWfT4PbQ13T
	xJDD6an2Rumio1H0wzuHXjGrnQUPlMb25Ij1+81ef4YFiGKUfF5fWpzGXNdZn50FEgNqgEGOqz4
	QLTbLFNLeNF5oWi9V5HkJfQBb2pw6F3CfviXeaDhf++JH2YMYEMXs=
X-Google-Smtp-Source: AGHT+IGvkeMBlU3PpGjnWugnhbT53UHQ7DwITUrvLyvzt1HBLSHaQaZ8fpdIp3kWeT20F4N4HGIU5JKsHeWBdDZUuKM=
X-Received: by 2002:a05:6214:27ce:b0:6cb:ee08:c1e8 with SMTP id
 6a1803df08f44-6f4bfc1a1f9mr498676d6.23.1745437942447; Wed, 23 Apr 2025
 12:52:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250421215818.3800081-1-yabinc@google.com> <20250421215818.3800081-2-yabinc@google.com>
 <48640298-effa-42d4-9137-a18a51637f03@linaro.org> <aAeQcgmL-iqGbG_g@gmail.com>
 <20250422141026.GH28953@e132581.arm.com>
In-Reply-To: <20250422141026.GH28953@e132581.arm.com>
From: Yabin Cui <yabinc@google.com>
Date: Wed, 23 Apr 2025 12:52:11 -0700
X-Gm-Features: ATxdqUF-LMwUWmW3taSe4IV8gwEgoHiIaDfjDbYRrV--toG-Jr8hdz8bhgWNT-Q
Message-ID: <CALJ9ZPNLgEBxOmDim-vztUknEETwdL-Z2gJ8K9s44TiPgKZgHg@mail.gmail.com>
Subject: Re: [PATCH 1/2] perf: Allow non-contiguous AUX buffer pages via PMU capability
To: Leo Yan <leo.yan@arm.com>
Cc: Ingo Molnar <mingo@kernel.org>, James Clark <james.clark@linaro.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Mike Leach <mike.leach@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Liang Kan <kan.liang@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_125224_262531_73F0DAB9 
X-CRM114-Status: GOOD (  30.30  )
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

On Tue, Apr 22, 2025 at 7:10=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> On Tue, Apr 22, 2025 at 02:49:54PM +0200, Ingo Molnar wrote:
>
> [...]
>
> > > Hi Yabin,
> > >
> > > I was wondering if this is just the opposite of
> > > PERF_PMU_CAP_AUX_NO_SG, and that order 0 should be used by default
> > > for all devices to solve the issue you describe. Because we already
> > > have PERF_PMU_CAP_AUX_NO_SG for devices that need contiguous pages.
> > > Then I found commit 5768402fd9c6 ("perf/ring_buffer: Use high order
> > > allocations for AUX buffers optimistically") that explains that the
> > > current allocation strategy is an optimization.
> > >
> > > Your change seems to decide that for certain devices we want to
> > > optimize for fragmentation rather than performance. If these are
> > > rarely used features specifically when looking at performance should
> > > we not continue to optimize for performance? Or at least make it user
> > > configurable?
> >
> > So there seems to be 3 categories:
> >
> >  - 1) Must have physically contiguous AUX buffers, it's a hardware ABI.
> >       (PERF_PMU_CAP_AUX_NO_SG for Intel BTS and PT.)
> >
> >  - 2) Would be nice to have continguous AUX buffers, for a bit more
> >       performance.
> >
> >  - 3) Doesn't really care.
> >
> > So we do have #1, and it appears Yabin's usecase is #3?

Yes, in my usecase, I care much more about MM-friendly than a little potent=
ial
performance when using PMU. It's not a rarely used feature. On Android, we
collect ETM data periodically on internal user devices for AutoFDO optimiza=
tion
(for both userspace libraries and the kernel). Allocating a large
chunk of contiguous
AUX pages (4M for each CPU) periodically is almost unbearable. The kernel m=
ay
need to kill many processes to fulfill the request. It affects user
experience even
after using PMU.

I am totally fine to reuse PERF_PMU_CAP_AUX_NO_SG. If PMUs don't want to
sacrifice performance for MM-friendly, why support scatter gather mode? If =
there
are strong performance reasons to allocate contiguous AUX pages in
scatter gather
mode, I hope max_order is configurable in userspace.

Currently, max_order is affected by aux_watermark. But aux_watermark
also affects
how frequently the PMU overflows AUX buffer and notifies userspace.
It's not ideal
to set aux_watermark to 1 page size. So if we want to make max_order user
configurable, maybe we can add a one bit field in perf_event_attr?

>
> In Yabin's case, the AUX buffer work as a bounce buffer.  The hardware
> trace data is copied by a driver from low level's contiguous buffer to
> the AUX buffer.
>
> In this case we cannot benefit much from continguous AUX buffers.
>
> Thanks,
> Leo

