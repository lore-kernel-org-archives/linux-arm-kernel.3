Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF2BC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 07:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qIU0wcim3JRNROEXJcT4sf8FGesHdbjBdUO8HtD3Om8=; b=sz9WFhH4YUEDnKV64332SlwqCV
	FJlTP7ohJtIcFpmLvHf+GPWPA0ag3rKflh7/K853Bdxo8ObC6d2AUvnvs7tU4fCT60PixC0I+FrQB
	DdznSPbxtMVf8v7I/csOSrH2oyjdGQI2dZRcPN7HV5xN/jOHELD5TDE9BCBVp8ix6eatNyWyJTf2i
	tAOSh1DxAO2GJK/e4oZx69seumD0LsbPxRoavHUyrNrqbTQb0LXARHO1cUM2k4foxHTq7Pg3+G2zk
	CpilneoTokah5s3Kq7SnCnFqcFQsehFdxVxQ7bxZi8JPrE7sea225GEoJaeS+KO/MyAcgyF0u72BE
	gCHGtx6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5FG-00000008guy-1DEb;
	Tue, 21 Jul 2026 07:50:30 +0000
Received: from out-172.mta0.migadu.com ([91.218.175.172])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5FC-00000008gss-2qLl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 07:50:29 +0000
X-Forwarded-Encrypted: i=1; AHgh+Rr6U/UU+2U9I4pEu1pOKU8GnOF0dC0z46qdf2rVr302Y/kfzkZb+9XqDMcSVsp3RSgdr+RM7gQGADPCrsejysVY@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784620222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qIU0wcim3JRNROEXJcT4sf8FGesHdbjBdUO8HtD3Om8=;
	b=Qv1CPQwJ5cxkXCQQ8NdwePaJBttX9VQZvbNvb44Xpe1s3SFDhX03R3TDDJjpM6j1FwjBj2
	U16om+0pVqGADvWhHYDBvL4u7Ta6yNh+Tm60E67nGHqCPhu2PL3LLZVjuowlPsWZmA0frw
	1KxwDhks/FZVkREmlLfCq5Zbil1+s28=
X-Gm-Message-State: AOJu0YwIkqTgHBVQBxmSTcFVDqeUo2PI1GXcaf8ekCXGBeaYshLx4yCi
	0JDHFoM9KM44e1WHatquMwfOjElwgTu9bWywdaKB3CcGnnlV99eUprP10KS9TUOspIN9AM0OCRJ
	u9IUhNviFLJj+J+EZLKZ77XKrcQr0Ujk+hubbInfL
X-Received: by 2002:a05:622a:d1:b0:51c:9ad:d76 with SMTP id
 d75a77b69052e-526025cbcdcmr10716751cf.19.1784620203936; Tue, 21 Jul 2026
 00:50:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260720203529.1276355-1-smostafa@google.com>
In-Reply-To: <20260720203529.1276355-1-smostafa@google.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 21 Jul 2026 08:49:26 +0100
X-Gmail-Original-Message-ID: <CA+EHjTw+BypEvWRccxqsSGR+btEX58nCUC2ypuSjw04Qo3nN=A@mail.gmail.com>
X-Gm-Features: AUfX_myIwZifnR9KPL23lN9BM9f3hza67nmMok8FJ5ITuX-6AqaL4_b_GXQ0JsY
Message-ID: <CA+EHjTw+BypEvWRccxqsSGR+btEX58nCUC2ypuSjw04Qo3nN=A@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Optimize protected mode and FWB
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, maz@kernel.org, oupton@kernel.org, 
	seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_005027_518899_137DC1FA 
X-CRM114-Status: GOOD (  19.73  )
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

On Mon, 20 Jul 2026 at 21:35, Mostafa Saleh <smostafa@google.com> wrote:
>
> KVM opportunistically enables FWB if supported by the system for guest
> VMs, which allows it to elude cache maintenance for data as they are
> forced to be cacheable from stage-2.
> In that case, __clean_dcache_guest_page() will immediately return.
> However in protected mode, before calling __clean_dcache_guest_page()
> it loops over the range and fix_map/unmap it, issuing TLB
> invalidations, dsb() and isb() unnecessarily.
>
> This can be optimized by returning early if FWB is supported,
> kvm_pgtable_stage2_map() already issues dsb() and tlb invalidation
> functions issue dsb() for the unmap path.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 4e329e39a695..6e9229106a25 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -261,6 +261,10 @@ static void __apply_guest_page(void *va, size_t size,
>
>  static void clean_dcache_guest_page(void *va, size_t size)
>  {
> +       /* See __clean_dcache_guest_page() */

This looks good to me. One comment: this file also has
hyp_poison_page(), which deliberately avoids
__clean_dcache_guest_page() because the FWB elision would be wrong
there (it even notes "Prefer kvm_flush_dcache_to_poc() over
__clean_dcache_guest_page()"). Given the two opposite treatments in
the same file, could this comment say why eliding is safe here, e.g.
that the consumer is the guest via the FWB-forced stage-2? It would
save the next reader (if they're anything like me) from reconciling
the two.

That fuller comment could also replace "See
__clean_dcache_guest_page()", which mostly just points back at the
function passed in the __apply_guest_page() call below.

With that fixed:

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

> +       if (cpus_have_final_cap(ARM64_HAS_STAGE2_FWB))
> +               return;
> +
>         __apply_guest_page(va, size, __clean_dcache_guest_page);
>  }
>
> --
> 2.55.0.229.g6434b31f56-goog
>

