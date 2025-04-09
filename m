Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE2FC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 14:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8sFG62uIhWcCDnsK+TitF7g9YvTTNhbdnhc8bS11xU=; b=YoKxth8GRBCR4l9yQHjgDK1z5x
	CrJbpGlftp8m3Tle7IG+hyDr0LJCacFBZ/YbL6jEaCjMUkPCAOE1oji4GT2VV8qEAYnXwg0X7ITU7
	siCL9/3Yv22+8JU8TrV3+OYK+YCJ8cdP6pVOJ3K9crLpliFjZJ0bb+LirExvJrs8uMTIwNGuWL8NL
	V8thajVLaSFHYbgp2ql5yzwvBN4MW+PtZc5KWe/+shRk+1xAmDJE2/8BwfrOnS1nKLE422lqBph8d
	cRcZU9l829pqnG8xtRqbRYduA+X0MXA71xuBfWJXkzsOEdjffkh/4RskkWCCNcSiyHi019Ucf1aZl
	jlaqftgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2WZP-00000007UIF-2rLA;
	Wed, 09 Apr 2025 14:38:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Vlx-00000007LSf-09dd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 13:47:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744206438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C8sFG62uIhWcCDnsK+TitF7g9YvTTNhbdnhc8bS11xU=;
	b=gDyA5YtgAXPqyKBAdnNS+zLSHt3uM1sygaf5tMiifSvEt9eFYxa6aGoQliGzlZFtVt0LaP
	nLXiAOht+4wxse13aqE56zU0+tCLxIi6lQu+47Fn6ToZoPVfFW2OMiAoax4dbCwhK5TZXW
	BY/3Qg5gtPxa/Jrtt/hn243g+b0oCdc=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-S3GbPJRKMlmqEFYdgQwoVQ-1; Wed, 09 Apr 2025 09:47:17 -0400
X-MC-Unique: S3GbPJRKMlmqEFYdgQwoVQ-1
X-Mimecast-MFC-AGG-ID: S3GbPJRKMlmqEFYdgQwoVQ_1744206436
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d4423d0c49so62983715ab.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 06:47:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744206436; x=1744811236;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C8sFG62uIhWcCDnsK+TitF7g9YvTTNhbdnhc8bS11xU=;
        b=PmdVHBSGCxC5t13XASmYi3swxe1qnmXY6MYJ1RuEvOsItv16sYS9IhdwF791V3hfMq
         NW843ro5xv3yjTmXl8sG8lFXvF6eAAC9VAEZ+Wow/QqHMxqaOPYtHHL6ZY4dsptRA+aw
         8o4G+weGsvj8YLlg8Bm5BR3JvWX7gVp0FJ+Yjgo1+3lFVg2UiOZLuX1pke81w2APvjoN
         91dNdWnJMJZD6pqaBqLcbr/Hl+2+jFahybEkFWtvf6H0Bek6owU5fEa1u/O0r1to7/Iy
         c5pVuVfmEpDxiS1OHMQELODSNxTUr25w0z5iD32lWeIbeUgdajb3MGrg8ZezLdw5WEv2
         2BBg==
X-Forwarded-Encrypted: i=1; AJvYcCVJwb/RGXXfmS1VKdfEVeVDnbA7IgiyJUwu4k0q3R8MspGwQu6munPkjpesbvzKJRz6HlJHkSlqwWLvTU5lrdw6@lists.infradead.org
X-Gm-Message-State: AOJu0YxPZLrmJw+N7Y6UzbfcJyiQwsMXfW30dLbvccWH8fI8brvlW555
	MctVEBHDVMtVcPQbfTDSdq8xpE8b9UK531NqVlzOU53vgUkutDHjcefPcSNT8w9tOxutyjqKAPl
	7AKk95Tj7AtL7DWYCHuwnBacbJibzNo4MwUYkMyPvzlZzwJ8XSwnr3KHH19ZFJUxDBm07nkLq
X-Gm-Gg: ASbGncsm3SUhE1NFI0eUWDT7izXOfwSaabVAwlvebynAKwAqTsHpsjlaRGDKAgv0ZK/
	glJiccGXDHuOCzjohIdPavLQ4QG/aQK8d19Ii1eiQOF1bvZoewbctZVmrUQ16TPPBYoNdLsdMKQ
	kgyF0FAubvy3ypPJ6rYguDTC3uSEGbaNug7fB5FZNDj8inU9c0X+2pTbAPbDJjV9WzowMX6Vv1q
	yTdtiBehmdmRSiG3Z13I5b2nF7rgroO5joI+7t8xefcdqEHvgE5Nyq6mohbJfTUft8wajyH1oRx
	CTRqYFcVxD8RPcwKDM+eH2aDWZyJFP1UDlU3iLEd+f0u14ZTFOkhs10VCg==
