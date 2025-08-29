Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F0FDCA1001
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AVbLrwfcaMKrZbEzaIUXHMFK+4ezBC1s3sCq6svjQiA=; b=0m7LcRKuyLsOzQWGtsrX4s0blF
	K+V99q+8+9YpJub1YzAVUF8yJtqfoiwc+OJ+rHuhcVtef6JbbydllJKhwJ4crad/lkkx7yn8N17ok
	dVf5JqZoHBVNo3KorzbhKeGovZbzbrDfe/uVPEDBLY475hS6+xRGuKsAp3iuW4d0ZViJTVoT8AIOv
	KjoCXu/Dh08dEeFy/jJa9uWtbgb0Ick6Ik2Kumo1724/9fpqRnJ+DS5sQMhm9/wrnf9B/sg9TbvAe
	/WaLaU/2Mrt+B8/NKAfTnCY9Q+HJLGIs5A2FqZpBeD1P/wZx7eyoHL/RryTHurK9hZvVJacMTzH7G
	FFRl5gbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9oL-00000007CID-2nBg;
	Sat, 30 Aug 2025 00:51:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us60W-00000006rKg-3f67
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 29 Aug 2025 20:47:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=AVbLrwfcaMKrZbEzaIUXHMFK+4ezBC1s3sCq6svjQiA=; b=lB6JsMOhXKmt0yF6aGoHsuYVUq
	Jui/4CUm1/ugm0QxePiryvOjYGcr/LwrSJcDIp7iLCq4aOoRW8XVjex/6iBtJ4gkl/Te6xcO9Q6FC
	D4myk7gOhPbcAW/rixsSAPY+XS2sNcxKDAeSyjzkNLUlyi0NDtW6zzwYR7ZAN0AwsGXhYtjBnDbbd
	QoJ9slOeBE8AnyLNBwgTKTdk4P2sKPuXXiGfjbP3sn3f3YJXAKVw9reidsA+BV8hNYPH8QpjQjOv3
	KFckcyMbyaNK96sTWPariKpJz1UDiHgAva5G9/4cvmIqCRE29WcWvLa+co62LBZzAGhLLo4y1GGDc
	83xuK+QQ==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us60R-00000003JLQ-1OWL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 20:47:34 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-327d1fea06eso1716357a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 13:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756500447; x=1757105247; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AVbLrwfcaMKrZbEzaIUXHMFK+4ezBC1s3sCq6svjQiA=;
        b=ZQAo+tQwf7ICQLSSaOjLPJr1Tot82AWHpWc8y1ThOXoqmwEdNqXa3T0mcEVcS9SGT3
         lSZGSwBvpqf3BnBY2k/gFO3Z4OXLXGvbFWTpshSQMitLPoi5+okd734EJ9k28wBq++Rf
         +OSfT7oQp6LT3PEJfA6I7oLyKIJgeu8LF65STy899FVn7CnEvHWybsyEHPvWQErdriCc
         rpdAWQM9o1m+o0Cn8BN8SCLjV24V/kkslU1XWizBpYf+6Sc+93q9DITAdgrRHO+9m4Mk
         yNswyVoz6kIgkrPmc85mv3K6EE3kmXBgDnFRyeTmmyF1pfAuPyGgLgspxxwY6wuAiSGz
         3IWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756500447; x=1757105247;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AVbLrwfcaMKrZbEzaIUXHMFK+4ezBC1s3sCq6svjQiA=;
        b=qs/rMRaesayClY4UpiFVh8ofPNKv6+QahH6GWrXQ8HmBkFCj2yb8NivVlKURUNN1bZ
         dimx/rePgJ8Kz2U5HK7N66pLI9M30r72abNpnx6mqtDdnSKX3oPvOZF/9uqKfayL+ZC/
         /UplA2JfCZ6X8la2XpWvtM8XAgwXMpf686ZmhwGcOy/CfXli4fj0+0tSamFtgHOIa3V/
         cUvnA1sF0e2dLp4V5oZSBp3SfAGZIsM0KTmR/rPHNcQJ+OGY7r7mHF/yu+bi8RZcUCxL
         msO4Y+J2ZLQCtmVvE6X+m5kYv9XmVE9tIttQ509s/XC4/ZKKZiupoD+iwqHVURjQA0qI
         GL8g==
