Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B2AD3B7DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 11:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SQVOH2B/Iq6YYMqj4RgBo/zVXWWLuhChDWBfQft/cck=; b=bWIpqDiYXmFIvyDG60UbXL4c+E
	vmrllb9orVZu9nzujmK+I+7phABgdtDdfTFwt7Uiu4McAoeScTi0CHzRwbFaPP6c5zzX5gY+VQAyG
	6P6tfWFz8B7o6ubgGXByB1gk/k0V3Dvjl0aUsIYwdumIkr/GC6E8Nz6PBv43hZ3Augy3EeRkXY2hr
	QnGtA4eEOWv4YzkmrjrZWQExz8hCHIZ+B5V5G6zBz8kHJ4OKTVk/16HJNGIoPb5l+tWCNPUbQCsi1
	nDGif88CiadbVMrXx/kTD7HlNCPQf9VT3h4m2AIqLasoZWrvws54IazMnzpKFCXaF3084X9YkorqQ
	rpj1yBEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSZbs-0000000D1Ki-22kh;
	Mon, 08 Dec 2025 11:40:56 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSZbo-0000000D1JN-1It9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 11:40:54 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-44ffaeda17fso2078737b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Dec 2025 03:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1765194051; x=1765798851; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQVOH2B/Iq6YYMqj4RgBo/zVXWWLuhChDWBfQft/cck=;
        b=lcN4P5EpX/Fo0K9u7MdlBHTkPcW0O8GhOaed0zvbIQJt12ieW7nwbOUq8vCOhQk3GQ
         RBQ1L0SWZaSbByDWDDOMAI9vTA5cgvMfeqSQWpG/WZxROIXcvvUA381eynYan37Va4LB
         6quCw8FlOY3vi8j8jKjmLpUbOifQ1YMe6n9JrTh25OLST+m8RBzLPnjZ0R8lhI1RQswS
         QxXjE/bE18YqnjadT5qhUFV5K7AvLDxM4/h5ChbhggLEI70Xxlx28FtIL9HCB0YWQUwo
         +qsxzpRWxdL/i/pjrlGtFA7JVQ4oDFhD9882jIuEsf5yzQvlc8ahGYbTnsACas2qCHFc
         I3JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765194051; x=1765798851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SQVOH2B/Iq6YYMqj4RgBo/zVXWWLuhChDWBfQft/cck=;
        b=s8AxLpqesj8f0T1UaaDOYWYDSKAP4zzO3+TksLVI2cV46KxvhPL8BaLyefQ5SgiY/7
         jvNpokygOvSvoq+nekA8USOXb/8sKcKHDVuk9z0bY71mi0W82d14mmhzfewkVr6bxTPZ
         glShHmDmsSOOJLtGz1S4ugbEsAWkGV0CdPDhg46qpdy6NlTu9QVxl9UYaP39IiLGc0f8
         k5klr4vZYtJfUX2qX8VUuELXT8KPZFHbymCa3LXikGsxz5MNUXFHCw+gEYCr85a6ITBg
         eSNY/DAiFIVoIIJ1+47I6AbgJ2e32s0b+Rif8TRCg/vj0TCKrngiavLQ+mgOuOmcrzZ0
         Kygw==
X-Forwarded-Encrypted: i=1; AJvYcCWbkcdFIwFfGQ1QEcM5VQ9OsT4lBj+5x8CF5gjX2mdblp+2ZIvXvQ+ECfccmzUuJ1vqb9KEu2I2BsGEnrO5JLVR@lists.infradead.org
X-Gm-Message-State: AOJu0YygJgrxQCzvtaWx5+FovqQ4CIZjGud2Gdbyy+71wfq/t+f6sM37
	mj8NLpEV0aNv7KUncdgHCzQDcGl2+NgqO46WMNmSnSSytY8X4dYP6SUvVLFeTX+JH0ehY7XlWr8
	2ZQbOBPufclrFgbCB7mVcDBhIe+4qPFHnlIx03uuc7g==
X-Gm-Gg: ASbGncsosJeXeCG8R+uDI9toutK+5RE9/eV5EXIaMjUL/3TCbb1rUe8kQ2Jc43/a9qk
	gfF1k+ThrQhMZWWa3L1fVHgclqy4aiehXol5s6Sz86nWmxmW4Yn3antugtU3sTACbp9xPSIJbLs
	iIVK5qja+pl7LnfN5z/yKjOdhbA6Wv6WPWjE/fAXYUI0nrFNIoemsvtL04+SFlrRrId5y0Q8XRa
	JCiTL0CGLM1N+9ghpi5VEQ0d+/Cca5k6f5jnkY775OpchF15xHhkc6RtFp7I+M9g8OfFoENbOi4
	+w==
