Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84059C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 10:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fbev8gX6zQhqBnk6ZosZ+K90Ne5Pg66SYqcXnm0oea4=; b=0ftp5W4oyG/ReJ1pIOvOyNGsxa
	1hxapoIslPj5STanTBtPQM4lRVdYfJJSQPEYsyBCx43F0onmFk7TGoTflCz2H8fhrXLmH86jgdZnV
	wcvol+uBHWom1pRtdlMKfArEJrXhCrqukFFWNKVfwv0NUxXzJ4PrLmgSDSMHfD/MIbWYFFh01t3EA
	X/JGcWI71cOiE3Om6zYZxrRsfmPVnGZGQloOktoRDgDAHcXBWEbuc7vYJwzi+MBkmKzZcG9P+S+QE
	KYBsFBmHoiMJuhfD45KR+nNOguSjmCQtXxRfqaRgO2NFFQmHO1ICIeiWwbRYs69CbmhQ9mDXahfY6
	siBLe+4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thRHh-0000000H4Dl-3ucG;
	Mon, 10 Feb 2025 10:45:01 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thR9Q-0000000H2UP-1vkv
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Feb 2025 10:36:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Fbev8gX6zQhqBnk6ZosZ+K90Ne5Pg66SYqcXnm0oea4=; b=dWbXPj0rff9aRR6VmRTPN1tRik
	L79Fdxnnj4Ka8iHhRIx2cVdVUJ0cD6WRlEfeb5/PWFh8q9TewxHDD83iYAuF8VRrex9klbkymLnJS
	9gSUtjC86kFTQfEtBPaNCbI5lCe+UO6e9rAJ3tvFx+5uBYzTq3ugytzzmQvia+qTufeYkxmhrMsiv
	91O+7xYd0PzfBoJx40Igse7KVgucBMrMx4R4QwyyGdijb7ssLaNva4SaIEYUe9FyqthMMJjndY/gN
	ZhsJqpOOLXFBXsf/L3EQqSxDNc0OSUPT3cJ9KzPMzUQi46wzPRlOILE6ZGA9BCmH06Z3Zopx+oh3p
	vQbAySMw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1thR9O-0000000Fcuf-1MQ4;
	Mon, 10 Feb 2025 10:36:26 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id BC89B300318; Mon, 10 Feb 2025 11:36:25 +0100 (CET)
Date: Mon, 10 Feb 2025 11:36:25 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Will Deacon <will@kernel.org>, Waiman Long <llong@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>, Tejun Heo <tj@kernel.org>,
	Barret Rhoden <brho@google.com>, Josh Don <joshdon@google.com>,
	Dohyun Kim <dohyunkim@google.com>,
	linux-arm-kernel@lists.infradead.org, kernel-team@meta.com
Subject: Re: [PATCH bpf-next v2 11/26] rqspinlock: Add deadlock detection and
 recovery
Message-ID: <20250210103625.GK10324@noisy.programming.kicks-ass.net>
References: <20250206105435.2159977-1-memxor@gmail.com>
 <20250206105435.2159977-12-memxor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206105435.2159977-12-memxor@gmail.com>
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

On Thu, Feb 06, 2025 at 02:54:19AM -0800, Kumar Kartikeya Dwivedi wrote:
> +	/*
> +	 * Find the CPU holding the lock that we want to acquire. If there is a
> +	 * deadlock scenario, we will read a stable set on the remote CPU and
> +	 * find the target. This would be a constant time operation instead of
> +	 * O(NR_CPUS) if we could determine the owning CPU from a lock value, but
> +	 * that requires increasing the size of the lock word.
> +	 */

Is increasing the size of rqspinlock_t really a problem? For the kernel
as a whole there's very little code that really relies on spinlock_t
being u32 (lockref is an example that does care).

And it seems to me this thing might benefit somewhat significantly from
adding this little extra bit.


