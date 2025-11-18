Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A10C8CED279
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 10:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A3fuFPmq7u+4TfWmna4IMO/rExqShukKvoJZ1nxd6fI=; b=YZZI5qIOOjc4bKs9/ZNNO5kIIt
	he317dNXYi2mJQwAn8JfCCDa3AxJnLHLA+9ej1bwzGiTLpl+nNvrW+0FWIxfIWhiOYTg3Ss42hPjP
	kc4aXh690PMcsEp44UzRy0jLDMFOSE2Ks52zsbDPA38Xdej6rVISPZ/zSFvTYc7LZSKnTlf0I9cfJ
	q13qgiUabk6E+hJoOaK5llnZMCpguny0deIU48zWxcX8qVkVMn4vyN0LSbBuuUWMjVc1FkDs3i5A5
	6USfL/lFW5aEIQuFZHsEhNC7DH7S6xurFAICqbuXegb0YMoLPbxjcBMOxRcvcdi8gkWKyMOEjQqED
	v4Kvp0WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJ7i-00000000GdW-1waD;
	Tue, 18 Nov 2025 10:39:46 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJ7f-00000000Gcg-3nKg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 10:39:45 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-4edb8d6e98aso311071cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 02:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763462382; x=1764067182; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A3fuFPmq7u+4TfWmna4IMO/rExqShukKvoJZ1nxd6fI=;
        b=rwK8WihzcZNoIsEYdQ6Rm/mIdT7amuP9HbQNuN2JAEQVWz8mkSvxQHsHZqnYCSAFoi
         XQCqDLx6PPh/WDojw71PK/824lfdoFoaV4LpJP+FjIcQuaTpJB273hE7U/R+xuJ9CVOi
         dX736OpNNHHoBVzb3CrJSpT6ENaltj983Ynd4CEljKOKy7pxhplvQN1FQ6ddtAxg2N10
         jUy4hcn5vsLHAgoBqLnAR6zfHXIlVOcy9uNnFGZtdC9yezWHTGQg+XdUgxev4ccHJl/n
         N0DjEPVIQSIj0sqcEkZEQNPi2DZLKk3inY9KR1VeMulCZuv6xPi7tMjJb04yxkdYFGAc
         Eh1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763462382; x=1764067182;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A3fuFPmq7u+4TfWmna4IMO/rExqShukKvoJZ1nxd6fI=;
        b=U7CLtUf0v3b5H4FTQg2k7GENkq2ji9f3zoBxwnlm57CsakohXPND+uR+gctBSloucR
         /jLHRnB9XsX2IykPblAGM3yzujVs/uypuQEAN4WJoU6YpcjG2EeuIdKeqIC5JruuuyLN
         VzThYW9CsFWshanbg8SXSEGIOdP0a1o1goe7xD5LSOByhzuxWXbkHCr9SaHGj+nCl97P
         HPvZVYJNxDXOoCdidkqlY2h6b3jyaSay0KDnWGnCQ6dU0Sst33M3d0owwZP30BeGfq2g
         OAs387MnfzAYGM/wl7B2eLiWY6iIfpS8gJUSysf4qCXnm6Yznemq522ZENkthnSEpPbW
         T67w==
X-Forwarded-Encrypted: i=1; AJvYcCUTc2KYE6e0r6KcCWRli7DkPLwdkbCMjt7yFVPaiHir1xHHOUsoQLt69fp4BruUTIhbUzCk79e39iDBrb/r/7aO@lists.infradead.org
X-Gm-Message-State: AOJu0YxNRPXQ5W0VvGC/Cv7TfiHs4uPdQO7aPQhFuoeRpa2GMFc3qEYg
	MPDfbsDjTKgBvj0trFbMLddL3mjGFZAENlMdXBmTYM/pM78ypd8besz2iIjGcbhw97ZZg7OmZHY
	M0LB1qexg8b9D4Lfhr8JfcWzk6RCR5LNFgArUyrLh
