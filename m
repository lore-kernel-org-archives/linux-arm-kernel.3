Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D21CD41D50
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 14:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LSd8N+GnU3kOnAVY+f16uUov3Vq7sUiHBSfthzax8S4=; b=Q7S48tu2eZsv+MajRc47gNF3gx
	s9KG3aHCqvuaWsb2oKgwk2W9rPnRRsrfHdF6PqmRH0IOVZtX4G7j3gSI6G/k0hIJkLMgyXyxHnFOk
	1DSHh54d8++qlBH4l76DLvoNyP3Mp/KxLxuDBI8D5xt7vo9Npsw4Hr5Sa/PdlhN2TELA2EZgfdp4N
	JS5ajjm0uyIva8V5rMU+E4FZZOpYnSFw34ymrcOLRf+jk5bGsXj6JQUI0c/nHBnoMrQ7sAeRpl01q
	YybY7WCgDUTkQdvW7QdpDqbw3gH/DPcf0BuPnpimDE6w0qSKetoVHLmTSa3/idFr++JlaaCKXkINi
	acNW9TKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTi5c-0000000GkJn-30E4;
	Thu, 11 Dec 2025 14:56:20 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTi5Z-0000000GkJL-2OeJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 14:56:18 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4ed67a143c5so559971cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 06:56:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765464976; cv=none;
        d=google.com; s=arc-20240605;
        b=OyCLYGNVFySFyyGnd2tPqGogL5UYTqPjb764J3VM+1P9ku8Y0XpcMV/yA94sPIAQRI
         yVNrXuMwyMgk86/t+WWR4kngoOtLKNactPdhXYnv05EUepsyDzx4Z057kCeWXFKbjVfR
         Qjz22cC0vcLg6agqU9uRHFzgcMxrJhCNlcBkVFWJXjtDnd875Ar6tSPgy0dHj7u29PST
         ojoB6GI9Vusa1hCqRkFg345+q3hHzGN7zBzYfv/xevOWURufYFmnPP1ieKUlDU46Z+qd
         CBC4uRJfrYqxdqwgD5A3+JYbNEtaBEIk8l9FnADgFa0UVsUdhfXVO9cAxnGOg+hYBjH9
         s7Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LSd8N+GnU3kOnAVY+f16uUov3Vq7sUiHBSfthzax8S4=;
        fh=obmzFLdr3KAMCI7XrhadC7uNe+bg8CDXij6GNFSNnDg=;
        b=TTaJx2T5pJhgmLOkya+KIXf/6ZfHMdsCRb23Hpk9QnXGF0aMvYlRzgFNcV5S7ays/v
         s/aClVXoC57COdJlodmbwL/iLsT5UruuYwF85JLQE5GfSDc2J8+NU9NBTdcjIuL9a1Zu
         0svOGmqGSy8/VJ5lDQnlln6rMdc+XePDSf5fZqLEphEtVCHWbrVFFdq0jEK0a7NMYCgL
         k0ytMi83DJtQfaHaxnRilLh/ek/63VSAABJfgRQZpnX8Xqnkjopvd1cIagY2JbZXvz9R
         5mzMUyVj8pKj864b/VEZ5zFbMRk+5uzGKoCT+UGzsQr09kjV4iqn2TJ5q/YnO4jrds74
         foSQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765464976; x=1766069776; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LSd8N+GnU3kOnAVY+f16uUov3Vq7sUiHBSfthzax8S4=;
        b=SF06n+nG41HiGxduipANDaR1su/SOkMD5fOYnBD0pIguMJUJfrGZGAwFRG4QBhLzI0
         UEtxZonkdLhS59Ur50Zg0OZ2UisCMFvy1eeWJukf23B4wHdWPmagafnJGeFJL4a6PGsy
         GgwGUon4Vwn+jtNbh4fM/Pe3nE+We7cwd1ABDpwvt3Awo0I8uAAYApAo7ycXDoH3/fhi
         o/c+73StewxwpEbh+crgNla5xDQDA/ybRMaMDKuvoed43fS/zxbADL5kS18mD65KEsbA
         2/VDFfDvEzyZBgFGJnKY7g0N9KInpE5juiJV0LOoQOyZKJCTz4G2Rmii38y40+RCByoL
         bvSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765464976; x=1766069776;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSd8N+GnU3kOnAVY+f16uUov3Vq7sUiHBSfthzax8S4=;
        b=rz2OBh2f0X3NI56ouAsLFaYMqmcRnCWhUkuIXeR643UpOiwIjBOcrXsJXD1U6j5I/+
         dqaUcP1PP0lfa0oGYsuo0N/DrqSYDohOcp8oogQ5Cgnkl3ZBDSEWK0F2yG+jYoNzv9j4
         UUhc7nhez8UcfM5vAKGtaOP5Scxq8RqR0hAj2cPtYTwO4mLo+x7K+c5Bky5g/MF7mrRk
         At16c5ViFwLDxkJoELKFqJZ5BqMKOdFmxPZBa/Kg1RTlz5vmyzQ+Mt2vqNowRoF4wO7S
         d0Cf87REZMrE1gyTmlgMaPVFcVe0nANbI39n+Swzo5dpscJx1OqaHXO1XgptSnRWCKoN
         CJsg==
