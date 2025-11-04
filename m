Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DA7CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 17:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jb4EiG1cKlRDr3ZrWg4hV76AaJf8Zy383HOlZZBw2Lk=; b=rqB/21+knGh/BaBzq7BzUrgfB6
	okzgkhxrIQH9yy+DBn6yUq1fQJ3kKPGMTWO0Gyl0gqlmhsLa1GLlVNRyqK2b0nK8ntQTBceR4g4fY
	bDoVsV7rzBAAIHS16iYpLYZxS1tOgJX0tzXawTm1csZfSAcfio0dHG+LX7kYnBIjhXBmBTDkeYiYy
	c9fI4zaRpCfjjLkH8nkXOEGZJPqmIYEWBj46m0+WTpudVIg8FMOes2yuJF2P8A348kVVtNqBy6ITN
	2fJBPeWtG2Z7236uFHunx9FeB1nlU3Ac6a7ea7ALnzpn16J+9K4Oas+m8VJueV+ZgAlRfBsMfYDna
	xF84s/DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLHp-0000000CJSd-13yN;
	Tue, 04 Nov 2025 17:57:41 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLHl-0000000CJRF-1LYx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 17:57:40 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4ed6ca52a0bso11831cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 09:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762279056; x=1762883856; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jb4EiG1cKlRDr3ZrWg4hV76AaJf8Zy383HOlZZBw2Lk=;
        b=1/9bYGJtj8VesL/VHpFLzgJGUGo37BBc+bVXDGorrly4/7t6b8Fz92aDv0Yl6INaO0
         uVLcx625PEzvMmgQZJ6UzfEDpQI+5yzHsgp1TdcmlsnUwuPR8eNKQuwgnf19S/zTikcr
         ey+0Hol3vYoX2zXt+jUh+LHH6HGF2JzALHO3/+ilppXvhnXVyRzHWgsvC02w784Biw/W
         IwQlzVd45Ok5pYq31fN9M9EXp9SiMt9XmPr2TzjCQjvkEDHTCZLDdJm1ezFwTs0Dg8+A
         2JJ/U4lgCIb2YRCrGZ4kYy5KWd6YD1vN9shxviMB+Sat96Yk3JFeIhWXNHhYaCIgxu2Y
         sDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279056; x=1762883856;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jb4EiG1cKlRDr3ZrWg4hV76AaJf8Zy383HOlZZBw2Lk=;
        b=m7vNzlh813tJc2J1HyJxXitkON5i6jzMsRUJl99owMOrZfc0GUfVnmr5ydp5AFKxlE
         TGKKY0LSj+02o4ZJd7cD49T1ixxhxUfmNae/lL4rh+6ohwCcfKkRCoyR6mcOCZxG+OYT
         oH8KGwEYqOKc8iDmAUYuK7819PsiH5UlKW4EgiY0zlEKFfdVFEGhTrd2RzueyaVf6DTA
         gRnwJpk5a1AkSl+1aanVU6qT7WmC58t8WZTYssEdVxubfm4sOiA0xlpJNGTJwbh7c30r
         9tpmETk+7aNlDpR4mFkoqdDce8xp0MJnkO/i4/TUUiEHSnMVjCAB6XOih1tAj5Iawb9q
         6jXw==
X-Forwarded-Encrypted: i=1; AJvYcCX9Vfa+6ZwrgPcr/rKcFX3fmO6oMHoQdu7FKsOZ77jRvuytvHhzOA5vgbHeDCLFWBBl3OydgKjdNttOxYjeMXV9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+jjqyMS8QWyfb+OcL1i0W56xlkKlcj/fv9lqX9RaoIypiY73k
	2wWE8gt2AlO4a0BLjFLtSb4j2hN1JutgH9T0XamGMln/lRuXjv574uToHcm3CM5eXM7ERVAemSt
	rVxRh+Cwsr44f4OkYeNGcT+b5G7jYvnlwcBb1WIZD
