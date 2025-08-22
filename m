Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2726CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 15:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LpW5veLMLPdr6OKMte0tGA4PuK4ym/yIcC2Y9SUMkpQ=; b=hru4b9I2Z3usDS8Xu8c/wzpNbm
	64MC1Fr0PZcBzvRBW1P3X02vnZbABXhE51AKkwv7TmxxFWPDiMacxTG7UrjTHUfd5b7vi+9SE+R2f
	UVHU5QQPb6SDvYkUzdtm2EL7sXipdisRV4n0QTaELdMsis9yOBO93HRGwPvi9DdbYtyueHO8PeTmH
	4pny67K0jaj531Xols8cwlRP15InfxjgRcsWpUBTgWQucjrAQapiXt5XxLgjpoeCnMavkUzcae5NC
	gdUQPkl6N95ErpyE6OHgqWs4lQHVcCXDIsCQCr28a7K0AyrzyJ3PwtTsXFIyYxB7cFJkrASo9hxCn
	Go+bQgCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upThM-0000000316w-3FyJ;
	Fri, 22 Aug 2025 15:29:00 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upP4w-00000002CvB-1NXf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 10:33:04 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-88432dc61d8so172761639f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 03:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1755858781; x=1756463581; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LpW5veLMLPdr6OKMte0tGA4PuK4ym/yIcC2Y9SUMkpQ=;
        b=BQD2VNoaAvRwlQX3l7UcD8bkMlj0S6fJIDz1ZXNrMOIHS52bgvaP411ln1wzIRZFOA
         0EfHRWlpeM/rBiejfKha/l4sJZyy9XPaB6ZIgvRlhcjCKVZFpJevl5nxxtDLgaIymuSc
         xj6Ts0riLERBs19ufFyt7MS8F8s9Xp+JsWOeKy9voYiAVbe0IK9Ek5FY4KsTMe7Lzenk
         6JkzibKqxP9PWie8Q3gVIk/WQ/I22zN+oCDDmruUeJQtNg4QUcASthK6d16UM+FbEzDL
         CFe5cMs3YmfVQARuJCaKG1osmEqyu2iGMM/fvc2pfiKNyv2Pbi5GMfjpJ1To/mRVpWxq
         Qnww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755858781; x=1756463581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LpW5veLMLPdr6OKMte0tGA4PuK4ym/yIcC2Y9SUMkpQ=;
        b=a7hL+iIUHnDh3BtU6uf2Wg/1A3TFwaHuymuN8ioeVMrlxUQ2doODttVq7RO/QViX9X
         0kbzgq8DZ4QaeI0MtGGi5aJOhMGtjn72RK0OZ8xI0xrTZ1gV5YiVoLvRTWg4c7YMJiWp
         D99q569R2gLOuiZBb5zgvzpaYSkwc906Xi4BgfUafsDvvapmxoKl7aaTq1q1So17DEje
         vFxEivE4PIezZPLh7unHaELDasSdE2dSNssGMZmV0S0CD8bkLUlZthwGAWjrUaw6JkF9
         MCc5rRc9RblK5guDikEnqCVaRng6X19lEvrA8ukL/mP/9xobcGd++ZHqvxnb1RWDvdLe
         ZlnA==
X-Forwarded-Encrypted: i=1; AJvYcCU1UlaZgFYKuFF6gatp5TLNVR/SUqfko+nCeM+P4hplPPRC/XDCrJgAaP47kO7ue7emercptXduII3pzFWcjcMx@lists.infradead.org
X-Gm-Message-State: AOJu0YyD8dHMgu8RePPnRdHBGoRD6eUc5VjE9YWXd/OVcem56++Pvzzk
	8lRSrgniClG8UtGXP+PugCGCslCqXyQeg4fhpWe0zk1dBroaX7l58w4aVhYSsF1ZLzlYDbr8U5M
	IVsRp6RqGUMntYulprWgZs1o04gC1YDWikM9Uv5zr1w==
X-Gm-Gg: ASbGncu3c+2GqWOft0aS+Y957tAZWlYUdrb/h+7vSHovpVHxOZp25vemH+cROE1AOau
	g06XJb6cXIgz6a/Z3pfNOFGYUVKAdpLgWT4S5wYPbw8dcyNwqFcwAZE91KAwBKF7pDzVlrkPqj3
	1kJmEAQIuZWMPD5Gx5MB5p/iqlLiMnnM03m6Y3hAdM4YjhHw2ABI6z6/sR02/4SksNIz9jABmXI
	OJMpQng
X-Google-Smtp-Source: AGHT+IFxa3sIYy8GmbrliB9vOURhQsISjHNbjP8q123c5R9HRTAMf+tU9qbPOd1N7VsCfi+G9RwFcCmvT1G6Qpsac28=
X-Received: by 2002:a05:6e02:1607:b0:3e3:fd25:f6a with SMTP id
 e9e14a558f8ab-3e921a5c447mr39155945ab.11.1755858780756; Fri, 22 Aug 2025
 03:33:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com> <20250806195706.1650976-17-seanjc@google.com>
In-Reply-To: <20250806195706.1650976-17-seanjc@google.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 22 Aug 2025 16:02:49 +0530
X-Gm-Features: Ac12FXz94_OmeQku-x70DMZyHIHAiBydPtfIxKmb7IUME7_u-QmNy8EiX87dBF4
Message-ID: <CAAhSdy3Ee1K7kfwFUhdcjoe+c4oi06Tm+Jo7CE2ycqHjuBou-A@mail.gmail.com>
Subject: Re: [PATCH v5 16/44] KVM: Add a simplified wrapper for registering
 perf callbacks
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Xin Li <xin@zytor.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Kan Liang <kan.liang@linux.intel.com>, Yongwei Ma <yongwei.ma@intel.com>, 
	Mingwei Zhang <mizhang@google.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Sandipan Das <sandipan.das@amd.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_033302_574778_11A4B707 
