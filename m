Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0388CCD8C90
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 22:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6VcK+e3be8z9q9KQZpd0XHHtxviPUlwxCxiE+Z9huTw=; b=UA0qa6M7YTgF55OnBjlUnyaslB
	VAQ3h67bFsJ+qCTVOLXUfnJJdQW7Vy72+2kLkuhZyWOy3g3zfNd1WNQevfGfhJMd218lcm+WbklOY
	5HZudDT6whm/CXZmZjBrlfe9dNooc3ArJtoiy5gIRu0SEvEt/6JgR5JqftFrDywgQw1cEqo5bsern
	v8T/yPGI8hD7oETyg3z6lR7IWKQUU+1LK+kSL1TFGvYvyEWNGThi2Co3l9oCK3+BSf25/+YaxtBAD
	sRz1MDw5tMjH7SAhAqSwmjCsoaFVDhN7W4JBF6izUnwp5rqewWv1vtKBA1HA0Cb2gZ1nwvEt4FAU0
	/h0Jjv7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWLt5-00000002YlH-03hW;
	Sun, 07 Jun 2026 22:22:35 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWLt2-00000002Ykm-2pPZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Jun 2026 22:22:33 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-51765331535so1340591cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 15:22:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780870951; cv=none;
        d=google.com; s=arc-20240605;
        b=S4JfcQPOEaUiw/7FcTQoUYM0nh4c1XsLWPAzZ4Ut+ujRc3Ps52YSR6ZX4hG0fl3kCE
         j/GpcLNYT4YvoBGuH9o+F9aUdFDl3akD23C/ojwBWmkuuJHKWM8ji4ycrJaunwvj1sKw
         +IAAbWfH3FgRcWYHmRzwKMBjNPXp3Dp56iJmQyFYjCRUZ9Gegmo7qdhX7Ew4KdrdaQLa
         q++SMRoYV19fOFAKmBO6i+Axw8Mjpe29kUadxuklbgB3/c470yJPVnRdbkfcoyqN5URZ
         SmTv9E3L2g7BP68jlDsLB1WiJ10gmQ22g3XcxmNvpIucC2VAtAatDnJZf3qfgwC8douh
         JPOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6VcK+e3be8z9q9KQZpd0XHHtxviPUlwxCxiE+Z9huTw=;
        fh=2Ja7t8T3tgQbAXJLBaQ9B4jOM7pWNOc8ZssaU41nP94=;
        b=QjL8n4yd1rLwmm8DP9t9TjMBzQwporgfWz8q3Dh5w8XBAwci8TPCFL1JQvp70q97N2
         A4rEz5XCUMBguXSN5wUIXA7V1oD5/a6Sc0xd9KZIF77dcK/tetedcPojKCer+R13dFD+
         G5IkPkl/OxvtIEA8C1yd8fUuynSeBmiwmvESg1yspizxC0WpGdO6qFsOpEm9z8so7cND
         I+RuzSFbebah2ePv7o3dRvRhsx7ZCyvGpFK37bg/A8cGUJhll3E5i1Q4RexhAlTU6fzF
         dP8JSAdKKodBbiEQLCVMu4ZnzogaD7m5GIoRzvU8yKc17nTNjCyNF759+RyojiROP/X2
         SetA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780870951; x=1781475751; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6VcK+e3be8z9q9KQZpd0XHHtxviPUlwxCxiE+Z9huTw=;
        b=it+uduKruEYWNqeSTV1f1z76NXpoWyIavloyP/rr36hzLj//8rx8HmXpd+BmweE7Z0
         rsNysp4ygTyiwrQnEdg/CHiTjmvbn8Xr7CYEr4toRsQ5JOYlCmAhFV7oZV0lIsYHragZ
         CP6qEqCgEWHI3Ho4RjysvcZahTdUm2p4iES+kOZxE2y6LtmczgdrFE0EP672XM+mKyBt
         Kkdyqk7S9MD4c+UTI88598dgj0AYSNUiYDI6NHK3yJ//8XYtDZepO0WvH7g/8OSxu51x
         J5z/znRlZZSPbSJacKXOPfkq1QOU//A94gTMeQ5EezicXLpDEF8aL/WCY6yd2ApIXErq
         gvQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780870951; x=1781475751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6VcK+e3be8z9q9KQZpd0XHHtxviPUlwxCxiE+Z9huTw=;
        b=aWxQa+qGD2B6Lj4KuMkXCJrIWvKXj9sPmsheEkK+h1MblWTOs1PbzTNBTxWbGhNW7A
         9IXKg4tWzC0Gh+LvKYqWgWY8ugr2cU/vgSqVpEKFvVIiYygdu+daYQeW1EYDn60J3VQo
         P9vNY+7prfRM0pJxc3iSnlZrx7LssRM+Fe0/R8Q0+fZzp+fNRnGVYam4xZgod+4U4Kk+
         7oPsHaV/iVL0oJiTIwau0ExdO3hdH6qjXmKD6lehhbFKEqs7PmJ4ExJ/qInsnsCRDqPb
         kLE9Qj87L1q9o89v8xdjuRY5E4JjbAAWfw1COor5i6H9yGh1NI4BjJ4AOJE1O3dZOpL/
         b5Tw==
