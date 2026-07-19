Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E7DC44512
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 09:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=th85pFw/R60Y/fI3U9L5PnkcKBvcHC3c0Lw2SKZ9e60=; b=qJ8kh/cDH/IonXMFMa0zSfX83P
	4y9/BYv3Viv4kUYDaIY2SrSi1/94xE9y0+Dc6c6GnblDMCebovXOpymUIZfjMqeSU2xB9sXzUITai
	ryN+pyG9OoopIjvwjdsY4Q1sU/pyVZjhHBSPU0JYgnSnKmJAzwZav1IKnT+HqY714HAU937Rs3oWI
	iKPF5T7CDIT4EA9IpJKnYLHSplWmP8EChHVJzTneHYnZZpQgDtxmWRRwcwN22I87XhSnqPxP7qq1p
	8+acn9lNLls6cJO00ngr4vyCn1WGZ4zD2K2uVuv9rnkJjQP7I9v3L+1YzwtbrPJTbwlMwklmOgA56
	RUJ4LlPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlNtk-00000004t6U-2AUO;
	Sun, 19 Jul 2026 09:33:24 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlNti-00000004t66-0J3d
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 09:33:23 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-446f87b6de1so4272762fac.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jul 2026 02:33:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784453600; cv=none;
        d=google.com; s=arc-20260327;
        b=Onki3lseIhcEzZWOppnNRaDL6J+K9cWvppnVhllNq8X+08CGKZqYTIlMRzB4DRLohu
         Kiym/0/hgNTnAz4mmSKKnXzVyHY0DFQdkIweVfGHO3HlgqkGZaRL/qpwQaxhu5Ln0wvp
         jeyQ5hmTla9Gt5d/z48eJeycaqmmv746dHG2QN+kLY5sT53FITMgr8W2VKrSTAFtFo0j
         +RSP3Mw9/pORHG7TvXZYc+8m06ryuM8DC2akCS7PyQp8CuzHXu3ja1tEBOA4ArT1/EIh
         XjjxcVGgGLxZ6dufqZ39Ye44b0hRfRceb0GW+17CIdvvw+FMpdj0sOqtuuHJ9CSx7zCu
         enYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=th85pFw/R60Y/fI3U9L5PnkcKBvcHC3c0Lw2SKZ9e60=;
        fh=lPjBtgd56pIiST47QFsrhvpo3lKJSjbXiIvRVj9HOfQ=;
        b=R2GNEcYmCYNhNT+vvjR9jVq00BZrUKXAcYVVPldkyaBTCRT9duPxMutIpdMybfQ8vz
         39irqIe86P6Pm18k0LiIjFNL9fNeJ5SQnmBbFGvPJpbIZyLLRkwceCQbId/gEmh3d865
         0aSi4CYeYkUHgTlZdrggWc4Lv4GwEJ1g382CXeTxqLLjGk/AySCOjPhn8eUn0QomGL+v
         XZgK8ELVY3XF08o9bIVX82DS1d1/PPFUM7rzsCgptYAQC1iW41B5i1bDR5239aiXHo65
         G2714I4CHRXddlq/CJka0urXDkn68ygM7ebeM0d1bGmMkVt+KbkYPRU8ZM1yZWZgBldz
         SKPQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784453600; x=1785058400; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=th85pFw/R60Y/fI3U9L5PnkcKBvcHC3c0Lw2SKZ9e60=;
        b=asjMa7DrUBd2OhIycNtpMnaRLVM8zCg1i2hJ7FRM8RglYwsGzMsMMbPniWjvQP3888
         lJhkrrYo8JRDC48shv/A42yTq/uGznHELn13NUxIY6skrF6j/DsJjrnGyYvXBZYU5Ut5
         5tyRw2hCTb9x3ili6GBmGZHAUoNSdF5C0thhE0QwpVb3SQH2M2+ZtsVxWQZlotLOrdMf
         pfYbMLib6Pp6kpOXRKnfhbfcn0fcAFE8DQ20W5nU8b32O0NrbIpNj1IR4G9m85mF+L9H
         6Rp6UCIkegPjTQT+vI66vUHsN+JmPS6fvIAJdXj6V0isd6rYDj1oNQHJ64dPaWW3GnKe
         OalQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784453600; x=1785058400;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=th85pFw/R60Y/fI3U9L5PnkcKBvcHC3c0Lw2SKZ9e60=;
        b=MyaKsoJeQSoZyaQZRCT7CMoJMDBCTIf/x5QhkM3FuuFp3boeOa6p3ykFOsq8twXqkT
         RLWdicYacYeagypKi0jCV2TFubAyffrVtW6t18qWGs/89uh2/WvQfV6rfH4SApq0bmoR
         OVJcdqiPs/gKCZDDGIVGLV12+zl2wGuRQGH+pE/LFS0xq+TazWxadUvpuFcEe1rk6i+Z
         /DDDypGWnxwsDcCyoZRVDGebvPffDwC9gD/dVzzvUW7LSAnaDW2b3kw4Cy39ofSLmCt0
         d32MbCwOskTpxl97MAsiHRS1cvF+d1/erRv0fdAeswRI5Hfiyz9YP0cqviEqi+0Ilg5M
         4YtQ==
