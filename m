Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C719ED7B96
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 09:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kcjdDEKz8nZvddy7P6HkRER9j+LwEmEbznRAnp0HJSg=; b=RkUdjZUyLRDGfG1qXLNxuKpxJr
	esrOAE1+qA5zoNQ1dz/l+FHuW69rJgEg3C85aS7JRF6VShJA4qAgmbe5JDgeQxNU7iA++wjGgmXJr
	s1vtIs4diI0jM939MqiuhU/mo1tvYN65j09jghS0p57S+FNxnSSTqP+rl1SU8nII6IR37AQlzbO5U
	D4Gpyf5jc39m8eZnIxWpoxy9kKqPQnn0oq7d2hSWIdNBeNnGh1oWRd/YIdWEa0c48kwaRSnAdw7/f
	mLvrEsow2QhSCebRS2kuO/K7sjHJ0UVaYGe+50x+kSYAAMhCCKvQlw8ikiNObdFgTHK8irvyG9ORE
	b2ovEyoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCaE0-0000000H4HM-1osg;
	Tue, 14 Apr 2026 09:38:28 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCaDx-0000000H4Gc-1jxm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 09:38:26 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b9c755b2cdeso853152666b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 02:38:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776159503; cv=none;
        d=google.com; s=arc-20240605;
        b=Pbda1vQAFKxbOPY3sk7QcycnkQbcVAcD6uhR/oahVD35cMAmV9JlhBKjzw12LYArD4
         DDjxUkPFjoQ3p1Krw8rydG3nkDp1ScUuM4z861esJCLzdS+e6EB8f+tdCyiBpNqja9Wj
         ileDoH2TYcd9RvpXwcFweuju0j2JM7xIa44Q4YKffT4cBHjbRL9BqzZTQsGNQbPXgEzz
         HUySD+E/0wbWMynkW45J+FU9zgPxr8XEyergXoruZadzQrGltY7FJpz7okPhU+HnWEF5
         kACMfSUOd1L1Nq0uJeOfxkxeC9S+5NsT+pMKQncHfyJvcYi1eB8dTwNxHCCIFMh3ez1C
         xrcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kcjdDEKz8nZvddy7P6HkRER9j+LwEmEbznRAnp0HJSg=;
        fh=/MoA92ygByADn5zElWjkHeCOljV/0L0tZxwbOJ4G/9o=;
        b=SpRkmTUzS1mNR/e+I6/WWsWFOXTEpV1ZIx4aMQRPtPG2oZEknn2TpclxQFzXp0MxEc
         r5uDjs0HJFHMSz2FdpwIQ0WqryI+o345kaSLryd2wpSmU9u3tbyQw9iW/wZcZXm+R1wf
         U9yUQ6Oss7NT2Gxp2wxdvqATYFFiyIqz10jLupaOrH8DvQbH/gPxtGNcd0Xysa9QLP2W
         sSCNwljAD6QFzPV8PcYFOi28Uv/WeotuEB4FUDvl6Me4Bzw/Lg4KEOs0bpUKlnnafP6k
         XU2kqEG+2JD/Lw6DnIHFdsVCr/MqOwvJuF7u+yDDHY+Bem14MzJTPFJrkM1M+okXW0D8
         w/Nw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776159503; x=1776764303; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcjdDEKz8nZvddy7P6HkRER9j+LwEmEbznRAnp0HJSg=;
        b=BP5voxCV2TtcVNeB6ASspb0CcYTDAVJhMM5oxNJ3rfG+PQtu/u0mN6i454JZpApOh9
         5HNxTwCLoVBMS8bqeg+VePRY9mby3i7YTbLxTSjbqq/RJIBQu820woOhUwP8F+mEK0Re
         D/OVPnv5d9ErZmcAS1KirZ92+qNQ1OKF6bdr6aYqIdKjJKAiAI2Emibgj6xdAFzbbx0r
         EUEPKb9lSv3Pe+YubKmNUmKXDV4WBLgz7ailaSo7mLlsKbJRklJUzUfqZeBk9XxGw8dg
         diMhGozPRJHSuayOwOWpTQjZsZ4xJJpXvajhdtqU3BoY/IW+biBocqgjC0MriyXNQDW3
         Wk9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776159503; x=1776764303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kcjdDEKz8nZvddy7P6HkRER9j+LwEmEbznRAnp0HJSg=;
        b=s21gvok584mdaTNrYNL/H3fHGsJqMWLJULlpXDHYUI/KQh4TozhgHvanO/AGvFop+O
         /nTm7QDRusQQe3HRa8yNc5+vUrKX3hf9Yj/ezw9LHV3/T88rIFHSUqI/rQINDxzZG8aY
         gtHj4xvdww1uXme0mOqUlzNMeBl0VbCch2tRlSSttoIK1+fe8KS2ODKqUJqIGdom0YGo
         zlAmgggrPBtHr8dN2g13QhDVQdE0cZ31UhNyHe7sOeHM9waTH36qHNwoNueOC7MG9iNz
         YcubAt6IAUTu24OP7+vXbIjNYGs7xB25ug7gqzNd/fgSvEC/VUR/FlGxI1mDRBk7Culm
         zZZw==
