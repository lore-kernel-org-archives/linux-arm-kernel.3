Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C61CD6E7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 16:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iKL2XhPJcTe92U+7kcTY+J0V1P0lR2YbYloV0NBdglw=; b=JZzH/CBhwmOJR+83qyHyRgZpQM
	4AVUSzObgnN88Wm+p+oXhDsVrBCDT3Apln6dpm2lzHdwCdZmOaz1YNprPvvrnkFjpf642I74gqQck
	S3m9PR65ZtQzWP/+3DjEv33uR+AFFug9SQX6vRzT8wZwCJ+tnvUH7mofuDNs5IMqjK8T4rKEkwkr1
	GVsCVGqXuzks22BB4mdQ+RT4K4G2NA/elHLdHrdEAGn1UoOweXpiSL76AAwc1PXDxbepyG6B+z0PJ
	s/YLcKjEjvr0Z3hYSbb0jabhgneTXrAmRrRFN7BJOie/KFJAgXY72BuqcAAkHA50KspAMIS0aq97K
	ZNc/Yr+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVXrb-00000000wcS-1Cac;
	Fri, 05 Jun 2026 16:57:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVXrY-00000000wc3-2ss7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 16:57:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780678658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iKL2XhPJcTe92U+7kcTY+J0V1P0lR2YbYloV0NBdglw=;
	b=euFsZXDXqhGhuGOWAk3wZtZ/4pDvrG63MQ+QPpVRz/92pJTKXaqUrkjWtIh7lX2vQlDM8R
	h+xpNmhGqwYzaTFxIIvOpAbMRt+RYdBUuod08vslOxcVOUNx6+8FCwsAg7bGCWpbrBa+Hr
	hsTzwQ1fEQ5oJoL9qTOZs083N1MgnS0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-8OWZAVWsOn-Sy_LO_IVe9g-1; Fri, 05 Jun 2026 12:57:36 -0400
X-MC-Unique: 8OWZAVWsOn-Sy_LO_IVe9g-1
X-Mimecast-MFC-AGG-ID: 8OWZAVWsOn-Sy_LO_IVe9g_1780678655
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4601c9b630fso872301f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 09:57:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780678655; x=1781283455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iKL2XhPJcTe92U+7kcTY+J0V1P0lR2YbYloV0NBdglw=;
        b=cJjxa4O7zPQ829G6g8L3wGqeUNmzR1Cs2spJvY2W2i9Zd3Cpknazt5EJfMLap+cWnV
         6DobK5QQjgdawmDYSKJL9OnJG5qJ+niLpgSWhmtH+Qb77/btEUQkai5r8TWpYreDXFSw
         pxnW4ce/BvYj9bgLoduQxn/omQYXCvfrcgd2/XndV7/OxXX6PUorUV7sgcc1H+J91L+q
         ykNs+V6w0QaHomK65J8O7buZvigf9JmrjGOjJxX4sURCgADDk9XGUZaWOBiVZmTKyW8a
         R5QftDf0UuCQhM6ClTEGHdXlAWd4YU2ssB+2Fck6vb86lqBW9PYDyHtuxTdQqITxZf6o
         QOOg==
X-Forwarded-Encrypted: i=1; AFNElJ8yF1xs+krW+4aKkGdAZG/RbnNDQgYar9jbBzT84nVfeJe1QBgfBJuS1UeW4fy0eZAP/VcNqY2/NSi3s+TAw3IQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwkiTpAG87TBP/SnkjaR5P/ax1ybf35JojpbaeoR08Lb/8Gr5vb
	ejhFmrvMcstAoBZsRLgv5wFF7Z6YtRnmdDlo1EVOXVK6LB/kKmtFt0ZTgLynZBm2LKjVTUmWB7N
	FIz1cdl6AnOU2nfL8yKnLZi2iNq7czUBGtE/12tiuObp7em6R+cHyoTyjH8MwXdBCcUV1sb8xJl
	q5lUpqNSRY54dOBJXx9gU16pCxQBwNdb/qvxSZljaWCYoy1D467VA=
X-Gm-Gg: Acq92OEKItXscLTyAdmg6pazfGkHJpKlVqGWGrpK3Lrz9AwpDhHKYi+Emo4fyf6tr0t
	vuuULkQIQ0Oa2xfITnrIG2Fey/QSWeH5s8ezqEmBMGNmv4qCUFW96orghMKtGqLgX4KfAKHTZ15
	OP4jBO5HYIX9FtFvzgCbuXG1f+8UB84gjnV/6Gm/arq9JY2ur/XcaYJUSm8oWiPwESGk6ypRjd/
	LgtLZtMZYGifmqHCMF1TynD81J4UYH4Hyj3bGD5K0CDEae0x00nCgVURo1MP9Ze/s+dHc139VmN
	pOxuQ0SxEp7yX3JDJQ==
