Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF2BC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 08:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iOwcbIZz6KNHT+FXEYQg3/sY0h2+iUCdrhvHC4IZbB4=; b=r3YKlbAZuuFQ7hnUHNt/2/Z7OF
	QzcwicetvstuhgheQf4/nZ6VugEK8EkwWGaTJcluI1QvPQkAhCDry1nRPulm+gA4LikgKwX872HyH
	kcn7KeaztIc4pOxI/D0BRpHDURN17ffAl4sNNs21yHLA0Kv7BUUFniTWW8UW6JdOcXbvsjV0jliHy
	LgfEHviEwAUKOQfRGaeU5YWc5TxsDlixhur2krcpK8xaHUFBiEQLDXGxjK58+raY9jLFxg+9Ibg6i
	DNRYblSSZgE4H7oqyu44wwwfVBY4DAhI6YRcOWwHUawWV5oGg9fXlc53FdcdlrraoKSPG1G6IqJV4
	h4uhJ02A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhOTg-000000038tj-2DLe;
	Thu, 31 Jul 2025 08:17:28 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhOJC-000000037k5-0tXx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 08:06:39 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-4aaf43cbbdcso137881cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 01:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753949197; x=1754553997; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iOwcbIZz6KNHT+FXEYQg3/sY0h2+iUCdrhvHC4IZbB4=;
        b=a1Q84Dj3ghlzwvUpT0O/zwmnzKip+5nJ+otuuFYlAFBU/GiORp7JG3Tlguo9x50Md7
         pMAbAb1j12bQc6NQbgtFR53PczpwZzrqM7CeU+yuBIBKv0yJOm4F3q3LHMuMCdVGpGML
         /wguTCA/3xp8RAr7Tcz96BoaP8V8+gW7mPGKca5+LGhs/vBKbf2sPmUwgyB3fwMAx26W
         OiD/yMtCIBKURJjFiLyCvoNREbpM/4xB/ugplVXLt1WYxsbEM/vDw4HUNkQHMGtDbk9M
         NnH+BdRs4joZKQgIFeAFmza4sVqxWvJoTxzJy8Gb1lFzBkeQwfHsZrcue4YhhROoP9Fu
         68Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753949197; x=1754553997;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iOwcbIZz6KNHT+FXEYQg3/sY0h2+iUCdrhvHC4IZbB4=;
        b=nodcFJV+xV5MEvl8rjOl8/Nh/sG8KH/yU5jECYXAWZBK/WAq2Bdi/2VaG3WejrMCW9
         8jyc5z5tx9J+uNZU0LV4kD5Ssbw01T+c1yQvkkgV3AUklLfWiGtxR/dRG4N4aKD1GuAy
         7Qfg7wmfU5kuCEfZs85SjrPbfqg3vhi2QEa6c++2LaHQ1qSWoc+ft1JCloMuPP/dKegB
         siMdsxPVF/tl5BTM6BIvBiW9An5i+avDrtxR0MPAk0G+NIINXlqlSQv4dAxerqFAaPlo
         +CcAaZEZPsNMm8PvSKJ16X9dBIG6vv6MFsx9AK7oODSbZJAkvs9Pb0AY8AdDUQrEckVS
         bQVA==
X-Forwarded-Encrypted: i=1; AJvYcCWxf5NU8Q/tnmZN0A8NNayDuGrOTkJ4xYZsjx3pdMKcaByzYJ6Wnf3uDdmVUYUOFAbh6/cPCpN0coCMUfEPfdO4@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8QsYY2MD+JduEFQnmlaZwSKHquQt4uuqRyZ0Mdlsn/z2xEYn7
	j7f7y74S8WzVAlGG4fB4SLM1R4nxAH3/k8DpggoAxvUL7NZJc3ENzgRmg51WYYN9RRtwfIw6moA
	sRDUewFOlw1vvTIoo2GrBt7OZ54AeEgTe+qwg03nu
X-Gm-Gg: ASbGncsFgEsDVuzTDWZ5AIjYUn4SzBl0jReXfBTzgNFwntdJjmBZHri48CvHcnz0UqM
	Ddq7tMzwBB/ONPoQgV6wnWSFp/RnLvgCci3Et7l45jKP+oqpX6W4kPA9dhLpToWwax+41+UPdM6
	4t4feW3s5MyO1+vN5r7XeKkdtrMYsQzFnSN8+7tvJTRRpqhSzioe1Z8n/AvEtczqvvtled+WEUN
	8GqXLM=
X-Google-Smtp-Source: AGHT+IHA3J7LZJAKRJ99scN7c7ARq+UBlGN3HkIGNVkFjCG5DU7qogR7qV0uuCgZR4Tq7z9c3HzsMPaQwvZlYCSFprg=
X-Received: by 2002:a05:622a:468e:b0:4a7:1743:106b with SMTP id
 d75a77b69052e-4aeefcc71e5mr1779041cf.6.1753949196737; Thu, 31 Jul 2025
 01:06:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250729225455.670324-1-seanjc@google.com> <20250729225455.670324-14-seanjc@google.com>
