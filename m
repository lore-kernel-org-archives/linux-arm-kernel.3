Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20832C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 17:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G1ouuKQSE2VEpWtfA+MIBk/TTstCzh3+p28q16wuqE0=; b=P/ua4WAvDtM76f3R54PcdaCBl+
	IZZSJcSlCRaclXxUMA4K9LtBAwuJZYEAQpcfpuwaURwKJhWDbWGjn0fhc64wYHVs8tA7EIHdScelM
	5rj+ET4xP6j+jAT3Mi6SBZxFX/nNCAkJ/QMBC0NX/jZvlvOXj2SOeIBh60TBpTUaQqdKvUqGUDwjO
	fWx7KzFLxlwLHq3sKYO/PCW0bcZcnjYNnJf+qkauVCSYsBouIhDB1XVSUVcPsA6IZpv7FBlyO++XL
	xENop0m1ZwaK39r3gQfeR6YRrqoWsXSvs+DlEna2bifXjgVO8Pea/intE/Q8nD4MHalaGk9Cb3WWa
	lSqW6DPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuww4-00000009eZA-142o;
	Wed, 19 Mar 2025 17:10:32 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuwuM-00000009eGZ-1JwE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 17:08:47 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43cfe574976so31128895e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 10:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742404125; x=1743008925; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G1ouuKQSE2VEpWtfA+MIBk/TTstCzh3+p28q16wuqE0=;
        b=UESkRwZqFcHMBm+55sKiRGtOJp/uE8IW5QXOK7ARthIHHvpkQKPwqsJqei6qLtXS4r
         bSfCnofmFAQclf/SxoWKgy+YJJkpoZHbfmU+Uls9CeZG2scyrITnxGcjqLxTerhxX62d
         Gpz925LSuivnS7TmUBQWgZ2SCebDuFvgGAhRbdr+6tjemRoOS2+OLyJQOSj0hLpx4g05
         FIMr7xugX6xWne9vzZhR9bPIG73lciY/4yU6kAh4XX+NdcoOLUYoPES8NAHjJpOiCFDJ
         6yyFIeXpj12ihA8Lex65d4v8SQvn1/NCSvwD9HbD6RYFL0q0PD5CHn/U5uAQj9IlmxRy
         ZjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742404125; x=1743008925;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G1ouuKQSE2VEpWtfA+MIBk/TTstCzh3+p28q16wuqE0=;
        b=LzjkXsPfRN9e+VvUGpeTa1yQbDceURK/dtg5YZZSXBbzxGpluKhXHR2qUA91jbpRyk
         ZOKvRldHRQlop/39b5NYhHVpa1X1qYwTXzhFjFH4emhKBbwMOECONoV8FSxSsss4ypCl
         5Vv8JeV7JmeNChZxN9MQH4zuVymcbY7/BtpG96epDrLe1gFWvKehZMEGZoTiRa8tHMca
         DhZzHiNnuIIiKKjTZP1NIaczrDVSpAmy5IDSIcfdkhluo7DrwFLfiPhz6cf4fc4PldNZ
         I1ujy+vdsOiFfuPb1VDCcg8rlfkvFTDK3tlh6WcGx4xNOigLvh25jskHwTzxBbCiCwm1
         npqg==
X-Forwarded-Encrypted: i=1; AJvYcCV8RFZ60dvDNiBdWOhUUo+VUoamZXRwitfeSYzsVKveifYPgI8aHUvBBl/J3moyePhLrWMODOwTx4GZvInscuTF@lists.infradead.org
X-Gm-Message-State: AOJu0YzDGM/tsvwVqNSIEZZBQBIpbkRT26L/MRpzuOKjlYtSDq2MrG4f
	+nErBxJKAyhVSTZVaC8WVolQL0kpV0y8Tze994/PWbK8whylKYVPbSYZGGaQcY0=
X-Gm-Gg: ASbGncuTGNcZeHmBtPB/lsgF2+l13zeZrSuWHO0nwDl9Vir9DwBDM1rb8jfak+FlRXr
	4iMOnaZZ+FyER6yM6BHkxHrXnILvP0JEdiUg6J8Ol6i27Wh9WPfMk5x8LyjXdiSDp3gEE+kMZK1
	9RBzn7wKJG9FBul3hlNTSb1Qa2UAZEchFYr3c301q8z14HYk/3jkpz+LDkVAhhY7GM/xxe1ZpKn
	ysQvbFRRbBiTZVkLr4BydZVtkOhbdl2bMiP42YSd2S+xf83DWgUhECqXsWiG45XvCivGjCzRn8G
	K9ptB8b1ltCG9PxtsIwEH2iFjwcn1+bL
X-Google-Smtp-Source: AGHT+IGPifbnY9fgJZ0p0hOK7b2VosZ1UqTOiKpbP4FQw26n9tMmWYULhtHyH1vn12fopbDb6l3rdw==
X-Received: by 2002:a05:6000:144d:b0:390:de66:cc0c with SMTP id ffacd0b85a97d-39973b31a0amr3816811f8f.46.1742404124592;
        Wed, 19 Mar 2025 10:08:44 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c83b748bsm21797789f8f.39.2025.03.19.10.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 10:08:44 -0700 (PDT)
