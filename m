Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E8D7CF8844
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 12:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h29daZyB4oG+q+opR9L96UtT0D3drFHL81djpgYvOIM=; b=xOx00GnppX/EsXLA8PSE97LqCc
	2xu1MPkWIbeyGLchlAHPVwVS3M1zBavEcdoqaTuhHGK8r9EhqWg1f+HSx0Cw+oE3w0iGQa6Q686r1
	06CUSrFwiXc9Ex9GXE4tkD+yQFkCmJETKW8Wx4AK1OzuyPt8/1IUF31mHcGRzYVXilyEwI3mmFsR5
	5BacF8OlegVefV8IRmbjCDPV0O+l7B39T4iG4hJi27uOT5hOH0ndCSfln6autdRiAciu5e72bSgKv
	WYrBPyj0mDuSLWnTNrUCqGJ7xYZxUYkINkQF3i6PBH0D+4Tqa20d53YTaA1lcHgckVnMAr5r8ng2L
	4hTsBVyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM3MT-00000006d1S-0ctw;
	Thu, 20 Nov 2025 12:02:05 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM3MP-00000006d0J-1T0s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 12:02:03 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-477b5e0323bso9929915e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 04:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763640119; x=1764244919; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h29daZyB4oG+q+opR9L96UtT0D3drFHL81djpgYvOIM=;
        b=LvTCTbP95gunrWvwx/UUJVJ8KxFfEcOr8LJaxeRSigv6LLSL756g/MrvUxar2wUqrH
         ZOnTjcsZFdRd6dUo40qLt2M1IUF/kK6vWb60ci6Nne+vCuE5MBgyIee9UtyhacXCCG1d
         /lUn+YKbsova3Kq1DlfzIk6DTjnDzZOJtD4sCBrBxgwpzDds7V/NaFEzO+u31kh8xE0O
         B4Gb9Wwy40gh+GLs1aFILagZk47bKqxfxdTUDnb2DHos4nzccC5hVD6yFx8TbfMMR3wl
         GSYn8w6rjsVOgSJhElhBc+/scfwA6kj+INdAN/C3RqtMl18TbVcPd+Q4aBNAieNNaATD
         RBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763640119; x=1764244919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h29daZyB4oG+q+opR9L96UtT0D3drFHL81djpgYvOIM=;
        b=gKVOCVDJikBHTt/hCYBEJaNcusTZJdgdGcgrg84V/p9bNg0dQ/VzaHDbMQoDa2584S
         9pSVwTv+ZBLHJilTGYapi5CHpOJnFgUwGeRdzkdu3xVWERQL1nioo+g+Ssxx/3V1F+Xs
         1rINfWTOazadhMueLRdTc7w5xz1b7R5M1NJa+SpzW0nwpD7x7EsIW8bQ1LC+oL6b9uaV
         io8Ge3PSDrEJjiCD77lL4WynZQ2A4WNyPCeqGvmLsXz4ywQ410H1/euAYntsOIqEHypb
         RxAKQBlEknFDQQxJMlK8ZpgPGvQzNisS5/G8xSVj6hfz4NND3V/8fdXD8kOLE9pc+Cko
         44og==
X-Forwarded-Encrypted: i=1; AJvYcCVqdMFA/zZS4Nn+Ftz2EkUD9lUmaseEfwS47rbKzvviJ9HFd1Us8GYF0OTTbtL3O5EPF0JEghRx3VRlgeSI6SG2@lists.infradead.org
X-Gm-Message-State: AOJu0YyNFPX7FjiRtW43qoBm3ZHZ6Gr9ImClKJPNGXJYlhopiRrzPHns
	F4+zO9NRs+L/O/JuVbBc2MA3EgwU8Z4MMD3m3iGcmMaySVzNd207u4yNSaku/5zHnQ==
