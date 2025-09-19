Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D60CAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 13:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=si5H+IWkg+luK65dXJLqql9A+DmaUFJ7vhyre8e/LCE=; b=D3R6o6dgCyfKJWIsIf4KiTNurr
	KyckABzCOn73q30ry/DfCFjKtGLsweWSWmjghUiAIHHjA4ha8GTu/cM9ZI6hCgzRZQjCCrYXtc7x3
	4g9V6fWZUa779gQa7E+XMjc0WoJElUeeY3J47Cew0VreoqId+IF16A8A/c5PUwqdMLDpxGZ2em8ap
	mNnZG0NL6hUjdWZ2CsiO99ojOA+pbGZkVWiX1dWcYmG9fzghCsZ9WKkRW6BAH1e3xQ7qxeibUiU5N
	r5zeZJYMVHUv30yeXTkT//9v7EvIhQXEO6YQ3yPqPPB/v2vGi512CxyPpJWLjplIF7ERboEuxv2RJ
	MbtjP6PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzbeE-0000000337t-37oW;
	Fri, 19 Sep 2025 13:59:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzbeC-0000000337R-48I9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 13:59:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6472A601F9
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 13:59:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1235FC4CEFF
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 13:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758290376;
	bh=81q+MTaKBG8CfXjRMrYDmASQ3S/UvV9H34HP13VPEQQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GP5fByxuaEjXADf8m/MkJbtHV8GYlgKZs2keCDGTNOXPOSZc3Tx5Owtf9hgEYN7+u
	 OwTu3fEhL4vpg9b8uXXIiEImyaPZ627LLu9ASwYEUUkuHXxJZ2UMdrAFxVtxTAdWd+
	 8sgHsfjHDmhekexBpbYj9g/ba+DH/Gz1oVVeVjyqpbcEaSbaUKdp0PbHpTLn4OE6eX
	 tMXpiHgZ8u7xm2nBjgVmATisDB6Ssd0ac/wySodHxhV/noJ8w9tt/TVMPNbZaxRQ7l
	 osFkyN3BLG091FGY8RieUPc3bExcvB8j/0veZ3TtuWKBslcI/uZHt69okyRgg+XenE
	 Iaj+xoMB27GcQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-57afc648b7dso228921e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 06:59:35 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy+ES+X2bpz/rBNZKRlUdu00rHnHRZVuhJWNaPn3IWbWQ8dwJo9
	/8Dqrmt8LlGKS3Byq8gyf0lx8DaCjZwqq49oMzUF8Ch3QlSqfEMHb+kCtdqalvIK0GhZ6LHKz4v
	rvysU+Ua3A4wxuJRWNdXHnHrQdg/tvRg=
X-Google-Smtp-Source: AGHT+IE2JsaESq2LH0BwFhzGZicRptZYyiQAutqhKUmtEukYJlEAcmn6+ZMx9m5iDT8EwVZIVletlt8bWMjmPNl4PYY=
X-Received: by 2002:ac2:4e0a:0:b0:56b:8c56:f590 with SMTP id
 2adb3069b0e04-579e1b69156mr1267187e87.7.1758290374310; Fri, 19 Sep 2025
 06:59:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250919122321.946462-1-abarnas@google.com> <20250919122321.946462-2-abarnas@google.com>
In-Reply-To: <20250919122321.946462-2-abarnas@google.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 19 Sep 2025 15:59:21 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEVThBdH7H7NX+Ma8j0_85GevzczFgvvozK-TsqT2geFw@mail.gmail.com>
X-Gm-Features: AS18NWBXGy-3dQXH8iKb7BJvegBRmMgS6hSgacUSgWyOsOJxDrJciKIzKDkVygo
Message-ID: <CAMj1kXEVThBdH7H7NX+Ma8j0_85GevzczFgvvozK-TsqT2geFw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arch: arm64: Fail module loading if dynamic SCS
 patching fails
To: =?UTF-8?Q?Adrian_Barna=C5=9B?= <abarnas@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Dylan Hatch <dylanbhatch@google.com>, Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi,

On Fri, 19 Sept 2025 at 14:23, Adrian Barna=C5=9B <abarnas@google.com> wrot=
e:
>
> Disallow a module to load if SCS dynamic patching fails for its code. For
> module loading, instead of running a dry-run to check for patching errors=
,
> try to run patching in the first run and propagate any errors so module
> loading will fail.
>
> Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
> ---
>  arch/arm64/include/asm/scs.h      |  2 +-
>  arch/arm64/kernel/module.c        |  6 ++++--
>  arch/arm64/kernel/pi/map_kernel.c |  2 +-
>  arch/arm64/kernel/pi/patch-scs.c  | 15 +++++++++++----
>  arch/arm64/kernel/pi/pi.h         |  2 +-
>  5 files changed, 18 insertions(+), 9 deletions(-)
>
> diff --git a/arch/arm64/include/asm/scs.h b/arch/arm64/include/asm/scs.h
> index a76f9b387a26..ffcfcda87f10 100644
> --- a/arch/arm64/include/asm/scs.h
> +++ b/arch/arm64/include/asm/scs.h
> @@ -53,7 +53,7 @@ enum {
>         EDYNSCS_INVALID_CFA_OPCODE              =3D 4,
>  };
>
> -int __pi_scs_patch(const u8 eh_frame[], int size);
> +int __pi_scs_patch(const u8 eh_frame[], int size, bool is_module);
>

