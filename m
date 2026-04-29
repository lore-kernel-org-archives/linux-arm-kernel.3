Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB35ECCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 16:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aE4so6v81YSLU8NNXsnfQ6mYCueEzQLZISvyqwFwl/8=; b=RllPO5HvnL8L+tNVvwMS/Lp8t1
	cuTX0JNlJBTv8PeBXV3W52somw1ayaU8ainGvP+Y3Outa+NIrN3HnM1mVfUKfTRnJqCl5xA1GHxuH
	fMWUZHWviWsiVE/SMgfb1ojBKgbY3h3pNEML2+PTr3ZgOioT+Z23MpiMlqPAqjwL3ClDyeBT0txhF
	co78a6avk9uTy9Oz4/BQv5Dj2Ww5fKv7UjCQM8Q45RLBwATIlqPDANN9H+V8MyjZus50g5rb7WL2L
	uGaK9oIyAt0ND8LJOjLMwo1SYYVWRpkfTWoBxA9r2enEbpJKdPdCCLn5vhsTe9v140nGZmEIDPHqp
	eIMoqTSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI7qC-00000003uzY-3oUq;
	Wed, 29 Apr 2026 16:32:48 +0000
Received: from smtprelay0017.hostedemail.com ([216.40.44.17] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI7qA-00000003uyz-2uWB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 16:32:47 +0000
Received: from omf06.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 3103614034F;
	Wed, 29 Apr 2026 16:32:42 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf06.hostedemail.com (Postfix) with ESMTPA id 02EE32000E;
	Wed, 29 Apr 2026 16:32:38 +0000 (UTC)
Date: Wed, 29 Apr 2026 12:32:56 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Ian
 Rogers <irogers@google.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v18 3/8] ring-buffer: Skip invalid sub-buffers when
 validating persistent ring buffer
Message-ID: <20260429123256.5172d581@gandalf.local.home>
In-Reply-To: <20260430001559.a2d0489d956c06059e13e58d@kernel.org>
References: <177701351903.2223789.17087009302463188638.stgit@mhiramat.tok.corp.google.com>
	<177701354681.2223789.14633430761021638378.stgit@mhiramat.tok.corp.google.com>
	<20260428155508.4f47279e@gandalf.local.home>
	<20260430001559.a2d0489d956c06059e13e58d@kernel.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 02EE32000E
X-Rspamd-Server: rspamout06
X-Stat-Signature: 595h9ut9b6nuepdf88sn1susbafq418f
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+38fsHwXaVeeKb/tR0TBTEd3NZpLiw37E=
X-HE-Tag: 1777480358-669733
X-HE-Meta: U2FsdGVkX180m1p5vGF6wqvR/Xb5tM1EK6BvWIBUmlDbVxNeLWhRk0nFBuWNyo0u14cD4tmCZze/urXDylalHowEEGoHEvHGoXcWledyIo09DvsOAIpSdFWtkfptbW1+NnUljSPIdlX9ftWRxK12z2C9ALg8EHEVNVlj/wj/NcH4gupNrebgSjHWQbX/C8Rx8K4i7AUpe6plGIxXOgRE7A8fCESjJmQ2pNOKfp1RiOVwaJFwQZUGH1RNLlm5BtBp9mfyhWJPL+j9Ix3Xich7iFJDDeWu2/Hmol5N7e8j2uunAJjv9fqUXMUrJ1/PbDwgh1Q7ChqSDGf1tPar4XeglFWC2hX/3A5a
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_093246_792587_7836E3D8 
X-CRM114-Status: GOOD (  12.71  )
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

On Thu, 30 Apr 2026 00:15:59 +0900
Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:

> It should not be a never ending loop (there are other exit conditions),
> but I agreed. What about limiting with nr_subbufs?
> 
> diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> index 5326924615a4..aa89ec96e964 100644
> --- a/kernel/trace/ring_buffer.c
> +++ b/kernel/trace/ring_buffer.c
> @@ -5630,7 +5630,8 @@ __rb_get_reader_page(struct ring_buffer_per_cpu *cpu_buffer)
>  	 * a case where we will loop three times. There should be no
>  	 * reason to loop four times (that I know of).
>  	 */
> -	if (RB_WARN_ON(cpu_buffer, ++nr_loops > 3)) {
> +	if (RB_WARN_ON(cpu_buffer,
> +		++nr_loops > (cpu_buffer->ring_meta ? cpu_buffer->nr_subbufs : 3))) {
>  		reader = NULL;
>  		goto out;
>  	}

Yeah, this looks more reasonable.

Thanks,

-- Steve

