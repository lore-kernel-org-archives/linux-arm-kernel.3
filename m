Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83965CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 15:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FGzUT7o3snYLzagtZmGzpgj1W1aUepNTYr7YbHmemOE=; b=JyVEBjzBkq7TWIkBfQ3Yy9L/ix
	DhA23D1SDC5ybrYBjFFhXuEecoA3/uFjdVwLkn/VNCYfh1+h/zES9yatNm7q9pqTrX9KcNStd5uxu
	NzqJe8MmRXq7l8h+wy8XKxHrUlWk70dts8whyWZUEwblULFnP8uZfA9TlbU0I0yXr8B9ADSBgPmot
	NYcYZUTFs1vzhD17KIXnqN9wmCuEbBhWSeO20drd++pcOUsoc5ctShTWH4+fM8mXUVbFyovXpIVCZ
	TVgNKabwMDbE12LAvNkC1ll5qsgyD0J2Z/FsG269qge5mrcFZXhRWQT0qZx6IH2rkTcUTtZHqPKaX
	JzShNZiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYmj3-0000000D7kD-35SN;
	Sun, 14 Jun 2026 15:26:17 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYmj0-0000000D7jn-3JYe
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 15:26:16 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-5175d339e8bso644161cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 08:26:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781450773; cv=none;
        d=google.com; s=arc-20240605;
        b=k8KzMUcksvSnsdUq4fdXAlp92+CTTOQ2tkhqXtNtts7Db0GkeCy4zH4jv5h7CbMoR9
         iRkyx89Pees+L7SDlwDQnKvdipohGQ94jHu6AFfbJ3Tytp9qNVXelSvzUBqw38beUylu
         vsPW2OILEzNZUiIpjidfnoqB51C+8xVKJqD11s3sL6nQc4xnT6m2YbwmXSaOrmLbP5IN
         +Bn14DwdvhxXm6LzN3jbH7MvQ8nPks4c+tZgACwseq3lKeLDQWzY2OYK4IFEYMz8S6t3
         5OO7tO3AmimBeIyLFaAoqzSvUqjwzy45jJxe489dbjt/399uu/0nezXWNt5S947zCaVP
         Cs1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FGzUT7o3snYLzagtZmGzpgj1W1aUepNTYr7YbHmemOE=;
        fh=YXcfN4iX3464UNWhoWniTr/Gibp5OUCXniHinmFGX24=;
        b=h1wuXBnybysPjIJW7OASAgq0hcYAUh5mtYWMKDmXbe0++AoZdVpOy7DKyjd0ulEpzI
         2hcrEi19aQNppc+yDwk4njaAZGcD117M0NhriiCltDw7JYAXiQ7cP+3sOSKyN8rpYeda
         11JykN+ccnBTbK29F3SijRc6nF0Y28Qq15VyauTmgBJfuEMNe2G4e+BZvPglVMQb6EVk
         EWtaUw/3UXHPjIq2pwmLBPo1YBUNLwobisozI5W53pIJgBXkUyJovqrTkH9uvfdRKyVK
         /TPix29xc8hcpM5u0DGSjcxTxWrKF27alEwr5gl/boEhZWTtfmzOtqTXOYlEZQhvwZdZ
         1A+w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781450773; x=1782055573; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FGzUT7o3snYLzagtZmGzpgj1W1aUepNTYr7YbHmemOE=;
        b=QFTHQ78LCw+kn46u3UnjRiikk+4HoGlqzvYgpS1P4vMLM2xNQMSjdqbb8P9Yl33A2U
         qCd0xQdLDT8TBdEyD9P4BBwxXq2zfJTvFKPtFewKmg6JvxYZlLy39wKI4OkxaC7sB8YB
         WUap0Imq5njiBx/p/H+4NIjaN8eQPctq4KZKF/Pw461aPuu9gzzEsJm0iM9mLFGs8y+i
         Yd91X2Rg45kDvxlueo+xh0NZXyQYoNjkbZ0PcgBxdn3jmjioMGSTZhzMBo8rKZrhXFEk
         LxSjpgKja2mbc9R8TaP9SeuEcu9vb9jsAGsrBSnT8jfz2waHPlX5e5o2NIR5UYYC01CX
         jPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781450773; x=1782055573;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FGzUT7o3snYLzagtZmGzpgj1W1aUepNTYr7YbHmemOE=;
        b=bsHRn3+lZamN9WsytGamsxtYLMOCpm/yLyo5xBG5l5Tb3/RNu6Tx9FiW01Df3rvrGR
         cWtNbJVwZyRAh+CJQ6v7uESIZysL8EGcy/wdyGAOq/oLVMvInZ7fwHcOjSBA+tOJei+E
         y9B4colqmhIHLyfX3v2GSqAel1gPMwMc/VoFRJYRWxJVA+RQCwxokdW5amgnYTqngJsN
         fMfW8SWufF+swmJLPUO9WG+NXYVTGU1KGyUe87CjtC2ERHKU9CsNwdUrd4g9D4OG990j
         Rhg4k4yvdKp1hxgJdVZIO5am4yNvHCak0pwUFRjvGT5WWVnZaenySDj0kb5dtk/gG1ve
         b2lA==
