Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA306CD98F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 07:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LzUKH8rq66N3fIAi1izpkeP64WOVv5qL/rYygNemrhk=; b=VEmfY4Obt6hlNmmA7LJ8j8W0kQ
	4tIaj4BxFFIwDoXc8uo6PWN1TLrZ4awPDAB2JZrK6/e/nok771wL2Tlhcp8A+HAEVMN4yoP0FA7Op
	dxuHDAVmBayJAbWNJWL2kzdsS4ZsxXLAMYQ3oLnWN5U0zqWF/9RtBCd0vV/mZdUHP6AQ8qHIBVD1d
	I6moKiKdp16MDgsy7eGf/1AIocSX7nu4vfyTc0OJts//4826MzBms37t5KHCe7cde5zv7AEyDDOYe
	tjzzQ0yNtoIXtVTFkiSGxu/HFbiHvKbHDOpbNqQBZPrOdH3vmQtlRjCa3YDJ6X0qJF4OX2cFAYJj0
	Vh3IBfnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTJu-000000025Cm-1ijD;
	Fri, 19 Jun 2026 07:07:18 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTJr-000000025CM-0fn5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 07:07:16 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-51765531803so181521cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 00:07:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781852834; cv=none;
        d=google.com; s=arc-20260327;
        b=nwLVZNRU96RIKMfXRwO21LZqgZB2xICobGsmv/oKAyRlfI8inHiv9DyMuqvsop/EzU
         OQRIiv0o/WhIoIKW4GypeXS7p1AYXnk+vhSpcZNxd8UXtbk7uCZ+BuMAaUONeSucLypR
         5dXmZ8gxDLYWu3LuJctb9HgeS0nwl+oqdQ6Ss2kkVh5nRcqGJ3h4YOnMssh/OrqZnHp3
         VCaBHpVwKnZ1W+j25bFLvrIQ8w/3bpaI6CrDnltIKlzNZ2fyb86gdjeUiUsvEzNEyKxQ
         KRMDp5JGX5MYFJ6P4kbsrvYfBguIZ3p7WZNIAYiAurkN2D6f+2NaPPX/kn8/x4Mu0wQO
         6SQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LzUKH8rq66N3fIAi1izpkeP64WOVv5qL/rYygNemrhk=;
        fh=+iDEkkAHaweVzBpiYVki8JndYPh7488qMWfWrIBnRgs=;
        b=hkVmeAc1wecAJ5ykyVyzjmiZflt6hF1vJvTXC1mXN1xsc4TjRXf1cU28J7U8N01jm3
         hCXMW9v3sadA6aPaKwUj28b4CyCl/XDEKSu0lX9vhqtkRXiBS/UyoeGRFp3DcmcGsdfM
         yuGFn86OUDw7/P4kwRdvJWODOu5Z46+TDL+HjcI6/CvBWXjxfJ/bmnDzUTSTtsTxx1lE
         gHwNWW5+5yIgEC6TdM1TZVZQ7vMtmpqnGY4Rew+iaQq+R6NWYxBWh1lEgG/o2QcCMwlV
         9x+R//Wh8rE+jKQJH+iNwwmqjrAWMzT3nnLFUACWM6BTLZZEpSBkK9IcrQwXYKdX63zU
         hXTg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781852834; x=1782457634; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LzUKH8rq66N3fIAi1izpkeP64WOVv5qL/rYygNemrhk=;
        b=Oeh78qhD4NUatW1kqCTUj82K7P56z/Hmp9j8PaUOAsUs9ehmGmcYx+3VXaX100TA8/
         awNOKiEMrAVg1ko/x9S2Eyj1oT7Lz40mq/wxfrwbHKYGCqM8svBIr9PSlmRiDaYxSbTM
         BuSelIToJJ/5mlM4CXcU8Kst2spPRQUv8sd+ORkeYikQwIZRdZmFQkZcq1NnjBM0lCy6
         vwNqTH2e5CLNn7hK1zpUuF//w1uFW/SN4b/Dkup5YN4BqpJld2Jb9IfwGNTwioUEMjVT
         phwZ/nt04Z/XS6Ihx+Pyixv5mjlC1qm8gZ7R4Vqq724GCPKQ7cWHLp1BuuoILnVWuf57
         yd4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781852834; x=1782457634;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LzUKH8rq66N3fIAi1izpkeP64WOVv5qL/rYygNemrhk=;
        b=rNrtj4HumQMnluokra6Pla0+3ZHCH7CwL8G4iiEIDrc0PAIDriqAYBvVgK4f01fnuU
         BybQiHHGMdqOR7kGoWecQIgYbclhjWz/mdAkgkpmfwwk/g2hRku6Qjh///Zi3kHTLQLr
         dAQ0/iCdtNSicnRWqn+ikx7zH7WDhRaL1hK6aN3N17UpnnT6PTmiU7+669YZY6fmG/Zp
         PHuN7tqkGaZYSm9l2o1HYhH/yikmP2FDUCRxXHBSsOmRWksu+jYIjThwzRI7Ky1haWPo
         wXKJF//Mn0d4beQK5SV6SZY/M6MqeBhmDAz97q8gMu1RkPBbnBTrsLXTSUBCDwtdpr1V
         p+rg==
