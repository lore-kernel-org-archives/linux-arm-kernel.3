Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3CECC3ABB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 21:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZjfhxP1aTkCqZKrd23sK3YHNUgKYVqxJbIVvYWHW5Vg=; b=i3QMJFjgyZ13b3tWtP2XrhuM9Y
	PUgH/qA1PJfJXFd3OGt+ZL5UcZUakXHDdM5TgMEkXjzEUfFIoFhYpYWpF4x8HK5WUhzcXkafveRhd
	569lCExL38XN9V/lK1zerBQW0hVSCsnLdWSvmDU8BYQEGKt7p6a+rK8vBVB/QCEY0skJXk9Rmmgjy
	pUcExij6g/0NbC4ekhZHB8+ztGoXgic4t/Tr4j469cmq7P/vue0gD2mIIpvGc8vFtSGvaCCMoJtEO
	4iu5vN9wi0JBnjChiDccGyDz3KdtCeulLJF51CEmVbF1Fi9sMG7/58oE6TT9ebKAOYDFJIMQuhTKa
	CbxWTHcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAxZf-000000031r1-43yD;
	Fri, 02 May 2025 21:05:35 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAxRc-000000030wM-3hBy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 20:57:18 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-af9564001cbso1598154a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 13:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746219435; x=1746824235; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZjfhxP1aTkCqZKrd23sK3YHNUgKYVqxJbIVvYWHW5Vg=;
        b=CCO0UPAPEcW1FhpcdnqRa/5QVFCgirASa6Jiwx4U9bD+Vp3KjzJHRXyCHT2n/it0Mb
         r6nI1POCp3MEP/XmbhiUMxa7MWUyZ5o5Eo5+J1n7rFFEwTKuscqdNmEOa9R/ugI8XG9b
         N1JIV6e/PEd6Xui6QqpZWOIf+pgAmQMGSKopXrX0Wph015simffST1YfhI8QILPUFseu
         +jau8kiCVA9TnGeQA74LFT8b1DedWRtsv80TY4GxmjT+YlzI9JAJPVTzvylZr6eOntgU
         q5hbDR73pKU+Xn3fprfCU5ecG/aVVAVY040rQAl+uhAcrr9zxGZH+Fs/sJP2P6f2os0L
         9T9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746219435; x=1746824235;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZjfhxP1aTkCqZKrd23sK3YHNUgKYVqxJbIVvYWHW5Vg=;
        b=qkXEBPxB0PUNx0ajODpTfCEqc+xreBK8o9MAS32NqQTqQ6PCVqf8POd6BzIoK7RAc6
         dTMEPssIYs8f6EkfmlZ9QtDs+BK7k0Lg0ztWOd1AgHL3r3lUbPfcepZ8imfalM5kVJbV
         ztznZhcOm52wBEDd+lWNHq+szi+fCiC3+hCzHUjS8cxK200JlDRnI5XAzXCP6dLkOByh
         CuilWIBgOTDyEs5ta24zinZapmXhARRWLuOSdM0CMlTB9OYej1u/Q3TiTrm6TgaeceeM
         oVcKlTOjXrmf4V2xZsFTg4yzrjLeQjaO4IAEtvt05S+39fYUnlyNrl8jW0xbI1ojRl+J
         H3IA==
X-Forwarded-Encrypted: i=1; AJvYcCVOcCa3VHb+5CBD7SFIMZC4uv/bHmW4V7swNJdp72VjiuYqwjQHETySSJpNj4ba2LmMcQf5F5lZjxJK11BRIZ42@lists.infradead.org
X-Gm-Message-State: AOJu0YwjPGVP+N23v7H91zlvMuWa41IDOzSZeuxp/qBi7TFJXJoTtVjs
	PE4L6MDrnMzgrCyNFCpmhgGE/sM1d9RjYQCoNF2f/3PE7OEmk5Vt7vxnie1QHg89KVw5YhGQ46y
	8Zw==
