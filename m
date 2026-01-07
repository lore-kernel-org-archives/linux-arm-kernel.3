Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81058CFD658
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 16:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rLNmlAAGr7TuPBBTeFNGFzl2DnbKRD5hQNYyEJ23Rlk=; b=pGKv1Gqwf31g4vZzlZAqOSj6MA
	yxeecHWLnYc3RDb5nsOgmWXQSWA9ZGb9tw2rukUPenn8XdaNqIJ+F00aipI9miqHP9QLStuz/EjGk
	QeWCe8vQLdzCScmhxN4PxxdsxxGHdqr171unhxlYggvQ1VkPYw0otgJaKDdzqw53wwtpepq9/r/EA
	3mbM7uWiTIWGZwp7LE7r5HfhEpN+hGSUxOjwheNO2wOPrkh5+5IvNF195pf35lA8b6YCgEJMD3Vdp
	RdT72I4uEiMRgwrU9Shhov0pCZmBKIsmLeduGxfq4pvX+d0jE5wCwD/45UlmKJOnYro1qFLmgExIi
	H7u7joPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdW4i-0000000FENv-0tX4;
	Wed, 07 Jan 2026 16:07:58 +0000
Received: from smtprelay0017.hostedemail.com ([216.40.44.17] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdW4f-0000000FENZ-45Zl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 16:07:55 +0000
Received: from omf06.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id DB827160420;
	Wed,  7 Jan 2026 16:07:50 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf06.hostedemail.com (Postfix) with ESMTPA id 301EF2000E;
	Wed,  7 Jan 2026 16:07:48 +0000 (UTC)
Date: Wed, 7 Jan 2026 11:08:14 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Will Deacon <will@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Mahe Tardy <mahe.tardy@gmail.com>, Peter Zijlstra <peterz@infradead.org>,
 bpf@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org, Yonghong Song
 <yhs@fb.com>, Song Liu <songliubraving@fb.com>, Andrii Nakryiko
 <andrii@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH bpf-next 1/2] arm64/ftrace,bpf: Fix partial regs after
 bpf_prog_run
Message-ID: <20260107110814.1dfc9ec0@gandalf.local.home>
In-Reply-To: <aV5qpZwxgVRu2Q8w@willie-the-truck>
References: <20260107093256.54616-1-jolsa@kernel.org>
	<aV5qpZwxgVRu2Q8w@willie-the-truck>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: qy4j19qy53bj957cygb9gkss444jbwzi
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 301EF2000E
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19Psz/3Po3Wu+zE9EFiNolFBPIekU7NMl0=
X-HE-Tag: 1767802068-600516
X-HE-Meta: U2FsdGVkX19MpXNmjRTzf5eqNvutq13fH6LNi6K+gfHE6MtwcqV9v17WFTdDoZ8hnovtbZRxIDPYuPGSnvVQCPErohKxIFTHtJ3uDJi0CJvWrwxOSPNMwdbhjophPBLCXWhG8yHdzUuQ6JTsnRw2906L0DpujHMONSJT/3aVtTdaEybCmKF1nYcXDFg6NwiuJoCoPl+iio7bxppqMkJx2nyNMjvkNM2F5DGs1OoayfjqZtxfFwAIADNBVxZv81v1kVsEIr92L9frvqK9SgbPTxiFrrSFhOXnUVht2QY/GD9Sh0hUXlym1QLlWvB0Jke+Gl3j9N4ImY5uAJYWmYknfOXC8irHT0XR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_080754_093411_C5749A7E 
X-CRM114-Status: GOOD (  13.57  )
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

On Wed, 7 Jan 2026 14:16:05 +0000
Will Deacon <will@kernel.org> wrote:

> I still don't understand why we need anything new in the arch code for this.
> 
> We've selected HAVE_ARCH_FTRACE_REGS and we implement
> ftrace_regs_set_instruction_pointer() and ftrace_regs_set_return_value()
> so the core code already has everything it needs to make this work
> without additional arch support.

I believe the issue is that the BPF code takes a pt_regs and does the
update directly with that, and not the ftrace_regs.

I'm guessing this is due to BPF programs modifying the pt_regs directly,
and BPF programs do not yet understand ftrace_regs?

Because arm64 requires making a copy of pt_regs as the ftrace_regs has a
different layout, and the ftrace_regs is what does the changes, if the
pt_regs passed to the BPF program modifies the values it needs a way to
propagate that back to the ftrace_regs.

-- Steve

