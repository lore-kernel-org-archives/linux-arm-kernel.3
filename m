Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C0FC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 18:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iZrFNI4C7gp68g9l+kDtLtosIj+17mZI2t4068Zb7/k=; b=XoZzYgNWXWAAlvvzpxhwR2O1vm
	f0TTlZwXlMpaN6zM2VKwAXFDKmZloRJRZlkK3mVkAL/8YcAhAJ6XC3GenkITE/dXXyN1wkOV8j4qw
	hGxh0+lqzYAw9i+zmWTWKshfpTKdVNUQZNuHDZMjmSOzlVl+NxycaY3JPfQnsI676g+GbUuW6G/fD
	ObEbeSGHQ5kYlZRsX/r0zWWYAX4R9PZgahNbBo7T31SSVQo5i4023ZDx+2/qTYpio2ljZb758Bh6i
	8wnnoP2hDCy9pRY/Dx8Mv5KYTw0A5FPtZktESf3/cd73RP3mmxs54ac7fhLnFKcPXNR2dl0rLLXOw
	+7nmaWzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmdFj-0000000Eoiw-1Cqm;
	Mon, 24 Feb 2025 18:32:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmd4A-0000000EmR6-0ycn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 18:20:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740421228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iZrFNI4C7gp68g9l+kDtLtosIj+17mZI2t4068Zb7/k=;
	b=XbqaJPa/sUTQMNZZP9lDWr0Ej+xGDju8x7q4c1csViPQB3DaEzBvQwW34wX9g2Iwy0BcoI
	WLO7X7+mKvStSlc8VSijMQNq4k401ck6Kyao5mzrlhU1lFhpVYer1WeUnq3Es3JEr2Dpsh
	WR8VCzOmPNutp7+226fmeusy4m7dRpQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-0l0qZ6uoPPO9UazPPprkEg-1; Mon, 24 Feb 2025 13:20:26 -0500
X-MC-Unique: 0l0qZ6uoPPO9UazPPprkEg-1
X-Mimecast-MFC-AGG-ID: 0l0qZ6uoPPO9UazPPprkEg_1740421226
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43995bff469so39560935e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 10:20:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740421226; x=1741026026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iZrFNI4C7gp68g9l+kDtLtosIj+17mZI2t4068Zb7/k=;
        b=ou9f6X7YEB9FUTZW9yaXT5IKsuUx2R7VsphGKWimY7ixMiCQtrnFI6TQFGpu3q4bfK
         wUWCIzIuXdR6n1BDafkvy0T3c1aAGrxnWzzjiG7EbXQw9JLFjJHIUhvV4WkZMML3Q2yu
         sp59oFpDPsXI6OeW/THIQ7bdGXTn300OmOvIUm9+kT6xGrQz+ctKkhK0McRVvPSe8pgs
         +dicJhc/2/owUk49hGD2fhiqJKxFFEjS/LEnGjuUS8EjO8WPQejQTmOU/vgBE/JMIcz4
         MppCHVL004ZhkqyrX26Waa5v+cetNIoOXuDWIrh0xi1ID8xoHhu0eL2U1cx5ZXDe3Vxs
         YXbg==
X-Forwarded-Encrypted: i=1; AJvYcCXisClzQjod5zlZkTPb1KOF8wfAk+FRfqvgu4b5aLf4gIsXG6z6GhF8d3VFRMhKvW4SH4PyP+Uv+CFa9w1jpf2T@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9dbsvAiHyULn17pC9WRNbPmHl3WZMe2CsCNTvFKc+nl4TfZ14
	zM9mcmM/SnR4AG+XJBZi4c2TU77/sVVmyY7BhvrK+untofeDsxDxuWkl/Vgcb8++BClrGwDRbpy
	Uhmbc7t0HIAOHGR80ADC0LfJWBX02KZ18MlV1/g9gWd6Q2jRSmtJmMWkFTJ6cIMcR0d0sXjdcHo
	RI8wUyAGs2w4oVH4XCoTiniS2X4FSPjE0bTGmOLZBjRd7bWII=
