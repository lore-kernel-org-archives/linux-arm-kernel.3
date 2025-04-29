Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B57A0C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 18:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6qHWKZeK4ritAUfK+7VjAlw31q6vqsBixsKT44Ec01E=; b=Hor3H9aaAz8QPxpDF1fTStdNRs
	FsKzTnOrYVzXd7hkyPBm+02JvKkQFTTmr+3lkj9Tt8bwVZpJBXfNfuos2rQ/m46pDfPQN/6ZZ948t
	P7gh+hssWvCEpjeV3zzDMrWSN0DCg1y5Mof65BPQXsp8pZ6YKleJ8+22voVAJR5dCS2o/Rpj0PmK1
	IcVmB8qFT4plfclu7Sit6m9a/JTujTZCelcabWIYh+rjivtBGwkydDUvDIB4agN8WjFWrJfX7pn19
	WcMinKjt1ngM7ctwwFD4Tsx1MCpl/NQp4FCtlq16rnqeJ2t945lyLS2sgnkOV0YEei0BApGjdycc5
	n01YEBQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9pVA-0000000AVDt-3aWQ;
	Tue, 29 Apr 2025 18:16:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9oLn-0000000ALuV-32Ng
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Apr 2025 17:02:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6qHWKZeK4ritAUfK+7VjAlw31q6vqsBixsKT44Ec01E=; b=QZwQGTuvqgsgbzSCOwjmV3nuwl
	Gewv+qKef54Oa10v2rygiOaK8PdkGZ/nwnUl6yYLLLjMY3IoW3UOqzJY4RiNKOGD5xBI3Ovcv4Zy4
	NYyB8kR/2nxvxB4YVRnHNrtY3BjJpyyYt13DInbL9YvQgbLJLeek6WvOVZobNqm9N12bVEu5U9vV2
	jzE/e9joForVKdRWv2cZN08DNQPpi2+vfzb13mnkqHZb3GJ3jvUxT3jbIMzI3SqlKwiP5lyVi+q4Z
	Yxgb5YArsIuvuh6TncD+nqT0bJ5h5bNuXTVAd9tc36qUDVXSr0O4YsvPkMxdXFmbSe5lIlZ6WpkAJ
	70hV+E5g==;
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9oLj-0000000DURP-0K3Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 17:02:30 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6f2b04a6169so68894096d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 10:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745946142; x=1746550942; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6qHWKZeK4ritAUfK+7VjAlw31q6vqsBixsKT44Ec01E=;
        b=I8PhO3IOpnP8iyrZMAa9zeRZFf81kij7/22dxqbSbtKqnEoIt5wdNom2wUsaM1iuGn
         egEJGrwpnrZdvaxoPrFz0JGfRLHivB6+okzunipXUR9Huqk3/8Q4VYCVTAekZx7f3nLH
         cU/EkDtxGCgWA8wBFb/cr4WCR4O6WPgsi6bFc29AFUqs9o1S2Y5xaJ+jzzt85c8LphNK
         oeoJbJaxf/iWGLHyBBHrDXtZb65ZaTaGVM91cbTMBLa/uXr9kb4c/PsaO78N46V2Xo+4
         U/iDN3vAruo/e9+7RuKzFurlV3JnXVUGDKXPrwWQNoiK24og1/zo2sMCRru03nghfri5
         eRqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745946142; x=1746550942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6qHWKZeK4ritAUfK+7VjAlw31q6vqsBixsKT44Ec01E=;
        b=uzxX1OsgWkdMQrPJjiRxv9ExUs1lu8QGEVFY9+oQXX0+VuUNBAKG6Pzky6GmBezLHF
         zDBerPEbDek/bJ25Ah7vtilzUqUODsJLu3bhwM9YxLNsLWWbEW4izOI6qa0SLa3cykvW
         O0QFxeUHDxsecXD4SSIKfbbZPggWkJDfQZh3E/ZIyy9T8BQi9dNDDfgJHyeFpjIgcdzx
         fZmUGA4tokKXvY3df3aXCOq1iTJD3wbwohNNsreMvIyn8cAFoT9aHuW/Ov2lVrM1ecO4
         s7n01xVVuDTreNtlYAqmEctANRxcP12PEFudajGWvSo3SqYLXkqXT/MwxmB61RwGTQnX
         hxHA==
X-Forwarded-Encrypted: i=1; AJvYcCWjTpXVuIPeIq9ESMMbnqwtBP6exeNpL5lloiLA9xFFdl3YjAx2Nd8pXE+3rHpamk+VMFWTLNLzblt2KdKp4wGd@lists.infradead.org
X-Gm-Message-State: AOJu0Yzd7j4rBi5WtklMMcBg1V1wZlW+8ZNSrh5VaC2TTWmEll8AW0BY
	ZN+iDVDnbYc6nX9Cx3/c8YWKq5RY3nSJLtayLjlmn7y/75ciybsis8tF0z6k7THbHsgjxx0IHIw
	85jyLY3UfLgUqDcGFp1TB+hYINlO+zBR4PHI=
X-Gm-Gg: ASbGncuRP5zk5Pgn6dE1nBsv8TjuofP9HlHjTemCFB5Fz6BwQJq1p1HmOQYFuciuvK/
	vUHWdOVTBkMebY75o99+pWpgEV3e9LUPqn7ym/BuaMEv3ft/HGHH2RJOyh4oWwuzTTm4SYEGNls
	O7twJcR1rA3DNu5+LsbCWSytI8NK/OMNKFEIb0M43IzILAidbkomc=
