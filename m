Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B1ED3C912
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 14:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CCXWI9NMLIGKdShYILtPTYF4vSjxO5JfoEVGJGIlybo=; b=ZCnI2E74DTmtYzvNy5BS3DqwjV
	Cu+wFhdSpIwxvsEZl52sHNRTUL7raGGF+2k1bABZkHGa5ZUlT6nn79P5a8UiX2Ty/VwF6MZ5OpPJj
	VXdludBVMtCwaITHc6CrzNpxF1nXlAoLQ6kZaxeR7WwDZb6dFXsIaijyLyTFc/btPgZorI4vt/5+C
	HmHcHRF21TWHJMYFr7TME3EYTK6657YQDZo0+/OzMw84SZ8NvkOYDj2JAfVklbR/TSfmeEBbHv34A
	bqwBJnbE8IpV/rMa2zczt3kVSS7KZie1Ol+drU1VMh6gwT/tz+Hrk9FeUfIae2nGPjElpuqIxbfs8
	uPSxJEsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTL5T-0000000FW47-0q2j;
	Wed, 10 Dec 2025 14:22:39 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTL5O-0000000FW2R-2Adb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 14:22:35 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-349e7fe50c3so337615a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Dec 2025 06:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1765376553; x=1765981353; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CCXWI9NMLIGKdShYILtPTYF4vSjxO5JfoEVGJGIlybo=;
        b=SD5ZkwEiteTpqzhrgMadE/8LW/0yV40ONUvx9hMjXOQR9WzQURAqXedjWVsOKOB2Sb
         wDzeO444t+hPN/3jiLjhZXPKoC8JdwPGbd/EL+TZRDE+kEYdT/6ShEx5Sokrk18gC+DP
         bZrMSsFD+VXsgO4kahi/k5FqTTJgTzsYNdVFNtmJ3v0uBKHT1LQQccB4qmieVwGh2IcD
         RnlUGC+V7hwtbUxiBgMeXYpS+koJtAOHK40gjKsGmLBy6RxnaSO0QlWwE01iG4RYX8Rg
         4i4ibLVrppBPbUuJxfH5Fd9m40TLBKuVPjK7/QNKltPeNQo4sybm9Z5OdSo8lBQoLYhf
         57hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765376553; x=1765981353;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CCXWI9NMLIGKdShYILtPTYF4vSjxO5JfoEVGJGIlybo=;
        b=ccD/8SDi5I3AvFjbeE2OlO3ekBJY0Y8EfPN62RUxrK3uw8QBftTjVNufDTjO2gFGf4
         +Z6si4INB99Zt+9/NTA2xuHuuoT5ocRbK1zYUIrSKWY+rkxJE0nkN5tFBJ4PGO3DX+EO
         I/xOdTTNXyxuNOtJ3kKbKAzaVD34KEBZTuYXqYu5WIcANLUr/HV7PsxuJezfNewzEC94
         5fN6EeAwK5nY/myYtfJH//ExOgZIF6asDhOQYp9sH9C6xSPqzFSo4smfZQl+YVsVDMzY
         OYkMXxMNj9SSrjsuzMNPET6/2XOxYG6k5elSdJzD/OPjnO/Da4ygLCWG4YJqfY0t+Qp2
         GBWw==
X-Forwarded-Encrypted: i=1; AJvYcCUtCqhCVCZWICBR5Oe2w8Ji/qDl5FUIUFQC1Ox+etu6ZqTdzlZAQBVAsBOX9BCKTkhIcZ7do+r30/EdUX/uJXtY@lists.infradead.org
X-Gm-Message-State: AOJu0YwNIJKdHUx7mGOWKUEPNjz9BBT3/gSRhkz0s1OMZpNUpxNWQPXZ
	avxvqafX0YPAfmk9pT8GTJXVlK8MOlPdMv4InN4EQKawe9PC7xtvoRwQxnrVvYCCLRA=
X-Gm-Gg: AY/fxX4glYQyzxj6bfh3pJvq+MB1WlsK7D5D8N4771jtYFYLmfDjYvRgfQiUf7zBHdw
	RtgV4gKL6UR4irVce9jbx25W1d8KREI3MVLMFYSuSCyOXYuj1YN18Pw/aIs7Y/dLCcYUCh1DEaB
	Pe3LKGcn0i7Q4NSVkiqTw9vY4EcSL3SqE8csJlofeDgTHUx4N3+GRWxWeeY0t1B8Jeqva+EY36y
	FkLwdFYrVmzKXK3HwsYO+XhYEcyI5lPnQqACRPKuj9lF5XcPkdV8YuwNlWt6BxNW0tGZkNmydr8
	HxEEViFRyy1YXsQBxHi4HUDOuYLkYdVZtFZcRdq84uctyAiiCj9Mcpkzdk382M9lpsqB031XV/S
	F1eIZbYaV7smAUoTQ2mk8O5w7D3QLz9rQK9KsVpjkoZsjr8kTKeSN7jpAKdGDiJIh7PmlkMUM1J
	aQ0xAJMjadRDyhiTo=
X-Google-Smtp-Source: AGHT+IH+3VoOPNGdth2Gvi9WRF0RQbU1oEXZJauN9cdeoWV6+Oc4w9B7Ps/1EmONqCkTRg9MS367vA==
X-Received: by 2002:a17:90b:1643:b0:343:6a63:85d1 with SMTP id 98e67ed59e1d1-34a728c81damr1938262a91.6.1765376552581;
        Wed, 10 Dec 2025 06:22:32 -0800 (PST)
