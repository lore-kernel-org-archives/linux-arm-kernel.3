Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95A7E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 08:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A7YTWU7uGdtLnWP4r+MAELOvdX8ajEJVx12lX99dfLw=; b=KVwDpLN9dI6S7/7DkuW01f1JK+
	wdNzjOP970ZxbHQHn7VWNVBRN+tp2JcBd6CEjV2aeRdeSKD2iGkfzvcFxuyjFMYDidWHxiZKfn9FW
	JWRlutdMdMhaO1P87E+RdItBMHwQ3pyPrBNt5igaorsp27rW7+4zENcdl8fUIdEiLDI7B9wFfgaUx
	Mxaf7LIuri+bbcZuvgos5AUQncasE882dsOqU/2bGfKcjq0V+QYJ0WSHJ1Y/upb8UEpy/4/uc45ek
	K6tCA1hMGXwhojvVpACjr14uElElt6IhUaSWBYyPGMh2X2BZ3uAOTm204sucdO2GdSTtR/8r6LJSN
	go73LV4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTPS-0000000CnyV-219Y;
	Tue, 17 Dec 2024 08:58:30 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTGB-0000000ClZC-2TeK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 08:48:56 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43622893c3cso26695e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 00:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734425334; x=1735030134; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A7YTWU7uGdtLnWP4r+MAELOvdX8ajEJVx12lX99dfLw=;
        b=dZdPrMNbNce2MV4dJrxxXgzyF1KJFyJeDYP721x13gBen2y6OjkXZrwxBlaRidb+k+
         WLBDH70pt5lomdtKZT/TpYpDPEbSLXIMGTMNIOena2quAq0NXzLv/n/3Y1+umhn7TFY/
         HOcRdc7iHOgvhEcEAbG69vuY0tdlHwCXRFg6+gVEQXddXI+ecu64BFi0488Wtc9SZKMX
         muOFX0vp8a8q8vh2ADmW0wwV8h1V8MQ5hUacKnnXOryUqkiRqRF7P+l/ma3jiGr1lGow
         rkzLRk1E3Uk668GLmW8A+AWpbcSkVyA6/WQJRtWfz9+9DCrWQv4n398m8AfGzJ0H09gk
         x9fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734425334; x=1735030134;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A7YTWU7uGdtLnWP4r+MAELOvdX8ajEJVx12lX99dfLw=;
        b=eWhih0YLTm+RetVmKrnE3cqfQnksJPJsDy+rTA1qEbHQEco71fbCeU3Weq+gcVdT4n
         ebTxFGfdLDDEorD8mA/zzpjAgwyBhOqXKJLTywJMNh9BCjVWxQGtkFO7sb9BRmGeKd5e
         cKpj743Ypi4/Qy5CwPy/+3XGHDPpLJ4+EoN2YL+/irxdWDThncLDdM3OF4G0Ug8RXtlB
         esI+NxhTeuCXTPgTFgpS/xMmu4qo6zvo302bG3XyyAu4mKgcvzf6Bstnla2v3NYvZZKp
         zsnQnRn6Gu0pSSPKqFl2qr/oa9rXDmylYlEXFIw+QfPeBJBMgjRCMHmg3Jj5yYLZHc5/
         i8Gw==
X-Forwarded-Encrypted: i=1; AJvYcCXUfl8luWJ4dW8nTgEbzOTcTqalxi4Sruc1iuFZT+Oa8bHe19Dfqz+gl/uu4f+WUmgg1zceLI+Tmrqs6A3J6OKo@lists.infradead.org
X-Gm-Message-State: AOJu0YxeE3OoA/ywsMHfiqfPyjVKCXxf5tuHGSrbhjL131Y2fAikXAbA
	bdsKTdI1JADU71VthWGCFlVU1aTt5U3culLYXdvotVkIqtn8kLqMXJIu5YFqkFL+0XpxImnY1xi
	7YIbigtleRSkUlbMwSYGKkNWEGEh2DXDDMxvL
