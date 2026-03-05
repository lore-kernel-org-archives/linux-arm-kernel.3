Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D827BF3D31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 16:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZX8IkznGuT8tzheZIwXF+8NCOjzDtkabhnGyWvo57Q=; b=cNyXDWTx554jEojKDyk9QwevdR
	FLaFSAiM2tB8HntK7hjl+1EI99L0e9hfarE0dvBp9dvj1LzA+POIwgNQ05+FeEm6a7iEn7KysnLM6
	ckMaYUmlDdgyV+JQN8bSD3eh3KSRhpZOmDkJGF+ViqrUIpZXUGfksKGLHve0ZZwm0Tf3Gmf4EyrDd
	vllU6moZhEWK1KCZJ9vIPaAKrXUwQYv4G2P6DUf2YORJzhRFyRRnWntA1jDhRNCAx7rRV9ZlYTVXH
	PTvSUX2weYCbA0hFwSz68pkn5eTdkWvlPlwQkWGh7JmaFZ9jn4m4MEU3EDcpzw1EMdqeuADg1NCvv
	2Rfd8aHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyBLF-00000002BrJ-0nH4;
	Thu, 05 Mar 2026 16:14:25 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyBLD-00000002Bqx-2Pav
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 16:14:24 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-506a355aedfso601571cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 08:14:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772727262; cv=none;
        d=google.com; s=arc-20240605;
        b=Bs3Kz7ZnSTJKCEBQjFVxUqUZqDGNUjDWO76wkDzDdtgYzkOZRPFLwnPfKZ83oz4Vaw
         yc7e/A+TaYEzt3PEZQM8nc0p7E2symG3NGvffgqUAZigdsZlfKnCpou0GFMqvaiIbaDJ
         u/16e4YizWBpgTeBhMlH+l3HRN1HKEGWOnU9F+kkD9OvlzDanpYjQQz6UiMiO4r+A9BQ
         A+N3E8kWjrviOJl/2kQ+V/kIp5qwAjXFoxUoaVMTgYNb4rF7hGzDV8V40zgm/eJieCt5
         PEOSA63vvj8KYgizvl6xmlHpq5sdDdoZgjpFX6mfNmTmYTELuCBGbcM+pd5MZDZC4LGW
         pvYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RZX8IkznGuT8tzheZIwXF+8NCOjzDtkabhnGyWvo57Q=;
        fh=2EU4LFLg3nPS2hEVmwPsId2g65wK0EU36eXnFHGEnBU=;
        b=UjDJLtcR06SXb5pDJ1nJe2Sv0lqX+r/c5l/kWgDs0Cnvkbkhed+z10i4fDbBAv+xM2
         AzB099NkmP38Gf9Q1AQeTZ1OyBUqZ/CeQUTAIXE/kGk8ipVTC5Dwr68f67PlnCxd9IR6
         sE/Dd0YLNLcQWCzUedHtdwM6xuhpiLveJGdvWjwWILnWeZ8TR23Ry7BW7W6en1eJDtSq
         m3p53PsQp7h+70lzeaG1wfCGvVA6xT/I+ubOLXAXr/xZtaoHItvhl8jrtTKKSKvdMHPT
         4rOpQ3E7cc/MveNWatwicKnA+JuHIxyqK2uCmYkBxncYEpNGNEes0VdZIDqhMdcnLkv1
         0gUA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772727262; x=1773332062; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RZX8IkznGuT8tzheZIwXF+8NCOjzDtkabhnGyWvo57Q=;
        b=AvMcyzsfjAkWXa61ENKa9CjBQ+pHkeESj9i/55MxkBaV9KZUCVhjs071qDy9LvM1Kn
         uGnwxjEFHUFzHC8lXpx1O4RobA12BM4I6P8eCh/uWdmuIJ6xkUTpleqB9smgF7er16Nz
         HwnDaH+dZMGKgLoN4pMvRJ604XHneT10Au0UBm9yQMVwMxeXEl7RJPXrm4rwsauryaiS
         EPvzYOWCSZZcbw7YLm7U9jGjZVKpjxTImtXJod0/Qdt/TGwEnMu4UGtYs4gRQoslxh21
         SMGcPyud4fsH/s5PsDUO2Pv/9EllSe2tGgbyWPSpQJA7CGlw9Ge/alUPBgWwDoOWLOD0
         IJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772727262; x=1773332062;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RZX8IkznGuT8tzheZIwXF+8NCOjzDtkabhnGyWvo57Q=;
        b=T6W4dI2Ame+S1mUZEG5NHIxyWrVw+IL6O3PzlQMdds4L/EgrR9c1hN19oNo6CWXq9r
         BTl9Im+2zuYn/wfCaQJN65ueWeXpnuJTR1Z0C9wzPHsEJ7waOE2VibKUDANGcKW0IXVG
         1QvO/OpjGDYMXs68qMExbTeezJLRw4VVd+wKff/8wZ/Lq529bwYVVKMN7OisKiMcFBfB
         U81Gk1+LpWtCZBmwTS2XpMlbnP/wjbLHr6ojuuWala+H4opkNqtnD0Yn0dDQrR6K2E2m
         ec5Xceg9Dh/F+w4kRwufdN5/Wj62HydN7zJnQt5cDkevGM6CL4DkpI6WWqJ8RE1w4kGe
         Nqcw==
