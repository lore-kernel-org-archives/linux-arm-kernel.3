Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8226CCD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 08:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qh/f0emaQJNnjCet88c5hb5H0v5eyVAvoPkaJcGoOm8=; b=im819lnLlkAfLDbELvzwAdgke6
	oY7biqId/zdKOjYI4zlkIyma6hRE7ahX1/8cZr2HkXsNmH8c6WmA5ua4kOvJ6d9lkO2gNXs2CLyOo
	3oicFaa5S5vDUCmgf5HDkGXRIYnR+Hgg19YyLZGZSr+GiZ92p7DBSyL+yFs6mGmIT7iL4OWn12HUD
	87ZjObuvH5oltkYmb9BjtzP2NdpsXY7bLpG/XmrTbjSFhhaVWteDBHhXwOe5UYD8evEqjokfH+IXr
	hiYT3JCgGGhopQFzdevhcRYwyGrD7DyUjCq0O+L5ZjMGHuCNZKib1EDjLBkIsEz8/MiLCYuShELng
	0uoPXj3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ2hV-0000000DrvL-3xcg;
	Mon, 15 Jun 2026 08:29:45 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ2hR-0000000Drtd-2Q2m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 08:29:44 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-bebac79fff8so370509466b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 01:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781512179; x=1782116979; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qh/f0emaQJNnjCet88c5hb5H0v5eyVAvoPkaJcGoOm8=;
        b=inOgz14ayB9RqRKOFprmTohNNbG570B8tx4w3vPcrduORAi+TqS9Vs5UDsR67DWLNv
         uWw4eraB3PA9lmAF1qoGuUYY2R5lGlMf3WkVF+oK51cfoMc3gOWU3PEA5HfLGFfwUh5E
         E7mzyZQpnGsPmIsybxg8+N+mtim/nVrGtInD2PfISU6keXN0lwyV/tH18XN4mQbFsi8z
         aR1YKJqYmZ64bNepZVxxqSK5+ejnDEROBAx32HfHwJIhBJK4uMpusPf3QWRmFR/BnJok
         5kQxYtvZDAU1tvzdgC+vClA/eJLc3qtKiM6WtVxSm+jrQGHXEfzOa96876pBKj3ArpG2
         6oIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512179; x=1782116979;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qh/f0emaQJNnjCet88c5hb5H0v5eyVAvoPkaJcGoOm8=;
        b=ZqXeMiW4kARg8zgS5oyMGx/Uq58gd4APHpYNDBU0wEtzo+iFcbO3gHIUfNFy2vD32V
         1csio66yHHBQwTWMm4X1G1BVi8r4SEk7eGqEe7cVFwOcgo1pBlI19XCfbetZGG5mx///
         hixk1YLVg7UNEAhrNvnC1a3KhZH0gKaP57el2ogygSC73pIltumt6HxdAUaKTEdtBa9d
         Y4/0YW8GNnYDFjGRj9E1fvVKHIlx46Mm7Fw1og6RP0c3OFs1lblqO7z72JqR9lIyCxC8
         k3/0AfO5W/6IMiJ5vfyiluDrDRXqpOcDlWV7e4xVoKenWqAj9hQKDvDYFuewx+zRe0wN
         +eiw==
X-Forwarded-Encrypted: i=1; AFNElJ9cxGRd1wYZF7jrMjdtx8/Go+AbE6EyldRPMHaD54IP34WoYNrnf00Odhjz0wLbRrFloQkwkAaEH7o2JJC6UV3l@lists.infradead.org
X-Gm-Message-State: AOJu0YxChbUScnnnBAVU/YZ1f7u9C147qPXk9aFioc+CD2Rk2Uo0pP44
	XFOAvkChLV/dW8Yl1RCwdioW/jaLHPu1YtIDnF3YjRWXzsZvkwQicGtz2K5McEc8og==