X-Forwarded-Encrypted: i=1; AFNElJ/qnYwULqWjmz1hja4Tq0Yt52CSmb7oe98LiL9RUx5T2XJcDbJQQQ26Kpbsk06PlFqYWcIbjhvzSBOfoc7780Qz@lists.infradead.org
X-Gm-Message-State: AOJu0Yxpb6VXh3VoX5hQee75OsMXahQTgnlBBj/8kFgYzFxnEkMXQhd/
	3VZxLfNaBANJnn3wvy8DDUYe3mcvYY5jezN7jzOlf/yxjuXBwFSQGn3spSBZ4ND6ahgdsYxvi+j
	G36PayHQMWq1i931zRkE+2LysawFrwfWPAmpzcLpz
X-Gm-Gg: Acq92OGJU63KocYIv06x6tBa2c/j5grRCYoDkY010pCSEHjhxPEtLt1sPdCDmQ3kfFc
	zlijVyUWKXpsyqZQPqrgZzvwVR/CiIzbp0FkhJdi/QDNAqk9CsZvh11LhJzzO8cV9GnVVls+Njd
	w4dxoUk0KOg+Y2rh0b2hYDZSjdK73pF4FLuvcCiE6MLu733CAFA7bB8tqWXHW87m7pfVRNIdafi
	ikKtGV11Z4Bo55HZARzhNGDxUIjnVzBZsuu+UnrQB0NBNcivSNwAo/9ocEF6WLPrpIQBnlqXj8p
	4vrFAs5HMg/zXck=
X-Received: by 2002:a05:622a:d0e:b0:516:4f62:85ec with SMTP id
 d75a77b69052e-51798260987mr18898041cf.17.1780870950334; Sun, 07 Jun 2026
 15:22:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260601215909.3958732-1-praan@google.com> <20260601215909.3958732-12-praan@google.com>
 <CAE2F3rCPgnFU=d5At1zrOLhsuVEbsweogOHGz9gDddRx73zRtw@mail.gmail.com> <aiEawEFsnG-LIahW@google.com>
In-Reply-To: <aiEawEFsnG-LIahW@google.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Sun, 7 Jun 2026 15:22:19 -0700
X-Gm-Features: AVVi8CfrDAvJOrT6teliHxFj-F4hMAC83FTj6Fd7wqQr65yO-UPAL5bQ_Rlf0_U
Message-ID: <CAE2F3rAWZ4Ac23D8eyAHfmaVVkHv8pz45+_dpMO1M4D7+RVCoA@mail.gmail.com>
Subject: Re: [PATCH v8 11/12] iommu/arm-smmu-v3: Invoke pm_runtime before hw access
To: Pranjal Shrivastava <praan@google.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Ashish Mhetre <amhetre@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_152232_731607_34075B33 
X-CRM114-Status: GOOD (  38.84  )
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