X-Forwarded-Encrypted: i=1; AJvYcCVmgGeLGY9VC/+aZWxfT4KnRbiorNsucHcmb/uHGFXYcmzNnzOiym0NIxS+DK4qtLIXVd+qpib/+rLoST+yMMGk@lists.infradead.org
X-Gm-Message-State: AOJu0YxEOoKmG/FyTiIVkUvswFUZjg6CsWsR265OKtqK2JffncLqHQ+o
	lsOxV+jIPHwZeogPS4595ayXwN+8JRnq227NN+WUMH7GG6QvigRUDhVROU9YCPPfuUrImQDmiHX
	AyZOutMLYnWYlgEZdRBfCEH73euGGPwsDC6n9Qmy1HLUpkCtNaszy3mzE
X-Gm-Gg: AY/fxX4JG9Pd49kmJtJY68o9R9z+Utc9g5kLh8E+rOElYo/jKlApkdCx1SPizCZ01Ej
	M0O0F8GaLIzIQ+5gRz82orPABWiW3uqFnp53WF1ve4D5Wudk/qrcJGR6kyos/e1Qax1Yt4Omahm
	M0xQzynxOcDoC8GudkiZSSt+Y7UWoMq3+wBBL5vQNoNArkh8QO2Thf4M/CemoNgLBX7wz3odLch
	zIJOCqHgBEfF/OSVWzfVXfhZ9ajDnkIo+9dJmikaZZgp3T/EjX0TLvQHMr6y3w5pnvTdCSF
X-Google-Smtp-Source: AGHT+IFgjwqJGgZa7LZD4L5r7a6kWYEP7wTy3klGGOECrWDWiCBkWZLd3nH8UUUtuYTcOmHg8w6evp1g6WqoN0gf/WI=
X-Received: by 2002:a05:622a:106:b0:4f1:b41a:a38a with SMTP id
 d75a77b69052e-4f1bed269bdmr10288581cf.3.1765464976027; Thu, 11 Dec 2025
 06:56:16 -0800 (PST)
MIME-Version: 1.0
References: <20251210173024.561160-1-maz@kernel.org>
In-Reply-To: <20251210173024.561160-1-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 11 Dec 2025 14:55:39 +0000
X-Gm-Features: AQt7F2r2xUgOLmLbDl7ihpbE251_7xooz1URlan3WSuQuzZ8uzvAyHS3-gcFwgs
Message-ID: <CA+EHjTx8LYCCY=W+ifaQ4Ny3mJ_+u0GL5T2FaKWvaX-oqVPT6A@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] KVM: arm64: VTCR_EL2 conversion to feature
 dependency framework
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Sascha Bischoff <Sascha.Bischoff@arm.com>, Quentin Perret <qperret@google.com>, 
	Sebastian Ene <sebastianene@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_065617_621277_4592F777 
X-CRM114-Status: GOOD (  14.76  )
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

Hi Marc,

On Wed, 10 Dec 2025 at 17:30, Marc Zyngier <maz@kernel.org> wrote:
>
> This is a follow-up on my VTCR_EL2 sanitisation series, with extra
> goodies, mostly as a consequence of Alexandru's patches and review.
>
> * From [1]:
>
>   - Added two patches fixing some FEAT_XNX issues: one dating back
>     from the hVHE introduction, and the other related to the newer
>     stuff in 6.19.
>
>   - Expanded the scope of the RES1 handling in DECLARE_FEAT_MAP() to
>     deal with FGTs, as we're about to get quality stuff thanks to
>     GICv5.
>
>   - Simplified the S2TGRANx detection slightly.
>
>   - Collected RBs, with thanks
>
> [1] https://lore.kernel.org/r/20251129144525.2609207-1-maz@kernel.org
>
> Marc Zyngier (6):
>   KVM: arm64: Fix EL2 S1 XN handling for hVHE setups
>   arm64: Convert ID_AA64MMFR0_EL1.TGRAN{4,16,64}_2 to UnsignedEnum
>   arm64: Convert VTCR_EL2 to sysreg infratructure
>   KVM: arm64: Account for RES1 bits in DECLARE_FEAT_MAP() and co
>   KVM: arm64: Convert VTCR_EL2 to config-driven sanitisation
>   KVM: arm64: Honor UX/PX attributes for EL2 S1 mappings

For the series, on qemu, hVHE and protected hVHE:
Tested-by: Fuad Tabba <tabba@google.com>


Cheers,
/fuad



>  arch/arm64/include/asm/kvm_arm.h     | 52 ++++-----------
>  arch/arm64/include/asm/kvm_host.h    |  1 +
>  arch/arm64/include/asm/kvm_pgtable.h |  2 +
>  arch/arm64/include/asm/sysreg.h      |  1 -
>  arch/arm64/kvm/config.c              | 94 ++++++++++++++++++++++++----
>  arch/arm64/kvm/emulate-nested.c      | 55 +++++++++-------
>  arch/arm64/kvm/hyp/pgtable.c         | 32 +++++++---
>  arch/arm64/kvm/nested.c              | 11 ++--
>  arch/arm64/tools/sysreg              | 63 ++++++++++++++++++-
>  9 files changed, 217 insertions(+), 94 deletions(-)
>
> --
> 2.47.3
>