X-Forwarded-Encrypted: i=1; AHgh+RoD/g1pB4VlFLQdi/UQpuO2GrvUTff4Kg+0I6StI9w1PcJ7ZvHe1P3cWVzsAxJLLTkPR78w/khtWf0nlI3FRCa+@lists.infradead.org
X-Gm-Message-State: AOJu0YweixmR7O9WC2+Wd3/hR2OlIWK3fMt9+aZRIoKfG01hcXSdfXRd
	Dx2PfofEAPjhOOYYTxPdfnHG1eLpcxh254mMB+XqG2YzHauPOiEQM5G+nrZ31Lbvr/uybz5BwZB
	qUj1ugKHNI4tptjwxjFoA01xBV1jgFzA=
X-Gm-Gg: AfdE7cnG34Q6OnqIbhAhXmhOXZV6fITaHUi0c0ZgzRD/NYamWjuQMzQEJl8SU5EMo+N
	LVm+HP4tY249PHub8JidJvZwOA6anoGaNz54nbk1twmQGiuOl7ibJeb9qzZlpNJJtMIvCAwUafz
	ffFMsTiyDcx055lfdZpVpBIjPgc31QY/IxOgY1DE0J8yNv8t0kAFDULTCaSsPx2SLZCGaMTHm+6
	EWpNHyOqZeIbzOPJFVV2UDPU+B/bjNjdA9xbIy0riWrJ5Vr0EuDQGJZml+AY97hW4R71R7r+TF0
	B2Kmxl/GaNRvdmBiKuYX
X-Received: by 2002:a05:6870:2dcb:b0:440:d7a2:8834 with SMTP id
 586e51a60fabf-4569032fe9cmr5051192fac.26.1784453599970; Sun, 19 Jul 2026
 02:33:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260712210446.14290-1-mohamedaymanworkspace@gmail.com>
 <20260716214155.2049564-1-mohamedaymanworkspace@gmail.com>
 <20260717155848.GB3998092@e132581.arm.com> <20260717161201.3jkO5o71@linutronix.de>
In-Reply-To: <20260717161201.3jkO5o71@linutronix.de>
From: MOHAMED AYMAN <mohamedaymanworkspace@gmail.com>
Date: Sun, 19 Jul 2026 12:33:08 +0300
X-Gm-Features: AUfX_mylpAmozMkCk1jKEknfPyc5tv-3DxhfyKkrpK14Lv5_bKcsyCVLfLGMwjY
Message-ID: <CABWZVhpzKpTz9A-nHFEYgAdrDWFzmjMZOPW=Zo=wD6Bv6zgfcA@mail.gmail.com>
Subject: Re: [PATCH v3] coresight: Fix scheduling while atomic in coresight_cpu_pm_notify()
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, 
	"moderated list:ARM/CORESIGHT FRAMEWORK AND DRIVERS" <coresight@lists.linaro.org>, 
	"moderated list:ARM/CORESIGHT FRAMEWORK AND DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:Real-time Linux (PREEMPT_RT):Keyword:PREEMPT_RT" <linux-rt-devel@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_023322_142636_5A945FB2 
