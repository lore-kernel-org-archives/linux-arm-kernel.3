Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A942FC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 11:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z8FfKXwZWZe+Vwy/+2J/r9/5ZnSBT9FI69EHi06JWxg=; b=mGqChqMPTl0bSgf2egu1h3hw5Y
	YWJTLYcAV6MvN6Xz5o8nso3DNnwC+x5aK2Nr+1t0YUaPpdbLXrCp+iYlJsg8v+07V7o8RuzwfGNXE
	3FYmpEJiqH/d/Si73XwpQnd9J8cmS4L40/spDFL3vOViTjSfMujLQC39Uyc4VtWP/R1a5H2eqOZDA
	5b1Iaaxy4vlCoLDAqRfTqX2shJHRqAUEYGslf3ZNqJpjqtdRHIIUMg6f0OYArzGaebgAqroixC5am
	wkLmfcBwMXIHxAZwGgHiOADMm70rvSwE+mggat5LBUwdW/uY882YFTJ3pi5UfHWg3cYRRnJCTd8ys
	YUo1kDOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzvp8-00000005r7o-0Yhc;
	Wed, 02 Apr 2025 10:59:58 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzvnM-00000005qxb-2AUf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 10:58:09 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-702599fa7c5so5259417b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 03:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743591487; x=1744196287; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z8FfKXwZWZe+Vwy/+2J/r9/5ZnSBT9FI69EHi06JWxg=;
        b=a/b6rTVZYiCmmVZMD0wwfU3Gnshm94c4fCTaYiKxDhXbWvbCzCEYatJTsOXvhg4zku
         5K3K8mfaLwIgsHVkuxRFn1ID9r42ZUbhKDmPwGovg7UTOZCPnH91JtGYCpugLzLxqCKY
         5Yjmd9nF6yHwgscn+TfAJX1ZsLzm196SDViHozusQsE4mq1Ah95SLSrLeApdzRYbItHb
         KK1NUqXXVm8RikxXFh4+klYQZysODg4TeF0djSyclMRXSYGX5W9CbNj5S6Q8ahwDF1CR
         fZinh2eSb0g3AGVpZoLFt2wdP6SWlTsMNSe3kuv9Sek7DW25iCCZ4Ng2aRVn+mixkYND
         mS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743591487; x=1744196287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z8FfKXwZWZe+Vwy/+2J/r9/5ZnSBT9FI69EHi06JWxg=;
        b=VoYmvGQUrsitwGNDYXpqA5oJDNl4O+PhHgVFok21R3OnKMaZ9LaRAwuRPvZGp3Ypci
         r06u8ywpD1kVKiBQWYgJsxm1AAj9EJKTESWi50SF7LKYiVxNynM1WRm2vJv/lB9uGOmo
         s9pkGg38j9F7/CQRMUrReyPm0yNyUfC0vOUR2mP7A3RoFeNBZ+5/8xiEJPSSxYCE9ey9
         BFFDWUzJkHP4Maj6327nBxgSg7m7JyIuJOOztp/zcyyp1c2rdoIb41B/V/yx/a8Y6tlK
         2JrwaFFeVxYvfOHZIuyDPjXwrGGD1FAneeqoz/4ZIDovF8ri0+me/jNRGDpIFd5FTasv
         r9hA==
X-Forwarded-Encrypted: i=1; AJvYcCUpq8CU1OqbYgMTUXj7fX8hZNbmuzsh3RAnXwylWcpyOdRICIKnZ1zpCPq2BiOBPV/VFBGyHNbK/qISr/wqkjed@lists.infradead.org
X-Gm-Message-State: AOJu0YzjO9bL4nEIrt7bm7w27dXQmpRZdKbo4OFhl3VkTYL+xMhK70iP
	BOauPTOiglTM0vJRdTzDwodgtihHoN6xFjbRf+Z+YEbjKgOjDsouf8d3ZtmmJut3+C+E5JF8Itz
	N0wb/Y9mkstwvLo1pCKCTT/u7wbnLv5Zdyk2RaA==
