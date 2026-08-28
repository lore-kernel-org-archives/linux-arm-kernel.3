Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE707C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 17:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R2koS2vCzM8w7VNNntAyqh354TzQoKL9/yGNgBa5fxE=; b=Eo2ciDb7pZ8RKv+KGTHiLIEaUX
	zT364KMMLFjcZviFG0dIl6oeEMLwUfE3rSL5eQWVbp56yODJ2R/+ILhl3VcSI6AwHMwKj71YmUV5w
	d8Z81FEvzgsHmpl+0pnFs7qOvqWeYWFLNO4JsvP/j0oBgTYgReh2Sne/a05iygQX/Uts2QissglDF
	PpZS5XOjYiqaUV5EUZkDBgRxnjagd6Bqki6ctd4NOSRUodegNJMi3UgL9jMhbWNdzFFjMOPmwANJ/
	sTpSimnFs6RyKBDBvqMPYoweTpIEW7/4LAEpm+0RZeAUGoIbl6wppnq3cVipiil5NpniF3JYwcHBL
	grYhrNhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x00qi-00000006Hdw-0Put;
	Fri, 28 Aug 2026 17:58:44 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x00qf-00000006HdS-1ASG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 17:58:42 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-498012a61f6so3325e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Aug 2026 10:58:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787939918; cv=none;
        d=google.com; s=arc-20260327;
        b=iGWl+dC6oaQIGXG/tph8bBwBlICBzy4zarjevqCYdL4dgpfIybNpJNO9vaajwWEyBC
         8NqOcsC22g2FIGww87jYcrzV/tYqld57HPG069OK4xGmja/kdNOrolfsB7aZ+wzcz81M
         yRBefKWXHjLusU2vGgCLBbM3Y1jl1HRbTgHyzJfvPH1O5SCXGtxrV63kZEWcXQRK8fk0
         SEQz8I4o8YPoof9UFdVy2pKhKN+68CMBCsEK4xitWo1NUS7RHuRL1WeJrlJq+Unlg+h+
         hBtg1KK6gSTuz+FskxlMLV/PER7J8cg/NzK31OfDB1lG+jvqPi9W8rXPs0x2i5aop48p
         zMNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R2koS2vCzM8w7VNNntAyqh354TzQoKL9/yGNgBa5fxE=;
        fh=YAa5kkhrd0QBmt2SNKkaSBYd9xKW/lwDnxkWQDgpDZE=;
        b=RPhJvQUEZ+o22GVAK8ilEWj/xsfJ3WbrRyZHHzsvHCOqCLKWQFY7lFzk62yrenv3jy
         WWhTfh9SxlMMpD93pnx3w11H3Fhxk0QMBgmtOCmTymY1QXTD/fFuW8/gJxtWsCNEWHZn
         0N5Norsez768jn4kY+I6u8IWz6brmCEtxmoiqenhjfnoVctOKth9+OGo5kYR/ZCH0+B1
         6HQRElN9XHYErZzBvmKZ6vd5V/dhrBO4hgLA48Ca6N2fUEC/lk9gl010deGqUEm9Kljx
         BDxHIhOdyKJqhMu7FWhPCfX0LhXRwruDB+VCNXLJyn1qb1pJ8CaRJyG1wakf77KCj2/z
         3VvA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787939918; x=1788544718; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R2koS2vCzM8w7VNNntAyqh354TzQoKL9/yGNgBa5fxE=;
        b=A07VMhjIS94QdDOt14Q0De7cK01tTlGkez/2vaoB1SN+SBmPGK9Om3NpaAD1Q3l9EM
         4aZ8eHNMeS46CYkCIKmm/z7+fzH3NYNMQW6H7IPEupOnQ3OK6W4jckOD/1LI2m+HstLP
         WvUliJvHh/Flkj6/pjpfYugXkVNR0+3o6yHt0JesvOAPtM2r44fLumPtn5DDNcyus0Qg
         +vj/yMXJ9By60Z5LHU2wnsvRQvE4uJuH5M68+53mvNUgXjyFAV4Qm4PKyWiNnsaMiGTv
         3dX/FqnfW/Ng466cagGLsIso1Pgivaotds0KTEx3LTlP3Q8sMB5RdW41KCvT/f5YW4AD
         9SPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787939918; x=1788544718;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R2koS2vCzM8w7VNNntAyqh354TzQoKL9/yGNgBa5fxE=;
        b=b63vUNaGZSm9U0GuK/ysQnFQlUpmJPXIeK0VRNC6GD+I7BXG4MM4+u+gHQyP11J6qt
         fJ0HZa3JaKMBgZ9t9vA1CKneIQy2J3204QwfRL+iePfvEn9ei3JQ+ywHKT6B6lBY8LO8
         bjDXhqHBb4RnPp7v/bGnay8a4rpDMCVcaiv1/2EMwjeltI0OPcdQQpqgIfP6DEuIAn1k
         uz76mSXlM/jL4eqde7pV6AF9HJLuFwcutU7p8rzGmbrJMD5oxSc30MBBkj26dU/Fi+Om
         23Wxh41xii5yEW9P+1HKtW2R4DvujAggtByY9K3vkU0YGyHze+jDvHKPiIab7cdn8Xsr
         IvNQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqh7Xs2B2FDL64NaGKfLDe3CVSJmnLVxc3rFCGURKso0rIOHkMCyakLMRQ4+hP5APeuFBWpddyYSDEw/DcUYLVb@lists.infradead.org