X-Forwarded-Encrypted: i=1; AFNElJ/hvGlE3jm7fnAgs1CAuaz+jwIfOvKBpY7cOMM1iMO2OuCwCT770OyZFdIvDkqg8xVHfRY4yU38NWrSJVCY8tfy@lists.infradead.org
X-Gm-Message-State: AOJu0YwFOMObDeJ9bw9/ngreAB5iZl1dd10p5WJ2sv/38ZPlGirjLheu
	LSwWn7BSxOoqN9kNjhWbC9ISYvY55hInGMdVhrdw0iWaxxMr1BsLOKQlQAald0u5Ro+YuP1EB/m
	9J/tGVmwBCH14/UemgVK771zUtELJ8E522YPsWf6J
X-Gm-Gg: AfdE7ckzIpsLHPev8WG+kDFHmxRJBGwYy4fDdcOqSJTLhdCdAjuyuJe7zfMnW5WZc93
	Tnq5mXQEAvzpqtxcBSbRLgVhv5TU5rQbYAE9i+Iw+qpvh5ZIy9bdzO8jWafR9opxHvaj286VO6r
	ntRJG+iEXWLaKqpdrrt7DQ11BSRofZRm45Km4OPKZrhkrUMZoF+JcjnO2FY6f0eZKQiAE409D0l
	kOscsaLEQ6qy0ORA/VbN4QDAtSX77FHEN32gOSJGBSgBeeFUTAywV2wYQmmLYkzwQcpEdqZTA==
X-Received: by 2002:a05:622a:1489:b0:517:64f6:3365 with SMTP id
 d75a77b69052e-519e4890222mr5681461cf.4.1781852833077; Fri, 19 Jun 2026
 00:07:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260619070508.802802-1-tabba@google.com>
In-Reply-To: <20260619070508.802802-1-tabba@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 19 Jun 2026 08:06:35 +0100
X-Gm-Features: AVVi8CeXp_p1Rqi9txVHuQ7hE90Ut0nVzENFoD1JZ4teV0I6ZIJ5UtHh1eaJZv4
Message-ID: <CA+EHjTy6CJcg7sM+6Tz6KZe070HVZm-cANPFQ0YkQg6_uLWX-A@mail.gmail.com>
Subject: Re: [PATCH 0/8] KVM: arm64: Rework pKVM vCPU state synchronisation
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Quentin Perret <qperret@google.com>, 
	Sebastian Ene <sebastianene@google.com>, Hyunwoo Kim <imv4bel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_000715_231616_8F4F5604 
X-CRM114-Status: GOOD (  21.61  )
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

Sorry, as the emails were being sent, I realized I forgot the V2 in
the subject. Resending now. Sorry for the noise.