X-Gm-Gg: ASbGnctE2XmkWBDqFj+RpvPALPKLkrpWP+qXAdcVd6k3/aHI5nd6CkguhphNFlJ+SsM
	NFHzY/ZSLyEbMlfPsE6cHKaWc0GcompgIKYqcj5Dr5g8P8ygifEp6t+a5i78Aj4RGq5B1J3v4uK
	SzlFKIkjZxjsuvxaJBKHaoBT9Rg7E=
X-Google-Smtp-Source: AGHT+IHF4Hljr4H0DWptLVjHo3hM2xZRvUkaXcgdJ4IUCbeypueQRjMmC31a9Q/VTJ5sLrPOCFUp1lwnnPu7PdjUYbM=
X-Received: by 2002:a05:690c:2d89:b0:703:b8f7:a653 with SMTP id
 00721157ae682-703bf172bbdmr19977377b3.9.1743591487285; Wed, 02 Apr 2025
 03:58:07 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250326030527epcas2p33aa30e62cc8a00c9e151c35bee71dac5@epcas2p3.samsung.com>
 <Z+Nv8U/4P3taDpUq@perf> <8634f0mall.wl-maz@kernel.org> <Z+TEa8CVAYnbD/Tu@perf>
 <86v7rulw2d.wl-maz@kernel.org> <CAPDyKFrxK3Mx055hx+a4SP3CWDpWP+CEHxz+WJfT+RficK0_Ag@mail.gmail.com>
 <87o6xgyqkw.wl-maz@kernel.org>
In-Reply-To: <87o6xgyqkw.wl-maz@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 2 Apr 2025 12:57:31 +0200
X-Gm-Features: AQ5f1Jrh6EOc3e_W1e2v-3GPFZowzyDlexG_NRudvbxcUrGJw_lLxrjADg_ZJEI
Message-ID: <CAPDyKFqs+o1snQL-kwC+4-ENDO=P9MwPnAN6YTkExJgLsosHhA@mail.gmail.com>
Subject: Re: [GICv3 ITS]S2IDLE framework does not invoke syscore_ops in GICv3
 ITS driver
To: Marc Zyngier <maz@kernel.org>
Cc: Youngmin Nam <youngmin.nam@samsung.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Saravana Kannan <saravanak@google.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com, hajun.sung@samsung.com, d7271.choe@samsung.com, 
	joonki.min@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_035808_578266_88A3438E 
X-CRM114-Status: GOOD (  58.35  )
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