In-Reply-To: <20250729225455.670324-14-seanjc@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 31 Jul 2025 09:06:00 +0100
X-Gm-Features: Ac12FXxldpoIc_5xKiLw2SYzn_frwTTJYhqrP2B7q7n9BwFJdyNg9FxkWuacl9I
Message-ID: <CA+EHjTymOVqvWYfMxS=NAa1HuhfGj+aN=zPtTUTephmPbOqNzA@mail.gmail.com>
Subject: Re: [PATCH v17 13/24] KVM: x86/mmu: Hoist guest_memfd max level/order
 helpers "up" in mmu.c
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Gavin Shan <gshan@redhat.com>, Shivank Garg <shivankg@amd.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, David Hildenbrand <david@redhat.com>, 
	Ackerley Tng <ackerleytng@google.com>, Tao Chan <chentao@kylinos.cn>, 
	James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_010638_251913_9A02F2F4 
X-CRM114-Status: GOOD (  17.55  )
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

On Tue, 29 Jul 2025 at 23:55, Sean Christopherson <seanjc@google.com> wrote:
>
> Move kvm_max_level_for_order() and kvm_max_private_mapping_level() up in
> mmu.c so that they can be used by __kvm_mmu_max_mapping_level().
>
> Opportunistically drop the "inline" from kvm_max_level_for_order().
>
> No functional change intended.
>
> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
> Reviewed-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

>  arch/x86/kvm/mmu/mmu.c | 72 +++++++++++++++++++++---------------------
>  1 file changed, 36 insertions(+), 36 deletions(-)
>
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index b735611e8fcd..20dd9f64156e 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -3285,6 +3285,42 @@ static int host_pfn_mapping_level(struct kvm *kvm, gfn_t gfn,
>         return level;
>  }
>
> +static u8 kvm_max_level_for_order(int order)
> +{
> +       BUILD_BUG_ON(KVM_MAX_HUGEPAGE_LEVEL > PG_LEVEL_1G);
> +
> +       KVM_MMU_WARN_ON(order != KVM_HPAGE_GFN_SHIFT(PG_LEVEL_1G) &&
> +                       order != KVM_HPAGE_GFN_SHIFT(PG_LEVEL_2M) &&
> +                       order != KVM_HPAGE_GFN_SHIFT(PG_LEVEL_4K));
> +
> +       if (order >= KVM_HPAGE_GFN_SHIFT(PG_LEVEL_1G))
> +               return PG_LEVEL_1G;
> +
> +       if (order >= KVM_HPAGE_GFN_SHIFT(PG_LEVEL_2M))
> +               return PG_LEVEL_2M;
> +
> +       return PG_LEVEL_4K;
> +}
> +
> +static u8 kvm_max_private_mapping_level(struct kvm *kvm, kvm_pfn_t pfn,
> +                                       u8 max_level, int gmem_order)
> +{
> +       u8 req_max_level;
> +
> +       if (max_level == PG_LEVEL_4K)
> +               return PG_LEVEL_4K;
> +
> +       max_level = min(kvm_max_level_for_order(gmem_order), max_level);
> +       if (max_level == PG_LEVEL_4K)
> +               return PG_LEVEL_4K;
> +
> +       req_max_level = kvm_x86_call(gmem_max_mapping_level)(kvm, pfn);
> +       if (req_max_level)
> +               max_level = min(max_level, req_max_level);
> +
> +       return max_level;
> +}
> +
>  static int __kvm_mmu_max_mapping_level(struct kvm *kvm,
>                                        const struct kvm_memory_slot *slot,
>                                        gfn_t gfn, int max_level, bool is_private)
> @@ -4503,42 +4539,6 @@ void kvm_arch_async_page_ready(struct kvm_vcpu *vcpu, struct kvm_async_pf *work)
>                 vcpu->stat.pf_fixed++;
>  }
>
> -static inline u8 kvm_max_level_for_order(int order)
> -{
> -       BUILD_BUG_ON(KVM_MAX_HUGEPAGE_LEVEL > PG_LEVEL_1G);
> -
> -       KVM_MMU_WARN_ON(order != KVM_HPAGE_GFN_SHIFT(PG_LEVEL_1G) &&
> -                       order != KVM_HPAGE_GFN_SHIFT(PG_LEVEL_2M) &&
> -                       order != KVM_HPAGE_GFN_SHIFT(PG_LEVEL_4K));
> -
> -       if (order >= KVM_HPAGE_GFN_SHIFT(PG_LEVEL_1G))
> -               return PG_LEVEL_1G;
> -
> -       if (order >= KVM_HPAGE_GFN_SHIFT(PG_LEVEL_2M))
> -               return PG_LEVEL_2M;
> -
> -       return PG_LEVEL_4K;
> -}
> -
> -static u8 kvm_max_private_mapping_level(struct kvm *kvm, kvm_pfn_t pfn,
> -                                       u8 max_level, int gmem_order)
> -{
> -       u8 req_max_level;
> -
> -       if (max_level == PG_LEVEL_4K)
> -               return PG_LEVEL_4K;
> -
> -       max_level = min(kvm_max_level_for_order(gmem_order), max_level);
> -       if (max_level == PG_LEVEL_4K)
> -               return PG_LEVEL_4K;
> -
> -       req_max_level = kvm_x86_call(gmem_max_mapping_level)(kvm, pfn);
> -       if (req_max_level)
> -               max_level = min(max_level, req_max_level);
> -
> -       return max_level;
> -}
> -
>  static void kvm_mmu_finish_page_fault(struct kvm_vcpu *vcpu,
>                                       struct kvm_page_fault *fault, int r)
>  {
> --
> 2.50.1.552.g942d659e1b-goog
>

