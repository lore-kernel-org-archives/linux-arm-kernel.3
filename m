Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9AD0CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 15:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uc97my+cmQsKhLzxdnWEgFr7kOoH51/4k3Hl8Nt8XNU=; b=e5JrYDLDIzDaD/gfeU8m3uINvM
	5bDeN/TVbcTR60rb1rxX8EMRt3ylN092XW4Wvek3DsKQ+Ywnz6pF24lhVXw/5Wu3vuLxFcBXixzCm
	KfsUiAUKIWPeNZBMlXsVf45mok1vgSIBfymiat65DLgkHWfftbOsJ0/01BbQGfD3MA0hhJxv4FP4O
	8kADBu4372myJtT13f878+F4Aubl29czXYc7dNwiis0FRBEU7P+kSOFLCbIBVKp86lwBHzmlYp5UJ
	mti8tPZW5Myhm5jZb3W9Nwuu0qdAwQCrXEBCS3LrVIWemCkBiTlkU+OBhtKa+GS1k7C+bbYcWh3GX
	v1k/1UOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdtT-00000001Fj2-1Kol;
	Wed, 06 May 2026 15:10:35 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdtR-00000001FiF-33KS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 15:10:34 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-50d864c23bdso679151cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 08:10:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778080232; cv=none;
        d=google.com; s=arc-20240605;
        b=h/TbOOg0FfevM93mk3sx2uWYyy/307+2ItrFqNmMNAJGHavfRvoKoqjvqZH8ib41yC
         jHjzBgsIMIMgOw6+NIoyUEuh5p2ICT2dBsBIeAXBBqwt5W9k1fW21PMu7qh0U/2Oob/G
         D0uZ1kRs+k6Oxve+uX1E9wpbYuviW2W8e9fFMdBrYNcWd0hClU4Fjk1BUJ22RD1Iro5b
         TSoEDzOA11w6DFBC+bJk1cTRnrsZRhRkGmTQNObZM8FPE7M83h/NEs4fOF5yQ4AYKNsk
         Di6uq8kSWfXgyDHBdz2wmlj2SOZBsF9yN1jqWV3JISDFC+bXXyXnNpqqiv3hI6vH3Mb3
         b+1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uc97my+cmQsKhLzxdnWEgFr7kOoH51/4k3Hl8Nt8XNU=;
        fh=9N1nomTrFQZhXzEQc7bpU11yS3Hldhp+iaK8uyJhBLQ=;
        b=EGuSgyanSKmjskIwlNdfDpFr2evmb3qhY7Vxfr3VYnJtPdu2Sv4vmycIilaCBCABoo
         RZhUyZxuUwOlu/nTiMNILbxUogOA3meidEkS/142f0ApzSEsKn9fgZ8nIYmWF3w1Ri+v
         8pf4ienZFbe9Iisu4DKQCSLqbm/iJRnbcCKuiQ8fRrprKX+D68Vfu6WU3qQwq3dgI32k
         7UGyVYSydOfirAvpeSNyoKi7ZoOdXRSsMx7QqzCKlxCJkfSIcDa2CyDEnSc5drjxfTDv
         XI5tziEa0zuu144s+MceHVghWCpgmYwHjoWQas6UavC8G1eItY6QkekS+gPvaKnYqjNn
         dGeg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778080232; x=1778685032; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uc97my+cmQsKhLzxdnWEgFr7kOoH51/4k3Hl8Nt8XNU=;
        b=vmNnqbJzIWlGNjTiJAoh1CkaDZzBLZVPj/4kcR7iiBBmk1mY4078llaWGX85w5xOsw
         PeY+AKSm+cqc9kYIeo/z/lvj/C+remDdcQpJOzomJVNPLSn1E0bqRdY7EoFozP+Defpl
         LXV7333Q6sHKjAyqsN1iE2rOmLCgwKgp5vL2F+/LR8IiNtDVoVPmQwGov6GOMIWzU19D
         yLaX1BZREBc5yR4p+c63vHrVtsoMMqulLfRz1qYRVg5uBMXu5MU1E5QOpD8mSCo8/ikZ
         w2x+lfAXKAXr3GT1rtSUYqYFsWOsPI2DiXz+ajJ3ehT3WQ88bzMHJozAVEvnpoJkJUvU
         jOQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778080232; x=1778685032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uc97my+cmQsKhLzxdnWEgFr7kOoH51/4k3Hl8Nt8XNU=;
        b=GuWqVIDTPeOOiBF1xsYKsuKs8VpZQ1KH0x90/YlcwyPBeBLM9BhTGLxCnnWbkRuutL
         xpcHgLhEfXfZbWKNhIA5HmFhO8ctAjIzcDW5vI9jSNlk5HAVKQKGVXLjy8IPtSGO5vpt
         H6uDN5AU26fdorJkLiKxtCX5Uv4Zu/EBXaHiNhgJM8GC0jSeooG9IvW39qcvlVhMUgLV
         fLKde17sVeXMqaEhLJWVirz68Afpkj0hgZr3jE6YzI6z25PGatmxBFGy7ilH029xrWSW
         3OkJl4hwtA4Y3RK0G/2xciAD3N52UkzmcVSxGywCOAeBWav2Y9SBKf0ZsHV8E7NS3dh4
         Zx7g==
