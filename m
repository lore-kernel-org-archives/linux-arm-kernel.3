Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B59C531C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 09:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0fXT6bgGgaK9AKCq3ImfbU0yU7WjLK0dX9VTXz/R7mw=; b=yjPM8In8R+kSAhd3FVYLRSl0Jt
	a54eQEQ0UyIxTnDgCx8DDw348e9FeudmvkXjpO29L0rzfkaVrDM9iaeqs1NHewnvxZcoHUoV78Klv
	ulI08WtveKPu86h6xP13becZNaKP+9XuMrkuiaKuk3XAUa1Ywrgwv/27rT9Oj0uaG528CZEWP/e+5
	0r2aCE4PHGisHcr12zO1SYErxTpLeeDSnBWWRVfPVRLPPdYE3+RdPrGvCvktk6lZdDKxY6kyAWxoh
	+m42gBQ5z5alNvPYx6Bqyg+MV7/ltC+05Cm0Po0LLBJb9nVDJGh3MvrTF/v9bZ4etYEcJ/boy65w7
	2wfFbi0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmpX1-0000000DpNK-3cdW;
	Thu, 23 Jul 2026 09:15:55 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmpWy-0000000DpM6-2hHN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 09:15:54 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso408172b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 02:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784798152; x=1785402952; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0fXT6bgGgaK9AKCq3ImfbU0yU7WjLK0dX9VTXz/R7mw=;
        b=Cy/npQTaRfpvvBm2KGqEnT1HofnJAtTvyz1364nKCvrNc7PdABzlus4ZcuS9b8MnwW
         Z4J9XKN06PGRklt1IhnteEFCgUdVB2qzY/OJQGhbJYGOu2/sBQEyxLhbA6WwSY85M/p/
         jqEjJoDMvXI0XjlydVbhUsqNc6rCetKvUi2XR3CnQBboux0tgJW0El1S3dco7vfTniA2
         GZHBOMHrBrv5tY9MAufPFsar7N5jB7pRBWIgr80kl0I8bY78uns/KVYAOEkeqQPjzFkF
         ti1YuUg2G5FcCgGzghmPfVMXL/KNxQ6CoeFKKJmedCs/dwRQg1XtBdVK7EuVSMfSM5Fi
         AyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784798152; x=1785402952;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0fXT6bgGgaK9AKCq3ImfbU0yU7WjLK0dX9VTXz/R7mw=;
        b=eXu6EOvxp36XqZjgedAT8xv3vGIXvMDHc5uWJYQc65bsjVf2SOCw6M9CikrgMIPFBO
         sbjXrXqLGyPevMXdurTBP3xQeaeZKi+5DDzF4R+/xo1kXXuMjHe76mn6D3QNPwE5rDGu
         lkzgWdm0WHt/y/9/4Yu77nP7pXciab0k1J0DfdRVG8/X78heIUDwayJe8geLvO8G0iGS
         669m5S6/dt4EpVgkuU7qGQLVcnqCWaXNyvrxB3RwLAWiS+ZfN5FNKE2REYImmN5bE9hm
         2pM5gLR/qPlxtyG3/wEqv57AcwrhAnkYtMkdcreQQvSsszba8BLcbbyBx5fdbMGv4tEe
         FqnQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp1BGDmf6BddQfISNhTL4nVQU17N38ceoSZqEaJL/6yhiYxuMtqMAKmnJjPw8G3KfmDMrWACPCxLLoIvFMLQ64B@lists.infradead.org
X-Gm-Message-State: AOJu0Yw17wbkHW/hDSiZu2QvRMlMjm7ruiM6otmtDlqf15jsqyTmBux0
	CZ1JB5LYY3DcGhAR5QfJ3+9JfrWvx909YvQ8NvHU6uZxOiUb21585wlX
X-Gm-Gg: AR+sD13/cQXefY+9hpHzuB13NvkZ9AxbXOzLHhWpGsn0SRl2kuBIVGmMR6OzqOJabMN
	T/EOJuQnEGed/n2Zm4x3N+3LW2bnUCWcPCDB0QVMWVtZYkxGWR5U+HzEf/u1P3hoK+9nmAS1GH9
	yl1Ee0V/hXTkpxRnH7ZaoUXIZ46QvwuWuoKMLhCm+C2+HnU0GpX1T636QBJATsEUqhJSDUiEc9u
	aYUT84v3xkIuHiInk76aIa3gDCZdStjVykfqUAsQMT3m+hRUJP9H3NOHhnMdoonoG/mJyVMQgfm
	aKi39jvMfYxYMNqjJKlUPPvZ/Kw/l1vAV1O+EyWgfv1RNMCX9f5noZPMbwLmTo7Kmi8tC3OL5Se
	UDK1lzphJayzTWZyowPXMOV8+oLiH6cZ/jEVWeXU4ra08dDJg17fJJL3PPNkCfHN8aMwQr5Sa80
	jq9OQctmdjY6zzV8zledsFIb8sLr/EIw6i1YA0COBhOpAJ
