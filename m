Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C8CC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 02:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iGR21MUMyA/Iej7QErtZc8eyio+Dks1zWhBSbKI/rik=; b=lpEI6fTCypSjMVULMVNLHShGhN
	JTY3IsC2WcAyWajgbMzCKR+n0VRupe+jwSQ3dy4JS1EuAuYISSyGqqFl6nlSoi4wgvuIJffqBJiL0
	zHXV2OPOQdVH/zwTZGgCho7T0w02la20vDi5E8BNDYF5DjYREInlSfL3YQQwNYCNlqdgpD83BO38W
	GXPWUOwv4g5DGZHhO8Ob8fuh/ljZ+gkgqZiVwNV5TgTLwD5t9mXRsPk8ej69yiMRv6ps8IMYFe16r
	xSnoVJuljy82wOfse0Qy7TOARAveMalrwJ8iMm+ygxnNor4zzoJdGp8f+vNHItw6bSvmynroVLarv
	VDF2O3Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUcw-0000000DyhB-3GNv;
	Wed, 07 May 2025 02:35:18 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCS15-0000000Djdc-1nde
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 23:48:04 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ff798e8c3bso5495004a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 16:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746575282; x=1747180082; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iGR21MUMyA/Iej7QErtZc8eyio+Dks1zWhBSbKI/rik=;
        b=YLMCqDcpYYopu/E6FwHCx9aDnxLkS8Rnm0gaP1brbNZdXXAPvMkL5J1kfCqa95e9dP
         1kx6bn7FelW0LOSozTPosxgItO+XLK1j53f0lEAeOkodeT/QeFCKxW7nSdi59yHiGNJo
         lTi1ymOSQQMj9ndu0ECmli00OSPtaXJDUekBCIJRfsAFT5CHaZXkkOA5oAV91jxd0qXI
         P1mU5Q0qTWoYI4dhEswA3R9RtRrueGil0Pt7bgaOgbGTJ8M6Oozto+OYDWb9D6Z4nXOF
         UgDFrORYOsmvp3J33G54Ox9hzp5I4w9VXE9tk0GCI2+ni8ZljAubSqijmQZZiutl+NTj
         jGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746575282; x=1747180082;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iGR21MUMyA/Iej7QErtZc8eyio+Dks1zWhBSbKI/rik=;
        b=Wtq//2eNxtnamNhPs2WGnQKTvBMjvYx/YQbrtm9yjtgFYmvpHG2EmwsVCxPDfqv2Ni
         m0ci/pw24JcJvNDWBabggrlP3Vqp+Dq7Zo/ilqOGuuXmV4CYfP0Kd4X7Z3g62lN2L8Bw
         7FYaThM/jZ60SKpKH01zdY7sXO3pI+1H4yfz0Q8+7qOLxuwKYLuBvQFd8imr89Ekc6LZ
         IQl4djCZumNHO7rutAzQFPVmbowH3I0HV1XHN7A+2g+gJR2GCgaSuTONNah8LN/DxLKi
         lc6dmMYmKb6TOBYiuB5wJMMqbAwiKiB+HxtbrJP/+6fo8YLwUNG1MTAEgzf8B8BlFCzs
         5O0g==
X-Forwarded-Encrypted: i=1; AJvYcCUnw6TfTCFbu1k4emkdVGn/34RP0BJkyg5lTpoFXfFGU645v4NuTYU3o9HuSfxHBFbCqqgEJl7+7foMWSy5A/kk@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8PqIADzfGmNY4WLVSf1Y7wBZgjTfHpzvM32jaiI9cF21p8ly0
	/J+pEU8pKYPFWi8XU8BLaZ+ssEY5FaVg8bckQYJy9y21lS4ZszUBeI9+ANNDyrZwP5gmhuRr7Xb
	0BA==
X-Google-Smtp-Source: AGHT+IEI4VPbZHYscktwEOVP6g5TZOKepWU/P1YF6Ndm56diDY5BXYXdB3X0UtnsxrDOZgtWBFkyQyHQxS4=
X-Received: from pjbsr12.prod.google.com ([2002:a17:90b:4e8c:b0:30a:2095:204b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3e84:b0:2ff:5357:1c7f
 with SMTP id 98e67ed59e1d1-30aac28b3bcmr1863522a91.30.1746575282052; Tue, 06
 May 2025 16:48:02 -0700 (PDT)
Date: Tue, 6 May 2025 16:48:00 -0700
In-Reply-To: <20250109204929.1106563-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20250109204929.1106563-1-jthoughton@google.com>
Message-ID: <aBqfsGtUjBUJudFB@google.com>
Subject: Re: [PATCH v2 00/13] KVM: Introduce KVM Userfault
From: Sean Christopherson <seanjc@google.com>
To: James Houghton <jthoughton@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	Nikita Kalyazin <kalyazin@amazon.com>, Anish Moorthy <amoorthy@google.com>, 
	Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_164803_470817_F6D68C1A 
X-CRM114-Status: GOOD (  12.99  )
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

On Thu, Jan 09, 2025, James Houghton wrote:
> James Houghton (13):
>   KVM: Add KVM_MEM_USERFAULT memslot flag and bitmap
>   KVM: Add KVM_MEMORY_EXIT_FLAG_USERFAULT
>   KVM: Allow late setting of KVM_MEM_USERFAULT on guest_memfd memslot
>   KVM: Advertise KVM_CAP_USERFAULT in KVM_CHECK_EXTENSION

Starting with some series-wide feedback, the granularity of these first few
patches is too fine.  I normally like to split things up, but honestly, this is
such a small feature that I don't see much point in separating the uAPI from the
infrastructure.

To avoid cyclical dependencies between common KVM and arch code, we can do all
the prep, but not fully enable+advertise support on any architecture until all
targeted architectures are fully ready.

In other words, I think we should squish these into one patch, minus this bit at
the very end of the series (spoiler alert):

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index ce7bf5de6d72..0106d6d461a3 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1545,6 +1545,9 @@ static int check_memory_region_flags(struct kvm *kvm,
            !(mem->flags & KVM_MEM_GUEST_MEMFD))
                valid_flags |= KVM_MEM_READONLY;
 
+       if (IS_ENABLED(CONFIG_KVM_GENERIC_PAGE_FAULT))
+               valid_flags |= KVM_MEM_USERFAULT;
+
        if (mem->flags & ~valid_flags)
                return -EINVAL;
 
@@ -4824,6 +4827,9 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
        case KVM_CAP_CHECK_EXTENSION_VM:
        case KVM_CAP_ENABLE_CAP_VM:
        case KVM_CAP_HALT_POLL:
+#ifdef CONFIG_KVM_GENERIC_PAGE_FAULT
+       case KVM_CAP_USERFAULT:
+#endif
                return 1;
 #ifdef CONFIG_KVM_MMIO
        case KVM_CAP_COALESCED_MMIO:

