Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD985C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 09:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zK/6lQqcEYL/R1meCPdVrlsxMHj74L1KpqoscZburOw=; b=EClzwOW+DebP/+Q+NX8CQ1F0Vk
	mMiEcmxwKSshDnzBnW3C4UkkG9qOpDAkpO4BE/rHY7WKK/KvZXsdrVSFm9NiglTKB9kEzNZKbZTl/
	dMekiXNmB336Jl6hy8PVxbXQMS8kqSUdEJ5Vx1gby7BzzCa7qgQEcIy3VdZTbs4lSkztYERFa41A+
	M0+lOU4DAE8QjCMIsUE5B1OWdAMOLUhPHZ0nd9ZB3DZAczp5z/C95Kx12zHBiX32ISuxN+lqP3KRQ
	xQY87mMGDiSgwhN6KH30bMCqLjakxWr+2dffsUI626UTbFkw0/K56I2uRNqE0FEtYVCdKbfxqEsT4
	80MbmtMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfyNP-00000005sCj-2hPc;
	Thu, 06 Feb 2025 09:40:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfyM2-00000005rya-1jbJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 09:39:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738834764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zK/6lQqcEYL/R1meCPdVrlsxMHj74L1KpqoscZburOw=;
	b=UDWVcYYjuO9r4NRwiGtQWuWYqzCQnPegseOgjlIofjtAX8Ec+de2VTU8HWqd8WS1b44nxf
	cwn8FIm/qDqzLVKw4p+CL/Zca3PR5rab+FgXr1ecIIXFgTHwGvw5BrU37avZiaBpUzS9gB
	qOd1/uORsSleF27EWNyLp3+USR0cxJY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650--wR-QDf_OumP0Lj2mMKkfA-1; Thu, 06 Feb 2025 04:39:23 -0500
X-MC-Unique: -wR-QDf_OumP0Lj2mMKkfA-1
X-Mimecast-MFC-AGG-ID: -wR-QDf_OumP0Lj2mMKkfA
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-38db560edc3so340541f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 01:39:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738834762; x=1739439562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zK/6lQqcEYL/R1meCPdVrlsxMHj74L1KpqoscZburOw=;
        b=nETfMOHv+hk+UQ82Gjh1pYGFaX4k8pUhs0EzGQN6uiPqBXvs9AtZdGSraalVk9Fnj9
         HZMVlSbDEz2aABfeelDyXMsIQn8RTQIB44fNGeD+m4fZ0aPD5ZHNSP3H4HUsaemDAxjL
         /JhEMr/LwHuOMWzBXVF97PmoAhD18WzvBY6kSV2I97oKGFAaLWBYGZmYmQZKmNKiFWxX
         wW5MaNrD+wI1l1f6zmI62nX77hvNirMCa5wbm4z08JzHhlRR4rAsAKsnUf2ncqHlNbCF
         kfAzXiCR1OcGyQJHYBhAmeQHDCigZWiPbAal6Af//AViblYUiTfvr/pTEB0fhUkYCRCT
         ti9A==
X-Forwarded-Encrypted: i=1; AJvYcCVcx63ExoF39ecghQYLSinXjisDwtLqqAwBtEIQV3l+nN8M3w/TLX0CRYEw/ejTUHkKvYWjotisfKLf6sgwLO60@lists.infradead.org
X-Gm-Message-State: AOJu0YwTOHwG7vs9dfyEGU5FitrrxUPbYiA09YzVvyaNbh0yFTpmJYog
	rKhkGzGnD7KfQ6SnlhgfiAaVa9sCsGDzJaOTu7HAjLtviUgYKKMR1HjrcUBnRgsOk5/5kGTrZRW
	hccO7QvgjbvLkXG4NWePhVK4tMryDRhSLWbbdJ0RNzRn92M5Q2NFb7+0XqIzVWCyjNr1r6g5VWz
	FbJa94y5Vvzu1PSprjBQjj9aInKmzArd3wO1A1+QDLvWfIOzA=
X-Gm-Gg: ASbGncuxAUzQL4UD1E0iuZLJPPcenmQ2HMrCwfTCvTv+X017E0qUb1EndtagOXQTxRA
	O+YG1DwTtN5FolT2tYwH90rfRr92JEoExacoSMbJL6OPEq05uVmI10GoRJVWA