On Wed, Jun 3, 2026 at 11:27=E2=80=AFPM Pranjal Shrivastava <praan@google.c=
om> wrote:
>
> On Wed, Jun 03, 2026 at 01:28:19PM -0700, Daniel Mentz wrote:
> > On Mon, Jun 1, 2026 at 2:59=E2=80=AFPM Pranjal Shrivastava <praan@googl=
e.com> wrote:
> > > @@ -2361,8 +2394,33 @@ static irqreturn_t arm_smmu_handle_gerror(stru=
ct arm_smmu_device *smmu)
> > >  static irqreturn_t arm_smmu_gerror_handler(int irq, void *dev)
> > >  {
> > >         struct arm_smmu_device *smmu =3D dev;
> > > +       irqreturn_t ret;
> > > +
> > > +       /*
> > > +        * Global Errors are only processed if the SMMU is active.
> > > +        *
> > > +        * If the STOP_FLAG is set (can_elide =3D=3D true), the hardw=
are is
> > > +        * either already disabled or in the process of being disable=
d.
> > > +        * Any errors captured during the quiesce/drain phase will be
> > > +        * handled by the explicit arm_smmu_handle_gerror() call at t=
he
> > > +        * end of arm_smmu_runtime_suspend() callback. On resume, the
> > > +        * STOP_FLAG is cleared before interrupts are re-enabled, ens=
uring
> > > +        * no valid errors are missed.
> > > +        *
> > > +        * A lockless check is favoured here over a dynamic PM core c=
heck
> > > +        * since the runtime_pm_get_if_active would return false duri=
ng
> > > +        * transient states like RPM_RESUMING & ignore level-triggere=
d
> > > +        * interrupts.
> > > +        */
> > > +       if (arm_smmu_cmdq_can_elide(smmu)) {
> > > +               dev_err(smmu->dev,
> > > +                       "Ignoring gerror interrupt because the SMMU i=
s suspended\n");
> > > +               return IRQ_NONE;
> > > +       }
> >
> > Have you considered using arm_smmu_rpm_get() here instead?
> > I can see two issues with the currenlty proposal:
> >  * Returning IRQ_NONE when an interrupt is indeed active and needs to
> > be handled. This might be interpreted as a spurious interrupt
> >  * Nothing is preventing the suspend handler from running while
> > arm_smmu_gerror_handler is in the middle of handling an interrupt
> >
> > I understand that using arm_smmu_rpm_get() also has downsides,
> > including an unnecessary resume operation when the SMMU is already in
> > RPM_SUSPENDING state. However, using arm_smmu_rpm_get() would make it
> > easier to ensure correctness.
> >
>
> I don't think using arm_smmu_rpm_get() here is possible..
>
> GERROR is registered as a hard IRQ handler, so calling rpm_get (which
> can sleep) would be wrong.

You're right. Sorry, I missed that arm_smmu_gerror_handler is
registered as a hard irq handler.

> Regarding the race, the STOP_FLAG is set at the very beginning of the
> suspend sequence. If an IRQ fires after that, we return IRQ_NONE and
> let the explicit arm_smmu_handle_gerror() call at the end of
> runtime_suspend catch and clear it. After CMDQEN, PRIQEN, EVTQEN &
> SMMUEN are all cleared, getting a Gerror should be treated as spurious
>
> That said, I understand your concerns about a real IRQ being interpreted
> as a spurious one, and creating an IRQ storm since the gerror register
> isn't really written. I have 2 ideas here:
>
> 1. We could have a "suspended" flag and check it with can_elide here:
> arm_smmu_cmdq_can_elide() && is_suspended() to correctly return IRQ_NONE
>
> 2. We could explicitly disable Gerror in IRQ_CTRL write after setting
> the CMDQ_STOP_FLAG. Even if there are Gerrors during the CMDQ drain,
> we'll catcup to those at the end of our suspend callback.
>
> I'm more inclined towards 2 as it prevents potential races (execution of
> an IRQ handler with handle_gerror calls at the end of the suspend).
>
> WDYT?

I'm not sure if I have a good suggestion here. Have you considered the
following: Do not call arm_smmu_handle_gerror() from
arm_smmu_runtime_suspend(). Instead, call disable_irq() at the end of
the suspend handler (and enable_irq() at the beginning of the resume
handler)?

