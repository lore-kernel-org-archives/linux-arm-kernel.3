Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07EFC5DF7A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 19:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fSMWOgsnzrhn6WjSaQuzJQj5JGPMtb+BQqa114k3Tnc=; b=egGG3RBWDBetBGwI9DY4yA8wVd
	Xqmoyhv2XHMXvykMyonbpE/NzDo8wSfStpSbP1Jn+RXPadAydyzV5kMWnQ6/BCgdYTItEt7JB+LLH
	v4Nf8qDtrz3Xw6mj+LoiPkIGP6IVrlsULE4BHWdqMlH/Sy1Yi7ntMij/RIm5x/ZEyroF+HgKF2PzY
	F2pA/f3gl/pMaiqTy+Mc/S2tMQYPV9o4U5MxRFYgwP3auyrdKJ8DsTDSkqBCZMrHrrje73nPPF2aJ
	4nfyQpHqbolhICsPRFTReGC5vR/XYeZFQ86fO5zPIMvjvmU2VHkKeSqaRY9TNSKY/T3+3T2DkugqA
	Vnpov4Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww3QH-00000006kek-3DXI;
	Mon, 17 Aug 2026 19:55:05 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww3QE-00000006kdY-1Kil
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 19:55:04 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c15f020a223so538231566b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 12:55:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786996499; cv=none;
        d=google.com; s=arc-20260327;
        b=QEICokEG2HTxlZNL7yRJIzI2S/aAdFpZ2U0+Xbum/10DLzT84WHRdcAIS2KFc1bZVt
         Wofp4xDS9PlvX+YvdeTFdwLHsCS61PqfAi/ngWgbKe33ivfYK5SCy4IAVfuLwuCehA7K
         Us0A/iQh1rz3fmVDf7HxMa6Fbf+gZI7Yfwd2JNv9Xm5MeyMPKWUEi0jJFAYPZr3aZaVL
         o41OKNtlw0XVlUhKbsdB67PyRSEQB04NnXHh3KYCcx7M6Wf78YJE02lOyWJM8GRete1V
         cI8vEmHFsuxtYDOOWl4zZzE+Yape8ZynoZCSknX/WkJz4fiJCMZu0JWWD7XFnNmPvVw2
         2+8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fSMWOgsnzrhn6WjSaQuzJQj5JGPMtb+BQqa114k3Tnc=;
        fh=geX5CWN3pm4++LdsY8VINASbQkcIVmh+9o7kWnzioTI=;
        b=TnLEHeOkwGJtPSEsqyYKg/QF+YMyJSGA+kU63ySxHQv+FrmWJXFg9LUxiuSQtXQgjr
         dgg1jA3Ua2SQBWoJUGCbrWN8iKo2ks1ixd5Wn+F4sK6WXO4gy8NvoBhBWNVx40m1sGJx
         t/3i5Ai5qwEu9lle/BpQQc3wad5xtusvxXkLuuLoqDxyt+yJodlp/ddagDq/mr8boZ50
         QM4XcsogFzSjpysqIFabCo4J7cWUSRNDQuZWEWidhI5sLnemAvBBbUUhLSNdTAiRXHnx
         eGoN1tuRe94fVyM33zE8he+SiwW6+qM92NbhyRj2awchs1bpYv50k312FnCyQJltS+3J
         w+HA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786996499; x=1787601299; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fSMWOgsnzrhn6WjSaQuzJQj5JGPMtb+BQqa114k3Tnc=;
        b=wW/5TgXWlXP0s6JiA/d+2RbmoMk63MHWzkvYWt5X591eL4S59ne6SB588JOfAkBi56
         5QNUBKuRKfo6uACHikz+6ikgTd+hJf/KprVG1+6DZit3/sLt6Znf1MdE0zOtKvM7RPw0
         rdakWmbrxipg6wqE92u7TQZioMxkmSinHkyBWWJu/z82Yhbfa9A+8xXCcO8ThdyRg5KP
         P+JQpIynzeP3HJS5LsOElQSrpGGNV5uCFHXuDvNzVxQNt5asN3T7/AZLnkiRBgTrWJGn
         mtrLZUJzT84/mS/6Cnxjtk/X5aTKxf6hMG2mviD4El9r7j1VyMmB9CVOkT0d6WaB1SEA
         Dohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786996499; x=1787601299;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fSMWOgsnzrhn6WjSaQuzJQj5JGPMtb+BQqa114k3Tnc=;
        b=LwCWCfGHwPoA/aZC6GPfRSXcpmG9puUfJkvPjOa2IpaQBxTNoAdMe/o9d0nrJr0SHc
         VA2p3WbVhZf/89Rej1lPem9wu00PQaTkJInd3OQUHZf4kE5rOMeRe9fGj6kx5CRuU86u
         u1LGFqD1yCj6HfByqlqRA00Ckxx4Qi6S5yI2FtBqomo6tPq5NY5fDDWFouo22wmogtcj
         ZM5cSfvWm2VcW6d5Bmp6nucaNYulxF6lxgJe+wSc22wjqRKQkSpWrbWB8GknNdfDWHt8
         YodcMdcDjJur7YuKQBnDdaMoGg9UGzNmmHgbYir8Lv080FAYp5QgzG0hJ2jBUp7gB2Z6
         eTog==
