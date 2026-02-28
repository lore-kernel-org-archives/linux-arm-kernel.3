Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED8B7FEE4D4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 15:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zx/41eGZi0CJBh+Og8Z1FttBS/rIdtUYQz5ebE6xc1E=; b=xXcDsh3iD1GF+oAYA4efi/KOTo
	pQxj9o+dUrWnIjar2RhWgrzRw7UgavHxlf+IYPQhkgtWuH5uRSG+NJnxpsY5/S8XbBHa4OEVotd1X
	G4/BdHiN0FYk8HIz817YtYfAca/EOAj6wjhItUIkRV/16/0aZAaCQa4tlBgZTu19ocSSwtPCCLn3I
	aMWUIoNZaYiRb5863fE8Ml6risfQ8lnZSUBJPe+RQ597+O0SW1BiNZnmlYS5OTt24BQ8YRymSYEFl
	m8cSd/vLKJAkrYHGEbvh68X6M9Y+j+dBhLKsAFyf91ok9AJjfWS05bmIzrRhW+J1S15n/MwR0Nn2e
	I5zYN4oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwLsF-00000009yLl-0RBH;
	Sat, 28 Feb 2026 15:04:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwLsC-00000009yLL-1RhC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 15:04:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772291089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zx/41eGZi0CJBh+Og8Z1FttBS/rIdtUYQz5ebE6xc1E=;
	b=hQ30TKN3sTGyumMCxPxyzRMO0xOniTOevqxnToaiCMvhWdipSq2ObrqDnuyzgQ40RWjRbE
	IuhPRqvBaEhrdq86f8TdQMRjYYNpdnXwHvqFEgq4lGL19v5G0YCS3/qQ5L+ZH4L55P6IbU
	DRMY+k+0zVtDX8m7HkHzoj/QKcLxdmY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-265-kdTYZu2POyGu40riGk69mw-1; Sat, 28 Feb 2026 10:04:48 -0500
X-MC-Unique: kdTYZu2POyGu40riGk69mw-1
X-Mimecast-MFC-AGG-ID: kdTYZu2POyGu40riGk69mw_1772291087
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4376e25bb4dso1749418f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 07:04:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772291082; x=1772895882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zx/41eGZi0CJBh+Og8Z1FttBS/rIdtUYQz5ebE6xc1E=;
        b=AcEXvJM3TGkVegeMAhtnr/3gDyk/5q3/MVCJo6ZvYGh0cEeQif/9gQ9iodojwAKBWB
         ClAIRdq9yIV8ti+Lo5oMMklOnP93fCHPEHTu/5aiApfeEaBBltcQBgXeh1YSAnRjF72Z
         g2KQ4PZ7TwTciwq02Jy4OVKHm0iS5YAwIhVJkBc4elQqQmYnj53DQh1V3aeN+/vI00pm
         0y/yjP57B2vbS5TimM0hjTir+TxGVYIYfChQRHfFuDC6pl9DrwOwEjh5ziIxZg/RkkcW
         OZrA5q4eU652f3t5GlOJBEFpwPc6zlEapJ1TNwCwLJS8+3JvcqsfMe6DswvBOOUcVtJG
         etmg==
X-Forwarded-Encrypted: i=1; AJvYcCUpZVsAdCFbIkwX0F2ECLBgWGeXQj6yKzL0YTFIQKIkqTN5qfdQ5LbLDkbrY/XgbKzQDVfyybzkEKaqXR31WPbm@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5i9HKG7PIYq6R4xMQW48X6i/TzShlWOJEFdGNIYou4xoC17lk
	XUcu/SbVk4Gjh2TQLr/4ne0f3EEb5A1tZ8YYsnvqfRnCwyQfpueJ1ttBm5MNbNpdtNrv/tC8O+b
	hvIycVNHrvVqP4lNCHAcSZg+Vy8Q6aGLJeLmOTLlS5UM8aHuFhADyWh63gYxXtdNEVxDzqEj3Vr
	qbjUjaS+Z4ciUfr2m+8AC+ZXcPEtdx0+gLBAZBdP1VbXmXP2iEd1M=
X-Gm-Gg: ATEYQzzBM5PUN5CYUF7kLifRgEOKvfqFDYzJjQT+fqnJsZPcwS5g3z44gj2g8PjhPpy
	MKvGXR0npp1CzLYEDM7VWH4/vGKOLBjMvuFcuzzmHUNXo+aLHlZbTiUOvZX/XVCFTu+gs9aKCb/
	5btSGkv66m3jz7sMcy5maE0rgtx/a/oxf54bDGCPBFQ0NLYlqRBiEIPJHViSIyjKARjgEz86I3i
	7WeclrgUdMiRgoc89qSjFe40XKUPbCVnVFMkoR1fp6H0fM3rLVfy6K39B9gmHkb+Lep8iUgZdLi
	zvKNW4A=
X-Received: by 2002:a05:6000:26c6:b0:435:faa5:c15e with SMTP id ffacd0b85a97d-4399de28393mr11435477f8f.30.1772291081974;
        Sat, 28 Feb 2026 07:04:41 -0800 (PST)
