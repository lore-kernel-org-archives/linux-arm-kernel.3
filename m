Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 679EEE77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 13:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=271uW+1xPv7CJCNe7w9FZ47bv8k49aJ9mD3ELi0uLgg=; b=Xy2jm8HCUmitvTDrJvNTFUgYRj
	/K5sZgxz+sGUpWvlv3+rTpOBT3Q2VNjLbaiEqXUIuBAR6fHyaEDzifsK8WDfTq3Dx4QRnfJxW4QRY
	tEzNjHp3YY5Dbk3WVcOjkwYZdtrnwEfBurglNQfD7uACnha2WQx2P0rcnbSZI7CbYZbxXCmlu8LVZ
	D7hArF5BV2BsIfhl8sJfkfCsC0MP6MkNGfpA0HSYuAp1JSkUjQXhEbrAmI01chQ8va6As2W2Z7HGZ
	XNLnRKR7t2g75JswcPbhLDvlH4q+LggesWmpcePwBz5ovmUbXs0IMi7xlPpedpJifnHyfybABFrrn
	8e7SFQdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLMMs-0000000Ev2V-3nyL;
	Wed, 11 Dec 2024 13:03:06 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLMCk-0000000EtGB-3YrN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 12:52:40 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4361d5730caso36235e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 04:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733921557; x=1734526357; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=271uW+1xPv7CJCNe7w9FZ47bv8k49aJ9mD3ELi0uLgg=;
        b=ekD4qOOe/jH39ShGjCX1NsYixmXHql1X9TA0y+BVB+u11njBECACXioq3TAY/F1GkC
         8fpmP4fubK6voOMFGQU2qizCb9peeGrf+jkCAEfSbGvCSB6duzeofRu3tEXmqSQyx7Gn
         qpLKQxKcRlR7Fng6rsgSt0XVIlTLmIpMI/LDj6YA9rlNC6nf0thQYAzrxu8cqKGAuDVU
         5lBhj7tLSz3CS4c0HMS1V+fkslJ76A/68qNtYu24qumJgro2zp7Yw5zggOcAwVm6bO8O
         02Iu2p06HkXA2LsPi8//TmKdqXa4qhQbmkai/i9T5m+1dNrptdXP8PLB5KGFK/VNNKUP
         vFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733921557; x=1734526357;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=271uW+1xPv7CJCNe7w9FZ47bv8k49aJ9mD3ELi0uLgg=;
        b=sZC+JuJBxNdQnVpvQwS7Kfi/eF8UManfRqvg9mgxtHaWGOHfnlhlv6iGSqVVqU43bO
         +gqPRc/EhbcZmT14X7ilxX7BKJogLSDkFhZCBwAY7f6zY4Ngz5HAmgmkd4zgHIJmUqFn
         EB9cwUJxIaZQ7j7W1mQ1WDSKvgWuATU5P4zJviQtQEsTMfoO7/8jYRls3/Jj78LwLI2S
         mo+pH4Z/yhaonUJAQQdpwWnwiqSqgaQhl/K6DNexjDm7a3ENd0De6/HvRNy7XcMDEUuX
         wiGzR+Nk/nzAU+PPr+2zN8Xni6gMBr+Jz6C8VAOYj85nUYokTrcoROOgMDVdw0HAxFLd
         zJMg==
X-Forwarded-Encrypted: i=1; AJvYcCUFsRubsNn4VRvl+6iPQ4CcQkfiKGOHc+TJnA+7HWSCtmQRFtl7bZD6D0onH7ZjwxpN8mFrkbpqt2B14l5MpdjF@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1CbjeZOEeM/U/FgCA2HM/rD6JGLcKTBRXPQSaO2cMq5DVozxu
	lprgQPbUOMwA4R0SFfBMW3XHWRm0Tah94N8B/MZ+L4wHLvkludmFlEHGcARVfhaK4L+rNb+ADI4
	MeBusL/JbFsJ/Si2lYihsyl00SMnXNZnEEOq0
X-Gm-Gg: ASbGncs9gcfmATsyxIMqoYAW0vwBJlDSJaWsECNffa/1xzOh8WkwTXcKfiAlHqQSH3+
	RCgi3e2yVmhxBkSjWrnh5fEM3SGCsU/rIoE7gq/syeExJekpx9ykn8bk6K9bfl9xw
X-Google-Smtp-Source: AGHT+IEJ5Z7J4T0pbtdb1XaT/LEsMpdnN+BaxN1Eg8jcKGqq6J6SI3/cA/Q4epYOeBKzFi9FCsCU+huAtx1SIzewIrk=
X-Received: by 2002:a05:600c:2105:b0:434:9fac:3408 with SMTP id
 5b1f17b1804b1-4361c0f4f80mr1201685e9.2.1733921557222; Wed, 11 Dec 2024
 04:52:37 -0800 (PST)
MIME-Version: 1.0
References: <20241202154742.3611749-1-tabba@google.com> <20241202154742.3611749-10-tabba@google.com>
 <Z1mHtVJ4f7_N_wk4@google.com>
In-Reply-To: <Z1mHtVJ4f7_N_wk4@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 11 Dec 2024 12:52:00 +0000
Message-ID: <CA+EHjTy=zpDx6OhcQFAk7uxcqQmsVUgB=DuZUppszr0KVPGZhA@mail.gmail.com>
Subject: Re: [PATCH v4 09/14] KVM: arm64: Remove redundant setting of HCR_EL2
 trap bit
To: Quentin Perret <qperret@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	kristina.martsenko@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_045238_902181_25532AD5 
X-CRM114-Status: GOOD (  18.60  )
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

On Wed, 11 Dec 2024 at 12:38, Quentin Perret <qperret@google.com> wrote:
>
> On Monday 02 Dec 2024 at 15:47:36 (+0000), Fuad Tabba wrote:
> > In hVHE mode, HCR_E2H should be set for both protected and
> > non-protected VMs. Since commit 23c9d58cb458 ("KVM: arm64: Fix
>
> I'm not finding that sha upstream, in which branch is it?

The whole commit is wrong, not just the hash, which refers to
something I have locally. It should be
b56680de9c64 ("KVM: arm64: Initialize trap register values in hyp in pKVM")

I'll fix on the respin. Thanks!
/fuad


> > initializing traps in protected mode"), this has been fixed, and
> > the setting of the flag here is redundant.
> >
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/pkvm.c | 3 ---
> >  1 file changed, 3 deletions(-)
> >
> > diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > index ffa500b500f2..cede527a59d4 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > @@ -57,9 +57,6 @@ static void pvm_init_traps_hcr(struct kvm_vcpu *vcpu)
> >       /* No support for AArch32. */
> >       val |= HCR_RW;
> >
> > -     if (has_hvhe())
> > -             val |= HCR_E2H;
> > -
> >       /*
> >        * Always trap:
> >        * - Feature id registers: to control features exposed to guests
> > --
> > 2.47.0.338.g60cca15819-goog
> >