X-Google-Smtp-Source: AGHT+IGJ2FFd6Eiwu9oIiINLmRXDdz0Z5mu/0T6rc0ayxYrgV8A3GYGLzgZnX06XlBBhgN6OaBE8Qx+Gn+Z+i3mrGnw=
X-Received: by 2002:a05:6214:2247:b0:6d4:238e:35b0 with SMTP id
 6a1803df08f44-6f4fce9dc4dmr2026256d6.17.1745946141318; Tue, 29 Apr 2025
 10:02:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250421215818.3800081-1-yabinc@google.com> <20250421215818.3800081-2-yabinc@google.com>
 <48640298-effa-42d4-9137-a18a51637f03@linaro.org> <aAeQcgmL-iqGbG_g@gmail.com>
 <20250422141026.GH28953@e132581.arm.com> <CALJ9ZPNLgEBxOmDim-vztUknEETwdL-Z2gJ8K9s44TiPgKZgHg@mail.gmail.com>
 <f03715ac-a4ac-415d-8daa-1914384319fb@linaro.org>
In-Reply-To: <f03715ac-a4ac-415d-8daa-1914384319fb@linaro.org>
From: Yabin Cui <yabinc@google.com>
Date: Tue, 29 Apr 2025 10:02:09 -0700
X-Gm-Features: ATxdqUESro1ma6kgnDZ_JUnNPtdCVCZAaJx-9arTO5zJv1h0N-wUAHCe0Ud_CwE
Message-ID: <CALJ9ZPMiJ4oZerKWb4TL8swh8K3tfj70LTL+WibTRN-vB8rqvw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250429_180227_190837_B790E20C 
X-CRM114-Status: GOOD (  38.64  )
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

On Mon, Apr 28, 2025 at 1:56=E2=80=AFAM James Clark <james.clark@linaro.org=
> wrote:
>
>
>
> On 23/04/2025 8:52 pm, Yabin Cui wrote:
> > On Tue, Apr 22, 2025 at 7:10=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote=
:
> >>
> >> On Tue, Apr 22, 2025 at 02:49:54PM +0200, Ingo Molnar wrote:
> >>
> >> [...]
> >>
> >>>> Hi Yabin,
> >>>>
> >>>> I was wondering if this is just the opposite of
> >>>> PERF_PMU_CAP_AUX_NO_SG, and that order 0 should be used by default
> >>>> for all devices to solve the issue you describe. Because we already
> >>>> have PERF_PMU_CAP_AUX_NO_SG for devices that need contiguous pages.
> >>>> Then I found commit 5768402fd9c6 ("perf/ring_buffer: Use high order
> >>>> allocations for AUX buffers optimistically") that explains that the
> >>>> current allocation strategy is an optimization.
> >>>>
> >>>> Your change seems to decide that for certain devices we want to
> >>>> optimize for fragmentation rather than performance. If these are
> >>>> rarely used features specifically when looking at performance should
> >>>> we not continue to optimize for performance? Or at least make it use=
r
> >>>> configurable?
> >>>
> >>> So there seems to be 3 categories:
> >>>
> >>>   - 1) Must have physically contiguous AUX buffers, it's a hardware A=
BI.
> >>>        (PERF_PMU_CAP_AUX_NO_SG for Intel BTS and PT.)
> >>>
> >>>   - 2) Would be nice to have continguous AUX buffers, for a bit more
> >>>        performance.
> >>>
> >>>   - 3) Doesn't really care.
> >>>
> >>> So we do have #1, and it appears Yabin's usecase is #3?
> >
> > Yes, in my usecase, I care much more about MM-friendly than a little po=
tential
> > performance when using PMU. It's not a rarely used feature. On Android,=
 we
> > collect ETM data periodically on internal user devices for AutoFDO opti=
mization
> > (for both userspace libraries and the kernel). Allocating a large
> > chunk of contiguous
> > AUX pages (4M for each CPU) periodically is almost unbearable. The kern=
el may
> > need to kill many processes to fulfill the request. It affects user
> > experience even
> > after using PMU.
> >
> > I am totally fine to reuse PERF_PMU_CAP_AUX_NO_SG. If PMUs don't want t=
o
> > sacrifice performance for MM-friendly, why support scatter gather mode?=
 If there
> > are strong performance reasons to allocate contiguous AUX pages in
> > scatter gather
> > mode, I hope max_order is configurable in userspace.
> >
> > Currently, max_order is affected by aux_watermark. But aux_watermark
> > also affects
> > how frequently the PMU overflows AUX buffer and notifies userspace.
> > It's not ideal
> > to set aux_watermark to 1 page size. So if we want to make max_order us=
er
> > configurable, maybe we can add a one bit field in perf_event_attr?
> >
> >>
> >> In Yabin's case, the AUX buffer work as a bounce buffer.  The hardware
> >> trace data is copied by a driver from low level's contiguous buffer to
> >> the AUX buffer.
> >>
> >> In this case we cannot benefit much from continguous AUX buffers.
> >>
> >> Thanks,
> >> Leo
>
> Hi Yabin,
>
> So after doing some testing it looks like there is 0 difference in
> overhead for max_order=3D0 vs ensuring the buffer is one contiguous
> allocation for Arm SPE, and TRBE would be exactly the same. This makes
> sense because we're vmapping pages individually anyway regardless of the
> base allocation.
>
> Seems like the performance optimization of the optimistically large
> mappings is only for devices that require extra buffer management stuff
> other than normal virtual memory. Can we add a new capability
> PERF_PMU_CAP_AUX_PREFER_LARGE and apply it to Intel PT and BTS? Then the
> old (before the optimistic large allocs change) max_order=3D0 behavior
> becomes the default again, and PREFER_LARGE is just for those two
> devices. Other and new devices would get the more memory friendly
> allocations by default, as it's unlikely they'll benefit from anything
> different.
>
Good suggestion! I will upload a v2 patch for that.
>
> Thanks
> James
>