X-Gm-Message-State: AFuF++klx1A8evQkSEPD8m+G9TFgYvoihpcxBbjAkOnXWyDLL1Ab41MV
	1j+tz4xxDR9iABN6Q2Jx6SJiwfsuop3xF3KnTykn1v2sFSPCBtpuDsZWS9MDQsQFcNA5h0dhzzN
	jkgLYs1yAkmSy7ClR7nmiI5AIBgRiboa2T9Ij7BWjB4BE3gsq5m7pdx2kdSnrrg==
X-Gm-Gg: AR+sD10iqdX+TsbDQnU/mUc8KmTTHduYicFHwv3yuk3at/ZfzbhrUiVsf7l7qKPu1XY
	M54V7C+BT3Sur0kjUWArlCpIHc3HsAJ8cevcu1F4tPndOWYthpETlcLjMrET6I/7RERUDA9a1an
	mkttgqg2F9uk88xejZYMofCvgfrTIsTRqTK5EACdPlHDouQ2aNvAOCab34LytszN+/jt1l9aJ+E
	IS2VYgc+Z7eqcHtJheAlWVtMJ8cEWjrW7UCtGtqHS/L/nEvtehduUro9kfeVUgogH2aBK6Kb/Ma
	iYz8EkGyb5s6ZgdPFjq/MkK6YKoYww9Htr+2GewCJbjuw0e7RBH+jEkMBhiX1FJ+tARXGJTj8mk
	=
X-Received: by 2002:a05:600c:6051:b0:499:c46c:addc with SMTP id
 5b1f17b1804b1-49ccbb107damr76865e9.2.1787939917426; Fri, 28 Aug 2026 10:58:37
 -0700 (PDT)
MIME-Version: 1.0
References: <20260827232948.2520558-1-stevensd@google.com> <20260828124758.GP687043@noisy.programming.kicks-ass.net>
In-Reply-To: <20260828124758.GP687043@noisy.programming.kicks-ass.net>
From: David Stevens <stevensd@google.com>
Date: Fri, 28 Aug 2026 10:58:25 -0700
X-Gm-Features: AcwNN1WqLTUUK7Ta5eHOzidgwYbjtzO211AQh82X2UkIHuKv6OJYSJ2tvHu1D2I
Message-ID: <CAOiLmNGr385FOvdd9utJ6VYmngvRPbg8v6KfVVhFwmQ4oxhLSg@mail.gmail.com>
Subject: Re: [RFC 00/10] Reclaimable kernel stacks
To: Peter Zijlstra <peterz@infradead.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Dave Chinner <david@fromorbit.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Uladzislau Rezki <urezki@gmail.com>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, suleiman@google.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org, linux-rt-devel@lists.linux.dev, jstultz@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_105841_382128_8D9BDFF4 
X-CRM114-Status: GOOD (  24.46  )
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

On Fri, Aug 28, 2026 at 5:48=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Thu, Aug 27, 2026 at 04:29:38PM -0700, David Stevens wrote:
>
> > On Android, system processes typically have 2000-3000 threads. App
> > processes add 1000s more threads on top of this.
>
> WTF ?!? Why does that all spawn *that* many threads? Perhaps work on
> reducing that some?

I agree that the number of threads is rather excessive, and reducing
it in userspace is an ongoing effort. However, given Android's use of
Java and its heavily multi-process architecture, especially once apps
are involved, there are limits to how much the thread count can
realistically be reduced. And even if a 50% reduction in thread count
were somehow achieved, kernel stacks would still consume upwards of 1%
of system RAM on lower spec devices with 4GB of memory.

> > Tracking blocked state and when it is safe to reclaim a stack is done
> > via a series of hooks in the scheduler. The actual reclaim of stacks is
> > done asynchronously in a shrinker.
> >
> > Once a task's stack has been reclaimed, it cannot be rescheduled until
> > its stack is repopulated. Although there can be a repopulation fast pat=
h
> > within the scheduler, reliably allocating memory to repopulate the stac=
k
> > requires a fallback path that defers the repopulation and wakeup to a
> > workqueue context that can use GFP_KERNEL.
>
> I am really confused. On the one hand you have John working on proxy
> execution, with the aim on reducing latencies, and then here you are,
> posting something that will introduce basically unbound latencies.

The two projects aren't contradictory because they deal with different
types of latency.

Proxy execution aims to solve latency introduced by priority inversion
between background tasks and foreground tasks. This can happen at
basically any point if you get unlucky, resulting in unpredictable
latency spikes in high priority tasks.

The latency introduced by reclaimable stacks isn't substantially
different from the latency from refaulting evicted anon or file pages.
It's a tradeoff between the reduced cost of cold memory and the
increased latency when re-accessing that cold memory - clearly a
tradeoff that Linux already makes. In situations where reclaimed
stacks introduce latency, there will almost certainly already be extra
latency incurred from refaulting userspace pages. I don't yet have
production data, but the testing I've done so far doesn't show any
measurable negative impact on user visible latency metrics.

-David

