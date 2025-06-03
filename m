Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D70C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 20:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=xqk6Ae+AoodqjhacwdxkSu1Yb8TCbPjMAbFosVWhG+Q=; b=zgt55KyHJK0h05
	RTZzILT4V+WyXaN8rbm19uBxGsJxKt1ORtmtaPOPsgHzTkDY3NiUAIKQGVDWu0jIEWmmOcst6X1P6
	yvNL/idUq/k4ERt5fGTCO1vZi2gs5jrAGsl6OCJ11ygdljesnHyy/fckMy6dbkNDhcaGahuz7mP23
	XhkQU0zrMYb52f77S5fY8Q8TJCkPh+ZPiC4CS3uhvZrhaHkVzw/46qBlQP7aZNOUEiTjkWXhaOMwQ
	l4nirVZj8yOT5HaUTA4noP47ztj6aKZug0GjZ5Sf7l/AMxOrMy06XMoVPpIsflrW2J4QgRsfwQv6c
	wUDpwAzdTa3NAr2puW9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMYaw-0000000BoWY-40Qn;
	Tue, 03 Jun 2025 20:50:50 +0000
Received: from mail-il1-x14a.google.com ([2607:f8b0:4864:20::14a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMYYl-0000000Bo7g-2QZn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 20:48:36 +0000
Received: by mail-il1-x14a.google.com with SMTP id e9e14a558f8ab-3ddb4ed2dcbso33654345ab.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 13:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748983714; x=1749588514; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xqk6Ae+AoodqjhacwdxkSu1Yb8TCbPjMAbFosVWhG+Q=;
        b=IuPyrH600ol4DqYikXP0X4wTY/WPXuSx6lQWnzsCy7Dxm11QDdpV85wzZdj/x7NfXE
         IzwkS01Cfoa8FyHYA14lovPTlv70w7J8jP9DIdeG7vNajmNJPJ57j604RcHvIxmqmQLx
         KafaAN6Nlo4U2Xi9gA9uC/uhrg9XVYKhMrZL0YjlNyxNGczxeSYR9jhKAUIlm47RqJWh
         ks/59i1RXtCDF4EiGzy4NqBL7hQtX1Vb4iUl/uPG1jWd/xEOMEZejg/g/IJlu4Qrikqh
         RDzLDJVoWuYmtfNvvHx2SOHXo+u9Rq83TOqG3Pm34+7wxDYHMe4Ar+/SaQsNrXYL5cf7
         JgBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748983714; x=1749588514;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xqk6Ae+AoodqjhacwdxkSu1Yb8TCbPjMAbFosVWhG+Q=;
        b=Y38JVsrn7EtaMFnB+tMPWCxq5txj6CfBP9/rjFRj6mDox497EX3GBjj1yAOIBoAH03
         UcXuqkxaU7MadNLUad/CctfuAO2nkKbRtchbBcGPdPIx9kb6wimTyQFWJn+oVxRSRMhW
         4MEfE3ApJVgcJmuy7XL738sNCwrvS/HWX0uFt4UFAm26QDac28qzcHZk3QyPN90OxXj1
         nROb7IkbAoruyddUA6G1LC/yzF2JC5I9n7VNjHAVPztd7XcEhDGR7JLs4wFOjMnxjjXw
         gO5gH9jRQfNjYSe5jeEG/TiUgyjBhZI2x2F0oessnrA4ZLKcx3MvjAPrj/F2w27xYmD+
         hwWg==
X-Forwarded-Encrypted: i=1; AJvYcCWJFoiRX2Njon9a6JH4koB24jsY1lzCKiAuYkdGMSN48SzPtNki2ffHn7KmAth0O62VrmyITE1UDSNfdau1Jouv@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2QlzWKdq4RpHkO2M/HMNKFs738MFRayV733Bi/+z9+q/8iyl8
	yqI0JB07HmwrGNV3c1qbFbznsn3dmnG8Dx8SAOjo6LVnFPvF3OAunxwxPEQ3UbeCoi4iagbV6aG
	s1S6n1OKzpARbCRw7DSHXaizRYw==
X-Google-Smtp-Source: AGHT+IH++9MIP5okdS2+/trmd8V6fLN6bmZyUPwJNgnr4Lv2JKgei2gsZjCTP6Pc/H1zIhLn0nH3fYC4XYFcP1PDwQ==
X-Received: from ilbbz4.prod.google.com ([2002:a05:6e02:2684:b0:3dd:b9c7:8f2f])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:260c:b0:3dd:89b0:8e1b with SMTP id e9e14a558f8ab-3ddbed8aa48mr5481105ab.15.1748983713821;
 Tue, 03 Jun 2025 13:48:33 -0700 (PDT)
Date: Tue, 03 Jun 2025 20:48:32 +0000
In-Reply-To: <aD4a1T7ZmBLNunxi@google.com> (message from Sean Christopherson
 on Mon, 2 Jun 2025 14:42:45 -0700)
Mime-Version: 1.0
Message-ID: <gsnta56o361r.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH 04/17] KVM: arm64: Cleanup PMU includes
From: Colton Lewis <coltonlewis@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com, 
	shuah@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_134835_621787_E587F34D 
X-CRM114-Status: GOOD (  18.13  )
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

Sean Christopherson <seanjc@google.com> writes:

> On Mon, Jun 02, 2025, Colton Lewis wrote:
>> * Delete kvm/arm_pmu.h. These functions are mostly internal to KVM and
>>    should go in asm/kvm_host.h.

> Ha!  I'm a hair too late, as usual.  I _just_ resurrected a patch[*] to  
> move and
> rename all of the <kvm/arm_xxx.h> headers to <asm/kvm_xxx.h>.  If only I  
> had
> posted on Friday when they were ready :-)