X-Gm-Message-State: AOJu0YxHiLe6mc1c+xy8FCNIb4+Cuanfn9d8kXry8uP7aQmwnnffH3uN
	HGO5gypeQWAi7UMfRLiKwnkAtXkg7UvDwDODgRQuZW0qberuRu3NOgvyYF5JIcWxGV7xkxqiZi/
	GQ/2Jo6Qs5Y/tQPTdpnyw0FinOYwFHscdgdlSvyIv
X-Gm-Gg: AeBDievkw1n1Bctuql6W3aTPU4zF5+wRM+CyR5ZwRJrp8uqH9Jk3ihdhE5kRyJuM8pu
	tBhO+E6rb/0minPOgy3rOTCW4xW5jkU8DypJq8UrVfblnRZDZjWPUge8vr1tkxJxqguPOrQjMzd
	dIjCFAyNrjLCWMO+HTNB6YH1WP+MqVJEQfubRlRSv7DsGj0735Lkz0EgG6tpeyMfa+/2FSJ9i82
	H47ejjTKFOZfRWl32W8DWiIGNgrFbi162zNFsuho7DWWm1bLIOl9Bz1WH/AtQNrmG71gELaViFV
	13vuVNYaeJs0HMBeT4rhMpJBwU5lVJShngvJacs4RZEOYo7ocxmDCn/6zMg=
X-Received: by 2002:a05:622a:8d0b:b0:50e:5eba:cadd with SMTP id
 d75a77b69052e-51460609360mr18117251cf.2.1778080231852; Wed, 06 May 2026
 08:10:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260430103724.2151625-1-smostafa@google.com> <aftYT7BY_9ZdGxmA@google.com>
In-Reply-To: <aftYT7BY_9ZdGxmA@google.com>
From: Mostafa Saleh <smostafa@google.com>
Date: Wed, 6 May 2026 16:10:20 +0100
X-Gm-Features: AVHnY4JvfF-Rm5qhU_8GJTR4Tqjlts8HwSwhfutueSCgDZO7opguuERjCEmtOYs
Message-ID: <CAFgf54o7pGrtBY1mHuptnCNrRSGVPU=WHW=Qf5v+wGL6Gum-Dg@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Harden clock for nvhe/pKVM
To: Vincent Donnefort <vdonnefort@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, catalin.marinas@arm.com, will@kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_081034_038831_620D4120 
X-CRM114-Status: GOOD (  22.91  )
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

On Wed, May 6, 2026 at 4:03=E2=80=AFPM Vincent Donnefort <vdonnefort@google=
.com> wrote:
>
> On Thu, Apr 30, 2026 at 10:37:24AM +0000, Mostafa Saleh wrote:
> > Sashiko(locally) reports possiblity of division by zero and
> > out-of-bounds bitwise shift in trace_clock_update().
> >
> > Although the clock update is untrusted, we should at least have some
> > basic checks to avoid the clock value getting out of sync if the host
> > is buggy.
>
> I am not sure about the gain here. The host can still write values that w=
ill
> make it out of sync anyway.
>
> The timestamp is ultimately fed and read by the host.
>

This is not about having the clock in sync, but to avoid executing
undefined behavior, such as division by zero or large shifts in cases
if the host is buggy and not malicious.
That was reported by Sashiko
https://sashiko.dev/#/patchset/20260501111928.259252-1-smostafa%40google.co=
m

Thanks,
Mostafa

> >
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/clock.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/arch/arm64/kvm/hyp/nvhe/clock.c b/arch/arm64/kvm/hyp/nvhe/=
clock.c
> > index 32fc4313fe43..a7fc61976fd0 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/clock.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/clock.c
> > @@ -35,6 +35,9 @@ void trace_clock_update(u32 mult, u32 shift, u64 epoc=
h_ns, u64 epoch_cyc)
> >       struct clock_data *clock =3D &trace_clock_data;
> >       u64 bank =3D clock->cur ^ 1;
> >
> > +     if (!mult || shift >=3D 64)
> > +             return;
> > +
> >       clock->data[bank].mult                  =3D mult;
> >       clock->data[bank].shift                 =3D shift;
> >       clock->data[bank].epoch_ns              =3D epoch_ns;
> > --
> > 2.54.0.545.g6539524ca2-goog
> >

