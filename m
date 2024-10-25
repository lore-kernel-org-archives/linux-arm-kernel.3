Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A19D149CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 18:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8nFesq6fPuvktjrVX6D6kJiVuG2UTKxs3GcGzAOL5j0=; b=HZQoRGHrByND6OJOXCv5PdP2hk
	EjU18MdJbIcp/e/jtlNUi8OIhSbc9sGxlWUi9GIIgBsof7Xtx01LZn07sqWXMNvjPhingEtLg9yHL
	p0Xz5+byeI3fejx2QZ+UfDnXpxEvQmaE+lnGK3Ix87mbn7lEwpzxJVMx07C0x23kyt//SOGxmRehu
	OBve+eSrkQi7T+zQ1DlYsi80i+c3jxInP86YQo/2RSGQFjHm9QvlF/kxf7iKmRKyz6WjLfud9jHdP
	YUx4VLfhpFVJ7LHm8RVeLskR8dX0SjaY/sq2qPa/yldlH7tQNncgkYJ3+tQLARMKteGIrc4niyynT
	6Pzmb27w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Oxn-00000004mde-0Nhc;
	Fri, 25 Oct 2024 18:23:07 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4OA0-00000004bog-34mg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 17:31:45 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-7180a5ba498so1193883a34.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 10:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729877499; x=1730482299; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8nFesq6fPuvktjrVX6D6kJiVuG2UTKxs3GcGzAOL5j0=;
        b=HcLX1W/Qe98zxfpqZtnG4rKeF/rectkVLxoZhaySWh+TjrWsTnOEx/MagQOPYw0rSc
         M5dTT5A0tk0NZiwLmLuuflNv2OAWiP6TpCkeUKGM+L+ySrWOa4rVC3OmwXlEiaT9EWkd
         PNZU1g8znHumKpFTVqRWaHeSUgNG+7DWLCL3WgHxS0bjOrsdUEdUOf+NZR4kEBmVJ6jf
         oqvEcQL+6SjuW1ixOM+vjnR4XPbSaR1iYh+Ir0IPiQ8tv3sXE3eCwaPRn1hjN3i5YmsP
         WWJA4F6Qz0lGdzpmwsy2g7NMpiwNGMnYZ/GDiTPinIj7AybNHtSSg9rpB54nwBGEgla+
         jsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729877499; x=1730482299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8nFesq6fPuvktjrVX6D6kJiVuG2UTKxs3GcGzAOL5j0=;
        b=hGkeiZbYqFyzsTEENd7C+hlzWqYJg9licYZdFPy8o6MSANVngpXWkRP/IdheBumdtG
         dfOJ1oFGl66URSxcJ/Z0czQe42w5Ry+RUOhZJcCxxrLZoGSQ8TA/hwfUfFILMQxM37vG
         e7/j4zpP81NJkS1uegH0jG00vR+2L/kFTuoTpuIomJ6j3PYb33/wUlVFssUOEO7VPjX5
         4feDVWUxFMYndgZGQAEeuP5yfMj5iyfnN+yeGdsbSeXq0HSJ9jjbfzXpZ/clM60CFY5X
         Lwk8il/N6uAe3ixwF1CPWEGhywHNqOSlj9dslw/DBfSHYjYDGY8VQiEVF2ThiSH217vk
         /InA==
X-Forwarded-Encrypted: i=1; AJvYcCVXfXtA1wihi2ciRqPpDUPIxOguJSf74kW7VRRE7IU5iNrtljjJ2hFsTJO2HDqo+wa11FtxDGh4VbsoQdtJyc0p@lists.infradead.org
X-Gm-Message-State: AOJu0YwOVTVQESox/ESyu54Vi6f4/0c5Zc8c950sG4+2uwHPXZqdfnjH
	EqvP5KoEnnQQNH8hRMVV5mFfCIuKjAW+8toNd6/GyvgSZcHiV0nZKtGAbU6Jsgb1wF7h4yZ3K0B
	mujFrgNADgHBBNomVzP4055Aw1BvcbFQYB7GZ
