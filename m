Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD84C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 16:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s5Qn3Izea1XkIFjORxwyxiB7Rz8OfU+yXngImMLSszU=; b=ezJvtzSXwPRknTEHSl3ZhAacsU
	FCndnujyfEIA1MQNvZeYPGJh9Fj2Wdnuo7ZBK7y3vuz/PhkX+ZCBRo+fbL2BJ9cl71+G3I6EPAFnW
	JY7wxnQ8qNLUHfsm1+l4HLB3F9dX+9nEl9XiLZnIWjpXAOuJgiIzHbuQC0CgeZWRwoUG6oRhpMyt0
	reLKcilSUOJn7/+TRXZRj98MRADpwVyUN/3LlOaOZqson8QIJxqSMJBmA2aHGxBstUcXTUp8IRwUH
	QDFlPnz8HGDm6A5Ockt0D/1MR4/oo+recN+R3bMHIVUEjQ3lLuo1lUWoLaPgsT/W1OzhYOnd1j5bX
	gMhQTuXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3oD-00000005ESe-1ylq;
	Mon, 17 Feb 2025 16:17:25 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3Fl-000000056Br-2BHC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 15:41:50 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-471fa3b19bcso80331cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 07:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739806908; x=1740411708; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s5Qn3Izea1XkIFjORxwyxiB7Rz8OfU+yXngImMLSszU=;
        b=jXam/HmM5eR9Dns02RiS0ssQp3koP5ZAoEnOUgN2uslLhstaJx3nn1hZDtjm7oYNbM
         oVhLAuPgHMqvB07yDKMVNCX0HcCeaj5LbpEz0D7NLEO/1n1PUUH9zqExDR5Ox+AZ0UAs
         pdJz8EWZbRrwRrGsoc+4KEQDzmuFESuVY8hG2H28+USDkiXsA5qyLGmI/VYP18frvEDs
         89b6rqDuZ6Grz3GZCiHf1DdpGqZqnmIWcG1hEKXLuc+t2cPCAoPvV1BHJLhHIOOsXPeb
         E6VLZX7EkQvS16Tzd+ZU8he9rmZT2lYuGJzUBNQ1vrJ2h+dpVuFU2Ei0dR5Rx5B9SwU+
         S54A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739806908; x=1740411708;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s5Qn3Izea1XkIFjORxwyxiB7Rz8OfU+yXngImMLSszU=;
        b=Vo7BdY5pEVZR5hmiJQmNsWVN5drq06R0myGAJiPgjSsRBp1XV2dQHHsCGBRD5l3ziw
         tHDIKas4aDznHxqn0xmypjWsYvtwL7hyVsFn11CarFL7sCI/eG2hTXEpP8emcRJkaLZa
         bHPMLrxfr7/JEshNmRzEn29PrMTv8QKblTkYDP94dcpqzX3v9l8J8Sc2LXHIqF+xFmu+
         s7UMkE6sHntTAvYxJTEEVKoo7OjFMh5JoZtA7PVrefg8AHQBf3XRq3iQlvn1kVaG3G+1
         4gMdvGtAW2sebz0y1oppOKGqQ+9gXUTSIESoqZ7Mm+GIdz02jdg9MjCyjhhqKOjiYo8g
         5ieg==
X-Forwarded-Encrypted: i=1; AJvYcCU/7U5WvTOg7EmmWVs3vKApfAJWcj8zYtjIp8vwUED5qOLX88FbDoL+fuIBdvP1Q9ohPbG+Pv8ntEi/E7vfnBDF@lists.infradead.org
X-Gm-Message-State: AOJu0YwbtiHvZoVm8M9IAO391+DNW7E3U858d4oqXpW9SKmuJGRg4FcX
	UZZo4wTbXkeX836l+yS1kHKjxYxgpGRAoan35FE4Fh7CR7GEsdwsjd7EvpViUWv+v8tmzdWDAZt
	rct62zzrvsY03BVpcPm9GeIpiE0SR2aOPfxSo
X-Gm-Gg: ASbGncubaIrdq5SYoQc1oUW28PbhlJLIyxT+U6s/PEbpX8FW84SNWQNyedJEBfpGnrM
	bQI5ffyvGSXrQKztTj4zXV/yKv42xXx5fb54TAmLr6Rj6F+oRJegUpBCCeVZWYxCOjfQIXo0=
X-Google-Smtp-Source: AGHT+IEV69uZM3laRSzjCGKBZlseoILARY1eAIAe+bkM661+fIqBeto74KePJaR81k8/nxiNWACCqrXZjC0ZbFzBnwY=
X-Received: by 2002:a05:622a:1899:b0:467:7c30:3446 with SMTP id
 d75a77b69052e-471de0b5ed9mr6696061cf.25.1739806907930; Mon, 17 Feb 2025
 07:41:47 -0800 (PST)
MIME-Version: 1.0
References: <20250214150258.464798-1-tabba@google.com> <20250214150258.464798-4-tabba@google.com>
 <20250217153031.GA16398@willie-the-truck>
