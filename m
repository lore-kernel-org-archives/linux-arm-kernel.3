Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A93C624C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 09:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KdC630qSepMOzA2lVAlUNAGtTB350vu7dUwfU0LuExI=; b=rGkZoTI2YEy2tGkohkYjHlp97q
	DSHFDLkyhJsxNIhfppO+9SSQYnf1+inVYkDSL56YMwBeX5el0kD0C2KOkhaIsb9qHJKJOONmJqowm
	FZ2og/CofroL5uwUCqflen6OdhGH03PsZm5VVL5m1YlYQH4ezkT77SbUmUISRmrGolJBr+9YFqUI4
	sDRz1r4KnsvHqMh5Popd2bohJXW5IE2CCxSXLWkfKBRkg+HBUME8maDZHTmwnZns3lo+8/tCuZWDY
	OcB4uMkETqDTBMFVIOKRkHsHpGNRjTVOT6u+lfz3oIQoyOfq8wioXf7a+pRpaUq9xfN9iY7oHwzAE
	yo+9DrkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1KmJ-0000000BQjx-10Uh;
	Tue, 01 Sep 2026 09:27:39 +0000
Received: from mail-ej1-x647.google.com ([2a00:1450:4864:20::647])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1KmF-0000000BQhb-4By3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 09:27:37 +0000
Received: by mail-ej1-x647.google.com with SMTP id a640c23a62f3a-c1c4715cf0eso331885166b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 02:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788254853; x=1788859653; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KdC630qSepMOzA2lVAlUNAGtTB350vu7dUwfU0LuExI=;
        b=IuiWrRtwE/ulAZcwVDGt7MDEfV+Q0WIsb7FOhNaGeX4dysP07L8t1bcLjtfWlpbFp8
         waPPJrGc5wfVo28obiM17Oynl46awdt4ImczFBBDwPGMXLI5Hjredr5CB4h6m18/YWCX
         Eae6dTTWvgKurJMlxfM+zyAjQYIFIql9z75YZTyaJStEHOPCZ9NE/repw1z4rtS8+GGc
         g88ZuXfW+d8uh1EHoMmKVxK+AMhUtmFi27dPbNMx7g4N4ILoB8cwmFNpn17dLFFIspJ5
         kqakQgFsfD33Ow6eTi2iHpOePzOU4/UhuIAZpknizvGzDVuin203NJrDHlHVfI08Sp+f
         owSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254853; x=1788859653;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KdC630qSepMOzA2lVAlUNAGtTB350vu7dUwfU0LuExI=;
        b=JROeVib584Xv809extH9MUKW1x9oDi9XYBrOSLsN4WAmRvbWsW1zXnKYC1oDqxLejX
         GWq1bKVv2oc9mS3dGLzW9oHUZoWiwSoq2EgVatSpcZH8Z8A8dIh8TOMmjQWC28PtGeiS
         HO7137i+flKJPQIohRVTnucrYuztGKs0hAvipWpD1FI8pYAWZ/ZmUfaTYhK7GqL4yG2a
         jxPHARFl4nacNED/XzK6pXuM3UvEMwJ76gB0jipgeeIpCtsM1wM0P6ft9A0Iet13q12U
         XWZMLf07d6R2/gTUKXOlDqmDDr7b9ncTdtGhxB0m6hWd/LRedGzmM7oajFK9vdYyBxJQ
         5eLw==
X-Forwarded-Encrypted: i=1; AKwUvByEka02SBsq1MY+0HZxon7cqKSRiSaYE8Ktfc7IkIxBZwDGaxjv3EDTckJzosk1JksWjmQoBIACJbbRcFvzAN79@lists.infradead.org
X-Gm-Message-State: AFuF++mSN4FKoqNT6iyhqIh09BurBWE/3k9o0FZr+cbeGnSzzYNFybGV
	fQKzQuEJHCHPVFdPeR9QXxvDP8WGW6XDPDo9KBb7GWSEFx/tFRW6Asw59QfGsq+mSd8ve6sJvDO
	DeirRVJ14cyE+pEHdaQ==