X-Received: by 2002:a05:6e02:1c0e:b0:3d5:dec0:7c03 with SMTP id e9e14a558f8ab-3d77c27fb00mr27400595ab.12.1744206436337;
        Wed, 09 Apr 2025 06:47:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGY11cU0INBe/qnf4e7hQqyG5TAgNSTBjToXX6S3PDZH7tI5Cb3FdlfnkGTFvFeZrlBBTdq0A==
X-Received: by 2002:a05:6e02:1c0e:b0:3d5:dec0:7c03 with SMTP id e9e14a558f8ab-3d77c27fb00mr27400065ab.12.1744206435834;
        Wed, 09 Apr 2025 06:47:15 -0700 (PDT)
Received: from ?IPV6:2601:188:c100:5710:315f:57b3:b997:5fca? ([2601:188:c100:5710:315f:57b3:b997:5fca])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d7dba85487sm2698105ab.23.2025.04.09.06.47.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 06:47:15 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <b0fe0707-faae-4e0b-b873-9a80e39471fc@redhat.com>
Date: Wed, 9 Apr 2025 09:47:11 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] KVM: x86: move sev_lock/unlock_vcpus_for_migration
 to kvm_main.c
To: Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org
Cc: Alexander Potapenko <glider@google.com>, "H. Peter Anvin"
 <hpa@zytor.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 kvm-riscv@lists.infradead.org, Oliver Upton <oliver.upton@linux.dev>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Jing Zhang <jingzhangos@google.com>, x86@kernel.org,
 Kunkun Jiang <jiangkunkun@huawei.com>, Boqun Feng <boqun.feng@gmail.com>,
 Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
 Zenghui Yu <yuzenghui@huawei.com>, Borislav Petkov <bp@alien8.de>,
 Alexandre Ghiti <alex@ghiti.fr>,
 Keisuke Nishimura <keisuke.nishimura@inria.fr>,
 Sebastian Ott <sebott@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Atish Patra <atishp@atishpatra.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Randy Dunlap <rdunlap@infradead.org>,
 Will Deacon <will@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Andre Przywara <andre.przywara@arm.com>, Thomas Gleixner
 <tglx@linutronix.de>, Sean Christopherson <seanjc@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Bjorn Helgaas <bhelgaas@google.com>
References: <20250409014136.2816971-1-mlevitsk@redhat.com>
 <20250409014136.2816971-3-mlevitsk@redhat.com>
In-Reply-To: <20250409014136.2816971-3-mlevitsk@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: j9reu1a1GXNhp1jnZNZ-kgxm0fWysuPfuRHUAAzq9eI_1744206436
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_064721_160417_5105337D 
X-CRM114-Status: GOOD (  28.50  )
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