In-Reply-To: <20250217153031.GA16398@willie-the-truck>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 17 Feb 2025 15:41:10 +0000
X-Gm-Features: AWEUYZkFTQSHdZxvo_v7HWx6s0y_SqFFArebD5bJZjqRw5mfCRmh2Sc8vDT1ZT8
Message-ID: <CA+EHjTyOk_VpcTaD-VsH9X7KjpPKWu-HyVE3EEV+rzhnHar84A@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] KVM: arm64: Create each pKVM hyp vcpu after its
 corresponding host vcpu
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	maz@kernel.org, oliver.upton@linux.dev, mark.rutland@arm.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, broonie@kernel.org, qperret@google.com, 
	vdonnefort@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_074149_587096_D6E87355 
X-CRM114-Status: GOOD (  25.57  )
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

Hi Will,

On Mon, 17 Feb 2025 at 15:30, Will Deacon <will@kernel.org> wrote:
>
> On Fri, Feb 14, 2025 at 03:02:58PM +0000, Fuad Tabba wrote:
> > Instead of creating and initializing _all_ hyp vcpus in pKVM when
> > the first host vcpu runs for the first time, initialize _each_
> > hyp vcpu in conjunction with its corresponding host vcpu.
> >
> > Some of the host vcpu state (e.g., system registers and traps
> > values) are not initialized until the first time the host vcpu is
> > run. Therefore, initializing a hyp vcpu before its corresponding
> > host vcpu has run for the first time might not view the complete
> > host state of these vcpus.
> >
> > Additionally, this behavior is inline with non-protected modes.
> >
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  arch/arm64/include/asm/kvm_host.h      |  2 +
> >  arch/arm64/include/asm/kvm_pkvm.h      |  1 +
> >  arch/arm64/kvm/arm.c                   |  4 ++
> >  arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  6 ---
> >  arch/arm64/kvm/hyp/nvhe/pkvm.c         | 54 +++++++++++++++-----------
> >  arch/arm64/kvm/pkvm.c                  | 28 ++++++-------
> >  6 files changed, 53 insertions(+), 42 deletions(-)
>
> [...]
>
> >  static int init_pkvm_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu,
> >                             struct pkvm_hyp_vm *hyp_vm,
> > -                           struct kvm_vcpu *host_vcpu,
> > -                           unsigned int vcpu_idx)
> > +                           struct kvm_vcpu *host_vcpu)
> >  {
> >       int ret = 0;
> >
> >       if (hyp_pin_shared_mem(host_vcpu, host_vcpu + 1))
> >               return -EBUSY;
> >
> > -     if (host_vcpu->vcpu_idx != vcpu_idx) {
> > -             ret = -EINVAL;
> > -             goto done;
> > -     }
> > -
> >       hyp_vcpu->host_vcpu = host_vcpu;
> >
> >       hyp_vcpu->vcpu.kvm = &hyp_vm->kvm;
> >       hyp_vcpu->vcpu.vcpu_id = READ_ONCE(host_vcpu->vcpu_id);
> > -     hyp_vcpu->vcpu.vcpu_idx = vcpu_idx;
> > +     hyp_vcpu->vcpu.vcpu_idx = READ_ONCE(host_vcpu->vcpu_idx);
> >
> >       hyp_vcpu->vcpu.arch.hw_mmu = &hyp_vm->kvm.arch.mmu;
> >       hyp_vcpu->vcpu.arch.cflags = READ_ONCE(host_vcpu->arch.cflags);
> > @@ -687,27 +689,28 @@ int __pkvm_init_vcpu(pkvm_handle_t handle, struct kvm_vcpu *host_vcpu,
> >               goto unlock;
> >       }
> >
> > -     idx = hyp_vm->nr_vcpus;
> > +     ret = init_pkvm_hyp_vcpu(hyp_vcpu, hyp_vm, host_vcpu);
> > +     if (ret)
> > +             goto unlock;
> > +
> > +     idx = hyp_vcpu->vcpu.vcpu_idx;
> >       if (idx >= hyp_vm->kvm.created_vcpus) {
> >               ret = -EINVAL;
> >               goto unlock;
> >       }
> >
> > -     ret = init_pkvm_hyp_vcpu(hyp_vcpu, hyp_vm, host_vcpu, idx);
> > -     if (ret)
> > +     if (hyp_vm->vcpus[idx]) {
> > +             ret = -EINVAL;
> >               goto unlock;
> > +     }
>
> I'm not sure how much we care at EL2, but it looks like there's a
> potential spectre gadget here given that 'idx' is now untrusted.
> Perhaps chuck something like:
>
>         idx = array_index_nospec(idx, hyp_vm->kvm.created_vcpus);
>
> before indexing into 'hyp_vm->vcpus[]'?

I'll add that when I respin.

> Either way:
>
> Acked-by: Will Deacon <will@kernel.org>

Thanks,
/fuad

> Will

