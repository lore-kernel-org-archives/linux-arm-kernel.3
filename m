Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BFF2CD13DA
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 May 2026 22:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SYX336FMlvCHwC/NU1/p8TqLNp1ffe8P2lV7TGX0BB8=; b=0UtGOVtb6QnBpDvwhWIJlNir6p
	GKQhnKGV0cCcEfREx+xBYxqB3qutQRDd/dsHfUnHR0h8F4MQUBtoZQ8n6VeYwPvN+RDDC9M4wuOXZ
	aq0g6KA2hAwWvRjkWy5aSkvgt21XOKW3sVySK1xO3T/rs9Hi66D5rQOdNnXw98RYLiTNG8Th1KMNq
	Hla4IeB4Jvlc+0fqjB570ZknDXq+zXiNXmOrQG+1yMlLB1h9eK+yQS/agUPrJfGUm3rpVmDeQKorM
	ZLMn//MVaMOGXBtEpTc412nzZH3OMDkvO+v2nMEA+AxYb4kZZbQFQIRanK/To1DT0Ba0HfQpNdnpQ
	g5VrCYvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJIeQ-00000009nPC-3KRr;
	Sat, 02 May 2026 22:17:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJIeP-00000009nOs-1HZd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 May 2026 22:17:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 90728600AE;
	Sat,  2 May 2026 22:17:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51A82C19425;
	Sat,  2 May 2026 22:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777760246;
	bh=gBJbaaIGQVQb2n21mMPbuRuHh1uzGoPVGVcGZHTYWNw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=L2ezqMHgHwDYiGZvnjG+2o4vWYqPlEF3h93FpqyD5LhXJ8hQimsoSKKFTdc7FPF5b
	 4TbLL7lYXhJfYBk9e9PBhLZXhi8A/PIsXsIE4uSPDkIC8xj/c+Wwe/hfNT27yrskgl
	 +8Hd537OGba+L2zIm5fw+WNdxGxRNRH9c5gJjcEKYBfiCs7/gYvppGt5MxcmensuH0
	 5YuH18Ni+Vsc8l4xpIWFCC76uY7qMKIVL2JKiur69KTzI/1sGbD7LaLo3Fw/Nn3lUH
	 qjMppd+n6SAtF7tPeV/cNaic7ID4SljmYLcXCWhnKu70kP/hdIzTV8yahmOoK+hQgT
	 t8z8HQ13sv3Bw==
Date: Sat, 2 May 2026 18:17:06 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Ian
 Rogers <irogers@google.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v19 0/7] ring-buffer: Making persistent ring buffers
 robust
Message-ID: <20260502181619.7f5003dc@robin>
In-Reply-To: <20260502152304.560a5954@robin>
References: <177751968499.2136606.17388366710182662849.stgit@mhiramat.tok.corp.google.com>
	<20260502152304.560a5954@robin>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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

On Sat, 2 May 2026 15:23:04 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> Hi Masami,
> 
> I applied your patches and enabled your ptracingtest code. I noticed
> that when there's dropped pages, the trace output is not in order:
> 
>  # trace-cmd start -B ptracingtest -e all -v -e '*lock*'
>  # taskset -c 5 echo c > /proc/sysrq-trigger
> 
> On reboot, I ran:
> 
>  # trace-cmd show -B ptracingtest > /tmp/trace.out
> 
> Then executed the attached perl program:
> 
>   # ./read-ts.pl < /tmp/trace.out
> 
> And it errors our:
> 
>  30.212495 < 30.213534
>            <...>-1048    [005] d....    30.212495: irq_enable: caller=irqentry_exit+0xf5/0x710 parent=0x0
> 
> That is, I think the zero timestamps may be messing with the order.
> 

Ah, I think I found the problem. The iterator needs the same logic you
added for the consuming read:

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 7bfbed0ac90c..90a7fa772fe3 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -6105,12 +6105,14 @@ rb_iter_peek(struct ring_buffer_iter *iter, u64 *ts)
 	struct ring_buffer_per_cpu *cpu_buffer;
 	struct ring_buffer_event *event;
 	int nr_loops = 0;
+	int max_loops;
 
 	if (ts)
 		*ts = 0;
 
 	cpu_buffer = iter->cpu_buffer;
 	buffer = cpu_buffer->buffer;
+	max_loops = cpu_buffer->ring_meta ? cpu_buffer->nr_pages : 3;
 
 	/*
 	 * Check if someone performed a consuming read to the buffer
@@ -6133,7 +6135,7 @@ rb_iter_peek(struct ring_buffer_iter *iter, u64 *ts)
 	 * the ring buffer with an active write as the consumer is.
 	 * Do not warn if the three failures is reached.
 	 */
-	if (++nr_loops > 3)
+	if (++nr_loops > max_loops)
 		return NULL;
 
 	if (rb_per_cpu_empty(cpu_buffer))


I'll test this some more, and make a proper patch.

-- Steve


