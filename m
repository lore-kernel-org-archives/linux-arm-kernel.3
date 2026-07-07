Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4D5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 18:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KIzicJtgYbCKzLvSO/GpRAV4BTLl8KZx9Q+QcO5m+HA=; b=p8z4TG899Rlk44ln1HcGlsIADw
	LpHQ2r/mvdkrnujY+rtHDrpBUFKFUkGMFyr/Xyahn/iYGG9LYujRfI0C9jjFMvA2O4d35DGqQyRN9
	8d3V1GVHkZQnl1dsjKBib7Euxwj6W+0bkMmXPtB+iu++9ut72W9XJIC1uIR7SwU6qGGgVOX4/oNzZ
	XZdECmCVZc6BgukdyMaQtidE9Zkppi21FAk1bCdeQPC7BL0hPu+oSZSfsugheSTQ5frOYU/8cozqu
	V2WhjdLPVWXF5I46J8J1xJs3OcOhhXEuhA0HlqBu+b/SonNKdRZibdsE8V8D5/oQy9DrrJ/KQDKZI
	bqrqykEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whAbv-0000000FeCS-3hxV;
	Tue, 07 Jul 2026 18:33:35 +0000
Received: from out-172.mta0.migadu.com ([91.218.175.172])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whAbs-0000000FeBu-2fJU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 18:33:34 +0000
X-Forwarded-Encrypted: i=1; AHgh+RpFH39PoLc0norq3ms1akocI9ytizsOt41bMIhbmbyLnu3o2vv3O6WLyxjM0k1EOZmbc0pNCazAVLeGsxFoT10p@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783449207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KIzicJtgYbCKzLvSO/GpRAV4BTLl8KZx9Q+QcO5m+HA=;
	b=vaf3UdlP+6QgKbWhk+atLlTtMQsebflxaJIHjGfER4dWCL3bYRDARlQ9lE1Iu2hcWbyiZq
	RKcvEcUHJXh6nnnapgoKLOo/rVHpkWsz+kZGkMQ6yLtbXPODWac8WcJokPK6liIrflGQ+p
	C4RwlguXklHI8FT/pQkn+otVMWWkhao=
X-Gm-Message-State: AOJu0YzYEV81Lg0bOEqkYr5wHzkRcXHSUInZv8h4dNmHAlmSlc4f155K
	ohO1Zhl4HFkB86MamAaxq8WlW+vAwJMfbMhpUWz4sGC3AggCdPxZ4cVsqAYqvvDSojMiiTyOpF9
	AuvkJPClNh7p3VdxRRb/QLz3kKKhgZ4IwauOAqC94
X-Received: by 2002:a05:622a:145:b0:517:5c70:46bd with SMTP id
 d75a77b69052e-51c8875e1e0mr402291cf.11.1783449201189; Tue, 07 Jul 2026
 11:33:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260707165029.3410701-1-vdonnefort@google.com>
In-Reply-To: <20260707165029.3410701-1-vdonnefort@google.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 7 Jul 2026 19:32:44 +0100
X-Gmail-Original-Message-ID: <CA+EHjTx7C7BEmyoZgx6-PWvfAHpP8AWMOefTdwOQjw8NrPhLNQ@mail.gmail.com>
X-Gm-Features: AVVi8CdJn6U5iCpuDt2Eoj2HBtV5xWI7t-8BJNIztXKGfR-5BqWmyGW03nrfYJs
Message-ID: <CA+EHjTx7C7BEmyoZgx6-PWvfAHpP8AWMOefTdwOQjw8NrPhLNQ@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Fix potential leak in hyp_trace_buffer_alloc_bpages_backing
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_113333_575965_AD988A5E 
X-CRM114-Status: GOOD (  15.31  )
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

Hi Vincent,

On Tue, 7 Jul 2026 at 17:50, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> In the very unlikely event of a failure in __map_hyp, the allocated
> backing pages are leaked in hyp_trace_buffer_alloc_bpages_backing(). Fix
> this by freeing the pages on error.
>
> Fixes: 3aed038aac8d ("KVM: arm64: Add trace remote for the nVHE/pKVM hyp")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
>
> diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
> index 2411b4c32932..5fbbfd40376f 100644
> --- a/arch/arm64/kvm/hyp_trace.c
> +++ b/arch/arm64/kvm/hyp_trace.c
> @@ -160,6 +160,7 @@ static int hyp_trace_buffer_alloc_bpages_backing(struct hyp_trace_buffer *trace_
>         int nr_bpages = (PAGE_ALIGN(size) / PAGE_SIZE) + 1;
>         size_t backing_size;
>         void *start;
> +       int ret;
>
>         backing_size = PAGE_ALIGN(sizeof(struct simple_buffer_page) * nr_bpages *
>                                   num_possible_cpus());
> @@ -171,7 +172,11 @@ static int hyp_trace_buffer_alloc_bpages_backing(struct hyp_trace_buffer *trace_
>         trace_buffer->desc->bpages_backing_start = (unsigned long)start;
>         trace_buffer->desc->bpages_backing_size = backing_size;
>
> -       return __map_hyp(start, backing_size);
> +       ret = __map_hyp(start, backing_size);
> +       if (ret)
> +               free_pages_exact(start, backing_size);
> +
> +       return ret;
>  }

nit: would be a bit cleaner to do move the desc assignment to after
the check. Also, I think sashiko found another real bug, don't think
it's serious but worth fixing.

That said...

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba < fuad.tabba@linux.dev>

Cheers,
/fuad

>
>  static void hyp_trace_buffer_free_bpages_backing(struct hyp_trace_buffer *trace_buffer)
>
> base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
> --
> 2.55.0.rc2.803.g1fd1e6609c-goog
>

