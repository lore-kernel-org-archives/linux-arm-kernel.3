Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DF1F34C74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 17:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y1VX+P8oKWLTokXsXbxH9r3i6MRKz6cq07No9cqxGa4=; b=OkVYM4OjDHCyqy7IOnhKEtWvQj
	4X++AwwoUap+oA0kY2PSne4IPITFw7BpbKO09eNiV2M7koXX3Ncuo2biOI/Ijp18u9TPGJ6i4y078
	fQwRvEZK1idpknuZ+J1lNVn2y8JwESS/MTGn16aSQVdWlpgdlbDpUyvgVskb1G70NnbH5xveSlcjT
	Wf4puUuzId8sKKZBw6EHGuifqNYqaKMvkN4+wE/uOlUUaaG3IaJuL1IpnktmBcv8Ul4QYECrQgCUE
	+pC9gdZTYy90jHso4AUMYxvfr/XF8lajFvHEdScwM/NCI31MsR0n8NTz1fAxvzXScRXChwd8BKvu5
	hJILdnJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCKxd-0000000G7nJ-3YtC;
	Mon, 13 Apr 2026 17:20:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCKxc-0000000G7mI-17MH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 17:20:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 399656185C
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 17:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DDE2C2BCFA
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 17:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776100830;
	bh=Y1VX+P8oKWLTokXsXbxH9r3i6MRKz6cq07No9cqxGa4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hjx/j7EeQb3ovYPGcgHFrgVCclYE08OplfS9oT/yGLNHuzLisJZpRzLV3eZjrmdjB
	 hfHwN2AcfWQGGakTUlq7+7EAeGLSvhOiSYsofrjFWQaUxwcrg7lPshv6iBy3A2/hrv
	 nQZ9g23zvr9lf6q0UJF8BZYXzIoby59+URWoanrxR2P4vJanFR7EVgY+3NTgyePjyG
	 b/c+2aOcFMBIByTZz75EukZHTqr0xFgwIcuQg5Act6bDZEgIM1X2CuNlhY04AwEGns
	 lhDFafyG1ALEsyk+SoCF3Sden37R2DtH85Xu9mJgOI5djFUKG+zlj+U3iTKZS2z/TP
	 XFCypl8OUtKjQ==
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-50d876329bbso49830101cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 10:20:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/ut7/7IkYGI5+pHpTFmNYu7RWFb0oYNu6a76euvpwfc4L5niPYv7au9+imYRtcnY8guv78oiFXiswqGOP0kxkp@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7KzuItXYpu1Ac4G3p8oixpUAsalrJbAz8nKU71UkU9NnWnPvj
	Jw6G+1C4/CxHSGx6+Y5deID+KPEoD6mYh9HOv4u+m4Y6k0Dol1GhdcRQffIt7oFMDm+Nav8ghSJ
	+3Cxjqa6ABWPohLld6y8qRgSajPMX/vI=
X-Received: by 2002:a05:622a:99a:b0:50d:8905:7cc7 with SMTP id
 d75a77b69052e-50dd5750f2amr228728281cf.0.1776100829547; Mon, 13 Apr 2026
 10:20:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260413123256.3296452-1-puranjay@kernel.org> <20260413123256.3296452-3-puranjay@kernel.org>
In-Reply-To: <20260413123256.3296452-3-puranjay@kernel.org>
From: Song Liu <song@kernel.org>
Date: Mon, 13 Apr 2026 10:20:18 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5=qtjESDr-HQkxkYKrBFjpXAf3HRYOH5ESEd8Wvv9dYQ@mail.gmail.com>
X-Gm-Features: AQROBzB08PAYs8xzmtpFMbY0dd6o-2NWqQR25UWik8u6kWpL-cfIxQiCnEnElUw
Message-ID: <CAPhsuW5=qtjESDr-HQkxkYKrBFjpXAf3HRYOH5ESEd8Wvv9dYQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 2/2] bpf, riscv: Remove redundant
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
> since commit 48a8f78c50bd ("bpf, riscv: use prog pack allocator in the
> BPF JIT"), this flush is redundant.
>
> bpf_jit_binary_pack_finalize() copies the JITed instructions to the ROX
> region via bpf_arch_text_copy() -> patch_text_nosync(), and
> patch_text_nosync() already calls flush_icache_range() on the written
> range. The subsequent bpf_flush_icache() repeats the same cache
> maintenance on an overlapping range.
>
> Remove the redundant bpf_flush_icache() call and its now-unused
> definition.
>
> Fixes: 48a8f78c50bd ("bpf, riscv: use prog pack allocator in the BPF JIT"=
)
> Signed-off-by: Puranjay Mohan <puranjay@kernel.org>

Acked-by: Song Liu <song@kernel.org>

ditto on #include <asm/cacheflush.h>.

