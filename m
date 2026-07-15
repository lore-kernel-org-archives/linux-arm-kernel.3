Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6B6C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 11:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5hkQ1X3dNI+y7n8z5kAh8s8mH54WX+OhAWV76vg8las=; b=nfe4vlccl75WXX82XS2SuHhxct
	L2uS3SkMPMDdiztBItyyo+IPqMGQViPDifZSj7CYK4K7TUO+E35yfnUS1HwUy7ne2/twGRzDk/INj
	2Bzf9VOfSHBxhCMKI+LSeL3XQSeMyyLkWL+xTRvbNUUlh1k8AKsEBzb/5U6+XwNYO8DVYyY2bMw72
	jMYh0fwPbDVljfpUfo3jySPpblEYs9CJyXTcoYCzFdJxImNFqSls4YgoLDm4E3Qxn7C1LRXrgaxwp
	KG/5TGDNA7KFDHpw7KuT2Pyva/YbqzJkDTe5+wJQDlXS+BvH6nHsn8cAa+EiVuYCVi8MKXfbCcNP8
	Akl2ZUcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjxuB-0000000EawK-0DxY;
	Wed, 15 Jul 2026 11:35:59 +0000
Received: from out-178.mta1.migadu.com ([95.215.58.178])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjxu9-0000000EauF-0GXz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 11:35:58 +0000
X-Forwarded-Encrypted: i=1; AHgh+RpZ94ZMzOCCV8Ace93qRRFhKQLkZXCYq8WrnsELpDSO/38f0rlIoeWMfdc4YcoTUBKQsx1vhWn6Bo0K16YIAHeS@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784115354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5hkQ1X3dNI+y7n8z5kAh8s8mH54WX+OhAWV76vg8las=;
	b=BqnQaKDKW32iBLyU6sQA10IExV1fsbIClIh+9uPp+ZyH6OWNrLzvXOAmKR0tjRuMXXlbyx
	ixD+Cz7/BqizjbxWtz4K7C/T4vcpgh+NoTZPXfOg2ZRIgHgzxj8RzoE5AaS2oUg5wZEbXP
	5IdcKtaLXQCJ278xze9KeKwot5a12EU=
X-Gm-Message-State: AOJu0YwjOPIAwGwSlpGeBLktDp8oDGdexgaSiguCHwrci6Y8etdXP2n1
	soDRrMjddnK9BjGnnLBkiflu3B2XZB9X6qZrv5p2OQRcbR74Yx7GnPKU/r59NYl+Tc1j83dKNYt
	xfqq5lUbKYv85ayt/D8s68i6Fs9i6EfLxO8c/WX8t
X-Received: by 2002:a05:622a:a591:b0:51b:ff0a:2048 with SMTP id
 d75a77b69052e-51d71543adamr26047821cf.3.1784115337213; Wed, 15 Jul 2026
 04:35:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260706175415.2604046-1-vdonnefort@google.com> <20260706175415.2604046-14-vdonnefort@google.com>
In-Reply-To: <20260706175415.2604046-14-vdonnefort@google.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 15 Jul 2026 12:35:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTypUuO5mGFvMcM3uxLV9AfT1o+ue97FxPOTETEFd-6gng@mail.gmail.com>
X-Gm-Features: AUfX_myf92oOkH0YbXhV4wPBITqN6TIW4rOsI6YKVHEl4UE5O_W3P54hnk7d2AI
Message-ID: <CA+EHjTypUuO5mGFvMcM3uxLV9AfT1o+ue97FxPOTETEFd-6gng@mail.gmail.com>
Subject: Re: [PATCH v2 13/18] KVM: arm64: Move hyp_vm refcount into the structure
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_043557_270063_B1D7C0AD 
X-CRM114-Status: GOOD (  15.71  )
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
> In preparation for allocating hyp_vm using the pKVM heap allocator
> (hyp_alloc()), move its reference count out of the page metadata
> (vmemmap) and place it into the structure itself. This transition is
> necessary because hyp_alloc() allows multiple small objects to share the
> same physical page.
>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad


