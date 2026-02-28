Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F19FEE4FE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 20:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xas036PDJjL/P64K0otDcgYpOO9iNGiuH4V6QUTvX4E=; b=BQlr0LqV5NT2FSjRUUf+y6NVrK
	zVhjfj68VwiPFv1IBL5HBQ0Nz2W8CETyaoqUKo3PU1X6qnc4lKKkYK+bgW2YA89pOyqhkCpjlEiOu
	A6sGlyf9PDPX6G//mjPVfj5iNtIk8Oz5W44ez8j3AfRU1atKUW39/X0MnFZKDCCtBlQRJanadHI78
	3ELL7hpn6rJHkf9MDhkfIa7Pdt3wSb7+YqE99KbTs5HirTjgO99D0z+IJqqUjNNuutphpPIFqENNZ
	wFAIlvFtzn8CfclVhgWCSatzNCP9gShEToWBaodbJOj9tRnkChzIW0FkGqmz3o5Vzi3bWF8PLr0lQ
	xuW5QXqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwR69-0000000AG9x-2btW;
	Sat, 28 Feb 2026 20:39:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwR67-0000000AG9d-2hX5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 20:39:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A972243B32;
	Sat, 28 Feb 2026 20:39:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3900C116D0;
	Sat, 28 Feb 2026 20:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772311173;
	bh=ULNZ0C8qGN2aPpdVL3K6v0ACZP6yR6VBVGm/r7eaO60=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=N24SUBqnMxlUXDO08DU/2iTjZvmxfP6Eq49VKQknevovh0PlBMzBuBW9z0wrZderH
	 +ZTq3t7fWJdzasFy5I8Avz20G4VMOGrU+Solg1bhlWxbhfluNsD4wgQ1hOfV34rdRE
	 JUfLbLY+8/iVNpUyYaWyHlJr2mk2QYDwUtxDFbvP5o9d6KeJRWxeLMcStK11PyKD45
	 noAPyaYmYvbr/5IO6jDPFFmCtWte32yd1BiKB9N92zP3Yx7jY7BhttbBg0rRfSrSXx
	 z2O6vWRk6Ze0AjCD2dCYqkO6vSHwFO3YdGCeV3hrSOTnc/0Uqt/sxRDSbYGB/zL/JS
	 ICK9k+cj9L63Q==
Date: Sat, 28 Feb 2026 15:39:21 -0500
From: Steven Rostedt <rostedt@kernel.org>
To: Jiri Olsa <olsajiri@gmail.com>
Cc: Ihor Solodrai <ihor.solodrai@linux.dev>, Florent Revest
 <revest@google.com>, Mark Rutland <mark.rutland@arm.com>,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Menglong Dong
 <menglong8.dong@gmail.com>, Song Liu <song@kernel.org>, Kumar Kartikeya
 Dwivedi <memxor@gmail.com>
Subject: Re: [PATCHv6 bpf-next 9/9] bpf,x86: Use single ftrace_ops for
 direct calls
Message-ID: <20260228153921.19cd42a6@fedora>
In-Reply-To: <aaILlSuEgaYDq41r@krava>
References: <20251230145010.103439-1-jolsa@kernel.org>
	<20251230145010.103439-10-jolsa@kernel.org>
	<1b58ffb2-92ae-433a-ba46-95294d6edea2@linux.dev>
	<aaIAoBZGkP7RQrvc@krava>
	<aaILlSuEgaYDq41r@krava>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_123935_707450_6A150CCF 
X-CRM114-Status: GOOD (  10.75  )
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

On Fri, 27 Feb 2026 22:24:37 +0100
Jiri Olsa <olsajiri@gmail.com> wrote:

> diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> index 827fb9a0bf0d..e333749a5896 100644
> --- a/kernel/trace/ftrace.c
> +++ b/kernel/trace/ftrace.c
> @@ -6404,7 +6404,9 @@ int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
>  			new_filter_hash = old_filter_hash;
>  		}
>  	} else {

As this looks to fix the issue, just add:

		guard(mutex)(&ftrace_lock);

> +		mutex_lock(&ftrace_lock);
>  		err = ftrace_update_ops(ops, new_filter_hash, EMPTY_HASH);
> +		mutex_unlock(&ftrace_lock);
>  		/*
>  		 * new_filter_hash is dup-ed, so we need to release it anyway,
>  		 * old_filter_hash either stays on error or is already released
> @@ -6530,7 +6532,9 @@ int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash)
>  			ops->func_hash->filter_hash = NULL;
>  		}
>  	} else {

And here too.

As there's nothing after the comment and before the end of the block.

-- Steve

> +		mutex_lock(&ftrace_lock);
>  		err = ftrace_update_ops(ops, new_filter_hash, EMPTY_HASH);
> +		mutex_unlock(&ftrace_lock);
>  		/*
>  		 * new_filter_hash is dup-ed, so we need to release it anyway,
>  		 * old_filter_hash either stays on error or is already released



-- Steve

