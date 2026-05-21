Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 089F1CD5BAF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 17:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AlzKy8zLiXVW3OOWreCz0uBaIrjhWNSN2snhmHYvFec=; b=dCIe8kheW1krpITI7MsBxt3sLo
	6ARGanOch+bHBNCIjgIZQx0m0uwLQ+be26UOaED2p+nda7cBuy7prowykUgreuEgAKJL1U74BelG8
	zhigbvlB3+f7OweftgbywrETkjOutSqbki9u7JVK4ORk8Y/GsmR1DkjYmoLjU9CStgXmfz+yU1D7F
	a81T/MufeJWS3/c+mDmBYVHjRfxXgk/5C10JpsTevV0YWfx/CH16twvbwzemNZCHD3L6IszfeROGw
	EGRArvceNVdG00pK73zjBse0fi0MTN888Tyt+SKYBU0yMCiZN+11h64OpBlnou7+HuTOVxf4XaCCS
	gxNzSSlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ76P-00000008cl2-2knj;
	Thu, 21 May 2026 17:22:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ76M-00000008ckM-3lME
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 17:22:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 34314438D5;
	Thu, 21 May 2026 17:22:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E29FD1F000E9;
	Thu, 21 May 2026 17:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779384150;
	bh=AlzKy8zLiXVW3OOWreCz0uBaIrjhWNSN2snhmHYvFec=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=RKJIuj4G6CxC3qvs89BfWMbcUoDSq208cSVcu+n+piDs6pYGX3tDnKJJp+wyEpHQI
	 zfUxFkRf6rqU3CJqN1pP6wxooh9U3NjM+1ynKMmwDjMJ2wuEhEaWjBQRv2GCiudUKk
	 tJuHFTXznYMDXkaP/pjJvyWq1OAXTOoYM2k/2JCDJC1pTk8+4K8wfZ7e7rZAUC7nRn
	 QnMWl0LV1raXD5Fb2tTHOkjsG8/RXyC7x1eS47hWpdOdJc3MnWfetSleiaOD6JugM7
	 BJE5HlqjmfJDsh8jjAnbWtXKeRzJcN3q9opWMQRnDTlT+jVbgUCD1I3eFZAWBMIFmy
	 6+n2MkU4nQvrA==
Date: Thu, 21 May 2026 07:22:29 -1000
Message-ID: <0ea50f62b8255cc0ff1a96206096746a@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	sched-ext@lists.linux.dev,
	bpf@vger.kernel.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/8] sched_ext: Sub-allocator over kernel-claimed BPF arena pages
In-Reply-To: <ag66lfvACAEAI9w8@gpd4>
References: <20260520235052.4180316-1-tj@kernel.org>
 <20260520235052.4180316-8-tj@kernel.org>
 <ag66lfvACAEAI9w8@gpd4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_102230_957087_469EFD2D 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
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

On Thu, May 21, 2026 at 09:56:05AM +0200, Andrea Righi wrote:
> IIUC, since @page_cnt is sized to cover @size and the new chunk is added empty
> to the pool, gen_pool_alloc() here should always succeed. Should we do:
>
>   if (WARN_ON_ONCE(!kern_va))
>       return NULL;
>
> to catch potential logical bugs / future concurrency / exotic configurations?

Good point. It works for a single caller, but a concurrent one could drain
the new chunk between grow and retry. I'll switch it to a loop.

Thanks.

--
tejun

