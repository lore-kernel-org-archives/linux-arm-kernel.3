Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE0DCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 04:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W0DHod1QupYhQTZujfaV/Hb38/e/CA0nUqmq7QjctZ0=; b=MULiBcygjPwosDTjKoGDp2FKSb
	dfO1MyEi3Ke0+mAK7+l+bVohS2XWMQYCjknAg5+6ryR+DahmGNR2RmydOMGnDpKDycUPEMBbCAsmi
	2QXweF7oLSqiOECDihMdgmMNMC4Mj0gF1d18d3yXcxg+IDNbeeHS7DVzHIRxHbfFIgvvXbjl7N/MD
	T7bdOlg3RA/0m7VTRPGzyDOZRRDw2err1X1EUtFeob0S394L0aJdaw69nyWt6SRRkbZxpwV49d0kE
	fgIPoGm/anJ5FVhLHtT940TVY1OBl667WYLl/FOn4ZTv17MkQJlqx3i6xrfod1pUx5B866HOIGYsI
	m5TwEjIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKq7y-00000002hkX-1K9U;
	Thu, 07 May 2026 04:14:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKq7w-00000002hin-1gfE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 04:14:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 843EF43DAB;
	Thu,  7 May 2026 04:14:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38117C2BCC7;
	Thu,  7 May 2026 04:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778127259;
	bh=N3+MD8teZfj8M3IcjL1QaKuP26duMfx7mziauhL1yWI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TuqHI9rN2EF7G8y22fyB9UEo+J25HaaUc2pLAajvvEAjm3dFFh4dUCwe89ep65fBx
	 oziDSaCE9M1Bd3ZHNq3BxpKaxrUfQO14SHdIyjXLiuhxGjef4hEGfTL//Seskza7FZ
	 cndJAtzIEkufVu6e34ZO+kLK0DuXofGzjWCJo9qDnTOv2xd36pUJsOCRE8B6kkVm8v
	 ieHqYH8O/E3LvzFdOqs2zVF+E1tuTkiPPignNVHIojWniQdz/QGo63ohu5OGu5kMJ+
	 lSe+/0MbggHpHh4G5ag6swRgs5nEtaeRcdlEcTlqEw6cZcnevUkRabUHEbx3V7Q1YL
	 wAUeKFHVl7QHA==
Date: Thu, 7 May 2026 13:14:16 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Steven Rostedt <rostedt@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Ian
 Rogers <irogers@google.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v19 0/7] ring-buffer: Making persistent ring buffers
 robust
Message-Id: <20260507131416.35bc304d89f974ae3b33d20b@kernel.org>
In-Reply-To: <20260502181619.7f5003dc@robin>
References: <177751968499.2136606.17388366710182662849.stgit@mhiramat.tok.corp.google.com>
	<20260502152304.560a5954@robin>
	<20260502181619.7f5003dc@robin>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_211420_493642_D714F5B6 
X-CRM114-Status: GOOD (  22.72  )
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

On Sat, 2 May 2026 18:17:06 -0400
Steven Rostedt <rostedt@kernel.org> wrote:

> On Sat, 2 May 2026 15:23:04 -0400
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
> > Hi Masami,
> > 
> > I applied your patches and enabled your ptracingtest code. I noticed
> > that when there's dropped pages, the trace output is not in order:
> > 
> >  # trace-cmd start -B ptracingtest -e all -v -e '*lock*'
> >  # taskset -c 5 echo c > /proc/sysrq-trigger
> > 
> > On reboot, I ran:
> > 
> >  # trace-cmd show -B ptracingtest > /tmp/trace.out
> > 
> > Then executed the attached perl program:
> > 
> >   # ./read-ts.pl < /tmp/trace.out
> > 
> > And it errors our:
> > 
> >  30.212495 < 30.213534
> >            <...>-1048    [005] d....    30.212495: irq_enable: caller=irqentry_exit+0xf5/0x710 parent=0x0
> > 
> > That is, I think the zero timestamps may be messing with the order.
> > 
> 
> Ah, I think I found the problem. The iterator needs the same logic you
> added for the consuming read:
> 
> diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> index 7bfbed0ac90c..90a7fa772fe3 100644
> --- a/kernel/trace/ring_buffer.c
> +++ b/kernel/trace/ring_buffer.c
> @@ -6105,12 +6105,14 @@ rb_iter_peek(struct ring_buffer_iter *iter, u64 *ts)
>  	struct ring_buffer_per_cpu *cpu_buffer;
>  	struct ring_buffer_event *event;
>  	int nr_loops = 0;
> +	int max_loops;
>  
>  	if (ts)
>  		*ts = 0;
>  
>  	cpu_buffer = iter->cpu_buffer;
>  	buffer = cpu_buffer->buffer;
> +	max_loops = cpu_buffer->ring_meta ? cpu_buffer->nr_pages : 3;
>  
>  	/*
>  	 * Check if someone performed a consuming read to the buffer
> @@ -6133,7 +6135,7 @@ rb_iter_peek(struct ring_buffer_iter *iter, u64 *ts)
>  	 * the ring buffer with an active write as the consumer is.
>  	 * Do not warn if the three failures is reached.
>  	 */
> -	if (++nr_loops > 3)
> +	if (++nr_loops > max_loops)
>  		return NULL;
>  
>  	if (rb_per_cpu_empty(cpu_buffer))
> 
> 
> I'll test this some more, and make a proper patch.

Ah, indeed. Thanks for fixing!

BTW, shouldn't we unify common logic of those functions?

Thank you,

> 
> -- Steve
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

