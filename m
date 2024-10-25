Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7D3D116EE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 05:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zfGHBHIoxV5kA8YjaOaHcL5pnxUwdfqiiPu15uVoLw0=; b=HkoClquTENunNK+tZHTUW3HOnD
	3ENTzN22Zl5Jn+v0ADhRoOW66DS+aiXil4rTUEBludA6HlC+MCSqZygfcleeERkaj1IMdIY8ojUUI
	Un5qCxdpHH+NYlA6RzxYKMyW21CwOv7CbRSaQtUaQu2yasAj8lbcZ1TSPsX26pFIF5faywkvrEnCu
	p6I7PqVYEmadkMbIIvbNhhvs8BcXV92ltX2CUd6xJsM0vqJS/+DJgZXeipiF8vhxiLUN/ocqzfFgw
	ZO1Y5RZ2RD1X4mGJiNDG3iKuaqHYY1AkM9sc0C4AP3QF5XUdMjE0EXq9V8tTq2LQDKAZnxMv7TZki
	XOQuxGtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4CaL-00000002YVy-0dZD;
	Fri, 25 Oct 2024 05:10:05 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4CYm-00000002YKx-1Vyt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 05:08:29 +0000
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-4a74cfa7671so1444194137.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 22:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729832903; x=1730437703; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zfGHBHIoxV5kA8YjaOaHcL5pnxUwdfqiiPu15uVoLw0=;
        b=0s32XnM+URX8C7pve6BQi88Or7YF8dVV/ALhViTRk4RW6AmJqHFWV/lr5iV/S2pODW
         i5TIueqIcyIpHVvHRA5bVFWkgSj/HmG/rlYgnLgiHZqMAcR9SLpc22hv32uADRo1+1tI
         8mD8fhbDCkeESrQ/YWtX90dFIG8qs+0ZLNr2ep+pDFnpl5TFQCQ56pr67QenWW2MPhZ3
         AG9g1KjH4zo9nUg2fe7IYjNTSWun3XTUqLd9rz5u7DDmUCEG2nRYpISSe/1jXiKdTbFL
         7hQofOBXf5JpAvYnIZ3GiTx93IfhdSG+KERbx+wZ3GVXtVfu4G4vRVjvLtKeppu82p23
         b7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729832903; x=1730437703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zfGHBHIoxV5kA8YjaOaHcL5pnxUwdfqiiPu15uVoLw0=;
        b=OvOZBrUrGRPHm4VtHcDFHngNeqkarmKHermUIRw7kPiMXY1+hfCE8YVABchPswmAT0
         UswV9TuNzdL3hdaOuNOr1qG+SfuoZ1pTJ4gOOGWdMEGDde5Pv6YpU2MsUfAguQ5sRb5h
         EMSVHC7PjZ7Bejv1PdjhTt95TkOjdVMgEmtnychY0lygUh5797hKdCfMzsRXM6j0G+tJ
         Qv6/7jmOpb7OObnZYTEYuYtLtiFhKJi3/eEa991mLKt/B01+SfMJh7BLxmjrkLsH/ljy
         RatEUM6qFVvX+3219xrj3xRw4vuWQFgBwwKXZiplfm97KsPYIlUG/L/ngsRWf8MJtAxB
         M2Lg==
X-Forwarded-Encrypted: i=1; AJvYcCWZ0OqNG3/bG88EfOyMHuaAmhQ11ew9uVONnRI3KkcP3sUfaIK8l6lnV6LNazqgf94UuOY9oqXRp4ViU7yPgq1Z@lists.infradead.org
X-Gm-Message-State: AOJu0YyiSdpb1gMys7FjbZ7zqqIFR6HTNttCB83VaTd/kqrsVy2nLiK1
	yB/fUHDdA3gmThMUrsZMjndUwHCc3PhTbWg1UJpaWRPrBnpVx6/aXmEAlnzWvCqY/kayuWw9RkO
	UYLcV+Bt6ieueazYWpPRaHYlIz4uxC7AS0NGy
X-Google-Smtp-Source: AGHT+IHUDYUoU8LFUbZ4k2PKGpA+ThkXB1QD3CSnJUZbltuRAF2DUtPp005MRVWQoU3kazWygDbzQCvItjMIBV7xf3M=
X-Received: by 2002:a05:6102:418a:b0:4a4:72f0:7937 with SMTP id
 ada2fe7eead31-4a870d306d7mr3512838137.8.1729832902928; Thu, 24 Oct 2024
 22:08:22 -0700 (PDT)
MIME-Version: 1.0
References: <20241021042218.746659-1-yuzhao@google.com> <20241021042218.746659-4-yuzhao@google.com>
 <86a5ew41tp.wl-maz@kernel.org>
In-Reply-To: <86a5ew41tp.wl-maz@kernel.org>
From: Yu Zhao <yuzhao@google.com>
Date: Thu, 24 Oct 2024 23:07:45 -0600
Message-ID: <CAOUHufanq2_nbNiU_=mCgWufoSGDOS3EpAz+4xB5kB=PV2ECVA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241024_220828_424201_2AC4FCE1 
X-CRM114-Status: GOOD (  30.21  )
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

