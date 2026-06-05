Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C70C2CD6E7B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 20:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cho74LPPbfY4ufBiNs1OFbSMRQHOtbZk95CDddcuzRA=; b=dsMsD5tvj0KxMG+EY5GeK3n6vs
	Czj5xHqwrd8MhlKpf4iF4gGz+ZwyOCbbEg7FKpuh+W2Jqg+kJphsHqSTVVfzbeJACsdsn3uXpX55p
	X1fVTOS3z18qF57tn5JPQeXTPgQWSxlYzSoaZMD8ZNWSqVT8y2zb55Fz/SwmCHvyg6Jc0X8ngN+jc
	/GRpu8UsC0Uda8xdHKI6ihKrOCmJsIllOX9+iIuH5LaMPBKSJELc7eGOZxsBv0uU0RlZwnF3dKNfD
	9Z2TmKzQO5TV8uKcTZs/TgHJMvqJt/07/4kU7YGuH4EFjdBFLG6PzA7jYbWafx6xaeTpzaOhMjELk
	UenixVJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVbNp-00000001AVi-0oVz;
	Fri, 05 Jun 2026 20:43:13 +0000
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVbNm-00000001AV8-37AK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 20:43:12 +0000
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-963b09d5b91so2042085241.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 13:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780692189; x=1781296989; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cho74LPPbfY4ufBiNs1OFbSMRQHOtbZk95CDddcuzRA=;
        b=e7bRVv94JMHTHLfvnsCVVcfkfjVGLLYqmZm5GHf6jSwbx8xuLq8psIqrBrU5ZTXA0u
         +DzModjQp08YdREV7B9D1sZTIXBlJhocnWmLtbY0QhBjiii2RUUt0ZgUUmRZ4XLxrxk+
         ZJG5tD1xYH5rssxWE+b5rPT74JSwqIxYs83kA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780692189; x=1781296989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cho74LPPbfY4ufBiNs1OFbSMRQHOtbZk95CDddcuzRA=;
        b=Ia/lW6vdtnJ2yWYBR8T0OBxsQieSv0X4JtqLrWvsXNeiUT8Zx0T15QUg1i8c0FSos7
         7iXQ4GISs5+0uFWbKpgTIJ+rwu2nxAjVpWlEvxVMPTxE9rXuytOgSzEGRmq+/xB21M6A
         T/QX7Dy9EusnHELcVuo46cD/sAtvibpmxAXWrg4IimokMGAdXtJgGSX38yf4pXdCJkWj
         /2ABTyfeWF8N+h1Vra2h3eECrQBY2ftrkQF6Ln/NZOqNzl1UD4UQ/BvV3ir0XQBwN/Cs
         4urUZVza1PqZ/UWkELqLzSQ5gU6zGbg4qWpivTlL3trFMtcZ4Kvc3K/hQqCHZ4930UVQ
         Ciww==
X-Forwarded-Encrypted: i=1; AFNElJ8o89e3jPEmzzeP1quFUZAtAO921OHM1C5jVxbmeQ7FMVDA26x1ofvcx5b5WLhkzXoBFsbnCdeKX2ePHvKyeIXS@lists.infradead.org
X-Gm-Message-State: AOJu0YweA9I4CZCYHm/5/zhBG32TIgNaurR+98A1dzSnAs9Kv3wV+ibj
	ymK3SSVbQL2RnLktg+zCQ5inOyrJgLr3M64n8fOuQr+mvr1GD4HAq54UvS7yk5BSabQxs7zu27J
	VdTE=