X-Gm-Gg: ASbGncscDedrY97wSt2DeMML7WjqalQuRIyfdBeVI/Mhd4Xo8WujSdXPswTZY1mLTck
	vD71SbnKHaAkPijOhuvdwEp3Z41y0V6hslsie1WUfVR7TKi5TcXd4hlsdqOKWwOnJAJKVMsXWyn
	Xvw01zMAm0TRtW16lRVHt//Xlz6E5pMY9/31ukN11xPJeF/WxDZP7/1YJyEIS0Sp2Ipsog7Glp6
	mqccFWOSlV/4TXT6YxQFZWdvVINzY1QiAgSjojGR/bqbfbnwv6bfDKFE9GLkIvZqg5rjaqCpQlB
	YwnIca3VXrkDCBfT3MbFTztirO1ApeauzQphl0zmduw13mACxvIEyHHKyaBvdw1OCg/YK7UG5/u
	IfQPc67PWW4HpUZQPmZkBlHnCnyZklG0+xMiJIihYBz/vyyRYam22z984BbJJc6o97FqSH89Yvj
	kqKAd2tZwiIsoeKlupdyL6lS6l16RsTwt68KGJoZuVH9OxXviDGw==
X-Google-Smtp-Source: AGHT+IEH5Qk6xomHJqxz1J/Ne6qSerXpBVOOPuJy2CRilZnpK8DiEWwuEIr1RkfRUoWDaiyCIB+T5g==
X-Received: by 2002:a05:600c:35d5:b0:477:9e0c:f59 with SMTP id 5b1f17b1804b1-477b9ea5683mr29594085e9.2.1763640118768;
        Thu, 20 Nov 2025 04:01:58 -0800 (PST)
