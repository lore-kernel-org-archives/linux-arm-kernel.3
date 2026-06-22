Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E1FCDB46B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 06:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q/ijfEBLG2GDgKYljJEgtRrqYXmGeXk+QfQobYUMazc=; b=Q29NQ6//lqGyG9ehg0IJHDjmDJ
	vSmctQmYdgCUPsocN3GuEHU1QBS+v7XZ/MJAsdbX2xhTwU0D5+qEI7XJLqV6GS/NIcXpZwlSBnVZP
	RkSyFG6Z38zo4myiirGy3lDEv4kkdIGluXcrjxQcN54kPUSxGhqGDAjRWGpBtkJEusBy7QusnXLLM
	wV+8PpjwbG7y5LfdIK1UKU2HE9SzBd7a3LYLVPPch17x285ys/YCcQ9NwUN4rNYvLD8rY9YzxDlzl
	NeX0nyhKJrEpHPmEaoamACM0DzTOnxKDA1Dv7vcNNLoXMSQ+xlkhaUAasnikww8IbLKA6VtCSU/8V
	NUXLTccg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbYNb-00000004Uif-3QMn;
	Mon, 22 Jun 2026 06:43:35 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbYNZ-00000004Uhs-3t67
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 06:43:35 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-1390f75d8bbso2416199c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Jun 2026 23:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782110613; x=1782715413; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q/ijfEBLG2GDgKYljJEgtRrqYXmGeXk+QfQobYUMazc=;
        b=MwZSJAWC11H80jLdZH4NQSVeirN2IBjz+haRLy6OjKMi+s8XPpXfBeuGl4pC+Onbuu
         g9OZ8Ffnqf0L7s9quLIc7kjo0cAJVehSla7yxJVKKpKMrVZjwbYT3pQ8ROutgG88Bol4
         5SOJCbaBCOq5sOa4bc0aMx3WlPxrl8dCyRUb7WxDqN6p3vCQMYqQQgukD4CCoR48Geb4
         VkD+eKcngdpstAaOxP/SBYSn8FpZx2KcWUs6HShOyGCUBp9wQ1AhL0cMFVb3Vxsq4YzA
         eMWZccoQJQyQSMjczohY1zd6JHXP7vjglwiQoOeULox8O7cOifQasUbNLUIYLfYVj+O3
         obPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782110613; x=1782715413;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q/ijfEBLG2GDgKYljJEgtRrqYXmGeXk+QfQobYUMazc=;
        b=Go54BOYs9wVI+2z0rQNHyCgf85sKkVj5zz99nxgBzIwSFdTUBY1PHPH60qmqaoe279
         7Weu/mHut7vjBFc77f/f+f4rupTrsGeCgnyeZPNmbgjh0UoTceOhQAqyI40eKTRYepdu
         1AreFJnHkOkp3T0LcZlP0ZcKPIiddyMJIIWrwhImrtH8/TCoFtJGwgnL2qmtZpUwU6C6
         bc4GY4edhpTqblZIa2AxxUyJKTrhJ0QggeObZGY8vhpDf02byG/lrU/rzHW1A+00xbU2
         BtMvrjQa2VlEcf5wVZThhtxvCH+NfavdKac3EZ1TJ1IwnRRW4KNM0vBIANDIQVCarbwn
         k+/g==
X-Forwarded-Encrypted: i=1; AFNElJ8MeEvxs+h+nOqKsQdwRZ0MGRAaP2fczG20qMO14+bhxjjkddBjVWL8Xe+cVl8qP4OBhHHBN4k0GLaI0AR2H4VY@lists.infradead.org
X-Gm-Message-State: AOJu0YxuzgV+v6vHre//48kiQFKi30hJ1ltws5//mg14R+dKsgzrytZt
	ncUZgZbHFJn3kHGvccyjaQmcbQN7P8UOhssPyTRdf4tLCpefqqCMYZkO
X-Gm-Gg: AfdE7cnsLacQIYJe92974UTBh3cd1YpoQynI5RwR8V7L52lRP6QxM/qQA6jyYZvlpPS
	zoHsPnA1jkvpsGxtzFSeD6jyZfQkWbtmwYdXnvWly4OAyrT9QUaHH4OfiDWJ6DpRcQLoDBhU0o0
	+7S+QSe3kQwhyYIItsmfiY/k/NVdk9eYRr8uRtfzz5AjYI70p2Vmm91pvVmSQgCukiyv1TVCLyI
	pwtGFGD+OA/jMcw/hYS0r1XiLk+v6TXlGGF+AdgjT65VuvvfFeaSTGdfzUyZtVaXk9NN6FgzbIx
	93NwxBtVGWKjqnjezsrc3+eTK8hGdDZV+wjmcFcX0f3YPQOzsh0wjMbTzCiYIGmmXSp3ijjvG76
	5/EbPAfoUL3vgmL7+ZSZBmEKU4dUoX/jr/A1Y2/oGrNxikYNMzbm2YCjLvO0DgM3JVtww2pKB1e
	YR
