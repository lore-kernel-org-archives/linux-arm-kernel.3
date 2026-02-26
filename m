Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4C5FD45FE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 01:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wjQ53JZFB5yfDU+VhP3J0dlwnX2GHMinS2bwduWJ8k0=; b=tKENLLqpfUz6+3ejpCLmFChSp0
	k31iMORPdyQDCQoWCNPxOGWTj7uqr5JiNJTaNgrTCEWqFK3iqPJuFwEIhDp1vqkjLLpVCLYlGS6Zc
	IBaBgqpjhg6RnwfPFSXR4d0AimKjIHdLVmDQRXAMTc3/Yd61oGvdw2eYGvbW+r+qVuUueT0xmgGcQ
	9SlXc1boYHuZPpvpt++bscskZEoddv3zwchHGXijuQHlTBVy6IuQ8cL2YwNcjhiDeHvBkCWAlVDzw
	Dujspz0bYAUdGfbvgoSPgVUd0C9j9XEqMg5tPuPmtbDyv8lBDUtdg+UUdwZiZ/+YCgpOcDn8dFNZN
	+vnSN8eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvQGz-00000005C09-4ADp;
	Thu, 26 Feb 2026 01:34:37 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvQGv-00000005Byc-1qWq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 01:34:36 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2adb1c1f9d4so45845ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 17:34:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772069670; cv=none;
        d=google.com; s=arc-20240605;
        b=PTCMuFdsdZ22eHmqBeY7tD8tMVhCgvD79Xk5P1CPH1e5Ntu9JFplQHIq/zTH1539/b
         Td1iG8Hos3Az/ZBxSIlAo6AEBggIkzzWf8M4O1bNdfiQsXBhAi22TgzX/fMrF89XbrLM
         wofYjzvwIsel34++2KmixcQxpNzssMdKvKeqDnUZlspk/qHknv0Lr0UpS+1Pmu5GXk7/
         Mvxf5++p5mNNNA3qoBuu00omZmKtRP97u/oLMKJOOw2ckS0nEkp5iZxBXWQw7LtSd14R
         zE2FNM4fo3Lw8eNWlczStNR0CcV9tgwINgLozMV6MdAyb1pr15PrSEUzZ12BUZyAAsvk
         dSaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wjQ53JZFB5yfDU+VhP3J0dlwnX2GHMinS2bwduWJ8k0=;
        fh=CghqTJvlLjahv2lHPOOKQf0FImFYDflMHMRACnWRdlU=;
        b=XL+88/TKnJxAQJ9Pf58wo9uPcTuy3I6KCo4ddROWYGOv6Axrgz21tP8gXLaHwxcdSz
         vbsRT2gT8RBQs/hO51iEP2+ABY2zi0ywSjPOJ+ALyHuRxYqIdjqteUsV+S7D+BBDy3ps
         iF6D139tmm3eBGknEmDmxd59x/L0TbR8Nc+YyNyHUYA4ZG/ydT9y+ZtyDzPNfTDltHgP
         lBqLYsntJxNluoBFmZGq7Ig+0eZEgPSi02/LcYWbrTsAQE/Z96I+JcjnhwE4GzZhBKks
         iIWpo+2xn3Um3FqJlYwQnJpAMZ3WKs2snN7qqQBlIRgaEgKaAIgNpvq+Vl2IrvgxNQvu
         PfAg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772069670; x=1772674470; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wjQ53JZFB5yfDU+VhP3J0dlwnX2GHMinS2bwduWJ8k0=;
        b=BpE0yGtnHwPJm8yBhYDZBgHHbZhZ4K/L3kE7SYIH4iTYAg61gv5/NLJtEvuRhU6ac+
         54ZsSAImCqNAe6BPI+vfQ0aG5p/3oUeQs7akX6q21Y618J35NC0i9cMoI2pln6Csri+S
         K9pfm4qDI8GAmLGPYvGkxQ4prRVAsCCiyWCN2t+rq8bIWWpc2CMQeF/oZ+k1dmDzhTm0
         qaAtegi/K/ZvcyfOnFhAJeoMwFKtGFBduH35OoX/yv0KmA5voaiAU9Xoq8HGTU2e0F9N
         saqZ9Nfo5FBtF0gaG2Jar9dE5ozxXR4YTTW8W1nNp5/feFLH7cs9VFWjGcHsoIZiTXhc
         IXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772069670; x=1772674470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wjQ53JZFB5yfDU+VhP3J0dlwnX2GHMinS2bwduWJ8k0=;
        b=ob2ggvrG+pI/+xZ7TgYwo8GDHhWZHLI+C5uRlxKjtUGYRZMu4mkizRXy82mbJ2QHkl
         d/GuY+36xMWDmu5XuSwPWtyisUrhzyfoH8X0sITJIpMFQQyO/i81Wkgt/LVro/nuMiKk
         /YdwKvbiWr3PhYt5n6LmKLGDFuW0HqmzIL8L2DcKM8mzkf7V3sR4FOwvUZa9TO+Od8LC
         HTWoKOscGyyEJb2WlLhWUfKHvYQ5FaoaqSMWdCDfogShE4aUCFnQ1qfMzescQE+XRZzE
         5HqJK+fC/PS8f7BKztxO4omCf7vuP6hGAuEhg5dD26AihOA0mf2rS+mF7SFjlAIWzS9+
         H12g==
