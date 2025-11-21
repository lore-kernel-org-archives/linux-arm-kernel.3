Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BC6CFC28C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 16:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LeBh4Bmf/10he6RTgyJAy/hm7lbhgMBwonk4NxPOv6g=; b=jx8R/SwQwYqCGvpM7g73/yVGga
	fBP6scT4Wdyi/08YeeblgNJlLAMqlC5TFCQtk7SQYoN34H5AB4Ik/NmEmxdJNI3u8Gt2SCaLOYV8k
	H8QyOcHKK6q5VcT3qbYHKWK8zqhwehlnYMCMZ90bgz40ewlCRe8JLCd2IFMi0BWo9SQtWifuASxZI
	0LOGygz5nUEv7vri3FK/yp9tJff6GhtlWigEoOxiA1PFwO3qL/TPfzzqa2t/lEoiyC7p02A5byzJj
	0Y88Ti1lKUhVsCc7w5fK3JkJDKTt/HhFhzXXfFHy0ybSza2/yGivScjsbkrj6FVTtVuIVHgogUFDS
	169VDinA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMU6A-00000008jQl-3Dhu;
	Fri, 21 Nov 2025 16:35:02 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMU68-00000008jQ8-0pb7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 16:35:01 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso15168775e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 08:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763742898; x=1764347698; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LeBh4Bmf/10he6RTgyJAy/hm7lbhgMBwonk4NxPOv6g=;
        b=BwQy0lVVxK2zJ0VbztYusEsKimz1N/obaumqBOW0qakP1kdkCR/Hmd0bz6I11zP2BP
         0kdH4NRz5AYLaN5NUNa63nXO6D4hp0BWyzcuxWYfpK43wk/V7cFVEkh/IvfgRmspUtA4
         6+CRhL/f2OWf8m8hwMF6h4jpaI+d1Y7A7/MOyHn/S55TWcBgGR56Ysh2h6PjVTXmPat2
         KV2UAK/2XuEJOkiL73LydiaU55gjNJYygLanbhHBRYPOYWgzZbtEozxqAG+TW5rp6P5g
         YWGkgxhm9pIHKkI0m/jjoz6+DPnJtsFWTigvx2FtCvkFyZKHaXr9DZb8zRSyUda0cc3Q
         QHvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763742898; x=1764347698;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LeBh4Bmf/10he6RTgyJAy/hm7lbhgMBwonk4NxPOv6g=;
        b=YvZcHkPsfgfN1pokDFRZKkSMIdwKzdr9CjkheYWNc31ueHWSyUCQ/+cwRa5uHsgX+O
         XyzBQo507kCF8agqdSwPzElzW2l1HTYqFlUOemzkJMRvCewUS1HeFl4NtcBi06l48/78
         UzyMAeRQiovR916ShcGB+4M6J2vmOXcsBRpum5Ga9n//AXeVhofxyCL2JUYUmNk5eYzc
         mMdtk0oWmSYG8zVcL1yU0KIe7WbpUpDLDKfPp/9IvuvLLt1aXUHFOZMggqzcm2v2p5pd
         qeN6qjxPC6Fz6fMNhN0pDLNHjxZOh9kNyIFseJQKiGgvvX6vKAp1IX4Hy4DxVv8isoDp
         wpLw==
X-Forwarded-Encrypted: i=1; AJvYcCXhqxZiXgT5npHPC02Ioir5SpewGA+nMY71CHnl+/Zxhafw//6h/OvhK6SXYqpSK3s2Er9WhVbvfU39B52kpDD3@lists.infradead.org
X-Gm-Message-State: AOJu0YxG/yI/SDu1Wm3/hlRiOvXt5sKO2fZvZj1O2vUR0OV6zpHwErmE
	xXROvadSVdbqSiKyPsG3oxeE7nS6fjGiGYTGlPrhApXXOOtr7RDMmT1K
X-Gm-Gg: ASbGnctbF9ZUOzEBNsPYnd7YuGo/JQuW2n6fzOQcJdXVlEJ3GvWvoeCc6LM9juklVGS
	/QANi3bWsBYPgT1x6bgD+km7UzeZGYJCwNlCak5mHqyPovsmtPo6EwtjBhqz4aLU0JfvZLrkwdO
	rFLtUcWsCtOOdueS+bk4zK5Rmz3h1XZhrzEUJZMQ9OxxiMJ3LVAHh1J8I0stNnibnsBflUpfpFH
	rgzn2aS96CQjELB9x4F6Ra1L2wA6zpimx3+hBHeY80P7yLtVb76HzZyPLVx8BV981oo0SDHgU7B
	byDvgFFBE3MeiV7A3mDgaDBA9VYTkSdTVFQMKfNS4rGr/woL987Y0wtEV9HsEOajNYk/AkjJniV
	DHzBa+QzZBoWv3nQeYnLFbA5DM5AgcxxMAxPMWtM6NjCox4A5Fejcl4SL1U276wrqrep2ylKE4x
	Nh+Fr5
X-Google-Smtp-Source: AGHT+IEKdc92wQhMBHJXAveRBg7fiF+sSYb2PsxuIGwuTPQH/pLO5VsLsMQfdUdHa4/EJSA5dpNgdA==
X-Received: by 2002:a05:600c:310d:b0:477:9fcf:3ff9 with SMTP id 5b1f17b1804b1-477c01c359fmr32515485e9.27.1763742898107;
        Fri, 21 Nov 2025 08:34:58 -0800 (PST)
