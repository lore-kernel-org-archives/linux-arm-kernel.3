Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCE3CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 08:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8kCCPSR7eAbezRrY9EzmdTOQTokcL1TCE2C4CcBHkS8=; b=Ca4m0Lcr0p1q0m8YIDhmxJ0I/3
	gzB3EE6lbF9R3dOUcdHsizc/9SHKxhh7USRn3IJ+qPu3Yhqq8BsVLwbe4vULnWPCL6hBieqfNNHTZ
	uSZGYaNr2FwTw6a57SIQKxky+QtoaL3WSWRSO3ix+g9gMRM2qWC4Fv+vi8O8evXzrHsocNp+EcGUO
	dSj2Yt7FMTCxmY76lm2fEu7rzxo9sOsqkY/ZmDtREYNpO3qZtsgjdWHgmsRV1k6obEzzRG2u8QB52
	WbGPG22u8hCUnsXmVM8OyWG+LW4PefWIC/FVVM8HeyUgxjpVDv59Fmd2OKezJ2C84+o6Rm5xYbhiC
	06hGPIrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQhKk-0000000Cucr-1EXN;
	Sat, 23 May 2026 08:03:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQhKg-0000000CucL-36iJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 08:03:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779523419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8kCCPSR7eAbezRrY9EzmdTOQTokcL1TCE2C4CcBHkS8=;
	b=W9PtaDBUTJI3cWPXZyMPCiHjrEvFeVizXM48yd9gs6bBaS8+g7euJbqxk8CHG3voTsp1z9
	xPVUgPuMkBhL64Vo7/J8WniicfkKwCsGYMXjq8R8kJEKJxRZaHIY62w63p3LuXSztVmR05
	g9NJ+2CJQ4yYK+AXEEZ2A2gr1h0VCBo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-fvbFdsnLNcirVCJPHDGUfQ-1; Sat, 23 May 2026 04:03:38 -0400
X-MC-Unique: fvbFdsnLNcirVCJPHDGUfQ-1
X-Mimecast-MFC-AGG-ID: fvbFdsnLNcirVCJPHDGUfQ_1779523417
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49041d39887so10730855e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 23 May 2026 01:03:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779523417; x=1780128217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8kCCPSR7eAbezRrY9EzmdTOQTokcL1TCE2C4CcBHkS8=;
        b=BkQDj61M4kvyD976BvFk0zDLQUli4nFHAZLWuP5seIWkWWjZeneWQzH/6ruqt3PGso
         jUvkuz3VPusBGi/Jw37ObtLrAvAzF3dd7V93Dz4iLrbo6kzUCgnt4GUeNSXUKqJMZEJ8
         9DclGzPKXZaHg0WAMVdcmElh0zLtDo1j5KlLqkDnS8o3RjKvrGVHKvwS03cmYjSWLGYU
         hAx7Mb3PoX+Z6Sv7A2JrLgajviua8Cu+r7qu00UMi/6PZ05uAx55ZkAkKrJbQIbRRw8J
         PRrqMZuRcwkAAPr2ZUlgMYwjGlsHXzwTxjRAhRaQddHfBGcdaWvYhudlD9OxudDGT3li
         SV0w==
X-Forwarded-Encrypted: i=1; AFNElJ+sYIsogqfw9vmiVVu2nWjnqBLvRN/EbQEtMINn7IUtW5NF+BKw4RaTHnTBODEpOrw1vjUc/GIoBWelOst3HExH@lists.infradead.org
X-Gm-Message-State: AOJu0YxQQtiBVmm/CXe0nFihmzM9rN/rkKM3Ksh81432Fg+st09IolAy
	xjUhS2D1bMW3GoY50EqBlCWZXmjZm4JKYUUvx+u9kBdPMMmAkSFDKPyZiHZ8eojJ3KFP3vLrwby
	HHn4Mcwc2nqq/YvICyNJ4e6aBh/uimsWeZPkwrkYJF3JXRiGqnPaYWOkSydMUvzCepPNEIyiPEt
	mNdgx9/n3R5IX3N5JThzLQAXbCidSijMhGUXZpe7+JFJp8RwJFlvw=
