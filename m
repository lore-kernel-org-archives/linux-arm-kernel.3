Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E504DE68974
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 10:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f5+EavlWdyO9mIBzplaKVzqRvhj0odhaF59om4fXhNI=; b=HtLB2qL15t4mqdd54zk/XTPnhw
	XLRbDItvBPLuBqJ3d7HJT+LepcoSOk+IixYlq6gXkdMnBu5PxngvPN1MuimKamId4oIByDjhYIadN
	wB8/5/ubzNaIZ7wm9wPJWdOR1Vx97ilfp1kpc3nGcnTRBGjbT9qqW690oFBKaWiblVxi4YPqwq8Xi
	SvhSRxTGvCZhDBsdnZRDN5MP+uXYjrTaBJdnKJA3lJYqvD0hkn5LRa4e1xcRECdXdHTZJWLFcci3h
	DlbJQrnFuAQxfw8z5oGu4hKtYI1v9R1nqb1ZmzGzRdgWbNAm3GmIN1jUbYUdhJ8R++ECdOo9iiVta
	MGhqYFtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6SPR-00000003ETA-0r6M;
	Thu, 31 Oct 2024 10:28:09 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6SNR-00000003DfN-42MV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 10:26:07 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-6e377e4aea3so6010197b3.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 03:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730370365; x=1730975165; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f5+EavlWdyO9mIBzplaKVzqRvhj0odhaF59om4fXhNI=;
        b=fEL884lsuMLiUoxWJ1TpZuiU4KSN7kUMWZhmwRcpJBV8qgrWQH3nTVX4+jbpbKDQvp
         NGch+8IEqAibNuIWsLYp0mlTCm7W/8pWMyZV0dbgezEfUrNDabDKClFBsF6uL6wiRYMk
         aqJPp4q16+Yho8APIypZPjxx05i9z4efUfpcWFebjkc5Gmiq8AUC2F+WYonTGUMYMOKj
         lqQojoAD+rn/N+LjES+m0hBQtzyh5uVJNxg7rv0PftXWtHHGih6VsB3nvAtUVTcRBsBE
         cIJWyeqQ33WD0k5h85c20Gqz4irPOzY3YbmzKGAfn8aqSkaPizAupZtYHCETYHkBdqHa
         vc9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730370365; x=1730975165;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f5+EavlWdyO9mIBzplaKVzqRvhj0odhaF59om4fXhNI=;
        b=oDjJ7cqO18cwmbI9fMjcuSEf/x8yER+m0ehUfxTLgA2Bwet5Zy9xoFKqy5VhdxxSOw
         FPxir+pHOLGZtKsv4hcAN4SzDuEVkLO5YPaDMXyuSQTPpi4WfrFTFGYitSQR7/XQbOZu
         TTe5HzSoCm1+kDd6h/kLqmqWPQVBgX1/jhW1NPd2YzBsQdmRnZU22QVU9o7kCCDbLxY6
         bWFrXqnFdYq3gezowdXtqZ9fZhtnbvEiAJUpr5dlNCdOxO8MCMFemGPjoMr6yVMvsNYU
         qVkfLj/U93tflxadQue9GDnUA/PEhBYUg6jPkreR2JGY+9dPIEYDOfpcI4gXw0Y5kRut
         Bb5A==
X-Forwarded-Encrypted: i=1; AJvYcCUAWQpCUF+LvcuPRrWHD+etj+c1qacvtfI4ast45ewt7LQG/kMECs0TW8h45c2toe6I6fSlVGAtFVU96XqvGgwz@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2jG7TL0PUHu0wIUojwMeULjvCnGSIEIG4aHe/CidhfrdBo8/V
	TrwNwVxe3aBfSUTS/scV71g9hFAxZse/7UgA1C/N3LU9CUzNDUBSPYPOOwEO6xrx7jGPXdXNXB9
	Kb43XzAWP0q3fMztiMTY8TsXBzhqX9vditIAtyA==
X-Google-Smtp-Source: AGHT+IED7ORvK8ZV2gzBVmXLObiKch/Cqk/NhnIXHt1YeB2LkWDkoQQR0h/2v8YDvtpi/KE6By4guMk7YscOzcSA2Kk=
X-Received: by 2002:a05:690c:6a0a:b0:6e2:1b8c:ad28 with SMTP id
 00721157ae682-6e9d897c900mr199964757b3.24.1730370364810; Thu, 31 Oct 2024
 03:26:04 -0700 (PDT)
MIME-Version: 1.0
References: <20241022-tisci-pd-boot-state-v1-1-849a6384131b@ideasonboard.com>
 <7hmsilqrw3.fsf@baylibre.com> <0f027b8e-9c41-4754-923b-2a285fb9593a@ideasonboard.com>
