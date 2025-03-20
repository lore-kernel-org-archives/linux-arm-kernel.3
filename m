Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D508C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 12:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W7Q+Uv9PP7IrwTG/eBced107V/Y8wAy3D1YQ6SsCvek=; b=yehwiCXsEDk2qV9ubNqB5Z2xDp
	/JJv2IRL3beXhJQvrIkkD5XIhRyLDIo2fHLf/h98L93Nh19XcPYrvIChwnrr/BQK1mwppU0aEp/2i
	rNWcVi45K/bbvM63fEQBkQSJV7Bqa+sFWolwf4w1SrlxC5cWRSNosbko1o6IrzpJuwKOODNNVqa6z
	U5r5fPeu50iM/28f+IjifCHFcB1cc4tmDxj/UYawgX4kvGNHFptFO3DP2bar0pxoWBq8k9lrJOlke
	pVCxqqtKEcysj/wQK+Q1BlpBTXAtSThj51/PJ9S25JJStqZslMYn1qsFMDsedIKeSU2s29GE9cHPb
	fanTLcmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvEgL-0000000C3Rj-1U8R;
	Thu, 20 Mar 2025 12:07:29 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvESE-0000000C0Vg-0QHC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 11:52:55 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso4799375e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 04:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742471572; x=1743076372; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W7Q+Uv9PP7IrwTG/eBced107V/Y8wAy3D1YQ6SsCvek=;
        b=HSbyc88gp4B8KCrZ70Qqf/Kbo3ux3S1qU5Y3pu+ZyvQlbCHaMnXSrel/CH6HF2HDUF
         bmG+IcoeS4IrTDmzeHCOCrINDFzp0hCwEx8Bc/oybVVYaCW+0X+aZfmvbe4Zex6oPmeb
         Rsn+aURnFHGjyIy6tMcZW991qFdCx/RC4CyY4SxqBQuQWfzWGiOL4ls/9HLxruJX5pcA
         iXZgiB01ouiQmCltrSiCuEAsujdry58ptbbCyJH5y8wiFX1qlUPSS9cRW433zW17i4ez
         ZIZmnDH1+oK4ARFlILaqo9wiA0dNGwXsMpD0wjLMbXB0eftfGuZ2x6O7Fs/ZzSlO29eC
         UD8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742471572; x=1743076372;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W7Q+Uv9PP7IrwTG/eBced107V/Y8wAy3D1YQ6SsCvek=;
        b=gOzm0tc/qWr0gZZ0xXIzL0NxsTYLxOpXq7Nqr7tHauh9buCGjvxAZ7yD6xVRdiDM5e
         G2aBf3WvH2hfAdld4bGm8pC1mIz0lp/OgTf+QeIYrdNSVSqCz7fUlSlSFm8JyjIlwMe2
         o50KAzpRHITY/2lXJbFa09WWrIQZb6kaEHcTx1M/Gu7bNYeGpyJFDCebxnmYIUCWXCYL
         YmyTbjlX8ajOU1CeL+5WSWn9Sms2VTJSvsXUXelYhyr7Go+e1ojlDY1U4gLtWP7juzD8
         JZvQCDBvGikkjoDcqHyzHDfylswAEPCvBHIoN4MRLWsZ2hPNrU8gVropBQNEVyGoJ9pL
         dv7g==
X-Forwarded-Encrypted: i=1; AJvYcCXu9tOpYvfm6dDEWSEqLQh6jWKeDgzFfvwz00vuFhTz0dZtVeBMoXG9gnNkUmAni9kM1EezMCHnhnfzeM5r4f2d@lists.infradead.org
X-Gm-Message-State: AOJu0YxarUq6GvRw9UwmdzknD5Xn2ueKScJh9h6NKrSHCWl0P4lSdhcq
	qYBgE52DuMfJ2M/H3zKkCbe7lxXbsi0n43FnnX+GvozR59BVJmK3UM+avLirbTW+IKQ43ulo2rZ
	J
