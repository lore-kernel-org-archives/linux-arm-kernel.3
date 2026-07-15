Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35BBCC44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 10:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OTfS1o6FG2+VSRsM8RoeMYV4oV1nuMVaP/qPFLezgiM=; b=Fy3BvUJNbuLldoZA2CqL8877C2
	SQZ3BsHBe1fsjPXAGohKa5H7hJu4LOW2hM/E7oGzHVo7Epp1wHE8y2j6xH7lvom6b3EvPtVHwmUZL
	7Noh58nHjxGMTs304hhWcyJyZep19xKxttx6WahGUBdzHMDtNPOoR3ZnKvBzinIT2pyFgUVcm/KIO
	pfIawpNopf7CizXGh6W9WCihvAOk6sQKh7LMrNMUXfIEUmoXkC5+gLNaHkRQz/bRJMxa1cEKAyWxj
	uy3rwUBg1DOIznhBf6Tq1wAUiiTpo8EuK+COmdh2FWb7ElGkyYJf+q/lXqInJSrrrUQtlH5hGIjbI
	/qCt5dUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwdK-0000000EPuk-3Xrr;
	Wed, 15 Jul 2026 10:14:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwdG-0000000EPsq-0fqe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 10:14:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784110465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OTfS1o6FG2+VSRsM8RoeMYV4oV1nuMVaP/qPFLezgiM=;
	b=RMz63dGSk/0uDGMkfYeiL2mh3r7JhmXI5//xy/vxFS1nDDbt/T1FzKoDW+MTDXh6dXCNuY
	xUz6xJzbIb5YW+1Fp6IJVp1thFDH8R651FbJuNfAjPZIJh597Z0jqau/cDop2bIcDNxWoR
	dWzvmu98yHKm4L0fBRtfSpvh+IMzBRw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-mlpAmN_MPF-e-xVV9n3-VQ-1; Wed, 15 Jul 2026 06:14:21 -0400
X-MC-Unique: mlpAmN_MPF-e-xVV9n3-VQ-1
X-Mimecast-MFC-AGG-ID: mlpAmN_MPF-e-xVV9n3-VQ_1784110461
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-47d81cf0c4cso3932046f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 03:14:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784110460; x=1784715260;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OTfS1o6FG2+VSRsM8RoeMYV4oV1nuMVaP/qPFLezgiM=;
        b=eedX1BH9ycCEbsDVhYl34gq7JS9Nc8PcT2mj5iHq8DLba0UMeLIzrecoWvlcjhKl4e
         n+TppJzBEaP//rHcmavajoRjjUteuUSlSK0KHAYsrjc7iBtqpzwLr37u1DWHvjQgd4xA
         WZOZEofyF/Zvr50qm/109uyNOe2xXmKu2rN6KMEiGd12cM4xTBzYTvuVFbioihCS1PNH
         vu0OT7cgHcskMODKyKzRdHfWtYK2KHArZzXi15zCAP4TMlln/8m0CTG2kE1AavahqDFQ
         IE1IeMQn0+6tdVTMubzYZ6rqqBgVUk5KEYnxx6N/UfQOkZhnQiXwb+EQuScskdsgYFrn
         SZ4g==
X-Forwarded-Encrypted: i=1; AHgh+Rpbbl2VOH6O+P9N9o+UGy2urrKQEv+J+zgDFEpP77MSLVOhe/+qEWcqlAO99jWp3TUM89vYzlPECMno1zFh20S5@lists.infradead.org
X-Gm-Message-State: AOJu0YyIeeOZZwagImj00LFtbVHeUcopKmRGDje6Y+xnIi9FiEG4bcxp
	eMipUzsPyq8DRVVDtGBG/ev1kQRiLrEzZf1/hhDAmYrzW9e0/umV/o03VYJOOzHcbk0n42jTd1m
	dgNqU/AynGZnKa+dnkKjWgo8SJsGBQOpg0GLMAJsTt/cQOtzT7PvEsXW9ESilFWztdRiI/db8La
	7KGVMgTHalxco9jGXTwYVgHtYNIk8k9ZPK/hFtvh321bbmTxkijMk=
X-Gm-Gg: AfdE7ckJrFcIj7hYgRcxGjZRXfhhZ/LwE8+zUGRbhbOP1uS/Ls516UVPoQfoNClQATf
	XoIhS8BWBsN6sZJDzGp8cFZnAfx6Ur2JQPU5ovOxfYKyqnrhs0+bF2deZU2ka8Qt3c40FRsJjcH
	3omhCnTWU7J3qokU5xEFl7hkd5WsZ9xjcusPusKpDbIawkQNimvSvVwI3CORt3Txc34f6AL0Gf+
	ym+ZAQQVe9gSd3VUl8o7+wnd2A0KXFmloonUk5eqenNrRWFHhfET2DexxQIjLbq8ZCBSg==
X-Received: by 2002:adf:f0c3:0:b0:460:3233:beef with SMTP id ffacd0b85a97d-47f46386e3fmr7594783f8f.43.1784110460623;
        Wed, 15 Jul 2026 03:14:20 -0700 (PDT)
