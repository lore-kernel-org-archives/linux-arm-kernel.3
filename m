Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A25F10F92E9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 18:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s8mvpBldaQVU2+0EzSQ/OoikqXmcNv8u/ezi98bFVAI=; b=YFHXTEIgt5T1ItQOL8NsrhsBSb
	Ay6XSmtQfDsQhGMJ6xFV91hwKyEZSaPPZMtLQpGQkyZ+j2aPu/EiPUtUayy77WpsbqmTa36Y2b/7z
	Anj7Y03HOpOVG5gZj+uv+fR6VO1n+o5/NY2SVrk2ZUCf5JbNrCqXSKS4K586e7yrYDJgdNbIBfIUV
	6X6tE7bxEvM/eoO0C2F+jKJ1wriHN+EKehlO5odSrmbHXGtNmpXQ9jGl40G82Smw610tFliHdGshd
	Cr6mgdkM0twFqZM6ViYKpUw56CgS7WMjK/fioFIMXTF/Oaxm85KV4EQOYEPsmu4l1MYA+3KPL6yKl
	Cyhti9pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7dQp-0000000DOQj-0iZA;
	Tue, 31 Mar 2026 18:03:15 +0000
Received: from smtprelay0014.hostedemail.com ([216.40.44.14] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7dQg-0000000DOLc-1f7X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 18:03:07 +0000
Received: from omf06.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id D37EA160374;
	Tue, 31 Mar 2026 18:03:01 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf06.hostedemail.com (Postfix) with ESMTPA id 968C720015;
	Tue, 31 Mar 2026 18:02:59 +0000 (UTC)
Date: Tue, 31 Mar 2026 14:03:57 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Will Deacon
 <will@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Ian
 Rogers <irogers@google.com>, linux-arm-kernel@lists.infradead.org, Robin
 Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v15 1/5] ring-buffer: Flush and stop persistent ring
 buffer on panic
Message-ID: <20260331140357.43731429@gandalf.local.home>
In-Reply-To: <acwK-Xu-Mon2_6bT@arm.com>
References: <177494615421.71933.3679132057004156013.stgit@mhiramat.tok.corp.google.com>
	<177494616630.71933.2941681397188791689.stgit@mhiramat.tok.corp.google.com>
	<acwK-Xu-Mon2_6bT@arm.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 5gpg5dq1wziwms5kahogiegw19p3jr1f
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: 968C720015
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+00qx5ZZTRLH6y/fEb9PB20zgKWv6BfZ8=
X-HE-Tag: 1774980179-110066
X-HE-Meta: U2FsdGVkX1+l6HXrKgbWJUZdv3pPnplpcCf8NkR89+/4q1pnapmY+m/tN5jVzwbQ/6B3FYfdUdA+104U46Gw0aqu5rIrDVl5xMhT5Ge+L4364inSPcleZ4qyX+1XvYnkDfQCImdD2BpMpF/bZ+NEiI46CWG58kCr/Fz6IuU5R/pmX2jbIuxa4geT/PzSrooGI+ILt2CF63xqzH76BMvEw5/CzYIzr11LRnQbNrEdYeg0a01vwJhpIpRYLqQ2lnoBc4lPZui9LaWrfti5XhYsaqBTPFBgsn3iinKnnExuHUbO8Mdefj7jc/U/pHNu1CUkEynLGCOPJpwhgfJANaWbI42VWShaSNbqinELCSVZ0sOOcw14DmS7ZDLQbXGLrJWn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_110306_502090_E1A26B52 
X-CRM114-Status: UNSURE (   7.72  )
X-CRM114-Notice: Please train this message.
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

On Tue, 31 Mar 2026 18:57:13 +0100
Catalin Marinas <catalin.marinas@arm.com> wrote:

> I assume the ring buffer here is cacheable memory, otherwise we'd also
> need a dmb(osh) as in arch_wb_cache_pmem(). If that's correct:

Yes, it's cacheable (I couldn't imagine the performance overhead if it
wasn't! ;-)

> 
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>

Thanks!

-- Steve

