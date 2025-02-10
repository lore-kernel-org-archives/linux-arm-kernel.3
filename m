Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3441AC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 09:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lda57PQrvabV7TRnU6VjJDmDMF10QGZVMZAT4AjoPmg=; b=vyZtisaq9xpc6TSyaneAV6Tttk
	5mdlDdGvoflcTk1ZiFjXNcbb1R6wfJ4e8otpsxbxRfGstMcL9TbBQWToEAUiutAx14Abu5uMk26pF
	/YWBiT2HUULLTHmCB5p9sJUStJt3rd7JrNKrX2IzTfghQARqSZeXXLIxW+vcCstlu5zXh+WDGENls
	/MMrFv9FOYhnhkr0ywPAximQLZ2SBGGvO/ohvtareZ9tHzTBoPAXQGt/luK1UTAzJNmn+DTgzP1GX
	lvBHw45P3uBdTlFpcvtQ0XzAkG0CYPTIg9SJcoSKR4ppMcqwxhDbBOmvBsa7Dq0IwrPvoY7My+vVn
	AawuvFwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thQY2-0000000Gty8-0cj1;
	Mon, 10 Feb 2025 09:57:50 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thQWP-0000000Gtj7-38ui
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Feb 2025 09:56:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lda57PQrvabV7TRnU6VjJDmDMF10QGZVMZAT4AjoPmg=; b=kFGMe+BGbho/98khdsaOK+1haQ
	aDKn1Q73vWV+mCxc73fbgI4pIK2ksy++4trCtS6msTI3rq9EhmVJ90UUtUkic8c+GFkK3jpxVULkm
	/xelkbA4A4SPebWm3p4UKr0hfPtdES2uV8grGuugejHBkQtu0WyocjRCVPl6cOG4/vGmSfyw0DsU1
	zZsrVCmsYG4Y7L2PUhSVTS5MLUs64L8cal4QUR3zE2JkiK3RlXVSseIi27TibAUDeuXmjGQ++9pzq
	CchN03CoaftrmZdZqVjfY9yHlms+ejn7IJTDwIrOkVQ2FvmKD5SQ+iw344+KfNttNJXEgE3cyVC65
	gnTFSmEA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1thQWN-0000000FTvf-2hEk;
	Mon, 10 Feb 2025 09:56:07 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 3D42F300318; Mon, 10 Feb 2025 10:56:07 +0100 (CET)
Date: Mon, 10 Feb 2025 10:56:07 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	Barret Rhoden <brho@google.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Will Deacon <will@kernel.org>, Waiman Long <llong@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>, Tejun Heo <tj@kernel.org>,
	Josh Don <joshdon@google.com>, Dohyun Kim <dohyunkim@google.com>,
	linux-arm-kernel@lists.infradead.org, kernel-team@meta.com
Subject: Re: [PATCH bpf-next v2 07/26] rqspinlock: Add support for timeouts
Message-ID: <20250210095607.GH10324@noisy.programming.kicks-ass.net>
References: <20250206105435.2159977-1-memxor@gmail.com>
 <20250206105435.2159977-8-memxor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206105435.2159977-8-memxor@gmail.com>
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

On Thu, Feb 06, 2025 at 02:54:15AM -0800, Kumar Kartikeya Dwivedi wrote:
> @@ -68,6 +71,44 @@
>  
>  #include "mcs_spinlock.h"
>  
> +struct rqspinlock_timeout {
> +	u64 timeout_end;
> +	u64 duration;
> +	u16 spin;
> +};
> +
> +static noinline int check_timeout(struct rqspinlock_timeout *ts)
> +{
> +	u64 time = ktime_get_mono_fast_ns();

This is only sane if you have a TSC clocksource. If you ever manage to
hit the HPET fallback, you're *really* sad.

> +
> +	if (!ts->timeout_end) {
> +		ts->timeout_end = time + ts->duration;
> +		return 0;
> +	}
> +
> +	if (time > ts->timeout_end)
> +		return -ETIMEDOUT;
> +
> +	return 0;
> +}
> +
> +#define RES_CHECK_TIMEOUT(ts, ret)                    \
> +	({                                            \
> +		if (!(ts).spin++)                     \
> +			(ret) = check_timeout(&(ts)); \
> +		(ret);                                \
> +	})