X-Forwarded-Encrypted: i=1; AJvYcCWYgPccSR/t8NW0cYqD8xT3xHQYP86mzsbtdbf8iI9LpEXt/sRcTuKyPSep6PVJjN53IPUc3aCRy0IN/IFIxzz8@lists.infradead.org
X-Gm-Message-State: AOJu0YysIhXxQokf1wJFxsQHuzD/1rRg0JX+cp0dEcHP8+WDOf3Fxvf+
	k2FxMtRd5EKwcbQ62Lr1waN2fvP4/CdoiaO52s0ruN+a8JHBIDm6Se76EU77vF6WYsr3OCjvxmp
	poGUYD3kiEJeFwGSfaOnSb0KnRnthU8K3Sd/BoI1+
X-Gm-Gg: ATEYQzyQ1qUul4X1Gbslvbp76akEEcT1jsxb0RQs6FKaapUEx70CjVfQ8KqPx8ac69h
	3Dze/Rl7kw7g9ApKUeuuQxZqX4q4OIvH0LJRD3KW9UYbMXNIyaQBI3FF372jqY1coQGxepmH17l
	ZEFA6JMl0u0CUOa+vhmxtVgtKpYcR+xnJbgN5HoG3AP16urROmK9XBIb+IacM0C6tgw3q4QeTeW
	JCigNoPr7+2BZ3JmsDtzR3B7O/4NKUALZprgei0WA6W72Pb2Vpk/Glwf0fbxtHJyZe2/TSqbsUd
	M2SzbvCQr/IVbpvHLYjYJG4rY1hfNZamGpHWZA==
X-Received: by 2002:a17:903:40cb:b0:2ad:6f9b:7819 with SMTP id
 d9443c01a7336-2adf77de594mr1447145ad.24.1772069669550; Wed, 25 Feb 2026
 17:34:29 -0800 (PST)
MIME-Version: 1.0
References: <20260224142938.26088-1-irogers@google.com> <20260224142938.26088-8-irogers@google.com>
 <q3oys2ukvylrd7xfn7267bh3wpumyxbbxpk2udhps375cmk64p@l7sjnlxll6c7>
In-Reply-To: <q3oys2ukvylrd7xfn7267bh3wpumyxbbxpk2udhps375cmk64p@l7sjnlxll6c7>
From: Ian Rogers <irogers@google.com>
Date: Wed, 25 Feb 2026 17:34:18 -0800
X-Gm-Features: AaiRm53aNAb6Tlux87h_8UOmv876w-RjbJJ3ZYy7jl1sfvFunMT13zrT8xA0lxo
Message-ID: <CAP-5=fWVU3ktkGAnZQrjQJf+Z5AtQo73BVUhj-nr3H95GdcEJQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 7/7] perf unwind-libunwind: Add RISC-V libunwind support
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Dmitrii Dolgov <9erthalion6@gmail.com>, 
	Blake Jones <blakejones@google.com>, Tomas Glozar <tglozar@redhat.com>, 
	Yuzhuo Jing <yuzhuo@google.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Shimin Guo <shimin.guo@skydio.com>, Athira Rajeev <atrajeev@linux.ibm.com>, 
	Chun-Tse Shao <ctshao@google.com>, Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Thomas Richter <tmricht@linux.ibm.com>, 
	libunwind-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_173434_693774_BCF980B6 
X-CRM114-Status: GOOD (  14.32  )
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

On Wed, Feb 25, 2026 at 1:08=E2=80=AFPM Andrew Jones
<andrew.jones@oss.qualcomm.com> wrote:
>
> On Tue, Feb 24, 2026 at 06:29:37AM -0800, Ian Rogers wrote:
> ...
> > +struct unwind_info *__libunwind_arch_unwind_info__new_riscv(struct thr=
ead *thread __maybe_unused,
> > +                                                          struct perf_=
sample *sample  __maybe_unused,
> > +                                                          int max_stac=
k __maybe_unused,
> > +                                                          bool best_ef=
fort  __maybe_unused,
> > +                                                          uint64_t fir=
st_ip  __maybe_unused)
> > +{
> > +#ifdef HAVE_LIBUNWIND_RISCV_SUPPORT
> > +     struct x86_64_unwind_info {
>                ^ copy+paste issue?

Seems very likely :-) Will fix in v2. I'm still after a way to
generate a compile of libunwind from its github with all the remote
headers built and not just the one for the host I'm on. It seems there
is an Android solution for this, but I was hoping for something more
upstream. At this point it is looking to me that libunwind is a dead
project and we may be better just deleting the associated code.

Thanks,
Ian

> Thanks,
> drew

