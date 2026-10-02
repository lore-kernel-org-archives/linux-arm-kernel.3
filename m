Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31619CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 05:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fdbq3HRFuyvrIU82ByKul8ljBnoTsSoeLo/ZpuxDclU=; b=iyRigxKd/y9CM4VD85LLBl3QLx
	sbKV01ESNG1kdIEfWddrqwXeC5h/UxCeU3v5PxqlmIkm/v54iKZsE/EtQAevN0OG3sE4ebPphIBEs
	Ie5d6YUpbx+FBtys5hLCCx6f9qrmMWMH+TDZNQZkICVJI/U5Tb8tTb0MuC/lbzUC6zMSqkQPvsSQ/
	s4ZGdScPV92BVlfFzwbyD1DNqUdDfV/yq+IPj1NXw7M65gLqNRQIwY+RXvgxVfc7ph8M75k42KkBW
	2i0vUpsuYhNEZ0iGTcbzmgeso+qA97Adx2y9TPGViLDELKkmjDm/EsCCrkUcfuHZx4rRgQ5QtQOCD
	KNz3+fIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCVd5-0000000Aeim-3MN4;
	Fri, 02 Oct 2026 05:16:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCVd4-0000000Aeie-2m6h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 05:16:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 180DB43A09;
	Fri,  2 Oct 2026 05:16:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFD1A1F000FF;
	Fri,  2 Oct 2026 05:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790918178;
	bh=fdbq3HRFuyvrIU82ByKul8ljBnoTsSoeLo/ZpuxDclU=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=WExEL4j/nmjgZX+MwmgUbXFbkCu9MQ29rlxsZOcMhJC7NQkxAvsnKPvOc2O2O4wwB
	 o6Za7Pd3IChaZ/FIDw3Zua2aIwQgVtEMxOXRkuBn9VCB77tQae91seSmx9FcE9A31P
	 R+GMT2yhUnTK/qx3UGuwvjT8E71+3SCRi1N/vCXRUWrMHKpPd6/b/KaibkdkgOMQCy
	 AgN4H2YbNsTJLeyehhziFdHjtD2wRRCQPPBjDa+QpiZlaWAUTTutnxzZfqbW4LXV4F
	 TUAeE7uENVZG4VH1IYukQ5bYclyWb8e6XPpfNMKoInDrdJD0aI0icHurQFToaKCuDU
	 M4t2lRc+o04kw==
Content-Type: multipart/mixed; boundary="===============1405899604603047031=="
MIME-Version: 1.0
Message-Id: <30d677b5656d9fe07e2dba86d2bb1f1d5f5114cfc3f36e9d96297b70c230097b@mail.kernel.org>
In-Reply-To: <20261002044050.1277356-1-thepacketgeek@gmail.com>
References: <20261002044050.1277356-1-thepacketgeek@gmail.com>
Subject: Re: [PATCH] bpf, arm64: Fix text_mutex critical section in bpf_arch_text_poke()
From: bot+bpf-ci@kernel.org
To: thepacketgeek@gmail.com,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,eddyz87@gmail.com,memxor@gmail.com,martin.lau@linux.dev,song@kernel.org,yonghong.song@linux.dev,jolsa@kernel.org,emil@etsalapatis.com,ihor.solodrai@linux.dev,puranjay@kernel.org,xukuohai@huaweicloud.com,catalin.marinas@arm.com,will@kernel.org
Cc: leitao@debian.org,bpf@vger.kernel.org,linux-arm-kernel@lists.infradead.org,linux-kernel@vger.kernel.org,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Fri,  2 Oct 2026 05:16:16 +0000 (UTC)
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

--===============1405899604603047031==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> bpf, arm64: Fix text_mutex critical section in bpf_arch_text_poke()

TL;DR: Nit only: the new multi-line comment in bpf_arch_text_poke() (arm64
JIT) should put '/*' on its own line, per BPF comment style. No functional
problems found.

> diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
> --- a/arch/arm64/net/bpf_jit_comp.c
> +++ b/arch/arm64/net/bpf_jit_comp.c

[ ... ]

> @@ -3338,12 +3338,20 @@ int bpf_arch_text_poke(void *ip, enum bpf_text_poke_type old_t,
>  		 */
>  		plt_target = (u64)&dummy_tramp;
>
> +	/* pages of the bpf prog pack are shared between progs, so the
> +	 * set_memory_rw()/set_memory_ro() window below must be serialized
> +	 * against other pokers too.
> +	 */
> +	mutex_lock(&text_mutex);
> +

This isn't a bug, but should the new multi-line comment put '/*' on a line
by itself, as is the convention for BPF code?

	/*
	 * Pages of the bpf prog pack are shared between progs, so the
	 * set_memory_rw()/set_memory_ro() window below must be serialized
	 * against other pokers too.
	 */

[ ... ]


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/36966917973
--===============1405899604603047031==--

