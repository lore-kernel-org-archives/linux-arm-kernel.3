Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F19EC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 14:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JrxgxvaTgZcOQfUDO1CErW1VsWXC6yeMcmgw+etiHNw=; b=NNn2o8qU2JADSdmC9jVsVgH4YA
	Rgpi8u42wSAAhYsjhmXfPWNJZeMvRuRGn+QZUxgoeegaqdZh9V7txR4Xj9ORPth+hh3ITNbcfsFrm
	32vAzpKgJTnnQxAMf3s+iHMz5hreNsX5IDHvq73/VWv+n53pmVo4DqQoGNjaeEHBYzqlBzvS/rXEm
	JNF3whWcx/O9YoUP+YKvBNReTe8Iw6lgeLRsCPNOUKiw6AesVs2deyb6jnflJdjsP+GzW8UmiE9lR
	bXQUy/2+jO5Lixs2s0GaIamATaYIY0aFLfnJGUf08HG0fd6uhVKW6q340URF6MjJQVtmOGOGvoqPB
	QJv9jZew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh7WL-00000001hZj-1BhJ;
	Wed, 30 Jul 2025 14:11:05 +0000
Received: from smtprelay0012.hostedemail.com ([216.40.44.12] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh7IG-00000001fQ6-3cLe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 13:56:34 +0000
Received: from omf01.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id 5A0C41DA394;
	Wed, 30 Jul 2025 13:56:29 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf01.hostedemail.com (Postfix) with ESMTPA id B003A6000C;
	Wed, 30 Jul 2025 13:56:25 +0000 (UTC)
Date: Wed, 30 Jul 2025 09:56:41 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Jiri Olsa <olsajiri@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Steven Rostedt
 <rostedt@kernel.org>, Florent Revest <revest@google.com>,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Menglong Dong
 <menglong8.dong@gmail.com>, Naveen N Rao <naveen@kernel.org>, Michael
 Ellerman <mpe@ellerman.id.au>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Andy Chiu <andybnac@gmail.com>, Alexandre Ghiti
 <alexghiti@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [RFC 00/10] ftrace,bpf: Use single direct ops for bpf
 trampolines
Message-ID: <20250730095641.660800b1@gandalf.local.home>
In-Reply-To: <aIn_12KHz7ikF2t1@krava>
References: <20250729102813.1531457-1-jolsa@kernel.org>
	<aIkLlB7Z7V--BeGi@J2N7QTR9R3.cambridge.arm.com>
	<aIn_12KHz7ikF2t1@krava>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: B003A6000C
X-Stat-Signature: 7a4jg1qcadtiqm5ucfmr9eog7prsws1c
X-Rspamd-Server: rspamout02
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+GT+298XNw3sUtH/KUCJiMoJtrK0AAras=
X-HE-Tag: 1753883785-400689
X-HE-Meta: U2FsdGVkX18Y/wSr2PULlU+lJxRhXXAG/s/Ujl4zZXjBJpuMO1KJcwBl6CXFVM4KjGtjbyoRKGWOanlXAYGH35krn+qg641/t3dLIKJfubRLoHassBCAHH6NHSYjV/xU5DlgyPLzrruf7cTfAVQU9yhZdLOm/GBzFYd+mN3oTIa+0e7LTcEeMguNJfkLqAD2pGsjrgYJ3s851UwStnvdSsq4aYxwsejKlXtgRJJeRLAs7eeWOr/Tg2BKayY4NyeqP1CBq5OgEApEpQE0HhY/LrzaUzbgxIIpBzuhqDSUWNpJUT/neq02SIPkdVnRkvuWsVLeU+OMwlHlphB1TE8cvDSNbsG80ko4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_065632_960832_6F785F93 
X-CRM114-Status: GOOD (  27.43  )
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

On Wed, 30 Jul 2025 13:19:51 +0200
Jiri Olsa <olsajiri@gmail.com> wrote:

> so it's all work on PoC stage, the idea is to be able to attach many
> (like 20,30,40k) functions to their trampolines quickly, which at the
> moment is slow because all the involved interfaces work with just single
> function/tracempoline relation

Sounds like you are reinventing the ftrace mechanism itself. Which I warned
against when I first introduced direct trampolines, which were purposely
designed to do a few functions, not thousands. But, oh well.


> Steven, please correct me if/when I'm wrong ;-)
> 
> IIUC in x86_64, IF there's just single ftrace_ops defined for the function,
> it will bypass ftrace trampoline and call directly the direct trampoline
> for the function, like:
> 
>    <foo>:
>      call direct_trampoline
>      ...

Yes.

And it will also do the same for normal ftrace functions. If you have:

struct ftrace_ops {
	.func = myfunc;
};

It will create a trampoline that has:

      <tramp>
	...
	call myfunc
	...
	ret

On x86, I believe the ftrace_ops for myfunc is added to the trampoline,
where as in arm, it's part of the function header. To modify it, it
requires converting to the list operation (which ignores the ops
parameter), then the ops at the function gets changed before it goes to the
new function.

And if it is the only ops attached to a function foo, the function foo
would have:

      <foo>
	call tramp
	...

But what's nice about this is that if you have 12 different ftrace_ops that
each attach to a 1000 different functions, but no two ftrace_ops attach to
the same function, they all do the above. No hash needed!

> 
> IF there are other ftrace_ops 'users' on the same function, we execute
> each of them like:
> 
>   <foo>:
>     call ftrace_trampoline
>       call ftrace_ops_1->func
>       call ftrace_ops_2->func
>       ...
> 
> with our direct ftrace_ops->func currently using ftrace_ops->direct_call
> to return direct trampoline for the function:
> 
> 	-static void call_direct_funcs(unsigned long ip, unsigned long pip,
> 	-                             struct ftrace_ops *ops, struct ftrace_regs *fregs)
> 	-{
> 	-       unsigned long addr = READ_ONCE(ops->direct_call);
> 	-
> 	-       if (!addr)
> 	-               return;
> 	-
> 	-       arch_ftrace_set_direct_caller(fregs, addr);
> 	-}
> 
> in the new changes it will do hash lookup (based on ip) for the direct
> trampoline we want to execute:
> 
> 	+static void call_direct_funcs_hash(unsigned long ip, unsigned long pip,
> 	+                                  struct ftrace_ops *ops, struct ftrace_regs *fregs)
> 	+{
> 	+       unsigned long addr;
> 	+
> 	+       addr = ftrace_find_rec_direct(ip);
> 	+       if (!addr)
> 	+               return;
> 	+
> 	+       arch_ftrace_set_direct_caller(fregs, addr);
> 	+}

I think the above will work.

> 
> still this is the slow path for the case where multiple ftrace_ops objects use
> same function.. for the fast path we have the direct attachment as described above
> 
> sorry I probably forgot/missed discussion on this, but doing the fast path like in
> x86_64 is not an option in arm, right?

That's a question for Mark, right?

-- Steve

