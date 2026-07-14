Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38176C44507
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 19:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EBGhEX4vBKM8MPYzbmWcF5BLvWSJh5ejL+Gu8q+yPyk=; b=L2TosDjvuQBh1sxCY6cOXkmKRd
	wq1bIktn030PhXddxgdKYK6CLNyWgzo7kjOpVQwnB8ZJTT7QGaruRkZzG3uF5wx++FkTqEi+XzheY
	y/GN9R4qPc0LQqWSsk6RWMXwe9eUWcfFQ4u+k9XTltx+j4qTgjHAQppYjkU+jpngOn0/buAmblVH2
	7HQuw4WndkomDVI7ZVzA0zFnjUxD5fnZu0oq/tNKG04QumTUzTXFOucfe4DMyppxQ4Pd5xad6M/sC
	u5UoVT+8a/+JZpTglMoz3MpZ0HQx9Mb8rZaKQ4e0YE4I+r9gwMEAxfEouufqDeJf4U0B8XiKzIa3e
	/9Rba9jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjioF-0000000D6Q3-3ZT3;
	Tue, 14 Jul 2026 19:28:51 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjio4-0000000D616-35Be
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 19:28:42 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-848568a6f62so8260755b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 12:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784057319; x=1784662119; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EBGhEX4vBKM8MPYzbmWcF5BLvWSJh5ejL+Gu8q+yPyk=;
        b=LvdzsZh7lcs15RG7kE/EDJktdttj0UdstEOu+K1DKGdFB27KRmxSu2zUszanmkuINx
         bplaajP/43xWtKXoVpf61xcUAEIu5jgylJSwQuc69HMZHZDWeo3rpl0ZKnVIq5H1Yeq2
         2KoMSui+WC2zc5mj5+8zaKL+OUk863CfQdWzSkDVUH3K8awMolbfOD/aX2iMDmzZr38L
         nl1Q3ZzUBEr95y8KJblUZt3V6VQAV70YrfwMyVZW4gVp43DydSREAYYjyzSsfq7QdR8B
         arXAhkC7aVFRcQZjH+tr4FoEdKNya9DObcPc05LA01lMuvdln3Thhc8lC+wx7ozGj8Ku
         SJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784057319; x=1784662119;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EBGhEX4vBKM8MPYzbmWcF5BLvWSJh5ejL+Gu8q+yPyk=;
        b=I6RwedwwhT+J7P1TJC/19mfO8P4Hn7IxohrUYfDpn71E5tkwdIDjzH6hDSVqQw056j
         LTbGPRzA/KAoEf6pSjmCbxkao04hYeiRn8hUOAA8Q7vCPbbFi3srSK/VYz+YCT/vZ8ZR
         YZ+QiiemLnholIlmyNwc9c7FVLBhBuGnCkqRTYDw9+vfPA49rGWNgWZWrl+/veyFcr2e
         yBo6fBWW96jK/5GZkjR5dJf1RfY60qt/Q10sx23hujoJYi8SquxLEZClCB+V5WBGToXe
         yrD9ueExGRoPt/jvorB77gcHgIO8r972pzDrPRfVggbdW3m5KycRr+7AR17mvQtmxUY4
         ufMw==
X-Forwarded-Encrypted: i=1; AHgh+RoGxtNv1wB6KhmgIdotYWLr2wY24SsnU8YFNxgBJOI8f1UeIPBP38n0HvuZSSFv/4g8yxr7iqk2gqz8QeWrBwW6@lists.infradead.org
X-Gm-Message-State: AOJu0YzjVldX/ZvSHBppfqeyM+MBUZVff8xn45GuFGPH4rW4y0KvVjyQ
	fCGchAzC2nrPAxl9wSve3gobFnw6gVHesHy3rXROS1ML1mLnlC81pVTXQZL/rmZTtGrunTFxCpW
	eisUWzw==
X-Received: from pfbfo5.prod.google.com ([2002:a05:6a00:6005:b0:848:40f5:a538])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:c95:b0:848:3fe2:c88b
 with SMTP id d2e1a72fcca58-84a554fa556mr3829342b3a.6.1784057318776; Tue, 14
 Jul 2026 12:28:38 -0700 (PDT)
