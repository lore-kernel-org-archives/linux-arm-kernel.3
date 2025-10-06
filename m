Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F333ECCA470
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 20:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q8V0yIbCBU4l3p3huuI3RtMNLSrVp8r2d5YucwI2B0g=; b=ZGhbk+zZQehxgAwKUm8tPuazwe
	hpkpjeVuaNsnjyusraBa3odUMMF9fWJaXMUTxO8Aif227e4cGzuzCgnxipZLjlD+Vf9kXk9EIiw2O
	blLgqh2vW4CjlPGZKwcrqBxdc87/vsKHkDxYhyZHGAUkvw3yR8RVsYaR8mDeIZHM1e4TNn49vhWuJ
	IIrwFDb9FuqUepTrVGQwvtlfb/XUwVRwuU2AluaaBAWskamnzxX0clCC0ZGxMTXyfwao9QWykrMTC
	NJfjFyqzTR8EyWjT9WVpYb4y6ZaaWBW7a2yL9RDOxd53Iv7x7d92j/IcCatH/O6dNt2YHC4FrVrsb
	/O4jQuqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5rNC-00000000hRu-3IBp;
	Mon, 06 Oct 2025 19:59:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5rNA-00000000hR4-03Iv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 19:59:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 332E3403E3
	for <linux-arm-kernel@lists.infradead.org>; Mon,  6 Oct 2025 19:59:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 153BAC4CEFE
	for <linux-arm-kernel@lists.infradead.org>; Mon,  6 Oct 2025 19:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759780789;
	bh=RGOjghczmBhOn629RRqeFBoH+bmWrNCvmm7l98/ereY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=f3syiBFFmJTX8U4zhWCmLfRemYi6nT3Nr0TsNcoNis6Qoh5r4Mdoa6w5gfWBPBHhJ
	 nHTBKNMHLZAWiNfHmqo8ce9AapAcjmrk+w7oLuoxwsP6i4Y3jszTCcAuyZ5b051Sh5
	 NrVphzBp23MsKCtY+R/RsC4OGMFO7+uQZFJ9kEoXe6ienz/9tF5u3jpD+xXf0urFOV
	 P5HRvMkAg5Ead/82pXoYDMmBoP3esHe/8uX6XV816zJs6hSey6bx/y60zC+z+dCKJE
	 XxYX22gkH5u64eMGBbE76BD7aM3i4NZkbb+Y+CfAWVL7r/gkqeEz2gmhWRMJroM8G3
	 MNbR44HmX3XqQ==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3696f1d5102so32400371fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 12:59:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUJhwkZGnuUtDGrOhBVFZV85SYPzouj5xlSD4EyOQ5PRjresrocI6sfh8ckg5nmZYQISbq2JtcdoCIBXP9l/R/2@lists.infradead.org
X-Gm-Message-State: AOJu0Ywt0KKkSH33n0OC6r+twHXPz9A+rGXyiV4VRLkvEwIhDD8Y1b70
	DpwN1mk5xjbpDLRP2gbnaMwW72G5vFksbcMzTOLsoIJTKX6kO+uZSC/cZIPqOggmiQ3nXBvyddY
	UM0eWTpWZnIomhp+RmYkO5/qv/zwIkgE=
X-Google-Smtp-Source: AGHT+IFCefbDSL2GYf6TgImraEUnQIVmnSoToPwmnqaXu68yMygrqwch2iehFFb+Yblt2/Ln03XrF5n8NYG5k5DfAYk=
X-Received: by 2002:a2e:bc86:0:b0:373:a93d:5b2e with SMTP id
 38308e7fff4ca-374c36ba428mr50608951fa.3.1759780787463; Mon, 06 Oct 2025
 12:59:47 -0700 (PDT)
MIME-Version: 1.0
References: <20251002210044.1726731-2-ardb+git@google.com> <5824c012-dcb2-4312-9b16-810656290831@amd.com>
In-Reply-To: <5824c012-dcb2-4312-9b16-810656290831@amd.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 6 Oct 2025 21:59:34 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHUjL7=CPz0viSBvfeX=BKNYuUkrpTizn9H1ZgJecB6cQ@mail.gmail.com>
X-Gm-Features: AS18NWCnlytWnKuUujx3FjdzntMejSYw-Dggtn3KRe_zRGRZD-JaqCeN49BKKzs
Message-ID: <CAMj1kXHUjL7=CPz0viSBvfeX=BKNYuUkrpTizn9H1ZgJecB6cQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix unsafe uses of kernel mode FPU
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, will@kernel.org, 
	catalin.marinas@arm.com, mark.rutland@arm.com, broonie@kernel.org, 
	Austin Zheng <austin.zheng@amd.com>, Jun Lei <jun.lei@amd.com>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_125952_090578_5B81F9F7 
X-CRM114-Status: GOOD (  22.41  )
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

On Mon, 6 Oct 2025 at 19:42, Christian K=C3=B6nig <christian.koenig@amd.com=
> wrote:
>
> On 02.10.25 23:00, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > The point of isolating code that uses kernel mode FPU in separate
> > compilation units is to ensure that even implicit uses of, e.g., SIMD
> > registers for spilling occur only in a context where this is permitted,
> > i.e., from inside a kernel_fpu_begin/end block.
> >
> > This is important on arm64, which uses -mgeneral-regs-only to build all
> > kernel code, with the exception of such compilation units where FP or
> > SIMD registers are expected to be used. Given that the compiler may
> > invent uses of FP/SIMD anywhere in such a unit, none of its code may be
> > accessible from outside a kernel_fpu_begin/end block.
> >
> > This means that all callers into such compilation units must use the
> > DC_FP start/end macros, which must not occur there themselves. For
> > robustness, all functions with external linkage that reside there shoul=
d
> > call dc_assert_fp_enabled() to assert that the FPU context was set up
> > correctly.
>
> Thanks a lot for that, I've pointed out this restriction before as well.
>
> Since we had that issue multiple times now would it be somehow possible t=
o automate rejecting new code getting this wrong?
>
> E.g. adding something to the DC_FP_START()/DC_FP_END() or kernel_fpu_begi=
n/end macros to make sure that they fail to compile on compolation units wh=
ere FP use is enabled?
>

Something like the below perhaps?

diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 73a10f65ce8b..d03e3705bade 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -35,7 +35,7 @@ endif

 # The GCC option -ffreestanding is required in order to compile code conta=
ining
 # ARM/NEON intrinsics in a non C99-compliant environment (such as the kern=
el)
-CC_FLAGS_FPU   :=3D -ffreestanding
+CC_FLAGS_FPU   :=3D -ffreestanding -DIN_SIMD
 # Enable <arm_neon.h>
 CC_FLAGS_FPU   +=3D -isystem $(shell $(CC) -print-file-name=3Dinclude)
 CC_FLAGS_NO_FPU        :=3D -mgeneral-regs-only
diff --git a/arch/arm64/include/asm/fpu.h b/arch/arm64/include/asm/fpu.h
index 2ae50bdce59b..1297e660bd89 100644
--- a/arch/arm64/include/asm/fpu.h
+++ b/arch/arm64/include/asm/fpu.h
@@ -8,8 +8,10 @@

 #include <asm/neon.h>

+#ifndef IN_SIMD
 #define kernel_fpu_available() cpu_has_neon()
 #define kernel_fpu_begin()     kernel_neon_begin()
 #define kernel_fpu_end()       kernel_neon_end()
+#endif

 #endif /* ! __ASM_FPU_H */