X-Received: by 2002:a05:6000:26c6:b0:435:faa5:c15e with SMTP id
 ffacd0b85a97d-4399de28393mr11435430f8f.30.1772291081553; Sat, 28 Feb 2026
 07:04:41 -0800 (PST)
MIME-Version: 1.0
References: <20260226105048.28066-1-maz@kernel.org>
In-Reply-To: <20260226105048.28066-1-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 28 Feb 2026 16:04:26 +0100
X-Gm-Features: AaiRm535mUPGGS-9UDvB7slsNDUQ3q2gpNPHAuAWbj3L_0kYm4R6oOTjJd7rRXg
Message-ID: <CABgObfZ=4+MwQt1axbAeDsstRUOi3nemmiXndV51POgMw7u=nw@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/arm64 fixes for 7.0, take #1
To: Marc Zyngier <maz@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Kees Cook <kees@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Sascha Bischoff <sascha.bischoff@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hBNq1gaq8ehi1GHWcdIs80l561rjmg6PzXz9JTsSZaw_1772291087
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_070452_489085_7612F921 
X-CRM114-Status: GOOD (  22.75  )
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

On Thu, Feb 26, 2026 at 11:51=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrot=
e:
>
> Paolo,
>
> Here's the first set of KVM/arm64 fixes for 7.0. Most of it affects
> pKVM (feature set, MMU), but we also have a GICv5 fix and a couple of
> small cleanups. Details in the tag below.
>
> Note that there is a very minor conflict with Linus' tree due to Kees'
> patch having been applied to both trees. Whatever is in Linus' tree is
> the right thing.
>
> Please pull,

Pulled, thanks.

Paolo

>         M.
>
> The following changes since commit 6316366129d2885fae07c2774f4b7ae0a45fb5=
5d:
>
>   Merge branch kvm-arm64/misc-6.20 into kvmarm-master/next (2026-02-05 09=
:17:58 +0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kv=
marm-fixes-7.0-1
>
> for you to fetch changes up to 54e367cb94d6bef941bbc1132d9959dc73bd4b6f:
>
>   KVM: arm64: Deduplicate ASID retrieval code (2026-02-25 12:19:33 +0000)
>
> ----------------------------------------------------------------
> KVM/arm64 fixes for 7.0, take #1
>
> - Make sure we don't leak any S1POE state from guest to guest when
>   the feature is supported on the HW, but not enabled on the host
>
> - Propagate the ID registers from the host into non-protected VMs
>   managed by pKVM, ensuring that the guest sees the intended feature set
>
> - Drop double kern_hyp_va() from unpin_host_sve_state(), which could
>   bite us if we were to change kern_hyp_va() to not being idempotent
>
> - Don't leak stage-2 mappings in protected mode
>
> - Correctly align the faulting address when dealing with single page
>   stage-2 mappings for PAGE_SIZE > 4kB
>
> - Fix detection of virtualisation-capable GICv5 IRS, due to the
>   maintainer being obviously fat fingered...
>
> - Remove duplication of code retrieving the ASID for the purpose of
>   S1 PT handling
>
> - Fix slightly abusive const-ification in vgic_set_kvm_info()
>
> ----------------------------------------------------------------
> Fuad Tabba (5):
>       KVM: arm64: Hide S1POE from guests when not supported by the host
>       KVM: arm64: Optimise away S1POE handling when not supported by host
>       KVM: arm64: Fix ID register initialization for non-protected pKVM g=
uests
>       KVM: arm64: Remove redundant kern_hyp_va() in unpin_host_sve_state(=
)
>       KVM: arm64: Revert accidental drop of kvm_uninit_stage2_mmu() for n=
on-NV VMs
>
> Kees Cook (1):
>       KVM: arm64: vgic: Handle const qualifier from gic_kvm_info allocati=
on type
>
> Marc Zyngier (2):
>       KVM: arm64: Fix protected mode handling of pages larger than 4kB
>       KVM: arm64: Deduplicate ASID retrieval code
>
> Sascha Bischoff (1):
>       irqchip/gic-v5: Fix inversion of IRS_IDR0.virt flag
>
>  arch/arm64/include/asm/kvm_host.h   |  3 +-
>  arch/arm64/include/asm/kvm_nested.h |  2 ++
>  arch/arm64/kvm/at.c                 | 27 ++--------------
>  arch/arm64/kvm/hyp/nvhe/pkvm.c      | 37 ++++++++++++++++++++--
>  arch/arm64/kvm/mmu.c                | 12 +++----
>  arch/arm64/kvm/nested.c             | 63 ++++++++++++++++++-------------=
------
>  arch/arm64/kvm/sys_regs.c           |  3 ++
>  arch/arm64/kvm/vgic/vgic-init.c     |  2 +-
>  drivers/irqchip/irq-gic-v5-irs.c    |  2 +-
>  9 files changed, 81 insertions(+), 70 deletions(-)
>