X-Gm-Gg: Acq92OE4jxnTBebAtbWY+WEH4xXlBKsWC1peFZDc3GXz+RC3hyWsQBxhkWsOMtC2vBM
	h3Z5TthdRh0CwYXLA40KYmZQgn4yDNDlPClgZ71MRprlALy0paUFfKhc/vNsfLhiKevKphp3fZT
	ff15S6DgXctE3TlB3TlljZVJ+o5YUfmWHknQyYQfYTiZ/wR+MX5Z6RlHUopmqR62bTHbdVrYOHk
	30NzON2QIWjRRsO8guXdgFYgia0wK0St8CVLN/PA7CIsEvInbhdBh6N5lylaMnNbNTEFKWIduQ1
	pS3Hb+PIuQpVT5xl9+UlrRFMz8G8VHYjyi0J9BOOYX0UP+s60tozyBoDzT/rbKBAFJO8NHpN++b
	c+9p0QTA5TJZfliCu3B0NdoFKXdyBg6i0Mntx/UIcLZJYmEKedmPU3zIDvH9Rg9ICBvwsg5Le3S
	W2hErKEGWCC6zQqLVpUJg+omU4sOB57UhWoZXG+l5j+ghbY4Eql5di9pDo3x7NCFmOUKGwzC3L7
	JEOXmH/hQD81ZQ=
X-Received: by 2002:a05:6102:419e:b0:6ce:d923:7642 with SMTP id ada2fe7eead31-7003bf5c587mr1726854137.14.1780692189256;
        Fri, 05 Jun 2026 13:43:09 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6eb36325d59sm8938097137.0.2026.06.05.13.43.08
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 13:43:09 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-59bf145a74fso2244823e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 13:43:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+r288faWj4tsF1gl0Gb5EELny+8kcDu1iEQJNGiPmAMxRy+42VSSIXWS0q7erVC5viruDDCM4jylOkJNsZiOff@lists.infradead.org
X-Received: by 2002:a05:6122:6d0c:b0:56b:942f:b870 with SMTP id
 71dfb90a1353d-5acce97fa0bmr1782104e0c.0.1780692188106; Fri, 05 Jun 2026
 13:43:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1780496779.git.kas@kernel.org> <54cb99db3c981dc39eb3031aff5caeaadb09e8b9.1780496779.git.kas@kernel.org>
In-Reply-To: <54cb99db3c981dc39eb3031aff5caeaadb09e8b9.1780496779.git.kas@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 5 Jun 2026 13:42:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X5++c-6Wd6babajiPbn07cfPcG0uW3ZeepznXgSVO2+w@mail.gmail.com>
X-Gm-Features: AVVi8CflIYMiZRPhuoda88AFJmay5Li2jpcnqm8IPxUeStYcxSTeJUSPo89hfx4
Message-ID: <CAD=FV=X5++c-6Wd6babajiPbn07cfPcG0uW3ZeepznXgSVO2+w@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: route crash_smp_send_stop() last resort
 through SDEI
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Petr Mladek <pmladek@suse.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Usama Arif <usama.arif@linux.dev>, 
	Breno Leitao <leitao@debian.org>, Julien Thierry <julien.thierry.kdev@gmail.com>, 
	Lecopzer Chen <lecopzer.chen@mediatek.com>, Sumit Garg <sumit.garg@kernel.org>, kernel-team@meta.com, 
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_134310_856549_57677643 
X-CRM114-Status: GOOD (  25.74  )
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

Hi,

On Wed, Jun 3, 2026 at 7:36=E2=80=AFAM Kiryl Shutsemau <kirill@shutemov.nam=
e> wrote:
>
> @@ -1288,8 +1288,32 @@ void crash_smp_send_stop(void)
>                 return;
>         crash_stop =3D 1;
>
> +       /*
> +        * Stop the normal way first: IPI_CPU_STOP escalating to a pseudo=
-NMI
> +        * IPI. Every CPU that responds saves its state via crash_save_cp=
u()
> +        * and parks in cpu_park_loop() with its online bit cleared -- th=
e
> +        * standard kdump stop, identical to a kernel without SDEI. Cruci=
ally
> +        * those CPUs stay in a clean, potentially-reusable state.
> +        */
>         smp_send_stop();
>
> +       /*
> +        * Whatever is still online didn't respond -- typically a CPU wed=
ged
> +        * with interrupts masked. The plain IPI can't reach it, and a fl=
eet
> +        * that declines the pseudo-NMI hot-path cost has no NMI IPI to
> +        * escalate to. Hit only the survivors with the SDEI cross-CPU NM=
I
> +        * (no-op if SDEI isn't active, or if everything already stopped)=
:
> +        * firmware delivers out of EL3 regardless of PSTATE.DAIF, and th=
e
> +        * handler captures crash_save_cpu() state from the wedged contex=
t
> +        * before parking the CPU.
> +        *
> +        * SDEI is deliberately last: an SDEI-stopped CPU never completes=
 its
> +        * event (it parks inside the handler, so EL3 retains its dispatc=
h
> +        * slot until reset), which is strictly less recoverable than a n=
ormal
> +        * stop. We pay that only for CPUs that left no other way to reac=
h them.
> +        */
> +       sdei_nmi_crash_smp_send_stop();