X-Google-Smtp-Source: AGHT+IF4WiLhU1Gd/JNblfLAXfS7pNVnnQCGhJ6THzrAm3Qyvdxiau/k0EXOnmxa65gTsETP/x7JeKI91bH/3f56v+M=
X-Received: by 2002:a05:6830:2814:b0:718:18d6:a464 with SMTP id
 46e09a7af769-71867f11dfemr438530a34.5.1729877498557; Fri, 25 Oct 2024
 10:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <20241021042218.746659-1-yuzhao@google.com> <20241021042218.746659-4-yuzhao@google.com>
 <86a5ew41tp.wl-maz@kernel.org> <CAOUHufanq2_nbNiU_=mCgWufoSGDOS3EpAz+4xB5kB=PV2ECVA@mail.gmail.com>
 <86h6902m7y.wl-maz@kernel.org>
In-Reply-To: <86h6902m7y.wl-maz@kernel.org>
From: Yu Zhao <yuzhao@google.com>
Date: Fri, 25 Oct 2024 11:31:01 -0600
Message-ID: <CAOUHufbEadyAn0WVdJqYKkUjvMfGXXiLjaApjhaHKg93P8Rymg@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] irqchip/gic-v3: support SGI broadcast
To: Marc Zyngier <maz@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Thomas Gleixner <tglx@linutronix.de>, 
	Will Deacon <will@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_103141_071994_08B12652 
X-CRM114-Status: GOOD (  33.49  )
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

On Fri, Oct 25, 2024 at 10:15=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrot=
e:
>
> On Fri, 25 Oct 2024 06:07:45 +0100,
> Yu Zhao <yuzhao@google.com> wrote:
> >
> > Hi Marc,
> >
> > On Tue, Oct 22, 2024 at 9:03=E2=80=AFAM Marc Zyngier <maz@kernel.org> w=
rote:
> > >
> > > On Mon, 21 Oct 2024 05:22:15 +0100,
> > > Yu Zhao <yuzhao@google.com> wrote:
> > > >
> > > > @@ -1407,6 +1418,13 @@ static void gic_ipi_send_mask(struct irq_dat=
a *d, const struct cpumask *mask)
> > > >        */
> > > >       dsb(ishst);
> > > >
> > > > +     cpumask_copy(&broadcast, cpu_present_mask);
> > >
> > > Why cpu_present_mask? I'd expect that cpu_online_mask should be the
> > > correct mask to use -- we don't IPI offline CPUs, in general.
> >
> > This is exactly because "we don't IPI offline CPUs, in general",
> > assuming "we" means the kernel, not GIC.
> >
> > My interpretation of what the GIC spec says ("0b1: Interrupts routed
> > to all PEs in the system, excluding self") is that it broadcasts IPIs t=
o
> > "cpu_present_mask" (minus the local one). So if the kernel uses
> > "cpu_online_mask" here, GIC would send IPIs to offline CPUs
> > (cpu_present_mask ^ cpu_online_mask), which I don't know whether it's
> > a defined behavior.

Thanks for clarifying.

> Offline CPUs are not known to the kernel.

I assume it wouldn't matter to firmware either, correct? IOW, we
wouldn't cause firmware any trouble by letting GIC send IPIs to
(cpu_present_mask ^ cpu_online_mask), assuming those two masks can be
different on arm64 when hotplug is enabled?

> Most likely, they are either
> powered off, or spending quality time in Secure or Realm mode. Either
> way, this is none of our business.
>
> Your approach would make also the kernel perform pretty inconsistently
> depending on whether CPUs are offline and not.
>
> >
> > But if you actually meant GIC doesn't IPI offline CPUs, then yes, here
> > the kernel should use "cpu_online_mask".
> >
> > > > +     cpumask_clear_cpu(smp_processor_id(), &broadcast);
> > > > +     if (cpumask_equal(&broadcast, mask)) {
> > > > +             gic_broadcast_sgi(d->hwirq);
> > > > +             goto done;
> > > > +     }
> > >
> > > So the (valid) case where you would IPI *everyone* is not handled as =
a
> > > fast path? That seems a missed opportunity.
> >
> > You are right: it should handle that case.
> >
> > > This also seem an like expensive way to do it. How about something
> > > like:
> > >
> > >         int mcnt =3D cpumask_weight(mask);
> > >         int ocnt =3D cpumask_weight(cpu_online_mask);
> > >         if (mcnt =3D=3D ocnt)  {
> > >                 /* Broadcast to all CPUs including self */
> >
> > Does the comment mean the following two steps?
> > 1. Broadcasting to everyone else.
> > 2. Sending to self.
>
> Correct.
>
> > My understanding of the "Interrupt Routing Mode" is that it can't
> > broadcast to all CPUs including self, and therefore we need the above
> > two steps, which still can be a lot faster. Is my understanding
> > correct?
>
> Yes.
>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