X-Gm-Gg: Acq92OHtA2AeTrs6Z5kUMT5RSWNP/ZgQAg+dlhWJURk+ItEIi2jNS6wn5njWLHet3E0
	YZeZXVOkdkp1Hm9fauXn9B2MhOu+INhtQPYX1WOU+9cDdVpRm2ahe1mm0R2lYLsmU4IdvMk7ErD
	i/DvairiamfbOsql93uJr4w+fcK5npdAVDTUKjC3GdFZsacKcFw5wVcSb3ZUW5R/m75BZ+gEJgL
	HB2WF6fgcgvdRFQTmip2l65rHr6n5/wtxTPuudDLzK3ADPMUid4+7JCCODOfk0bkn1EE3UGSCzS
	honXtUta9zRuTJGzE3jTe9MKWTItWlWJbItNF+KDhvQe0GQ+Yv6Sw8c9xeqXK6gVTLJG7dB0J8j
	8Be44SQT2tgVzp0slx29JoopUWD2W6KpFb99wWsg28/Am1l/VqEkdPnJ51wIV42s9tKJ2dhhvCl
	y5nVZsxGVQ0GoBtZKtX19XXuW/R3fp9M5T9OYPRbuSpBrPuD5YLUZfbdW4PU1CW1WynOA=
X-Received: by 2002:a17:906:cc5a:b0:bfd:aee0:5156 with SMTP id a640c23a62f3a-bfe2810469fmr388102966b.7.1781512178750;
        Mon, 15 Jun 2026 01:29:38 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb83420e9sm405850366b.45.2026.06.15.01.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:29:38 -0700 (PDT)
Date: Mon, 15 Jun 2026 09:29:34 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, rostedt@goodmis.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kernel-team@android.com, qerret@google.com
Subject: Re: [PATCH v1 4/4] KVM: arm64: Add hyp_printk event to nVHE/pKVM hyp
Message-ID: <ai-37kQ0e_VCma2z@google.com>
References: <20260612142245.1015744-1-vdonnefort@google.com>
 <20260612142245.1015744-5-vdonnefort@google.com>
 <CA+EHjTwqp=Hjzyn469Gvm-JRNovfnj=0eFB5+Kei_9pRQrnG0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTwqp=Hjzyn469Gvm-JRNovfnj=0eFB5+Kei_9pRQrnG0Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_012941_676538_CD7BC3D7 
X-CRM114-Status: GOOD (  36.08  )
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