Calling the parameter 'is_module' puts the policy in the SCS patching
code, which now has to reason about how patching a module differs from
patching other code.

So I'd prefer to call this 'two_pass' or 'dry_run' or whatever, where
setting it guarantees that when an error is returned, no function will
be left in an inconsistent state.

>  #endif /* __ASSEMBLY __ */
>
> diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
> index 40148d2725ce..5d6d228c6156 100644
> --- a/arch/arm64/kernel/module.c
> +++ b/arch/arm64/kernel/module.c
> @@ -484,10 +484,12 @@ int module_finalize(const Elf_Ehdr *hdr,
>         if (scs_is_dynamic()) {
>                 s =3D find_section(hdr, sechdrs, ".init.eh_frame");
>                 if (s) {
> -                       ret =3D __pi_scs_patch((void *)s->sh_addr, s->sh_=
size);
> -                       if (ret)
> +                       ret =3D __pi_scs_patch((void *)s->sh_addr, s->sh_=
size, true);
> +                       if (ret) {
>                                 pr_err("module %s: error occurred during =
dynamic SCS patching (%d)\n",
>                                        me->name, ret);
> +                               return -ENOEXEC;
> +                       }
>                 }
>         }
>
> diff --git a/arch/arm64/kernel/pi/map_kernel.c b/arch/arm64/kernel/pi/map=
_kernel.c
> index 0f4bd7771859..7187eda9e8a5 100644
> --- a/arch/arm64/kernel/pi/map_kernel.c
> +++ b/arch/arm64/kernel/pi/map_kernel.c
> @@ -98,7 +98,7 @@ static void __init map_kernel(u64 kaslr_offset, u64 va_=
offset, int root_level)
>
>                 if (enable_scs) {
>                         scs_patch(__eh_frame_start + va_offset,
> -                                 __eh_frame_end - __eh_frame_start);
> +                                 __eh_frame_end - __eh_frame_start, fals=
e);
>                         asm("ic ialluis");
>
>                         dynamic_scs_is_enabled =3D true;
> diff --git a/arch/arm64/kernel/pi/patch-scs.c b/arch/arm64/kernel/pi/patc=
h-scs.c
> index 55d0cd64ef71..78266fb1fa61 100644
> --- a/arch/arm64/kernel/pi/patch-scs.c
> +++ b/arch/arm64/kernel/pi/patch-scs.c
> @@ -225,7 +225,7 @@ static int scs_handle_fde_frame(const struct eh_frame=
 *frame,
>         return 0;
>  }
>
> -int scs_patch(const u8 eh_frame[], int size)
> +int scs_patch(const u8 eh_frame[], int size, bool is_module)
>  {
>         int code_alignment_factor =3D 1;
>         bool fde_use_sdata8 =3D false;
> @@ -276,12 +276,19 @@ int scs_patch(const u8 eh_frame[], int size)
>                                 return EDYNSCS_INVALID_CIE_SDATA_SIZE;
>                         }
>                 } else {
> +                       /*
> +                        * For loadable module instead of running a dry r=
un try
> +                        * to patch scs instruction in place and trigger =
error
> +                        * if failed, to prevent module loading.
> +                        */

Move this comment to the module loader, and explain why the two pass
approach is not needed in this case.

>                         ret =3D scs_handle_fde_frame(frame, code_alignmen=
t_factor,
> -                                                  fde_use_sdata8, true);
> +                                                  fde_use_sdata8, !is_mo=
dule);
>                         if (ret)
>                                 return ret;
> -                       scs_handle_fde_frame(frame, code_alignment_factor=
,
> -                                            fde_use_sdata8, false);
> +
> +                       if (!is_module)
> +                               scs_handle_fde_frame(frame, code_alignmen=
t_factor,
> +                                                    fde_use_sdata8, fals=
e);
>                 }
>
>                 p +=3D sizeof(frame->size) + frame->size;
> diff --git a/arch/arm64/kernel/pi/pi.h b/arch/arm64/kernel/pi/pi.h
> index 46cafee7829f..4ccbba24fadc 100644
> --- a/arch/arm64/kernel/pi/pi.h
> +++ b/arch/arm64/kernel/pi/pi.h
> @@ -27,7 +27,7 @@ extern pgd_t init_pg_dir[], init_pg_end[];
>  void init_feature_override(u64 boot_status, const void *fdt, int chosen)=
;
>  u64 kaslr_early_init(void *fdt, int chosen);
>  void relocate_kernel(u64 offset);
> -int scs_patch(const u8 eh_frame[], int size);
> +int scs_patch(const u8 eh_frame[], int size, bool is_module);
>
>  void map_range(u64 *pgd, u64 start, u64 end, u64 pa, pgprot_t prot,
>                int level, pte_t *tbl, bool may_use_cont, u64 va_offset);
> --
> 2.51.0.534.gc79095c0ca-goog
>

