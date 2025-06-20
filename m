Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4357CC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 17:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M1ekRqR8sclf5kjPGwfD2Er+4fHOBAml7GmI5iGuA8A=; b=TnuqYeSK7o0Ppu3dEMrU5TyEf+
	z8hpyhGB47ZAUMOWIRDOgJhLoAFWYvX2gcUsyWrOJZya4YfkHzD++ynqvgGq8cqWFJbp+C2uPk5X1
	SL5AZMuKjogHz2LhNKygHjGyWSFUNGRe1nnklMSjTyaAjgPmEu3ziQZHbKCMmJz+akRS8yDKU2I8k
	TO/ciKmFG+NB7/cxCcir+xjmtZy6zT+soeMqA4R5ZMzWMJJcGAy9rDvk2a60AN86WLK/EyO2zGOqK
	Jfnyi4GOWUzNemrpKVkYT+aSrzg8zx4c0I2JNHUyIVl4Ue0akpzluuqyB6YNu226ru8zZ8tEKq03u
	2iXbwrFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSfHj-0000000GCvQ-446n;
	Fri, 20 Jun 2025 17:12:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSfFE-0000000GCei-0QqD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 17:09:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750439379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M1ekRqR8sclf5kjPGwfD2Er+4fHOBAml7GmI5iGuA8A=;
	b=THW2dfTP0j72CzdP911Gv3V4olkujWPWalLca47wDz+94PfNNISAaFQ/8sWpYpGUhV+Kda
	wBTJBbXKM+aapTBGBuSxD2ZJzwN4tqiXP8tckj5seOsro290xshlsE9VY03cZl+KlxyRGf
	w5r/izVgaedMjfC4KmvSnBk5t+FMvcc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-mKimXP4YNOqyLRYnvWg8Gw-1; Fri, 20 Jun 2025 13:09:37 -0400
X-MC-Unique: mKimXP4YNOqyLRYnvWg8Gw-1
X-Mimecast-MFC-AGG-ID: mKimXP4YNOqyLRYnvWg8Gw_1750439376
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-451d5600a54so15951865e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 10:09:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750439376; x=1751044176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M1ekRqR8sclf5kjPGwfD2Er+4fHOBAml7GmI5iGuA8A=;
        b=kDQeiDEl8P5bcNG8D2J670z6ip8qlE3JDgf601oWb6M9ZJUo95sxW6ntnl5iRZ6kDh
         KYduSlpnYavdpNf06kW7dGsYATIy8cp6tc2EyamRNnIehwPx1+Z0tEI9i5fKbzBi4rDZ
         QxyDLD+kNfHiIoNS0+RPWtxjiyVvMPZU3RGvVbdz+RyPgLQ47iapznkhD0KmGhuVWW2K
         +wHZe/+DFYoC2cf6xLDe3vD5GPtmIYf2MVeAgVCJrxTEHA98jd9O8vu+6e0NItiHT2ry
         K2w7mib8o8IPPFajHE1aLlRThLrexH2o9uF0FzqhndLYouFz9lVUB1idHS9SHGE9TvVz
         REqg==
X-Forwarded-Encrypted: i=1; AJvYcCVbHzwsxs7p3Sh6bEodESvhMSwtuUHrEr7N3gUxyAPtLej7Pb7Za8HVBOlwAhEe0Z+rDdVaK7dDDYT9zurzCX3b@lists.infradead.org
X-Gm-Message-State: AOJu0Yyrg3g+QpRFHRAbGZwk41fUCJW3RFc20mUYJxCZLBofNm/DDVi2
	83StVXQQBgutIeAK1ejvMTjHvNbQN15ZT2syys0zABH+lcXOiRrHi5fX+ZoSbhmd9LwJSI6KBUl
	u21bdNhkilS22qNVc5DzpmYi4jPsiUx8k9AjtEpby0pwBR29Qu3RKsFIoNM00mdCIWjJ6V26PWh
	uGRvadvjQXYNN5/KsjXO7yTxbOoKCG1Q0czk6klRzVZRD8x8MOPYo=
X-Gm-Gg: ASbGncuCVKg3UNYD5TY67hWBCxUvAHR5UNkcMXFJuJ9N75DX13DGnGZzndkK+WwYStx
	zUqJKlrefDyKieaWHudf6L6tcvZAyiq9bEgv3qCN4LHFQme3AYOkB3orap3j8tLKK4uH7R9uQj+
	oVk8E=
X-Received: by 2002:a05:6000:481e:b0:3a4:fb33:85ce with SMTP id ffacd0b85a97d-3a6d130cb6cmr3215814f8f.46.1750439375709;
        Fri, 20 Jun 2025 10:09:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIC2N1+6qyCY+73jGybmhqG2lkoyl7bI3OfwoPqdXTWp1p58WQ3hVSE1JBPnpkmVDoWah0q9odmoL6/U/X/s0=