X-Gm-Gg: ASbGncvVZ1KnhRNKRGIm8bfmd6S/Ch8r5eQMWLdyJ3xmzchuX/pW916BPmyw/E32SEB
	LkRkqzJadiEj4ZwczHyR8EZr8f+monawdqNJLLhS0m1INZPZFVTvZJD8pzQvhixR2Cmo=
X-Google-Smtp-Source: AGHT+IFQVMhJyuBvpWnirFZOzp1TjeSx17Y5DE8/Tuu+aAN9FtjNwt0anC94607YgOtJmmmQzWkBb3MnulFBgA2MdLk=
X-Received: by 2002:a05:600c:5741:b0:436:1811:a79c with SMTP id
 5b1f17b1804b1-4364ad4db33mr735615e9.5.1734425333713; Tue, 17 Dec 2024
 00:48:53 -0800 (PST)
MIME-Version: 1.0
References: <20241216175803.2716565-1-qperret@google.com> <20241216175803.2716565-9-qperret@google.com>
In-Reply-To: <20241216175803.2716565-9-qperret@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Dec 2024 08:48:17 +0000
Message-ID: <CA+EHjTxd5euMqYrq510kgqvON1JdGmjhE4ROFuMwTR1pgwLD9w@mail.gmail.com>
Subject: Re: [PATCH v3 08/18] KVM: arm64: Add {get,put}_pkvm_hyp_vm() helpers
To: Quentin Perret <qperret@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_004855_633438_6046E62A 
X-CRM114-Status: GOOD (  17.41  )
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

On Mon, 16 Dec 2024 at 17:58, Quentin Perret <qperret@google.com> wrote:
>
> In preparation for accessing pkvm_hyp_vm structures at EL2 in a context
> where we can't always expect a vCPU to be loaded (e.g. MMU notifiers),
> introduce get/put helpers to get temporary references to hyp VMs from
> any context.
>
> Signed-off-by: Quentin Perret <qperret@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  3 +++
>  arch/arm64/kvm/hyp/nvhe/pkvm.c         | 20 ++++++++++++++++++++
>  2 files changed, 23 insertions(+)
>
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> index 24a9a8330d19..f361d8b91930 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> @@ -70,4 +70,7 @@ struct pkvm_hyp_vcpu *pkvm_load_hyp_vcpu(pkvm_handle_t handle,
>                                          unsigned int vcpu_idx);
>  void pkvm_put_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu);
>
> +struct pkvm_hyp_vm *get_pkvm_hyp_vm(pkvm_handle_t handle);
> +void put_pkvm_hyp_vm(struct pkvm_hyp_vm *hyp_vm);
> +
>  #endif /* __ARM64_KVM_NVHE_PKVM_H__ */
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index 071993c16de8..d46a02e24e4a 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -327,6 +327,26 @@ void pkvm_put_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
>         hyp_spin_unlock(&vm_table_lock);
>  }
>
> +struct pkvm_hyp_vm *get_pkvm_hyp_vm(pkvm_handle_t handle)
> +{
> +       struct pkvm_hyp_vm *hyp_vm;
> +
> +       hyp_spin_lock(&vm_table_lock);
> +       hyp_vm = get_vm_by_handle(handle);
> +       if (hyp_vm)
> +               hyp_page_ref_inc(hyp_virt_to_page(hyp_vm));
> +       hyp_spin_unlock(&vm_table_lock);
> +
> +       return hyp_vm;
> +}
> +
> +void put_pkvm_hyp_vm(struct pkvm_hyp_vm *hyp_vm)
> +{
> +       hyp_spin_lock(&vm_table_lock);
> +       hyp_page_ref_dec(hyp_virt_to_page(hyp_vm));
> +       hyp_spin_unlock(&vm_table_lock);
> +}
> +
>  static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struct kvm *host_kvm)
>  {
>         struct kvm *kvm = &hyp_vm->kvm;
> --
> 2.47.1.613.gc27f4b7a9f-goog
>