Received: from localhost ([2400:4050:300:5200:def6:5e63:b5ff:c77])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-34a6ff012f1sm2743460a91.4.2025.12.10.06.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 06:22:31 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Dec 2025 23:22:29 +0900
Message-Id: <DEULRAM55E2G.1464D4JSWL3SZ@ventanamicro.com>
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
 <DEPGLFUVHA0O.XSZVD2T1ENLD@ventanamicro.com>
 <CAEEQ3wngwxjiytt7g6XY0bC1PL4A1NEmirML7FiqXMA4_K0irw@mail.gmail.com>
In-Reply-To: <CAEEQ3wngwxjiytt7g6XY0bC1PL4A1NEmirML7FiqXMA4_K0irw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_062234_756416_375AE0F5 
X-CRM114-Status: GOOD (  23.29  )
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

2025-12-08T19:40:39+08:00, yunhui cui <cuiyunhui@bytedance.com>:
> Hi Radim,
>
> On Thu, Dec 4, 2025 at 9:16=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcm=
ar@ventanamicro.com> wrote:
>>
>> 2025-12-04T13:28:45+08:00, yunhui cui <cuiyunhui@bytedance.com>:
>> > Hi Radim,
>> >
>> > On Thu, Dec 4, 2025 at 12:07=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <r=
krcmar@ventanamicro.com> wrote:
>> >>
>> >> 2025-11-27T20:53:02+08:00, Yunhui Cui <cuiyunhui@bytedance.com>:
>> >> > Use NMI instead of IPI for CPU stop if RISC-V SSE NMI is supported.
>> >> >
>> >> > Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
>> >> > ---
>> >> > diff --git a/drivers/firmware/riscv/riscv_sse_nmi.c b/drivers/firmw=
are/riscv/riscv_sse_nmi.c
>> >> > @@ -58,6 +58,7 @@ static int local_nmi_handler(u32 evt, void *arg, =
struct pt_regs *regs)
>> >> >       type =3D atomic_read(this_cpu_ptr(&local_nmi));
>> >> >
>> >> >       NMI_HANDLE(LOCAL_NMI_CRASH, cpu_crash_stop, cpu, regs);
>> >> > +     NMI_HANDLE(LOCAL_NMI_STOP, cpu_stop);
>> >>
>> >> Please document the intended preemption design for all SSE events,
>> >> because it will be a nightmare if we forget some assumptions in the
>> >> coming years.  (That includes the relative priorities of RAS/PMU/...)
>> >
>> > Actually, LOCAL_NMI_CRASH, LOCAL_NMI_STOP, LOCAL_NMI_BACKTRACE,
>> > LOCAL_NMI_KGDB, ... are all implemented via the single SSE event
>> > SBI_SSE_EVENT_LOCAL_SOFTWARE_INJECTED. Per the SSE design, no
>> > preemption will occur among CRASH, STOP, BACKTRACE, and KGDB events.
>>
>> That is how it is.  I don't understand why it must be like that.
>>
>> For example: PMU_OVERFLOW has lower event_id than SOFTWARE_INJECTED, so
>> it will currently interrupt NMI_CRASH as they both have priority 0,
>> although NMI_CRASH probably shouldn't be masked by anything, and should
>> preempt everything.
>> NMI_BACKTRACE, on the other hand, probably shouldn't have that high
>> priority as there seem more important events (e.g. RAS and NMI_CRASH).
>>
>> The issues can be avoided by event priorities, masking, or deemed as
>> non-issue, but I think it would be beneficial to provide some reasoning
>> behind the design, as the choices don't seem obvious to me.
>
> Indeed, it is necessary to consider the priority among different
> events. Should different priorities also be assigned to NMI_CRASH,
> NMI_BACKTRACE, NMI_STOP, and NMI_KGDB?

I think it would be beneficial to document the desired behavior even if
we can't (currently?) implement it, because like you said, SSE can't
directly express the priority when multiplexing SOFTWARE_INJECTED.

>                                        Do these operations need to be
> visible to the BIOS?

BIOS shouldn't care what lower privilege wants to do.
SBI could define more events for software use, though.

>                      Could you kindly provide some good suggestions?

I think it would be good practice to explicitly set a unique priority
when registering SSE events.  Maybe through a global priority enum, and
make sure that all event registrations are passing a value from that
enum.

That would make sure that different events interact like we expect them
to, but it doesn't solve the multiplexing issue of SOFTWARE_INJECTED.

If we're fine with all SOFTWARE_INJECTED sub-handlers having the maximal
priority (higher than RAS/PMU/UNKNOWN_NMI/...), then we could hope that
lower imporance handlers (e.g. BACKTRACE) won't hang, so the higher
importance handlers (e.g. CRASH) would eventually run.
We're dealing with low-occurrence scenarios, so this might be "good
enough for now"...

Situation would get simpler if we could avoid some sub-handlers;
alternatively, it would get more complicated if SOFTWARE_INJECTED had
lower priority than some other event -- we'd make CRASH partially
recover its high priority image by masking other SSE events during its
execution (and we'd need warding amulets against hangs and starvation).

Thanks.