X-Forwarded-Encrypted: i=1; AFNElJ/25RSN+xkcuJjgimtcnNrTnZ7hP42s1yYElm+gvz2gwk2Y1OsOJUchjtbS4+eCqkll9AdYUqqs/SM3SlVmwwn1@lists.infradead.org
X-Gm-Message-State: AOJu0YzH6osptuMkx7BJMeh4ln5plwrfgRW51BemzvD4UmhiUQSMOzlH
	67Jrs0fI0goELb/4xAOjawQOtfk+1PjFlwG251dDhLsIeDwIrtki/3yBrqCrmF81AXm6hJ2++2e
	/nIfNZ7RYYJeB26nI+A93Ecu8d8yJtSGKtoR5HIWC
X-Gm-Gg: Acq92OF1LbflUaWPS2cmiheFk9G7wcbTdd8b/+Ms7O3xew++JqRS1cEmkJ5SLz5e8Nz
	7a3wCw2qhaLjBjs58fbqlDV9R7ZKuUbxcffsVRJPT1ndgKv523c3o9eJVWaP/KPtokWhZphaAws
	0YVgtmIEJ8NepC2ntVwv1dFXDRDsyaKgHaP2YCFjW17DFsVieQz0+WPP/mpVJhPDLDmaScW8BS7
	SEZGJCZHsLOr/1n5Dm8LJ/eExPNqNhPgse0HP81YtZXt2nJwcMsa72BklMgIPQr4L+UAL8evzMy
	hXpEUOqb
X-Received: by 2002:a05:622a:4c05:b0:516:d570:82c0 with SMTP id
 d75a77b69052e-51955ebe27amr9381711cf.15.1781450772554; Sun, 14 Jun 2026
 08:26:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260612142245.1015744-1-vdonnefort@google.com> <20260612142245.1015744-5-vdonnefort@google.com>
In-Reply-To: <20260612142245.1015744-5-vdonnefort@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Sun, 14 Jun 2026 16:25:00 +0100
X-Gm-Features: AVVi8CdcaS9xeWZgynwMNRE2NQoozlB_AWZbPCepJCXytIRa9g7eAmYSGeF27AM
Message-ID: <CA+EHjTwqp=Hjzyn469Gvm-JRNovfnj=0eFB5+Kei_9pRQrnG0Q@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] KVM: arm64: Add hyp_printk event to nVHE/pKVM hyp
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, rostedt@goodmis.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kernel-team@android.com, qerret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_082614_895825_904D61AA 
X-CRM114-Status: GOOD (  30.12  )
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

Hi Vincent,

