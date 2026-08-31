Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB08C624A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 08:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kOSOst4In022OAgVRNxSdoYjl0jKl41mZxfh1QOXGYk=; b=YMyX/FTNkyg0/DsiZFmA54pSP0
	Kp33tG/ngZkR5ctYxwoV2jwDym+e9SztXihx770fIaAy/yV3z9+JQQYTW1QUfAe1J+OAAFn7ApAbf
	MV2BToQDnUct8nsnCanIn4dotaGbxvhQo+z7BRyNKvn8Mt80bVToDoYq/Lx3QS9ocayrErDHvPJNe
	tDNHiMnDJACZbCHFUmrSCI1i7gOOlb2e23WH6Qat8NqJbBHnjauiqv0joPQRszKEBnI4hjykW3r75
	C8EJXjfmsBqZlaT6K3Gnc9gasaPQyNgDNYsESorPL5cW9hpye3O0xEBcIYXuE4chI+hDw+O9wCOcL
	OrNVT8qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0x3q-00000008nOK-1CsF;
	Mon, 31 Aug 2026 08:08:10 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0x3o-00000008nNx-0AM4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 08:08:09 +0000
Date: Mon, 31 Aug 2026 10:08:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788163685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kOSOst4In022OAgVRNxSdoYjl0jKl41mZxfh1QOXGYk=;
	b=UqyAcgbknTYn3fJW+77HU4qPPnTrytzLhryZvvJYqEuIx8qphJckoDifDfdm+rCRRjuKx3
	X5AYx39fVc8NNQX0G53A5jZPrsmNKDCRCO17shC7V7IzmBfEvXg+awsNTsMSRKtjVuoish
	6esMnTvDM2bG4LZr+N3HLR7SrxRC29FZ3/9FFEJPR5tIXTO8wMMMtHknvUzs1BeoJHSEES
	fjqXjpkR/1miN9p7UOSQgsfBnbgFNVII3NxwD42wrshQxcc3VIE4WWUYwfm+VVzt4DLsDf
	KxMDmIxUDVB+MF902mkKdqmc/xK1S4lVk0DJdJ9CvipP2ojiOg/aG7AJ5W14fQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788163685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kOSOst4In022OAgVRNxSdoYjl0jKl41mZxfh1QOXGYk=;
	b=N9IKktNNqgpGblx0PmDvTe0TsNYwsV/Spk75gDgAMfcaFRBv4+VoIfFsyYXqyU/3U78EvG
	MvmNWirnPXNVdQCw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: David Stevens <stevensd@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dave Chinner <david@fromorbit.com>, Qi Zheng <qi.zheng@linux.dev>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>, suleiman@google.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org, linux-rt-devel@lists.linux.dev
Subject: Re: [RFC 06/10] Reclaim memory from blocked kernel stacks
Message-ID: <20260831080803.LhShiZ4V@linutronix.de>
References: <20260827232948.2520558-1-stevensd@google.com>
 <20260827232948.2520558-7-stevensd@google.com>
 <20260828133620._x2XfJR_@linutronix.de>
 <CAOiLmNHK5Hw55omycg_EAHzi=g1iqJn1NTap1Mt98im3xTXcvA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAOiLmNHK5Hw55omycg_EAHzi=g1iqJn1NTap1Mt98im3xTXcvA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_010808_234715_A6B1C4FB 
X-CRM114-Status: GOOD (  24.60  )
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

On 2026-08-28 14:17:49 [-0700], David Stevens wrote:
> > Did lockdep see this?
> 
> What are you referring to by "this"? I did stress testing with lockdep
> enabled and didn't see any errors, although I will admit the bulk of
> that stress testing was !PREEMPT_RT.

I am (was) just surprised that lockdep did not complain about the memory
allocation under the PI lock. It was pointed out in that thread later
that the new trylock usage could mask that.

> > If I understood the whole exercise correct then you have a kernel stack
> > of two pages and in best case you can unmap and release the second page
> > while the task is napping.
> >
> > What might be a tad simpler is to memset(,0,) the remaining part of the
> > stack. Since the stack is vmap-ed it should be swapped out on its own
> > without additional tricks. That memset() would help zram to compress
> > better so it uses less memory. ta-da.
> >
> > What also should be simpler (and I am not saying just to move you away
> > from the scheduler) is to have a shrinker which iterates over all tasks
> > which are marked for reclaim and then similar to swap just unmap both
> > stack pages and release the second page which is not used.
> > Upon wake up the task should create a page_fault which would be used to
> > allocate the second stack page and map the whole stack again.
> >
> > This sounds simpler.
> 
> There is no swap for kernel memory, only user memory. I did contribute
> to some previous work that aimed to only only prepopulate one page of
> each kernel stack and then to dynamically fault in further pages as
> needed [1], but handling that architecturally and guaranteeing that
> memory is available when needed is difficult. Full-on swap to zram

but faulting it in while the task is running is sort of complicated
since the task might have page_faults disabled. This is what I missed
initially (the task is with disabled interrupts in the scheduler).

But unmap the stack while application is sleeping (via shrinker) and
fault it in via another thread on wake up should be doable.

Sebastian

