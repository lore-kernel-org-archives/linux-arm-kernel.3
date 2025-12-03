Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F92D12D57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 12:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XLsoqwdEviZsSAhPhXvYsITNQwIlBAfFrwBEQrfP0F8=; b=cxWbx1OL8wqvp2qvA5M2JNFC0Q
	uWTYkHbYTqj4utlQuRtMFjEKzRrYOr0OXGMNxNtJEqUGSI7lXmBgKHY/1nhNFutDSo4IoAH7ybmcu
	+s5quJOK6mf+/74mdmFsZ89IlWnRT0kmCCR804ZDvHmT2IsLf/kq0RzgsrCqfzhu/Ue73P36a2qjj
	GFIXDHaDxQHtCzQbud6PUP0J/DyCbSSfvtQ1IMBKzY5PIycRONGHW5YXjyiGKBsdYHDvZ3hDIMgBi
	R6c5Z8b2JukYXs9OJ8ZXKrGFCAK8SVy2fj/ds/NtGWXt2kE8v8+a5aMhYHT8IZNatAEgEdrxGMy2K
	I/EMC/bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQlxR-00000006YpW-42ZO;
	Wed, 03 Dec 2025 12:27:45 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQlxP-00000006Yp5-0y7w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 12:27:44 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1764764859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XLsoqwdEviZsSAhPhXvYsITNQwIlBAfFrwBEQrfP0F8=;
	b=s5XnOUxvBKImp785ZeZn8F4vU9FWeqNhti0naCZYeMKenfYV5HpDUBafe65SY1ng132nuN
	GSyrmVcUQw85nWtsmw/IWst7jwY9eIRo7n0WxPcF/EqUB1HKkZqrRKIPXaYLNPHQ07eGdL
	K1Jix/ke6/4Jlbshgib90I8ZpmNvo582/0J7pONaAl+V8/g8jmQfuNyph8vjYGLqs4xfBu
	3EtRKfctow0G7bJFlywc0M9z8PLG5++zwrb9CZQ/wfEmdwwwLaaNDvELS3D43mxmBEF7sx
	C0tUGvhPxFRCeJkXSVc0U+kXyBp6YNR+7aRRk78SeLBRGoUCW1ZquXLO7K6BKQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1764764859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XLsoqwdEviZsSAhPhXvYsITNQwIlBAfFrwBEQrfP0F8=;
	b=krdpQ07T87hXQTR7t8oaZmz8ipj7q2Q16g70ZUJrkGA+qn/FlRdtLwc26n9ONyMNoHH1vb
	rM5qIegXjZDiZlCg==
To: Leo Yan <leo.yan@arm.com>
Cc: Petr Mladek <pmladek@suse.com>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, Breno
 Leitao <leitao@debian.org>, linux@armlinux.org.uk, paulmck@kernel.org,
 usamaarif642@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com, rmikey@meta.com
Subject: Re: [PATCH] printk/nbcon: Restore IRQ in atomic flush after each
 emitted record
In-Reply-To: <20251202162639.GD724103@e132581.arm.com>
References: <20251202135832.156559-1-pmladek@suse.com>
 <87o6oheywd.fsf@jogness.linutronix.de>
 <20251202162639.GD724103@e132581.arm.com>
Date: Wed, 03 Dec 2025 13:33:38 +0106
Message-ID: <87ikenyclh.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_042743_431222_B77D2630 
X-CRM114-Status: GOOD (  10.79  )
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

On 2025-12-02, Leo Yan <leo.yan@arm.com> wrote:
>> I am not really happy about all the local_irq_restore() usage. Using
>> guard syntax would be nice here, but AFAICT there is no guard for
>> local_irq_save()/_restore().
>
> Sorry for suddenly jumping in.  Wouldn't guard(irqsave)() be helpful
> here?

Thanks, I was not aware of the irqsave variant. We would want the scoped
version. So something like this?

$ git diff -w
diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index 3fa403f9831f..55beb64c4f4a 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -1557,6 +1557,14 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
 	ctxt->allow_unsafe_takeover	= nbcon_allow_unsafe_takeover();
 
 	while (nbcon_seq_read(con) < stop_seq) {
+		/*
+		 * Atomic flushing does not use console driver synchronization
+		 * (i.e. it does not hold the port lock for uart consoles).
+		 * Therefore IRQs must be disabled to avoid being interrupted
+		 * and then calling into a driver that will deadlock trying
+		 * to acquire console ownership.
+		 */
+		scoped_guard(irqsave) {
 			if (!nbcon_context_try_acquire(ctxt, false))
 				return -EPERM;
 
@@ -1569,6 +1577,7 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
 				return -EAGAIN;
 
 			nbcon_context_release(ctxt);
+		}
 
 		if (!ctxt->backlog) {
 			/* Are there reserved but not yet finalized records? */

John

