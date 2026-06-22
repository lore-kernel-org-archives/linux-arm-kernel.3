Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A2CCD98F6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 06:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QILN8DTARoWh3OJ/o4dcikoIv6aHuZ0kwC7cM2/BMRM=; b=LVuG/2ToogmCJp9PjOx7sYEJPw
	Cw9maWCTEBXwaVw4RbmFhvcFaJvjvNc/+HzQC8mdnN6uvFOYDlvVHj/jKHVD7avCxfssg9tETv8Bf
	J4xyssICFX0HYG4E4BTgV99KzTcWs4oh1gMj9sQgP7+Bhp2fNXY/WR5BQ6LDMHxCx2uYM93/0L5+o
	MyjbFKW4bBlFQKN+14hcSGP4rAEzl9RIFB+D69nRx8rqdt5ED+L4Rkvz/H62YlNOSPywKI2ce6Xo0
	vVRC4zzP/AeMBymgtYW/E7rmDydbZxiqHQEabwFZD+iJnV7U37PtwyASmt4BRJZpLI8/WrcCgdLN+
	sRTsBm8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbYMP-00000004UYZ-2KP3;
	Mon, 22 Jun 2026 06:42:21 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbYMN-00000004UXv-2k4S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 06:42:21 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-1390f75d8bbso2413787c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Jun 2026 23:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782110539; x=1782715339; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QILN8DTARoWh3OJ/o4dcikoIv6aHuZ0kwC7cM2/BMRM=;
        b=coemxZpM5nOJ55aei8jMOqXGEDwFToFEJFxymNqQRQiQnlJ8U0a9MqETUktXDcoO/j
         HsCxLltVHhL9dtKi+t5CgcdUtbvFOHEn3VfOA8VewH9+/IHqsf5HJPyZAORu6ezdUcAa
         ZNEkUfSKyCxMQBRU2SRwNDN8KDdpK7YNZ6FYTJF+eU6A2Y1Rcah+oQeHkWbl1Mwd2ibd
         eRl7XloYjlk0dIdQKcmKs4Ml2J8Bi4wKYfDhrJIJ5QXOoCMFJB6P82njxGHIRzuFNEPF
         g09srwJghrd3iSzYAvHi9/1s+iKLiz72GH0D6ZRVro1UMlCOim4d5HEteDvzyucPxR5o
         jwDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782110539; x=1782715339;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QILN8DTARoWh3OJ/o4dcikoIv6aHuZ0kwC7cM2/BMRM=;
        b=onD2KR42ET8ASpABxXIyQ/V2rB8d9Xm8bjhnE0dUxLkFEXQpdRy0ojyiDU8RVyPuZd
         gzm7V9dkrYTcDyHHprW0CzE1RCc0nwDMrvGxd1SeX+s+NlWwGSandj0wedst/5W2ovs3
         F6rPbC7S89LDPx99RvvPBFgtQ4rBLqcCozmwrfAGeAwGkgBldiOztP1e/M1bycvB9L+E
         fEd9UXTTF4kkwGo/s6tVCeeuhB9rpwnICxaLTJftHt3/xmU0FFjFTbsGtAr5Vkt+4rfq
         yY9isRM2EXRAytVc6SJlxu7rCcnncqeAA658ETkKDyxtrqFcblhKWI9Eve35wR6AfEAx
         fJ/w==
X-Forwarded-Encrypted: i=1; AFNElJ+98NIMd6Ryikyo0vogzRs5GkPZJW5Y53OtLZgxq0vLy3q9NKHQPVsxa1AUEcBk/crdmLf9G486pK+q899BR8g7@lists.infradead.org
X-Gm-Message-State: AOJu0YyaZaiFFwjg+IttJuAgYYj+plhhTAzLFAWRixvwqmmCxgnoWvrK
	8gspKDE329v+N5cOD6NX6R/CndQuuyHIryKJ737If0amRr38rBf71re7UyuMBQEd
