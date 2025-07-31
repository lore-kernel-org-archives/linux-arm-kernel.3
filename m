Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC226C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 08:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sVpT/rCjQeAh5KIDPEhyQ+wKLpTK8xJK+YrwTKpUU6g=; b=G9VAc9JutG4+jaRaXHoYCGTR+s
	0XRlnuA+Lu8pVsvfs9Rb3oGzEOzvpxaodxiFr/jg2m/D13rzMLLvGq/sRYNuBYRNuV52e9Ubu4wzB
	xKAEDENC4KcwpVBsCs8/cyjVFeg3FEuqbGLPs8ZOA6TDUI3wm9CuWDYbdiI91SWCBp6jucMB1tDcc
	CWgOOOgOpv1Ju70vZlrD5QPeUNC3nH/yEpopvzPaJoqogY681UtLO+15dVnik0XTC4sO9C2a7JMSk
	Bevv/3YEzaIab1oeQ3zPJQ1QSVRPC2wQimknxcy/LNP+EPM7HzTzweVdm30DHXlFl2w0NywVgDQZB
	BZDfzLpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhOdY-000000039rg-2wN9;
	Thu, 31 Jul 2025 08:27:40 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhOLf-0000000383n-071Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 08:09:12 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-4ab3ad4c61fso274511cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 01:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753949350; x=1754554150; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sVpT/rCjQeAh5KIDPEhyQ+wKLpTK8xJK+YrwTKpUU6g=;
        b=C3xMsIipO3sh1G1eTXRm0G9ySciHMkiXrQU5m4wdOZp75MCeciVQSTTexI05H2ZPTT
         6R5QAEdB8+ze6PqL2guTdueDGcsSbnwiXzJa+FHIWkQnL6hms+KIBR68Amv9ua+s3TX1
         X3f2r4FOdzzAoD6JNW6gtE5/BFc5gPheFc8DCDXt4oeGu9xgnreMTsH8u3Zx765Ket8L
         ZDRXhXtb6s34ZgoEenKFgpto39ZS95EWxjd7SwhZp9SGlXWFblHMhY5eP0ivgeSntwff
         7o3jC8JDekaHV2fWVH1UIV/ynnD0tebf9iKQbupf9Ay+jrgIWh0NjoT4o5L32vdXPnub
         ODAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753949350; x=1754554150;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sVpT/rCjQeAh5KIDPEhyQ+wKLpTK8xJK+YrwTKpUU6g=;
        b=RwQjh2kS5zADlTeU5iVhADG6bKCFDFtUfNMvF26vviw2T47wCsmTx6y2UEYQ9H5lu1
         kZuKrQan1d40HvZuLXWmOpGcYqv+ZX9C8QKmW76sgA+aDNr9Cze65Ug5E4MI4pHEOKEW
         SebIHwT6VStneXgjnei0Mw15Yg0BWQT7wmuKFB4ui2ztJ252Pelsh6Vw9a16aevN+UIj
         H/owi2s21n13qKNhveUUiSXMwohp8qp4dAndWrMmrjqgl/IYBxiAhf4qjvmY1ptqQYbA
         JxsrPk3Hb4Mzzfg/RTKWvAVgvrRF2WMvFvC6CTnBYYOFQ/d6qEt+IYXGoqqrBOpDCiP2
         h2eg==
X-Forwarded-Encrypted: i=1; AJvYcCWowzAvVMKo5lwlsHDuwJHeVgxOs4gOK15paBzZiyoKjfLwhxl6/p2EvJktANciCk60Cs3zep9EsBoNLLbarel+@lists.infradead.org
X-Gm-Message-State: AOJu0Yw56NH8+rlqUzpMfSiINieY8DptCzhW6aQYaDE4m+Iv3eZg0vR6
	0kMsmS3c3xZxnL4fa4+8dgJ1yzRfVrBp31oed2Y5ioJ1L6L6uPaI4xa3y+J0VulaU/YCTRYZywR
	W3i6uw7Q3Qs894QHWZFJ+P15JrGDHLBZfTO3gWGFX+KF4wMyOwrRg0/5+CC+rSw==
X-Gm-Gg: ASbGncvdluLGLgFfbTN94wlgJgZN/6vJwUr/EthO3PSmBboF6gGAoMSRKYdLYlGI8Rd
	bzhB85P3Z2VZcHptcnxljafR454tuXE1hSfyEVPpsUXgyvlCa4DG268rtHkv2CAC4ZS16GWH51e
	upW/SHjjoYwbBxlzHwvP7arLbDuLIcQg0T6a2Wq91UkBpsjl0lVYuKFJ3kSrIHb1245gPjVSNE+
	KTtYS8=
X-Google-Smtp-Source: AGHT+IGrOVcMpMBT75FdKmxNn0PIJ5gM9b3irx1KceuhF9jVkzaF5hxH8j7i6+oG0xfsaxYdfsfyN79teagnN0ObxVs=
X-Received: by 2002:ac8:5a0b:0:b0:4aa:c3f9:99a7 with SMTP id
 d75a77b69052e-4aeeff4d635mr2252941cf.20.1753949349819; Thu, 31 Jul 2025
 01:09:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250729225455.670324-1-seanjc@google.com> <20250729225455.670324-3-seanjc@google.com>
