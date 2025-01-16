Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD8FC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 14:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CMm9oC8JLc9tH1UbysAyP6D76A9/5ushkDqcGo4ZtBI=; b=01ll4kdKY19WrFOgsUem1E3CeD
	BRKttQqa4hTe+WAlPr8t0K5/8JuBrtJEhD6NA16YshBtiKw1cVbEVFvIhGSRew4NbicvnmMEIztlJ
	8dcoo80j4s8G6iDbBHb+H7msP4irUWeMRZnCjt0/A8+XCHvlejM+sA1t947RPJ378aDVSEryRaGf3
	OI8XYxiwZs2aJLqyDuqMON59ywuCORobAstChC6ujOy1IRrTvXw4ke1CfqnD9YtxZ0fE7gn44s1Wv
	cbLSQIdX2VbUN5wP5y4IYYJSjXS8af3kwcjNoJj8IOOL5PcW2Jjis2m/UJVrAuduRYLgVGCoOrNfW
	mvkvyGKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYQpV-0000000F9lv-3dak;
	Thu, 16 Jan 2025 14:26:41 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYQoF-0000000F9Xk-0bsG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 14:25:24 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-304d760f12aso8848621fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 06:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737037521; x=1737642321; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CMm9oC8JLc9tH1UbysAyP6D76A9/5ushkDqcGo4ZtBI=;
        b=R4W51gPCltPlk4SUiG1TuMQ5nKjEsI6m5/8yx2IG4y2frpwxxql0o0IgaG/tgXZhk1
         xx0McOuIN5docGSY8cfZjiPE9CwPj3LEPpiniDJ3XqN6hm5Zd4EdWHueFSYQi0eebKVH
         OOUsMPI3kq0Yc6aZR4CvcnxiZhfWpin38nW9Nw+wsaVvVcM7VuMXABITnOzps3DUS1yo
         U4nqPCLYaZVD/FagEWaroJW30vWNUEnaBlXTdpNW5bgTz4zmd4fbj5LBGQmgoQP5qWGJ
         ztHfBM3wxfGZ00nrNqlR6x2d5LeoBBT71iWDpLwY0bGHkunNfOU5Q0GeeuGK/yZG8nur
         xQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737037521; x=1737642321;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CMm9oC8JLc9tH1UbysAyP6D76A9/5ushkDqcGo4ZtBI=;
        b=JW3X1aXMPTcXXhKnAZsuc7PvZ3v+vmkveYi/HHkNiLvjlF/+Z6Dh3e2OSp9D+nMEcr
         YRGVE8vJWLoQhXfpU66Lj6S+lfHZWOv72Y20+YwqSEkus8WrTfGP3zfIs8jbKLCO1WZk
         BPMbQIUYNuQeMF0rdtoa++YI78fKovtV8sqYJvqDVRIJYB99klj6qH7Lx5A+FNMcRa5c
         TWVNbFqgwYkN0wgV1cKuVIDR0CLnD5CL0YJGL8tiaivAlWgF25v8F/n+GqV6dFHfKA84
         Zc5HUnYrm5sScguyiYLm2zamkI+BOOkGlP/et8zSueyLJYAIk9L37VVq4tfONpWS16wh
         EEuw==
X-Gm-Message-State: AOJu0Yz3sU5Fh/DAtOjQzJK4kHIVvDpb2I/s3kZJqeq03WJr7yRpMmjx
	ApoXg3CPJucs/MrpSS6A/5bUNfBxFVTtRfFwjc3+McYtmZq3ofZ9JZ+Qz8uZMcjAL3xC3qw/NI3
	05i6PC78JLevq3N3V9TcTHEnHlCc=
X-Gm-Gg: ASbGnctjs6rWfMTFo29LAJVK3i+eYZbd+u40GSBgGqZfyQ/1r8RvIDf77QJkLv+i6TQ
	j9nsS+9tqAMTCH4jy74ncKvFsKms9MrC28R+DBw==
X-Google-Smtp-Source: AGHT+IEN3o/uKUe8sAJeF8y+RZ7VmfjTzka5mMUZSRGrctHFErqfQ8UZaQGq95WFGmwt8fYxKJIHiiG4zY8SoxFaik4=
X-Received: by 2002:a05:651c:1545:b0:300:2524:84f2 with SMTP id
 38308e7fff4ca-305f45324b0mr111390931fa.2.1737037520803; Thu, 16 Jan 2025
 06:25:20 -0800 (PST)