X-Received: by 2002:a05:6a00:3c94:b0:845:4126:222b with SMTP id d2e1a72fcca58-84e2b8bf81fmr2868281b3a.28.1784798151685;
        Thu, 23 Jul 2026 02:15:51 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17600a72sm2738538b3a.58.2026.07.23.02.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:15:51 -0700 (PDT)
Date: Thu, 23 Jul 2026 18:15:47 +0900
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Russell King <linux@armlinux.org.uk>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, 
	"moderated list:ARM SUB-ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>, stable@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>, 
	Ard Biesheuvel <ardb@google.com>
Subject: Re: [PATCH] arm: mediatek: fix secondary CPU boot on Thumb-2 kernels
 with Clang
Message-ID: <amHYO1c-5vzqSekt@buffalo-ssd>
References: <20260722172443.534251-1-akkun11.open@gmail.com>
 <CAKwvOdnbPKoTy72EvfpKtT9Ne-r+O0j99KFX8OvjGk8ZxsuEGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOdnbPKoTy72EvfpKtT9Ne-r+O0j99KFX8OvjGk8ZxsuEGw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_021552_677711_D9BB9265 
X-CRM114-Status: GOOD (  25.28  )
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

Hi Nick,

On Wed, Jul 22, 2026 at 02:03:31PM -0700, Nick Desaulniers wrote:
> On Wed, Jul 22, 2026 at 10:25 AM Akari Tsuyukusa <akkun11.open@gmail.com> wrote:
> >
> > When building with CONFIG_THUMB2_KERNEL=y and Clang, secondary CPUs
> 
> Specifically, was LLVM=1 or CC=clang or something else used?

I used ARCH=arm LLVM=1
config is here:
https://github.com/TeamYogaBlade2/linux/blob/d7633f01ec25209fc6cdde012128b19ac336ab18/arch/arm/configs/lenovo-blade_defconfig

> > secondary_startup_arm is ARM-mode code (.arm) and, on a Thumb-2 kernel,
> > expects to be entered in ARM mode in order to switch to Thumb via the
> > standard sequence at that label. Starting in Thumb mode causes the CPU
> > to execute ARM instructions as Thumb, resulting in an immediate crash.
> >
> > Clear bit 0 of the entry address so the CPU always starts in ARM mode.
> 
> Thanks for the patch. Any idea why this isn't an issue for
> GCC+GAS+BFD? Perhaps there's a difference in the LLVM tools that we
> need to address?
> 
> There's definitely some difference between clang and GAS here.
> https://github.com/llvm/llvm-project/issues/211376
> 
> I wonder if perhaps a better machine-agnostic assembler-agnostic
> assembler-version-agnostic patch would be something like:
> 
> ```
> diff --git a/arch/arm/kernel/head.S b/arch/arm/kernel/head.S
> index f22c50d4bd41..687ee7063a73 100644
> --- a/arch/arm/kernel/head.S
> +++ b/arch/arm/kernel/head.S
> @@ -383,6 +383,7 @@ ENDPROC(__create_page_tables)
>  ENTRY(secondary_startup_arm)
>   THUMB(        badr    r9, 1f          )       @ Kernel is entered in ARM.
>   THUMB(        bx      r9              )       @ If this is a Thumb-2 kernel,
> +ENDPROC(secondary_startup_arm)
>   THUMB(        .thumb                  )       @ switch to Thumb now.
>   THUMB(1:                      )
>  ENTRY(secondary_startup)
> @@ -429,7 +430,6 @@ ARM_BE8(eor r4, r4, r5)                     @
> without using a temp reg.
>                                                 @ (return control reg)
>         ret     r12
>  ENDPROC(secondary_startup)
> -ENDPROC(secondary_startup_arm)
> 
>  ENTRY(__secondary_switched)
>  #if defined(CONFIG_VMAP_STACK) && !defined(CONFIG_ARM_LPAE)
> 
> ```
> 
> Can you perhaps help test/verify that Akari?

I tested your suggested patch and confirmed that it fixes the issue.

Device: Lenovo YOGA Tablet 10 (Wi-Fi) (MT8125)
Toolchain: Clang/LLVM 22.1.8-2 (cachyos-v3)

Tested-by: Akari Tsuyukusa <akkun11.open@gmail.com>

Can you send your fix as PATCH?
I think your approach is better than mine.

Best Regards,
Akari

