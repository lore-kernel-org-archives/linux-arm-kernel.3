Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC88C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 15:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pvneggol8/VYq27BtvoEOjJ8lEvg/p6HJaDe2TH5edY=; b=yKFmvqs3uNGvZY+eOnz2fIUQe3
	Pn3yH5nm3K3XoX9jtJDHnXc2hxqIZpjlDmQU87zvqQWmOGee2MPolRatgZtVJ5YbVdaV6xYPqx0wp
	vBR/EurN6mwe3jbxgS+KqH5D7SEl0BoXGwuk4mbMjxV6x8SdcuLxdfwb6sYIWEx6G03lHCNZh9/+t
	WjlECVTOfHzkD+054iX8syYidhvdLoqlFxUjC3h2NBKN0fET5Zy0SxoEfPYDjzTSehUvDJkRvgdEP
	Ox9g0oW0hgKa7YvEtp7iZkb75aouoZIYzq8D4c2bezkzuuP5STcPIoE6uA6opyOO0ojTLOGEmnIjq
	wmBypxDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwLkh-00000008GWb-28VO;
	Tue, 18 Aug 2026 15:29:23 +0000
Received: from out-40.mta1.migadu.com ([2001:41d0:203:375::28] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwLke-00000008GVr-2HvA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 15:29:22 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=yz1BirAozlV32Y/a88BgBar1iXFJiUM3ZwE+H9gRd8c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787066958; v=1; x=1787671758;
 b=isKmLQNptIvBG3GQqgXSG6R/ZL1i1m4aQzUMgYcoZjT+5lbOqOJECV9B0Rl7y2bvnBaC0m3D
 JX3OHLN5wFUTN3YfqaPmcPtcPU6+BFKHAILstllb3hncFajUVlmKNWxRzgy1w2MU2Jg0AVZVsHL
 O1+mKfyEl8P7Yt9VfwJTgKz0=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from mail-lf1-f51.google.com (209.85.167.51)
	by smtp.migadu.com with ESMTPS id d1113f389229f17e;
	Tue, 18 Aug 2026 15:29:18 +0000
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aeb688ae83so8533e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 08:29:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrMMeCDb3zjEMWqAmCgG38qZkqoFGcyaeCG9nr0mW/gdyHME0SPzYD6BxyHQCCkDVUwN2hsVzntq5jldSglLbOM@lists.infradead.org
X-Gm-Message-State: AOJu0Ywur2oITuT9iGt6fHcNOP4QxBChlsKCXWmLv+Qr2qc9G703uOIB
	qem6eQOxwr9K1lgOKv8LDX/vUk+kYSSG4EvD9jhNltFXX6NDgWtnrvTLKtlfGrVOqQsBgFu7wHe
	mRNp1gTx+knrMHg1Y27u1bke6nzuscWKY3W3HIR1J
X-Received: by 2002:a05:6512:12cc:b0:5ae:b0ee:f737 with SMTP id
 2adb3069b0e04-5b47435ae97mr200338e87.9.1787066955105; Tue, 18 Aug 2026
 08:29:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260731143541.956291-1-vdonnefort@google.com> <20260731143541.956291-11-vdonnefort@google.com>
In-Reply-To: <20260731143541.956291-11-vdonnefort@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 18 Aug 2026 16:28:38 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxU2GCpSR587oR_EaMOvXfu+teCnfC2KCg=vpOtf4sgRA@mail.gmail.com>
X-Gm-Features: AcwNN1W6PPY08uqxncvUvJozD_j76RCdP1Tiifaln0euga5uj7dgz3TH-pHwMWM
Message-ID: <CA+EHjTxU2GCpSR587oR_EaMOvXfu+teCnfC2KCg=vpOtf4sgRA@mail.gmail.com>
Subject: Re: [PATCH v4 10/17] KVM: arm64: Add a shrinker for pKVM
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, 
	qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_082920_727681_3E722B95 
X-CRM114-Status: GOOD (  23.20  )
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

On Fri, 31 Jul 2026 at 15:36, 'Vincent Donnefort' via kernel-team
<kernel-team@android.com> wrote:
>
> Integrate the pKVM memory reclaim interface with the host's memory
> management subsystem.
>
> This allows the host to automatically recover unused memory fom the
> hypervisor's heap allocator when the host is under memory pressure.
>
> Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
>
> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index d28422f5c3d6..bfbb1266491d 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -115,7 +115,7 @@ static int pkvm_hyp_topup(enum pkvm_topup_id id, unsigned long nr_pages)
>         return ret;
>  }
>
> -static __maybe_unused unsigned long pkvm_hyp_reclaim(enum pkvm_topup_id id, unsigned long target)
> +static unsigned long pkvm_hyp_reclaim(enum pkvm_topup_id id, unsigned long target)

