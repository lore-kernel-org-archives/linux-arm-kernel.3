Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC30C982D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 13:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yvMJselGvAoMrhysUaGitx662yndDSgH+0mQM9lz22E=; b=oenWtxCCcph8yati7U5VuvAv81
	y1JMwpx5H4Utce0NnxtXRPlXyimeaz3joQcknZ5ZJWKjan1sk1c9g+w1H3eCJkCxbhv9IRF3CL/xS
	PbekwhWmykKSaw9AO/bpRBcuimWeqhDkYjt8LU3y60bCSiBhQ4gBuB8zxrYRmikUfOxa331Tk6Dqk
	I5vsAKsErZZwm5AV+b5uwABW8ZuML3nLuIMjeNJIzMIUFc9WskODp2ntwtFv6XtfGAfpM9v1H0dJk
	ty5W9k4MlsVwHkG+G2J843MS8X8kINsN/83KqrGPb7VWFntBALBIAR1FVoa+lQCaaXgUC/2YBUwbs
	sdBJnR4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7BzS-0000000BNrN-2Ikq;
	Thu, 17 Sep 2026 13:17:26 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7BzP-0000000BNqg-3YPA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 13:17:25 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5b7658501ccso1869e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 06:17:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789651042; cv=none;
        d=google.com; s=arc-20260327;
        b=Ez3HIlHgNNqSEcLZjTBZWYgQvVrfsWDRmZwDvCMLIlcUYjNVvLMShA/niW6qxB9Ung
         2KigULoBoQ46I2Z36+3PAyYeknzxay/6S8DFaevQwFdAARiX1EpdgJ60iZCyLrHvY/CT
         qjJlaeX31ZyHtCCFpO/cWV5qePuDfRLKvClajfExM/JDRXpTVigY5/atGjj8Y1XhnE0r
         m+82rI5qK2dwSIfgbgev7wt3yBn9IIhEmFOQAfZTBbbL5hxsGydyQS6dLH9fxAx59jq1
         W7ApQUw1I0fsJyLdsW93waujQppkGWALqfYAOKoYlgangDq+eDmiSyjXNdwRcJLvvRH7
         YL/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yvMJselGvAoMrhysUaGitx662yndDSgH+0mQM9lz22E=;
        fh=WhOwmDiyTSSc6zs1SmB/8k3ipHV9bc6GYG1tz/cYVb0=;
        b=QDaXqEsPE17HCPzKk2YHeUMGZ4QO68/e2x0PT4V/P6RKziWX/e2lPy8zVAa0h937/o
         naU0UC7lLCCwS6P3i60gy6Ee40sqqYSjAsMlIsAnCI6ZTYsxHIBYgHn60D2UyaUNsMWx
         4VrT0s9+A/t6gvoj8shfRAUkXnY37q4NBD1scUGxGo4PGnii5spX9IQhd21q9CNc2M8n
         DjbF7P/9n6u/Jlk6dDKR6X5rlrK1Rz5gmEou+peVyeDnCUwjlyl4PerMKCZTA4zKebIN
         Hio6zS2Om5YN/M8OcIjVYf+IwYFGBBqLJ1rXep7T9u14kzb+pxZF7tgq1XQBIaf8qPMd
         ZBXw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789651042; x=1790255842; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yvMJselGvAoMrhysUaGitx662yndDSgH+0mQM9lz22E=;
        b=KnaiPw/5tOn7+F0KPeFa+vuATKglKtZUUjSLWj7nK+cNJZXl/PZIDRjOMa9jil7PVe
         eHDLNhU/lQ05WO0+sLopi/NLJA7ukDO7x4g9pNO3/JiD9BXb/1e3u5VD6WlneFwFWQLY
         BRVc7m2hE/1ic7NhVc6nfAOOVMVnnlAumOJoX3NVWhq1uu4UVi96gfzlNnw2bUiRmcQb
         1jDgLfFp9LJvoe8trtVS9cYaW5m+teh5fR8wkFAec8TqUENoZEPCRNXo7jFZwrEvSOTu
         ZwFFIwxivndOD8yXvVBtEVrtxQ1ItC0b497DQUFjQieAVxFogDyL8gxYptNDoGgB/yfA
         /H/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789651042; x=1790255842;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yvMJselGvAoMrhysUaGitx662yndDSgH+0mQM9lz22E=;
        b=pfX5JKjDVFhrIr0V3Lpq4WuM5+qCSJ8SbAXrt+i6mXwpxZFtY5RdRAlLGlyoV1jYW+
         u5V1N+27kPVsNV0EAX3L1gQTlS/wd3ifNjh9ZL0UkFUgRuxyjBh+AxJU9kDVaXYWTUAE
         3gLYsx2b/FS9VOwfcVjtCh0BTc0oK1G1mS1TEc4/eSm3EGmOazKh8RLd3Vwlz4W9FNKy
         fVj4+Ff4ATNfCvUWZIRoe3Dh3jrqMvMxtm+qpr3NDVcX3JQdIm9QtiUAz3mjuorVdKfb
         p6LbXXOvEtUdkuNv7O1pqlGvDT1zBK01XNO9dIVgSahjDmDMy3ATc3NQyLceyRVpIAQq
         qkiA==
