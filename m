Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AECDCD98F3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 10:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0T7MVioxOqJtt2c5QhAul9oWeixmd9Ypl72khnmpGh0=; b=FG4zc/Z8UG9fsQC1qiphPgtzk8
	jZD95ULnFyIvG/9eJ+hFtYSqQaDq6RQCZxzG+W0IuKYFtPPO8eAhfJiGy6bzDmZSb3G9mIoJ3SzC0
	tvF23KxWsJgvrJSRaiDu0M7BMGnuM0Phbsz0o1CbmSzrfbAOF/xSlMMfV87tJUyhwkxu97dBfC2TJ
	WBTBidsPEs5u8jkoiB4LoPPJiUyjfHmzTRUepZmUwa5ZIST93cv9sTecwK3U2MOzZkdPLzvEsEYOA
	VhTQZEMFwfx7t17ARdItGREc5h6kcELMDj7wd7J5590d3XG+cemhNt5QaMcXZYjd9oux3/O3tkNjI
	5X2T4rXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa9qE-000000015H8-3ysD;
	Thu, 18 Jun 2026 10:19:22 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa9qD-000000015G9-1C6S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 10:19:22 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5ad4d840d43so4897e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 03:19:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781777959; cv=none;
        d=google.com; s=arc-20260327;
        b=lfIoYfJgwaYDz8mNWr6AbAw/Z/X7ilwnBwJWThafxMo5qjd8CVoWedHqD1v8sq/xEz
         Jskg7uGKn6gDgVeQIE1ydb0/WijCOHyJk9l1B8aPzqeJ/W0Ratkv8jTK06NSFZ5YtDiR
         d7iEaSkYYTjhhAuJ9vqWIENVfDrQxfJ7xXjofv0oaGmj/ilQqK46HCWlMD7c0lD1fifB
         F+4r0ouAejlm6oVTQ6t2VW2aNiekzZH8ByUvvkizVii0lByiDEGyrY8XmNasfwJ8yCIt
         X2lbEYOC+ruUEZO7sixWI4pqdHYhyTQQd8v7/mxK4QRCrOHlT/9HHOLrKe1lxycRjS0v
         NnKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0T7MVioxOqJtt2c5QhAul9oWeixmd9Ypl72khnmpGh0=;
        fh=B2A9c1+rQL23YBQWj+3YWZoQvgU1EAHU7Ty+YhoYqOU=;
        b=U/CAjvK9eDO2M9BBauTBuOtWDT/AxagVgxAVG7ngZRRiWOg1es0lIfRUvMbXgEtfoe
         /8Ddy8RXE5YFhtibybUV/gQ6CA6EuK1ysF/Lro0ac4iuRK+wPxL3+b0uEI9ko4N/6JoZ
         1OL3xH5/YOT0PXOWlvrRu7sTj7kwEXj1ayk7QAXBHDrS641xkXj6FeSKECG7c680gGXd
         ivZo8v4XItF039havU+NG1meTqhHUr0bSvU17ouZvFh9vp6un3/6KIkxB2/3JO5YCs0R
         qr8gTs5JEx1ocUheFwxe2gVMze07RKV9qB1SCYD2L7MQty7pwXPR/PqMcdzgBdvgirWa
         Kxnw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781777959; x=1782382759; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0T7MVioxOqJtt2c5QhAul9oWeixmd9Ypl72khnmpGh0=;
        b=LfOioD65E2V2Y7j926TErJ5i67fO++8VKR1a8lJD/Co0BZ1Gt6bCqVCIRdb+vLhTil
         CwCH2hdFF7WHCclEnlOTETzw4bsiJLM0sdQb8aYrIUMY10FxpsgZvapKzMKHkJzQhON0
         /yJinpyL6gBL9esfsrvzGTHMgSMCOcWb4KuOMu2fT5bTd9VUhJH2heUmh0k7X1xyYH1q
         YbrAvUi5zTTHbWiHhLS3z/n0JkU4qbr6yfkimb4T48q7/HIBAeleTFV3NY5U2a372DFj
         trQzY9ntYXenbIoho5KYpW1YAGSvCqzP4P55cRHd75OwN5zMcjZP5+N0/KAIB2ynwMoa
         DIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781777959; x=1782382759;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0T7MVioxOqJtt2c5QhAul9oWeixmd9Ypl72khnmpGh0=;
        b=n3bvtk4rYFKmx8Aj5YSpztGhyXf7UQvwXebI+IUiYjdNSOsB77ueDPnk3+D2yaw9DP
         xrc64Z52Mb50qLgFiF4pKd4z1xl110/FrpuqCQOeVWTrvdIBPGKuGawXnNWp1HRJ4YeR
         VLcd0yPYKnAEPoeKNfgHxAQGkTM3rfB9ZaSMWMgvRZTS7ImeZGwr7j3nEG52O6TdjZQ7
         K/6rmcoXDH1Ap1h+Hb10WBmBK2Ic7towkdrGV9xuBvUIFo4Z55nTRtMJNXyS6VD2I3ot
         8if8WWPbqe71nbZfBkQ7CIALsL+WKqIg9Fgyg+B2LMP5dUISf6nq0EDPXsG3r/6d4Hxd
         TkkQ==