Great minds think alike :) (In this case the other one was Marc)

> It's a relatively small series (mostly arm64 code movement), but it does  
> touch
> all architectures due to giving the same treatment to kvm/iodev.h (and  
> purging
> include/kvm entirely).

> Any preference/thoughts on how to proceed?  My stuff obviously isn't  
> urgent since
> I sat on the patches for almost two years.  On the other hand, the almost  
> pure
> code movement would be a nice precursor to this patch, e.g. move and  
> rename to
> asm/kvm_pmu.h before extracting chunks of code into asm/kvm_host.h.

Letting the rename go first is fine and won't inconveneince me. I'm
expecting this series to take a while to be accepted and Oliver told me
I'll probably need a reroll to make my context switching lazy. Thanks
for asking.

> [*]  
> https://lore.kernel.org/all/20230916003118.2540661-15-seanjc@google.com


> Diff stats for context:
> ---
> Anish Ghulati (1):
>    KVM: arm64: Move arm_{psci,hypercalls}.h to an internal KVM path

> Sean Christopherson (7):
>    KVM: arm64: Include KVM headers to get forward declarations
>    KVM: arm64: Move ARM specific headers in include/kvm to arch directory
>    KVM: Move include/kvm/iodev.h to include/linux as kvm_iodev.h
>    KVM: MIPS: Stop adding virt/kvm to the arch include path
>    KVM: PPC: Stop adding virt/kvm to the arch include path
>    KVM: s390: Stop adding virt/kvm to the arch include path
>    KVM: Standardize include paths across all architectures