MIME-Version: 1.0
References: <20241213145809.2918-1-ubizjak@gmail.com> <86bjxfsdw0.wl-maz@kernel.org>
In-Reply-To: <86bjxfsdw0.wl-maz@kernel.org>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Thu, 16 Jan 2025 15:25:09 +0100
X-Gm-Features: AbW1kvYklpOf0q0rjC_Uwf-POYuajHKr5oRd1-oyGpfHb4KzOgc8ghKB3RkZwwE
Message-ID: <CAFULd4Zf4=bh6X+xg+0i5jE8doyD_ffpaWOhsdHciVHRrQj+9A@mail.gmail.com>
Subject: Re: [PATCH 1/3] KVM: arm64: timers: Fix percpu address space issues
 in kvm_timer_hyp_init()
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Content-Type: multipart/mixed; boundary="00000000000063b351062bd390d3"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_062523_192132_2D4A7E00 
X-CRM114-Status: GOOD (  29.68  )
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

--00000000000063b351062bd390d3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2024 at 6:15=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrote=
:
>
> On Fri, 13 Dec 2024 14:57:52 +0000,
> Uros Bizjak <ubizjak@gmail.com> wrote:
> >
> > Cast return value from kvm_get_running_vcpus() in the __percpu
> > address space to the generic address space via uintptr_t [1]
> > to fix a couple of:
> >
> > arch_timer.c:1395:66: warning: incorrect type in argument 2 (different =
address spaces)
> > arch_timer.c:1395:66:    expected void *vcpu_info
> > arch_timer.c:1395:66:    got struct kvm_vcpu *[noderef] __percpu *
> >
> > sparse warnings.
> >
> > There were no changes in the resulting object files.
> >
> > [1] https://sparse.docs.kernel.org/en/latest/annotations.html#address-s=
pace-name
> >
> > Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> > Cc: Marc Zyngier <maz@kernel.org>
> > Cc: Oliver Upton <oliver.upton@linux.dev>
> > Cc: Joey Gouly <joey.gouly@arm.com>
> > Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> > Cc: Zenghui Yu <yuzenghui@huawei.com>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > ---
> >  arch/arm64/kvm/arch_timer.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
> > index 1215df590418..a13bb9e8dc19 100644
> > --- a/arch/arm64/kvm/arch_timer.c
> > +++ b/arch/arm64/kvm/arch_timer.c
> > @@ -1392,7 +1392,7 @@ int __init kvm_timer_hyp_init(bool has_gic)
> >
> >       if (has_gic) {
> >               err =3D irq_set_vcpu_affinity(host_vtimer_irq,
> > -                                         kvm_get_running_vcpus());
> > +                                         (void *)(uintptr_t)kvm_get_ru=
nning_vcpus());
> >               if (err) {
> >                       kvm_err("kvm_arch_timer: error setting vcpu affin=
ity\n");
> >                       goto out_free_vtimer_irq;
> > @@ -1416,7 +1416,7 @@ int __init kvm_timer_hyp_init(bool has_gic)
> >
> >               if (has_gic) {
> >                       err =3D irq_set_vcpu_affinity(host_ptimer_irq,
> > -                                                 kvm_get_running_vcpus=
());
> > +                                                 (void *)(uintptr_t)kv=
m_get_running_vcpus());
> >                       if (err) {
> >                               kvm_err("kvm_arch_timer: error setting vc=
pu affinity\n");
> >                               goto out_free_ptimer_irq;
>
> I think the fix is worse than the current code, because there is no
> real semantics behind the pointer being passed to
> irq_set_vcpu_affinity(). All that is required is that it is a non-NULL
> pointer.

If this is the case, we can just remove dependence on the pointer in
the called function.

Something like in the attached patch.

Uros.

> I expect the following hack to work just as well and not suffer from
> any sparse indigestion. Untested though.
>
>         M.
>
> diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
> index 1215df5904185..8058d92048fb4 100644
> --- a/arch/arm64/kvm/arch_timer.c
> +++ b/arch/arm64/kvm/arch_timer.c
> @@ -1391,8 +1391,7 @@ int __init kvm_timer_hyp_init(bool has_gic)
>         }
>
>         if (has_gic) {
> -               err =3D irq_set_vcpu_affinity(host_vtimer_irq,
> -                                           kvm_get_running_vcpus());
> +               err =3D irq_set_vcpu_affinity(host_vtimer_irq, info);
>                 if (err) {
>                         kvm_err("kvm_arch_timer: error setting vcpu affin=
ity\n");
>                         goto out_free_vtimer_irq;
> @@ -1415,8 +1414,7 @@ int __init kvm_timer_hyp_init(bool has_gic)
>                 }
>
>                 if (has_gic) {
> -                       err =3D irq_set_vcpu_affinity(host_ptimer_irq,
> -                                                   kvm_get_running_vcpus=
());
> +                       err =3D irq_set_vcpu_affinity(host_ptimer_irq, in=
fo);
>                         if (err) {
>                                 kvm_err("kvm_arch_timer: error setting vc=
pu affinity\n");
>                                 goto out_free_ptimer_irq;
>
> --
> Without deviation from the norm, progress is not possible.

--00000000000063b351062bd390d3
Content-Type: text/plain; charset="US-ASCII"; name="arch_timer.diff.txt"
Content-Disposition: attachment; filename="arch_timer.diff.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_m5zf9nx60>
X-Attachment-Id: f_m5zf9nx60

ZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQva3ZtL2FyY2hfdGltZXIuYyBiL2FyY2gvYXJtNjQva3Zt
L2FyY2hfdGltZXIuYwppbmRleCAxMjE1ZGY1OTA0MTguLjEwYzI5M2MyZDJmNSAxMDA2NDQKLS0t
IGEvYXJjaC9hcm02NC9rdm0vYXJjaF90aW1lci5jCisrKyBiL2FyY2gvYXJtNjQva3ZtL2FyY2hf
dGltZXIuYwpAQCAtMTIzOCwxMiArMTIzOCwxMCBAQCB2b2lkIGt2bV9hcm1fdGltZXJfd3JpdGVf
c3lzcmVnKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKIAl9CiB9CiAKLXN0YXRpYyBpbnQgdGltZXJf
aXJxX3NldF92Y3B1X2FmZmluaXR5KHN0cnVjdCBpcnFfZGF0YSAqZCwgdm9pZCAqdmNwdSkKK3N0
YXRpYyBpbnQgdGltZXJfaXJxX3NldF92Y3B1X2FmZmluaXR5KHN0cnVjdCBpcnFfZGF0YSAqZCwK
KwkJCQkgICAgICAgdm9pZCBfX2Fsd2F5c191bnVzZWQgKnZjcHUpCiB7Ci0JaWYgKHZjcHUpCi0J
CWlycWRfc2V0X2ZvcndhcmRlZF90b192Y3B1KGQpOwotCWVsc2UKLQkJaXJxZF9jbHJfZm9yd2Fy
ZGVkX3RvX3ZjcHUoZCk7CisJaXJxZF9zZXRfZm9yd2FyZGVkX3RvX3ZjcHUoZCk7CiAKIAlyZXR1
cm4gMDsKIH0KQEAgLTEzOTEsOCArMTM4OSw3IEBAIGludCBfX2luaXQga3ZtX3RpbWVyX2h5cF9p
bml0KGJvb2wgaGFzX2dpYykKIAl9CiAKIAlpZiAoaGFzX2dpYykgewotCQllcnIgPSBpcnFfc2V0
X3ZjcHVfYWZmaW5pdHkoaG9zdF92dGltZXJfaXJxLAotCQkJCQkgICAga3ZtX2dldF9ydW5uaW5n
X3ZjcHVzKCkpOworCQllcnIgPSBpcnFfc2V0X3ZjcHVfYWZmaW5pdHkoaG9zdF92dGltZXJfaXJx
LCBOVUxMKTsKIAkJaWYgKGVycikgewogCQkJa3ZtX2Vycigia3ZtX2FyY2hfdGltZXI6IGVycm9y
IHNldHRpbmcgdmNwdSBhZmZpbml0eVxuIik7CiAJCQlnb3RvIG91dF9mcmVlX3Z0aW1lcl9pcnE7
CkBAIC0xNDE1LDggKzE0MTIsNyBAQCBpbnQgX19pbml0IGt2bV90aW1lcl9oeXBfaW5pdChib29s
IGhhc19naWMpCiAJCX0KIAogCQlpZiAoaGFzX2dpYykgewotCQkJZXJyID0gaXJxX3NldF92Y3B1
X2FmZmluaXR5KGhvc3RfcHRpbWVyX2lycSwKLQkJCQkJCSAgICBrdm1fZ2V0X3J1bm5pbmdfdmNw
dXMoKSk7CisJCQllcnIgPSBpcnFfc2V0X3ZjcHVfYWZmaW5pdHkoaG9zdF9wdGltZXJfaXJxLCBO
VUxMKTsKIAkJCWlmIChlcnIpIHsKIAkJCQlrdm1fZXJyKCJrdm1fYXJjaF90aW1lcjogZXJyb3Ig
c2V0dGluZyB2Y3B1IGFmZmluaXR5XG4iKTsKIAkJCQlnb3RvIG91dF9mcmVlX3B0aW1lcl9pcnE7
Cg==
--00000000000063b351062bd390d3--