X-Gm-Gg: ASbGncu7hKTxCXSiZPKxxPa30XF20p5Wb4Ox2vwrMreFWGDzsPeKf6SRhM2FDSbsj26
	zz87eMY8/+MJGm+10Okgal4WFtgs4UPa0d1IqR8nFxYuGjVi7ltMC7ArjoL9LY9+IOUgKavGRtC
	aOrTvP6zuXZsddWPD0hcyDEhtIO78BUldXgi/No3XG85/wPdJhGSisGF0IJTFGNARKkCer5fHUf
	turInHSZBhOMWf7m0P8vKOSctXdsq5lMSKW9BMaC1ybXf8DIG6qEeBcDDB7esAKkLc8q6c5aZG+
	N9IC10yZ/YXbmOo25oxB+dB2wJAtuSyZ
X-Google-Smtp-Source: AGHT+IHeyTD2wSXlAOfdAKS53YepR+/8W8LiJeiUCHJdoX9DdjQszAGbC8mMUKoCZx6XO5JpwnfZmg==
X-Received: by 2002:a05:6000:188e:b0:391:2e6a:30de with SMTP id ffacd0b85a97d-399739beb10mr5536213f8f.19.1742471572182;
        Thu, 20 Mar 2025 04:52:52 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997e3eb672sm404452f8f.95.2025.03.20.04.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 04:52:51 -0700 (PDT)
Date: Thu, 20 Mar 2025 12:52:50 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Himanshu Chauhan <hchauhan@ventanamicro.com>, 
	Anup Patel <apatel@ventanamicro.com>, Xu Lu <luxu.kernel@bytedance.com>, 
	Atish Patra <atishp@atishpatra.org>
Subject: Re: [PATCH v3 2/4] riscv: add support for SBI Supervisor Software
 Events extension
Message-ID: <20250320-5f9612f1b503c79c9b185b10@orel>
References: <20241206163102.843505-1-cleger@rivosinc.com>
 <20241206163102.843505-3-cleger@rivosinc.com>
 <20250319-46b625cf8b771616d4c7c053@orel>
 <b3fbd730-295f-4491-b0d6-d4e258941ae5@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b3fbd730-295f-4491-b0d6-d4e258941ae5@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_045254_145905_57D8A451 
X-CRM114-Status: GOOD (  28.77  )
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

