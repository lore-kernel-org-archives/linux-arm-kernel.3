Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 645A0C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 20:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TCjogQfkKhbdMF0UGzixY7XrKAjTABD1okRnqIJZJIw=; b=zPjhylJgiKfq35kHpsaa5mZsm1
	y97Mx+/WbrErMf+IR0TIDNXTv8bsorgdvEU6KF2UEjgbwma+vNBQx/izqw6B3S0nzo1IwrdJ0miE6
	seMzmYMazBs7EFMPjoMXXbRvlbwCipM4j6uP+Gsi+XIZ/lzrxX+Fy3cQD91f1HHiWW7hx46BfXB4n
	uwkpFLdVit6aW2niMKxo7/yTJ0zTOKLQk0lBJeX/afsYL9iItKU4ajgsIL/9GqXCajaukYtewLhyz
	6vOdvDnX7lgE/bPwQ8c1E36kp7VdEeNE45u+bvzwrZaFRie3N+kwYsO6/676/2D02xAGkJ2fprKQL
	5nvgkebw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpvHS-00000009Cj3-14M8;
	Wed, 05 Mar 2025 20:23:50 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpuez-000000096YS-3T7U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 19:44:07 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-22113560c57so135780695ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 11:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741203844; x=1741808644; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCjogQfkKhbdMF0UGzixY7XrKAjTABD1okRnqIJZJIw=;
        b=MeJ9aKTZ9GysUGqRrE9UsmsBBDsu6I9RjFn/KkntkiZJVa13ZKCz+8JGD7Sj/+f2Ka
         hqzclKFcgJO/9lgxQCKBG7jv05GDvHM1Ow44AKJMMn0v5bgOZKEFgNxIgEYxOiKzL+EH
         b3z5faimbHF/BrhLX/npGfImtJjQSRgYuGd5fADmaIJJMtzys+2roZppKmejV60YRNLr
         ZyuUDWoELj7pYeqUpbGNf5bt6affTI9WRvmQ5efZSmMAy4Bk1wzLF/5Jtg2hyevEJ205
         VNCWsCsum8Ndg6xhvdXxYfTE3+iAcB1EHLSmSpTjg3dNXQoT0kl7yQEOXPUImRU9g0au
         U+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741203844; x=1741808644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TCjogQfkKhbdMF0UGzixY7XrKAjTABD1okRnqIJZJIw=;
        b=TYvugqgWVq3tDX3jWSLG8Y73Wdo6efv+mI92DN16agYgIo+Zyfv1obFZEZ0CnIiFYH
         cp+RGJlnGCa29Sc4qg0C2VQD4LBltRPjMnBfmXIPTBG31v8OWHrpICtNWMo2ZSXu4t07
         k/1BoT2rFS41VliWMyuDtucG2DJ3764t1nBJg0hzo335Tu1dQwkM6K986I79yKWwHnJc
         2nh/jawkqcZuInSci/fisL5+Ogvy6rK+JECHq9rub+kFCpwzuJym+5rAmh4UGxMdl3Ae
         eac/5n+5un4bzTZV6ZOPDB8VCgEtd4QTHuu0Ic35Fq4HY0ITm7KUlLa2vySwRmzZcSvE
         4+MA==
X-Forwarded-Encrypted: i=1; AJvYcCUzN5GuWr0bobRy0ccqBPpqbfo1ST4tMhUitWTMpO9CqY7xvDNRRr/vEmU5EW4ba6ekVtwDYZso3xaVL45nEYwP@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1rkXPXifyJFtjRjwdd5rwSfx9vJt1vjUP6ni9kAqHgrRwcV57
	sSJijg/kogkMdy9/HZ9ABr/sNwVyopkguXZW5Jl7BUcCswQkbFQIe8pBWnTwhowQi0wpptKHL9M
	fiHmZcvOpfUniaN7MWbIL5eUoud8=
