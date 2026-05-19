Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B0FCD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 19:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cojGRWW/Ex1hiO5wrDav3feItUxRSAUPq9EN/ARWbRI=; b=BIs/VJp2dNcwNWp4fHtGRBiqCB
	DsYR7UVTV6iuz8XZ/owB0PkSfFOmahoAN5C17sCjUhVbp5QS/OqgYVJtH/COyASGo6w2JmV/Etpz8
	SpZjZQ9BoQmuKdxRbKjRc9aky3CIW39wkmC9yjHbi+TTh2Jp9e7AuZmilrF3WuCnQfBIVDl/JoPZJ
	AOSLCaVbW8lkkDDQV8aEuSFJqeSp7Vvaf3yXXGReSqH4QAKSLHlCqPZXIK2zZ/YFTc4OqOSJnJf7a
	AGr+zXCJviRx3it8Bczna0PUHKENC/+C/5mmzVhvGL9b7MLSVs9l7OZhAVarvOC9E9s3VqR/wShcv
	DUzOF71w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPPkR-00000002ZuO-3qqo;
	Tue, 19 May 2026 19:04:59 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPPkP-00000002ZtZ-24PU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 19:04:58 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-44c350a5b87so2404478f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 12:04:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779217495; cv=none;
        d=google.com; s=arc-20240605;
        b=ArfhTIw6i3RyV3cy/LfaQ8EhHXqliF6UWVlKOtWYPag20LwMWCOoFxRm5yRqSqG7Lq
         U+JpVQmQYp+MWtE08YNEhKFfGMoSn/qrgCpL1LsTL2Y7HpINMLE32QEhvHZBLeQX25ma
         aqSAy8R9foseON6WnUCpM6PvojLWWSKpOO9aBNDraU7zQ/pjfS7PGclFu63dU3rRYUHk
         plQgbQ9HrlJ58J6qEAEqrLk04qZqEMijSqnuko3t/M1DXmkMQqLGnqBfoScerAEu4aT/
         DYVDZqN4SUwwcvkz1j8ONTVXcUtwvUvixIeMJsId85gzEkUmJ6h6nEVkLDYGYVrX1gPu
         R+Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cojGRWW/Ex1hiO5wrDav3feItUxRSAUPq9EN/ARWbRI=;
        fh=ZNncFLIwvxlIFLPqPlWaeJVe3+jHHcqIScQlfVVCqtI=;
        b=a53rfN+lse/mlpoC5LLPKDdWkNufa7fZfKjtw9tnzmcNBXWBe2Sd/56hXm6dY+iTF2
         tjBXKcEvrWVJCA7OPZjmXGt+BW4dy5/7N7k8ekGgLSmqMja18C4bkjssKx8VCd2cFHcv
         iNPMNlrEFu+kdExxo1ZjlfuOjavW45uSCPeCtSUxBnv0LE2tJVgP/+y3RneX7qXcUuF7
         +7Hr/ybc5lAJlk3XgYZGnoR4SDjVxcUuTQgPOAD8K8ilkLK26J77Bllke2tWn3Uvgmeb
         WuJ6rDUrG3fsNfAKUujYFd1obEHuHQioAS9Y481gjWJKPHJRH8mboZMXUMZnQ5YoRIlX
         4OSg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779217495; x=1779822295; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cojGRWW/Ex1hiO5wrDav3feItUxRSAUPq9EN/ARWbRI=;
        b=RXeerT41gXzCx4uU3qKh01aLh7VFgpGZufu9QgU0ADWkX1qTyfDaP1j3+Ddwvx7B/L
         JdDxlxXXTmx2NzX5klWkk57+WAQu3PRRH/N9yx0qMpL5KJGQGOCx0+eQmHgiAolCG6HJ
         EvfcIhtiOCEOFg6JCc/MLHYTsgN1zuuuF+ViXdTLuXy+5EPX0FI6XPP4mMPXNGmvH54s
         OLDYynkEfFTJY8g4T4NhIfxebIINZlA+kttp3Txvxx0J7aJ0QwjrN7hJ+/2OdT5PnH6E
         DzaAbBECKbyQ0gEq5NFgSgjPjP4MlkCtyIJxxtUbrvkA+qK8G6hk/AeKvr5SBYoxtoKM
         3iMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779217495; x=1779822295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cojGRWW/Ex1hiO5wrDav3feItUxRSAUPq9EN/ARWbRI=;
        b=oabOQ1O0u2wBJt6FCsCq97XHs7cCG1sBaBNAG/AkNHGuisy8eOSjH1M34MGtj1+T/b
         3Zg9osSz6fcYLK+dGqLGiH8Y9/P8dACZh1BXIaGSXPmvVMAQUGjaQa95XSSdBhGD/2tD
         E+KvGjltz/qb/Ctti5oXrF8hIiZtCs3oYGXtMQvS1tSvNWwmOhHrSP6M/qfg0SN9foZT
         JEjKMATF2o9C+Wq+UGxrve6D5QvYKCjEJaB/E0nTccd5gE2DbgHJQAk/7RjXLPRYB1Ss
         zj0pHt0EEP4EIvC66V4v1b4X/RCipy2JyAzANlfxnTXSHQKz1WZABC7vTrvkyb/UyTkp
         1/MQ==