Hi Marc,

On Tue, Oct 22, 2024 at 9:03=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrote=
:
>
> On Mon, 21 Oct 2024 05:22:15 +0100,
> Yu Zhao <yuzhao@google.com> wrote:
> >
> > GIC v3 and later support SGI broadcast, i.e., the mode that routes
> > interrupts to all PEs in the system excluding the local CPU.
> >
> > Supporting this mode can avoid looping through all the remote CPUs
> > when broadcasting SGIs, especially for systems with 200+ CPUs. The
> > performance improvement can be measured with the rest of this series
> > booted with "hugetlb_free_vmemmap=3Don irqchip.gicv3_pseudo_nmi=3D1":
> >
> >   cd /sys/kernel/mm/hugepages/
> >   echo 600 >hugepages-1048576kB/nr_hugepages
> >   echo 2048kB >hugepages-1048576kB/demote_size
> >   perf record -g -- bash -c "echo 600 >hugepages-1048576kB/demote"
> >
> >          gic_ipi_send_mask()  bash sys time
> > Before:  38.14%               0m10.513s
> > After:    0.20%               0m5.132s
> >
> > Signed-off-by: Yu Zhao <yuzhao@google.com>
> > ---
> >  drivers/irqchip/irq-gic-v3.c | 20 +++++++++++++++++++-
> >  1 file changed, 19 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.=
c
> > index ce87205e3e82..42c39385e1b9 100644
> > --- a/drivers/irqchip/irq-gic-v3.c
> > +++ b/drivers/irqchip/irq-gic-v3.c
> > @@ -1394,9 +1394,20 @@ static void gic_send_sgi(u64 cluster_id, u16 tli=
st, unsigned int irq)
> >       gic_write_sgi1r(val);
> >  }
> >
> > +static void gic_broadcast_sgi(unsigned int irq)
> > +{
> > +     u64 val;
> > +
> > +     val =3D BIT(ICC_SGI1R_IRQ_ROUTING_MODE_BIT) | (irq << ICC_SGI1R_S=
GI_ID_SHIFT);
>
> As picked up by the test bot, please fix the 32bit build.

Will do.

> > +
> > +     pr_devel("CPU %d: broadcasting SGI %u\n", smp_processor_id(), irq=
);
> > +     gic_write_sgi1r(val);
> > +}
> > +
> >  static void gic_ipi_send_mask(struct irq_data *d, const struct cpumask=
 *mask)
> >  {
> >       int cpu;
> > +     cpumask_t broadcast;
> >
> >       if (WARN_ON(d->hwirq >=3D 16))
> >               return;
> > @@ -1407,6 +1418,13 @@ static void gic_ipi_send_mask(struct irq_data *d=
, const struct cpumask *mask)
> >        */
> >       dsb(ishst);
> >
> > +     cpumask_copy(&broadcast, cpu_present_mask);
>
> Why cpu_present_mask? I'd expect that cpu_online_mask should be the
> correct mask to use -- we don't IPI offline CPUs, in general.

This is exactly because "we don't IPI offline CPUs, in general",
assuming "we" means the kernel, not GIC.

My interpretation of what the GIC spec says ("0b1: Interrupts routed
to all PEs in the system, excluding self") is that it broadcasts IPIs to
"cpu_present_mask" (minus the local one). So if the kernel uses
"cpu_online_mask" here, GIC would send IPIs to offline CPUs
(cpu_present_mask ^ cpu_online_mask), which I don't know whether it's
a defined behavior.

But if you actually meant GIC doesn't IPI offline CPUs, then yes, here
the kernel should use "cpu_online_mask".

> > +     cpumask_clear_cpu(smp_processor_id(), &broadcast);
> > +     if (cpumask_equal(&broadcast, mask)) {
> > +             gic_broadcast_sgi(d->hwirq);
> > +             goto done;
> > +     }
>
> So the (valid) case where you would IPI *everyone* is not handled as a
> fast path? That seems a missed opportunity.

You are right: it should handle that case.

> This also seem an like expensive way to do it. How about something
> like:
>
>         int mcnt =3D cpumask_weight(mask);
>         int ocnt =3D cpumask_weight(cpu_online_mask);
>         if (mcnt =3D=3D ocnt)  {
>                 /* Broadcast to all CPUs including self */

Does the comment mean the following two steps?
1. Broadcasting to everyone else.
2. Sending to self.

My understanding of the "Interrupt Routing Mode" is that it can't
broadcast to all CPUs including self, and therefore we need the above
two steps, which still can be a lot faster. Is my understanding
correct?

>         } else if (mcnt =3D=3D (ocnt - 1) &&
>                    !cpumask_test_cpu(smp_processor_id(), mask)) {
>                 /* Broadcast to all but self */
>         }
>
> which avoids the copy+update_full compare.

Thank you.

