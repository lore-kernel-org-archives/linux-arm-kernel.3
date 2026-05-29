Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B25CD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 18:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WjF3Brf6cRxJkzPL/ipfulgSkES6dK/SaDc1kkuFm9w=; b=Mo8XkvGLKBdWNtS+v+Aor1AUzs
	hKuIlTrSftP2Usp8E0IZ6zAak1vm3u0E3o5qBm+3MpdZXq7H1us86RrSR8kNTGLrBm1SMTbOloh2d
	sfTiMGKKqT0qgq1/3qgzoh0KeO29PWs4MDoENTgxpFml5+WmSUHPltVEyvOWqmCQpz8ozAB88vPBF
	TPR5+ogIgf8bQhXANTMJi4E1VM1qWZ/G5Z2jvCjq0BIM2MuLAdkOzXwUq09PQhluLeaW/j+5UTRqr
	u9to553bObFRXZdmQ89x4ET3pI4zXTOAVcKbkDtdw9LAuEIeh8X0jsk5Fkd5C+luOsUKTm1OxD8ui
	lx+aMrTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT1hG-000000085Hd-3ImM;
	Fri, 29 May 2026 18:12:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT1hF-000000085HT-3diz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 18:12:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E895E60136;
	Fri, 29 May 2026 18:12:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C6141F00893;
	Fri, 29 May 2026 18:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780078356;
	bh=WjF3Brf6cRxJkzPL/ipfulgSkES6dK/SaDc1kkuFm9w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=UecRj9nCTx6y0yJqMUOAJoOTqbT9S71bZ/5V6yr5lUgZLmSRRZ+b9yZ32/KlvirZF
	 2D+cZ98qJc23CtZ9PRjAUBJ05fv1yAGnSt4G8o4qyhI5QjO4amK32O1MnklaEoPG5F
	 0rhA0SwYNTPzDsqn+5qjm81KTsfzrLPwpSndxwYSfNyT5+Uca/5J2ROvfC8a43rwOv
	 J6Eu/RvYDqKD4e4ABWzwPqZ6GI17kHnR+mUPYsupQCGdjiIsdJZgofv1Cyq1vnsG0w
	 xm2jCd8A1EbQh6ovD04PtWDhkOfsswYua4dYZa6gGkWJyPK5z4Xh8hbKM3C/OlPknV
	 HXYPui3QG45FA==
Date: Fri, 29 May 2026 08:12:35 -1000
Message-ID: <3901fe0537edee9d7acdfd91695ead28@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: David Hildenbrand <david@kernel.org>, David Vernet <void@manifault.com>,
 Andrea Righi <arighi@nvidia.com>, Changwoo Min <changwoo@igalia.com>,
 Alexei Starovoitov <ast@kernel.org>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>, sched-ext@lists.linux.dev,
 bpf@vger.kernel.org, x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] bpf: Recover arena kernel faults with scratch page
In-Reply-To: <DIUMP21RASZI.2VNQV45RIL209@gmail.com>
References: <20260522172219.1423324-1-tj@kernel.org>
 <20260522172219.1423324-3-tj@kernel.org>
 <7fd673df-22f3-4d70-a779-ea0b878188b3@kernel.org>
 <DIUMP21RASZI.2VNQV45RIL209@gmail.com>
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

Hello,

> It should do set_pte_at() unconditionally.

I think two concerns are tangled here.

1. The racing write. set_pte_at() and the scratch installer's
ptep_try_set() hit the same PTE with no common lock. On x86-64 and arm64
set_pte_at() is a single atomic store, so it can't tear against the
cmpxchg, but a plain store racing a cmpxchg isn't atomic in general.
David, is that the worry - an arch where set_pte_at() is split and could
tear - or something else?

2. The SEGV. It's a BPF program failure propagating out as a SEGV. Maybe
not ideal, but as long as we surface the BPF error properly, it doesn't
necessarily seem broken to me.

Thanks.

--
tejun

