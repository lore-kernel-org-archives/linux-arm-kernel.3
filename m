Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E0F2FF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 07:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GpOgCcb4ilQt4GgXVtC95e/+8g1AuEOs4okthTTjNEo=; b=F9vWfOnEUEWBM/AR/z2Mlzwcli
	41oWe3/W8WcX5gyJuUVPl/CrA9OZySc/mz75FUJYMvJBMoi3XD8/6t0JdICxS5mS2bS1DPOSfaAuC
	OjsnpLGmGIvsNfHH0oXfZUxnCoRXxfAWWsOFK/0miltftVD3T8gNEXiTlkVg7bBqhy8afS2wl0SVq
	Gied6Pwjkbdb0Jd2Pi78MP2hYSmcXwLuh5LTcHqyxapiVe6IlNbY5IIixZvXgf0ZNjV7ptLircZR5
	/Zly1mSAcVO6lzqEXa9i9lIRlVqBV+rL8RtNNLhv4DhVQwpb+dC2R1++cZpdwJ2ZiJhuiQAFDGDCW
	RCOPO8TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHGaY-0000000GOfY-3vva;
	Mon, 27 Apr 2026 07:41:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHGaV-0000000GOf3-2eZQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 07:41:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777275661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GpOgCcb4ilQt4GgXVtC95e/+8g1AuEOs4okthTTjNEo=;
	b=WIBanLo+pZR7eyjc7CKWrQ4zBk50uzLrX4yyp0i8GHMtCiOyJlN/Mk5KAAP1SD39w3N4N9
	YKvyRcMF+HyfpIiFufDtOD5pvGKaCdDaEos+7nUGaN1atKQ1vi9dDPzdIbBUfMml/ueC8O
	UDLe4s0NQP79w9QXNTb8/I0c0Xq7b/E=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-119-0IPi-P0tMAayg2A5qbA2ow-1; Mon,
 27 Apr 2026 03:40:57 -0400
X-MC-Unique: 0IPi-P0tMAayg2A5qbA2ow-1
X-Mimecast-MFC-AGG-ID: 0IPi-P0tMAayg2A5qbA2ow_1777275654
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 454E318003F6;
	Mon, 27 Apr 2026 07:40:53 +0000 (UTC)
Received: from fweimer-oldenburg.csb.redhat.com (unknown [10.44.48.4])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AFFEA180047F;
	Mon, 27 Apr 2026 07:40:46 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,  Mathias Stearn
 <mathias@mongodb.com>,  Dmitry Vyukov <dvyukov@google.com>,  Jinjie Ruan
 <ruanjinjie@huawei.com>,  linux-man@vger.kernel.org,  Mark Rutland
 <mark.rutland@arm.com>,  Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>,  Catalin Marinas
 <catalin.marinas@arm.com>,  Will Deacon <will@kernel.org>,  Boqun Feng
 <boqun.feng@gmail.com>,  "Paul E. McKenney" <paulmck@kernel.org>,  Chris
 Kennelly <ckennelly@google.com>,  regressions@lists.linux.dev,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  Ingo Molnar <mingo@kernel.org>,  Blake Oler <blake.oler@mongodb.com>,
  Rich Felker <dalias@libc.org>,  Matthew Wilcox <willy@infradead.org>,
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  Linus Torvalds
 <torvalds@linuxfoundation.org>, criu@lists.linux.dev
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
In-Reply-To: <87jyttz8cf.ffs@tglx> (Thomas Gleixner's message of "Mon, 27 Apr
	2026 00:04:48 +0200")
References: <aekPXvvuKHKlETjm@J2N7QTR9R3.cambridge.arm.com>
	<87wlxy22x7.ffs@tglx>
	<c5331cd6-76c8-430d-978e-fcad164e48f6@huawei.com>
	<CACT4Y+bxnQyHGdVNE1BYTx+Z2-cscLb38HYS9jBM5gPAz8=4bw@mail.gmail.com>
	<87ik9i0xlj.ffs@tglx>
	<CAHnCjA0UBNXfjHw=Y34OrAyGRNUtVF+zWd3ugyX6pd_mCk8K9w@mail.gmail.com>
	<87a4ut1njh.ffs@tglx>
	<CACT4Y+bBD7uCHXKqGo=epBXeEmsZ67Og2YO9kjNMT3ryjUY_sA@mail.gmail.com>
	<CAHnCjA1LqbaUGkPe79EeP6Mpaki8QWeR-JBSbrG0z6pTm9CmUg@mail.gmail.com>
	<87v7dgzbo7.ffs@tglx>
	<20260424150318.GE641209@noisy.programming.kicks-ass.net>
	<87se8kywhb.ffs@tglx> <87jyttz8cf.ffs@tglx>
Date: Mon, 27 Apr 2026 09:40:43 +0200
Message-ID: <lhujyts4zr8.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: rPSUj5juVHRi7PUnqmxglylweZWIN-6p6oEQlepYaf4_1777275654
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_004103_746332_4CF7FA7B 
X-CRM114-Status: GOOD (  21.75  )
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

* Thomas Gleixner:

> The real question is how to differentiate between the legacy and the
> optimized mode. I have two working variants to achieve that:
>
>    1) The fully safe option requires a new flag for RSEQ
>       registration. It obviously requires a glibc update. (Suggested by
>       PeterZ)

Without glibc changes, RSEQ would keep working, but with the old,
problematic performance, right?

If we don't have a notification in the auxiliary vector, we'd have to do
two system calls at process start, which isn't ideal, but is probably
not a significant issue, either.

I haven't verified this, but it looks like introducing the flag breaks
CRIU?  In dump_thread_rseq, we have this:

        if (rseqc.flags != 0) {
                pr_err("something wrong with ptrace(PTRACE_GET_RSEQ_CONFIGURATION, %d) flags = 0x%x\n", tid,
                       rseqc.flags);
                return -1;
        }

I suppose a workaround could make this behavior flag a prctl flag.  CRIU
wouldn't dump and restore that until taught about it.  If the new
behavior is switched on explicitly by the flag, it would be
backwards-compatible, except that restoring with unpatched CRIU would
lead to a performance loss.

>    2) Determine the requirements of the registering task via the size of
>       the registered RSEQ area.
>
>       The original implementation, which TCMalloc depends on, registers
>       a 32 byte region (ORIG_RSEG_SIZE). This region has 32 byte
>       alignment requirement.
>
>       The extension safe newer variant exposes the kernel RSEQ feature
>       size via getauxval(AT_RSEQ_FEATURE_SIZE) and the alignment
>       requirement via getauxval(AT_RSEQ_ALIGN). The alignment
>       requirement is that the registered rseq region is aligned to the
>       next power of two of the feature size. The kernel currently has a
>       feature size of 33 bytes, which means the alignment requirement is
>       64 bytes.

There are still glibc builds in use that do not use AT_RSEQ_ALIGN, and
instead unconditionally reserve a size of 32.  In some builds, the RSEQ
area is not aligned to a multiple of 64, which makes glibc
indistinguishable from tcmalloc.  You could look at the location of the
thread pointer relative to the RSEQ area at registration to tell them
apart, but that is perhaps too nasty.

Switching to the new extensible RSEQ allocation code in older glibc
builds is not entirely trivial, and I would prefer not doing that.
Registering with a new flag is comparatively simple, and we could
backport it, except that it might not be compatible with CRIU.

Thanks,
Florian


