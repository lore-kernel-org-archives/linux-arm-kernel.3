Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E068CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 15:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fBU46xCxk9uXU3GgMbL1UGZ9h4wkK5TN+GCPvW3TEZY=; b=pGaPpxz+Yb093Gp/wIQvwzYRVz
	aQ+bBmjK0X/VIWSn+f8sGmJTCQlC3TjdC/V84/Jswe0pqFLNmBu4e/DsdiEadjwvMBmksZUa5WLpw
	SsrXwyy1qd7H+5Ro3ihOEEOmdAvSu7h2NBfBIDHzUIsHYT4BOeAzTU0csSeTP+ybObDpn236wWadE
	uEzXvFUv2rki4kJRdYSPQiJ3WPn6dfZAuoSOIdWNtR1dMB+ZS+zNFruAwy46rFdgGBBd8FWMhqqej
	MIqkswqJTI6zMudX0w11KeCXcQ690X9aaWdfRL9EpDYuSKuJ3XOu4plOavbt2sbnTHKeWrGnxc0eP
	MROI179Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI6jQ-00000003pgN-2z5K;
	Wed, 29 Apr 2026 15:21:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI6jP-00000003pfy-0O5G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 15:21:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 88C6660138;
	Wed, 29 Apr 2026 15:21:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10012C19425;
	Wed, 29 Apr 2026 15:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777476102;
	bh=DSYoQLeKmR5kS8394wFYsYzBGy66CBuLT27W6NUeeK8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LBWc37un6FXwtUJ8TTvdTzJpJ4A8lFVOiZXDNLS4gdTDLba6mC61hWZMHzSWCnvTz
	 SubuKzcRBWhWMkzht9UGNzmWGkHFaxQBuRLhXxn3kGpKxWcb8D2iXn7OKpNtaBp3nm
	 icqtzYb6HY8VXsFzGsZga3hotWp/HN8wTQY3dEjiVWdDROT9mTVfSdG97CIeWiVfcq
	 d4b1lluj90oByN4QIyYCw26BF8smMJSb3xYkKSVNAeYwn9cJCew5mA6ugNthGZow99
	 80OqVi3DcAHeve3hZ83KgT+oj3M4y5xPhAVb1bVsfVtswSdiNyQv7kTG7Rq9DWU8LO
	 mE9FkDhIZBXWw==
Date: Thu, 30 Apr 2026 00:21:39 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Ian
 Rogers <irogers@google.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v18 7/8] ring-buffer: Cleanup persistent ring buffer
 validation
Message-Id: <20260430002139.c3b0e4c92ae52aeeaf86e1bf@kernel.org>
In-Reply-To: <20260428162457.1ca8c4b6@gandalf.local.home>
References: <177701351903.2223789.17087009302463188638.stgit@mhiramat.tok.corp.google.com>
	<177701357903.2223789.1327164275262010250.stgit@mhiramat.tok.corp.google.com>
	<20260428162457.1ca8c4b6@gandalf.local.home>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 28 Apr 2026 16:24:57 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Fri, 24 Apr 2026 15:52:59 +0900
> "Masami Hiramatsu (Google)" <mhiramat@kernel.org> wrote:
> 
> > From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> > 
> > Cleanup rb_meta_validate_events() function to make it easier to read.
> > This includes the following cleanups:
> >  - Introduce rb_validatation_state to hold working variables in
> >    validation.
> >  - Move repleated validation state updates into rb_validate_buffer().
> >  - Move reader_page injection code outside of rb_meta_validate_events().
> > 
> > Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> > ---
> >  kernel/trace/ring_buffer.c |  186 ++++++++++++++++++++++----------------------
> >  1 file changed, 95 insertions(+), 91 deletions(-)
> > 
> > diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> > index de653a8e3cec..9850a0d8d24b 100644
> > --- a/kernel/trace/ring_buffer.c
> > +++ b/kernel/trace/ring_buffer.c
> > @@ -1883,8 +1883,16 @@ static int rb_read_data_buffer(struct buffer_data_page *dpage, int tail, int cpu
> >  	return events;
> >  }
> >  
> > -static int rb_validate_buffer(struct buffer_page *bpage, int cpu,
> > -			      struct ring_buffer_cpu_meta *meta, u64 prev_ts, u64 next_ts)
> > +struct rb_validation_state {
> > +	unsigned long entries;
> > +	unsigned long entry_bytes;
> > +	int discarded;
> > +	u64 ts;
> > +};
> > +
> > +static int __rb_validate_buffer(struct buffer_page *bpage, int cpu,
> > +				struct ring_buffer_cpu_meta *meta,
> > +				u64 prev_ts, u64 next_ts)
> >  {
> 
> This can still use those comments (from patch 4).
> 
> Also, could you rebase on top of v7.1-rc1?

Is it v7.1-rc1, not ring-buffer/for-next?

Thanks,

> 
> Thanks Masami!
> 
> -- Steve
> 
> >  	struct buffer_data_page *dpage = bpage->page;
> >  	unsigned long long ts;
> > @@ -1914,16 +1922,82 @@ static int rb_validate_buffer(struct buffer_page *bpage, int cpu,
> >  	return ret;
> >  }


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