>   MAINTAINERS                                                | 1 -
>   .../arm64/include/asm/kvm_arch_timer.h                     | 2 ++
>   arch/arm64/include/asm/kvm_host.h                          | 7 +++----
>   include/kvm/arm_pmu.h => arch/arm64/include/asm/kvm_pmu.h  | 2 ++
>   .../kvm/arm_vgic.h => arch/arm64/include/asm/kvm_vgic.h    | 2 +-
>   arch/arm64/kvm/Makefile                                    | 2 --
>   arch/arm64/kvm/arch_timer.c                                | 5 ++---
>   arch/arm64/kvm/arm.c                                       | 6 +++---
>   {include => arch/arm64}/kvm/arm_hypercalls.h               | 0
>   {include => arch/arm64}/kvm/arm_psci.h                     | 0
>   arch/arm64/kvm/guest.c                                     | 2 +-
>   arch/arm64/kvm/handle_exit.c                               | 2 +-
>   arch/arm64/kvm/hyp/Makefile                                | 6 +++---
>   arch/arm64/kvm/hyp/include/hyp/switch.h                    | 4 ++--
>   arch/arm64/kvm/hyp/nvhe/switch.c                           | 4 ++--
>   arch/arm64/kvm/hyp/vhe/switch.c                            | 4 ++--
>   arch/arm64/kvm/hypercalls.c                                | 4 ++--
>   arch/arm64/kvm/pmu-emul.c                                  | 4 ++--
>   arch/arm64/kvm/psci.c                                      | 4 ++--
>   arch/arm64/kvm/pvtime.c                                    | 2 +-
>   arch/arm64/kvm/reset.c                                     | 3 +--
>   arch/arm64/kvm/trace_arm.h                                 | 2 +-
>   arch/arm64/kvm/trng.c                                      | 2 +-
>   arch/arm64/kvm/vgic/vgic-debug.c                           | 2 +-
>   arch/arm64/kvm/vgic/vgic-init.c                            | 2 +-
>   arch/arm64/kvm/vgic/vgic-irqfd.c                           | 2 +-
>   arch/arm64/kvm/vgic/vgic-kvm-device.c                      | 2 +-
>   arch/arm64/kvm/vgic/vgic-mmio-v2.c                         | 4 ++--
>   arch/arm64/kvm/vgic/vgic-mmio-v3.c                         | 4 ++--
>   arch/arm64/kvm/vgic/vgic-mmio.c                            | 6 +++---
>   arch/arm64/kvm/vgic/vgic-v2.c                              | 2 +-
>   arch/arm64/kvm/vgic/vgic-v3-nested.c                       | 3 +--
>   arch/arm64/kvm/vgic/vgic-v3.c                              | 2 +-
>   arch/loongarch/include/asm/kvm_eiointc.h                   | 2 +-
>   arch/loongarch/include/asm/kvm_ipi.h                       | 2 +-
>   arch/loongarch/include/asm/kvm_pch_pic.h                   | 2 +-
>   arch/mips/include/asm/kvm_host.h                           | 3 +--
>   arch/mips/kvm/Makefile                                     | 2 --
>   arch/powerpc/kvm/Makefile                                  | 2 --
>   arch/powerpc/kvm/mpic.c                                    | 2 +-
>   arch/riscv/kvm/Makefile                                    | 2 --
>   arch/riscv/kvm/aia_aplic.c                                 | 2 +-
>   arch/riscv/kvm/aia_imsic.c                                 | 2 +-
>   arch/s390/kvm/Makefile                                     | 2 --
>   arch/x86/kvm/Makefile                                      | 1 -
>   arch/x86/kvm/i8254.h                                       | 2 +-
>   arch/x86/kvm/ioapic.h                                      | 2 +-
>   arch/x86/kvm/irq.h                                         | 2 +-
>   arch/x86/kvm/lapic.h                                       | 2 +-
>   include/{kvm/iodev.h => linux/kvm_iodev.h}                 | 0
>   virt/kvm/Makefile.kvm                                      | 2 ++
>   virt/kvm/coalesced_mmio.c                                  | 3 +--
>   virt/kvm/eventfd.c                                         | 2 +-
>   virt/kvm/kvm_main.c                                        | 3 +--
>   54 files changed, 64 insertions(+), 77 deletions(-)
>   rename include/kvm/arm_arch_timer.h =>  
> arch/arm64/include/asm/kvm_arch_timer.h (98%)
>   rename include/kvm/arm_pmu.h => arch/arm64/include/asm/kvm_pmu.h (99%)
>   rename include/kvm/arm_vgic.h => arch/arm64/include/asm/kvm_vgic.h (99%)
>   rename {include => arch/arm64}/kvm/arm_hypercalls.h (100%)
>   rename {include => arch/arm64}/kvm/arm_psci.h (100%)
>   rename include/{kvm/iodev.h => linux/kvm_iodev.h} (100%)


> base-commit: 45eb29140e68ffe8e93a5471006858a018480a45
> --