X-Gm-Gg: ASbGncvkdqdbvyUUsoXIEqhZjJjOpQI0Yu5YxMnQ0HQwE+001wYdKPvD6RBG91pLHOD
	p5FwGUqfp4KHd8yzzhKk6VIxN2dborBeDXWKZAD0KBYhAjMk6+yYinC7BMRhtUvPPqsOZ1ofIMi
	Qn/JJJJJ8jI5INE++UkyseWTP9
X-Google-Smtp-Source: AGHT+IFdCDYj/agpQVhv3dAYVCWS6XsBw5aAFSnr2mfwdcK9Y4FN9aCNwjHl/acg8MGpJUB2P/zufNqUs3lMvnM53KY=
X-Received: by 2002:a05:6a00:21cc:b0:736:457b:9858 with SMTP id
 d2e1a72fcca58-73682b7405dmr6071779b3a.10.1741203844549; Wed, 05 Mar 2025
 11:44:04 -0800 (PST)
MIME-Version: 1.0
References: <20250304154846.1937958-1-david@redhat.com> <20250305152055.GB28112@redhat.com>
In-Reply-To: <20250305152055.GB28112@redhat.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 5 Mar 2025 11:43:52 -0800
X-Gm-Features: AQ5f1JrrjsXo3LTI9gnU7JfioqsYSvoLENxHqqnaxX48DOE6niZSlJc8m2hl6mM
Message-ID: <CAEf4BzbyFy0eQHLac3zR8GiGDOUqYoTGAWDbFaeou903OGOTpg@mail.gmail.com>
Subject: Re: [PATCH -next v1 0/3] kernel/events/uprobes: uprobe_write_opcode() rewrite
To: Oleg Nesterov <oleg@redhat.com>
Cc: David Hildenbrand <david@redhat.com>, Andrii Nakryiko <andrii@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linux-trace-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Matthew Wilcox <willy@infradead.org>, Russell King <linux@armlinux.org.uk>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, "Liang, Kan" <kan.liang@linux.intel.com>, 
	Tong Tiangen <tongtiangen@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_114405_863507_E1C56E71 
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

On Wed, Mar 5, 2025 at 7:22=E2=80=AFAM Oleg Nesterov <oleg@redhat.com> wrot=
e:
>
> On 03/04, David Hildenbrand wrote:
> >
> > Currently, uprobe_write_opcode() implements COW-breaking manually, whic=
h is
> > really far from ideal.
>
> To say at least ;)
>
> David, thanks for doing this. I'll try to read 3/3 tomorrow, but I don't
> think I can really help. Let me repeat, this code was written many years
> ago, I forgot everything, and today my understanding of mm/ is very poor.
> But I'll try anyway.
>
> > Are there any uprobe tests / benchmarks that are worth running?
>
> All I know about uprobe tests is that bpf people run a lot of tests which
> use uprobes.
>
> Andrii, Jiri, what you advise?
>

We do have a bunch of tests within BPF selftests:

cd tools/testing/selftest/bpf && make -j$(nproc) && sudo ./test_progs -t up=
robe

I also built an uprobe-stress tool to validate uprobe optimizations I
was doing, this one is the most stand-alone thing to use for testing,
please consider checking that. You can find it at [0], and see also
[1] and [2] where  I was helping Peter to build it from sources, so
that might be useful for you as well, if you run into problems with
building. Running something like `sudo ./uprobe-stress -a10 -t5 -m5
-f3` would hammer on this quite a bit.

I'm just about to leave on a short vacation, so won't have time to go
over patches, but I plan to look at them when I'm back next week.

  [0] https://github.com/libbpf/libbpf-bootstrap/tree/uprobe-stress
  [1] https://lore.kernel.org/linux-trace-kernel/CAEf4BzZ+ygwfk8FKn5AS_Ny=
=3DigvGcFzdDLE2FjcvwjCKazEWMA@mail.gmail.com/
  [2] https://lore.kernel.org/linux-trace-kernel/CAEf4BzZqKCR-EQz6LTi-YvFY4=
RnYb_NnQXtwgZCv6aUo7gjkHg@mail.gmail.com

> Oleg.
>