X-CRM114-Status: GOOD (  35.76  )
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

Hi Leo, Sebastian,

Thank you both for the deep architectural insights.

Leo, your point about the parent device unbinding and tearing down the
data while the PM notifier holds a raw pointer makes perfect sense.
Trading a "scheduling while atomic" panic for a potential
Use-After-Free is certainly not the goal. I clearly see why the raw
spinlock isn't enough to protect the underlying memory lifetime
against a concurrent driver unbind.

I am closely following your discussion regarding the
`device_link_add()` approach. Once you reach a consensus on the best
lifetime model for the active session, please let me know how you
would like to proceed.

I would be more than happy to help implement the new design and
prepare the necessary patches, or I can gladly step back if you prefer
to handle this broader architectural refactoring yourself, Leo.

Thanks again for your time and guidance on this!

Best regards,
Mohamed Ayman

On Fri, Jul 17, 2026 at 7:12=E2=80=AFPM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2026-07-17 16:58:48 [+0100], Leo Yan wrote:
> > >  static struct coresight_path *coresight_cpu_get_active_path(enum cs_=
mode mode)
> > >  {
> > >     struct coresight_device *source;
> > > -   bool is_active =3D false;
> > > +   struct coresight_path *path =3D NULL;
> > >
> > > -   source =3D coresight_get_percpu_source_ref(smp_processor_id());
> > > -   if (!source)
> > > -           return NULL;
> > > -
> > > -   if (coresight_get_mode(source) & mode)
> > > -           is_active =3D true;
> > > +   guard(raw_spinlock_irqsave)(&coresight_dev_lock);
> > >
> > > -   coresight_put_percpu_source_ref(source);
> > > +   source =3D per_cpu(csdev_source, smp_processor_id());
> > > +   if (source && (coresight_get_mode(source) & mode))
> > > +           path =3D source->path;
> >
> > I agree the get_device()/put_device() pair in
> > coresight_cpu_get_active_path() is not a good fit for CPU PM notifier,
> > because the put_device() can become the final put while IRQ is disabled=
.
> >
> > However, my understanding is this patch might cause UAF issue that the
> > existing code is intended to prevent.
> >
> > The raw spinlock (coresight_dev_lock) serializes access to the per-CPU
> > csdev_source pointer. It does not guarantee the lifetime of the source
> > or its _parent_ device. coresight_unregister() is not only reached from
> > module unload; it can also be called when a driver is unbind, for
> > example DT overlay removal or device hotplug/unplug.
>
> But doesn't coresight_unregister() block on the coresight_dev_lock here?
>
> > This is why the UAF issue Sashiko mentioned in patch 03 of [1]. A built
> > CoreSight path currently grabs references for the path components, whic=
h
> > keeps module alive, but that is not the same as preventing the parent
> > device/driver from being unbound and tearing down CoreSight device data
> > while an active session still has raw pointers.
> >
> > There are also similar race window before the path is built: for
> > example etm_setup_aux() has to look up source/sink state before
> > coresight_build_path() establishes the path, so it might access
> > released source/sink data if device is unbound.
> >
> > I think a proper fix needs a clearer lifetime model for an active
> > session. E.g., we could consider to call device_link_add() to prevent
> > device unbind / unregister, and unlink device when the session is
> > finished. Once that is in place, the CPU PM notifier can safely use the
> > active path without get_device()/put_device() pair anymore.
>
> Right. I am also not sure about lifetime of coresight_device::path.
>
> > Hope this is clear and makes sense.
> >
> > Thanks,
> > Leo
>
> Sebastian