X-Google-Smtp-Source: AGHT+IFuPDTKjcdWvbnOJrt3XOUZC4A4co+KVYAa4VIdQzxs3SS2Bb249oxqj85YoS9Ls6YyYG5MsQtlc4s=
X-Received: from pjbqb9.prod.google.com ([2002:a17:90b:2809:b0:2f5:63a:4513])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2f0e:b0:2ff:618c:a1e0
 with SMTP id 98e67ed59e1d1-30a4e6b2624mr6211245a91.29.1746219435414; Fri, 02
 May 2025 13:57:15 -0700 (PDT)
Date: Fri, 2 May 2025 13:57:13 -0700
In-Reply-To: <20250430203013.366479-6-mlevitsk@redhat.com>
Mime-Version: 1.0
References: <20250430203013.366479-1-mlevitsk@redhat.com> <20250430203013.366479-6-mlevitsk@redhat.com>
Message-ID: <aBUxqZ6qgfYZLsye@google.com>
Subject: Re: [PATCH v4 5/5] x86: KVM: SEV: implement kvm_lock_all_vcpus and
 use it
From: Sean Christopherson <seanjc@google.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Cc: kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Kunkun Jiang <jiangkunkun@huawei.com>, Waiman Long <longman@redhat.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Borislav Petkov <bp@alien8.de>, Albert Ou <aou@eecs.berkeley.edu>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexander Potapenko <glider@google.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Andre Przywara <andre.przywara@arm.com>, x86@kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, kvm-riscv@lists.infradead.org, 
	Atish Patra <atishp@atishpatra.org>, Ingo Molnar <mingo@redhat.com>, 
	Jing Zhang <jingzhangos@google.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, kvmarm@lists.linux.dev, 
	Will Deacon <will@kernel.org>, Keisuke Nishimura <keisuke.nishimura@inria.fr>, 
	Sebastian Ott <sebott@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Shusen Li <lishusen2@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Marc Zyngier <maz@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_135716_916195_7C14F979 
X-CRM114-Status: GOOD (  16.58  )
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

On Wed, Apr 30, 2025, Maxim Levitsky wrote:
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 834f08dfa24c..9211b07b0565 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -1392,6 +1392,31 @@ int kvm_trylock_all_vcpus(struct kvm *kvm)
>  }
>  EXPORT_SYMBOL_GPL(kvm_trylock_all_vcpus);
>  
> +/*
> + * Lock all of the VM's vCPUs.
> + * Assumes that the kvm->lock is held.

Add a lockdep assertion instead of a comment.

> + * Returns -EINTR if the process is killed.
> + */
> +int kvm_lock_all_vcpus(struct kvm *kvm)
> +{
> +	struct kvm_vcpu *vcpu;
> +	unsigned long i, j;
> +
> +	kvm_for_each_vcpu(i, vcpu, kvm)

Needs curly braces.

> +		if (mutex_lock_killable_nest_lock(&vcpu->mutex, &kvm->lock))

I'd rather return mutex_lock_killable_nest_lock()'s error code verbatim.  Then
the function comment can go away, because the only thing remaining would be:

	/*
	 * Lock all of the VM's vCPUs.
	 /*

and that should be completely self-explanatory.  E.g.

int kvm_lock_all_vcpus(struct kvm *kvm)
{
	struct kvm_vcpu *vcpu;
	unsigned long i, j;
	int r;

	lockdep_assert_held(&kvm->lock);

	kvm_for_each_vcpu(i, vcpu, kvm) {
		r = mutex_lock_killable_nest_lock(&vcpu->mutex, &kvm->lock);
		if (r)
			goto out_unlock;
	}
	return 0;

out_unlock:
	kvm_for_each_vcpu(j, vcpu, kvm) {
		if (i == j)
			break;
		mutex_unlock(&vcpu->mutex);
	}
	return r;
}
EXPORT_SYMBOL_GPL(kvm_lock_all_vcpus);

