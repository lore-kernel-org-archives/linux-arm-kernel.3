Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D2CC02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 15:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A7WzHPt/cWpfOHApvRgjD4QZNtPcP64L7GIPpO/klVU=; b=Jrnobcy5pbKkeVpPTZIFVsRQDk
	RzRilBQTU/NQ1g+85c1wFtgRJ30Fd9OpQoUgIWa7lLnRIXXa+ImAWogKngBFSNcK00p+Xg84zMzH2
	DdL85oLeNrvpIsinuY84pDVGrWaMYAe+ymqO3nIz94R8ocwqudnH61gzxIcIaIv8AAcPHoZk5wsfr
	hZ0bVzS5O131slSoQijS00gVLkrZanLknS2UmxZ1LB3hfRJHwt/z89eyMGXc3QBYC+sIn3Ht/BKO2
	BL667pXPXImD4WNmUJPgWYz0yIZEEBx+cN9kHJ1C5o7qxZclWPocuYia0ixg9CvkQzAPiRl6y+aZr
	mSAfqqxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY5Bg-0000000CFRn-3mWC;
	Wed, 15 Jan 2025 15:20:08 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY59D-0000000CF2t-42io
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 15:17:37 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-6d8f75b31bfso59575186d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 07:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736954254; x=1737559054; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7WzHPt/cWpfOHApvRgjD4QZNtPcP64L7GIPpO/klVU=;
        b=iORMseqIPSAbTfaLMF7BzY9J03aBO2GDg5hqnXvuCJ3qN5atzNrKqj9fm8X9eRQ0cI
         ENdTqB4t3FC99z5N1pEVYlzfwM3aAXKAJV057aZ/UKrg6CKdkTa4vCY/nCEU8MSX6p0j
         429yFQj/ffxpK8cg326t2zRLaKCNvUWGX12hIUg4UXMasRQMq2OIziZuuDHtXetBkr2I
         V3bGdwqwb8L4RwzRxlAQqid96ZFsmmh8a1c2aPV2JQFw7KySgQw8fDysf+p3QGSF4f4/
         CqqX+5hRQIlfJcqJnP2jk9ds1omBz20ImSSskLI+9J+AYY0Hrxm2M4VT4gajPGCgFDcC
         rcsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736954254; x=1737559054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A7WzHPt/cWpfOHApvRgjD4QZNtPcP64L7GIPpO/klVU=;
        b=lUvED33K/0o/n0h0CuLQZ9l4KRwWZZGNYyMHuxCe+nKQzpdByG1hCpXjE0GPoarqdC
         9MiwgGVLeZK0XniyT6PYuY3KqiIMaJANenBEtsNA7owX140cM/OeGNwKVhUP6PJChknM
         gi/9MzHiJN29MduBMFBSeZ/VYQLw/uLiewiya4k7Wqee3tk7j2qKwrm4xbTP1v+ge7mH
         9smgVtCvcHMIkrWwjYDAx4zJ0hKwVmFKNrvOOkEom75zxEIklBs+Hy0u9uQBrLear5EH
         /YrgR+sUtjFim5Q8CzyFXdN+1XVKSYKzLtbVYprCSb4j/icZbuXNJwxvEu98JPe65c/+
         z9UQ==
X-Forwarded-Encrypted: i=1; AJvYcCVH2fGDmetwDfoDI4Oru6BmpauGCwHIWLY4QEwc0RMizG6nFcEYOi1EUe5FyeT92NJ5qxZa2hV3K2MLOkt7VehA@lists.infradead.org
X-Gm-Message-State: AOJu0YwgTGdG67dCWEAEA8lwrkSUxK42u2J8cf3B93dp21ao1w5MYzok
	kVjufBWze41hKSe9VmL/PfSHqwfRva9YJCyqlWcniaXP0pTlwkdaYJUQD7qFbEoksASGXTxX5sY
	p91pcuzT8Q72SJLpoxvIUkbTCvwSpsmICDBSp
X-Gm-Gg: ASbGncvWKLF1g02akbjLtVgHE0Dp9FNH+SPbzK18j9qTfc/CkqOLKCEaAtXxofvfUdY
	AGvBB9lXTJDlZddCTOxCr7Qc7dRqX6B0IUIdMUE5NYg43nm9s1Fs417ShotAr+fPiaMyi
X-Google-Smtp-Source: AGHT+IExamaQV69QfDT6mt7pi4rOTIShHeVotAi3fypa8T+VZtB/JGqy31OBdOOudK5fsyrNV0iaD1BO6s7Tv7OYVl4=
X-Received: by 2002:a05:6214:2f8e:b0:6df:ba24:2af2 with SMTP id
 6a1803df08f44-6dfba242b5bmr334969386d6.25.1736954253788; Wed, 15 Jan 2025
 07:17:33 -0800 (PST)