>
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> index c904647d2f76..624367d0ef5b 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> @@ -41,6 +41,7 @@ struct pkvm_hyp_vm {
>         struct kvm_pgtable pgt;
>         struct kvm_pgtable_mm_ops mm_ops;
>         struct hyp_pool pool;
> +       unsigned short refcount;
>         hyp_spinlock_t lock;
>
>         /* Array of the hyp vCPU structures for this VM. */
> @@ -65,6 +66,18 @@ static inline bool pkvm_hyp_vm_is_protected(struct pkvm_hyp_vm *hyp_vm)
>         return kvm_vm_is_protected(&hyp_vm->kvm);
>  }
>
> +static inline void pkvm_hyp_vm_ref_inc(struct pkvm_hyp_vm *hyp_vm)
> +{
> +       BUG_ON(hyp_vm->refcount == USHRT_MAX);
> +       hyp_vm->refcount++;
> +}
> +
> +static inline void pkvm_hyp_vm_ref_dec(struct pkvm_hyp_vm *hyp_vm)
> +{
> +       BUG_ON(!hyp_vm->refcount);
> +       hyp_vm->refcount--;
> +}
> +
>  void pkvm_hyp_vm_table_init(void *tbl);
>
>  int __pkvm_reserve_vm(void);
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index 3b2c4fbc34d8..d9ab58226889 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -278,7 +278,7 @@ struct pkvm_hyp_vcpu *pkvm_load_hyp_vcpu(pkvm_handle_t handle,
>         }
>
>         hyp_vcpu->loaded_hyp_vcpu = this_cpu_ptr(&loaded_hyp_vcpu);
> -       hyp_page_ref_inc(hyp_virt_to_page(hyp_vm));
> +       pkvm_hyp_vm_ref_inc(hyp_vm);
>  unlock:
>         hyp_spin_unlock(&vm_table_lock);
>
> @@ -294,7 +294,7 @@ void pkvm_put_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
>         hyp_spin_lock(&vm_table_lock);
>         hyp_vcpu->loaded_hyp_vcpu = NULL;
>         __this_cpu_write(loaded_hyp_vcpu, NULL);
> -       hyp_page_ref_dec(hyp_virt_to_page(hyp_vm));
> +       pkvm_hyp_vm_ref_dec(hyp_vm);
>         hyp_spin_unlock(&vm_table_lock);
>  }
>
> @@ -311,7 +311,7 @@ struct pkvm_hyp_vm *get_pkvm_hyp_vm(pkvm_handle_t handle)
>         hyp_spin_lock(&vm_table_lock);
>         hyp_vm = get_vm_by_handle(handle);
>         if (hyp_vm)
> -               hyp_page_ref_inc(hyp_virt_to_page(hyp_vm));
> +               pkvm_hyp_vm_ref_inc(hyp_vm);
>         hyp_spin_unlock(&vm_table_lock);
>
>         return hyp_vm;
> @@ -320,7 +320,7 @@ struct pkvm_hyp_vm *get_pkvm_hyp_vm(pkvm_handle_t handle)
>  void put_pkvm_hyp_vm(struct pkvm_hyp_vm *hyp_vm)
>  {
>         hyp_spin_lock(&vm_table_lock);
> -       hyp_page_ref_dec(hyp_virt_to_page(hyp_vm));
> +       pkvm_hyp_vm_ref_dec(hyp_vm);
>         hyp_spin_unlock(&vm_table_lock);
>  }
>
> @@ -966,7 +966,7 @@ static struct pkvm_hyp_vm *get_pkvm_unref_hyp_vm_locked(pkvm_handle_t handle)
>         hyp_assert_lock_held(&vm_table_lock);
>
>         hyp_vm = get_vm_by_handle(handle);
> -       if (!hyp_vm || hyp_page_count(hyp_vm))
> +       if (!hyp_vm || hyp_vm->refcount)
>                 return NULL;
>
>         return hyp_vm;
> --
> 2.55.0.rc2.803.g1fd1e6609c-goog
>