Received: from google.com (120.54.38.34.bc.googleusercontent.com. [34.38.54.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b83142b8sm48432785e9.9.2025.11.20.04.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 04:01:58 -0800 (PST)
Date: Thu, 20 Nov 2025 12:01:55 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: rostedt@goodmis.org, mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com, linux-trace-kernel@vger.kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, jstultz@google.com,
	qperret@google.com, will@kernel.org, aneesh.kumar@kernel.org,
	kernel-team@android.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 21/28] KVM: arm64: Add tracing capability for the pKVM
 hyp
Message-ID: <aR8DM6Xf8cmTGVR0@google.com>
References: <20251107093840.3779150-1-vdonnefort@google.com>
 <20251107093840.3779150-22-vdonnefort@google.com>
 <86bjkyrly9.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86bjkyrly9.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_040201_541053_590150C3 
X-CRM114-Status: GOOD (  40.18  )
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

On Wed, Nov 19, 2025 at 05:06:38PM +0000, Marc Zyngier wrote:
> On Fri, 07 Nov 2025 09:38:33 +0000,
> Vincent Donnefort <vdonnefort@google.com> wrote:
> > 
> > When running with protected mode, the host has very little knowledge
> > about what is happening in the hypervisor. Of course this is an
> > essential feature for security but nonetheless, that piece of code
> > growing with more responsibilities, we need now a way to debug and
> > profile it. Tracefs by its reliability, versatility and support for
> > user-space is the perfect tool.
> > 
> > There's no way the hypervisor could log events directly into the host
> > tracefs ring-buffers. So instead let's use our own, where the hypervisor
> > is the writer and the host the reader.
> > 
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > 
> > diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> > index 9da54d4ee49e..ad02dee140d3 100644
> > --- a/arch/arm64/include/asm/kvm_asm.h
> > +++ b/arch/arm64/include/asm/kvm_asm.h
> > @@ -89,6 +89,10 @@ enum __kvm_host_smccc_func {
> >  	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_load,
> >  	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_put,
> >  	__KVM_HOST_SMCCC_FUNC___pkvm_tlb_flush_vmid,
> > +	__KVM_HOST_SMCCC_FUNC___pkvm_load_tracing,
> > +	__KVM_HOST_SMCCC_FUNC___pkvm_unload_tracing,
> > +	__KVM_HOST_SMCCC_FUNC___pkvm_enable_tracing,
> > +	__KVM_HOST_SMCCC_FUNC___pkvm_swap_reader_tracing,
> >  };
> >  
> >  #define DECLARE_KVM_VHE_SYM(sym)	extern char sym[]
> > diff --git a/arch/arm64/include/asm/kvm_hyptrace.h b/arch/arm64/include/asm/kvm_hyptrace.h
> > new file mode 100644
> > index 000000000000..9c30a479bc36
> > --- /dev/null
> > +++ b/arch/arm64/include/asm/kvm_hyptrace.h
> > @@ -0,0 +1,13 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef __ARM64_KVM_HYPTRACE_H_
> > +#define __ARM64_KVM_HYPTRACE_H_
> > +
> > +#include <linux/ring_buffer.h>
> > +
> > +struct hyp_trace_desc {
> > +	unsigned long			bpages_backing_start;
> 
> Why is this an integer type? You keep casting it all over the place,
> which tells me that's not the ideal type.

That's because it is a kern VA the hyp needs to convert. However it would indeed
make my life easier to declare it as a struct simple_buffer_page * in the
struct hyp_trace_buffer below.

> 
> > +	size_t				bpages_backing_size;
> > +	struct trace_buffer_desc	trace_buffer_desc;
> > +
> > +};
> > +#endif
> > diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
> > index 4f803fd1c99a..580426cdbe77 100644
> > --- a/arch/arm64/kvm/Kconfig
> > +++ b/arch/arm64/kvm/Kconfig
> > @@ -83,4 +83,11 @@ config PTDUMP_STAGE2_DEBUGFS
> >  
> >  	  If in doubt, say N.
> >  
> > +config PKVM_TRACING
> > +	bool
> > +	depends on KVM
> > +	depends on TRACING
> > +	select SIMPLE_RING_BUFFER
> > +	default y
> 
> I'd rather this is made to depend on NVHE_EL2_DEBUG, just like the
> other debug options.

NVHE_EL2_DEBUG is unsafe for production because of the stage-2 relax on panic.
While this one is. So ideally this should be usable even without NVHE_EL2_DEBUG.

I can remove this hidden PKVM_TRACING option and use everywhere CONFIG_TRACING. But
then I need something to select SIMPLE_RING_BUFFER. 

Perhaps with the following?

diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index 2ae6bf499236..c561bf9d4754 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -38,6 +38,7 @@ menuconfig KVM
        select SCHED_INFO
        select GUEST_PERF_EVENTS if PERF_EVENTS
        select KVM_GUEST_MEMFD
+       select SIMPLE_RING_BUFFER if CONFIG_TRACING


> 
> > +
> >  endif # VIRTUALIZATION
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/trace.h b/arch/arm64/kvm/hyp/include/nvhe/trace.h
> > new file mode 100644
> > index 000000000000..996e90c0974f
> > --- /dev/null
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/trace.h
> > @@ -0,0 +1,23 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef __ARM64_KVM_HYP_NVHE_TRACE_H
> > +#define __ARM64_KVM_HYP_NVHE_TRACE_H
> > +#include <asm/kvm_hyptrace.h>
> > +
> > +#ifdef CONFIG_PKVM_TRACING
> > +void *tracing_reserve_entry(unsigned long length);
> > +void tracing_commit_entry(void);
> > +
> > +int __pkvm_load_tracing(unsigned long desc_va, size_t desc_size);
> > +void __pkvm_unload_tracing(void);
> > +int __pkvm_enable_tracing(bool enable);
> > +int __pkvm_swap_reader_tracing(unsigned int cpu);
> > +#else
> > +static inline void *tracing_reserve_entry(unsigned long length) { return NULL; }
> > +static inline void tracing_commit_entry(void) { }
> > +
> > +static inline int __pkvm_load_tracing(unsigned long desc_va, size_t desc_size) { return -ENODEV; }
> > +static inline void __pkvm_unload_tracing(void) { }
> > +static inline int __pkvm_enable_tracing(bool enable) { return -ENODEV; }
> > +static inline int __pkvm_swap_reader_tracing(unsigned int cpu) { return -ENODEV; }
> > +#endif
> > +#endif
> > diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
> > index f55a9a17d38f..504c3b9caef8 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/Makefile
> > +++ b/arch/arm64/kvm/hyp/nvhe/Makefile
> > @@ -29,7 +29,7 @@ hyp-obj-y += ../vgic-v3-sr.o ../aarch32.o ../vgic-v2-cpuif-proxy.o ../entry.o \
> >  	 ../fpsimd.o ../hyp-entry.o ../exception.o ../pgtable.o
> >  hyp-obj-y += ../../../kernel/smccc-call.o
> >  hyp-obj-$(CONFIG_LIST_HARDENED) += list_debug.o
> > -hyp-obj-$(CONFIG_PKVM_TRACING) += clock.o
> > +hyp-obj-$(CONFIG_PKVM_TRACING) += clock.o trace.o ../../../../../kernel/trace/simple_ring_buffer.o
> 
> Can we get something less awful here? Surely there is a way to get an
> absolute path from the kbuild infrastructure? $(objtree) springs to
> mind...

Ack.

[...]

> > +int __pkvm_load_tracing(unsigned long desc_hva, size_t desc_size)
> > +{
> > +	struct hyp_trace_desc *desc = (struct hyp_trace_desc *)kern_hyp_va(desc_hva);
> > +	int ret;
> > +
> > +	if (!desc_size || !PAGE_ALIGNED(desc_hva) || !PAGE_ALIGNED(desc_size))
> > +		return -EINVAL;
> > +
> > +	ret = __pkvm_host_donate_hyp(hyp_virt_to_pfn((void *)desc),
> > +				     desc_size >> PAGE_SHIFT);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (!hyp_trace_desc_validate(desc, desc_size))
> > +		goto err_donate_desc;
> > +
> > +	hyp_spin_lock(&trace_buffer.lock);
> > +
> > +	ret = hyp_trace_buffer_load(&trace_buffer, desc);
> > +
> > +	hyp_spin_unlock(&trace_buffer.lock);
> > +
> > +err_donate_desc:
> > +	WARN_ON(__pkvm_hyp_donate_host(hyp_virt_to_pfn((void *)desc),
> > +				       desc_size >> PAGE_SHIFT));
> 
> That's basically a guaranteed panic if anything goes wrong. Are you
> sure you want to do that?

A failure would mean a lost page for the kernel. As there's really no reason for
this to happen (the host_donate_hyp worked few lines above), it sounds alright
to panic here in this case. 

In reclaim_pgtable_pages() applies the same reasoning: if hyp_donate_host fails,
something really wrong happened.
 
> 
> > +	return ret;
> > +}
> > +
> > +void __pkvm_unload_tracing(void)
> > +{
> > +	hyp_spin_lock(&trace_buffer.lock);
> > +	hyp_trace_buffer_unload(&trace_buffer);
> > +	hyp_spin_unlock(&trace_buffer.lock);
> > +}
> > +
> > +int __pkvm_enable_tracing(bool enable)
> > +{
> > +	int cpu, ret = enable ? -EINVAL : 0;
> > +
> > +	hyp_spin_lock(&trace_buffer.lock);
> > +
> > +	if (!hyp_trace_buffer_loaded(&trace_buffer))
> > +		goto unlock;
> > +
> > +	for (cpu = 0; cpu < hyp_nr_cpus; cpu++)
> > +		simple_ring_buffer_enable_tracing(per_cpu_ptr(trace_buffer.simple_rbs, cpu),
> > +						  enable);
> > +
> > +	ret = 0;
> > +
> > +unlock:
> > +	hyp_spin_unlock(&trace_buffer.lock);
> > +
> > +	return ret;
> > +}
> > +
> > +int __pkvm_swap_reader_tracing(unsigned int cpu)
> > +{
> > +	int ret;
> > +
> > +	if (cpu >= hyp_nr_cpus)
> > +		return -EINVAL;
> > +
> > +	hyp_spin_lock(&trace_buffer.lock);
> > +
> > +	if (hyp_trace_buffer_loaded(&trace_buffer))
> > +		ret = simple_ring_buffer_swap_reader_page(
> > +				per_cpu_ptr(trace_buffer.simple_rbs, cpu));
> 
> Please keep these things on a single line. I don't care what people
> (of checkpatch) say.

Ack.

> 
> > +	else
> > +		ret = -ENODEV;
> > +
> > +	hyp_spin_unlock(&trace_buffer.lock);
> > +
> > +	return ret;
> > +}
> > -- 
> > 2.51.2.1041.gc1ab5b90ca-goog
> > 
> > 
> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