X-Forwarded-Encrypted: i=1; AFNElJ/tamuxB3TJJ5tnLCzBFKXkNuBt0hRozzDYsdqEeFaXuONBQKZbQO3lzMp8Pa7uBgU6h5AL9IioVJ3LNp687g9y@lists.infradead.org
X-Gm-Message-State: AOJu0Yxhdo2AYYUaNafGpeUrS1ASkELRg7joyYtsgp9E1JxusYonH1xr
	Rpb7TBhiMi+bn4lliT0Ij5laIq1Fu+7Av0A6u7pyi3iSk5mV1jqd1l+SqAaLrNjlb4ksIm/IAnv
	K8HYR6BRWuTSx7UbeU1KkEO1IXsRMQp4=
X-Gm-Gg: Acq92OEsNmg0aL2io/rP5qO49UG3fWM2wqRXZQIBgMje5/fR0jLfJAgPHDssfV5qyUD
	WtPDKwrVa9ihMnij+x9S3UzT1mUj3dofpOik8Ympl7RrqQLDkgpZwt0UpSb9YxEIb+i6nyfbbHV
	Sj/aoteMU9rromJQLYM0renfS/mqFjP4W9RDjTK87O26kH7fWJpBdXVQ+Si8xkFHZv+mRvysxBQ
	zv0RjAjnvyy/FyBarAuK7dmgajFsw6Ct4vTpznrcnT25S8mJ9VP0uQ7odWG6eYTSEu4UXqjNGTS
	2HiDgxf0ey3fhSnLaq8qU81mu6MqPUHAKbVJHeLUZ2/Pmqg44KJUQWQR/ual+UW6XwU1Bgs=
X-Received: by 2002:a05:600c:a00f:b0:48a:5301:bb5c with SMTP id
 5b1f17b1804b1-48fe63263dfmr337569515e9.16.1779217495209; Tue, 19 May 2026
 12:04:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260517211232.1670594-1-tj@kernel.org> <20260517211232.1670594-2-tj@kernel.org>
 <9ba50fd2-077e-4291-9276-9adb18186873@kernel.org> <agtuPrgIDNKSu2Oo@slm.duckdns.org>
 <2f02d90d-cdc9-48ef-abe3-99e00f22595f@kernel.org> <297658c4ae2d6e7103f5968efc936224@kernel.org>
 <04b03066-86d3-4c0b-b077-307fd0f3bc9c@kernel.org> <5590fd3d-dae1-4070-b52f-bc40982ac678@kernel.org>
 <agyZxmHoueGwBAQg@slm.duckdns.org>
In-Reply-To: <agyZxmHoueGwBAQg@slm.duckdns.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 19 May 2026 12:04:36 -0700
X-Gm-Features: AVHnY4KnCVsDx1rhJ5Rhju09kIJne6tHjry-aCcLnmL6aRppUmxM6vRJAa3dciI
Message-ID: <CAADnVQJt0p7hSn2G074QZRh2LEdthy3RKYJ9j3w5yeJ-e8UQLw@mail.gmail.com>
Subject: Re: [PATCH 1/8] mm: Add ptep_try_install() for lockless empty-slot installs
To: Tejun Heo <tj@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, David Vernet <void@manifault.com>, 
	Andrea Righi <arighi@nvidia.com>, Changwoo Min <changwoo@igalia.com>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, sched-ext@lists.linux.dev, bpf <bpf@vger.kernel.org>, 
	X86 ML <x86@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linux-mm <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_120457_560163_EAC75C11 
X-CRM114-Status: GOOD (  28.78  )
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

On Tue, May 19, 2026 at 10:11=E2=80=AFAM Tejun Heo <tj@kernel.org> wrote:
>
> On Tue, May 19, 2026 at 11:40:48AM +0200, David Hildenbrand (Arm) wrote:
> > On 5/19/26 11:05, David Hildenbrand (Arm) wrote:
> ...
> > >> The only requirements are that the kernel doesn't oops and the
> > >> violation gets caught. Beyond that, behavior at the address is
> > >> unspecified, and which installer wins the race doesn't matter as
> > >> long as kernel integrity holds.
> > >
> > > You'll have inconsistent TLB state.
>
> Wouldn't it still be either or with both cases being okay?
>
> > > I really don't like that approach.
> > >
> > > We should really try to just take the lock, and remove any code under=
 the lock
> > > that could trigger such unpleasant deadlocks.
> > >
> > > Is that feasible?
> >
> > ... or can we run into similar problems with kprobes? (I am obviously n=
o bpf
> > expert ...)
>
> Yeah, I mean, that was just the first TP I found scanning the code. Any
> kprobes or other TPs in the path would behave the same.
>
> When this fault triggers, the BPF program has already malfunctioned, so i=
t's
> not going to be a high frequency path and performance isn't a primary
> consideration. So, anything that can ensure that the kernel doesn't crash=
 or
> lock up would be fine. Any better ideas?

As you guys already figured out the trylock is not an option.
The fault handler has to install _some_ page and let kernel continue.
Scratch page or arena page doesn't matter. Potentially different CPUs
will see different page. It's not a concern at all.
bpf prog is buggy, but the kernel will continue to work without a glitch.
bpf runtime will disable and unload misbehaving prog.