On 4/8/25 9:41 PM, Maxim Levitsky wrote:
> Move sev_lock/unlock_vcpus_for_migration to kvm_main and call the
> new functions the kvm_lock_all_vcpus/kvm_unlock_all_vcpus
> and kvm_lock_all_vcpus_nested.
>
> This code allows to lock all vCPUs without triggering lockdep warning
> about reaching MAX_LOCK_DEPTH depth by coercing the lockdep into
> thinking that we release all the locks other than vcpu'0 lock
> immediately after we take them.
>
> No functional change intended.
>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> ---
>   arch/x86/kvm/svm/sev.c   | 65 +++---------------------------------
>   include/linux/kvm_host.h |  6 ++++
>   virt/kvm/kvm_main.c      | 71 ++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 81 insertions(+), 61 deletions(-)
>
> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> index 0bc708ee2788..7adc54b1f741 100644
> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -1889,63 +1889,6 @@ enum sev_migration_role {
>   	SEV_NR_MIGRATION_ROLES,
>   };
>   
> -static int sev_lock_vcpus_for_migration(struct kvm *kvm,
> -					enum sev_migration_role role)
> -{
> -	struct kvm_vcpu *vcpu;
> -	unsigned long i, j;
> -
> -	kvm_for_each_vcpu(i, vcpu, kvm) {
> -		if (mutex_lock_killable_nested(&vcpu->mutex, role))
> -			goto out_unlock;
> -
> -#ifdef CONFIG_PROVE_LOCKING
> -		if (!i)
> -			/*
> -			 * Reset the role to one that avoids colliding with
> -			 * the role used for the first vcpu mutex.
> -			 */
> -			role = SEV_NR_MIGRATION_ROLES;
> -		else
> -			mutex_release(&vcpu->mutex.dep_map, _THIS_IP_);
> -#endif
> -	}
> -
> -	return 0;
> -
> -out_unlock:
> -
> -	kvm_for_each_vcpu(j, vcpu, kvm) {
> -		if (i == j)
> -			break;
> -
> -#ifdef CONFIG_PROVE_LOCKING
> -		if (j)
> -			mutex_acquire(&vcpu->mutex.dep_map, role, 0, _THIS_IP_);
> -#endif
> -
> -		mutex_unlock(&vcpu->mutex);
> -	}
> -	return -EINTR;
> -}
> -
> -static void sev_unlock_vcpus_for_migration(struct kvm *kvm)
> -{
> -	struct kvm_vcpu *vcpu;
> -	unsigned long i;
> -	bool first = true;
> -
> -	kvm_for_each_vcpu(i, vcpu, kvm) {
> -		if (first)
> -			first = false;
> -		else
> -			mutex_acquire(&vcpu->mutex.dep_map,
> -				      SEV_NR_MIGRATION_ROLES, 0, _THIS_IP_);
> -
> -		mutex_unlock(&vcpu->mutex);
> -	}
> -}
> -
>   static void sev_migrate_from(struct kvm *dst_kvm, struct kvm *src_kvm)
>   {
>   	struct kvm_sev_info *dst = to_kvm_sev_info(dst_kvm);
> @@ -2083,10 +2026,10 @@ int sev_vm_move_enc_context_from(struct kvm *kvm, unsigned int source_fd)
>   		charged = true;
>   	}
>   
> -	ret = sev_lock_vcpus_for_migration(kvm, SEV_MIGRATION_SOURCE);
> +	ret = kvm_lock_all_vcpus_nested(kvm, false, SEV_MIGRATION_SOURCE);
>   	if (ret)
>   		goto out_dst_cgroup;
> -	ret = sev_lock_vcpus_for_migration(source_kvm, SEV_MIGRATION_TARGET);
> +	ret = kvm_lock_all_vcpus_nested(source_kvm, false, SEV_MIGRATION_TARGET);
>   	if (ret)
>   		goto out_dst_vcpu;
>   
> @@ -2100,9 +2043,9 @@ int sev_vm_move_enc_context_from(struct kvm *kvm, unsigned int source_fd)
>   	ret = 0;
>   
>   out_source_vcpu:
> -	sev_unlock_vcpus_for_migration(source_kvm);
> +	kvm_unlock_all_vcpus(source_kvm);
>   out_dst_vcpu:
> -	sev_unlock_vcpus_for_migration(kvm);
> +	kvm_unlock_all_vcpus(kvm);
>   out_dst_cgroup:
>   	/* Operates on the source on success, on the destination on failure.  */
>   	if (charged)
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 1dedc421b3e3..30cf28bf5c80 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1015,6 +1015,12 @@ static inline struct kvm_vcpu *kvm_get_vcpu_by_id(struct kvm *kvm, int id)
>   
>   void kvm_destroy_vcpus(struct kvm *kvm);
>   
> +int kvm_lock_all_vcpus_nested(struct kvm *kvm, bool trylock, unsigned int role);
> +void kvm_unlock_all_vcpus(struct kvm *kvm);
> +
> +#define kvm_lock_all_vcpus(kvm, trylock) \
> +	kvm_lock_all_vcpus_nested(kvm, trylock, 0)
> +
>   void vcpu_load(struct kvm_vcpu *vcpu);
>   void vcpu_put(struct kvm_vcpu *vcpu);
>   
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 69782df3617f..71c0d8c35b4b 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -1368,6 +1368,77 @@ static int kvm_vm_release(struct inode *inode, struct file *filp)
>   	return 0;
>   }
>   
> +
> +/*
> + * Lock all VM vCPUs.
> + * Can be used nested (to lock vCPUS of two VMs for example)
> + */
> +int kvm_lock_all_vcpus_nested(struct kvm *kvm, bool trylock, unsigned int role)
> +{
> +	struct kvm_vcpu *vcpu;
> +	unsigned long i, j;
> +
> +	lockdep_assert_held(&kvm->lock);
> +
> +	kvm_for_each_vcpu(i, vcpu, kvm) {
> +
> +		if (trylock && !mutex_trylock_nested(&vcpu->mutex, role))
> +			goto out_unlock;
> +		else if (!trylock && mutex_lock_killable_nested(&vcpu->mutex, role))
> +			goto out_unlock;
> +
> +#ifdef CONFIG_PROVE_LOCKING
> +		if (!i)
> +			/*
> +			 * Reset the role to one that avoids colliding with
> +			 * the role used for the first vcpu mutex.
> +			 */
> +			role = MAX_LOCK_DEPTH - 1;
> +		else
> +			mutex_release(&vcpu->mutex.dep_map, _THIS_IP_);
> +#endif

Lockdep supports up to 8 subclasses, but MAX_LOCK_DEPTH is 48. I believe 
it is OK to add a mutex_trylock_nested(), but can you just use 0 and 1 
for the subclasses?

Cheers,
Longman