Received: from krava ([2a00:102a:500a:1917:4c7b:f90f:b94c:79b1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf35f976sm52771145e9.4.2025.11.21.08.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 08:34:57 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Fri, 21 Nov 2025 17:34:54 +0100
To: Jordan Rife <jordan@jrife.io>
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org, x86@kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Puranjay Mohan <puranjay@kernel.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Ingo Molnar <mingo@redhat.com>
Subject: Re: [RFC PATCH bpf-next 1/7] bpf: Set up update_prog scaffolding for
 bpf_tracing_link_lops
Message-ID: <aSCUrtsBrfS2iTkB@krava>
References: <20251118005305.27058-1-jordan@jrife.io>
 <20251118005305.27058-2-jordan@jrife.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118005305.27058-2-jordan@jrife.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_083500_283583_E78D05E7 
X-CRM114-Status: GOOD (  24.78  )
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

On Mon, Nov 17, 2025 at 04:52:53PM -0800, Jordan Rife wrote:

SNIP

> diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> index f62d61b6730a..b0da7c428a65 100644
> --- a/kernel/bpf/syscall.c
> +++ b/kernel/bpf/syscall.c
> @@ -63,6 +63,8 @@ static DEFINE_IDR(map_idr);
>  static DEFINE_SPINLOCK(map_idr_lock);
>  static DEFINE_IDR(link_idr);
>  static DEFINE_SPINLOCK(link_idr_lock);
> +/* Synchronizes access to prog between link update operations. */
> +static DEFINE_MUTEX(trace_link_mutex);
>  
>  int sysctl_unprivileged_bpf_disabled __read_mostly =
>  	IS_BUILTIN(CONFIG_BPF_UNPRIV_DEFAULT_OFF) ? 2 : 0;
> @@ -3562,11 +3564,77 @@ static int bpf_tracing_link_fill_link_info(const struct bpf_link *link,
>  	return 0;
>  }
>  
> +static int bpf_tracing_link_update_prog(struct bpf_link *link,
> +					struct bpf_prog *new_prog,
> +					struct bpf_prog *old_prog)
> +{
> +	struct bpf_tracing_link *tr_link =
> +		container_of(link, struct bpf_tracing_link, link.link);
> +	struct bpf_attach_target_info tgt_info = {0};
> +	int err = 0;
> +	u32 btf_id;
> +
> +	mutex_lock(&trace_link_mutex);

that seems too much, we could add link->mutex

> +
> +	if (old_prog && link->prog != old_prog) {
> +		err = -EPERM;
> +		goto out;
> +	}
> +	old_prog = link->prog;
> +	if (old_prog->type != new_prog->type ||
> +	    old_prog->expected_attach_type != new_prog->expected_attach_type) {
> +		err = -EINVAL;
> +		goto out;
> +	}
> +
> +	mutex_lock(&new_prog->aux->dst_mutex);
> +
> +	if (!new_prog->aux->dst_trampoline ||
> +	    new_prog->aux->dst_trampoline->key != tr_link->trampoline->key) {

hum, would be easier (and still usefull) to allow just programs for the same function?

> +		bpf_trampoline_unpack_key(tr_link->trampoline->key, NULL,
> +					  &btf_id);
> +		/* If there is no saved target, or the target associated with
> +		 * this link is different from the destination specified at
> +		 * load time, we need to check for compatibility.
> +		 */
> +		err = bpf_check_attach_target(NULL, new_prog, tr_link->tgt_prog,
> +					      btf_id, &tgt_info);
> +		if (err)
> +			goto out_unlock;
> +	}
> +
> +	err = bpf_trampoline_update_prog(&tr_link->link, new_prog,
> +					 tr_link->trampoline);
> +	if (err)
> +		goto out_unlock;
> +
> +	/* Clear the trampoline, mod, and target prog from new_prog->aux to make
> +	 * sure the original attach destination is not kept alive after a
> +	 * program is (re-)attached to another target.
> +	 */
> +	if (new_prog->aux->dst_prog)
> +		bpf_prog_put(new_prog->aux->dst_prog);
> +	bpf_trampoline_put(new_prog->aux->dst_trampoline);

would it be possible just to take tr->mutex and unlink/link
the programs, something like:

        mutex_lock(&tr->mutex);

	__bpf_trampoline_unlink_prog(old_prog)
	__bpf_trampoline_link_prog(new_prog)

        mutex_unlock(&tr->mutex);

I might be missing something but this way we wouldn't need
the arch chages in the following patches?


jirka


> +	module_put(new_prog->aux->mod);
> +
> +	new_prog->aux->dst_prog = NULL;
> +	new_prog->aux->dst_trampoline = NULL;
> +	new_prog->aux->mod = tgt_info.tgt_mod;
> +	tgt_info.tgt_mod = NULL; /* Make module_put() below do nothing. */
> +out_unlock:
> +	mutex_unlock(&new_prog->aux->dst_mutex);
> +out:
> +	mutex_unlock(&trace_link_mutex);
> +	module_put(tgt_info.tgt_mod);
> +	return err;
> +}
> +
>  static const struct bpf_link_ops bpf_tracing_link_lops = {
>  	.release = bpf_tracing_link_release,
>  	.dealloc = bpf_tracing_link_dealloc,
>  	.show_fdinfo = bpf_tracing_link_show_fdinfo,
>  	.fill_link_info = bpf_tracing_link_fill_link_info,
> +	.update_prog = bpf_tracing_link_update_prog,
>  };
>  

SNIP