X-Received: by 2002:a05:6000:481e:b0:3a4:fb33:85ce with SMTP id
 ffacd0b85a97d-3a6d130cb6cmr3215780f8f.46.1750439375305; Fri, 20 Jun 2025
 10:09:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250619130049.3133524-1-maz@kernel.org>
In-Reply-To: <20250619130049.3133524-1-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 20 Jun 2025 19:09:23 +0200
X-Gm-Features: Ac12FXyeUmiA3r9jYilzHr01DzOSd5DLfk5ROg5WkKSbcqmWMU5McoHSJ-zkNws
Message-ID: <CABgObfZ=9ZEJ8ouESTVfRiRLrQpyURo7pe04OBDgfwbjz6q9eQ@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/arm64 fixes, take #3
To: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Fuad Tabba <tabba@google.com>, 
	Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Miguel Luis <miguel.luis@oracle.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Sean Christopherson <seanjc@google.com>, Sebastian Ott <sebott@redhat.com>, 
	Wei-Lin Chang <r09922117@csie.ntu.edu.tw>, Will Deacon <will@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MZUuY0_jkwbPPrx52uxP6ZQPxS4usrWxMtTCgpRX7Gs_1750439376
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_100940_219656_FE61EC27 
X-CRM114-Status: GOOD (  18.57  )
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

On Thu, Jun 19, 2025 at 3:01=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrote=
:
>
> Paolo,
>
> Here's the third set of KVM/arm64 fixes for 6.16. The most notable
> thing is yet another batch of FP/SVE fixes from Mark, this time
> addressing NV, and additionally plugging some missing synchronisation.
> The rest is a mix of interrupt stuff (routing change, mishandling of
> shadow LRs) and selftest fixes.
>
> Please pull,

Done, thanks.

Paolo

>         M.
>
> The following changes since commit e04c78d86a9699d136910cfc0bdcf01087e326=
7e:
>
>   Linux 6.16-rc2 (2025-06-15 13:49:41 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kv=
marm-fixes-6.16-3
>
> for you to fetch changes up to 04c5355b2a94ff3191ce63ab035fb7f04d036869:
>
>   KVM: arm64: VHE: Centralize ISBs when returning to host (2025-06-19 13:=
34:59 +0100)
>
> ----------------------------------------------------------------
> KVM/arm64 fixes for 6.16, take #3
>
> - Fix another set of FP/SIMD/SVE bugs affecting NV, and plugging some
>   missing synchronisation
>
> - A small fix for the irqbypass hook fixes, tightening the check and
>   ensuring that we only deal with MSI for both the old and the new
>   route entry
>
> - Rework the way the shadow LRs are addressed in a nesting
>   configuration, plugging an embarrassing bug as well as simplifying
>   the whole process
>
> - Add yet another fix for the dreaded arch_timer_edge_cases selftest
>
> ----------------------------------------------------------------
> Marc Zyngier (1):
>       KVM: arm64: nv: Fix tracking of shadow list registers
>
> Mark Rutland (7):
>       KVM: arm64: VHE: Synchronize restore of host debug registers
>       KVM: arm64: VHE: Synchronize CPTR trap deactivation
>       KVM: arm64: Reorganise CPTR trap manipulation
>       KVM: arm64: Remove ad-hoc CPTR manipulation from fpsimd_sve_sync()
>       KVM: arm64: Remove ad-hoc CPTR manipulation from kvm_hyp_handle_fps=
imd()
>       KVM: arm64: Remove cpacr_clear_set()
>       KVM: arm64: VHE: Centralize ISBs when returning to host
>
> Sean Christopherson (1):
>       KVM: arm64: Explicitly treat routing entry type changes as changes
>
> Zenghui Yu (1):
>       KVM: arm64: selftests: Close the GIC FD in arch_timer_edge_cases
>
>  arch/arm64/include/asm/kvm_emulate.h               |  62 ---------
>  arch/arm64/include/asm/kvm_host.h                  |   6 +-
>  arch/arm64/kvm/arm.c                               |   3 +-
>  arch/arm64/kvm/hyp/include/hyp/switch.h            | 147 +++++++++++++++=
++++--
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c                 |   5 +-
>  arch/arm64/kvm/hyp/nvhe/switch.c                   |  59 ---------
>  arch/arm64/kvm/hyp/vhe/switch.c                    | 107 ++-------------
>  arch/arm64/kvm/vgic/vgic-v3-nested.c               |  81 ++++++------
>  .../selftests/kvm/arm64/arch_timer_edge_cases.c    |  16 ++-
>  9 files changed, 215 insertions(+), 271 deletions(-)
>