X-Forwarded-Encrypted: i=1; AFNElJ+vOf705y2ZenkUuJiEa1grTNheVEvFtPEoENK/xz0L0qrX/dMqFU78s7c4Tq3UPGx1eZWczLLMmHJZ3m/tqYSJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyNruRVl/ylj6chKc3zP1lY4wnTmRENoM2qYgdhByPSaClRokGT
	Nyo/pJo1vagBxuMOIPlmLRj2dpU/ePzPXvEeYBqNfm1ErXkw061DED1KYqh99r2qVB1BzGnX8U+
	3yJ8PTJpynozmnomJLxl3ma+pqR94b76ZL1NsaZ1v
X-Gm-Gg: AfdE7cn+rwhOylN8Tb8wsc1Uhur2hYvsWAdO5rezgc5P6mk6mOXr/tu7PA2jtzQdNIC
	bU2Dsk7dXSYGkveXVRZOEdX+u54sIlNHTBXRZcrKGctvFu1NI+YvahC8kj8nOXzMgHs11oTEX4T
	gqorLZehWmy4uUiZTPusdTdpXQN3QgOGtC8d7Rlh+HNerC5rqSesG5+ix4f76+S3jR/V+7//VST
	DJiHqBAhAFMJM5V0diXwkZQVQiYs99m1TyNgqvzzqy4c5y6yx50rC7fMUdPU9Hk6nS2uBRgrQ==
X-Received: by 2002:a05:6512:3d1a:b0:5ad:4839:b289 with SMTP id
 2adb3069b0e04-5ad4eea2dfemr85294e87.11.1781777958357; Thu, 18 Jun 2026
 03:19:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260612065925.755562-1-tabba@google.com> <20260612065925.755562-12-tabba@google.com>
 <86fr2krw56.wl-maz@kernel.org>
In-Reply-To: <86fr2krw56.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 18 Jun 2026 11:18:39 +0100
X-Gm-Features: AVVi8CfjTVhiF9Kb7_RTtLmGC6nmCGGpZSCVKIx3kdcfq-Vfjr3lT9JfoaFLcnQ
Message-ID: <CA+EHjTzeSsLUj2FVxzFyTF1sNvit6U7v2szX0uo5m7f91_W2Qw@mail.gmail.com>
Subject: Re: [PATCH v1 11/11] KVM: arm64: Implement lazy vCPU state sync for
 non-protected guests
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Quentin Perret <qperret@google.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Sebastian Ene <sebastianene@google.com>, 
	Per Larsen <perlarsen@google.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Hyunwoo Kim <imv4bel@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_031921_352757_CA8E0905 
X-CRM114-Status: GOOD (  26.86  )
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

On Thu, 18 Jun 2026 at 11:16, Marc Zyngier <maz@kernel.org> wrote:
>
> On Fri, 12 Jun 2026 07:59:25 +0100,
> tabba@google.com wrote:
> >
> > pKVM copies a non-protected guest's register context between the host
> > and the hypervisor on every world switch, even when the host never
> > inspects it. Defer the copy: on entry, flush the host context into the
> > hyp vCPU only when the host marked it dirty (PKVM_HOST_STATE_DIRTY); on
> > exit, leave it in the hyp vCPU and copy it back only when the host needs
> > it, via a __pkvm_vcpu_sync_state hypercall on trap handling or at vcpu
> > put. A protected guest's context is copied as before, since lazy sync
> > only helps where the host is trusted to see the guest's registers.
> >
> > The PC is the exception: it is copied back on every exit so the
> > kvm_exit tracepoint reports the guest's real exit PC rather than the
> > value left by the previous sync.
> >
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  arch/arm64/include/asm/kvm_asm.h   |  1 +
> >  arch/arm64/include/asm/kvm_host.h  |  2 +
> >  arch/arm64/kvm/arm.c               |  7 +++
> >  arch/arm64/kvm/handle_exit.c       | 22 ++++++++
> >  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 88 ++++++++++++++++++++++++++++--
> >  5 files changed, 115 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> > index 043495f7fc78..6e1135b3ded4 100644
> > --- a/arch/arm64/include/asm/kvm_asm.h
> > +++ b/arch/arm64/include/asm/kvm_asm.h
> > @@ -113,6 +113,7 @@ enum __kvm_host_smccc_func {
> >       __KVM_HOST_SMCCC_FUNC___pkvm_finalize_teardown_vm,
> >       __KVM_HOST_SMCCC_FUNC___pkvm_vcpu_load,
> >       __KVM_HOST_SMCCC_FUNC___pkvm_vcpu_put,
> > +     __KVM_HOST_SMCCC_FUNC___pkvm_vcpu_sync_state,
> >       __KVM_HOST_SMCCC_FUNC___pkvm_tlb_flush_vmid,
> >
> >       MARKER(__KVM_HOST_SMCCC_FUNC_MAX)
> > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> > index a49042bfa801..1ef660774adc 100644
> > --- a/arch/arm64/include/asm/kvm_host.h
> > +++ b/arch/arm64/include/asm/kvm_host.h
> > @@ -1113,6 +1113,8 @@ struct kvm_vcpu_arch {
> >  /* SError pending for nested guest */
> >  #define NESTED_SERROR_PENDING        __vcpu_single_flag(sflags, BIT(8))
> >
> > +/* pKVM host vcpu state is dirty, needs resync (nVHE-only) */
> > +#define PKVM_HOST_STATE_DIRTY        __vcpu_single_flag(iflags, BIT(4))
>
> Please don't add flags in random positions. Keep them grouped by
> type.
>
> Also, it is unclear to me whether this is really an input to the
> hypervisor (which is what iflags indicates), but rather a new type of
> flag that indicate some hypervisor-private state. May not be that
> important right now, but worth keeping in mind.

Will move it and come up with a better name/comment.

Cheers,
/fuad

>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

