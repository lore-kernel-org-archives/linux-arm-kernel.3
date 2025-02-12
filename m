Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC05C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 00:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Ba53R3H3WDAF7MlUncdYdrTqagtlieEXBUgKa6/Q38=; b=ANpo2g69cCwNOPU7FN1e3EynuE
	jQtcRJq/MzKAGFyackBkBVV0P4Ow8jYsRqiQZB0KWUMdKMolgGlbJAHwuZzaQAA1mEC4I7cLLGaSe
	5JYcZmGtJsVZ9q2JWT+lTyRIL2XZ8pxuluFg8WGo0HVu7QMkGL7nkeQ/ka1dTyCv61UJHZSjhzAKV
	CghNJBFnyaibIRuGu1JAJbKaEnsyYW5BFJdwJcc6z1U5xT5dj2s0MMXOchiMIXejCPo1Q0qV/zT30
	tC4eBRYUEpygnTmvMZGLpBX0e9KsK9X2yNVmHh3gF43xf9smV8u+GCPHDOL8BJ4FYrk00fCAD+2Xj
	rYmNlwcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti0ms-00000005jBX-47dJ;
	Wed, 12 Feb 2025 00:39:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti0jM-00000005iQ1-3AeF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 00:35:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739320555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0Ba53R3H3WDAF7MlUncdYdrTqagtlieEXBUgKa6/Q38=;
	b=hJR8KUglGT+DF2rHa69i7YpgF6cw1PIyyZa8mtj8Ufg1TQDkutkVhhr7+wjbJllGbzgbCX
	Nni1t14qPw73U0dWIBMJ6KAcGbhB+xZzwDtVYcNtkkDPbaBzW6Lc2Rm0omHF3bTkKjM+I+
	vskzf9HK9TQv1HCxLcXfotx9Z99hSX0=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-596-3xrX5GqPMOq7aTI1VFcphA-1; Tue,
 11 Feb 2025 19:35:50 -0500
X-MC-Unique: 3xrX5GqPMOq7aTI1VFcphA-1
X-Mimecast-MFC-AGG-ID: 3xrX5GqPMOq7aTI1VFcphA
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0DD9A1954B1B;
	Wed, 12 Feb 2025 00:35:43 +0000 (UTC)
Received: from localhost (unknown [10.22.89.254])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CBB1C3001D10;
	Wed, 12 Feb 2025 00:35:41 +0000 (UTC)
Date: Tue, 11 Feb 2025 21:35:40 -0300
From: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Brown <broonie@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>, linux-kernel@vger.kernel.org
Subject: Re: BUG: debug_exception_enter() disables preemption and may call
 sleeping functions on aarch64 with RT
Message-ID: <Z6vs3IWxUxhIDBBO@uudg.org>
References: <Z6YW_Kx4S2tmj2BP@uudg.org>
 <Z6n16cK85JMyowDq@J2N7QTR9R3>
 <Z6tf8iDhNriSGjeC@uudg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6tf8iDhNriSGjeC@uudg.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_163556_866718_3D99991E 
X-CRM114-Status: GOOD (  22.16  )
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

On Tue, Feb 11, 2025 at 11:34:26AM -0300, Luis Claudio R. Goncalves wrote:
> On Mon, Feb 10, 2025 at 12:49:45PM +0000, Mark Rutland wrote:
> > On Fri, Feb 07, 2025 at 11:22:57AM -0300, Luis Claudio R. Goncalves wrote:
...
> > I don't have an immediate suggestion; I'll need to go think about this
> > for a bit. Unfortunatealy, there are several nested cans of worms here.
> > :/
> > 
> > In theory, we can go split out the EL0 "debug exceptions" into separate
> > handlers, and wouldn't generally need to disable preemption for things
> > like BRK or single-step.
> 
> If this is an acceptable workaround, until we have the real solution,
> I can work on that :)
> 
> Luis

I tested the prototype below and it survived 6h of ssdd and the ptrace LTP
tests running simultaneously, in a tight loop. Would something along these
lines be an acceptable workaround?


diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 8b281cf308b30..eb3b54710024f 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -933,18 +933,20 @@ void __init hook_debug_fault_code(int nr,
  * accidentally schedule in exception context and it will force a warning
  * if we somehow manage to schedule by accident.
  */
-static void debug_exception_enter(struct pt_regs *regs)
+static void debug_exception_enter(struct pt_regs *regs, int touch_preemption)
 {
-	preempt_disable();
+	if (touch_preemption)
+		preempt_disable();
 
 	/* This code is a bit fragile.  Test it. */
 	RCU_LOCKDEP_WARN(!rcu_is_watching(), "exception_enter didn't work");
 }
 NOKPROBE_SYMBOL(debug_exception_enter);
 
-static void debug_exception_exit(struct pt_regs *regs)
+static void debug_exception_exit(struct pt_regs *regs, int touch_preemption)
 {
-	preempt_enable_no_resched();
+	if (touch_preemption)
+		preempt_enable_no_resched();
 }
 NOKPROBE_SYMBOL(debug_exception_exit);
 
@@ -953,8 +955,14 @@ void do_debug_exception(unsigned long addr_if_watchpoint, unsigned long esr,
 {
 	const struct fault_info *inf = esr_to_debug_fault_info(esr);
 	unsigned long pc = instruction_pointer(regs);
+	unsigned long req = ESR_ELx_EC(esr);
+	int touch_preemption;
 
-	debug_exception_enter(regs);
+	touch_preemption = !(IS_ENABLED(CONFIG_PREEMPT_RT) &&
+		(req == ESR_ELx_EC_SOFTSTP_LOW || req == ESR_ELx_EC_BRK64
+		 || req == ESR_ELx_EC_BKPT32 || req == ESR_ELx_EC_SOFTSTP_CUR));
+
+	debug_exception_enter(regs, touch_preemption);
 
 	if (user_mode(regs) && !is_ttbr0_addr(pc))
 		arm64_apply_bp_hardening();
@@ -963,7 +971,7 @@ void do_debug_exception(unsigned long addr_if_watchpoint, unsigned long esr,
 		arm64_notify_die(inf->name, regs, inf->sig, inf->code, pc, esr);
 	}
 
-	debug_exception_exit(regs);
+	debug_exception_exit(regs, touch_preemption);
 }
 NOKPROBE_SYMBOL(do_debug_exception);
 


