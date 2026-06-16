Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEBEFCD98EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 21:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ku36PgmZ23d8x6k2ldFVCZ2r1RXJuytjTrS1Up4q2Vc=; b=HqdtGZushnXM/b0kO/Zbwry/Et
	v+rGYOvUFYLgmqMtMmQ6Bd7KHZY8xC6egZ+NM8V1px6ggdSy9b4WNFJgSL8j9Fc13gXWacXekCv42
	SW1itkJl0fabdt0LLjR19IsEZ4HuWVgIHC2MK6KmLXp31lRlNrfY6Gb6zPgXN4ROWjWQC1nyUVCT2
	f+Z3dPh3KUoZDRiCZaxw8cyHw/j5AuZstuUydIHJdSbPgBz3woW02MK8rclrd/r0DrK/QycWHqF2f
	7YhfsPptUs5MJlZcuaNGrzECTtG5NA351hq2ncyj4RhEiLOc2i1hOA60dDAUu2VrytIfA7uAKXQM3
	Q8BtnHbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZbUQ-0000000GLsw-1buc;
	Tue, 16 Jun 2026 21:38:34 +0000
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZbUN-0000000GLsB-36XG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 21:38:33 +0000
Received: by mail-ua1-x933.google.com with SMTP id a1e0cc1a2514c-9639130b20fso2891305241.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 14:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781645910; x=1782250710; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ku36PgmZ23d8x6k2ldFVCZ2r1RXJuytjTrS1Up4q2Vc=;
        b=OxBIhyS57tR/n+OvwMLuzrruC2iZCzQ97VIOhxYBB7nbjPXjAZirqutgE7AADY05TA
         nMf1cRUPnI4mjlr2PKUUSzHZrhSy1puM7l4EyJkXNGsc/ZfJ5sB6kXKdHOg5zevD/Ay5
         T4hWt0maezGeP60KQqNG1sP7V/1owYRyLA4Ko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781645910; x=1782250710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ku36PgmZ23d8x6k2ldFVCZ2r1RXJuytjTrS1Up4q2Vc=;
        b=UiOPyGyKgL+uRMS5UHlYFfFUsWxRq2gY65JkcbgA/angx595lQMqBBhw+xrIhcUQ3W
         zI8D2DFvqHQzJp37OA7hbU+tCvbXKApph6lGKD87Rzxth8K7oxUrsqT52LLCw8OhN72D
         YHd/AtpD2w57JIVf+a8Ou7nxcwXf8uD5cmJ1XXb3pGxHe1MTEeclu2PRPzn9enTFaWQG
         aCBNOzgEPs9h32FJO++xySR3fwMucZGokG7I5nw1VtQZf29I2rT3lt5kEXdiH/a7SMrY
         SAfrWh+5aRi+7mKJ8gFwP19C4A95KXYTn7lyMes6DIa4y9jxYAwi0ItmwMCDlP9pD/i6
         xKYg==
X-Forwarded-Encrypted: i=1; AFNElJ8qvstf0v5BmUF/0/nZ3F02USX0LDJXaZOV7QfmwiFGgZ2sOXnmNZ4YFDXsBGxVKC/ZxtO53ykgqfTptkgO0Fy4@lists.infradead.org
X-Gm-Message-State: AOJu0YzhAa4YbNb8BxHDOjgx/TFwKCG1l3N2rL88R2eRVeHo+WMkisCz
	EaJlNSuX+VLj+jkzwseBXYlaB7mkiQo8QbqEZ2oSB+5YyykknRtjCBvOUeaDk2wcnWo/Hxt2bVh
	tyw4=
X-Gm-Gg: Acq92OGVeGiF3AJxUXA11roWMls9XJXqrg0IiIcuNJ7AO+zvMVOtpvI2I5TJ8NZWM+N
	L3quQ/KFor1raSnx88Adk5QZvScYY+UwkQiBgufBkBgxwJYbgwpe881LB+xKmguaWOI3KbrAX2i
	LzlK9/4ZFaFWj6i+5Y8dOO05FKYoZISwxMv1TccZYS8KHd3u53ptFFUnpotZfJJMzOEtO5xusE5
	eMsGRzG9LzaAV8jG0HSVuABppMk3vdaBp2u5hSpOqCpRlAPpTGHQx1IkcgMAjZYoAOxdCqA8B6B
	TDdE/5xEpE91kPZPUxhyHtzBpay/S39k8Bd4lkDalkmE654MpPREkOJYl/OF4uBYII3WHzkgbDe
	RknouCB+ixf5VEc6V265tHKcpwS9c5UCWjD2T52UoU8Ptd+Ue6ePViXVk0zv3U4vjRb9MNOCTBf
	Wph/TLEJcYNMns1n/drQPSFkr2zwvIK6tF1Shka+ytDnPb/qKXX4HFqWa9oJZIrA==