On Tue, 1 Apr 2025 at 15:11, Marc Zyngier <maz@kernel.org> wrote:
>
> On Tue, 01 Apr 2025 13:45:43 +0100,
> Ulf Hansson <ulf.hansson@linaro.org> wrote:
> >
> > On Thu, 27 Mar 2025 at 09:25, Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > On Thu, 27 Mar 2025 03:22:19 +0000,
> > > Youngmin Nam <youngmin.nam@samsung.com> wrote:
> > > >
> > > > [1  <text/plain; utf-8 (8bit)>]
> > > > On Wed, Mar 26, 2025 at 08:59:02AM +0000, Marc Zyngier wrote:
> > > > > On Wed, 26 Mar 2025 03:09:37 +0000,
> > > > > Youngmin Nam <youngmin.nam@samsung.com> wrote:
> > > > > >
> > > > > > Hi.
> > > > > >
> > > > > > On our SoC, we are using S2IDLE instead of S2R as a system susp=
end mode.
> > > > > > However, when I try to enable ARM GICv3 ITS driver (drivers/irq=
chip/irq-gic-v3-its.c),
> > > > > > I noticed that there is no proper way to invoke suspend/resume =
callback,
> > > > > > because it only uses syscore_ops, which is not called in an s2i=
dle scenario.
> > > > >
> > > > > This is *by design*.
> > >
> > > [...]
> > >
> > > > > > How should we handle this situation ?
> > > > >
> > > > > By implementing anything related to GIC power-management in your =
EL3
> > > > > firmware. Only your firmware knows whether you are going into a s=
tate
> > > > > where the GIC (and the ITS) is going to lose its state (because p=
ower
> > > > > is going to be removed) or if the sleep period is short enough th=
at
> > > > > you can come back from idle without loss of context.
> > > > >
> > > > > Furthermore, there is a lot of things that non-secure cannot do w=
hen
> > > > > it comes to GIC power management (most the controls are secure on=
ly),
> > > > > so it is pretty clear that the kernel is the wrong place for this=
.
> > > > >
> > > > > I'd suggest you look at what TF-A provides, because this is not
> > > > > exactly a new problem (it has been solved several years ago).
> > > > >
> > > > >     M.
> > > > >
> > > > > --
> > > > > Without deviation from the norm, progress is not possible.
> > > > >
> > > >
> > > > Hi Marc,
> > > >
> > > > First of all, I=E2=80=99d like to distinguish between the GICv3 dri=
ver (irq-gic-v3.c)
> > > > and the ITS driver (irq-gic-v3-its.c).
> > > >
> > > > I now understand why the GICv3 driver doesn=E2=80=99t implement sus=
pend and resume functions.
> > > > However, unlike the GICv3 driver, the ITS driver currently provides
> > > > suspend and resume functions via syscore_ops in the kernel.
> > >
> > > For *suspend*. The real suspend. Not a glorified WFI. And that's only
> > > for situations where we know for sure that we are going to suspend.
> > >
> > > > And AFAIK, LPIs are always treated as non-secure. (Please correct m=
e If I'm wrong).
> > > >
> > > > The problem is that syscore_ops is not invoked during the S2IDLE sc=
enario,
> > > > so we cannot rely on it in that context.
> > > > We would like to use these suspend/resume functions during S2IDLE a=
s well.
> > >
> > > Again, this is *by design*. There is no semantic difference between
> > > s2idle and normal idle. They are the same thing. Do you really want t=
o
> > > save/restore the whole ITS state on each and every call into idle?
> > > Absolutely not.
> >
> > I agree that we don't want to save/restore for every call to idle,
> > that would simply be unnecessary and add latencies.
> >
> > Instead, I think the save/restore could depend on what idlestate we
> > enter and whether it's a system-wide state (s2idle/s2ram) or just
> > regular cpuidle-state.
> >
> > Today, we are pointing the callbacks for cpuidle and s2idle to the
> > same functions (at least for PSCI PC mode), but it's easy to change
> > that *if* we need some differentiation between s2idle and cpuidle.
> >
> > >
> > > Only your firmware knows how deep you will be suspended, and how long
> > > you will be suspended for, and this is the right place for to perform
> > > save/restore of the ITS state. Not in generic code that runs on every
> > > arm64 platform on the planet.
> >
> > Assuming we can make the code for saving/restoring generic (not in FW)
> > and that we are able to make sure the code is only executed for those
> > platforms and states that really need it. Do you think there would
> > there be any other drawback for doing this?
>
> Yes. We'd end-up having to implement all sort of split PM schemes
> depending on the GIC implementation, what the firmware does, the
> various braindead assumptions that the integration makes, and other
> parameters I don't even want to consider.

I don't think it needs to be that complicated, at all. But let's not
discuss the solution at this point, at least for me, that's too early.

However, I do understand your concerns and share them.

>
> The GIC power management is, for better or worse, *outside* of the
> scope of the architecture. Most of it is implementation defined,
> because each and every implementer/vendor sees it as added value to
> invent their own particular flavour of crap. For example, there is no
> provision for wake-up interrupts, because nobody can agree on how
> that's supposed to work.

Right. I guess it falls in the SoC specific area and we need to live
with it, for now.

Anyway, the main reason why I joined the discussion is exactly because
of this. I have been working on enabling the same deep state for
s2idle as the one that corresponds to s2ram for some legacy arm64
platforms. To allow the system to wake up properly from this deep
state, I needed to save/restore these types of GIC registers.

I intend to post a complete series for this soonish. It should show
what is needed for a particular SoC in this regard. I will keep you
posted.

>
> Do we want to deal with this in the various GIC drivers? No. It is the
> job of firmware to manage this mess, because this clearly delineates
> where the responsibilities lie.

The FW could deal with this, but that would only work for platforms
with new or upgrade-able FW, which is not the case for these legacy
platforms that I am working on.

Moreover, we already implement the save/restore for some GIC variants
- and in some cases using different ways to do it. In my opinion it
would be nice to have a common solution that would only be enabled for
the states/platforms that really need it. In the series above I will
try to implement this, let's see if I can make it.

Kind regards
Uffe