X-Received: by 2002:a05:6000:1889:b0:460:1987:7bb9 with SMTP id ffacd0b85a97d-46030753534mr7686106f8f.29.1780678655540;
        Fri, 05 Jun 2026 09:57:35 -0700 (PDT)
X-Received: by 2002:a05:6000:1889:b0:460:1987:7bb9 with SMTP id
 ffacd0b85a97d-46030753534mr7686068f8f.29.1780678655186; Fri, 05 Jun 2026
 09:57:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260605164516.2214533-1-maz@kernel.org>
In-Reply-To: <20260605164516.2214533-1-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 5 Jun 2026 18:57:22 +0200
X-Gm-Features: AVVi8CdXD2dFjV3hwOcMaVAYJkQk2Ss55TNM_5tzf_zqwGUWPlvODfkGX82xJFw
Message-ID: <CABgObfakiK_xLU_buKA_TknQNMPiKKo_=GMhgP71i_r8jPPY7A@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/arm64 fixes for 7.1, take #5
To: Marc Zyngier <maz@kernel.org>
Cc: Hyunwoo Kim <imv4bel@gmail.com>, Joey Gouly <joey.gouly@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Wei-Lin Chang <weilin.chang@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zD2XMz5qJOLhCpmz7U_-WISebRGtibRDKxkz3En3Pyk_1780678655
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_095740_816778_9E2C45E0 
X-CRM114-Status: GOOD (  18.14  )
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

On Fri, Jun 5, 2026 at 6:45=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrote:
>
> Paolo,
>
> Yes, I said that last week's pull request was the last. I really meant
> it, honest. But people (and their AI best mate) keep finding ugly
> stuff in dark corners, and I can't sit on this stuff much longer.
>
> So here we have an assorted mess of bad races, broken userspace, and
> architectural bugs. What's not to like? As usual, details in the tag
> below.

x86 isn't doing any better, so who am I to judge.

Pulled, thanks.

Paolo

>
> Please pull,
>
>         M.
>
> The following changes since commit 83726330748981372bde86ed5411d7b3066129=
91:
>
>   KVM: arm64: Correctly cap ZCR_EL2 provided by a guest hypervisor (2026-=
05-29 10:04:00 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kv=
marm-fixes-7.1-5
>
> for you to fetch changes up to 17f073f78fc43280891ecde8f8ec3f84f98bb37c:
>
>   KVM: arm64: Correctly identify executable PTEs at stage-2 (2026-06-05 1=
4:07:57 +0100)
>
> ----------------------------------------------------------------
> KVM/arm64 fixes for 7.1, take #5
>
> - Correctly drop the ITS translation cache reference when it actually
>   gets invalidated
>
> - Take the SRCU lock for SW page table walks
>
> - Restore POR_EL0 access to host EL0, avoiding POR_EL0 becoming
>   inaccessible from EL0 after running a guest
>
> - Reassign nested_mmus array behind mmu_lock, ensuring that vcpu init
>   and MMU notifiers are mutually exclusive
>
> - Correctly handle FEAT_XNX at stage-2
>
> ----------------------------------------------------------------
> Hyunwoo Kim (3):
>       KVM: arm64: vgic-its: Drop the translation cache reference only for=
 the erased entry
>       KVM: arm64: Take the SRCU lock for page table walks in fault inject=
ion and AT emulation
>       KVM: arm64: Reassign nested_mmus array behind mmu_lock
>
> Joey Gouly (1):
>       KVM: arm64: Restore POR_EL0 access to host EL0
>
> Oliver Upton (2):
>       KVM: arm64: nv: Fix handling of XN[0] when !FEAT_XNX
>       KVM: arm64: Correctly identify executable PTEs at stage-2
>
>  arch/arm64/include/asm/kvm_nested.h     |  4 ++--
>  arch/arm64/kvm/at.c                     |  6 ++++--
>  arch/arm64/kvm/hyp/include/hyp/switch.h |  2 ++
>  arch/arm64/kvm/hyp/pgtable.c            |  4 +++-
>  arch/arm64/kvm/nested.c                 | 33 ++++++++++++++++++++-------=
------
>  arch/arm64/kvm/vgic/vgic-its.c          |  6 ++++--
>  6 files changed, 35 insertions(+), 20 deletions(-)
>