X-Gm-Gg: AfdE7ckA6t4gkM40r7tKka9pNnVXCKS1pqRbqwrmiv5lMM2VfxrXqfQmfDukkuRXfx5
	hrIFM3jlikETqIUFngAo4+e6nZduZDghMTC+EGpdhMwPMPg14Xi+DPD353BiwCgwp+E1+MCgLnp
	WcQ+HpLSdM2L47yMCNBjx+QZaf+uPOlrkF2N25Da2l2YxqxNav3hxi3721CwfjiKeT0xrXZHtfW
	NdEkikfLrqyJB1cACE/z/kilTXUMk6eGanpHqbMtLyWUQ47zWXLAGvcy0pIgYDq0gVmO1pVxNBx
	qRJVpuT6gUP8pfwb0ugb0+lUg+qireVaUKedyqdmftURL+KtZFDUO2pM/nZb5vZNXw/0XyFHyBV
	V+3j4DIt7WOjHXGhQjpAoRIdrM22BquwhxIDhtGtkSSuRiWpIIhht3rmnFblVO5SMxD7OhEpNjh
	tG
X-Received: by 2002:a05:7022:6890:b0:138:4023:8c1 with SMTP id a92af1059eb24-139a4eca6f2mr7435550c88.11.1782110538606;
        Sun, 21 Jun 2026 23:42:18 -0700 (PDT)
Received: from blinky ([2601:647:6700:64d0::92d1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139adc0fdb6sm6363664c88.0.2026.06.21.23.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 23:42:18 -0700 (PDT)
Date: Sun, 21 Jun 2026 23:42:15 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anup Patel <anup@brainfault.org>,
	Namhyung Kim <namhyung@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Ian Rogers <irogers@google.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 04/21] RISC-V: Define indirect CSR access helpers
Message-ID: <ajjZR-R11yPYWuDp@blinky>
References: <20260608-counter_delegation-v6-0-285b72ed65a9@meta.com>
 <20260608-counter_delegation-v6-4-285b72ed65a9@meta.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608-counter_delegation-v6-4-285b72ed65a9@meta.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_234219_725425_7E2E3472 
X-CRM114-Status: GOOD (  20.57  )
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

On Mon, Jun 08, 2026 at 11:01:18PM -0700, Atish Patra wrote:
> From: Atish Patra <atishp@rivosinc.com>
> 
> The indriect CSR requires multiple instructions to read/write CSR.

indirect

> Add a few helper functions for ease of usage.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/csr_ind.h | 44 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/csr_ind.h b/arch/riscv/include/asm/csr_ind.h
> new file mode 100644
> index 000000000000..6fd7d44dc640
> --- /dev/null
> +++ b/arch/riscv/include/asm/csr_ind.h
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2024 Rivos Inc.

I don't think it makes sense to introduce this copyright in new commits.

- Charlie

> + */
> +
> +#ifndef _ASM_RISCV_CSR_IND_H
> +#define _ASM_RISCV_CSR_IND_H
> +
> +#include <linux/irqflags.h>
> +
> +#include <asm/csr.h>
> +
> +#define csr_ind_read(iregcsr, iselbase, iseloff) ({		\
> +	unsigned long __value = 0;				\
> +	unsigned long __flags;					\
> +	local_irq_save(__flags);				\
> +	csr_write(CSR_ISELECT, (iselbase) + (iseloff));		\
> +	__value = csr_read(iregcsr);				\
> +	local_irq_restore(__flags);				\
> +	__value;						\
> +})
> +
> +#define csr_ind_write(iregcsr, iselbase, iseloff, value) ({	\
> +	unsigned long __flags;					\
> +	local_irq_save(__flags);				\
> +	csr_write(CSR_ISELECT, (iselbase) + (iseloff));		\
> +	csr_write(iregcsr, (value));				\
> +	local_irq_restore(__flags);				\
> +})
> +
> +#define csr_ind_warl(iregcsr, iselbase, iseloff, warl_val) ({	\
> +	unsigned long __old_val = 0, __value = 0;		\
> +	unsigned long __flags;					\
> +	local_irq_save(__flags);				\
> +	csr_write(CSR_ISELECT, (iselbase) + (iseloff));		\
> +	__old_val = csr_read(iregcsr);				\
> +	csr_write(iregcsr, (warl_val));				\
> +	__value = csr_read(iregcsr);				\
> +	csr_write(iregcsr, __old_val);				\
> +	local_irq_restore(__flags);				\
> +	__value;						\
> +})
> +
> +#endif
> 
> -- 
> 2.53.0-Meta
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