X-Gm-Gg: ASbGncsUKHR8tNiGe4BuwS+jtJVg6We1ZAwbPNsCq1tYrpguemAZ85Kfu9c9B1XYkoB
	DluQQx6jqdcHVmi0dikArFntldwGJNgPV8JR3XiEOaT9IurYitqkQRD2j9ugAR7pKfLlsjyXGnu
	dCP9OUvwK2wT6qFNEybJsTCsAzHndPVkCtyk87Kcy7ZJpgxa/i/6zsqTvX7gH4h/UcisOmR7QcO
	6wM8v2/0CFZB1zJTfD21TH2SWm2HeltA/blnrJZiFeph4r+AH+8ZUQ9BkPX4QdqoywnLBspTDG/
	znRo0H1nc6k8TAc/nuiZzveCYlk/jvT7RMk=
X-Google-Smtp-Source: AGHT+IF7R3581QqoxLfrWmpw9+FLNMOBldbaqa1DkyFXRRv3ZqD8SWk+0oLgf3+nvFRitSGahBgPq/81NnTTID7GzXw=
X-Received: by 2002:ac8:7254:0:b0:4b3:7533:c1dd with SMTP id
 d75a77b69052e-4ee3a8f3a62mr327971cf.1.1763462381839; Tue, 18 Nov 2025
 02:39:41 -0800 (PST)
MIME-Version: 1.0
References: <20251118103807.707500-1-tabba@google.com>
In-Reply-To: <20251118103807.707500-1-tabba@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 18 Nov 2025 10:39:05 +0000
X-Gm-Features: AWmQ_bkg3Pxo8Nt-K_kohdqRusQj83AOJuZTIGZVKLHFt3_L0-eui3763G3uKAs
Message-ID: <CA+EHjTz0tUL9Q0d2tS9D_w=csuz+7t5KVfvfr-4WRjmeTf+3=A@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] KVM: arm64: Fixes for guest CPU feature trapping
 and enabling
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_023943_952484_A8DC3DB2 
X-CRM114-Status: GOOD (  14.59  )
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

On Tue, 18 Nov 2025 at 10:38, Fuad Tabba <tabba@google.com> wrote:
>
> Hi,
>
> This series contains several fixes for guest feature trapping and
> enabling, as well as a bit of tidying up.
>
> Changes from v3 [1]:

This should be
Changes from v4 [1]:
[1] https://lore.kernel.org/all/20251112092051.1376245-1-tabba@google.com/

Cheers,
/fuad

> - Add a map of KVM capabilities to IOCTLs (Oliver)
> - Based on Linux 6.18-rc6
>
> Cheers,
> /fuad
>
> [1] https://lore.kernel.org/all/20251110134525.3768197-1-tabba@google.com/
>
> Fuad Tabba (9):
>   KVM: arm64: Fix Trace Buffer trapping for protected VMs
>   KVM: arm64: Fix Trace Buffer trap polarity for protected VMs
>   KVM: arm64: Fix MTE flag initialization for protected VMs
>   KVM: arm64: Introduce helper to calculate fault IPA offset
>   KVM: arm64: Include VM type when checking VM capabilities in pKVM
>   KVM: arm64: Do not allow KVM_CAP_ARM_MTE for any guest in pKVM
>   KVM: arm64: Track KVM IOCTLs and their associated KVM caps
>   KVM: arm64: Check whether a VM IOCTL is allowed in pKVM
>   KVM: arm64: Prevent host from managing timer offsets for protected VMs
>
>  arch/arm64/include/asm/kvm_arm.h         |  2 ++
>  arch/arm64/include/asm/kvm_host.h        | 42 ++++++++++++++++++++++++
>  arch/arm64/include/asm/kvm_pkvm.h        | 33 ++++++++++++++++---
>  arch/arm64/kvm/arch_timer.c              | 18 +++++++---
>  arch/arm64/kvm/arm.c                     |  7 ++--
>  arch/arm64/kvm/hyp/nvhe/pkvm.c           | 18 +++++-----
>  arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c |  2 +-
>  arch/arm64/kvm/inject_fault.c            |  2 +-
>  arch/arm64/kvm/mmu.c                     |  4 +--
>  include/uapi/linux/kvm.h                 |  1 +
>  10 files changed, 105 insertions(+), 24 deletions(-)
>
>
> base-commit: 6a23ae0a96a600d1d12557add110e0bb6e32730c
> --
> 2.52.0.rc1.455.g30608eb744-goog
>