X-Forwarded-Encrypted: i=1; AJvYcCULfjSwu8ik1rqL9j6L6P/RCXoQPvtVTc6ZDPRbQmc3gG3YSHfb3oXV3KzhXhTV3C+jhESF8kOiO6myJpS0meNA@lists.infradead.org
X-Gm-Message-State: AOJu0YyhQtXmDEmpmQPQdfd/dt7566oNlPdAqJRX6FnFwZKDCNGJayQd
	4i4/HtJS/um+LU32MLeGUzEl7jGJzeQy/KHfqj4hLZ20pMdAe2Qpnc4XdiPwfYDRsnE4mGpMELZ
	oeol0bw==
X-Google-Smtp-Source: AGHT+IEEqHXHhC1dOfepFQ4McJBotwArzkUulxIcLhYJ/fKtpfgV5WqeosCA+M558p3CNkr7r/wGr0do/qg=
X-Received: from pjbli2.prod.google.com ([2002:a17:90b:48c2:b0:31f:2a78:943])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3889:b0:327:b30d:9b7f
 with SMTP id 98e67ed59e1d1-327b30d9cdbmr12852743a91.12.1756500446915; Fri, 29
 Aug 2025 13:47:26 -0700 (PDT)
Date: Fri, 29 Aug 2025 13:47:25 -0700
In-Reply-To: <20250829-pmu_event_info-v5-6-9dca26139a33@rivosinc.com>
Mime-Version: 1.0
References: <20250829-pmu_event_info-v5-0-9dca26139a33@rivosinc.com> <20250829-pmu_event_info-v5-6-9dca26139a33@rivosinc.com>
Message-ID: <aLIR3deQPxVI2VrE@google.com>
Subject: Re: [PATCH v5 6/9] KVM: Add a helper function to check if a gpa is in
 writable memselot
From: Sean Christopherson <seanjc@google.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_214732_633374_8CFC1FE7 
X-CRM114-Status: GOOD (  23.62  )
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

On Fri, Aug 29, 2025, Atish Patra wrote:
> The arch specific code may need to know if a particular gpa is valid and
> writable for the shared memory between the host and the guest. Currently,
> there are few places where it is used in RISC-V implementation. Given the
> nature of the function it may be used for other architectures.
> Hence, a common helper function is added.
> 
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  include/linux/kvm_host.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 15656b7fba6c..eec5cbbcb4b3 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1892,6 +1892,14 @@ static inline bool kvm_is_gpa_in_memslot(struct kvm *kvm, gpa_t gpa)
>  	return !kvm_is_error_hva(hva);
>  }
>  
> +static inline bool kvm_is_gpa_in_writable_memslot(struct kvm *kvm, gpa_t gpa)
> +{
> +	bool writable;
> +	unsigned long hva = gfn_to_hva_prot(kvm, gpa_to_gfn(gpa), &writable);
> +
> +	return !kvm_is_error_hva(hva) && writable;

I don't hate this API, but I don't love it either.  Because knowing that the
_memslot_ is writable doesn't mean all that much.  E.g. in this usage:

	hva = kvm_vcpu_gfn_to_hva_prot(vcpu, shmem >> PAGE_SHIFT, &writable);
	if (kvm_is_error_hva(hva) || !writable)
		return SBI_ERR_INVALID_ADDRESS;

	ret = kvm_vcpu_write_guest(vcpu, shmem, &zero_sta, sizeof(zero_sta));
	if (ret)
		return SBI_ERR_FAILURE;

the error code returned to the guest will be different if the memslot is read-only
versus if the VMA is read-only (or not even mapped!).  Unless every read-only
memslot is explicitly communicated as such to the guest, I don't see how the guest
can *know* that a memslot is read-only, so returning INVALID_ADDRESS in that case
but not when the underlying VMA isn't writable seems odd.

It's also entirely possible the memslot could be replaced with a read-only memslot
after the check, or vice versa, i.e. become writable after being rejected.  Is it
*really* a problem to return FAILURE if the guest attempts to setup steal-time in
a read-only memslot?  I.e. why not do this and call it good?

	if (!kvm_is_gpa_in_memslot(vcpu->kvm, shmem >> PAGE_SHIFT))
		return SBI_ERR_INVALID_ADDRESS;

	ret = kvm_vcpu_write_guest(vcpu, shmem, &zero_sta, sizeof(zero_sta));
	if (ret)
		return SBI_ERR_FAILURE;

