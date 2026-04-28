Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED6B9FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 20:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OAY68vAtaRCOLH1dvRkRkALPnrOOXodvAp4UKmGj6dQ=; b=4iZ54B5Oal4pMaxdElwg+79v+u
	tkcj7hXnnVclSYJCTbNL2NoxAKOxCxaF/GNRzajCSPXoRbbylpGbXYftkLbJBtcKYWgMNPfe1Ll2L
	eQVELHgTU0goRGr8/1tfN0Gmf/PHhjjpBEfI9/ShkwRzIWPoGThmxWb42IKmmJZwdjYB2Jx2QcNkM
	YTwrwD9eKWKJ6+2AAzk5ceT+LifyZQUu9amtJOjQD2VJ3Ymkr7IcPvBQucE1O+r0Ec/FhWsJgzLrz
	UNy8yD7HI+QMVfj0nhbb88NnG21+weJtRFWjUwDMysGHgUOQoN3f5xy0XEo7Tz+mfyYOGv25SvltE
	af1UIRMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHozC-00000002Rnq-0M7r;
	Tue, 28 Apr 2026 20:24:50 +0000
Received: from smtprelay0012.hostedemail.com ([216.40.44.12] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHoz9-00000002RmY-28tB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 20:24:48 +0000
Received: from omf05.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id AD8D88B78A;
	Tue, 28 Apr 2026 20:24:44 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf05.hostedemail.com (Postfix) with ESMTPA id 99FF720019;
	Tue, 28 Apr 2026 20:24:42 +0000 (UTC)
Date: Tue, 28 Apr 2026 16:24:57 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Ian
 Rogers <irogers@google.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v18 7/8] ring-buffer: Cleanup persistent ring buffer
 validation
Message-ID: <20260428162457.1ca8c4b6@gandalf.local.home>
In-Reply-To: <177701357903.2223789.1327164275262010250.stgit@mhiramat.tok.corp.google.com>
References: <177701351903.2223789.17087009302463188638.stgit@mhiramat.tok.corp.google.com>
	<177701357903.2223789.1327164275262010250.stgit@mhiramat.tok.corp.google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: p71hyz9fekbjacrm1rsynhwxw4oh7391
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: 99FF720019
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19qottaY6YWkTiSZoZRzTvuj+Q3AbUx4Rc=
X-HE-Tag: 1777407882-289024
X-HE-Meta: U2FsdGVkX1+93qCyUXSei14/xjvmWhmSi2zjKopXHQge2cNxtuzOS9yAEjE1qfVnWxubjc9zdF+l9P8J+cQh3bYspGXBSo5hiCzjBWUWrNUgoTdbqspXjp9VJOyPcw7VDHFagx3KAyps8QNKd0iFU7GLx4VzIAT+94X0n9bO/nK3+FFvd1ZsZnm7JyeHPtio1zjRT2TUnj6I82gtQSqpnxuHTycPiSR9yBi0fwpXplzsmDKhVtdGuWRaP9+tCYXhzT1UEwC0jywfvLutaSubmYJ31jUdJ7841H8j3vU6dHZUkRACPUeww9Qd8ofLgdzKglgU9fu56tJvDKpVrnbeT/kKVB/h0S3/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_132447_615096_EE063D1D 
X-CRM114-Status: GOOD (  16.89  )
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

On Fri, 24 Apr 2026 15:52:59 +0900
"Masami Hiramatsu (Google)" <mhiramat@kernel.org> wrote:

> From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> 
> Cleanup rb_meta_validate_events() function to make it easier to read.
> This includes the following cleanups:
>  - Introduce rb_validatation_state to hold working variables in
>    validation.
>  - Move repleated validation state updates into rb_validate_buffer().
>  - Move reader_page injection code outside of rb_meta_validate_events().
> 
> Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> ---
>  kernel/trace/ring_buffer.c |  186 ++++++++++++++++++++++----------------------
>  1 file changed, 95 insertions(+), 91 deletions(-)
> 
> diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> index de653a8e3cec..9850a0d8d24b 100644
> --- a/kernel/trace/ring_buffer.c
> +++ b/kernel/trace/ring_buffer.c
> @@ -1883,8 +1883,16 @@ static int rb_read_data_buffer(struct buffer_data_page *dpage, int tail, int cpu
>  	return events;
>  }
>  
> -static int rb_validate_buffer(struct buffer_page *bpage, int cpu,
> -			      struct ring_buffer_cpu_meta *meta, u64 prev_ts, u64 next_ts)
> +struct rb_validation_state {
> +	unsigned long entries;
> +	unsigned long entry_bytes;
> +	int discarded;
> +	u64 ts;
> +};
> +
> +static int __rb_validate_buffer(struct buffer_page *bpage, int cpu,
> +				struct ring_buffer_cpu_meta *meta,
> +				u64 prev_ts, u64 next_ts)
>  {

This can still use those comments (from patch 4).

Also, could you rebase on top of v7.1-rc1?

Thanks Masami!

-- Steve

>  	struct buffer_data_page *dpage = bpage->page;
>  	unsigned long long ts;
> @@ -1914,16 +1922,82 @@ static int rb_validate_buffer(struct buffer_page *bpage, int cpu,
>  	return ret;
>  }