On Thu, Mar 20, 2025 at 09:16:07AM +0100, Clément Léger wrote:
> 
> 
> On 19/03/2025 18:08, Andrew Jones wrote:
> > On Fri, Dec 06, 2024 at 05:30:58PM +0100, Clément Léger wrote:
> > ...
> >> +int arch_sse_init_event(struct sse_event_arch_data *arch_evt, u32 evt_id, int cpu)
> >> +{
> >> +	void *stack;
> >> +
> >> +	arch_evt->evt_id = evt_id;
> >> +	stack = sse_stack_alloc(cpu, SSE_STACK_SIZE);
> >> +	if (!stack)
> >> +		return -ENOMEM;
> >> +
> >> +	arch_evt->stack = stack + SSE_STACK_SIZE;
> >> +
> >> +	if (sse_init_scs(cpu, arch_evt))
> >> +		goto free_stack;
> >> +
> >> +	if (is_kernel_percpu_address((unsigned long)&arch_evt->interrupted)) {
> >> +		arch_evt->interrupted_state_phys =
> >> +				per_cpu_ptr_to_phys(&arch_evt->interrupted);
> >> +	} else {
> >> +		arch_evt->interrupted_state_phys =
> >> +				virt_to_phys(&arch_evt->interrupted);
> >> +	}
> >> +
> >> +	return 0;
> > 
> > Hi Clément,
> > 
> > Testing SSE support with tools/testing/selftests/kvm/riscv/sbi_pmu_test
> > led to an opensbi sbi_trap_error because the output_phys_lo address passed
> > to sbi_sse_read_attrs() wasn't a physical address. The reason is that
> > is_kernel_percpu_address() can only be used on static percpu addresses,
> > but local sse events get their percpu addresses with alloc_percpu(), so
> > is_kernel_percpu_address() was returning false even for local events. I
> > made the following changes to get things working.
> 
> Hi Andrew,
> 
> Did something changed recently ? Because I tested that when it was send
> (PMU + some kernel internal testsuite) and didn't saw that. Anyway, I'll
> respin it with your changes as well.

It depends on the kernel config. Configs that don't have many
alloc_percpu() calls prior to the one made by sse can work, because,
iiuc, alloc_percpu() will get its allocation from the percpu allocator's
first chunk until that chunck fills up. The first chunck is shared with
the static allocations.

Thanks,
drew

> 
> Thanks !
> 
> Clément
> 
> > 
> > Thanks,
> > drew
> > 
> > diff --git a/arch/riscv/kernel/sse.c b/arch/riscv/kernel/sse.c
> > index b48ae69dad8d..f46893946086 100644
> > --- a/arch/riscv/kernel/sse.c
> > +++ b/arch/riscv/kernel/sse.c
> > @@ -100,12 +100,12 @@ int arch_sse_init_event(struct sse_event_arch_data *arch_evt, u32 evt_id, int cp
> >         if (sse_init_scs(cpu, arch_evt))
> >                 goto free_stack;
> > 
> > -       if (is_kernel_percpu_address((unsigned long)&arch_evt->interrupted)) {
> > +       if (sse_event_is_global(evt_id)) {
> >                 arch_evt->interrupted_state_phys =
> > -                               per_cpu_ptr_to_phys(&arch_evt->interrupted);
> > +                               virt_to_phys(&arch_evt->interrupted);
> >         } else {
> >                 arch_evt->interrupted_state_phys =
> > -                               virt_to_phys(&arch_evt->interrupted);
> > +                               per_cpu_ptr_to_phys(&arch_evt->interrupted);
> >         }
> > 
> >         return 0;
> > diff --git a/drivers/firmware/riscv/riscv_sse.c b/drivers/firmware/riscv/riscv_sse.c
> > index 511db9ad7a9e..fef375046f75 100644
> > --- a/drivers/firmware/riscv/riscv_sse.c
> > +++ b/drivers/firmware/riscv/riscv_sse.c
> > @@ -62,11 +62,6 @@ void sse_handle_event(struct sse_event_arch_data *arch_event,
> >                         ret);
> >  }
> > 
> > -static bool sse_event_is_global(u32 evt)
> > -{
> > -       return !!(evt & SBI_SSE_EVENT_GLOBAL);
> > -}
> > -
> >  static
> >  struct sse_event *sse_event_get(u32 evt)
> >  {
> > diff --git a/include/linux/riscv_sse.h b/include/linux/riscv_sse.h
> > index 16700677f1e8..06b757b036b0 100644
> > --- a/include/linux/riscv_sse.h
> > +++ b/include/linux/riscv_sse.h
> > @@ -8,6 +8,7 @@
> > 
> >  #include <linux/types.h>
> >  #include <linux/linkage.h>
> > +#include <asm/sbi.h>
> > 
> >  struct sse_event;
> >  struct pt_regs;
> > @@ -16,6 +17,11 @@ struct ghes;
> > 
> >  typedef int (sse_event_handler)(u32 event_num, void *arg, struct pt_regs *regs);
> > 
> > +static inline bool sse_event_is_global(u32 evt)
> > +{
> > +       return !!(evt & SBI_SSE_EVENT_GLOBAL);
> > +}
> > +
> >  #ifdef CONFIG_RISCV_SSE
> > 
> >  struct sse_event *sse_event_register(u32 event_num, u32 priority,
> 