X-Forwarded-Encrypted: i=1; AJvYcCWeNsOzPHRwQzs53QHpyxj5mX8/FMvTKUI6XsE5nSwhfCyGUph4M5E6SZZt5SisTZLWuVeCA6zu1Dh/VUF3yFnx@lists.infradead.org
X-Gm-Message-State: AOJu0Yz66RwZfYYT9o3OW10KzPZP0bqyRTqficMbPhtZ1FZ50xzVXZY1
	8KqI/1dQXF1g7Q/Jh2OF87bvSYwtlvSdxQwQ8Jpl6EIuzY1e2QeUF1b99ASl7t76yMMea49TEx0
	sAB2Po134UAEpCRUYedl1fLV5QTk9g/rnzWEJjYG8
X-Gm-Gg: ATEYQzxoZS1OjbAeWoalfZH6NM5GFV+c8DJQITggNlG3Kg+rs+Xg86E4sOpb7vMhhyf
	iVJxVvJxseslFOWNneomYgvPyc2Cqzf3qXKzSPI48j52VSALnIOxwOk7E7iGHQ43Vq1Rz8O5JPb
	BWp7nw3yCOZJxXXEEcQVfEyLg4d1XxRZI0m5y5mmExcoQFnICJp3JVhSrkF/pHwI8iJj9WW6CoM
	Bss3tWMeg4LU5WOFnwZYhuf5Oc3yCy6r5HCNI0UuwztveRs8TgcRD3ExnULbgfOPt2Qpv3KAuH7
	xPOZ6gLy
X-Received: by 2002:a05:622a:1908:b0:501:5180:3c90 with SMTP id
 d75a77b69052e-508e78bc5a4mr10844941cf.15.1772727260703; Thu, 05 Mar 2026
 08:14:20 -0800 (PST)
MIME-Version: 1.0
References: <20260304162222.836152-1-tabba@google.com> <20260304162222.836152-3-tabba@google.com>
 <86ms0m6yzk.wl-maz@kernel.org>
In-Reply-To: <86ms0m6yzk.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 5 Mar 2026 16:13:43 +0000
X-Gm-Features: AaiRm50AKwVyEzy5F_vJgB74LeS4g576zBjIzkwS3u0xl1hmNy8i_O0Mvctk7UE
Message-ID: <CA+EHjTwQP=sXJ=SJE3OqByHKm7Si3S41BfuFO827_ZVwaygC9g@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] KVM: arm64: Fix vma_shift staleness on nested
 hwpoison path
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, yangyicong@hisilicon.com, 
	wangzhou1@hisilicon.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_081423_621692_6F983268 
X-CRM114-Status: GOOD (  24.18  )
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

On Thu, 5 Mar 2026 at 16:08, Marc Zyngier <maz@kernel.org> wrote:
>
> Hi Fuad,
>
> On Wed, 04 Mar 2026 16:22:22 +0000,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > When user_mem_abort() handles a nested stage-2 fault, it truncates
> > vma_pagesize to respect the guest's mapping size. However, the local
> > variable vma_shift is never updated to match this new size.
> >
> > If the underlying host page turns out to be hardware poisoned,
> > kvm_send_hwpoison_signal() is called with the original, larger
> > vma_shift instead of the actual mapping size. This signals incorrect
> > poison boundaries to userspace and breaks hugepage memory poison
> > containment for nested VMs.
> >
> > Update vma_shift to match the truncated vma_pagesize when operating
> > on behalf of a nested hypervisor.
> >
> > Fixes: fd276e71d1e7 ("KVM: arm64: nv: Handle shadow stage 2 page faults")
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  arch/arm64/kvm/mmu.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > index e1d6a4f591a9..b08240e0cab1 100644
> > --- a/arch/arm64/kvm/mmu.c
> > +++ b/arch/arm64/kvm/mmu.c
> > @@ -1751,6 +1751,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> >
> >               force_pte = (max_map_size == PAGE_SIZE);
> >               vma_pagesize = min_t(long, vma_pagesize, max_map_size);
> > +             vma_shift = force_pte ? PAGE_SHIFT : __ffs(vma_pagesize);
>
> If force_pte is set, then we know that max_map_size == PAGE_SIZE. From
> there, vma_pagesize == PAGE_SIZE, since nothing can be smaller.
>
> Is there anything preventing us from having:
>
>                 vma_shift = __ffs(vma_pagesize);
>
> and be done with it?

Nope, nothing prevents that. Even simpler and better.

Would you like me to respin it?

Cheers,
/fuad

> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