X-Received: by 2002:a5d:6da8:0:b0:38a:a11e:7af6 with SMTP id ffacd0b85a97d-38db48a92bbmr4538315f8f.6.1738834761944;
        Thu, 06 Feb 2025 01:39:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpew+3VV/qOv0PNC07nCRiS2S9+c5C+JNNGHJrfpdky5+B8ifZWgPwO9qowgfQ/usuET5m5ZbGL4B3N12rG2g=
X-Received: by 2002:a5d:6da8:0:b0:38a:a11e:7af6 with SMTP id
 ffacd0b85a97d-38db48a92bbmr4538285f8f.6.1738834761541; Thu, 06 Feb 2025
 01:39:21 -0800 (PST)
MIME-Version: 1.0
References: <20250204155656.775615-1-maz@kernel.org>
In-Reply-To: <20250204155656.775615-1-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 6 Feb 2025 10:39:10 +0100
X-Gm-Features: AWEUYZno2kuDpIE83k3643TzUSKf5V_RnzWbIr0C8_DMiPc6ZkU3_VvAeoPh5cU
Message-ID: <CABgObfaY9iXAj8QVn0keEpuLR6Fe0z3NLNdx2COnbgDGTLX7sQ@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/arm64 fixes for 6.14, take #1
To: Marc Zyngier <maz@kernel.org>
Cc: Alexander Potapenko <glider@google.com>, Dmytro Terletskyi <dmytro_terletskyi@epam.com>, 
	Fuad Tabba <tabba@google.com>, Lokesh Vutla <lokeshvutla@google.com>, 
	Mark Brown <broonie@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei-Lin Chang <r09922117@csie.ntu.edu.tw>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XuwMYdoJgeQBv5ZVvzuapwcjtF_Vcj2sNyCNlTi3dOE_1738834762
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_013926_520221_836965B3 
X-CRM114-Status: GOOD (  18.05  )
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

On Tue, Feb 4, 2025 at 4:57=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrote:
>
> Paolo,
>
> This is the first set of KVM/arm64 fixes for 6.14, most of them
> addressing issues exposed by code introduced in the merge window
> (timers, debug, protected mode...). Details in the tag, as usual.
>
> Please pull,

Done, thanks.

Paolo

>
>         M.
>
> The following changes since commit 01009b06a6b52d8439c55b530633a971c13b6c=
b2:
>
>   arm64/sysreg: Get rid of TRFCR_ELx SysregFields (2025-01-17 11:07:55 +0=
000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kv=
marm-fixes-6.14-1
>
> for you to fetch changes up to 0e459810285503fb354537e84049e212c5917c33:
>
>   KVM: arm64: timer: Don't adjust the EL2 virtual timer offset (2025-02-0=
4 15:10:38 +0000)
>
> ----------------------------------------------------------------
> KVM/arm64 fixes for 6.14, take #1
>
> - Correctly clean the BSS to the PoC before allowing EL2 to access it
>   on nVHE/hVHE/protected configurations
>
> - Propagate ownership of debug registers in protected mode after
>   the rework that landed in 6.14-rc1
>
> - Stop pretending that we can run the protected mode without a GICv3
>   being present on the host
>
> - Fix a use-after-free situation that can occur if a vcpu fails to
>   initialise the NV shadow S2 MMU contexts
>
> - Always evaluate the need to arm a background timer for fully emulated
>   guest timers
>
> - Fix the emulation of EL1 timers in the absence of FEAT_ECV
>
> - Correctly handle the EL2 virtual timer, specially when HCR_EL2.E2H=3D=
=3D0
>
> ----------------------------------------------------------------
> Lokesh Vutla (1):
>       KVM: arm64: Flush hyp bss section after initialization of variables=
 in bss
>
> Marc Zyngier (4):
>       KVM: arm64: Fix nested S2 MMU structures reallocation
>       KVM: arm64: timer: Always evaluate the need for a soft timer
>       KVM: arm64: timer: Correctly handle EL1 timer emulation when !FEAT_=
ECV
>       KVM: arm64: timer: Don't adjust the EL2 virtual timer offset
>
> Oliver Upton (2):
>       KVM: arm64: Flush/sync debug state in protected mode
>       KVM: arm64: Fail protected mode init if no vgic hardware is present
>
>  arch/arm64/kvm/arch_timer.c        | 49 +++++++++-----------------------=
------
>  arch/arm64/kvm/arm.c               | 20 ++++++++++++++++
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 24 +++++++++++++++++++
>  arch/arm64/kvm/nested.c            |  9 +++----
>  arch/arm64/kvm/sys_regs.c          | 16 ++++++++++---
>  5 files changed, 73 insertions(+), 45 deletions(-)
>


