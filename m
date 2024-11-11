Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C240D2E9C0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 08:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DOG5n9kGdjYFBRXKXmGtUPZNkUvOHIHlcteRBUDegYU=; b=LA9YaHDiGmGMdqVsHP01lIrRFD
	lEJxR6801rfYV/ZdKqc4sHNffx2uuUj7Z99KQAqnPmhNf7zZFlm9raywPOcN55MprXlTWgRRCTA7N
	ItGhVNgHMU7//0XhgWwrGo29mXrqPJt1GE4oBpuNnXWgp3VLFTa/KTGY65Rhq53MPFm2NFwQyzWhR
	v7HBdktARhZQBAqTsW+ge1UCq8iacNU/ZpJvqDaFiOJCfaK3QIWj/9M9ZuA1m2fABo/FbBg4mWdte
	kQg3ATUV0oSiN49QAWGV8X2jJkdJZS42wuttnuudRUNc363ekY/TdmKdostCtfYKEn3g8Qo5bRqo7
	v8yPfBqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQDF-0000000Guvw-0JaK;
	Mon, 11 Nov 2024 08:55:57 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPxS-0000000GpyB-3nUH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 08:39:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4511FA4136A
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 08:37:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FE13C4CED9
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 08:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731314377;
	bh=Svcvh/rY1jnSmpFXCdN9hBXlZzrHqGl8vS6RUmUrtUY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LnRdirz3OBYS6/wXxHHqZelRYNKtYDTrcyBAtKNggcGunHCwK/uQ3/NsFpSXTpmJe
	 BH+fSVf94FN0VQA/CMaLYxKQTvW5s/JlMHT66sTVEMZ8Pd//8WhzjeAmCHIUORklXj
	 NQUWMw2W0D7QgZt7aWjI7XjswIXcGKoFDnvwv4h3yL1Wi9ZnhpfvCLUsLjj8U2XaxE
	 R/iBRhIdrlM/HicPWIZsNjERd3av9DhSktSn8oQzYUv5mfTrh+OJxba14bP/zCKpZz
	 D5rZk7xjRbErt4k3bY6QyA3R0VmNX8hhcNXpEJcfqQA+KBJ8F6THJeD0Hk2I1dAh59
	 yU5dp06CBUW5w==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fb5743074bso33113951fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 00:39:37 -0800 (PST)
X-Gm-Message-State: AOJu0Yyoh7D2573MAuyeEhGj1IpVTnkqbz4pPNJ7oVXSyqGgd/Mrs9u2
	J/LSf/pZSbi6y9cFr6R0ppAgCOMtjtalXeSRu/re3eLzzOwRz7QD3Zo6k0LC2QsZ46A+PgHgiL/
	MK/0togTFo2Ykpg2allYGN1fogVc=
X-Google-Smtp-Source: AGHT+IGRhfK3pJn2s08zCYFj6u05JLociAF4JE17jNCN68YqR66YSIPASgrhJW0KopL85g6zjd9e1MDED9Ex42RLeM4=
X-Received: by 2002:a2e:b88f:0:b0:2ef:28ed:1ff5 with SMTP id
 38308e7fff4ca-2ff1f4a936cmr40599821fa.15.1731314375525; Mon, 11 Nov 2024
 00:39:35 -0800 (PST)
MIME-Version: 1.0
References: <20241111083544.1845845-8-ardb+git@google.com>
In-Reply-To: <20241111083544.1845845-8-ardb+git@google.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 11 Nov 2024 09:39:24 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHunVLcREwCJ0cZD7Xu0YjDoL2vGPMtVA96XUVbzqzMAQ@mail.gmail.com>
Message-ID: <CAMj1kXHunVLcREwCJ0cZD7Xu0YjDoL2vGPMtVA96XUVbzqzMAQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] arm64: Clean up and simplify PA space size handling
To: Ard Biesheuvel <ardb+git@google.com>, Quentin Perret <qperret@google.com>
Cc: linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_003939_100636_106542EB 
X-CRM114-Status: GOOD (  20.48  )
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

(cc Quentin)

On Mon, 11 Nov 2024 at 09:35, Ard Biesheuvel <ardb+git@google.com> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> This series addresses a number of buglets related to how we handle the
> size of the physical address space when building LPA2 capable kernels:
>
> - reject 52-bit physical addressess in the mapping routines when LPA2 is
>   configured but not available at runtime
> - ensure that TCR.IPS is not set to 52-bits if LPA2 is not supported
> - ensure that TCR_EL2.PS and DS match the host, regardless of whether
>   LPA2 is available at stage 2
> - don't rely on kvm_get_parange() and invalid physical addresses as
>   control flags in the pKVM page donation APIs
>
> Finally, the configurable 48-bit physical address space limit is dropped
> entirely, as it doesn't buy us a lot now that all the PARange and {I}PS
> handling is done at runtime.
>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Kees Cook <keescook@chromium.org>
>
> Ard Biesheuvel (6):
>   arm64/mm: Reduce PA space to 48 bits when LPA2 is not enabled
>   arm64/mm: Override PARange for !LPA2 and use it consistently
>   arm64/kvm: Configure HYP TCR.PS/DS based on host stage1
>   arm64/kvm: Avoid invalid physical addresses to signal owner updates
>   arm64: Kconfig: force ARM64_PAN=y when enabling TTBR0 sw PAN
>   arm64/mm: Drop configurable 48-bit physical address space limit
>
>  arch/arm64/Kconfig                     | 37 ++------------------
>  arch/arm64/include/asm/assembler.h     | 14 +++-----
>  arch/arm64/include/asm/cpufeature.h    |  3 +-
>  arch/arm64/include/asm/kvm_pgtable.h   |  3 +-
>  arch/arm64/include/asm/pgtable-hwdef.h | 12 +------
>  arch/arm64/include/asm/pgtable-prot.h  |  7 ++++
>  arch/arm64/include/asm/pgtable.h       | 11 +-----
>  arch/arm64/include/asm/sparsemem.h     |  4 ++-
>  arch/arm64/include/asm/sysreg.h        |  6 ----
>  arch/arm64/kernel/cpufeature.c         |  2 +-
>  arch/arm64/kernel/pi/idreg-override.c  |  9 +++++
>  arch/arm64/kernel/pi/map_kernel.c      |  6 ++++
>  arch/arm64/kvm/arm.c                   |  8 ++---
>  arch/arm64/kvm/hyp/pgtable.c           | 37 ++++++++------------
>  arch/arm64/mm/init.c                   |  2 +-
>  arch/arm64/mm/pgd.c                    |  9 ++---
>  arch/arm64/mm/proc.S                   |  2 --
>  scripts/gdb/linux/constants.py.in      |  1 -
>  tools/arch/arm64/include/asm/sysreg.h  |  6 ----
>  19 files changed, 62 insertions(+), 117 deletions(-)
>
> --
> 2.47.0.277.g8800431eea-goog
>