X-Received: by 2002:adf:f0c3:0:b0:460:3233:beef with SMTP id
 ffacd0b85a97d-47f46386e3fmr7594731f8f.43.1784110460011; Wed, 15 Jul 2026
 03:14:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260708161242.1912769-1-maz@kernel.org>
In-Reply-To: <20260708161242.1912769-1-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 15 Jul 2026 12:14:08 +0200
X-Gm-Features: AUfX_mzYYojltzRopjsZWj-BSyvTHnDNy-EhsjgnxP0aoffOaIAQ3DKZpIh1JXg
Message-ID: <CABgObfbpDt2iATf=d-BiawY_41rLnYFzNiDLDx8W8c-iRCxEXA@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/arm64 fixes for 7.2, take #2
To: Marc Zyngier <maz@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Mark Brown <broonie@kernel.org>, 
	Mostafa Saleh <smostafa@google.com>, Oliver Upton <oupton@kernel.org>, 
	Sebastian Ene <sebastianene@google.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Vincent Donnefort <vdonnefort@google.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
	Will Deacon <will@kernel.org>, Steffen Eiden <seiden@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3kANtjZsGsYuoH4r-iq4UtgSzM6mtBZZ6CDlPQ_luGY_1784110461
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_031426_292971_5ACF0739 
X-CRM114-Status: GOOD (  23.35  )
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

On Wed, Jul 8, 2026 at 6:13=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrote:
>
> Paolo,
>
> Here's the second drop of KVM/arm64 fixes for 7.2. This time around,
> we have a locking issue in kvm_io_bus_get_dev(), which is only used by
> arm64, a few S2 page table fixes, a set of FFA proxy fixes for pKVM,
> and finally a very esoteric fix for emulation of sign-extended loads
> from MMIO. Not only this is rather niche, it dates back to day one of
> KVM support for 32bit ARM...
>
> Note that this is on top of the kvmarm-fixes-7.2-1 tag pull request
> posted at [1] about 12 days ago.

Yes, pulled that first and then this one.

Paolo

> Please pull,
>
>         M.
>
> [1] https://lore.kernel.org/all/20260626133526.817232-1-maz@kernel.org
>
> The following changes since commit d098bb75d14fde2f12155f1a95ec0168160867=
ce:
>
>   KVM: arm64: account pKVM reclaim against the VM mm (2026-06-22 10:48:08=
 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kv=
marm-fixes-7.2-2
>
> for you to fetch changes up to 8d187d4b33c262c0f3e44842553521151d8629e8:
>
>   KVM: arm64: Fix propagation of TLBI level in kvm_pgtable_stage2_relax_p=
erms() (2026-07-07 17:43:39 +0100)
>
> ----------------------------------------------------------------
> KVM/arm64 fixes for 7.2, take #2
>
> - Move locking for kvm_io_bus_get_dev() into the caller, ensuring
>   race-free checks that the returned object is of the correct type
>
> - Fix initialisation of the page-table walk level when relaxing
>   permissions
>
> - Correctly update the XN attribute when relaxing permissions
>
> - Fix the sign extension of loads from emulated MMIO regions
>
> - Assorted collection of fixes for pKVM's FFA proxy, together with a
>   couple of FFA driver adjustments
>
> ----------------------------------------------------------------
> Fuad Tabba (2):
>       KVM: arm64: Fix sign-extension of MMIO loads
>       KVM: arm64: selftests: Add MMIO sign-extending load test
>
> Marc Zyngier (2):
>       KVM: Move kvm_io_bus_get_dev() locking responsibilities to callers
>       KVM: arm64: Fix propagation of TLBI level in kvm_pgtable_stage2_rel=
ax_perms()
>
> Mostafa Saleh (3):
>       KVM: arm64: Fix bounds checking in do_ffa_mem_reclaim()
>       KVM: arm64: Ensure FFA ranges are page aligned
>       firmware: arm_ffa: Fix out-of-bound writes in ffa_setup_and_transmi=
t()
>
> Oliver Upton (2):
>       KVM: arm64: Ensure level is always initialized when relaxing perms
>       KVM: arm64: Only update XN attr when requested during S2 relaxation
>
> Sebastian Ene (3):
>       KVM: arm64: Validate the offset to the mem access descriptor
>       KVM: arm64: Zero out the stack initialized data in the FFA handler
>       firmware: arm_ffa: Fix Endpoint Memory Access Descriptor offset cal=
culation
>
>  arch/arm64/kvm/hyp/nvhe/ffa.c                     |  44 ++--
>  arch/arm64/kvm/hyp/pgtable.c                      |  15 +-
>  arch/arm64/kvm/mmio.c                             |   7 +-
>  arch/arm64/kvm/vgic/vgic-its.c                    |   2 +
>  drivers/firmware/arm_ffa/driver.c                 |  25 ++-
>  include/linux/arm_ffa.h                           |   9 +-
>  tools/testing/selftests/kvm/Makefile.kvm          |   1 +
>  tools/testing/selftests/kvm/arm64/mmio_sign_ext.c | 255 ++++++++++++++++=
++++++
>  virt/kvm/kvm_main.c                               |  16 +-
>  9 files changed, 331 insertions(+), 43 deletions(-)
>  create mode 100644 tools/testing/selftests/kvm/arm64/mmio_sign_ext.c
>