X-Forwarded-Encrypted: i=1; AFNElJ9656lF+LDv9brinJybo8W216nuYu+gOe3ed+Htp3q+qvKZFmR8/T4p65bubXHR3GuJPARcYrNuTy2/7NHaGhxs@lists.infradead.org
X-Gm-Message-State: AOJu0YzniZigrLTT8GYlGjINGKgUBr16DogIdykwMcO1qTBq7cX5iHXn
	dYJQJwjJGM2l8pcUHpPVkyxyE3z6oCb0Jf44X3G/CdiSVaVI/R7DwydiJoSJKpXTLGqKyv6FvzV
	LHkpkehLV5Nk65j187YdPfto2Sgm7gZo=
X-Gm-Gg: AeBDiet3HR+x+DcdZ1hJ4e6MSPYJZItzftssccsJeB5WRP8e356nhirnM8mLPQG5tOu
	ngJgejK9wShJ9q4m1WOBLQRYCTSFFBrkMfUwd3K9j+faOp842jEEu+1pHmK7F9L5eBEMcDP9jiu
	OwIJQEgoFVpxjodQ+0eyhkfgW5bxHGPWVWVpYREqXNksZmFvmdoyQ7n7O3a7jmv4vdCK/SIMMCz
	Z9GN6M4VQ/YO99Yb1VQUl4iryrSOvaJl+uFJOHr/Sw7GS7UCcSCMeEkE4p3z9StEZ3DGYHy0Sdw
	gaeYU98D0D2obHWGe3FJhX0HlRht1SpC+A==
X-Received: by 2002:a17:907:1c16:b0:b9c:d04:e05f with SMTP id
 a640c23a62f3a-b9d72658a55mr959935566b.32.1776159502686; Tue, 14 Apr 2026
 02:38:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260413191111.3426023-1-puranjay@kernel.org> <20260413191111.3426023-2-puranjay@kernel.org>
 <dd645fcf-76dc-4c68-8b6f-1a168cafd44f@huaweicloud.com>
In-Reply-To: <dd645fcf-76dc-4c68-8b6f-1a168cafd44f@huaweicloud.com>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Tue, 14 Apr 2026 10:38:11 +0100
X-Gm-Features: AQROBzA5ZqN85V-5pwDPQTcpuLbGTsQR3YyYyNFZOhVjcHyYWB-ouK4sX2jSl08
Message-ID: <CANk7y0js0YxPFX1HqpYumN-ji6-OkKi4YO5=CRz8nx8aTzYxPw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/2] bpf, arm64: Remove redundant
 bpf_flush_icache() after pack allocator finalize
To: Xu Kuohai <xukuohai@huaweicloud.com>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Pu Lehui <pulehui@huawei.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_023825_542182_BBAA6248 
X-CRM114-Status: GOOD (  15.80  )
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

On Tue, Apr 14, 2026 at 2:56=E2=80=AFAM Xu Kuohai <xukuohai@huaweicloud.com=
> wrote:
>
> On 4/14/2026 3:11 AM, Puranjay Mohan wrote:
> > bpf_flush_icache() calls flush_icache_range() to clean the data cache
> > and invalidate the instruction cache for the JITed code region. However=
,
> > since commit 1dad391daef1 ("bpf, arm64: use bpf_prog_pack for memory
> > management"), this flush is redundant.
> >
> > bpf_jit_binary_pack_finalize() copies the JITed instructions to the ROX
> > region via bpf_arch_text_copy() -> aarch64_insn_copy() -> __text_poke()=
,
> > and __text_poke() already calls flush_icache_range() on the written
> > range. The subsequent bpf_flush_icache() repeats the same cache
> > maintenance on an overlapping range, including an unnecessary second
> > synchronous IPI to all CPUs via kick_all_cpus_sync().
> >
>
> So icache is flushed twice: once per instruction and again after all
> instructions are copied. I think it's better to remove the per-instructio=
n
> flush and retain the single final flush to avoid repeating flush overhead
> for each instruction.

No, bpf_jit_binary_pack_finalize() is called at the end after the
whole program is jited, and it calls: bpf_arch_text_copy(ro_header,
rw_header, rw_header->size); which does aarch64_insn_copy(dst, src,
len), this calls __text_poke() which copies the whole program and then
does flush_icache_range((uintptr_t)addr, (uintptr_t)addr + len); once.
This is correct, after this we don't need to call flush_icache_range()
on the same range again.

If we had been calling flush_icache_range() for each instruction, the
system would hang due to the storm of IPIs.

