Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0E2F34C65
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 16:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h2aM87LBp2ambqCZSnTPbSPCg4/IJ24tetHqkm6TuZ0=; b=Y1PYM4oMPx5pHQhe27hVLoankI
	Liyt0YPNP9TgGgRYBEBAJmDGc6wBp1zi9vTZIulN8liSV/lhdtGwW2kN0mBMbqIO1pENT04RtZmOs
	vFjcySqOAnqjePOzMzIhsDZ88Fjix3Z8z2+STPcgyG70kxq9Q0hy/lLDTogs6UPJ5T/yQBtE8LE38
	5RxQ0+2wRIZUiHl2MFg1RNMDbfyNW3LIq0Cg8yWqmr+XHT5oPxcVi6rh93bqktM+5ePqP2y0p1O5T
	kVeMUevMMr+qIP5Q2xb8gF8v3d8OY0mTB6WVTHtg0Vqc8kKvWG8OzPQmM6A98sNJgwXrtK4U6KYgA
	znJF0EGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCKac-0000000G5kd-2DIH;
	Mon, 13 Apr 2026 16:56:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCKab-0000000G5jg-0KBt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 16:56:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DBEF56184F
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 16:56:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7DC8C2BCB0
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 16:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776099403;
	bh=h2aM87LBp2ambqCZSnTPbSPCg4/IJ24tetHqkm6TuZ0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=A1/LSmdy8yQDvjhZ3UN23Bo1McCQ+BT+1wnSom64e8RPslCZBRZLZIP6DRRf0pIiu
	 AYUhIYTPlTfs63sOgeuMTapnP+rp30KAelHN3fiI7E0FL9IIN4468pLK6etoZQqowd
	 Brmmh/BJ2JTJLKuhww2KBw9Lqm+n57uNrYTJb7VSEd62ymZC4mvO1GHqDbQt1jKcNs
	 gClElEadOplATXbg2ENOVpUiy0Eeo64gftDYX8vYoWNMVxk02iYF9WT0cI6nCOI4C4
	 ftBfR9n2a7QwTBDniLN8evg6WYEqH/5xzu3IzSDok+J9OoT1JrU0gIeVjU5mbKJSbS
	 N82p1DC4TX89g==
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8acb856a674so5670476d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 09:56:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8n+pGfAwyrbo9WZNOFMByjrrW4TeCIgBY9dYV587ZGybmwRmnPcU/thaZZV278WDVd0TpYrFKk0xI0oX9TCjrm@lists.infradead.org
X-Gm-Message-State: AOJu0YygiFbecgC472Q3ugilihMavm06nZ3fX48e4clDib3jrkB/oSt3
	buOcwlIto8ekznxOEBc6/hjJ5pqUl/OKiIFtowxpRwk4jGFjYxXN6Rt6Sfh6K4hMWIGL2Zc0TkD
	KXyp4ieSTF55VrdJB7tuOHl7aCHLYTjU=
X-Received: by 2002:a05:6214:3307:b0:8ac:b2e1:3798 with SMTP id
 6a1803df08f44-8acb2e17026mr38597226d6.28.1776099402680; Mon, 13 Apr 2026
 09:56:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260413123256.3296452-1-puranjay@kernel.org> <20260413123256.3296452-2-puranjay@kernel.org>
In-Reply-To: <20260413123256.3296452-2-puranjay@kernel.org>
From: Song Liu <song@kernel.org>
Date: Mon, 13 Apr 2026 09:56:30 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5M6-9HdYhGnerZiSnZM=VdgN-H91ND=Qop+thEASfvQQ@mail.gmail.com>
X-Gm-Features: AQROBzA1h53NIbW6wB2_ufILfMN6eHhnFaWBiPdIcTkHfEIuA00ldjcsm5gEbB8
Message-ID: <CAPhsuW5M6-9HdYhGnerZiSnZM=VdgN-H91ND=Qop+thEASfvQQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf, arm64: Remove redundant
 bpf_flush_icache() after pack allocator finalize
To: Puranjay Mohan <puranjay@kernel.org>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Pu Lehui <pulehui@huawei.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Apr 13, 2026 at 5:33=E2=80=AFAM Puranjay Mohan <puranjay@kernel.org=
> wrote:
>
> bpf_flush_icache() calls flush_icache_range() to clean the data cache
> and invalidate the instruction cache for the JITed code region. However,
> since commit 1dad391daef1 ("bpf, arm64: use bpf_prog_pack for memory
> management"), this flush is redundant.
>
> bpf_jit_binary_pack_finalize() copies the JITed instructions to the ROX
> region via bpf_arch_text_copy() -> aarch64_insn_copy() -> __text_poke(),
> and __text_poke() already calls flush_icache_range() on the written
> range. The subsequent bpf_flush_icache() repeats the same cache
> maintenance on an overlapping range, including an unnecessary second
> synchronous IPI to all CPUs via kick_all_cpus_sync().
>
> Remove the redundant bpf_flush_icache() call and its now-unused
> definition.
>
> Fixes: 1dad391daef1 ("bpf, arm64: use bpf_prog_pack for memory management=
")
> Signed-off-by: Puranjay Mohan <puranjay@kernel.org>

We can now remove "#include <asm/cacheflush.h>".

Other than that,

Acked-by: Song Liu <song@kernel.org>