In-Reply-To: <0f027b8e-9c41-4754-923b-2a285fb9593a@ideasonboard.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 31 Oct 2024 11:25:29 +0100
Message-ID: <CAPDyKFqoXfooy-ipo_aE91TwFQOaj=Z5SZJ4G_4Hh7jCvkyTVQ@mail.gmail.com>
Subject: Re: [PATCH RFC] pmdomain: ti-sci: Set PD on/off state according to
 the HW state
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Santosh Shilimkar <ssantosh@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, vishalm@ti.com, 
	sebin.francis@ti.com, d-gole@ti.com, Devarsh Thakkar <devarsht@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_032606_034775_ADE0B90F 
X-CRM114-Status: GOOD (  49.81  )
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

On Thu, 31 Oct 2024 at 08:39, Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> Hi,
>
> On 30/10/2024 22:04, Kevin Hilman wrote:
> > Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> writes:
> >
> >> At the moment the driver sets the power state of all the PDs it creates
> >> to off, regardless of the actual HW state. This has two drawbacks:
> >>
> >> 1) The kernel cannot disable unused PDs automatically for power saving,
> >>     as it thinks they are off already
> >>
> >> 2) A more specific case (but perhaps applicable to other scenarios
> >>     also): bootloader enabled splash-screen cannot be kept on the screen.
> >>
> >> The issue in 2) is that the driver framework automatically enables the
> >> device's PD before calling probe() and disables it after the probe().
> >> This means that when the display subsystem (DSS) driver probes, but e.g.
> >> fails due to deferred probing, the DSS PD gets turned off and the driver
> >> cannot do anything to affect that.
> >>
> >> Solving the 2) requires more changes to actually keep the PD on during
> >> the boot, but a prerequisite for it is to have the correct power state
> >> for the PD.
> >>
> >> The downside with this patch is that it takes time to call the 'is_on'
> >> op, and we need to call it for each PD. In my tests with AM62 SK, using
> >> defconfig, I see an increase from ~3.5ms to ~7ms. However, the added
> >> feature is valuable, so in my opinion it's worth it.
> >>
> >> The performance could probably be improved with a new firmware API which
> >> returns the power states of all the PDs.
> >
> > Agreed.  I think we have to pay this performance price for correctness,
> > and we can optimizie it later with improvements to the SCI firmware and
> > a new API.
> >
> >> There's also a related HW issue at play here: if the DSS IP is enabled
> >> and active, and its PD is turned off without first disabling the DSS
> >> display outputs, the DSS IP will hang and causes the kernel to halt if
> >> and when the DSS driver accesses the DSS registers the next time.
> >
> > Ouch.
> >
> >> With the current upstream kernel, with this patch applied, this means
> >> that if the bootloader enables the display, and the DSS driver is
> >> compiled as a module, the kernel will at some point disable unused PDs,
> >> including the DSS PD. When the DSS module is later loaded, it will hang
> >> the kernel.
> >>
> >> The same issue is already there, even without this patch, as the DSS
> >> driver may hit deferred probing, which causes the PD to be turned off,
> >> and leading to kernel halt when the DSS driver is probed again. This
> >> issue has been made quite rare with some arrangements in the DSS
> >> driver's probe, but it's still there.
> >>
> >> So, because of the DSS hang issues, I think this patch is still an RFC.
> >
> > Like you said, I think that DSS hang is an issue independently of this
> > patch, so it shouldn't hold this up IMO.
>
> In current upstream, if the bootloader has enabled the display, we most
> likely won't hit the DSS hang issue as the PD will stay on until the DSS
> driver has had a chance to probe, and the driver takes actions to avoid
> the hang issue.
>
> With this patch applied, the PD may be turned off before the DSS driver
> has had a chance to probe, causing the board to hang when the DSS driver
> probes the first time.
>
> That's why I'm a bit hesitant to apply this. It could mean that for some
> people their board stops booting.
>
> I'm not even sure what would be the perfect fix for this hang problem...
>
> We could have some built-in early boot code which checks if the DSS is
> enabled, and disables it, so that the hang issue won't happen. But
> that's not good if we try to keep the boot splash on the screen until
> the userspace takes over.
>
> Alternatively we could, somehow, mark the DSS powerdomain to be handled
> in a special way: if the PD is enabled at boot time, it will be kept
> enabled until the DSS driver (somehow) changes the PD back to normal
> operation (and if DSS driver is never loaded, PD will stay on).

This option is kind of what I am working on. Although, the goal is to
keep the code generic, so ideally we should not need any changes in
the DSS driver to make this work. Let's see.

That said, it sounds like we should defer $subject patch until we have
a solution for the above, right?

[...]

Kind regards
Uffe