X-Received: by 2002:a05:6102:3f48:b0:633:c6c4:b32c with SMTP id ada2fe7eead31-7246c890bd5mr755647137.15.1781645909914;
        Tue, 16 Jun 2026 14:38:29 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-72084cd88e7sm5633386137.4.2026.06.16.14.38.28
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 14:38:28 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-6c25b040554so2740285137.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 14:38:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+wSjPpxrN7MI0BloeRc9Ta21CaMrp29yrvZeiRfZFJ6agejS5eOZA3gxwbaJ3cP3dch27avUOjB4/9Jd+YUbbs@lists.infradead.org
X-Received: by 2002:a05:6102:3910:b0:631:ff40:22b2 with SMTP id
 ada2fe7eead31-7245d20641emr780692137.2.1781645907501; Tue, 16 Jun 2026
 14:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1781490440.git.kas@kernel.org> <167493d30ef6c99a44291de14cddd41ced8149c4.1781490440.git.kas@kernel.org>
In-Reply-To: <167493d30ef6c99a44291de14cddd41ced8149c4.1781490440.git.kas@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 16 Jun 2026 14:38:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WK0=xTZOWK+yDqEtGbbhkvoW50ekHKBBWhpoO9Zb8cBQ@mail.gmail.com>
X-Gm-Features: AVVi8Ce2TIVRIg1dSgVrmoNtDRnxocNt72MHs5ddjhzazA-47T8vaWkWcQhOaik
Message-ID: <CAD=FV=WK0=xTZOWK+yDqEtGbbhkvoW50ekHKBBWhpoO9Zb8cBQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64: escalate smp_send_stop() to an SDEI NMI as
 a last resort
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Petr Mladek <pmladek@suse.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Usama Arif <usama.arif@linux.dev>, 
	Breno Leitao <leitao@debian.org>, Julien Thierry <julien.thierry.kdev@gmail.com>, 
	Lecopzer Chen <lecopzer@gmail.com>, Sumit Garg <sumit.garg@kernel.org>, kernel-team@meta.com, 
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_143831_785784_358F846D 
X-CRM114-Status: GOOD (  26.44  )
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

On Sun, Jun 14, 2026 at 7:36=E2=80=AFPM Kiryl Shutsemau <kirill@shutemov.na=
me> wrote:
>
> +/*
> + * Bring the local CPU to a stop, saving its register state into the vmc=
ore
> + * on the kdump crash path first. The single point every arm64 stop path
> + * funnels through, so the bookkeeping (mask interrupts, mark offline, m=
ask
> + * SDEI, optionally power off) lives in one place:
> + *
> + *   - the regular IPI_CPU_STOP and pseudo-NMI IPI_CPU_STOP_NMI handlers=
;
> + *   - panic_smp_self_stop(), a CPU parking itself on a parallel panic()=
;
> + *   - the SDEI cross-CPU NMI handler (drivers/firmware/arm_sdei_nmi.c),
> + *     which reaches CPUs the stop IPIs could not.
> + *
> + * @regs is the register state to record in the vmcore on a crash stop; =
NULL
> + * means "capture the current context". @die_on_crash decides the kdump =
crash
> + * path: the IPI stop handlers pass true and power the CPU off (PSCI CPU=
_OFF,
> + * via __cpu_try_die()) so a capture kernel can reclaim it. The SDEI han=
dler
> + * and panic_smp_self_stop() pass false and only park. For SDEI that is
> + * required, not just conservative: it runs inside an SDEI event that is
> + * deliberately never completed (completing it has firmware resume the w=
edged
> + * context), and a CPU_OFF from that not-yet-completed context wedges EL=
3 on
> + * some firmware -- a documented follow-up. Parking also matches this pa=
th's
> + * own fallback when CPU_OFF is unavailable.

Nice to have all the details in the function comment. Any reason why
you didn't use kernel-doc format? Nothing else in this file does, I
guess, but it doesn't seem like it would be a problem to start the
trend... ;-)


> @@ -59,8 +64,51 @@ static bool sdei_nmi_available;
>
>  #define SDEI_NMI_EVENT                 0
>
> +/*
> + * Backtrace and stop both ride SDEI event 0. That is not a chosen econo=
my:
> + * event 0 is the only architecturally software-signalled event -- the s=
ole
> + * event SDEI_EVENT_SIGNAL can target at an arbitrary PE. Every other ev=
ent
> + * number is a firmware/platform interrupt-bound event, not something th=
e
> + * kernel can raise cross-CPU, so a dedicated "stop" event would need
> + * firmware to define and bind it -- exactly the firmware dependency thi=
s
> + * driver sets out to avoid.
> + *
> + * Sharing one event means the handler must tell a stop apart from a
> + * backtrace. A stop is terminal and system-wide -- sdei_nmi_stop_cpus()=
 is
> + * only reached from smp_send_stop() (reboot/halt/panic/kdump), which ne=
ver
> + * returns -- so once a stop is requested, every later event-0 fire is a
> + * stop too. A single write-once flag therefore carries as much as a
> + * per-CPU mask would: sdei_nmi_stop_cpus() sets it before signalling, a=
nd
> + * the handler reads a set flag as "stop this CPU" and a clear flag as
> + * "backtrace" (handled by nmi_cpu_backtrace(), which self-gates on the
> + * framework's backtrace mask). A backtrace fire that races in after a s=
top
> + * has begun just stops that CPU instead -- harmless, it is going down.
> + */
> +static bool sdei_nmi_stopping;
> +
>  static int sdei_nmi_handler(u32 event, struct pt_regs *regs, void *arg)
>  {
> +       if (READ_ONCE(sdei_nmi_stopping)) {

Don't you need a smp_rmb() before that, to match with the smp_wmb()?

-Doug