This is the first caller of these, so it is where reclaim starts
running against a concurrent top-up.

Nothing marks the pages a top-up just put in allocator->mc as spoken
for, and hyp_allocator_reclaim() ends with an unbounded drain of it,
so a shrink with target 1 hands back the lot. Land that between a
top-up and the retry it was for, and the retry asks again, and
pkvm_call_hyp_req() goes round.

Both are driven by memory pressure, so they are busiest together.
Worth holding back what a pending request asked for?

>  {
>         struct kvm_hyp_memcache mc;
>         struct arm_smccc_res res;
> @@ -133,7 +133,7 @@ static __maybe_unused unsigned long pkvm_hyp_reclaim(enum pkvm_topup_id id, unsi
>         return reclaimed;
>  }
>
> -static __maybe_unused unsigned long pkvm_hyp_reclaimable(enum pkvm_topup_id id)
> +static unsigned long pkvm_hyp_reclaimable(enum pkvm_topup_id id)
>  {
>         return kvm_call_hyp_nvhe(__pkvm_hyp_reclaimable, id);
>  }
> @@ -342,8 +342,19 @@ void __init pkvm_selftests(void)
>  #endif
>  }
>
> +static unsigned long pkvm_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
> +{
> +       return pkvm_hyp_reclaimable(PKVM_TOPUP_HYP_ALLOC) ?: SHRINK_EMPTY;
> +}
> +
> +static unsigned long pkvm_shrinker_scan(struct shrinker *shrink, struct shrink_control *sc)
> +{
> +       return pkvm_hyp_reclaim(PKVM_TOPUP_HYP_ALLOC, sc->nr_to_scan);
> +}

Returning 0 rather than SHRINK_STOP when reclaim comes back empty
leaves do_shrink_slab() calling this until total_scan runs out, and
each call is an HVC. count_objects() covers the case where there is
nothing at all, but not the one where it goes stale between the two
calls.

Cheers,
/fuad

> +
>  static int __init finalize_pkvm(void)
>  {
> +       struct shrinker *pkvm_shrinker;
>         int ret;
>
>         if (!is_protected_kvm_enabled() || !is_kvm_arm_initialised())
> @@ -359,10 +370,21 @@ static int __init finalize_pkvm(void)
>         kmemleak_free_part_phys(hyp_mem_base, hyp_mem_size);
>
>         ret = pkvm_drop_host_privileges();
> -       if (ret)
> +       if (ret) {
>                 pr_err("Failed to finalize Hyp protection: %d\n", ret);
> +               return ret;
> +       }
>
> -       return ret;
> +       pkvm_shrinker = shrinker_alloc(0, "pkvm");
> +       if (pkvm_shrinker) {
> +               pkvm_shrinker->count_objects = pkvm_shrinker_count;
> +               pkvm_shrinker->scan_objects = pkvm_shrinker_scan;
> +               shrinker_register(pkvm_shrinker);
> +       } else {
> +               kvm_err("Failed to register shrinker for pKVM\n");
> +       }
> +
> +       return 0;
>  }
>  device_initcall_sync(finalize_pkvm);
>
> --
> 2.55.0.508.g3f0d502094-goog
>
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>