X-Forwarded-Encrypted: i=1; AKwUvBxB5aMf98CaV04bL6+w6sJGGQJGgM9jnPoEcy7uoMjzzcKhZfEuvI+bSYiGIowQlMahNMjmG4J9x2KmRZV74pKV@lists.infradead.org
X-Gm-Message-State: AFuF++lPwEy1dKzyLHfP2RAGKTJI143YSLyjymIMLDeBvcOrMV7wfsZL
	VfTvG5LFKWX7gJilAJE6ieKVnQSthnB9yNEBe56s5mAUIS+5/5O1ZdReQoCsSLzOqpWAk/AVAL+
	UsxGlZ8eYmVYDymNNoNS6jNz13IZ6I+SUeh/3UYP3
X-Gm-Gg: AYBFou2b0vcWDCx6ycFLAZmO5JAOPeXES1KQqZQMdJjxNYEBbUBvWQidI8XaFZ+wIik
	VVrhsDCYYte0G/oP7IKzwZKJ18hSRJ58davWFw+W7uoJ/bgroU/Y3T07J07xob/SpIc96ygmQI7
	m8cdQgs+B06qeSBw4Goheb3WD/5xqATHwW84sG4E+0dt3hnfKVcRGAwPRjIgREbLqe9s1FuRSiY
	mga0nDAe/nZuHUBr2RhLGAY8y53/VVoQhYuYjG58L3uH9gAl8sAon3oPfrOaLoNVaBGL5783t56
	dRUQ0mrXmw9ArN2Y8cL6K9TXoRneflp8v0r+lPnAdD2ckTqfSro9wjAigEpcRVgrusYJ2a+jJDA
	2nEk+6Qr3lsJozQ==
X-Received: by 2002:ac2:4c50:0:b0:5b2:8963:e5d4 with SMTP id
 2adb3069b0e04-5b8bff1d051mr39681e87.5.1789651041084; Thu, 17 Sep 2026
 06:17:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260915160141.3543048-1-suzuki.poulose@arm.com> <20260915160141.3543048-21-suzuki.poulose@arm.com>
In-Reply-To: <20260915160141.3543048-21-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 17 Sep 2026 14:16:44 +0100
X-Gm-Features: AcwNN1VtWWKyrr6h6sFHMUccgZH0Chs5OMidTNSOoiZ_fDx_6ZmQhtU1SR2DO2Y
Message-ID: <CA+EHjTwYqTFzGdNPproWW5L6j5pNqmuWeFuu9HbHa8LBLPvY2A@mail.gmail.com>
Subject: Re: [PATCH v18 20/23] KVM: arm64: CCA: Don't expose unsupported
 capabilities for realm guests
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_061723_914307_4D32EECD 
X-CRM114-Status: GOOD (  13.75  )
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

On Tue, 15 Sep 2026 17:01:38 +0100, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
[...]
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
[...]
> +static inline bool kvm_realm_ext_allowed(long ext)
> +{
> +        switch (ext) {
> +        case KVM_CAP_ARM_PSCI:
> +        case KVM_CAP_ARM_PSCI_0_2:
> +        case KVM_CAP_NR_VCPUS:
> +        case KVM_CAP_MAX_VCPUS:
> +        case KVM_CAP_MAX_VCPU_ID:
> +        case KVM_CAP_MSI_DEVID:
> +        case KVM_CAP_ARM_VM_IPA_SIZE:
> +        case KVM_CAP_ARM_SVE:
> +        case KVM_CAP_ONE_REG:
> +        case KVM_CAP_ARM_PTRAUTH_ADDRESS:
> +        case KVM_CAP_ARM_PTRAUTH_GENERIC:
> +        case KVM_CAP_SYNC_MMU:
> +                return true;
> +        }
> +        return false;
> +}

I'd keep KVM_CAP_IRQCHIP in this list. api.rst has it advertising
KVM_IRQ_LINE as well as KVM_CREATE_IRQCHIP, so the cap means in-kernel
irqchip rather than GICv2, and the GICv2 case is already rejected by
patch 18 in kvm_vgic_create(). It also keeps the two protected lists
the same where the support is the same. And could this live in
kvm_rmi.h, next to where kvm_pkvm_ext_allowed() lives in kvm_pkvm.h,
rather than in arm.c?

[...]
> +static inline bool kvm_arch_vm_ioctl_allowed(struct kvm *kvm, unsigned int ioctl)
> +{
> +        long ext;
> +        int r;
> +
> +        r = kvm_get_cap_for_kvm_ioctl(ioctl, &ext);
> +        if (WARN_ON_ONCE(r < 0))
> +                return false;

You told Sashiko my fix covers this one [1], but that fix changes
kvm_pkvm_ioctl_allowed(), which this patch deletes, so the `if (r <
0)` has to go into this copy too. The guard you posted for the second
finding still leaves the WARN reachable on pKVM and Realm hosts, which
is the case the fix removed.

nit: kvm_arch_ is the prefix generic KVM uses for the hooks it calls
into the arch. For two static helpers in arm.c, kvm_vm_ext_allowed()
and kvm_vm_ioctl_allowed() would avoid the collision, and the same for
kvm_arch_vm_ext_allowed() above.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260914093838.1082637-1-fuad.tabba@linux.dev/

