Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF82CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 10:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1r8iNDwZiaBP/vjXiAImEcIzE/V77CaDhl9Jn5aHp7c=; b=2028PY5+7KN913H/3ObhWcZ9i0
	aERK2RgpkuiDb6snlnPFs0zbCYaaldivhInoQgE1YhBGvXc/qX9b1fBSLnQfdzXplRcwFiToD/0fq
	17I3AHGJhtsBKdJwX52+tIS+z2ZMwz4E68GGDCJvZRv9Seh5rbHtuQ7B+1xLz0i1kRfvngCEvdFZO
	Ml9J0ZCa49J9aCgdwV42sF9ANudlJQTsfcf9803QbELYCZjpA6vV2wknJq5r1M/8Vs9qtan0FnaNI
	zqYjj0QaCLzy7JHBHhp5UMRMtEkPVsXLVvfRceVQLWdh4cLLt8jIojwlXCrrmgdiUIJ4BMcKCLK4r
	GQe+8qCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ4w0-0000000E4Ol-43Tw;
	Mon, 15 Jun 2026 10:52:52 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ4vx-0000000E4O3-1w8O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 10:52:51 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-5177d1ff061so44701cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 03:52:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781520768; cv=none;
        d=google.com; s=arc-20240605;
        b=cm1YOaNPsHwRN5PHdx2rj56Vl3bEF1iBRd10V+8YYYEc2aoxYujxR0fcnHVlsF9UxS
         7MHJWuh8aUBHou4MItXcZy2B+vPIJ19v6lKhZnadMm/XTyIBICUeQkKBt2tlQ34PJxvk
         lhhIi34Q9EtLaXumZB013mBxc2yAddSuaYVFjtbJ1BCfUv2/eMc5/oO/LIDU6KB2CqFV
         X0/ViwE+9gLFVcn36rc6YMwfxa7XrpKWjCCMCPS2V8flQ9j5ny0EgyAA3cFDXeT05bIm
         zb9dRjXlj7GprvKr3woIZ1jNc086Xmf6Lt51ZEaQGNNMA17VMAyj2xw6NHMLwGGP9TSF
         yxHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1r8iNDwZiaBP/vjXiAImEcIzE/V77CaDhl9Jn5aHp7c=;
        fh=ZZo/14WCaJc1eo1YRAzTx+KWinQ+R1agd9BfNYRebKg=;
        b=A5b2WGOjDAGhCrLUedcgtoaXeCXMrfC16iMAf6oR11Yqk6zEdhW9gifX5TTJM0xw7L
         7muABKtr2XYu4XPSLCxwHgYI/FLySnFBcBHtFQnvlzn2FslTouDp0Nma0dEbM1L3jogg
         JsuuBjgSlBSpng+oEu+8C2lnM+gLA0dPKDP2HwtAZv4rQrLbdGAwt0hEwn1oUV1cJJmv
         8P3LtewM8Mgm/SYs3iJ912FS2RWeCaq3UaHPh3GteKMurRvf0tdZJ6gZ+7c1TqNsEoPK
         MYv39NSjjgJhXlkAE1lSYjDeYuONy5BCiUJLH5xPD03OQyr/eWQ7UC4Eow8OO+S323X4
         GHdw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781520768; x=1782125568; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1r8iNDwZiaBP/vjXiAImEcIzE/V77CaDhl9Jn5aHp7c=;
        b=RJjU1bUuQYIy0g1C8rdCx1vdlIY/gLZCrKqRXdjBKLA73byo6skWQ8LhKtglzMFwPZ
         psxNwO1UShWIeE7jUeMTQMc3qiNvjvYFZQNGaLaBcozKgjEJa+nM7X0aaNl8FmAtjp4P
         EtWTS21ubCGWlsX+d9eKB8z7xGPFRhhywJm7rfZlfzgpM7BderShw3Ve5NIqiAijkp1O
         q5uLJkh1G6SHfW9b6oJ8haSXApiE7AZcIXk75vp98C8EVnmYUyWaRng2wgbH2UHEa4Ar
         WwUZdULeNNcHUjcxrOF+L3E8zxjiM9TxsNU1l2o+lbqzrI8L6GOXcJ9fr0GCbR13ceRB
         3bBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781520768; x=1782125568;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1r8iNDwZiaBP/vjXiAImEcIzE/V77CaDhl9Jn5aHp7c=;
        b=qMd6Z859UWqhLlgS/fVMhf9toC91NG/GR0GknOS/eaMzx1OnlxKcnRnHwNaBO72vHG
         In6v/opNmIvWIaEiHHsPHSIl7gcxEOo8Y1zhKGkocuE2W/vPRiZNlkBrVjEAGOUIEEpI
         G3i9k3fKO+Vakc5TxnIEiHj69C6Fl5+IDgtYqfiZlB8ur+mZ8fCkb8XtuJlxdWTcQWuz
         7pRTqJRgeM1T7D2Gl735hkSppkebrX7RM7xnsxSzMIKG8VajVqKbjV/KrvrgFzAC6Fgg
         sd11Tt4OoAvpmQwN+LxHHKuCL1VgkzGfqa6wK1gCXZASKbkMMaEwgIurCT7r6gpGHzOe
         Nj9Q==
