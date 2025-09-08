Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF099CAC58D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+BN9f9TRNhPzZGbZcN/O3Z0X+3jX9IGhyykVuk72IV0=; b=Rzvxalt1vBJHskq6/1WlssL4NP
	jtXGC3qK2f1ay9cvhWLrvrNHwmtCddVw4t8Cux+d9LJNVDxINo4w4nfmZeeu5dM2mCbvW13gDqnyY
	z/A6tX1pNLR+q3Z4pihfOQsUmP1rnbn06CQi4OaT2R704o55o01N2mZEu/EceayPY9CWFN537IGrB
	OxcA52N9FEN40KmxBY2IgHby8GUwdCRCD0OH6VjUNZ9kK06dJhJQDK3Go8/wxEc47L4JI6L/PvQ3p
	j8ybkADkCGTADzWFfBvjcxudBTklMJro1rObF5OQo5pgKaGgilyZblqPTRFQ6G7JfTCFunOKzpCsL
	/9U2gBCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsBT-00000004oav-3X6n;
	Tue, 09 Sep 2025 06:50:31 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvhnI-00000001yVi-46db
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 19:44:54 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-329ee69e7f1so4102970a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 12:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757360692; x=1757965492; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+BN9f9TRNhPzZGbZcN/O3Z0X+3jX9IGhyykVuk72IV0=;
        b=ooHJzkGZ2nXYCruv03KJmuJ2qehC9grYmt+3b/SIIF+d2W6dU3YiH6N5HZEsFE/QSx
         bwW3tvbPSBb1XW5J6rc5KOMqWMlDzxpqgjp8wCRv2fWadiQpV70MRje9dG5q7EmG7yaJ
         yzrs6PJylon46KbF1jjGhYx/bCl5stpSodfyenC0Xj0s+jjddrl55kd/2AXXyyLQpnzc
         IhbHrgBJ+iUX7mW0AJId7esUMOGSw89L9oXoMp2kcXgV2+fiJPe/xoQ67LxqKSsj2W1R
         vK0OG/8GmdOYpm2HT6p3tJjDFOo2jB6nudBxO8z5IFnlvnuTHpvoyIAwL0A1avp77JUz
         Fzxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757360692; x=1757965492;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+BN9f9TRNhPzZGbZcN/O3Z0X+3jX9IGhyykVuk72IV0=;
        b=RPYVfYmknCaQodL+sli1jL5Iai8OEIwDaavxmKfwkfvAraYv3qmYg+2sQijifUdteK
         iGq9TQE5jTApj3iD0PCX7g0ctkKpcH1h8/JZjKD3UdXPNBL5NqI8Z4z8P2yD3v/HaX29
         oP46fr2wrs/mK48ugMaTvI8V7F4sTMJ2iv+OME8LeG3JeHSIvAzDmkZmkNe7X92wFUB3
         7YubieFixzv6wT1Urv2EHPZ3PN1rzK+xiKiUJDxhE4cb3hD/p/Amz8feicVS5IJDKfFX
         7y+fFbbsADoQddA/Hz/H1apqgklTcS/xw506bppdRQAcRsAGBQV2Zk6JHqGK1ad1hLAd
         YWhQ==
X-Gm-Message-State: AOJu0YzOPurAf+jrQ0ODNJFNtswZIcgcjeiG6AL77YjOrH1hJFleH0s6
	iLzUax239zCbikoAYkm+iYjx/zZ/LP5eM7QR2RGRaoTD1Z8m2WxtcbPHwzbNUjCeVhstqDYGcAP
	it/i+qw==
X-Google-Smtp-Source: AGHT+IFxCnWEFD2vXNWgOPEAttN5OOtAqn765A51cfCV4FQPi8e13adf6at6Ei8q1uZLTqO9SeFgLpD0kRY=
X-Received: from pjbsq16.prod.google.com ([2002:a17:90b:5310:b0:329:ccdd:e725])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1dc4:b0:327:e9f4:4dd8
 with SMTP id 98e67ed59e1d1-32d43f2f4b6mr13695527a91.10.1757360691927; Mon, 08
 Sep 2025 12:44:51 -0700 (PDT)
Date: Mon, 8 Sep 2025 12:44:50 -0700
In-Reply-To: <20250819090853.3988626-5-keirf@google.com>
Mime-Version: 1.0
References: <20250819090853.3988626-1-keirf@google.com> <20250819090853.3988626-5-keirf@google.com>
Message-ID: <aL8yMum27Qw_Wkkw@google.com>
Subject: Re: [PATCH v3 4/4] KVM: Avoid synchronize_srcu() in kvm_io_bus_register_dev()
From: Sean Christopherson <seanjc@google.com>
To: Keir Fraser <keirf@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, Eric Auger <eric.auger@redhat.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_124453_015061_87307641 
X-CRM114-Status: GOOD (  20.57  )
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

On Tue, Aug 19, 2025, Keir Fraser wrote:
> Device MMIO registration may happen quite frequently during VM boot,
> and the SRCU synchronization each time has a measurable effect
> on VM startup time. In our experiments it can account for around 25%
> of a VM's startup time.
> 
> Replace the synchronization with a deferred free of the old kvm_io_bus
> structure.
> 
> Signed-off-by: Keir Fraser <keirf@google.com>
> ---
>  include/linux/kvm_host.h |  1 +
>  virt/kvm/kvm_main.c      | 10 ++++++++--
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index e7d6111cf254..103be35caf0d 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -206,6 +206,7 @@ struct kvm_io_range {
>  struct kvm_io_bus {
>  	int dev_count;
>  	int ioeventfd_count;
> +	struct rcu_head rcu;
>  	struct kvm_io_range range[];
>  };
>  
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 4f35ae23ee5a..9144a0b4a268 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -5953,6 +5953,13 @@ int kvm_io_bus_read(struct kvm_vcpu *vcpu, enum kvm_bus bus_idx, gpa_t addr,
>  }
>  EXPORT_SYMBOL_GPL(kvm_io_bus_read);
>  
> +static void __free_bus(struct rcu_head *rcu)
> +{
> +	struct kvm_io_bus *bus = container_of(rcu, struct kvm_io_bus, rcu);
> +
> +	kfree(bus);
> +}
> +
>  int kvm_io_bus_register_dev(struct kvm *kvm, enum kvm_bus bus_idx, gpa_t addr,
>  			    int len, struct kvm_io_device *dev)
>  {
> @@ -5991,8 +5998,7 @@ int kvm_io_bus_register_dev(struct kvm *kvm, enum kvm_bus bus_idx, gpa_t addr,
>  	memcpy(new_bus->range + i + 1, bus->range + i,
>  		(bus->dev_count - i) * sizeof(struct kvm_io_range));
>  	rcu_assign_pointer(kvm->buses[bus_idx], new_bus);
> -	synchronize_srcu_expedited(&kvm->srcu);
> -	kfree(bus);
> +	call_srcu(&kvm->srcu, &bus->rcu, __free_bus);

To address the syzkaller splat, KVM needs to call srcu_barrier() prior to freeing
the structure.

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 9144a0b4a268..62693f18ecf4 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1321,6 +1321,7 @@ static void kvm_destroy_vm(struct kvm *kvm)
                kvm_free_memslots(kvm, &kvm->__memslots[i][1]);
        }
        cleanup_srcu_struct(&kvm->irq_srcu);
+       srcu_barrier(&kvm->srcu);
        cleanup_srcu_struct(&kvm->srcu);
 #ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
        xa_destroy(&kvm->mem_attr_array);

