Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF17ECDB466
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Jun 2026 09:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bDDdiLLNjwpRAIM1Pb4P4IMGb/RTUM1UfOJfvWRzG4s=; b=wrCQW47PXKBPkhN7LbEwYRrKAk
	5K4mBr/zt1croEaPwZ0d2C6yiYXUcdO1H6wDlURCL4HZSv2D6LJJxd2HgFzSVq66+o/VukvXsrm/E
	/vC2PhesTfGcFy+NyjL34xUp7IiHkiQqoIHin6bM/V4cCbIsfqg8Qjas2y5IXuOY0TxiB9+bi8OrP
	hycehmyfZFjA5jlv9wjuYJcSEu0nTctL1HWP0ioL6nB64tCVZ9Q1TVYWOxxfb17S0beEGryjiNRqw
	XSlirtE8K+zEGFuWE7NYjD5KO77IUYLlyd5QqS4O5mrlmm1dq4v7iLVwzXxqbivh8KZgo/ll4o0bN
	ZlI6j5LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbEmC-00000003tR4-0gLT;
	Sun, 21 Jun 2026 09:47:40 +0000
Received: from smtprelay0016.hostedemail.com ([216.40.44.16] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbEmA-00000003tQV-081T
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Jun 2026 09:47:39 +0000
Received: from omf17.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 5F2911669C9;
	Sun, 21 Jun 2026 09:47:31 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf17.hostedemail.com (Postfix) with ESMTPA id 423E619;
	Sun, 21 Jun 2026 09:47:24 +0000 (UTC)
Date: Sun, 21 Jun 2026 05:47:21 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, John Ogness <john.ogness@linutronix.de>, Thomas
 Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Julia
 Lawall <julia.lawall@inria.fr>, Yury Norov <yury.norov@gmail.com>,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-rdma@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-nfs@vger.kernel.org, kvm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/2] tracing: Add CONFIG_TRACE_PRINTK_DEBUGGING to clean
 up kernel.h
Message-ID: <20260621054721.7cde38f0@fedora>
In-Reply-To: <20260621093811.168514984@kernel.org>
References: <20260621093430.264983361@kernel.org>
	<20260621093811.168514984@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 423E619
X-Stat-Signature: fmj3ggtdgzonpf7zkcaz1xu59knp7xib
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/c1xrYJCl0ydW3HbIGCPludPRhKvEu6LQ=
X-HE-Tag: 1782035244-818315
X-HE-Meta: U2FsdGVkX18+OnZrvpIyWt/RWyUKQSX5PXFpTHJVo4PwVmZ7eZdT47ziWR0MyYlIDY1fqyBrJQ7Sk8k5g0+2jmXTLK3lUwRTI0f5QPWBoSBJkbuT1sPD257mlKV1a7d0s3ZNeXJGyaSPBFFVvXt1+Qf+cUBFPUoqGZ0yMtfaXjw3YaFrUe3XLns/TKPMVLkkLwAcJDTciB1Xe3NH/20RSxO90n0HLC/gAJL0U4ehyKGkMZazF4mztUQ3rNuBe2ykFgmEtFv/v9YSeGsstUMosrvQssX7vVaGO3wWKdHlxvzC3LFqWs5SWRpkx5HfojuQQ6b/YNA/zDIqUKZELcAtaTTF9olXpSEl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_024738_131107_F708FEFE 
X-CRM114-Status: GOOD (  15.18  )
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

On Sun, 21 Jun 2026 05:34:32 -0400
Steven Rostedt <rostedt@kernel.org> wrote:

> Instead of having trace_printk.h included in kernel.h, create a config
> TRACE_PRINTK_DEBUGGING that when set will update the CFLAGS in the
> Makefile to allow developers to add trace_printk() without the need to add
> the include for it. Having it included in the Makefile keeps it from being
> in the dependency chain and it will not waste extra CPU cycles for those
> building the kernel without using trace_printk.

Bah, I only tested with the config option enabled, and missed some
dependencies with it disabled.

For instance, rcu.h also uses ftrace_dump() so that too needs to go
into kernel.h. I also need to add a few more includes to trace_printk.h.

OK, I need to run this through all my tests to find where else I missed
adding the includes. But the idea should hopefully satisfy everyone.

-- Steve