Date: Wed, 19 Mar 2025 18:08:43 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Himanshu Chauhan <hchauhan@ventanamicro.com>, 
	Anup Patel <apatel@ventanamicro.com>, Xu Lu <luxu.kernel@bytedance.com>, 
	Atish Patra <atishp@atishpatra.org>
Subject: Re: [PATCH v3 2/4] riscv: add support for SBI Supervisor Software
 Events extension
Message-ID: <20250319-46b625cf8b771616d4c7c053@orel>
References: <20241206163102.843505-1-cleger@rivosinc.com>
 <20241206163102.843505-3-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241206163102.843505-3-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_100846_354593_9FFCC142 
X-CRM114-Status: GOOD (  17.03  )
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

On Fri, Dec 06, 2024 at 05:30:58PM +0100, Clément Léger wrote:
...
> +int arch_sse_init_event(struct sse_event_arch_data *arch_evt, u32 evt_id, int cpu)
> +{
> +	void *stack;
> +
> +	arch_evt->evt_id = evt_id;
> +	stack = sse_stack_alloc(cpu, SSE_STACK_SIZE);
> +	if (!stack)
> +		return -ENOMEM;
> +
> +	arch_evt->stack = stack + SSE_STACK_SIZE;
> +
> +	if (sse_init_scs(cpu, arch_evt))
> +		goto free_stack;
> +
> +	if (is_kernel_percpu_address((unsigned long)&arch_evt->interrupted)) {
> +		arch_evt->interrupted_state_phys =
> +				per_cpu_ptr_to_phys(&arch_evt->interrupted);
> +	} else {
> +		arch_evt->interrupted_state_phys =
> +				virt_to_phys(&arch_evt->interrupted);
> +	}
> +
> +	return 0;

Hi Clément,

Testing SSE support with tools/testing/selftests/kvm/riscv/sbi_pmu_test
led to an opensbi sbi_trap_error because the output_phys_lo address passed
to sbi_sse_read_attrs() wasn't a physical address. The reason is that
is_kernel_percpu_address() can only be used on static percpu addresses,
but local sse events get their percpu addresses with alloc_percpu(), so
is_kernel_percpu_address() was returning false even for local events. I
made the following changes to get things working.

Thanks,
drew

diff --git a/arch/riscv/kernel/sse.c b/arch/riscv/kernel/sse.c
index b48ae69dad8d..f46893946086 100644
--- a/arch/riscv/kernel/sse.c
+++ b/arch/riscv/kernel/sse.c
@@ -100,12 +100,12 @@ int arch_sse_init_event(struct sse_event_arch_data *arch_evt, u32 evt_id, int cp
        if (sse_init_scs(cpu, arch_evt))
                goto free_stack;

-       if (is_kernel_percpu_address((unsigned long)&arch_evt->interrupted)) {
+       if (sse_event_is_global(evt_id)) {
                arch_evt->interrupted_state_phys =
-                               per_cpu_ptr_to_phys(&arch_evt->interrupted);
+                               virt_to_phys(&arch_evt->interrupted);
        } else {
                arch_evt->interrupted_state_phys =
-                               virt_to_phys(&arch_evt->interrupted);
+                               per_cpu_ptr_to_phys(&arch_evt->interrupted);
        }

        return 0;
diff --git a/drivers/firmware/riscv/riscv_sse.c b/drivers/firmware/riscv/riscv_sse.c
index 511db9ad7a9e..fef375046f75 100644
--- a/drivers/firmware/riscv/riscv_sse.c
+++ b/drivers/firmware/riscv/riscv_sse.c
@@ -62,11 +62,6 @@ void sse_handle_event(struct sse_event_arch_data *arch_event,
                        ret);
 }

-static bool sse_event_is_global(u32 evt)
-{
-       return !!(evt & SBI_SSE_EVENT_GLOBAL);
-}
-
 static
 struct sse_event *sse_event_get(u32 evt)
 {
diff --git a/include/linux/riscv_sse.h b/include/linux/riscv_sse.h
index 16700677f1e8..06b757b036b0 100644
--- a/include/linux/riscv_sse.h
+++ b/include/linux/riscv_sse.h
@@ -8,6 +8,7 @@

 #include <linux/types.h>
 #include <linux/linkage.h>
+#include <asm/sbi.h>

 struct sse_event;
 struct pt_regs;
@@ -16,6 +17,11 @@ struct ghes;

 typedef int (sse_event_handler)(u32 event_num, void *arg, struct pt_regs *regs);

+static inline bool sse_event_is_global(u32 evt)
+{
+       return !!(evt & SBI_SSE_EVENT_GLOBAL);
+}
+
 #ifdef CONFIG_RISCV_SSE

 struct sse_event *sse_event_register(u32 event_num, u32 priority,

