Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C20EC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 18:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WHKmMEcEYJNjmiM+o7K2OQjNjaHqWv9qs7NUDNHU0tM=; b=QoixhAGIshzRb6jU/PT3rqqcV+
	Q0DCS6F+4f6yQDxHrhmlfxyZv3Ikt6z+pwyvqpTo+NgGcaBQtnpkchjWHaxo1Rg+MCStPsin66qZy
	ElOVU8i5OQr9w2oDiSjmJe0MCBbZeNat7YC2QEt+tsakKMVES7vGNgAWyeGDPP7mceUgXE+loCYGH
	oNK4QsVhJIrRqtCZZHxtmirtJLhNvP7SpWSJ2eyQEl7VPmbjKgEAwWW7s+wSiOHZCw2wirfE9x/CD
	Oiwdq55YqqYuG2l/aJ1RsHLVj1uL1ebpBEYcwj7XkOWubtx1PmklP4VBZFO1hj2ApYOTHbwtAzKp1
	LD4KOM+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU8dT-00000006Xg6-09Se;
	Tue, 24 Jun 2025 18:44:47 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5JP-0000000639t-3hr4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 15:11:53 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-231d13ac4d4so76950025ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 08:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750777910; x=1751382710; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WHKmMEcEYJNjmiM+o7K2OQjNjaHqWv9qs7NUDNHU0tM=;
        b=xB7J67StdSZucEav+/18lUr8EDFRfQUC3bTFYQTQJ7uKdk0kvQTQw7t5tz1QOqi0k5
         sk9Hl/DitQAwNohNmd6N3Awei7UtW9vBA9MlZ4dOVWffvmumZh2lxTHS5CN1PYiDHvTu
         0wOPi8QAePZYCAqHQqkpDFyDTA213STJS2iCsBevkA/FPTcsFhgWqeV5ZpAcoYat3iSC
         ejvBo57k22O7cIu5JEGZkGL3Ya5/EjnbT4W2bXozJIIcbgq611XzeM88eC3LGjkYBZa+
         P76Wz0k6CIQXcAO5t1dC+IaPwGJVKEHM9MsOiaOFnjDLZYrDgMDBO+k1vixSMTeKiU02
         41Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750777910; x=1751382710;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WHKmMEcEYJNjmiM+o7K2OQjNjaHqWv9qs7NUDNHU0tM=;
        b=UCWYYQAghCEH6qRp+wNm3uppPEcJHlr3s7I/UfVvu2IqEvR3wQs3O+dC3YsLAtPkzm
         1w9PMMPSIytsH8WDIx/wq5+iXVHXWODkLp662Zo3A87SxHWjylAdZs+G6DLpA3uAsre5
         o8CbvrU9u2OHc+juqxOkL8A0KYLLi+y2BcfjdsKALtldK5ajS2b07IULgG0SQ0/MYDnh
         9xSBBEeorGfOpHOl/ZgUxrk07kOusOTuTp5OwPtuquPL/3B3ZxRlJa+tRQWVNHLB1oI0
         Xy4RdDy7BF7Qz5j+Q8pqtnkhrXftwj2OiHlQ+lNzaOGN/q/9uTIfyXNSJFItrH7Z0nvG
         kC/Q==
X-Gm-Message-State: AOJu0YyayotUl0YOKotPfe/VaSFHskkNC7BRsaF5/h/o68X+qrflKROt
	TCJVqypM3708ni5Xixof3zPqJA9IMf1aLeY9jOlTfL0QE/WdxTTP/wwuxAlz0UB7JF5tuKlSTPg
	0XfUDIw==
X-Google-Smtp-Source: AGHT+IGIcs7zWWGHBq54IJpoK0NjWgqGqhr9KSussfq3VS+c6BJCA+ru+8d4BCqJ7jSWww4QOGTH7M3EVhE=
X-Received: from plbkr7.prod.google.com ([2002:a17:903:807:b0:234:8ec2:bf02])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f68e:b0:22e:3c2:d477
 with SMTP id d9443c01a7336-237d9917bafmr230431315ad.25.1750777910502; Tue, 24
 Jun 2025 08:11:50 -0700 (PDT)
Date: Tue, 24 Jun 2025 08:11:49 -0700
In-Reply-To: <20250624092256.1105524-4-keirf@google.com>
Mime-Version: 1.0
References: <20250624092256.1105524-1-keirf@google.com> <20250624092256.1105524-4-keirf@google.com>
Message-ID: <aFrANSe6fJOfMpOC@google.com>
Subject: Re: [PATCH 3/3] KVM: Avoid synchronize_srcu() in kvm_io_bus_register_dev()
From: Sean Christopherson <seanjc@google.com>
To: Keir Fraser <keirf@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, Eric Auger <eric.auger@redhat.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Li RongQing <lirongqing@baidu.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_081151_924408_CD107E36 
X-CRM114-Status: GOOD (  19.84  )
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

+Li

On Tue, Jun 24, 2025, Keir Fraser wrote:
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
> index 3bde4fb5c6aa..28a63f1ad314 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -205,6 +205,7 @@ struct kvm_io_range {
>  struct kvm_io_bus {
>  	int dev_count;
>  	int ioeventfd_count;
> +	struct rcu_head rcu;
>  	struct kvm_io_range range[];
>  };
>  
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index eec82775c5bf..b7d4da8ba0b2 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -5924,6 +5924,13 @@ int kvm_io_bus_read(struct kvm_vcpu *vcpu, enum kvm_bus bus_idx, gpa_t addr,
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
> @@ -5962,8 +5969,7 @@ int kvm_io_bus_register_dev(struct kvm *kvm, enum kvm_bus bus_idx, gpa_t addr,
>  	memcpy(new_bus->range + i + 1, bus->range + i,
>  		(bus->dev_count - i) * sizeof(struct kvm_io_range));
>  	rcu_assign_pointer(kvm->buses[bus_idx], new_bus);
> -	synchronize_srcu_expedited(&kvm->srcu);
> -	kfree(bus);
> +	call_srcu(&kvm->srcu, &bus->rcu, __free_bus);

I'm 99% certain this will break ABI.  KVM needs to ensure all readers are guaranteed
to see the new device prior to returning to userspace.  I'm quite confident there
are other flows that rely on the synchronization, the vGIC case is simply the one
that's documented.

https://lore.kernel.org/all/aAkAY40UbqzQNr8m@google.com

