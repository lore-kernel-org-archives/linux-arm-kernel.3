Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20047C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qSZ5JB9zKtrIkO0EaAygHi+SrnAqqj+A/rbob9XSOYk=; b=0w3LzAY60P0AJYioz68hEh/R+Q
	ckPOXMs/WY/TYG+WKzBT32sE0h0YGWZz3Z43Dki7KKBuFpkHpnWb2h/sJCTmK/l1CK7Cx5ub/YL7y
	IN41wcQWEA5Q0H93RU6b5oy6UTHIV8maKdkmvmt3w8GBm46FaxWOaw8BRUS0XCZb4fthTDopPMqcd
	4E1AHmw+Wf/YQEvrbaM+0EqhSFquM0pznO4YQu7z3cNk9zmgn6v1pg1Lj5fdWugqiQLY37Sz8rRxT
	d3/3HxwxOAvZKRIoWe7kcKF3Msjhyg1Yd4t2ZP4M8br+uaXuC4A49NVi63Pp3s5N+Q220PE59hsmo
	G/zzPeTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyRK-0000000EjBC-2YeV;
	Wed, 15 Jul 2026 12:10:14 +0000
Received: from out-189.mta0.migadu.com ([91.218.175.189])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyRB-0000000Ej8j-4B8l
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 12:10:07 +0000
X-Forwarded-Encrypted: i=1; AHgh+Ro7W6T1bIK83GpWftFXzcGk9YSBggnGH5YLONDXINrGJlhS19FBhkTZUresSCUoHhERObneaOPWVaL+29EAwq0c@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784117403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qSZ5JB9zKtrIkO0EaAygHi+SrnAqqj+A/rbob9XSOYk=;
	b=iW3/afH2NmQKIcOL/7I0NA/I9C0X5slzknPwH2bA+D1JUArea+p81OUY3qQDwbeAeQ3Qws
	WNO/193xyqURf7t7khY2AnZbe4RK070T/wKdP7Sp+cP08h63QJA4vxdNXPoPoUUqcBbrv2
	hCWZrijaikN8pXOaQAW8CbEe4vLBjLc=
X-Gm-Message-State: AOJu0Yzl+G5xwbXmQyFmhysqc8vHzz4KuYN0nUmZqPJJao2sKK/J0eW3
	3f6BoukAstHWVdpb/s76bpgEggbXRsYo88i3qWJJNAImfAxDJZqrGgui/MRsgE0RT2YikksT4vK
	Rx0Py/5GLt0c5C8iQy2V53+NyzGqgyOuOhZIDAEVN
X-Received: by 2002:a05:622a:5c12:b0:51c:7a8b:c3ff with SMTP id
 d75a77b69052e-51d7bdb83edmr25842211cf.24.1784117390174; Wed, 15 Jul 2026
 05:09:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260706175415.2604046-1-vdonnefort@google.com> <20260706175415.2604046-15-vdonnefort@google.com>
In-Reply-To: <20260706175415.2604046-15-vdonnefort@google.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 15 Jul 2026 13:09:12 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyFavaVQ=bmo=1s9LgDVQftdsCELUudSza1ARZCJo+dqw@mail.gmail.com>
X-Gm-Features: AUfX_mwz8PnRCmbDIQiL7DM9woWrklxzmZ2ssGxPRW2w8RFTYJWSLHIFabD23mk
Message-ID: <CA+EHjTyFavaVQ=bmo=1s9LgDVQftdsCELUudSza1ARZCJo+dqw@mail.gmail.com>
Subject: Re: [PATCH v2 14/18] KVM: arm64: Use noclear for PGD in
 __pkvm_init_vm error path
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_051006_272349_C66935EF 
X-CRM114-Status: GOOD (  17.00  )
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

On Mon, 6 Jul 2026 at 18:54, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> In the error path of __pkvm_init_vm(), use unmap_donated_memory_noclear()
> instead of the clearing variant to release the donated stage-2 PGD back
> to the host.
>
> This intends to eliminate the clearing variant of
> unmap_donated_memory(), as zeroing the PGD memory before returning it to
> the host is unnecessary in this failure path.
>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
>
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index d9ab58226889..0c82f1ddb93d 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -861,7 +861,7 @@ int __pkvm_init_vm(struct kvm *host_kvm, unsigned long vm_hva,
>         kvm_guest_destroy_stage2(hyp_vm);
>  err_remove_mappings:
>         unmap_donated_memory(hyp_vm, vm_size);
> -       unmap_donated_memory(pgd, pgd_size);
> +       unmap_donated_memory_noclear(pgd, pgd_size);


We spoke about this in person before you sent the series and I thought
it was ok. Sashiko's review made me doubt at first, since the freed
blocks carry EL2 list_head pointers that the noclear variant hands
back to the host.

You mentioned that the mapping isn't secret (later when we discussed
Sashiko's review in person), and I checked: kvm_compute_layout() runs
at EL1 on the host and rolls the tag itself. The host already knows
the PA of every page it donated, so it can compute those VAs anyway.
So I don't think this is a real leak.

However, this relies on the pool and hyp_vm both being donated
linear-map memory here. Once hyp_vm moves to hyp_alloc() in the
private range, the free_area anchor becomes a private-range VA, and I
haven't checked whether that's host-derivable.

Given it's the init error path and not hot, clearing costs basically
nothing, so I'd lean towards just keeping unmap_donated_memory()
rather than reasoning about derivability.

What do you think?



/fuad

>  err_unpin_kvm:
>         hyp_unpin_shared_mem(host_kvm, host_kvm + 1);
>         return ret;
> --
> 2.55.0.rc2.803.g1fd1e6609c-goog
>