On Fri, 12 Jun 2026 at 15:22, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> Create an event to allow developers to log pretty much anything into the
> hypervisor tracing buffer with trace_hyp_printk(), just like the kernel
> tracing has the function trace_printk().
>
>   trace_hyp_printk("foobar");
>   trace_hyp_printk("foo=%d", foo);
>   trace_hyp_printk("foo=%d bar=0x%016llx", foo, bar);
>
> To ensure writing into the tracing buffer is fast, store the string
> format into a kernel-accessible ELF section. The hypervisor only has to
> write into the event the string ID, which is the delta between the
> hyp_string_fmt and the start of the ELF section.
>
> To not waste tracing buffer data, use a dynamic size. Each
> argument is 8 bytes and the in-kernel printing function can simply know
> how many of them there are by looking at the event length.
>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
>
> diff --git a/arch/arm64/include/asm/kvm_hypevents.h b/arch/arm64/include/asm/kvm_hypevents.h
> index 743c49bd878f..8465b523cb1d 100644
> --- a/arch/arm64/include/asm/kvm_hypevents.h
> +++ b/arch/arm64/include/asm/kvm_hypevents.h
> @@ -57,4 +57,18 @@ HYP_EVENT(selftest,
>         ),
>         RE_PRINTK("id=%llu", __entry->id)
>  );
> +
> +/*
> + * trace_hyp_printk() has too many specificities to be declared with HYP_EVENT().
> + * However, we can use a REMOTE_EVENT macro to automatically do the declaration
> + * for the kernel side.
> + */
> +REMOTE_EVENT_CUSTOM_PRINTK(hyp_printk,
> +       0, /* id will be overwritten during hyp event init */
> +       RE_STRUCT(
> +               re_field(u16, fmt_id)
> +               re_field(u64, args[])
> +       ),
> +       __hyp_trace_printk(evt, seq)
> +);
>  #endif
> diff --git a/arch/arm64/include/asm/kvm_hyptrace.h b/arch/arm64/include/asm/kvm_hyptrace.h
> index de133b735f72..46097105fdd8 100644
> --- a/arch/arm64/include/asm/kvm_hyptrace.h
> +++ b/arch/arm64/include/asm/kvm_hyptrace.h
> @@ -23,4 +23,12 @@ extern struct remote_event __hyp_events_end[];
>  extern struct hyp_event_id __hyp_event_ids_start[];
>  extern struct hyp_event_id __hyp_event_ids_end[];
>
> +#define HYP_STRING_FMT_MAX_SIZE 128
> +
> +struct hyp_string_fmt {
> +       const char      fmt[HYP_STRING_FMT_MAX_SIZE];
> +};
> +
> +extern struct hyp_string_fmt __hyp_string_fmts_start[];
> +extern struct hyp_string_fmt __hyp_string_fmts_end[];
>  #endif
> diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
> index d4c7d45ae6bc..ec03621d7a81 100644
> --- a/arch/arm64/kernel/image-vars.h
> +++ b/arch/arm64/kernel/image-vars.h
> @@ -141,6 +141,7 @@ KVM_NVHE_ALIAS(__hyp_rodata_end);
>  #ifdef CONFIG_NVHE_EL2_TRACING
>  KVM_NVHE_ALIAS(__hyp_event_ids_start);
>  KVM_NVHE_ALIAS(__hyp_event_ids_end);
> +KVM_NVHE_ALIAS(__hyp_string_fmts_start);
>  #endif
>
>  /* pKVM static key */
> diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
> index e1ac876200a3..b6d62642b6bd 100644
> --- a/arch/arm64/kernel/vmlinux.lds.S
> +++ b/arch/arm64/kernel/vmlinux.lds.S
> @@ -324,6 +324,10 @@ SECTIONS
>                 __hyp_events_start = .;
>                 *(SORT(_hyp_events.*))
>                 __hyp_events_end = .;
> +
> +               __hyp_string_fmts_start = .;
> +               *(_hyp_string_fmts)
> +               __hyp_string_fmts_end = .;
>         }
>  #endif
>         /*
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/define_events.h b/arch/arm64/kvm/hyp/include/nvhe/define_events.h
> index 776d4c6cb702..370e8c2d39fe 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/define_events.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/define_events.h
> @@ -10,5 +10,3 @@
>  #define HYP_EVENT_MULTI_READ
>  #include <asm/kvm_hypevents.h>
>  #undef HYP_EVENT_MULTI_READ
> -
> -#undef HYP_EVENT
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/trace.h b/arch/arm64/kvm/hyp/include/nvhe/trace.h
> index 8813ff250f8e..3d0b5c634bb3 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/trace.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/trace.h
> @@ -46,6 +46,69 @@ static inline pid_t __tracing_get_vcpu_pid(struct kvm_cpu_context *host_ctxt)
>  void *tracing_reserve_entry(unsigned long length);
>  void tracing_commit_entry(void);
>
> +/*
> + * The trace_hyp_printk boilerplate is too fiddly to be declared with
> + * HYP_EVENT():
> + *
> + * The string format is stored into a kernel-accessible ELF section. The
> + * hypervisor only writes the format ID.
> + *
> + * The function has a variadic prototype. We have no easy way to know each
> + * argument width so they must all cast to u64.
> + */
> +#define REMOTE_EVENT_CUSTOM_PRINTK(...)
> +
> +#define __TO_U64_0()
> +#define __TO_U64_1(x)                  , (u64)(x)
> +#define __TO_U64_2(x, ...)             , (u64)(x) __TO_U64_1(__VA_ARGS__)
> +#define __TO_U64_3(x, ...)             , (u64)(x) __TO_U64_2(__VA_ARGS__)
> +#define __TO_U64_4(x, ...)             , (u64)(x) __TO_U64_3(__VA_ARGS__)
> +#define __TO_U64_5(x, ...)             , (u64)(x) __TO_U64_4(__VA_ARGS__)
> +#define __TO_U64_6(x, ...)             , (u64)(x) __TO_U64_5(__VA_ARGS__)
> +#define __TO_U64_7(x, ...)             , (u64)(x) __TO_U64_6(__VA_ARGS__)
> +#define __TO_U64_8(x, ...)             , (u64)(x) __TO_U64_7(__VA_ARGS__)
> +
> +#define __TO_U64_X(N, ...)             CONCATENATE(__TO_U64_, N)(__VA_ARGS__)
> +#define __TO_U64(...)                  __TO_U64_X(COUNT_ARGS(__VA_ARGS__), ##__VA_ARGS__)
> +
> +REMOTE_EVENT_FORMAT(hyp_printk, HE_STRUCT(he_field(u16, fmt_id) he_field(u64, args[])));
> +extern struct hyp_event_id hyp_event_id_hyp_printk;
> +
> +static __always_inline void __trace_hyp_printk(struct hyp_string_fmt *fmt, int nr_args, ...)
> +{
> +       struct remote_event_format_hyp_printk *entry;
> +       va_list va;
> +       int i;
> +
> +       if (!atomic_read(&hyp_event_id_hyp_printk.enabled))
> +               return;
> +
> +       entry = tracing_reserve_entry(struct_size(entry, args, nr_args));
> +       if (!entry)
> +               return;
> +
> +       entry->hdr.id = hyp_event_id_hyp_printk.id;
> +       entry->fmt_id = fmt - __hyp_string_fmts_start;

nit: fmt_id is u16, the subtraction is ptrdiff_t. Silent truncation if
the section ever has more than 65536 entries. Not realistic today, but
a WARN_ON on the section size in hyp_trace_init_events() would catch
it at boot for free.

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


> +
> +       va_start(va, nr_args);
> +       for (i = 0; i < nr_args; i++)
> +               entry->args[i] = va_arg(va, u64);
> +       va_end(va);
> +
> +       tracing_commit_entry();
> +}
> +
> +
> +#define trace_hyp_printk(__fmt, __args...)                                             \
> +do {                                                                                   \
> +       static struct hyp_string_fmt __used __section("_hyp_string_fmts") fmt = {       \
> +               .fmt = __fmt                                                            \
> +       };                                                                              \
> +       BUILD_BUG_ON(sizeof(__fmt) > HYP_STRING_FMT_MAX_SIZE);                          \
> +       /* __TO_U64 prepends a comma if there are arguments */                          \
> +       __trace_hyp_printk(&fmt, COUNT_ARGS(__args) __TO_U64(__args));                  \
> +} while (0)
> +
>  int __tracing_load(unsigned long desc_va, size_t desc_size);
>  void __tracing_unload(void);
>  int __tracing_enable(bool enable);
> @@ -58,6 +121,8 @@ static inline void *tracing_reserve_entry(unsigned long length) { return NULL; }
>  static inline void tracing_commit_entry(void) { }
>  #define HYP_EVENT(__name, __proto, __struct, __assign, __printk)      \
>         static inline void trace_##__name(__proto) {}
> +#define REMOTE_EVENT_CUSTOM_PRINTK(...)
> +#define trace_hyp_printk(fmt, args...) do { } while (0)
>
>  static inline int __tracing_load(unsigned long desc_va, size_t desc_size) { return -ENODEV; }
>  static inline void __tracing_unload(void) { }
> diff --git a/arch/arm64/kvm/hyp/nvhe/events.c b/arch/arm64/kvm/hyp/nvhe/events.c
> index add9383aadb5..12223d2e3618 100644
> --- a/arch/arm64/kvm/hyp/nvhe/events.c
> +++ b/arch/arm64/kvm/hyp/nvhe/events.c
> @@ -9,6 +9,12 @@
>
>  #include <nvhe/define_events.h>
>
> +/*
> + * The hyp_printk event is not declared with HYP_EVENT in kvm_hypevents.h,
> + * so we manually add the boilerplate here.
> + */
> +HYP_EVENT(hyp_printk, 0, 0, 0, 0);
> +
>  int __tracing_enable_event(unsigned short id, bool enable)
>  {
>         struct hyp_event_id *event_id = &__hyp_event_ids_start[id];
> diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
> index 821bc93ecdd1..187a8a295d6f 100644
> --- a/arch/arm64/kvm/hyp_trace.c
> +++ b/arch/arm64/kvm/hyp_trace.c
> @@ -391,6 +391,9 @@ static struct trace_remote_callbacks trace_remote_callbacks = {
>
>  static const char *__hyp_enter_exit_reason_str(u8 reason);
>
> +struct remote_event_format_hyp_printk;
> +static void __hyp_trace_printk(struct remote_event_format_hyp_printk *entry, struct trace_seq *seq);
> +
>  #include "define_hypevents.h"
>
>  static const char *__hyp_enter_exit_reason_str(u8 reason)
> @@ -409,6 +412,61 @@ static const char *__hyp_enter_exit_reason_str(u8 reason)
>         return strs[min(reason, HYP_REASON_UNKNOWN)];
>  }
>
> +static void __hyp_trace_printk(struct remote_event_format_hyp_printk *entry, struct trace_seq *seq)
> +{
> +       const char *fmt = (const char *)(&__hyp_string_fmts_start[entry->fmt_id]);
> +       struct ring_buffer_event *evt = (void *)entry - RB_EVNT_HDR_SIZE;
> +       int nr_args;
> +
> +       trace_seq_putc(seq, ' ');
> +
> +       if ((void *)fmt >= (void *)__hyp_string_fmts_end) {
> +               trace_seq_printf(seq, "Unknown hyp_string_fmt ID %d\n", entry->fmt_id);
> +               return;
> +       }
> +
> +       nr_args = (ring_buffer_event_length(evt) -
> +                  offsetof(struct remote_event_format_hyp_printk, args)) / sizeof(entry->args[0]);
> +       switch (nr_args) {
> +       case 0:
> +               trace_seq_printf(seq, fmt);
> +               break;
> +       case 1:
> +               trace_seq_printf(seq, fmt, entry->args[0]);
> +               break;
> +       case 2:
> +               trace_seq_printf(seq, fmt, entry->args[0], entry->args[1]);
> +               break;
> +       case 3:
> +               trace_seq_printf(seq, fmt, entry->args[0], entry->args[1], entry->args[2]);
> +               break;
> +       case 4:
> +               trace_seq_printf(seq, fmt, entry->args[0], entry->args[1], entry->args[2],
> +                                entry->args[3]);
> +               break;
> +       case 5:
> +               trace_seq_printf(seq, fmt, entry->args[0], entry->args[1], entry->args[2],
> +                                entry->args[3], entry->args[4]);
> +               break;
> +       case 6:
> +               trace_seq_printf(seq, fmt, entry->args[0], entry->args[1], entry->args[2],
> +                                entry->args[3], entry->args[4], entry->args[5]);
> +               break;
> +       case 7:
> +               trace_seq_printf(seq, fmt, entry->args[0], entry->args[1], entry->args[2],
> +                                entry->args[3], entry->args[4], entry->args[5], entry->args[6]);
> +               break;
> +       default:
> +               trace_seq_printf(seq, fmt, entry->args[0], entry->args[1],
> +                                entry->args[2], entry->args[3], entry->args[4], entry->args[5],
> +                                entry->args[6], entry->args[7]);
> +               break;
> +       }
> +
> +       if (seq->buffer[trace_seq_used(seq) - 1] != '\n')
> +               trace_seq_putc(seq, '\n');
> +}
> +
>  static void __init hyp_trace_init_events(void)
>  {
>         struct hyp_event_id *hyp_event_id = __hyp_event_ids_start;
> --
> 2.54.0.1136.gdb2ca164c4-goog
>