X-CRM114-Status: GOOD (  20.72  )
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

On Thu, Aug 7, 2025 at 1:27=E2=80=AFAM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> Add a parameter-less API for registering perf callbacks in anticipation o=
f
> introducing another x86-only parameter for handling mediated PMU PMIs.
>
> No functional change intended.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

For KVM RISC-V:
Acked-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/arm64/kvm/arm.c      |  2 +-
>  arch/loongarch/kvm/main.c |  2 +-
>  arch/riscv/kvm/main.c     |  2 +-
>  arch/x86/kvm/x86.c        |  2 +-
>  include/linux/kvm_host.h  | 11 +++++++++--
>  virt/kvm/kvm_main.c       |  5 +++--
>  6 files changed, 16 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 888f7c7abf54..6c604b5214f2 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -2328,7 +2328,7 @@ static int __init init_subsystems(void)
>         if (err)
>                 goto out;
>
> -       kvm_register_perf_callbacks(NULL);
> +       kvm_register_perf_callbacks();
>
>  out:
>         if (err)
> diff --git a/arch/loongarch/kvm/main.c b/arch/loongarch/kvm/main.c
> index 80ea63d465b8..f62326fe29fa 100644
> --- a/arch/loongarch/kvm/main.c
> +++ b/arch/loongarch/kvm/main.c
> @@ -394,7 +394,7 @@ static int kvm_loongarch_env_init(void)
>         }
>
>         kvm_init_gcsr_flag();
> -       kvm_register_perf_callbacks(NULL);
> +       kvm_register_perf_callbacks();
>
>         /* Register LoongArch IPI interrupt controller interface. */
>         ret =3D kvm_loongarch_register_ipi_device();
> diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
> index 67c876de74ef..cbe842c2f615 100644
> --- a/arch/riscv/kvm/main.c
> +++ b/arch/riscv/kvm/main.c
> @@ -159,7 +159,7 @@ static int __init riscv_kvm_init(void)
>                 kvm_info("AIA available with %d guest external interrupts=
\n",
>                          kvm_riscv_aia_nr_hgei);
>
> -       kvm_register_perf_callbacks(NULL);
> +       kvm_register_perf_callbacks();
>
>         rc =3D kvm_init(sizeof(struct kvm_vcpu), 0, THIS_MODULE);
>         if (rc) {
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 5af2c5aed0f2..d80bbd5e0859 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -9689,7 +9689,7 @@ int kvm_x86_vendor_init(struct kvm_x86_init_ops *op=
s)
>                 set_hv_tscchange_cb(kvm_hyperv_tsc_notifier);
>  #endif
>
> -       kvm_register_perf_callbacks(ops->handle_intel_pt_intr);
> +       __kvm_register_perf_callbacks(ops->handle_intel_pt_intr, NULL);
>
>         if (IS_ENABLED(CONFIG_KVM_SW_PROTECTED_VM) && tdp_mmu_enabled)
>                 kvm_caps.supported_vm_types |=3D BIT(KVM_X86_SW_PROTECTED=
_VM);
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 15656b7fba6c..20c50eaa0089 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1731,10 +1731,17 @@ static inline bool kvm_arch_intc_initialized(stru=
ct kvm *kvm)
>  #ifdef CONFIG_GUEST_PERF_EVENTS
>  unsigned long kvm_arch_vcpu_get_ip(struct kvm_vcpu *vcpu);
>
> -void kvm_register_perf_callbacks(unsigned int (*pt_intr_handler)(void));
> +void __kvm_register_perf_callbacks(unsigned int (*pt_intr_handler)(void)=
,
> +                                  void (*mediated_pmi_handler)(void));
> +
> +static inline void kvm_register_perf_callbacks(void)
> +{
> +       __kvm_register_perf_callbacks(NULL, NULL);
> +}
> +
>  void kvm_unregister_perf_callbacks(void);
>  #else
> -static inline void kvm_register_perf_callbacks(void *ign) {}
> +static inline void kvm_register_perf_callbacks(void) {}
>  static inline void kvm_unregister_perf_callbacks(void) {}
>  #endif /* CONFIG_GUEST_PERF_EVENTS */
>
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index ecafab2e17d9..d477a7fda0ae 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -6429,10 +6429,11 @@ static struct perf_guest_info_callbacks kvm_guest=
_cbs =3D {
>         .handle_mediated_pmi    =3D NULL,
>  };
>
> -void kvm_register_perf_callbacks(unsigned int (*pt_intr_handler)(void))
> +void __kvm_register_perf_callbacks(unsigned int (*pt_intr_handler)(void)=
,
> +                                  void (*mediated_pmi_handler)(void))
>  {
>         kvm_guest_cbs.handle_intel_pt_intr =3D pt_intr_handler;
> -       kvm_guest_cbs.handle_mediated_pmi =3D NULL;
> +       kvm_guest_cbs.handle_mediated_pmi =3D mediated_pmi_handler;
>
>         perf_register_guest_info_callbacks(&kvm_guest_cbs);
>  }
> --
> 2.50.1.565.gc32cd1483b-goog
>

