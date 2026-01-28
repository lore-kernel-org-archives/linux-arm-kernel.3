Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABE7D3F069
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 14:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e2hbglJ3NqkeqxI2aUImPal9i+6TUbFt0M/9KmEyxYU=; b=3VVunFjAsVpru3x2bGWZMIdOQv
	uggg3hAoc5UQXpdodUfT4ittu0LVlseYUlvVzmGKg6aCiwy/gclRUzeyP4vXEIM443608uPAjS6Ea
	foGeKXL20/yMzkhOh0xfr2ViPy/71CX7xAMKfr0JBhpCZ4xDKkfSwqiXztqfnzD9i3DFP+I6drVUj
	lKxSqQwMW3/X+kLU0fleumNtIOWgYIuvXL9M8PtBfE5pMOsjr6DdpRIBIeKFku7FXje6gKeQGT2be
	GFqnr1kIQUhE+Ht0+myeZqyJg5BFXHafj8xv4tqy93TJ3TpDYDDsCcywHveZ0xN2bDYntn1OUV/1I
	+qC1EQIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6q8-0000000GCuN-1wbF;
	Wed, 28 Jan 2026 14:48:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6q6-0000000GCti-2wOs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 14:48:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 284CC60007;
	Wed, 28 Jan 2026 14:48:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7825DC4CEF1;
	Wed, 28 Jan 2026 14:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769611693;
	bh=m2NFIt+B2FSUkKuThAjS+VA07lWrNORrRSvzgZb2hA4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VbNKi0oaGSSePL5TN6ePUN/kffAfuRRguuyN+pbWGQtCtjAzyeLM6rscyDA7d/vZO
	 giZnyq5mTVpKBQBXA2VfOZXlpbj2NL3aYhPeBP9rnPYlg1zarjIa2RC4pC6+cnWGiu
	 EgT3OqsG5qnPpsFih+kXjdvFxYxvIsDFfNciQYI22Q6HAj8r43hp5qq3aRxe4oeM2R
	 Dn5kbfgM0PDWfIQFTdL/RlmfmdJdEYsE8GJ2bbtBOfvKlRfIb7OLaJDeT1LMxsmw0H
	 akVEdFzAcOTfDMf1RjWsuDTVhP6VZFR4tnA+RSo5Vv+MUGBBR8k5mO2GtN0mGoAMmE
	 XBRPVtcy62mIw==
Date: Wed, 28 Jan 2026 09:48:20 -0500
From: Steven Rostedt <rostedt@kernel.org>
To: Jiri Olsa <jolsa@kernel.org>
Cc: Florent Revest <revest@google.com>, Mark Rutland <mark.rutland@arm.com>,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Menglong Dong
 <menglong8.dong@gmail.com>, Song Liu <song@kernel.org>
Subject: Re: [PATCHv6 bpf-next 0/9] ftrace,bpf: Use single direct ops for
 bpf trampolines
Message-ID: <20260128094820.0d32327f@gandalf.local.home>
In-Reply-To: <20251230145010.103439-1-jolsa@kernel.org>
References: <20251230145010.103439-1-jolsa@kernel.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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

On Tue, 30 Dec 2025 15:50:01 +0100
Jiri Olsa <jolsa@kernel.org> wrote:

> Jiri Olsa (9):
>       ftrace,bpf: Remove FTRACE_OPS_FL_JMP ftrace_ops flag
>       ftrace: Make alloc_and_copy_ftrace_hash direct friendly
>       ftrace: Export some of hash related functions
>       ftrace: Add update_ftrace_direct_add function
>       ftrace: Add update_ftrace_direct_del function
>       ftrace: Add update_ftrace_direct_mod function
>       bpf: Add trampoline ip hash table
>       ftrace: Factor ftrace_ops ops_func interface
>       bpf,x86: Use single ftrace_ops for direct calls

I reviewed all the above patches with the exception of patch 7 (which was
BPF only). I even ran the entire set through my internal tests and they
passed.

I don't have anything for this merge window that will conflict with this
series, so if you want to push it through the BPF tree, feel free to do so.

For patches 1-6,8,9:

  Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve

