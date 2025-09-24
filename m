Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 996FACAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 09:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Z3VD7JEyZMS7kabeqfWJTH+pvCeYnjJNIx+hZEDTjQ=; b=Duv7sN2vlsIBNKtNjR+rWXDqXZ
	bs1lvqrJGFH/1xAntLwF1r/Mxb/dKT+WqlvvvrnHl4rS5Vh4gSFHTSNCOyMTKwK/Xfb2/xgGZ1fmo
	UtM+s4YtdC+6js4TCxY7exBBcvwZu5lgSSLjCvT+kym+f0IWKDkzOYZwW3AFQ9V74pZ7sulHavSrE
	HfDYi0IcOPZxgDD1UCAyXNHz0JoJiAG7VvepH+oHxkRpmLjijYH7//35HA69jwpl+zdtm61dqGTRZ
	Vj8CpFMxiIZ6HkKdddOuDWUV2QXnBGDCDQkVUkyakkGaK2xCCAN5dN4rrIqxnJfEgCWCi0C6Gx40J
	LLI3YZZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1LQJ-0000000FyqN-14zX;
	Wed, 24 Sep 2025 09:04:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1LQH-0000000FypH-1VnD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 09:04:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DDC944076E;
	Wed, 24 Sep 2025 09:04:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4455DC4CEE7;
	Wed, 24 Sep 2025 09:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758704664;
	bh=CUTT6hFM029zyjt/sjCwVOO+wqY+uTvnvdQD3tLQyrs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LMp6MazkSQJXJ8I6WoKZonLwloDu1TlRBsxn2SISgTWfgor5fTzZqreXC0A178NQv
	 2W6inYqft3xuBI0fLzDACrLF0fA5HUirKLtYR/YbdgEEdPbYovcu8ljb3gjmm7MvUc
	 Pkx/GJiZlmjfpkc+GcC/JrybxeQOK6lzyVtz7HsZ4vYUz/+/c7dXvrAooWuHtT74hO
	 RHdNe2/43+2iTmACINI9Hs/i9uAW84nINWExoheXn1JW0NI5fbytRm04rGjd4Oy+4w
	 nE++ov9O8vM6lxDSWK84tD9mqNrp046b190IeOIeMceYsctEnE2mggUSfOzjAUCI44
	 dQKIauozEc5Lg==
Date: Wed, 24 Sep 2025 05:04:15 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: Jiri Olsa <jolsa@kernel.org>
Cc: Florent Revest <revest@google.com>, Mark Rutland <mark.rutland@arm.com>,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Menglong Dong
 <menglong8.dong@gmail.com>
Subject: Re: [PATCH 2/9] ftrace: Add register_ftrace_direct_hash function
Message-ID: <20250924050415.4aefcb91@batman.local.home>
In-Reply-To: <20250923215147.1571952-3-jolsa@kernel.org>
References: <20250923215147.1571952-1-jolsa@kernel.org>
	<20250923215147.1571952-3-jolsa@kernel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_020425_442294_C2140B99 
X-CRM114-Status: GOOD (  17.28  )
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

On Tue, 23 Sep 2025 23:51:40 +0200
Jiri Olsa <jolsa@kernel.org> wrote:

> Adding register_ftrace_direct_hash function that registers
> all entries (ip -> direct) provided in hash argument.
> 
> The difference to current register_ftrace_direct is
>  - hash argument that allows to register multiple ip -> direct
>    entries at once

I'm a bit confused. How is this different? Doesn't
register_ftrace_direct() register multiple ip -> direct entries at once
too? But instead of using a passed in hash, it uses the hash from
within the ftrace_ops.

>  - we can call register_ftrace_direct_hash multiple times on the
>    same ftrace_ops object, becase after first registration with
>    register_ftrace_function_nolock, it uses ftrace_update_ops to
>    update the ftrace_ops object

OK, I don't like the name "register" here. "register" should be for the
first instance and then it is registered. If you call it multiple times
on the same ops without "unregister" it should give an error.

Perhaps call this "update_ftrace_direct()" where it can update a direct
ftrace_ops from?

> 
> This change will allow us to have simple ftrace_ops for all bpf
> direct interface users in following changes.

After applying all the patches, I have this:

$ git grep register_ftrace_direct_hash
include/linux/ftrace.h:int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash);
include/linux/ftrace.h:int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash);
include/linux/ftrace.h:int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
include/linux/ftrace.h:int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
kernel/trace/ftrace.c:  err = register_ftrace_direct_hash(ops, hash);
kernel/trace/ftrace.c:  err = unregister_ftrace_direct_hash(ops, hash);
kernel/trace/ftrace.c:int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
kernel/trace/ftrace.c:EXPORT_SYMBOL_GPL(register_ftrace_direct_hash);
kernel/trace/ftrace.c:int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
kernel/trace/ftrace.c:EXPORT_SYMBOL_GPL(unregister_ftrace_direct_hash);

Where I do not see it is used outside of ftrace.c. Why is it exported?

-- Steve