Cheers,
/fuad

On Fri, 19 Jun 2026 at 08:05, Fuad Tabba <tabba@google.com> wrote:
>
> Hi folks,
>
> Changes since v1 [2]:
>   - Dropped the guard()/scoped_guard() conversion patches: standalone churn
>     on code this series does not otherwise rework. (Marc)
>   - Rebased onto kvmarm/next. The VGIC flush primitive now bounds used_lrs
>     using the cached hyp_gicv3_nr_lr instead of reading ICH_VTR_EL2 on every
>     entry. (Marc)
>   - Grouped the PKVM_HOST_STATE_DIRTY flag with the other iflags and
>     clarified its comment. (Marc)
>   - Sync PSTATE alongside PC on every non-protected exit, and sync+dirty
>     before host-side SError injection so the syndrome is not dropped. (sashiko)
>   - Various cleanups and tidying up. (Vincent)
>
> Building on Will's pKVM infrastructure series [1], this series reworks
> how pKVM moves vCPU state between the host and EL2, and stops copying a
> non-protected guest's state on every world switch.
>
> EL2 gains proper primitives for the state it transfers: vCPU lookup
> helpers, and VGIC flush/sync that reduces how much host state EL2
> dereferences. The series also moves some preparatory code (such as sys
> reg access and PSCI helpers) to shared headers and HYP, and implements
> lazy copying of a non-protected guest's register state back to the host
> until the host actually needs it, instead of on every exit.
>
> This is the first of two series moving pKVM vCPU state management to
> EL2. The follow-up completes the job for protected VMs: state
> isolation, PSCI handling at EL2, and the resulting API behaviour.
>
> The series is structured as follows:
>
>   01-04:  Preparatory refactoring (MPIDR, sys reg access, vCPU reset, PSCI
>           helpers) to shared headers and HYP.
>   05:     Host and hypervisor vCPU lookup primitives.
>   06-07:  VGIC: reduce EL2's exposure to host state, add flush/sync primitives.
>   08:     Lazy state sync for non-protected guests.
>
> Based on kvmarm/next.
>
> [1] https://lore.kernel.org/all/20260105154939.11041-1-will@kernel.org/
> [2] https://lore.kernel.org/all/20260612065925.755562-1-tabba@google.com/
>
> Cheers,
> /fuad
>
> Fuad Tabba (5):
>   KVM: arm64: Extract MPIDR computation into a shared header
>   KVM: arm64: Make vcpu_{read,write}_sys_reg available to HYP code
>   KVM: arm64: Factor out reusable vCPU reset helpers
>   KVM: arm64: Move PSCI helper functions to a shared header
>   KVM: arm64: Implement lazy vCPU state sync for non-protected guests
>
> Marc Zyngier (3):
>   KVM: arm64: Add host and hypervisor vCPU lookup primitives
>   KVM: arm64: Minimise EL2's exposure of host VGIC state during world
>     switch
>   KVM: arm64: Add primitives to flush/sync the VGIC state at EL2
>
>  arch/arm64/include/asm/kvm_arm.h     |  12 ++
>  arch/arm64/include/asm/kvm_asm.h     |   1 +
>  arch/arm64/include/asm/kvm_emulate.h |  79 +++++++-
>  arch/arm64/include/asm/kvm_host.h    |   2 +
>  arch/arm64/kvm/arm.c                 |   7 +
>  arch/arm64/kvm/handle_exit.c         |  30 ++++
>  arch/arm64/kvm/hyp/exception.c       |  34 +---
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c   | 258 +++++++++++++++++++++++----
>  arch/arm64/kvm/psci.c                |  30 +---
>  arch/arm64/kvm/reset.c               |  60 +------
>  arch/arm64/kvm/sys_regs.c            |  14 +-
>  arch/arm64/kvm/sys_regs.h            |  19 ++
>  include/kvm/arm_psci.h               |  27 +++
>  13 files changed, 410 insertions(+), 163 deletions(-)
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>