X-Gm-Gg: ASbGncvkkt+AJMb3AvpmW+Dx+Pnu4edx/BVZ1dtwujADKy8C1fQOSAfWrKl7+U8S2Al
	NsgwQyyyZFK2UpeJ4nLL6hmSiqFHK5/49Ur8kdb1ojlLvOTgFYdqKZFKRXJPbjr/vzmIsf9s5Dm
	N7pdg2aKCQWtbWFEV44/ejdPNV/KAGw2KAEuSvjc0vBATfRV504A5ri/VrQEb7r6inGTHqSUqeY
	I4BvPRfxu3Z0BgjYpedgsBYCXKDH0SbHyQKStudWZ9egcaFfLN3MlqCUf7Nqw==
X-Google-Smtp-Source: AGHT+IG0VJh2q9I6lpulhETeYqGjsEZHYw4x4EcIq2IDc3ASKPP8Z/KUgikANjcaHrTbKg5xgVZq38OQMSkaxmAXg7k=
X-Received: by 2002:ac8:5e51:0:b0:4e8:b04a:82e3 with SMTP id
 d75a77b69052e-4ed61bf9464mr7281931cf.10.1762279055815; Tue, 04 Nov 2025
 09:57:35 -0800 (PST)
MIME-Version: 1.0
References: <20251104125906.1919426-1-tabba@google.com> <20251104125906.1919426-6-tabba@google.com>
 <a0b19558-dbcb-4231-b0c4-302cc10652db@arm.com>
In-Reply-To: <a0b19558-dbcb-4231-b0c4-302cc10652db@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 4 Nov 2025 17:56:59 +0000
X-Gm-Features: AWmQ_bnag7lXsJ9mn0GfG63SyUcw-QZVD7to_jR_Go2OWvRrYrrbE7F4qdFrXGA
Message-ID: <CA+EHjTwPqm5wkmdGK60sn+S9BizK6LG5bSqWQLigsZVgXoJmUw@mail.gmail.com>
Subject: Re: [PATCH v1 5/8] KVM: arm64: Fix Trace Buffer trap polarity for
 protected VMs
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, joey.gouly@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, vladimir.murzin@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_095737_367035_E11D373F 
X-CRM114-Status: GOOD (  21.79  )
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

Hi Suzuki,

On Tue, 4 Nov 2025 at 17:50, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> On 04/11/2025 12:59, Fuad Tabba wrote:
> > The E2TB bits in MDCR_EL2 control trapping of Trace Buffer system
> > register accesses. These accesses are trapped to EL2 when the bits are
> > clear.
> >
> > The trap initialization logic for protected VMs in pvm_init_traps_mdcr()
> > had the polarity inverted. When a guest did not support the ExtTrcBuff
> > feature, the code was setting E2TB. This incorrectly disabled the trap,
> > potentially allowing a protected guest to access registers for a feature
> > it was not given.
> >
> > Fix this by inverting the operation.
> >
> > Fixes: f50758260bff ("KVM: arm64: Group setting traps for protected VMs by control register")
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >   arch/arm64/kvm/hyp/nvhe/pkvm.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > index 43bde061b65d..df0c59a29b35 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > @@ -118,7 +118,7 @@ static void pvm_init_traps_mdcr(struct kvm_vcpu *vcpu)
> >               val |= MDCR_EL2_TTRF;
> >
> >       if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, ExtTrcBuff, IMP))
>
> Why are we checkin ExtTrcBuff ? Shouldn't that be TraceBuffer ?

This is an existing bug that needs to be fixed. Thank for spotting it.

> > -             val |= MDCR_EL2_E2TB_MASK;
> > +             val &= ~MDCR_EL2_E2TB_MASK;
> This looks correct to me.

I don't thin it's correct. E2TB traps when clear, not set:
https://developer.arm.com/documentation/ddi0601/2025-09/AArch64-Registers/MDCR-EL2--Monitor-Debug-Configuration-Register--EL2-

> Suzuki
>
> >
> >       /* Trap Debug Communications Channel registers */
> >       if (!kvm_has_feat(kvm, ID_AA64MMFR0_EL1, FGT, IMP))
>
>

