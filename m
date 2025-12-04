Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D2DBD20682
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 13:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NG0EewGU/m3seu0dnYeXl0q+SbDSXR6KqjikfXMh8A4=; b=YBI9+MjIR40n8UJJDiiHRj10sL
	ZlLrcXlYrVaUT3hvNgvWGjIwmWZln3E6lcN+YOA0UKmt6O1smyHLMTgiAx8wGsOoBfTcmT236YWgf
	ulvYcEfn/thhBvLfMy5WqjFbGkNlB0tycfzWNrRcUDbmZg1yfMH+yX0N6IAIsDWRuFxoNeOAxcdcE
	TNTHEzfR21LWuQfSpGc2Xe23UVViZsnhNVhoIowtUV3l3p8+axkAqI+zBLgQJQo1XL86oyPjKFtAr
	QpClF/NaMdE6cdTRxDBJ2lzua4V4BdikzsZEKCRa0xkzyjwSotk7ggKI1wPpJ62LVKXfFCBeRGKNJ
	qRAom2Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR9CA-000000082Wp-3dnq;
	Thu, 04 Dec 2025 13:16:30 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR9C9-000000082Vj-0Rdj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 13:16:30 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3436b2dbfb9so111383a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 05:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1764854188; x=1765458988; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NG0EewGU/m3seu0dnYeXl0q+SbDSXR6KqjikfXMh8A4=;
        b=fNPXXJSkVyVvKSCxa90mAcmgSccSkjNNNSAcWfEtND/Y4CyFsp5BpdsOR8OcimeUi8
         qISTIOkKgrcMMy3TMOKYlxFvkntbLT/qr0EfmL3UYszENRlqTtFQjTXRwxhS0UwdG4Ce
         vTrK8/Ix1pajMTVF0auN01yedCtRWxGqxK/IKCpvqUWSyUrkA3EOaoMuGYbfh5FlXWFA
         NDLyEaAirQwzYdk8/Vk1d0VVH9u7i1XbIkDsFNAQFBcURhbt0Xql5B/VDrRr1QWY3HXI
         TpNht0PZfX66+7iQCqx0tTsKCHluc2aOXxvDZjwc4iSztfBSYaRpATtkcHHu9VLly+62
         9S6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764854188; x=1765458988;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NG0EewGU/m3seu0dnYeXl0q+SbDSXR6KqjikfXMh8A4=;
        b=le1Tu5TDlsZtyvxodtLuYLlAEq2zB0BjBRGi1Z2iVC5eRQccmAkGBHyY7FLMxzaAYn
         x1Q5j3hML7bPmh+BUxVqXQ1Vn7P7iiXCJv2UPCXouL65oNKf6VyKQGXQY1tX3bBQy5Xk
         JxmYtsdIqtsoNm69W2Bbaw7jowUiJdq1Q1vvitG1HDfVm01dCYtRhkf0rJRKmoVHGVIG
         8Vb6gxmiyasmnkHcwNtapojHUKJvQZhtIqlvOE4w/TfGVZBE97yVrSmQSoFPDO7Q1JKv
         2tt4c+u+5Edxk3qn02lHQUEl710R104kEZsZwOmxRym55rYSZYS7in3rkvAjVcszv6Ud
         +X/Q==
X-Forwarded-Encrypted: i=1; AJvYcCW7qQSUZz+1ewtrUgGHErgtUxiAzIMPOATx61+gLGaAyN8zPRpfP+yXFXId7YdNXRdH/Y3Kb6a1fZ0YiiYepG7R@lists.infradead.org
X-Gm-Message-State: AOJu0YxfxAD92bmqhcYlMLqVhCkjabff1fJohwUHSb3L9bxpu7DM2wyW
	hi6odfB8T8nau4KihIK1XSA3ds5rACR+u10U8M7azkPJH+LzXLki4nMQfoeANaFqBhs=
X-Gm-Gg: ASbGnctBEsUhw/xaXnyMraoI73v5iGH7mv+02INzBXxQxtT5aOjSoGgB4QRFxnu5yK7
	ETTUWZuARgev0O3kA3GNysXB9qH/+JFv2wER9voQyozY+57NqHcRJjI0G3xQjBGR2JOlXvJOU70
	JV+c2Eipgl+PRCmvPIleU+2OfQEhtpy0M2GTiRQA2LddFjjy6mp5wdEgYKxJ/govIiczi7xl2DA
	2fkdBQRuGhqhSqOFfK88vIAf5kMFTHl6mcCoHKO91wTLVUfswpKjePa7bV0yPb6IwN5KoELsJch
	PDwkrHnVaCxw5DFvTfjB87fEZG5kFL/zrJD31OS1tw6sCNBmnIe4c2tVdz2n5mk1Ld/HtFE+Rtp
	aYH9OPRICm6x9uXZXaRRxJVcH2iJlHjmLPxVYMJjaKp1q0ArhKKK3Mzj8c+CHESHqJoeCnDXeLC
	W0DRWa5VY9lXKeBDZesxB17c0=