Date: Tue, 14 Jul 2026 11:41:17 -0700
In-Reply-To: <20260626213534.3866178-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260626213534.3866178-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
Message-ID: <178405411600.3133617.3225227983277758474.b4-ty@google.com>
Subject: Re: [PATCH v8 00/20] KVM: selftests: Add eventfd+VFIO IRQ test
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, 
	Josh Hilke <jrhilke@google.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_122840_897267_B6BA9268 
X-CRM114-Status: GOOD (  11.91  )
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

On Fri, 26 Jun 2026 14:35:13 -0700, Sean Christopherson wrote:
> David and Josh's series to add a selftest for verifying interrupt delivery
> via eventfd (via KVM_IRQFD), and also from a real device, wired up via VFIO.
> 
> Gory details in the patches, and in the v5 cover letter.
> 
> v8:
>  - Explicitly include <time.h>. [Sashiko]
>  - Use iova_allocator instea of hardcoding the IOVA. [Sashiko, David]
>  - Add a comment explaining why DMA needs to be allocated. [David]
>  - Probe /dev/vfio/vfio, not /dev/vfio. [Sashiko, David]
> 
> [...]

Applied to kvm-x86 irq_test, thanks!

[01/20] KVM: selftests: Build and link selftests/vfio/lib into KVM selftests
        https://github.com/kvm-x86/linux/commit/a262fc49e0aa
[02/20] KVM: selftests: Add macros to read/write+sync to/from guest memory
        https://github.com/kvm-x86/linux/commit/ac050f2adcdf
[03/20] KVM: selftests: Rename guest_rng to kvm_rng
        https://github.com/kvm-x86/linux/commit/e0bd29eddf7e
[04/20] KVM: selftests: Initialize the default/global pRNG during kvm_selftest_init()
        https://github.com/kvm-x86/linux/commit/bae85cd758fe
[05/20] KVM: selftests: Seed libc's RNG before using it to generate a seed for KVM's pRNG
        https://github.com/kvm-x86/linux/commit/5506feb24282
[06/20] KVM: selftests: Add helper to generate random u64 in range [min,max]
        https://github.com/kvm-x86/linux/commit/c772591d279e
[07/20] KVM: selftests: Add an irqfd send+receive (and later IRQ bypass) test
        https://github.com/kvm-x86/linux/commit/3ceab37ac973
[08/20] KVM: selftests: Add helper to get host IRQ from device MSI-X for IRQ bypass test
        https://github.com/kvm-x86/linux/commit/362cc0016249
[09/20] KVM: selftests: Add VFIO device support to eventfd IRQ test
        https://github.com/kvm-x86/linux/commit/3902e8b02dce
[10/20] KVM: selftests: Add a helper to set proc IRQ affinity for IRQ test
        https://github.com/kvm-x86/linux/commit/380b0e5e0e30
[11/20] KVM: selftests: Verify interrupts are received when IRQ affinity changes in IRQ test
        https://github.com/kvm-x86/linux/commit/197b0cd9ac66
[12/20] KVM: selftests: Add option to set empty routing between IRQs in eventfd IRQ test
        https://github.com/kvm-x86/linux/commit/ec333e3ace25
[13/20] KVM: selftests: Make number of IRQs configurable in IRQ test
        https://github.com/kvm-x86/linux/commit/38950af64a1c
[14/20] KVM: selftests: Verify non-postable IRQ remapping in IRQ test
        https://github.com/kvm-x86/linux/commit/25e268b76e77
[15/20] KVM: selftests: Add kvm_gettid() wrapper and convert users
        https://github.com/kvm-x86/linux/commit/4512b2776631
[16/20] KVM: selftests: Add kvm_sched_getaffinity() wrapper and convert users
        https://github.com/kvm-x86/linux/commit/76703ca0cbab
[17/20] KVM: selftests: Add a utility to pin a task to a random CPU, given a CPU set
        https://github.com/kvm-x86/linux/commit/26fd1fb4737a
[18/20] KVM: selftests: Verify vCPU migration during IRQ delivery in IRQ test
        https://github.com/kvm-x86/linux/commit/6b9470baea6c
[19/20] KVM: selftests: Make number of vCPUs configurable in IRQ test
        https://github.com/kvm-x86/linux/commit/0315713a1938
[20/20] KVM: selftests: Add xAPIC support in eventfd IRQ test
        https://github.com/kvm-x86/linux/commit/2708ecca4dbd

--
https://github.com/kvm-x86/linux/tree/next

