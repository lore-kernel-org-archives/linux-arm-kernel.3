Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7772D0BB46
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 23:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N5Ha61iGv8UBir+niT+G49NgrMxO0LqYfl/tYGxc/84=; b=10vURCRi5zdB/PrWCfVmPDvnC5
	UZuW3RkeIHvGVW58SwvmICrRQSmcbgDp52PE9cq7j7XDYvyyqf2PojmF/ywhf+YZKGkpqleHb8nSB
	tzeW7W2LH+M7acoUZiN5xz0K/Sl4q7l57vZDFKFg+uTy713N9tssjc+1AfbHgSw3SITK3+BMCkq3i
	C9UT0S0iFQiJa495ld/WIYqYwwQxUSf5lixq6ieVOA/VXM7AHXgIOm5rzMksc6dJ5a5nAHrHvArAN
	47cqQn14qHZ2IdZab3rh3DfsLoCwJhz9i7VjiHSFeSWzXKmdIYf+yq4eg/Oru37o9HIipqhTZ0HmY
	df+Pjo4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3l9l-0000000GGUN-3Kcc;
	Wed, 23 Oct 2024 23:52:49 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3l8D-0000000GGEu-1THW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 23:51:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1729726956;
	bh=N5Ha61iGv8UBir+niT+G49NgrMxO0LqYfl/tYGxc/84=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JNNt4dk8tZM9am9qFrK1MgYcweN8QSIWAAfwNjYrXyAPt1rvn0vd3hl5Se8Kdcu6z
	 hYNWi54noABInnYI/bkcV8K8IHxlkI1RA9UP/mofSl0tdyJaYV9DHlFv9hwGBZ+jT3
	 gy6HGfZqRWmvoSzN/namuh8iUPIbDEhCDnh7nz+4=
Received: by gentwo.org (Postfix, from userid 1003)
	id 3F74E4027B; Wed, 23 Oct 2024 16:42:36 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 3D14040264;
	Wed, 23 Oct 2024 16:42:36 -0700 (PDT)
Date: Wed, 23 Oct 2024 16:42:36 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Peter Zijlstra <peterz@infradead.org>
cc: Linus Torvalds <torvalds@linux-foundation.org>, 
    Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
    Catalin Marinas <catalin.marinas@arm.com>, Ingo Molnar <mingo@redhat.com>, 
    Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
    linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v3] Avoid memory barrier in read_seqcount() through load
 acquire
In-Reply-To: <20241023194543.GD11151@noisy.programming.kicks-ass.net>
Message-ID: <e9fd5ba0-bd84-76a8-a96e-1378c66d0774@gentwo.org>
References: <20240912-seq_optimize-v3-1-8ee25e04dffa@gentwo.org> <20240917071246.GA27290@willie-the-truck> <4b546151-d5e1-22a3-a6d5-167a82c5724d@gentwo.org> <CAHk-=wgw3UErQuBuUOOfjzejGek6Cao1sSW4AosR9WPZ1dfyZg@mail.gmail.com>
 <CAHk-=wjdOX0t45a7aHerVPv_WBM3AmMi3sEp8xb19jpLFnk0dA@mail.gmail.com> <20241023194543.GD11151@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_165113_434318_93AC4B65 
X-CRM114-Status: GOOD (  16.44  )
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

On Wed, 23 Oct 2024, Peter Zijlstra wrote:

> > I doubt anybody will notice, and smp_load_acquire() is the future. Any
> > architecture that does badly on it just doesn't matter (and, as
> > mentioned, I don't think they even exist - "smp_rmb()" is generally at
> > least as expensive).
>
> Do we want to do the complementing patch and make write_seqcount_end()
> use smp_store_release() ?
>
> I think at least ARM (the 32bit thing) has wmb but uses mb for
> store_release. But I also think I don't really care about that.

The proper instruction would be something like

atomic_inc_release(&seqcount)

The current atomics do not provide such a macro.

The closest in the current tree is atomic_inc_return_release().

We would prefer atomic_inc_release(&seqcount) because such an
atomic may be executed as a far atomic in the ARM mesh.

This could be cheaper than a local atomic and could f.e. be executed
on the memory controller of a remote NUMA node in order to avoid a costly
transfer of cacheline ownership.

The code generated is a atomic that also does a release. So there would be
no extra barrier etc needed.



