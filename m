Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37028FF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 19:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q4kpoyGQaFwqCc/YpITTHLP1CsRwCUcCgkMn7cdib6k=; b=p3IVJYUXInMQ1x8oazpS4Wg2l2
	MEZ3Nn3Z8yj5uvPzTOgP0u3n6wL6qoj/ljSj/Kfm0rU1XkdX2JXACeIPsu98FSqC7UnUPIMw38b6C
	fB+HxM09C3ziuJg/G53iuluIADwXiJt8hHKIwHMknPmhjvzvgzrKXDXDaz8hZSR41jYXLQ00mzEfe
	6f99pv8BlZvnxFV5oxjje0a+oXMLcSH0QGJY+MQw5y4s/B+g+2rzVxQMtfVwNyseJdE5jEEkj/DT9
	B8vYgAZ66IWxX7MjeLpr1hbFMDRkC9wsPjHp9glo7POyj3xI9ukQrj3ol42CLCeQenQlJe6hjhNmE
	gfRkdrcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHoWN-00000002Bfr-1ywK;
	Tue, 28 Apr 2026 19:55:03 +0000
Received: from smtprelay0013.hostedemail.com ([216.40.44.13] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHoWL-00000002Bf8-0U9f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 19:55:02 +0000
Received: from omf05.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id 65FF68B4EF;
	Tue, 28 Apr 2026 19:54:55 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf05.hostedemail.com (Postfix) with ESMTPA id 6158820016;
	Tue, 28 Apr 2026 19:54:53 +0000 (UTC)
Date: Tue, 28 Apr 2026 15:55:08 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Ian
 Rogers <irogers@google.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v18 3/8] ring-buffer: Skip invalid sub-buffers when
 validating persistent ring buffer
Message-ID: <20260428155508.4f47279e@gandalf.local.home>
In-Reply-To: <177701354681.2223789.14633430761021638378.stgit@mhiramat.tok.corp.google.com>
References: <177701351903.2223789.17087009302463188638.stgit@mhiramat.tok.corp.google.com>
	<177701354681.2223789.14633430761021638378.stgit@mhiramat.tok.corp.google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: m9mastd5se131aaz4xejahg9oauwro5m
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: 6158820016
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18m48WcMR0YIPxC0AO+Xbj94B0nP/3Lxys=
X-HE-Tag: 1777406093-875647
X-HE-Meta: U2FsdGVkX1/lgOk4DwxGNl45o43+EDq39Zqwt0Ndd1cEsKemzPRyqUO+pIk9qv0n/P7XUAi3kvadBvvbT7bucgbRICT5LD6cao+Y3OQizFwbJFlAqaqjen30sMCEstI2dYmZ1S4zjl+YiVSQX+mk6zFx/HgCdQLWr0/snJP7Ra1xo8CUYkax2gDa2WZWA0BAOZqLARQiVGzSWChXkBUhgMTw8FhenhSsELu4HgFsuAPgjhiWrV9D7TdrvQ3nmbfGqBXm9NjD+2XDPmGhUSkP8HRp0Hexbv/c9ImW8r1i6vnMdaGZbm87WEyKsOUHwv/O3Chh39tngpNDVIUxqTr+OHD8ZGc2xgX+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_125501_216154_B0C8DC16 
X-CRM114-Status: GOOD (  13.21  )
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

On Fri, 24 Apr 2026 15:52:27 +0900
"Masami Hiramatsu (Google)" <mhiramat@kernel.org> wrote:

> @@ -5648,11 +5668,12 @@ __rb_get_reader_page(struct ring_buffer_per_cpu *cpu_buffer)
>   again:
>  	/*
>  	 * This should normally only loop twice. But because the
> -	 * start of the reader inserts an empty page, it causes
> -	 * a case where we will loop three times. There should be no
> -	 * reason to loop four times (that I know of).
> +	 * start of the reader inserts an empty page, it causes a
> +	 * case where we will loop three times. There should be no
> +	 * reason to loop four times unless the ring buffer is a
> +	 * recovered persistent ring buffer.

Can you explain more to why this is allowed for persistent ring buffer?

Note, I do not like any loops that can go into an infinite loop and lock up
the machine. If something goes wrong with a persistent ring buffer, then
this could possibly go into an infinite loop.

I want to understand why this is allowed, and possibly add a check that
prevents this from never ending.

-- Steve


>  	 */
> -	if (RB_WARN_ON(cpu_buffer, ++nr_loops > 3)) {
> +	if (RB_WARN_ON(cpu_buffer, ++nr_loops > 3 && !cpu_buffer->ring_meta)) {
>  		reader = NULL;
>  		goto out;
>  	}