X-Forwarded-Encrypted: i=1; AHgh+Rr7YE2J+9L8/k/tHzjrrH4S+LtA8MwmWcEVH1BcVrgNeI/2IKteL4kCVgAXDb27VUYasy7eXTlZWDUk9zNz9OAM@lists.infradead.org
X-Gm-Message-State: AOJu0YxgL0ixWwZIp/oZzhoTiwJI2i7AT4fJALj2Lq0ZUZh8d0Voc2PD
	Ua7LcP77mQ60+uBc3kBshW4SiejGk26/SCid4P38L3JgUwuv6VPD+PfKVvbhvgF+lMdxhaPrxdq
	vR/5avmlF723Qk3UAoMntFu1+nV4x/UyqG1xyDp3X
X-Gm-Gg: AR+sD10pC4Bl8DKySZS15Fd0ER+bGkprIaB7le3xioxT3kxyun/jd3lD4Q/b3NLbpqM
	6Pv5/lVW02+yTFjJD7vzEYTNWepEALt4CBUXnqNrMkFOxzF4JckLSTQmOH/peR9i86Gy94aYbI/
	f6iVnJ2ca4jB+y4W7qfSHT1B0OY+8V9/xgjOFbaz2E2ZL1M9NoQ2Njx9EsPawoWWzly8plEXiRM
	EbIekRHAZ8K+OAZT5h4QmVLGWSqCMjUxSvpxZrFsIjHBV/fcT/WJpN3RkMNZJLJmXXWXXuIQfNU
	EEZOT7Z2LEyoC5+WBo2xCtLxvHuV+wken9ZeO1oPxsqB0gFy7kPNKXpTJPuRGH1kE3W5IYsy/q4
	TXZ7V5uyVGT0pvg9NCUH6D870Gidr7I8NeegN4B3EDKRbGYO6CZMUH5JA
X-Received: by 2002:a05:6938:a081:20b0:c16:12ff:dc93 with SMTP id
 a640c23a62f3a-c21885d0e18mr100346666b.18.1786996498684; Mon, 17 Aug 2026
 12:54:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1786768375.git.jpoimboe@kernel.org> <e5c957d816240e749a92588d4a9bb44da791f8e3.1786768375.git.jpoimboe@kernel.org>
In-Reply-To: <e5c957d816240e749a92588d4a9bb44da791f8e3.1786768375.git.jpoimboe@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 17 Aug 2026 12:54:47 -0700
X-Gm-Features: AcwNN1X5GYhNIXFwByZPWbcQ7Kc1jXcOVcJq-v_hRwbMgl2NTJnecge5Wd_AP5Q
Message-ID: <CAKwvOd=Vn4L1sJ=8zVk9qcDLtaDYxfxn+0aG4tMrbETsqY5_PQ@mail.gmail.com>
Subject: Re: [PATCH 10/12] efi/libstub: Remove obsolete .note.gnu.property workaround
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, live-patching@vger.kernel.org, 
	Song Liu <song@kernel.org>, Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
	Mark Brown <broonie@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_125502_393019_17FFA443 
X-CRM114-Status: GOOD (  20.29  )
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

On Fri, Aug 14, 2026 at 9:45=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.org=
> wrote:
>
> Commit e2179a09ab08 ("efi/libstub: Disable -mbranch-protection") added
> --remove-section=3D.note.gnu.property to the stub objcopy invocation to
> work around a Clang bug where the note was emitted for code-less object
> files even with -mbranch-protection=3Dnone.
>
> That was fixed by LLVM commit a48f6079f288 ("[AArch64] Generate
> .note.gnu.property based on module flags") which was released with
> Clang 12.  The minimum Clang version is now Clang 17, so this workaround
> is no longer needed.
>
> On arm64, the stub also no longer builds with -mbranch-protection=3Dnone,
> as it has inherited the kernel's flags since commit 8358098b9787
> ("arm64: efi: Enable BTI codegen and add PE/COFF annotation").

I verified the above all looks correct.  Thanks for the cleanup.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Remove the workaround.  This fixes BTI on arm64, and is a no-op on
> RISC-V and LoongArch where the vmlinux generic NOTES macro discards it,
> and the x86 and ARM decompressors discard .note.* explicitly.
>
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> ---
>  drivers/firmware/efi/libstub/Makefile | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi=
/libstub/Makefile
> index b1c95f69e807d..e18e124a89acf 100644
> --- a/drivers/firmware/efi/libstub/Makefile
> +++ b/drivers/firmware/efi/libstub/Makefile
> @@ -106,12 +106,6 @@ lib-$(CONFIG_UNACCEPTED_MEMORY) +=3D unaccepted_memo=
ry.o bitmap.o find.o
>  targets                                :=3D $(lib-y)
>  lib-y                          :=3D $(patsubst %.o,%.stub.o,$(lib-y))
>
> -# Even when -mbranch-protection=3Dnone is set, Clang will generate a
> -# .note.gnu.property for code-less object files (like lib/ctype.c),
> -# so work around this by explicitly removing the unwanted section.
> -# https://llvm.org/pr46480
> -STUBCOPY_FLAGS-y               +=3D --remove-section=3D.note.gnu.propert=
y
> -
>  STUBCOPY_RELOC-$(CONFIG_X86_32)        :=3D R_386_32
>  STUBCOPY_RELOC-$(CONFIG_X86_64)        :=3D R_X86_64_64
>
> --
> 2.55.0
>


--=20
Thanks,
~Nick Desaulniers