In-Reply-To: <20250729225455.670324-3-seanjc@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 31 Jul 2025 09:08:33 +0100
X-Gm-Features: Ac12FXzXuU8fZ8KWH4QzSncdpqMTYPr50tdZb-JZxmCnm--xfHOVid80C_5YEog
Message-ID: <CA+EHjTx7OF2i4MvviAXQq0v6+a7T4SMU0PGsObDBo98Y6zvrBQ@mail.gmail.com>
Subject: Re: [PATCH v17 02/24] KVM: x86: Have all vendor neutral sub-configs
 depend on KVM_X86, not just KVM
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Gavin Shan <gshan@redhat.com>, Shivank Garg <shivankg@amd.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, David Hildenbrand <david@redhat.com>, 
	Ackerley Tng <ackerleytng@google.com>, Tao Chan <chentao@kylinos.cn>, 
	James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_010911_068779_9D29D79E 
X-CRM114-Status: GOOD (  23.52  )
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

On Tue, 29 Jul 2025 at 23:55, Sean Christopherson <seanjc@google.com> wrote:
>
> Make all vendor neutral KVM x86 configs depend on KVM_X86, not just KVM,
> i.e. gate them on at least one vendor module being enabled and thus on
> kvm.ko actually being built.  Depending on just KVM allows the user to
> select the configs even though they won't actually take effect, and more
> importantly, makes it all too easy to create unmet dependencies.  E.g.
> KVM_GENERIC_PRIVATE_MEM can't be selected by KVM_SW_PROTECTED_VM, because
> the KVM_GENERIC_MMU_NOTIFIER dependency is select by KVM_X86.
>
> Hiding all sub-configs when neither KVM_AMD nor KVM_INTEL is selected also
> helps communicate to the user that nothing "interesting" is going on, e.g.
>
>   --- Virtualization
>   <M>   Kernel-based Virtual Machine (KVM) support
>   < >   KVM for Intel (and compatible) processors support
>   < >   KVM for AMD processors support
>
> Fixes: ea4290d77bda ("KVM: x86: leave kvm.ko out of the build if no vendor module is requested")
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---


Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

>  arch/x86/kvm/Kconfig | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
> index 2c86673155c9..9895fc3cd901 100644
> --- a/arch/x86/kvm/Kconfig
> +++ b/arch/x86/kvm/Kconfig
> @@ -74,7 +74,7 @@ config KVM_WERROR
>         # FRAME_WARN, i.e. KVM_WERROR=y with KASAN=y requires special tuning.
>         # Building KVM with -Werror and KASAN is still doable via enabling
>         # the kernel-wide WERROR=y.
> -       depends on KVM && ((EXPERT && !KASAN) || WERROR)
> +       depends on KVM_X86 && ((EXPERT && !KASAN) || WERROR)
>         help
>           Add -Werror to the build flags for KVM.
>
> @@ -83,7 +83,7 @@ config KVM_WERROR
>  config KVM_SW_PROTECTED_VM
>         bool "Enable support for KVM software-protected VMs"
>         depends on EXPERT
> -       depends on KVM && X86_64
> +       depends on KVM_X86 && X86_64
>         help
>           Enable support for KVM software-protected VMs.  Currently, software-
>           protected VMs are purely a development and testing vehicle for
> @@ -169,7 +169,7 @@ config KVM_AMD_SEV
>  config KVM_IOAPIC
>         bool "I/O APIC, PIC, and PIT emulation"
>         default y
> -       depends on KVM
> +       depends on KVM_X86
>         help
>           Provides support for KVM to emulate an I/O APIC, PIC, and PIT, i.e.
>           for full in-kernel APIC emulation.
> @@ -179,7 +179,7 @@ config KVM_IOAPIC
>  config KVM_SMM
>         bool "System Management Mode emulation"
>         default y
> -       depends on KVM
> +       depends on KVM_X86
>         help
>           Provides support for KVM to emulate System Management Mode (SMM)
>           in virtual machines.  This can be used by the virtual machine
> @@ -189,7 +189,7 @@ config KVM_SMM
>
>  config KVM_HYPERV
>         bool "Support for Microsoft Hyper-V emulation"
> -       depends on KVM
> +       depends on KVM_X86
>         default y
>         help
>           Provides KVM support for emulating Microsoft Hyper-V.  This allows KVM
> @@ -203,7 +203,7 @@ config KVM_HYPERV
>
>  config KVM_XEN
>         bool "Support for Xen hypercall interface"
> -       depends on KVM
> +       depends on KVM_X86
>         help
>           Provides KVM support for the hosting Xen HVM guests and
>           passing Xen hypercalls to userspace.
> @@ -213,7 +213,7 @@ config KVM_XEN
>  config KVM_PROVE_MMU
>         bool "Prove KVM MMU correctness"
>         depends on DEBUG_KERNEL
> -       depends on KVM
> +       depends on KVM_X86
>         depends on EXPERT
>         help
>           Enables runtime assertions in KVM's MMU that are too costly to enable
> @@ -228,7 +228,7 @@ config KVM_EXTERNAL_WRITE_TRACKING
>
>  config KVM_MAX_NR_VCPUS
>         int "Maximum number of vCPUs per KVM guest"
> -       depends on KVM
> +       depends on KVM_X86
>         range 1024 4096
>         default 4096 if MAXSMP
>         default 1024
> --
> 2.50.1.552.g942d659e1b-goog
>

