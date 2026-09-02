Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D7F9C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 00:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FaTmFFkWvtpI1wxK9lbUH5Q49TqxcdmMs9wtskLlSB4=; b=poM4Hsqb2XvEICgsMW6tYbhfRZ
	4KLfuXmZNVcP8qDLB0OnuTw5RVM7g/E8VjLWyWB9kddYjSc7t6BFELZ/s+gto4KjmvXIscYnOVIdx
	jAVFtrsCku8cnqAWyEcgSt0lutC2kcAALlX/fIMZ3dRGZTQhN7aTS224Z7hF5lWV1zXV1jNMHQF2N
	5B1XZEkoSKyU+kNOQQvyb8SYHLwBsUfw90lQQdsCJ28vxkvlKAG1NpcigbbH2ocuW1wCQDLJOK0KC
	7Qa0FZRx8Aao9VTfOyYD3NfXNOaM+Qubsp2AtSlhawVD4qdfPIDe+lxBTbHRDyi1VAkm9eQAagZuB
	dPxG1RNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Z0E-0000000Dafs-26pX;
	Wed, 02 Sep 2026 00:38:58 +0000
Received: from mail-pl1-x647.google.com ([2607:f8b0:4864:20::647])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Z0C-0000000DafV-05NX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 00:38:57 +0000
Received: by mail-pl1-x647.google.com with SMTP id d9443c01a7336-2d6f80c76e6so6440725ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 17:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788309534; x=1788914334; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FaTmFFkWvtpI1wxK9lbUH5Q49TqxcdmMs9wtskLlSB4=;
        b=GDlBmLmFd9zKUYI6ESZlRU47LCkhklO1k/R/jDXM1HhM94rAmlyxJdMKt+Hi8FScDV
         PPtxDyBvHJ4PmjypZ1mIJksHLjzd/b/EBvemIyRz0aHma3OgvLYFpieh158y22//FlZ6
         a/ibJh2Duj70afxDRHza+lMmrSZqaqawTOgCOiMjrYd7kcwFUipcaqfCdn6vJeXyUJCX
         jxsdrv/fDkBco+s1Ru4tQO8P6I8p5J5zJkt3XeGvBk71yLp+IydCdh1Djed7eaT9Eqzk
         2kVvq89Qi2tQqqh1+ndcE8KapqisT2MNblK/y5DexdFsMob+e8V0QxsFA0m0nqHMzcdJ
         AtZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788309534; x=1788914334;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FaTmFFkWvtpI1wxK9lbUH5Q49TqxcdmMs9wtskLlSB4=;
        b=LVF68sCk5AuASFBMH8RbVkCGlXR6YS2El5me/ZzS19lu6yXVaqNXybdriUfyZGfl5D
         yxUVjLi6fVRdwRBXarDzOXIX0+rbGV/Ora+RXYtQjd0sk5wCaKnECuwPuqOqAWak89xW
         cgCad21AKn11tPEze0CcQyJj0xj1mzaC4d60+Tig95NKe+WeSYUBsBVYH4s3cRZH1oMl
         Kg/4+D7wjNY6wrUyahDxvNkAbeDFkIIyibkKYqU63DAGzOSQPSc0AtJfGq/zVEFn7Ei1
         Dh9iJus4i/60M5+TmwC22CZ2COZUqurZD46aMh9Cr/WGFXdUtnrlvnNQo5amsxHVxyCP
         RnEg==
X-Forwarded-Encrypted: i=1; AKwUvBzvPMbwFPXWJhCkjlGB2FfOpnAx27RDpPKn6jzFhkw6x3kApCKfRY7M37EW0bfnt9jWMkKzdA5jAMp7iovOzP93@lists.infradead.org
X-Gm-Message-State: AFuF++kqwRoC0zrUH4nywoe73Py5laQDfbfSWty/jLunC8tsnZQxlTYT
	ZbyxQ+vXmo4nxyYyGmpu3aTQcpKq8GK9YgJdaBfzvBEyUE4fLe2vQSq3AnlZjaqVwX7kv5dj/9d
	bEZj0FA==
X-Received: from plgf7.prod.google.com ([2002:a17:902:ce87:b0:2cc:6063:a658])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:26c6:b0:2d8:d4cc:be67
 with SMTP id d9443c01a7336-2daec73f1d2mr14199535ad.20.1788309534336; Tue, 01
 Sep 2026 17:38:54 -0700 (PDT)
Date: Tue, 1 Sep 2026 17:38:53 -0700
In-Reply-To: <20260831144802.834315-4-seiden@linux.ibm.com>
Mime-Version: 1.0
References: <20260831144802.834315-1-seiden@linux.ibm.com> <20260831144802.834315-4-seiden@linux.ibm.com>
Message-ID: <apdwHcdy2iYRTrww@google.com>
Subject: Re: [PATCH v7 03/23] KVM: Allow KVM implementations to switch off
 MMIO independent of Kconfig
From: Sean Christopherson <seanjc@google.com>
To: Steffen Eiden <seiden@linux.ibm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andreas Grapentin <gra@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@kernel.org>, 
	Friedrich Welter <fritz@linux.ibm.com>, Fuad Tabba <tabba@google.com>, 
	Gautam Gala <ggala@linux.ibm.com>, Hariharan Mari <hari55@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Hendrik Brueckner <brueckner@linux.ibm.com>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Marc Zyngier <maz@kernel.org>, Nico Boehr <nrb@linux.ibm.com>, 
	Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>, Oliver Upton <oupton@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Ulrich Weigand <Ulrich.Weigand@de.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_173856_061321_2D2AECA1 
X-CRM114-Status: GOOD (  11.79  )
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

On Mon, Aug 31, 2026, Steffen Eiden wrote:
> Only defining KVM_MMIO is not flexible enough for multi-KVM systems
> where one KVM implements MMIO but others do not. Solve this by
> additionally testing for the non-existence of KVM_NO_MMIO before
> including MMIO code to KVM.

Ewwwww.  IIUC, s390 ends up with two KVM modules, i.e. there really are two different
KVMs being built.  Rather than have a KVM_MMIO and NO_KVM_MMIO, I vote very
strongly to drop CONFIG_KVM_MMIO entirely and replace it with __KVM_HAVE_ARCH_MMIO,
a la __KVM_HAVE_ARCH_VM_FREE and others.  Tracking two separate macros is going
to be annoying to maintain, and will definitely be confusing for non-s390 people.

It'll mean linking in an emtpy coalesced_mmio.o on s390 when building without arm64
support, but I'm guessing that won't be at all common for s390 builds.

