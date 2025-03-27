Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9BBC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 07:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UVSK2OcQIxu7GqCdEZXROoD138DGI826o2h6Os0Wvbs=; b=gswU0Uu5vVO7zgKHJi0kVZIxkN
	ExHZyYOBmXUW82oKh/Gziz/FOth6bktqJb0PX+NjU/cL+HVgbwMVAaCsQi83ZVeXe3Gc5o5dkvAB1
	xOmuhFDe/y+G34OKmaHPyfz41dB+pQJsce8qYor7T2OHEJlSxRAi10F9tUXugv/rsN1n3eiaAf586
	CkwCUqEly/+4McIuZ4qHbUsA7nuPkOvsBry9oq3lLFN4ULX5ofbP/9Ic1zH1kf0JHEkrFH0/9pmjs
	zYhb8q4DK8ves726uL6Mr8mjd6behCxncGoKg5n5XSFWDESqyqE7xqRWl3cE+5sEbhcraH36tBBt3
	Jsp8GlHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txhiM-0000000AKze-3FgW;
	Thu, 27 Mar 2025 07:31:46 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txhgb-0000000AKoU-2vNK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 07:29:59 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-6e8f8657f29so4916266d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 00:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743060596; x=1743665396; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UVSK2OcQIxu7GqCdEZXROoD138DGI826o2h6Os0Wvbs=;
        b=mhdThEQJjUzT+91Hi+Amtauu9/1Kc7k45oMb1WhUlNo2UUIkuSIKf3GS/wKvmX6RlZ
         FMrm2We7YlqhmxrkxGCDHDO9Dc7mTyPP8M++poQpubuxZI0GcYNUYzWrIIW7v8Ameh8T
         MG8qC7fFM10S4eudZJGVtFHo6PvbMEWchixao76tz6JfwwByuljLczky+Cb0UODyNDFj
         9PVTaIX7uCns3a9WYQgAKe26m0ij0qqoEzrel10m3EA90sT79ZzyQFEOxJBwAd1K3gtw
         aaCJoKLHcWhkXYtdykbktTfN7erU0jAtXsZzYPeQGeVYnuyvOxj3390iTCtuwdjLuWhX
         ysSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743060596; x=1743665396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UVSK2OcQIxu7GqCdEZXROoD138DGI826o2h6Os0Wvbs=;
        b=Gc9HmLzbjzz3ugy6dKLScSAl4MD1IXcrMu5iz0JQasfzhYq2qCTIlA/Ic7+6j5lhAC
         5zwjMHv4l1PMYM6eFiF+YDZ4FyHlHc+9483/wUVoswH7ViA5cdvkraLV/VrEBkyAeCja
         3DTskDd33IyU+R2vprF0zVAkjMwaY2uhHFidEoT/sL7NDiSYg0EDiaTukb4RGVR6QY1T
         j8juvok5wYYWL5hXzj5G14ySTYsJC2VRVlTq8h4X0npayB47GU+c+8Z3fCI/6P8/9/Vq
         J08TTLaOnOtX3QTCsxRaoHZuYPXvuPV3KSeU5+hWEQ4MbWWGv54Iy9qI5ghd42gvCqmi
         g4iw==
X-Forwarded-Encrypted: i=1; AJvYcCV4USfXr0PsC4RVCXVhLCQFGwZUQae6BKJ3omeOV30mphY+Vx/xU4I8Y9eQWIRSQ9EEgfawCyAzNgQjzenIQ6x/@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm8o7BuIxOqaR4K+jIVM5AXP/kPCW/Gs5z/mumbU53bb3UmVwc
	7jCPb+Y3hhEltEAYTinm6xjM8k72VUB2/77/hJNais86S4ppRUFj07PanC5VfSy7gyPJKviLHIQ
	QrFX42bv1E3fTAhIBs288jPDBahFosOQWiBtw
X-Gm-Gg: ASbGncuI0hSOclyDQozBd6gR6W+CXRnOe5bF5zbfU79CBtaX3C8b+pm+Yn6PCred/zX
	3smgiZHaQZsMITWHGR9AfC8YnXrEY01T7Wy/xZg4mFmt51zNlhzYkbmT9q0HWa7pvROQS0EM+So
	Bw6LAinnXhPoTAzelsj1yk6IgIy9jgc51K5YOUvqJocczq/dkhFggTh5PA
X-Google-Smtp-Source: AGHT+IFodbPmwJt4QLy+rox/4P7ba1LI/HNq1Ca31C0T5Xi4oS+Qr4SiPc6bWeImmNVunEMpHRieoFe8u16EuLCSZhM=
X-Received: by 2002:a05:6214:1311:b0:6ed:1da2:afac with SMTP id
 6a1803df08f44-6ed2390449emr39214346d6.32.1743060595360; Thu, 27 Mar 2025
 00:29:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAG48ez2jj8KxxYG8-chkkzxiw-CLLK6MoSR6ajfCE6PyYyEZ=A@mail.gmail.com>
In-Reply-To: <CAG48ez2jj8KxxYG8-chkkzxiw-CLLK6MoSR6ajfCE6PyYyEZ=A@mail.gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Thu, 27 Mar 2025 08:29:18 +0100
X-Gm-Features: AQ5f1JpUvz_D0Czd4hU24LmSodys4uaFqOZY_Yq3Ndxmm6C9Z-cmzAlUlTUQiTA
Message-ID: <CAG_fn=UF1JmwMmPJd_CJQSzQAfA_z5fQ1MKaKXDv3N5+s3f6qg@mail.gmail.com>
Subject: Re: does software KASAN not instrument READ_ONCE() on arm64 with LTO?
To: Jann Horn <jannh@google.com>
Cc: Will Deacon <will@kernel.org>, kasan-dev <kasan-dev@googlegroups.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, kernel list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_002957_753677_269777FB 
X-CRM114-Status: GOOD (  13.96  )
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

On Thu, Mar 27, 2025 at 12:10=E2=80=AFAM Jann Horn <jannh@google.com> wrote=
:
>
> Hi!
>
> I just realized - arm64 redefines __READ_ONCE() to use inline assembly
> instead of a volatile load, and ASAN is designed to not instrument asm
> statement operands (not even memory operands).

Nice catch!

> (I think I may have a years-old LLVM patch somewhere that changes
> that, but I vaguely recall being told once that that's an intentional
> design decision. I might be misremembering that though...)

We have some best-effort asm instrumentation in KMSAN (see
https://llvm.org/doxygen/MemorySanitizer_8cpp_source.html#l04968) and
could potentially do something similar for KASAN, but if I remember
correctly there were some corner cases with unknown argument sizes and
with percpu instrumentation (at least on x86 percpu accesses receive
an offset of the variable in .data..percpu, not the actual address).

> So because __READ_ONCE() does not call anything like
> instrument_read(), I think instrumentation-based KASAN in LTO arm64
> builds probably doesn't cover READ_ONCE() accesses?
>
> A quick test seems to confirm this: https://godbolt.org/z/8oYfaExYf

So should it be enough to call instrument_read()?


--=20
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Liana Sebastian
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg

