Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E426EE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 19:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oQHNPmSy/Un7BZAjZEumOVP8NRDVDFxgxPLMNKaSexg=; b=JsFPv6vxL5mhZ5pTSSyq0h5Dad
	sULVucBcpjMnDP2hX5GX9h2Oah7348KsATMGINk+pp1SkgJBN8a/I0CdyIpXsVasavrzIHtma2r08
	N5JXOmSOTXHhNkU8Sn23LZlotvs//nIBB4AMXe9VDVsIoxegNiHHGJbBCdebEeP0B8AN/CvaHu8yn
	HWnYGQ0KC0UTWpK0vuvsIjm32r9EDHqH5p5TzM6FHxJ2qGtoJrAvzKp1b+xa3phfwT6aeqDyimrEv
	t5UWf9ZqW6jXZIcSB5NRp2AkrYFiOyrz6fQYmRj7Xx1bv9zrvfQXy94JAl9V/cxFuUUWpvQF9jbzI
	mDzKa/cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL5yB-0000000CWrM-0lwZ;
	Tue, 10 Dec 2024 19:32:31 +0000
Received: from out-186.mta1.migadu.com ([2001:41d0:203:375::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL5x7-0000000CWmM-422s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 19:31:27 +0000
Date: Tue, 10 Dec 2024 14:31:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1733859081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oQHNPmSy/Un7BZAjZEumOVP8NRDVDFxgxPLMNKaSexg=;
	b=GUJU2Oq/N/HefXjnU09XUQaOs7oflOjeqUYv39k+LjLKpc/6p4A4r8k8L77aAb5jBvpMMK
	lRXVNHU0aF5wyHKr8X9iGfo10NvJNXQ32lvAYSglV/BX1AG4N+iJg9mKq0uccZbz2YXdN9
	L9EV6PryblEEckgFWZhIaAaF1VRTIyE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-bcachefs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: arm64: stacktrace: unwind exception boundaries
Message-ID: <aieiy7cowkk7ygkhpquggbkpzn5w4prlr5ujjuawpsw4re6467@iwuu4r32lr7r>
References: <36kx57aw46vwykgckr5cm4fafhw54tjuj4cqljrdnpfwvjl7if@a7znuhpfu54o>
 <zbwbgkuvvciezpmigcp6gaahfxwm7cwhpzus7gtbfnbzsjb2n3@kfbdppbd74o4>
 <Z1bWaGCvUrwrj2fZ@J2N7QTR9R3>
 <Z1gll87-TkAqFwUz@J2N7QTR9R3>
 <rxc57eg65sg4iayhj7gc7yl24w524lviedxnydl2mggqnatglq@iairj2ci7ioj>
 <Z1iT0AQqu5dqdCSg@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1iT0AQqu5dqdCSg@J2N7QTR9R3>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_113126_272328_A4BA3640 
X-CRM114-Status: GOOD (  27.51  )
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

On Tue, Dec 10, 2024 at 07:17:36PM +0000, Mark Rutland wrote:
> On Tue, Dec 10, 2024 at 07:40:04AM -0500, Kent Overstreet wrote:
> > On Tue, Dec 10, 2024 at 11:27:19AM +0000, Mark Rutland wrote:
> > > On Mon, Dec 09, 2024 at 11:37:12AM +0000, Mark Rutland wrote:
> > > > On Thu, Dec 05, 2024 at 01:04:59PM -0500, Kent Overstreet wrote:
> 
> > > Looking some more, I see that bch2_btree_transactions_read() is trying
> > > to unwind other tasks, and I believe what's happening here is that the
> > > unwindee isn't actually blocked for the duration of the unwind, leading
> > > to the unwinder encountering junk and consequently producing the
> > > warning.
> > > 
> > > As a test case, it's possible to trigger similar with a few parallel
> > > instances of:
> > > 
> > > 	while true; do cat /proc/*/stack > /dev/null
> > > 
> > > The only thing we can do on the arm64 side is remove the WARN_ON_ONCE(),
> > > which'll get rid of the splat. It seems we've never been unlucky enough
> > > to hit a stale fgraph entry, or that would've blown up also.
> > > 
> > > Regardless of the way arm64 behaves here, the unwind performed by
> > > bch2_btree_transactions_read() is going to contain garbage unless the
> > > task is pinned in a blocked state. AFAICT the way
> > > btree_trans::locking_wait::task is used is here is racy, and there's no
> > > guarantee that the unwindee is actually blocked.
> > 
> > Occasionally returning garbage is completely fine, as long as the
> > interface is otherwise safe. This is debug info; it's important that it
> > be available and we can't impose additional synchronization for it.
> 
> Sure thing; just note that there's no guarantee that this is only
> "occasionally" garbage -- this could be wrong 1% of the time or 99% of
> the time depending on the specific scenario, HW it's running on, etc. As
> long as you're happy to hold the pieces when that happens, that's fine.
> 
> I've pushed out fixes to the arm64/stacktrace/fixes branch on my
> kernel.org git repo:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/log/?h=arm64/stacktrace/fixes
>   git://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/stacktrace/fixes
> 
> ... and I'll get that out as a series on the list tomorrow.

Wonderful

The fact that /proc/pid/stack doesn't give anything if the process is in
TASK_RUNNING has been a problem in the past, yet this is something we're
not consistent on in the kernel; sysrq-trigger backtraces do give
backtraces for running processes (which then may require sorting through
everything).

So thanks for this :)