X-Google-Smtp-Source: AGHT+IEECWwcEtv7SAXdvNWHH/vuEB3o8C72qYNlg5nTdw0L4CUHSC5qHDSb+PMHbRUu0R+XZrhTguRpCMBK3ZSfIxI=
X-Received: by 2002:a05:6808:e82:b0:450:3124:53b7 with SMTP id
 5614622812f47-4539e0cb238mr2880346b6e.67.1765194050990; Mon, 08 Dec 2025
 03:40:50 -0800 (PST)
MIME-Version: 1.0
References: <20251127125305.89961-1-cuiyunhui@bytedance.com>
 <20251127125305.89961-6-cuiyunhui@bytedance.com> <DEP4X1DAIOU5.2WLIV4BMWLMRR@ventanamicro.com>
 <CAEEQ3wmAn=9w=fR=OMTMF17_tAcEnsdJWL_w8fw-3wA-Bfi6xw@mail.gmail.com> <DEPGLFUVHA0O.XSZVD2T1ENLD@ventanamicro.com>
In-Reply-To: <DEPGLFUVHA0O.XSZVD2T1ENLD@ventanamicro.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 8 Dec 2025 19:40:39 +0800
X-Gm-Features: AQt7F2p_htORIVLmGKEXqzC2TV1lLZw4ZgAjVo77H4ntTApfAZuYosNPg5AAU54
Message-ID: <CAEEQ3wngwxjiytt7g6XY0bC1PL4A1NEmirML7FiqXMA4_K0irw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3 5/8] riscv: smp: use NMI for CPU stop
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: conor@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, luxu.kernel@bytedance.com, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	jassisinghbrar@gmail.com, conor.dooley@microchip.com, 
	valentina.fernandezalanis@microchip.com, catalin.marinas@arm.com, 
	will@kernel.org, maz@kernel.org, timothy.hayes@arm.com, lpieralisi@kernel.org, 
	arnd@arndb.de, kees@kernel.org, tglx@linutronix.de, viresh.kumar@linaro.org, 
	boqun.feng@gmail.com, linux-arm-kernel@lists.infradead.org, 
	cleger@rivosinc.com, atishp@rivosinc.com, ajones@ventanamicro.com, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_034052_360291_FB54D81C 
X-CRM114-Status: GOOD (  22.13  )
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

Hi Radim,

On Thu, Dec 4, 2025 at 9:16=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar=
@ventanamicro.com> wrote:
>
> 2025-12-04T13:28:45+08:00, yunhui cui <cuiyunhui@bytedance.com>:
> > Hi Radim,
> >
> > On Thu, Dec 4, 2025 at 12:07=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <rk=
rcmar@ventanamicro.com> wrote:
> >>
> >> 2025-11-27T20:53:02+08:00, Yunhui Cui <cuiyunhui@bytedance.com>:
> >> > Use NMI instead of IPI for CPU stop if RISC-V SSE NMI is supported.
> >> >
> >> > Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> >> > ---
> >> > diff --git a/drivers/firmware/riscv/riscv_sse_nmi.c b/drivers/firmwa=
re/riscv/riscv_sse_nmi.c
> >> > @@ -58,6 +58,7 @@ static int local_nmi_handler(u32 evt, void *arg, s=
truct pt_regs *regs)
> >> >       type =3D atomic_read(this_cpu_ptr(&local_nmi));
> >> >
> >> >       NMI_HANDLE(LOCAL_NMI_CRASH, cpu_crash_stop, cpu, regs);
> >> > +     NMI_HANDLE(LOCAL_NMI_STOP, cpu_stop);
> >>
> >> Please document the intended preemption design for all SSE events,
> >> because it will be a nightmare if we forget some assumptions in the
> >> coming years.  (That includes the relative priorities of RAS/PMU/...)
> >
> > Actually, LOCAL_NMI_CRASH, LOCAL_NMI_STOP, LOCAL_NMI_BACKTRACE,
> > LOCAL_NMI_KGDB, ... are all implemented via the single SSE event
> > SBI_SSE_EVENT_LOCAL_SOFTWARE_INJECTED. Per the SSE design, no
> > preemption will occur among CRASH, STOP, BACKTRACE, and KGDB events.
>
> That is how it is.  I don't understand why it must be like that.
>
> For example: PMU_OVERFLOW has lower event_id than SOFTWARE_INJECTED, so
> it will currently interrupt NMI_CRASH as they both have priority 0,
> although NMI_CRASH probably shouldn't be masked by anything, and should
> preempt everything.
> NMI_BACKTRACE, on the other hand, probably shouldn't have that high
> priority as there seem more important events (e.g. RAS and NMI_CRASH).
>
> The issues can be avoided by event priorities, masking, or deemed as
> non-issue, but I think it would be beneficial to provide some reasoning
> behind the design, as the choices don't seem obvious to me.

Indeed, it is necessary to consider the priority among different
events. Should different priorities also be assigned to NMI_CRASH,
NMI_BACKTRACE, NMI_STOP, and NMI_KGDB? Do these operations need to be
visible to the BIOS? Could you kindly provide some good suggestions?

>
> Thanks.

Thanks,
Yunhui

