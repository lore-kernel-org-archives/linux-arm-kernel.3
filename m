Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 881C0D68BC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 01:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2wIXz0oWVpd3USn5ZcIbjIzZ9qnrHWtOPXTDYtXpfjk=; b=r9N7zHzv4ST0DNSL+30kgyAZ8u
	RA9J4yVY1ey0nkGqt8xARkE8WDzk4WBgQcNSByZ4LzXpZlP0N/vjSZzbkdlTMUEVnV8My2gpMpY+n
	pjxFOCSB9DBKpA0iMCrD5OJeD2ebNEQUAAjcMENe1sY9vPf6oraeyxoYxKeHHpqyZFUEPL6BTQ/Ig
	zDDcR05ZZv6l0OWQP2vTFysrKFfeF9m/Pdb+avLgy7XsqdOkGLAC5iow2bZ36bDsDb/CJkRM7yZH9
	Z+fklBUqwECK2hb+XAbF3QQZRJDP5uDtZPPfHH2YV83Aw1DqWWwQbSVS8eR2IGMfnYml57S2ECrlI
	J/zbGDpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW2UC-00000007dkv-3Pwa;
	Thu, 18 Dec 2025 01:07:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW2UA-00000007dkR-28SC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 01:07:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5BB604349F;
	Thu, 18 Dec 2025 01:07:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0C31C4CEF5;
	Thu, 18 Dec 2025 01:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766020037;
	bh=CWH28cOxPZAZWrWcY/NKpJgCf7WSDCA3ZIr66yGr2UI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=u1DPZ0hmLO6jFAREjtVWQteO0CmpRtbzEDH+BXoZ34nSIC2fE4WentvnDRK/ikQ1z
	 xeClGXoi3Xyf2z+I6IvOwzr7PPbTQRaOVY3dKcVbSBZLFh/owd9efx45KXA9WbZx0e
	 E3pa2UodwPc+3OrfQQEiCkT2aVMIO+PQOQzRHHmb0sH3Fc0LJoqjkhBiiUKylbTj79
	 jFYpqrBLPGNhRcWYHRXwfAKhzBa19RXdkSx2fCjiegf89SjNA7Xz/4ave1+P1cEtQK
	 9gl24R+7GIZeXCOTl2CZ01ppi09iLoKRGVDd6VOZQT5ApdRFZMIO17CsCqbwRUs28X
	 D+w+/WNq4y8QA==
Date: Wed, 17 Dec 2025 20:07:12 -0500
From: Steven Rostedt <rostedt@kernel.org>
To: Jiri Olsa <jolsa@kernel.org>
Cc: Florent Revest <revest@google.com>, Mark Rutland <mark.rutland@arm.com>,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Menglong Dong
 <menglong8.dong@gmail.com>, Song Liu <song@kernel.org>
Subject: Re: [PATCHv5 bpf-next 3/9] ftrace: Export some of hash related
 functions
Message-ID: <20251217200712.606a9a7a@robin>
In-Reply-To: <20251215211402.353056-4-jolsa@kernel.org>
References: <20251215211402.353056-1-jolsa@kernel.org>
	<20251215211402.353056-4-jolsa@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_170718_581781_2EF00BB3 
X-CRM114-Status: GOOD (  10.70  )
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

On Mon, 15 Dec 2025 22:13:56 +0100
Jiri Olsa <jolsa@kernel.org> wrote:

> index 505b7d3f5641..c0a72fcae1f6 100644
> --- a/include/linux/ftrace.h
> +++ b/include/linux/ftrace.h
> @@ -82,6 +82,7 @@ static inline void early_trace_init(void) { }
>  
>  struct module;
>  struct ftrace_hash;
> +struct ftrace_func_entry;
>  
>  #if defined(CONFIG_FUNCTION_TRACER) && defined(CONFIG_MODULES) && \
>  	defined(CONFIG_DYNAMIC_FTRACE)
> @@ -405,6 +406,14 @@ enum ftrace_ops_cmd {
>  typedef int (*ftrace_ops_func_t)(struct ftrace_ops *op, enum ftrace_ops_cmd cmd);
>  
>  #ifdef CONFIG_DYNAMIC_FTRACE
> +
> +#define FTRACE_HASH_DEFAULT_BITS 10
> +
> +struct ftrace_hash *alloc_ftrace_hash(int size_bits);
> +void free_ftrace_hash(struct ftrace_hash *hash);
> +struct ftrace_func_entry *add_hash_entry_direct(struct ftrace_hash *hash,

As this is no longer static and is exported to other users within the
kernel, it should be renamed to: add_ftrace_hash_entry_direct()
to keep the namespace unique.

-- Steve

> +						unsigned long ip, unsigned long direct);
> +
>  /* The hash used to know what functions callbacks trace */
>  struct ftrace_ops_hash {
>  	struct ftrace_hash __rcu	*notrace_hash;