X-Forwarded-Encrypted: i=1; AFNElJ8jdWiVyNLE7hPNq/ctVjFKxTmpQtA3jZw2YuUiesIilnL2+spSI3Xe3ObbeukhEPwG4T0k8pztUZag6S/f8V2r@lists.infradead.org
X-Gm-Message-State: AOJu0YwQ3LtX/MW6HNDA25zr57XCFbhQ8oEv2cXAK0s0fVy7QK8hKuCX
	X0gXU/ByRtE2PXmlTFrHsqNbOyzq+1sRcmTbWzlSsLCRJgmFp/VCA2ZMfJ4uSZFFMLSH9WADiwx
	t4n9rW28wtwUp3RSc/Tu5LNlwIZjnEQh9v1nhgomz
X-Gm-Gg: Acq92OEHbVvT31H62buqNj4EFA2exWmw+h1afR1LS904Zfh1LqgF6JWj6iEbf+lCKYu
	C6nio7gJ2hjsV2C6rqQNRYG7bCjZhpG+PBBzctKkmdIkppOrO9vvSNlR0DBwcroXMJQ4nKNIuHA
	I7BRVBzjfbWisAlCQxtBaHZ5Sl4hHIQsvrdd3HmKKUDhJhM9IhblFj3S3vd0hTNvepdNpTN+RY6
	KWoFpJBF7ZdQe/aeZ/CXYn0pTpIZ/JKm8lckwTva+GTBCY0IgHZJmcT6rUmtT+0FXxo43OuBB7F
	vM2CjTo9
X-Received: by 2002:a05:622a:a591:b0:517:5c70:46bd with SMTP id
 d75a77b69052e-5198734032cmr691851cf.11.1781520767462; Mon, 15 Jun 2026
 03:52:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260612113414.1022901-1-tabba@google.com> <ai_OevUNS-OACPm7@willie-the-truck>
In-Reply-To: <ai_OevUNS-OACPm7@willie-the-truck>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 15 Jun 2026 11:52:10 +0100
X-Gm-Features: AVVi8CdfyuPqDix51ILtu6yDx2NBgsZ4oN-79QG39qHjrQ7hNaohULwLcTkOYSc
Message-ID: <CA+EHjTyMOoCLQ7d6+TgkrnOJF-PV9K-BKtb4CNuAg8p4gtg6wg@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Sync SPSR_EL1 when injecting an exception
 into a pVM
To: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Sascha Bischoff <Sascha.Bischoff@arm.com>, Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_035249_509116_CA0D9005 
X-CRM114-Status: GOOD (  22.16  )
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

Hi Will,


On Mon, 15 Jun 2026 at 11:05, Will Deacon <will@kernel.org> wrote:
>
> On Fri, Jun 12, 2026 at 12:34:14PM +0100, Fuad Tabba wrote:
> > When pKVM injects a synchronous exception into a protected guest, it
> > re-enters without restoring the guest's EL1 sysregs and writes the EL1
> > exception registers to hardware by hand: ESR_EL1 and ELR_EL1, but not
> > SPSR_EL1. enter_exception64() sets SPSR_EL1 (the interrupted PSTATE)
> > only in memory, so the guest's handler reads a stale SPSR_EL1 and
> > restores the wrong PSTATE on eret.
> >
> > Write SPSR_EL1 alongside the other exception registers.
> >
> > Fixes: 6c30bfb18d0b ("KVM: arm64: Add handlers for protected VM System Registers")
> > Reported-by: sashiko <sashiko@sashiko.dev>
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/sys_regs.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> > index 8c3fbb413a06..1a7d5cd16d72 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> > @@ -268,6 +268,7 @@ static void inject_sync64(struct kvm_vcpu *vcpu, u64 esr)
> >
> >       write_sysreg_el1(esr, SYS_ESR);
> >       write_sysreg_el1(read_sysreg_el2(SYS_ELR), SYS_ELR);
> > +     write_sysreg_el1(read_sysreg_el2(SYS_SPSR), SYS_SPSR);
> >       write_sysreg_el2(*vcpu_pc(vcpu), SYS_ELR);
> >       write_sysreg_el2(*vcpu_cpsr(vcpu), SYS_SPSR);
> >  }
>
> Is SPSR_EL1 not set in enter_exception64() using vcpu_cpsr(vcpu), which
> *is* set here? I'm just a bit wary of the report, as I'd have expected
> fireworks if we weren't initialising the guest's SPSR on the exception
> injection path.

Yes, enter_exception64() sets SPSR_EL1, but only in memory:
__vcpu_write_spsr() takes the nVHE path and calls
__vcpu_assign_sys_reg(vcpu, SPSR_EL1, val), which writes
vcpu->arch.ctxt.sys_regs[SPSR_EL1] without touching the hardware
register.

In the normal nVHE entry path that memory value reaches hardware via
__sysreg_restore_state_nvhe() before __guest_enter(). But
inject_sync64() runs inside the fixup_guest_exit() loop, which
re-enters the guest directly without a sysreg restore pass. ESR_EL1
and ELR_EL1 are already written to hardware by hand for this reason
but SPSR_EL1 was missed.

I think we don't see fireworks because inject_sync64() only fires on
error paths, e.g., accesses to restricted or undefined sysregs. A
well-behaved guest shouldn't trigger these, so the stale SPSR_EL1
isn't observed.

Cheers,
/fuad

>
> Will

