Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD938FF887E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 15:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tLFJkYHH7sOLmc1gLaj7DLFVX2iEfN0aEH5nEvIB3dQ=; b=fE/5PU0kmMjjAzDUbatc7eOJil
	9jY1P+9Kz0yIV8lw1NxjboqV/ewzXboovwMPyGXNiJpMdGkW2bqJPpi3cLRU+oguIpluX4OCT/40Y
	p3Mkl+JKgAImNjDbwL/slfSz5P5pk4WruTK7kbM/KTk+7YjYFFSKYW1vC8CCx80pUaZ8DuRQ5iyln
	RcONexUzMJT8B80VHtHqtxri2uHIXHGQ2tPKkg++K3Tvv15I/0uAl+i5aB2txaeX7FKkU/YhThqr9
	x6raRwJsxeH3ykXlktJOcR25PGMARfaOjhA+uElKlQqEJpT6OxMFkvjfnCZSE5CGEAcQ5e44Isdfj
	spLSXW1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI6iC-00000003pRm-0Cy0;
	Wed, 29 Apr 2026 15:20:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI6iB-00000003pRd-0uRU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 15:20:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 658ED6001A;
	Wed, 29 Apr 2026 15:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E936EC19425;
	Wed, 29 Apr 2026 15:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777476026;
	bh=iRtJTYnWWpEWI9sc96kjWYUWN9eoqli1GDs2kMFzcbc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rgAD3s71Iddnt7NVEUWoeX/uhntmqnmf4ij+Qu3t33coW2DmX02hlUzxvH6DyJv10
	 EzYK42UFDXvu2e7D3zctYWpNYESrwLhCu8taPjw0ME6bZRwWr+shtPqYms2PvOqCQd
	 HeNbWUyxoSQVbuvUSZl7uK0zRAAC0dNJzcijN75qkBhMVY9SIUOWZOVCe31lbc4oSe
	 bNBj8eTuWwsyw7JHPxCwzZyRkMeHVmkSjcwtNEHMuL53hhha2Mlgaw1WliJs9C/k1H
	 iohsJ2NUQFLoKRhMRJu5MEYSa0PWfScpwYNiY6N70DfzdrHEMKQDhUnuZTa4dDJdN1
	 io0+WuMwNWKIA==
Date: Thu, 30 Apr 2026 00:20:23 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Ian
 Rogers <irogers@google.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v18 4/8] ring-buffer: Skip invalid sub-buffers when
 rewinding persistent ring buffer
Message-Id: <20260430002023.b19608c27a746284e8f73b80@kernel.org>
In-Reply-To: <20260428162146.78e52988@gandalf.local.home>
References: <177701351903.2223789.17087009302463188638.stgit@mhiramat.tok.corp.google.com>
	<177701355481.2223789.8929563537404268817.stgit@mhiramat.tok.corp.google.com>
	<20260428162146.78e52988@gandalf.local.home>
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

On Tue, 28 Apr 2026 16:21:46 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Fri, 24 Apr 2026 15:52:35 +0900
> "Masami Hiramatsu (Google)" <mhiramat@kernel.org> wrote:
> 
> > @@ -1892,9 +1895,19 @@ static int rb_validate_buffer(struct buffer_data_page *dpage, int cpu,
> >  	 * subbuf_size is considered invalid.
> >  	 */
> >  	tail = local_read(&dpage->commit) & ~RB_MISSED_MASK;
> > -	if (tail > meta->subbuf_size - BUF_PAGE_HDR_SIZE)
> > -		return -1;
> > -	return rb_read_data_buffer(dpage, tail, cpu, &ts, &delta);
> > +	if (tail <= meta->subbuf_size - BUF_PAGE_HDR_SIZE)
> > +		ret = rb_read_data_buffer(dpage, tail, cpu, &ts, &delta);
> > +
> 
> This code seriously needs comments.

OK, I'll add it, or let code explain clearer?

	if (tail <= meta->subbuf_size - BUF_PAGE_HDR_SIZE)
		ret = rb_read_data_buffer(dpage, tail, cpu, &ts, &delta);
	else
		ret = -1;

Thanks,

> 
> -- Steve
> 
> > +	if (ret < 0 || (prev_ts && prev_ts > ts) || (next_ts && ts > next_ts)) {
> > +		local_set(&bpage->entries, 0);
> > +		local_set(&bpage->page->commit, 0);
> > +		bpage->page->time_stamp = prev_ts ? prev_ts : next_ts;
> > +		ret = -1;
> > +	} else {
> > +		local_set(&bpage->entries, ret);
> > +	}
> > +
> > +	return ret;
> >  }
> >  


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