MIME-Version: 1.0
References: <20250114-kcov-v1-0-004294b931a2@quicinc.com> <CANpmjNPUFnxvY-dnEAv09-qB5d0LY_vmyxhb3ZPJV-T9V9Q6fg@mail.gmail.com>
 <Z4ZfzoqhrJA0jeQI@hu-jiangenj-sha.qualcomm.com>
In-Reply-To: <Z4ZfzoqhrJA0jeQI@hu-jiangenj-sha.qualcomm.com>
From: Alexander Potapenko <glider@google.com>
Date: Wed, 15 Jan 2025 16:16:57 +0100
X-Gm-Features: AbW1kvYef5mtP3iXS_rQEHTfWGlWNRIExvdT9bNMIFnqNFmmY6UipxblFzMqMNY
Message-ID: <CAG_fn=XFkNVkT3EmB99SdEBAwkGq3EUdM9xR4rzH_HatrJw8rQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] kcov: Introduce New Unique PC|EDGE|CMP Modes
To: Joey Jiao <quic_jiangenj@quicinc.com>
Cc: Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@linux.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_071736_003193_E1AD7993 
X-CRM114-Status: GOOD (  22.99  )
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

On Tue, Jan 14, 2025 at 2:00=E2=80=AFPM Joey Jiao <quic_jiangenj@quicinc.co=
m> wrote:
>
> On Tue, Jan 14, 2025 at 11:43:08AM +0100, Marco Elver wrote:
> > On Tue, 14 Jan 2025 at 06:35, Jiao, Joey <quic_jiangenj@quicinc.com> wr=
ote:
> > >
> > > Hi,
> > >
> > > This patch series introduces new kcov unique modes:
> > > `KCOV_TRACE_UNIQ_[PC|EDGE|CMP]`, which are used to collect unique PC,=
 EDGE,
> > > CMP information.
> > >
> > > Background
> > > ----------
> > >
> > > In the current kcov implementation, when `__sanitizer_cov_trace_pc` i=
s hit,
> > > the instruction pointer (IP) is stored sequentially in an area. Users=
pace
> > > programs then read this area to record covered PCs and calculate cove=
red
> > > edges.  However, recent syzkaller runs show that many syscalls likely=
 have
> > > `pos > t->kcov_size`, leading to kcov overflow. To address this issue=
, we
> > > introduce new kcov unique modes.

Hi Joey,

Sorry for not responding earlier, I thought I'd come with a working
proposal, but it is taking a while.
You are right that kcov is prone to overflows, and we might be missing
interesting coverage because of that.

Recently we've been discussing the applicability of
-fsanitize-coverage=3Dtrace-pc-guard to this problem, and it is almost
working already.
The idea is as follows:
- -fsanitize-coverage=3Dtrace-pc-guard instruments basic blocks with
calls to `__sanitizer_cov_trace_pc_guard(u32 *guard)`, each taking a
unique 32-bit global in the __sancov_guards section;
- these globals are zero-initialized, but upon the first call to
__sanitizer_cov_trace_pc_guard() from each callsite, the corresponding
global will receive a unique consequent number;
- now we have a mapping of PCs into indices, which can we use to
deduplicate the coverage:
-- storing PCs by their index taken from *guard directly in the
user-supplied buffer (which size will not exceed several megabytes in
practice);
-- using a per-task bitmap (at most hundreds of kilobytes) to mark
visited basic blocks, and appending newly encountered PCs to the
user-supplied buffer like it's done now.

I think this approach is more promising than using hashmaps in kcov:
- direct mapping should be way faster than a hashmap (and the overhead
of index allocation is amortized, because they are persistent between
program runs);
- there cannot be collisions;
- no additional complexity from pool allocations, RCU synchronization.

The above approach will naturally break edge coverage, as there will
be no notion of a program trace anymore.
But it is still a question whether edges are helping the fuzzer, and
correctly deduplicating them may not be worth the effort.

If you don't object, I would like to finish prototyping coverage
guards for kcov before proceeding with this review.

Alex

> > > 2. [P 2-3] Introduce `KCOV_TRACE_UNIQ_EDGE` Mode:
> > >    - Save `prev_pc` to calculate edges with the current IP.
> > >    - Add unique edges to the hashmap.
> > >    - Use a lower 12-bit mask to make hash independent of module offse=
ts.

Note that on ARM64 this will be effectively using bits 11:2, so if I
am understanding correctly more than a million coverage callbacks will
be mapped into one of 1024 buckets.

