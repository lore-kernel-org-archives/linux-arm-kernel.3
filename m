Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB91FF887E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 15:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/b67xFBaZ0INFq2SZ94hG9Ope7xPlEdW6ic2LkLhtCM=; b=CX2aTVcPMQzHSm9ebZYo/si8ZD
	VzYxkURcNruQDok03eN8gxFtZOcva806DlQRdiosh5pa36/3iDl5mk4bbV2F1qku6qlpAi2Jwncop
	pdIubeHlhntWC/NtcFtqNWmzixArWfRnVNKrjQ/JoRT7GeT3shmTPXQHCMP/UcoILho1sjLKDPlnw
	pxpnjENHMpeGVCL7FuLLiAtn/qEgAexxWWsxsMydLv2j9KEhsIVELXFQ1M+CzLzt+RpBSo1dNiB/W
	tus1OcdIBdUs2g1jzwG51s0VoL0Sey5g6gesgzpzBNFdeSgHeMPrzUJigIa71Wjzz9s29mrSRtZ73
	6JxVpipg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI6dy-00000003pBi-0kvV;
	Wed, 29 Apr 2026 15:16:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI6dv-00000003pBL-1qZR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 15:16:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 659C143CAF;
	Wed, 29 Apr 2026 15:16:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18244C19425;
	Wed, 29 Apr 2026 15:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777475762;
	bh=qJfcWNJrNFk350uexydFUPT8va/SsAcPQMsRGFeJVhY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Tc5DwENPc3RtKLrf2qoMNayifVx6jMMiFhVd7RMvq0PtT1oWmw3bwTDzNtuIxn3zp
	 GEgsINNCMj3idUyhkvg/4jZqZ+H2ZWmbgYuAKs+wH9C4eQkvA3AJC3Ini4gyxOpuiB
	 OvmO3b4v/zyUKgGriSC4oW5TJ3FFZurkoPfkr5ConHi9fMXyaS/63Z9rSSxzt10HRa
	 EvGf9fMRIrmRMtLU1oKeZdlJV8IUuiQZmWur3GjOhIeAL7wxq3akA7ihMQnmIuClos
	 ydjIDKEBJecL5a98adndKQdYdYYVlTuGsCvqMFcwbH9jHpMHuPOhY6FtpfdJ5CXEQg
	 bndC8Cx3HlhdA==
Date: Thu, 30 Apr 2026 00:15:59 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Ian
 Rogers <irogers@google.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v18 3/8] ring-buffer: Skip invalid sub-buffers when
 validating persistent ring buffer
Message-Id: <20260430001559.a2d0489d956c06059e13e58d@kernel.org>
In-Reply-To: <20260428155508.4f47279e@gandalf.local.home>
References: <177701351903.2223789.17087009302463188638.stgit@mhiramat.tok.corp.google.com>
	<177701354681.2223789.14633430761021638378.stgit@mhiramat.tok.corp.google.com>
	<20260428155508.4f47279e@gandalf.local.home>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_081603_553058_F364A0FF 
X-CRM114-Status: GOOD (  23.22  )
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

On Tue, 28 Apr 2026 15:55:08 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Fri, 24 Apr 2026 15:52:27 +0900
> "Masami Hiramatsu (Google)" <mhiramat@kernel.org> wrote:
> 
> > @@ -5648,11 +5668,12 @@ __rb_get_reader_page(struct ring_buffer_per_cpu *cpu_buffer)
> >   again:
> >  	/*
> >  	 * This should normally only loop twice. But because the
> > -	 * start of the reader inserts an empty page, it causes
> > -	 * a case where we will loop three times. There should be no
> > -	 * reason to loop four times (that I know of).
> > +	 * start of the reader inserts an empty page, it causes a
> > +	 * case where we will loop three times. There should be no
> > +	 * reason to loop four times unless the ring buffer is a
> > +	 * recovered persistent ring buffer.
> 
> Can you explain more to why this is allowed for persistent ring buffer?

Ah, that was introduced in v15.

  Changes in v15:
  - Skip reader_page loop check on persistent ring buffer because
    there can be contiguous empty(invalidated) pages. 


So, finding next reader_page, we need to skip empty pages, which is normally
not contiguous. However, if we see more than 3 invalid pages on recovering
persistent ring buffer, it will be reset and become empty.


> 
> Note, I do not like any loops that can go into an infinite loop and lock up
> the machine. If something goes wrong with a persistent ring buffer, then
> this could possibly go into an infinite loop.

Yeah, so I think we should not use goto here. OK, let me update it to
an actual loop.

> 
> I want to understand why this is allowed, and possibly add a check that
> prevents this from never ending.

It should not be a never ending loop (there are other exit conditions),
but I agreed. What about limiting with nr_subbufs?

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 5326924615a4..aa89ec96e964 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -5630,7 +5630,8 @@ __rb_get_reader_page(struct ring_buffer_per_cpu *cpu_buffer)
 	 * a case where we will loop three times. There should be no
 	 * reason to loop four times (that I know of).
 	 */
-	if (RB_WARN_ON(cpu_buffer, ++nr_loops > 3)) {
+	if (RB_WARN_ON(cpu_buffer,
+		++nr_loops > (cpu_buffer->ring_meta ? cpu_buffer->nr_subbufs : 3))) {
 		reader = NULL;
 		goto out;
 	}

> 
> -- Steve
> 
> 
> >  	 */
> > -	if (RB_WARN_ON(cpu_buffer, ++nr_loops > 3)) {
> > +	if (RB_WARN_ON(cpu_buffer, ++nr_loops > 3 && !cpu_buffer->ring_meta)) {
> >  		reader = NULL;
> >  		goto out;
> >  	}
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