It feels weird to me that you're adding SDEI for "crash stop" but not
for regular "stop". It feels like you should modify smp_send_stop() to
fall back to SDEI if sending the NMI failed, instead of adding this
separate path.


>  static int sdei_nmi_handler(u32 event, struct pt_regs *regs, void *arg)
>  {
> +       int cpu =3D smp_processor_id();
> +
> +       if (READ_ONCE(*this_cpu_ptr(&sdei_nmi_crash_stop_requested))) {
> +               WRITE_ONCE(*this_cpu_ptr(&sdei_nmi_crash_stop_requested),=
 0);
> +
> +               /*
> +                * Capture the wedged context for kdump while pt_regs sti=
ll
> +                * points at the interrupted PC. This is the main motivat=
ion
> +                * for using SDEI here: the plain IPI stop path can't rea=
ch an
> +                * interrupt-masked CPU (and the fleet declines pseudo-NM=
I to
> +                * keep the IRQ-mask hot path cheap), so crash_save_cpu()=
 for
> +                * that CPU would otherwise record nothing useful.
> +                */
> +               crash_save_cpu(regs, cpu);
> +               set_cpu_online(cpu, false);
> +
> +               /* publish the crash state/offline before the requester s=
ees the ack */
> +               smp_wmb();
> +               WRITE_ONCE(*this_cpu_ptr(&sdei_nmi_crash_stop_acked), 1);
> +
> +               /*
> +                * Park forever from within the SDEI handler. We delibera=
tely
> +                * do NOT issue SDEI_EVENT_COMPLETE: the framework's retu=
rn
> +                * path restores firmware's saved interrupted context, wh=
ich
> +                * would land the CPU back wherever it was running (often
> +                * do_idle, which then notices cpu_is_offline=3Dtrue and =
BUGs
> +                * at cpuhp_report_idle_dead). Returning the modified pt_=
regs
> +                * doesn't help -- arch/arm64/kernel/sdei.c::do_sdei_even=
t
> +                * only honours a PC override via its IRQ-state heuristic
> +                * and otherwise hands EL3 its own saved-context slot bac=
k.
> +                *
> +                * Trade-off: EL3 firmware retains ~one saved-context slo=
t
> +                * per parked CPU until the next hardware reset (~hundred=
s of
> +                * bytes per CPU). The CPU itself is parked in cpu_park_l=
oop
> +                * exactly as if IPI_CPU_STOP had stopped it; recoverabil=
ity
> +                * is unchanged versus the existing path (neither is
> +                * recoverable without hardware reset, since PSCI sees th=
e
> +                * CPU as ALREADY_ON in both cases).
> +                */
> +               cpu_park_loop();
> +               /* unreachable */

Any chance we could avoid duplicating stuff from ipi_cpu_crash_stop()?


> +bool sdei_nmi_crash_smp_send_stop(void)
> +{
> +       unsigned int this_cpu, cpu, remaining;
> +       unsigned long timeout;
> +       cpumask_t mask;

The above will probably get you a yell. Putting "cpumask_t" on the
stack is a no-no since it can be quite large under certain CONFIG
options. This is why it's nearly always defined as "static".

-Doug