On Sun, Jun 14, 2026 at 04:25:00PM +0100, Fuad Tabba wrote:
> Hi Vincent,
> 
> On Fri, 12 Jun 2026 at 15:22, Vincent Donnefort <vdonnefort@google.com> wrote:
> >
> > Create an event to allow developers to log pretty much anything into the
> > hypervisor tracing buffer with trace_hyp_printk(), just like the kernel
> > tracing has the function trace_printk().
> >
> >   trace_hyp_printk("foobar");
> >   trace_hyp_printk("foo=%d", foo);
> >   trace_hyp_printk("foo=%d bar=0x%016llx", foo, bar);
> >
> > To ensure writing into the tracing buffer is fast, store the string
> > format into a kernel-accessible ELF section. The hypervisor only has to
> > write into the event the string ID, which is the delta between the
> > hyp_string_fmt and the start of the ELF section.
> >
> > To not waste tracing buffer data, use a dynamic size. Each
> > argument is 8 bytes and the in-kernel printing function can simply know
> > how many of them there are by looking at the event length.
> >
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> >
> > diff --git a/arch/arm64/include/asm/kvm_hypevents.h b/arch/arm64/include/asm/kvm_hypevents.h
> > index 743c49bd878f..8465b523cb1d 100644
> > --- a/arch/arm64/include/asm/kvm_hypevents.h
> > +++ b/arch/arm64/include/asm/kvm_hypevents.h
> > @@ -57,4 +57,18 @@ HYP_EVENT(selftest,
> >         ),
> >         RE_PRINTK("id=%llu", __entry->id)
> >  );
> > +
> > +/*
> > + * trace_hyp_printk() has too many specificities to be declared with HYP_EVENT().
> > + * However, we can use a REMOTE_EVENT macro to automatically do the declaration
> > + * for the kernel side.
> > + */
> > +REMOTE_EVENT_CUSTOM_PRINTK(hyp_printk,
> > +       0, /* id will be overwritten during hyp event init */
> > +       RE_STRUCT(
> > +               re_field(u16, fmt_id)
> > +               re_field(u64, args[])
> > +       ),
> > +       __hyp_trace_printk(evt, seq)
> > +);
> >  #endif
> > diff --git a/arch/arm64/include/asm/kvm_hyptrace.h b/arch/arm64/include/asm/kvm_hyptrace.h
> > index de133b735f72..46097105fdd8 100644
> > --- a/arch/arm64/include/asm/kvm_hyptrace.h
> > +++ b/arch/arm64/include/asm/kvm_hyptrace.h
> > @@ -23,4 +23,12 @@ extern struct remote_event __hyp_events_end[];
> >  extern struct hyp_event_id __hyp_event_ids_start[];
> >  extern struct hyp_event_id __hyp_event_ids_end[];
> >
> > +#define HYP_STRING_FMT_MAX_SIZE 128
> > +
> > +struct hyp_string_fmt {
> > +       const char      fmt[HYP_STRING_FMT_MAX_SIZE];
> > +};
> > +
> > +extern struct hyp_string_fmt __hyp_string_fmts_start[];
> > +extern struct hyp_string_fmt __hyp_string_fmts_end[];
> >  #endif
> > diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
> > index d4c7d45ae6bc..ec03621d7a81 100644
> > --- a/arch/arm64/kernel/image-vars.h
> > +++ b/arch/arm64/kernel/image-vars.h
> > @@ -141,6 +141,7 @@ KVM_NVHE_ALIAS(__hyp_rodata_end);
> >  #ifdef CONFIG_NVHE_EL2_TRACING
> >  KVM_NVHE_ALIAS(__hyp_event_ids_start);
> >  KVM_NVHE_ALIAS(__hyp_event_ids_end);
> > +KVM_NVHE_ALIAS(__hyp_string_fmts_start);
> >  #endif
> >
> >  /* pKVM static key */
> > diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
> > index e1ac876200a3..b6d62642b6bd 100644
> > --- a/arch/arm64/kernel/vmlinux.lds.S
> > +++ b/arch/arm64/kernel/vmlinux.lds.S
> > @@ -324,6 +324,10 @@ SECTIONS
> >                 __hyp_events_start = .;
> >                 *(SORT(_hyp_events.*))
> >                 __hyp_events_end = .;
> > +
> > +               __hyp_string_fmts_start = .;
> > +               *(_hyp_string_fmts)
> > +               __hyp_string_fmts_end = .;
> >         }
> >  #endif
> >         /*
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/define_events.h b/arch/arm64/kvm/hyp/include/nvhe/define_events.h
> > index 776d4c6cb702..370e8c2d39fe 100644
> > --- a/arch/arm64/kvm/hyp/include/nvhe/define_events.h
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/define_events.h
> > @@ -10,5 +10,3 @@
> >  #define HYP_EVENT_MULTI_READ
> >  #include <asm/kvm_hypevents.h>
> >  #undef HYP_EVENT_MULTI_READ
> > -
> > -#undef HYP_EVENT
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/trace.h b/arch/arm64/kvm/hyp/include/nvhe/trace.h
> > index 8813ff250f8e..3d0b5c634bb3 100644
> > --- a/arch/arm64/kvm/hyp/include/nvhe/trace.h
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/trace.h
> > @@ -46,6 +46,69 @@ static inline pid_t __tracing_get_vcpu_pid(struct kvm_cpu_context *host_ctxt)
> >  void *tracing_reserve_entry(unsigned long length);
> >  void tracing_commit_entry(void);
> >
> > +/*
> > + * The trace_hyp_printk boilerplate is too fiddly to be declared with
> > + * HYP_EVENT():
> > + *
> > + * The string format is stored into a kernel-accessible ELF section. The
> > + * hypervisor only writes the format ID.
> > + *
> > + * The function has a variadic prototype. We have no easy way to know each
> > + * argument width so they must all cast to u64.
> > + */
> > +#define REMOTE_EVENT_CUSTOM_PRINTK(...)
> > +
> > +#define __TO_U64_0()
> > +#define __TO_U64_1(x)                  , (u64)(x)
> > +#define __TO_U64_2(x, ...)             , (u64)(x) __TO_U64_1(__VA_ARGS__)
> > +#define __TO_U64_3(x, ...)             , (u64)(x) __TO_U64_2(__VA_ARGS__)
> > +#define __TO_U64_4(x, ...)             , (u64)(x) __TO_U64_3(__VA_ARGS__)
> > +#define __TO_U64_5(x, ...)             , (u64)(x) __TO_U64_4(__VA_ARGS__)
> > +#define __TO_U64_6(x, ...)             , (u64)(x) __TO_U64_5(__VA_ARGS__)
> > +#define __TO_U64_7(x, ...)             , (u64)(x) __TO_U64_6(__VA_ARGS__)
> > +#define __TO_U64_8(x, ...)             , (u64)(x) __TO_U64_7(__VA_ARGS__)
> > +
> > +#define __TO_U64_X(N, ...)             CONCATENATE(__TO_U64_, N)(__VA_ARGS__)
> > +#define __TO_U64(...)                  __TO_U64_X(COUNT_ARGS(__VA_ARGS__), ##__VA_ARGS__)
> > +
> > +REMOTE_EVENT_FORMAT(hyp_printk, HE_STRUCT(he_field(u16, fmt_id) he_field(u64, args[])));
> > +extern struct hyp_event_id hyp_event_id_hyp_printk;
> > +
> > +static __always_inline void __trace_hyp_printk(struct hyp_string_fmt *fmt, int nr_args, ...)
> > +{
> > +       struct remote_event_format_hyp_printk *entry;
> > +       va_list va;
> > +       int i;
> > +
> > +       if (!atomic_read(&hyp_event_id_hyp_printk.enabled))
> > +               return;
> > +
> > +       entry = tracing_reserve_entry(struct_size(entry, args, nr_args));
> > +       if (!entry)
> > +               return;
> > +
> > +       entry->hdr.id = hyp_event_id_hyp_printk.id;
> > +       entry->fmt_id = fmt - __hyp_string_fmts_start;
> 
> nit: fmt_id is u16, the subtraction is ptrdiff_t. Silent truncation if
> the section ever has more than 65536 entries. Not realistic today, but
> a WARN_ON on the section size in hyp_trace_init_events() would catch
> it at boot for free.

Ack. That wouldn't cost anything. I'll add that in a v2

> 
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Tested-by: Fuad Tabba <tabba@google.com>
> 
> Cheers,
> /fuad
> 
> 
> > +
> > +       va_start(va, nr_args);
> > +       for (i = 0; i < nr_args; i++)
> > +               entry->args[i] = va_arg(va, u64);
> > +       va_end(va);
> > +
> > +       tracing_commit_entry();
> > +}
> > +
> > +
> > +#define trace_hyp_printk(__fmt, __args...)                                             \
> > +do {                                                                                   \
> > +       static struct hyp_string_fmt __used __section("_hyp_string_fmts") fmt = {       \
> > +               .fmt = __fmt                                                            \
> > +       };                                                                              \
> > +       BUILD_BUG_ON(sizeof(__fmt) > HYP_STRING_FMT_MAX_SIZE);                          \
> > +       /* __TO_U64 prepends a comma if there are arguments */                          \
> > +       __trace_hyp_printk(&fmt, COUNT_ARGS(__args) __TO_U64(__args));                  \
> > +} while (0)
> > +
> >  int __tracing_load(unsigned long desc_va, size_t desc_size);
> >  void __tracing_unload(void);
> >  int __tracing_enable(bool enable);
> > @@ -58,6 +121,8 @@ static inline void *tracing_reserve_entry(unsigned long length) { return NULL; }
> >  static inline void tracing_commit_entry(void) { }
> >  #define HYP_EVENT(__name, __proto, __struct, __assign, __printk)      \
> >         static inline void trace_##__name(__proto) {}
> > +#define REMOTE_EVENT_CUSTOM_PRINTK(...)
> > +#define trace_hyp_printk(fmt, args...) do { } while (0)
> >
> >  static inline int __tracing_load(unsigned long desc_va, size_t desc_size) { return -ENODEV; }
> >  static inline void __tracing_unload(void) { }
> > diff --git a/arch/arm64/kvm/hyp/nvhe/events.c b/arch/arm64/kvm/hyp/nvhe/events.c
> > index add9383aadb5..12223d2e3618 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/events.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/events.c
> > @@ -9,6 +9,12 @@
> >
> >  #include <nvhe/define_events.h>
> >
> > +/*
> > + * The hyp_printk event is not declared with HYP_EVENT in kvm_hypevents.h,
> > + * so we manually add the boilerplate here.
> > + */
> > +HYP_EVENT(hyp_printk, 0, 0, 0, 0);
> > +
> >  int __tracing_enable_event(unsigned short id, bool enable)
> >  {
> >         struct hyp_event_id *event_id = &__hyp_event_ids_start[id];
> > diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
> > index 821bc93ecdd1..187a8a295d6f 100644
> > --- a/arch/arm64/kvm/hyp_trace.c
> > +++ b/arch/arm64/kvm/hyp_trace.c
> > @@ -391,6 +391,9 @@ static struct trace_remote_callbacks trace_remote_callbacks = {
> >
> >  static const char *__hyp_enter_exit_reason_str(u8 reason);
> >
> > +struct remote_event_format_hyp_printk;
> > +static void __hyp_trace_printk(struct remote_event_format_hyp_printk *entry, struct trace_seq *seq);
> > +
> >  #include "define_hypevents.h"
> >
> >  static const char *__hyp_enter_exit_reason_str(u8 reason)
> > @@ -409,6 +412,61 @@ static const char *__hyp_enter_exit_reason_str(u8 reason)
> >         return strs[min(reason, HYP_REASON_UNKNOWN)];
> >  }
> >
> > +static void __hyp_trace_printk(struct remote_event_format_hyp_printk *entry, struct trace_seq *seq)
> > +{
> > +       const char *fmt = (const char *)(&__hyp_string_fmts_start[entry->fmt_id]);
> > +       struct ring_buffer_event *evt = (void *)entry - RB_EVNT_HDR_SIZE;
> > +       int nr_args;
> > +
> > +       trace_seq_putc(seq, ' ');
> > +
> > +       if ((void *)fmt >= (void *)__hyp_string_fmts_end) {
> > +               trace_seq_printf(seq, "Unknown hyp_string_fmt ID %d\n", entry->fmt_id);
> > +               return;
> > +       }
> > +
> > +       nr_args = (ring_buffer_event_length(evt) -
> > +                  offsetof(struct remote_event_format_hyp_printk, args)) / sizeof(entry->args[0]);
> > +       switch (nr_args) {
> > +       case 0:
> > +               trace_seq_printf(seq, fmt);
> > +               break;
> > +       case 1:
> > +               trace_seq_printf(seq, fmt, entry->args[0]);
> > +               break;
> > +       case 2:
> > +               trace_seq_printf(seq, fmt, entry->args[0], entry->args[1]);
> > +               break;
> > +       case 3:
> > +               trace_seq_printf(seq, fmt, entry->args[0], entry->args[1], entry->args[2]);
> > +               break;
> > +       case 4:
> > +               trace_seq_printf(seq, fmt, entry->args[0], entry->args[1], entry->args[2],
> > +                                entry->args[3]);
> > +               break;
> > +       case 5:
> > +               trace_seq_printf(seq, fmt, entry->args[0], entry->args[1], entry->args[2],
> > +                                entry->args[3], entry->args[4]);
> > +               break;
> > +       case 6:
> > +               trace_seq_printf(seq, fmt, entry->args[0], entry->args[1], entry->args[2],
> > +                                entry->args[3], entry->args[4], entry->args[5]);
> > +               break;
> > +       case 7:
> > +               trace_seq_printf(seq, fmt, entry->args[0], entry->args[1], entry->args[2],
> > +                                entry->args[3], entry->args[4], entry->args[5], entry->args[6]);
> > +               break;
> > +       default:
> > +               trace_seq_printf(seq, fmt, entry->args[0], entry->args[1],
> > +                                entry->args[2], entry->args[3], entry->args[4], entry->args[5],
> > +                                entry->args[6], entry->args[7]);
> > +               break;
> > +       }
> > +
> > +       if (seq->buffer[trace_seq_used(seq) - 1] != '\n')
> > +               trace_seq_putc(seq, '\n');
> > +}
> > +
> >  static void __init hyp_trace_init_events(void)
> >  {
> >         struct hyp_event_id *hyp_event_id = __hyp_event_ids_start;
> > --
> > 2.54.0.1136.gdb2ca164c4-goog
> >