X-Gm-Gg: Acq92OEpe7wKuXiMmx3ke8brjc+Hw6b+svCG9C3SiLg5M7KhkIDZpghlhNIlHsOMIrv
	l+scenbrLxVBlBi+G1gaw4NzfzlWhH5JMzIz2GY6dkW6Dw9C9YmpWUYWqkhX+M5DrCb80ObFC0l
	x0lXWPSZQ109c1tlr74dfzLnt9RFyPk//zkrqaOL1qkz/4wX3m7SGkq3BF4uNYv6Z3zX5gCaTgM
	2ruEfuzN2Krx9Qhj+aE+fN7uHeHro8HpO3uMHmTYttRtD1d1AIEbexSQjXiPsIIPlcyuZmAEom8
	hjCk+vY=
X-Received: by 2002:a05:600c:5298:b0:48e:51f8:eb39 with SMTP id 5b1f17b1804b1-490428e0b24mr103916205e9.28.1779523417099;
        Sat, 23 May 2026 01:03:37 -0700 (PDT)
X-Received: by 2002:a05:600c:5298:b0:48e:51f8:eb39 with SMTP id
 5b1f17b1804b1-490428e0b24mr103915625e9.28.1779523416685; Sat, 23 May 2026
 01:03:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260520072518.504865-1-maz@kernel.org>
In-Reply-To: <20260520072518.504865-1-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 23 May 2026 10:03:24 +0200
X-Gm-Features: AVHnY4JSA0Bs3_rwKjWLijly1xMqn0yNDirfiVv1I4mSWo8k1UBJzXBC_g_e__A
Message-ID: <CABgObfb4UiufkpDOP6yyAYNjBYnSZvZpi6hfqXoEX7dqCPBk3g@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/arm64 fixes for 7.1, take #3
To: Marc Zyngier <maz@kernel.org>
Cc: Michael Bommarito <michael.bommarito@gmail.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Will Deacon <will@kernel.org>, Yuan Yao <yaoyuan@linux.alibaba.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: C4QdluDD3jWv2xxa-1Hs_ImelJ8a-N31MttX07v6sAM_1779523417
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260523_010342_856219_D99BBA75 
X-CRM114-Status: GOOD (  15.51  )
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

On Wed, May 20, 2026 at 9:25=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrote=
:
>
> Paolo,
>
> Here's the next set of KVM/arm64 fixes for 7.1. Continuing the trend,
> we have two AI-fuelled fixes, both of which are stable candidates.
> Additionally, a minor tidying-up of the hypervisor tracing descriptor
> validation.
>
> Please pull,
>
>         M.
>
> The following changes since commit effc0a39b8e0f30670fe24f51e44329d4324e5=
66:
>
>   KVM: arm64: Pre-check vcpu memcache for host->guest donate (2026-05-07 =
14:12:42 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kv=
marm-fixes-7.1-3
>
> for you to fetch changes up to 1702da76e017ae0fbe1a92b07bc332972c293e89:
>
>   KVM: arm64: Fix nVHE/pKVM hyp tracing error on invalid desc (2026-05-20=
 08:08:37 +0100)

Done, thanks.

Paolo

> ----------------------------------------------------------------
> KVM/arm64 fixes for 7.1, take #3
>
> - Fix ITS EventID sanitisation when restoring an interrupt translation
>   table.
>
> - Fix PPI memory leak when failing to initialise a vcpu.
>
> - Correctly return an error when the validation of a hypervisor trace
>   descriptor fails, and limit this validation to protected mode only.
>
> ----------------------------------------------------------------
> Michael Bommarito (2):
>       KVM: arm64: vgic-its: Reject restored DTE with out-of-range num_eve=
ntid_bits
>       KVM: arm64: vgic: Free private_irqs when init fails after allocatio=
n
>
> Vincent Donnefort (1):
>       KVM: arm64: Fix nVHE/pKVM hyp tracing error on invalid desc
>
>  arch/arm64/kvm/arm.c            | 4 +++-
>  arch/arm64/kvm/hyp/nvhe/trace.c | 9 +++++++--
>  arch/arm64/kvm/vgic/vgic-its.c  | 4 ++++
>  3 files changed, 14 insertions(+), 3 deletions(-)
>