X-Received: from ejblv5.prod.google.com ([2002:a17:906:bc85:b0:c20:221c:9ee2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:18cb:b0:c25:848a:4a8d with SMTP id a640c23a62f3a-c25848a4edamr1140296766b.5.1788254852741;
 Tue, 01 Sep 2026 02:27:32 -0700 (PDT)
Date: Tue, 1 Sep 2026 09:27:31 +0000
In-Reply-To: <20260827232948.2520558-9-stevensd@google.com>
Mime-Version: 1.0
References: <20260827232948.2520558-1-stevensd@google.com> <20260827232948.2520558-9-stevensd@google.com>
Message-ID: <apaagy0KJRPVtwHM@google.com>
Subject: Re: [RFC 08/10] Set PF_RECLAIMABLE_STACK in various places
From: Alice Ryhl <aliceryhl@google.com>
To: David Stevens <stevensd@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Dave Chinner <david@fromorbit.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Uladzislau Rezki <urezki@gmail.com>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, suleiman@google.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org, linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_022736_052406_DDC96912 
X-CRM114-Status: GOOD (  23.79  )
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

On Thu, Aug 27, 2026 at 04:29:46PM -0700, David Stevens wrote:
> Annotate various blocking locations with the PF_RECLAIMABLE_STACK.
> 
> Signed-off-by: David Stevens <stevensd@google.com>
> ---
>  drivers/android/binder/thread.rs | 14 +++++++++++++
>  fs/eventpoll.c                   |  3 +++
>  fs/pipe.c                        | 28 ++++++++++++++++---------
>  fs/select.c                      |  3 +++
>  kernel/futex/waitwake.c          |  3 +++
>  kernel/signal.c                  | 36 +++++++++++++++++++-------------
>  kernel/time/hrtimer.c            |  3 +++
>  rust/kernel/task.rs              | 16 ++++++++++++++
>  8 files changed, 82 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
> index bc0ef8927905..be62f7fd43ca 100644
> --- a/drivers/android/binder/thread.rs
> +++ b/drivers/android/binder/thread.rs
> @@ -538,13 +538,21 @@ fn get_work_local(self: &Arc<Self>, wait: bool) -> Result<Option<DLArc<dyn Deliv
>  
>          // Loop waiting only on the local queue (i.e., not registering with the process queue).
>          let mut inner = self.inner.lock();
> +        // SAFETY: Only accessed locally in this function
> +        let current = unsafe { Task::current() };

You can invoke kernel::current!() instead to avoid unsafe here.

>          loop {
>              if let Some(work) = inner.pop_work() {
>                  return Ok(Some(work));
>              }
>  
>              inner.looper_flags |= LOOPER_WAITING;
> +
> +            current.set_flag_bits(bindings::PF_RECLAIMABLE_STACK);
> +
>              let signal_pending = self.work_condvar.wait_interruptible_freezable(&mut inner);
> +
> +            current.clear_flag_bits(bindings::PF_RECLAIMABLE_STACK);

It would be nicer to define a guard type like you did in C so that this
is less "manual".

> diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
> index 38273f4eedb5..6168f058343a 100644
> --- a/rust/kernel/task.rs
> +++ b/rust/kernel/task.rs
> @@ -344,6 +344,22 @@ pub fn group_leader(&self) -> &Task {
>          // only be used while `current` is still valid, thus still running.
>          unsafe { &*ptr.cast() }
>      }
> +
> +    /// Sets the given task flag bits on the current task.
> +    #[inline]
> +    pub fn set_flag_bits(&self, set: u32) {
> +            // SAFETY: The `flags` field of `current` is not modified from other threads, so
> +	    // the non-atomic update isn't a race.
> +	    unsafe { (*self.as_ptr()).flags |= set }
> +    }
> +
> +    /// Clears the given task flag bits on the current task.
> +    #[inline]
> +    pub fn clear_flag_bits(&self, clear: u32) {
> +            // SAFETY: The `flags` field of `current` is not modified from other threads, so
> +	    // the non-atomic update isn't a race.
> +	    unsafe { (*self.as_ptr()).flags &= !clear }
> +    }

It looks like the indentation here is a bit off. Please try invoking
'make rustfmt' to reformat this code.

Alice

