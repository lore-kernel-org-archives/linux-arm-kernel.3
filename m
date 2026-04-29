Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B8ACCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 16:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j/Esht8wIPQ9PDgMUJll15IeAVM0HQrKY3Q6IqCDCZU=; b=f+mH8kh99TWmANkk2LRAP3uud8
	xS3y+qcUGHjTEhJJJOy5V24Y+ModkNwkDvn2TLJdXfNRxqNGGw7upurPHgITCrn59rzN5grSQ7Ri3
	P+aMv/4dv2IqqaseEBaPlA09RWBXjJsD6/CsfMrcTkS9d0UFDV71YsgMGkWGrcIKl5EI5JTIwvq7f
	5SdbwWtZiAzQQt/Xaim9OVWv78cxl7doX/auTqQ1fstKiA5Hj80TuMUfqkyfxbzV2oYXrQEW1sDst
	vv3BtpwDGUVlNXncyjjCEhX+I4pEVjkHlrCRPXlxBTxoHlvUOYzTTFiS0o4CPDS1XS+N2kLU7iYgx
	ZOBHlNIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI7wT-00000003vCp-37Ny;
	Wed, 29 Apr 2026 16:39:17 +0000
Received: from smtprelay0010.hostedemail.com ([216.40.44.10] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI7wQ-00000003vCT-2kai
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 16:39:16 +0000
Received: from omf04.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id 4C6988B340;
	Wed, 29 Apr 2026 16:39:11 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf04.hostedemail.com (Postfix) with ESMTPA id 4AA7520033;
	Wed, 29 Apr 2026 16:39:09 +0000 (UTC)
Date: Wed, 29 Apr 2026 12:39:26 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Ian
 Rogers <irogers@google.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v18 4/8] ring-buffer: Skip invalid sub-buffers when
 rewinding persistent ring buffer
Message-ID: <20260429123926.204893bc@gandalf.local.home>
In-Reply-To: <20260430002023.b19608c27a746284e8f73b80@kernel.org>
References: <177701351903.2223789.17087009302463188638.stgit@mhiramat.tok.corp.google.com>
	<177701355481.2223789.8929563537404268817.stgit@mhiramat.tok.corp.google.com>
	<20260428162146.78e52988@gandalf.local.home>
	<20260430002023.b19608c27a746284e8f73b80@kernel.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 4AA7520033
X-Stat-Signature: iu88zayeg6ne7c8wjgbd3qfdoysmewpm
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18HVNhk5oli4waG8dH1zzmr57zUTbTPRqY=
X-HE-Tag: 1777480749-847527
X-HE-Meta: U2FsdGVkX18e8tf31RS8/ePPO45W5EQbETJbQmuhbtYRO3flXKvGNpFTlfQOxozfw2x0F8o5SZ24KpKDIRsJyDQsgLPPNmM+OMMhUFH/KHPV3R1bOpN1quUmn/WHRsLwVts66aZCHuiaQ4f3/xoG+XQZ54brVKYrmM4Z5N/T7zvsfOE28zjVzFeZ7wWIgImrgmK/7EagSALJ443zlzSUb7E95RnsoNNOdmUpqOOip9zZBmrB0R460zlnCPbxlvAJTPeragkYS3GwWZtIn8sEVhO/sgGChC/+d+yuNw8trgPH8xyIfn4qpZu+KBF7mSFc1VRcSqeVH9SCwhLV+4OlaQj0BhrIdX4EzDwqPunOXvxrJMqrJPM1ZrOLQdudPP1iwc7WBWn6C5IuO0ExIDxWWA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_093914_776746_5CB30E42 
X-CRM114-Status: GOOD (  15.82  )
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

On Thu, 30 Apr 2026 00:20:23 +0900
Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:

> On Tue, 28 Apr 2026 16:21:46 -0400
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
> > On Fri, 24 Apr 2026 15:52:35 +0900
> > "Masami Hiramatsu (Google)" <mhiramat@kernel.org> wrote:
> >   
> > > @@ -1892,9 +1895,19 @@ static int rb_validate_buffer(struct buffer_data_page *dpage, int cpu,
> > >  	 * subbuf_size is considered invalid.
> > >  	 */
> > >  	tail = local_read(&dpage->commit) & ~RB_MISSED_MASK;
> > > -	if (tail > meta->subbuf_size - BUF_PAGE_HDR_SIZE)
> > > -		return -1;
> > > -	return rb_read_data_buffer(dpage, tail, cpu, &ts, &delta);
> > > +	if (tail <= meta->subbuf_size - BUF_PAGE_HDR_SIZE)
> > > +		ret = rb_read_data_buffer(dpage, tail, cpu, &ts, &delta);
> > > +  
> > 
> > This code seriously needs comments.  
> 
> OK, I'll add it, or let code explain clearer?
> 
> 	if (tail <= meta->subbuf_size - BUF_PAGE_HDR_SIZE)
> 		ret = rb_read_data_buffer(dpage, tail, cpu, &ts, &delta);
> 	else
> 		ret = -1;

That's better...

> 
> Thanks,
> 

The below should have some explanation too. I can figure it out, but it
wasted more brain cycles than I would have liked ;-)

-- Steve


> >   
> > > +	if (ret < 0 || (prev_ts && prev_ts > ts) || (next_ts && ts > next_ts)) {
> > > +		local_set(&bpage->entries, 0);
> > > +		local_set(&bpage->page->commit, 0);
> > > +		bpage->page->time_stamp = prev_ts ? prev_ts : next_ts;
> > > +		ret = -1;
> > > +	} else {
> > > +		local_set(&bpage->entries, ret);
> > > +	}
> > > +
> > > +	return ret;
> > >  }
> > >    
> 
> 