X-Gm-Gg: ASbGncvBQHXtFVyVXuygNgZLQatxPDiciIWtyc08CoBbZ4m2Wnt9mMawpL8ZTQNKejG
	yhKuqTU/CrYKM4tQsq+p6i6hVx6/qUggb8lEgR/GPEANIj4F5aP+K/qrKrLhiCrLFUbXdGvTcmA
	==
X-Received: by 2002:a05:600c:1e15:b0:439:9cbc:7753 with SMTP id 5b1f17b1804b1-439b03246d2mr120217785e9.10.1740421225748;
        Mon, 24 Feb 2025 10:20:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPgI3aLartuC/rneTquTEdyzyQpc0037VQO5E4VWeS/fDSQrV1vC9WSFvHP9NH6aMpcflu8dbApUxYsLMrEGk=
X-Received: by 2002:a05:600c:1e15:b0:439:9cbc:7753 with SMTP id
 5b1f17b1804b1-439b03246d2mr120217535e9.10.1740421225383; Mon, 24 Feb 2025
 10:20:25 -0800 (PST)
MIME-Version: 1.0
References: <20250220174406.749490-1-maz@kernel.org>
In-Reply-To: <20250220174406.749490-1-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 24 Feb 2025 19:20:14 +0100
X-Gm-Features: AWEUYZlnPj-9rOwF2Mzb1qT313FEPSpFv0way0dOS9rLvuEZKU9Q-G2Q2GVG6xs
Message-ID: <CABgObfbG1wWT0rCynqZOYr8mzqrAdZeTYiG+EDOy1BOqa3k+aA@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/arm64 fixes for 6.14, take #3
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, Vladimir Murzin <vladimir.murzin@arm.com>, 
	Will Deacon <will@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ktt0c-3TOnYCyaVmRAStwVqg3GnOxG0nnDnnAdDPcVQ_1740421226
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_102030_348319_07F564A0 
X-CRM114-Status: GOOD (  17.96  )
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

On Thu, Feb 20, 2025 at 6:44=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrote=
:
>
> Paolo,
>
> Another week, another set of fixes.
>
> This time around, we have a focus on MMU bugs, with one bug affecting
> hVHE EL2 stage-1 and picking the ASID from the wrong register, while
> the other affects VHE and allows it to run with a stale VMID value.
>
> Either way, this is ugly.
>
> Please pull,

Pulled, thanks.

Paolo

>         M.
>
> The following changes since commit 0ad2507d5d93f39619fc42372c347d6006b643=
19:
>
>   Linux 6.14-rc3 (2025-02-16 14:02:44 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kv=
marm-fixes-6.14-3
>
> for you to fetch changes up to fa808ed4e199ed17d878eb75b110bda30dd52434:
>
>   KVM: arm64: Ensure a VMID is allocated before programming VTTBR_EL2 (20=
25-02-20 16:29:28 +0000)
>
> ----------------------------------------------------------------
> KVM/arm64 fixes for 6.14, take #3
>
> - Fix TCR_EL2 configuration to not use the ASID in TTBR1_EL2
>   and not mess-up T1SZ/PS by using the HCR_EL2.E2H=3D=3D0 layout.
>
> - Bring back the VMID allocation to the vcpu_load phase, ensuring
>   that we only setup VTTBR_EL2 once on VHE. This cures an ugly
>   race that would lead to running with an unallocated VMID.
>
> ----------------------------------------------------------------
> Oliver Upton (1):
>       KVM: arm64: Ensure a VMID is allocated before programming VTTBR_EL2
>
> Will Deacon (1):
>       KVM: arm64: Fix tcr_el2 initialisation in hVHE mode
>
>  arch/arm64/include/asm/kvm_arm.h  |  2 +-
>  arch/arm64/include/asm/kvm_host.h |  2 +-
>  arch/arm64/kvm/arm.c              | 37 +++++++++++++++++----------------=
----
>  arch/arm64/kvm/vmid.c             | 11 +++--------
>  4 files changed, 22 insertions(+), 30 deletions(-)
>