X-Google-Smtp-Source: AGHT+IFrB7/13g+70t+q6Tfh05eJRWVooKVrov8IamBiYIRpay1PS4xRXZ4UfhLRB6v8AGDznuHK1g==
X-Received: by 2002:a17:90b:1c0a:b0:340:be2e:9884 with SMTP id 98e67ed59e1d1-34921072ea4mr3001865a91.1.1764854188145;
        Thu, 04 Dec 2025 05:16:28 -0800 (PST)
Received: from localhost ([1.232.169.190])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3494f38a27asm1890893a91.4.2025.12.04.05.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 05:16:27 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Dec 2025 22:16:24 +0900
Message-Id: <DEPGLFUVHA0O.XSZVD2T1ENLD@ventanamicro.com>
Subject: Re: [External] Re: [PATCH v3 5/8] riscv: smp: use NMI for CPU stop
Cc: <conor@kernel.org>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
 <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <luxu.kernel@bytedance.com>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <jassisinghbrar@gmail.com>, <conor.dooley@microchip.com>,
 <valentina.fernandezalanis@microchip.com>, <catalin.marinas@arm.com>,
 <will@kernel.org>, <maz@kernel.org>, <timothy.hayes@arm.com>,
 <lpieralisi@kernel.org>, <arnd@arndb.de>, <kees@kernel.org>,
 <tglx@linutronix.de>, <viresh.kumar@linaro.org>, <boqun.feng@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <cleger@rivosinc.com>,
 <atishp@rivosinc.com>, <ajones@ventanamicro.com>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "yunhui cui" <cuiyunhui@bytedance.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20251127125305.89961-1-cuiyunhui@bytedance.com>
 <20251127125305.89961-6-cuiyunhui@bytedance.com>
 <DEP4X1DAIOU5.2WLIV4BMWLMRR@ventanamicro.com>
 <CAEEQ3wmAn=9w=fR=OMTMF17_tAcEnsdJWL_w8fw-3wA-Bfi6xw@mail.gmail.com>
In-Reply-To: <CAEEQ3wmAn=9w=fR=OMTMF17_tAcEnsdJWL_w8fw-3wA-Bfi6xw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_051629_149851_1D852912 
X-CRM114-Status: GOOD (  15.73  )
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

2025-12-04T13:28:45+08:00, yunhui cui <cuiyunhui@bytedance.com>:
> Hi Radim,
>
> On Thu, Dec 4, 2025 at 12:07=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrc=
mar@ventanamicro.com> wrote:
>>
>> 2025-11-27T20:53:02+08:00, Yunhui Cui <cuiyunhui@bytedance.com>:
>> > Use NMI instead of IPI for CPU stop if RISC-V SSE NMI is supported.
>> >
>> > Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
>> > ---
>> > diff --git a/drivers/firmware/riscv/riscv_sse_nmi.c b/drivers/firmware=
/riscv/riscv_sse_nmi.c
>> > @@ -58,6 +58,7 @@ static int local_nmi_handler(u32 evt, void *arg, str=
uct pt_regs *regs)
>> >       type =3D atomic_read(this_cpu_ptr(&local_nmi));
>> >
>> >       NMI_HANDLE(LOCAL_NMI_CRASH, cpu_crash_stop, cpu, regs);
>> > +     NMI_HANDLE(LOCAL_NMI_STOP, cpu_stop);
>>
>> Please document the intended preemption design for all SSE events,
>> because it will be a nightmare if we forget some assumptions in the
>> coming years.  (That includes the relative priorities of RAS/PMU/...)
>
> Actually, LOCAL_NMI_CRASH, LOCAL_NMI_STOP, LOCAL_NMI_BACKTRACE,
> LOCAL_NMI_KGDB, ... are all implemented via the single SSE event
> SBI_SSE_EVENT_LOCAL_SOFTWARE_INJECTED. Per the SSE design, no
> preemption will occur among CRASH, STOP, BACKTRACE, and KGDB events.

That is how it is.  I don't understand why it must be like that.

For example: PMU_OVERFLOW has lower event_id than SOFTWARE_INJECTED, so
it will currently interrupt NMI_CRASH as they both have priority 0,
although NMI_CRASH probably shouldn't be masked by anything, and should
preempt everything.
NMI_BACKTRACE, on the other hand, probably shouldn't have that high
priority as there seem more important events (e.g. RAS and NMI_CRASH).

The issues can be avoided by event priorities, masking, or deemed as
non-issue, but I think it would be beneficial to provide some reasoning
behind the design, as the choices don't seem obvious to me.

Thanks.