X-Received: by 2002:a05:7022:f689:b0:12d:b993:c68f with SMTP id a92af1059eb24-139a4eb3fe3mr6345562c88.4.1782110612828;
        Sun, 21 Jun 2026 23:43:32 -0700 (PDT)
Received: from blinky ([2601:647:6700:64d0::92d1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139add73a44sm6680306c88.13.2026.06.21.23.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 23:43:32 -0700 (PDT)
Date: Sun, 21 Jun 2026 23:43:29 -0700
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
Subject: Re: [PATCH v6 07/21] RISC-V: Add Sscfg extension CSR definition
Message-ID: <ajjZkRxoh2F3vUAS@blinky>
References: <20260608-counter_delegation-v6-0-285b72ed65a9@meta.com>
 <20260608-counter_delegation-v6-7-285b72ed65a9@meta.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260608-counter_delegation-v6-7-285b72ed65a9@meta.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_234333_967492_81634779 
X-CRM114-Status: GOOD (  20.77  )
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

On Mon, Jun 08, 2026 at 11:01:21PM -0700, Atish Patra wrote:
> From: Kaiwen Xue <kaiwenx@rivosinc.com>
> 
> This adds the scountinhibit CSR definition and S-mode accessible hpmevent
> bits defined by smcdeleg/ssccfg. scountinhibit allows S-mode to start/stop
> counters directly from S-mode without invoking SBI calls to M-mode. It is
> also used to figure out the counters delegated to S-mode by the M-mode as
> well.
> 
> Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
> Reviewed-by: Clément Léger <cleger@rivosinc.com>
> ---
>  arch/riscv/include/asm/csr.h | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index b4551a6cf7cb..26cb78dee2fd 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -241,6 +241,31 @@
>  #define SMSTATEEN0_HSENVCFG		(_ULL(1) << SMSTATEEN0_HSENVCFG_SHIFT)
>  #define SMSTATEEN0_SSTATEEN0_SHIFT	63
>  #define SMSTATEEN0_SSTATEEN0		(_ULL(1) << SMSTATEEN0_SSTATEEN0_SHIFT)
> +/* HPMEVENT bits. These are accessible in S-mode via Smcdeleg/Ssccfg */
> +#ifdef CONFIG_64BIT
> +#define HPMEVENT_OF			(BIT_ULL(63))
> +#define HPMEVENT_MINH			(BIT_ULL(62))
> +#define HPMEVENT_SINH			(BIT_ULL(61))
> +#define HPMEVENT_UINH			(BIT_ULL(60))
> +#define HPMEVENT_VSINH			(BIT_ULL(59))
> +#define HPMEVENT_VUINH			(BIT_ULL(58))
> +#else
> +#define HPMEVENTH_OF			(BIT_ULL(31))
> +#define HPMEVENTH_MINH			(BIT_ULL(30))
> +#define HPMEVENTH_SINH			(BIT_ULL(29))
> +#define HPMEVENTH_UINH			(BIT_ULL(28))
> +#define HPMEVENTH_VSINH			(BIT_ULL(27))
> +#define HPMEVENTH_VUINH			(BIT_ULL(26))

Since these are rv32 bits for a 32-bit register, I think these should be
BIT() instead of BIT_ULL()

> +
> +#define HPMEVENT_OF			(HPMEVENTH_OF << 32)
> +#define HPMEVENT_MINH			(HPMEVENTH_MINH << 32)
> +#define HPMEVENT_SINH			(HPMEVENTH_SINH << 32)
> +#define HPMEVENT_UINH			(HPMEVENTH_UINH << 32)
> +#define HPMEVENT_VSINH			(HPMEVENTH_VSINH << 32)
> +#define HPMEVENT_VUINH			(HPMEVENTH_VUINH << 32)

These definitions are identical to the rv64 ones, can these be removed
and can you move the rv64 definitions to be global?

- Charlie

> +#endif
> +
> +#define SISELECT_SSCCFG_BASE		0x40
>  
>  /* mseccfg bits */
>  #define MSECCFG_PMM			ENVCFG_PMM
> @@ -322,6 +347,7 @@
>  #define CSR_SCOUNTEREN		0x106
>  #define CSR_SENVCFG		0x10a
>  #define CSR_SSTATEEN0		0x10c
> +#define CSR_SCOUNTINHIBIT	0x120
>  #define CSR_SSCRATCH		0x140
>  #define CSR_SEPC		0x141
>  #define CSR_SCAUSE		0x142
> 
> -- 
> 2.53.0-Meta
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

