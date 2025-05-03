Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C37C5C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 11:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6njSZpjLFFK801EujEb3cuL3VrsBnFkcO396PYwdH7w=; b=WmXhHsCKrnUiK3Q2/vV74XL/tg
	Wl9x0L8/Jr1+YI3RcfbM2fPW+Jl42uYniyGaKwXlmWslTrQJ14hzqczUpqro7xfYZWSlA88EsycQf
	wxScknOUEE+KilxdVUvqZ27BzahFbWMGuIBmxM5bv4yEAOBw+9FccRgyu7DoHDgtf7OE8h0iGY5ap
	nb0zFBl7TGVOcQPkihbbgdzqNoWhopT0gU/ZYZPo6pHV0WXnyF1EwTHxiV2KpAsLbZ31KK6ANGVsF
	hXuWUMmwHO74OIfRDXHTgxJoa9HUqhIRy0Oda0ydU0GYcv4OijHEsfw3iN/7YyD5ew8UODwmDx2FE
	d9ku9cRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBB16-00000003oKF-0Gbk;
	Sat, 03 May 2025 11:26:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBAxI-00000003nzh-27rK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 May 2025 11:22:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 574F66113B
	for <linux-arm-kernel@lists.infradead.org>; Sat,  3 May 2025 11:22:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57AB5C4CEE7
	for <linux-arm-kernel@lists.infradead.org>; Sat,  3 May 2025 11:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746271371;
	bh=6njSZpjLFFK801EujEb3cuL3VrsBnFkcO396PYwdH7w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=m7WpISdGGO3sg0pkZySqZVxhQXOrOO9sPlkZ9W5OhO0eUNb0quPvXWkiK0vca30C4
	 ZRnYFSOa2Wkz0dwE4z6Fjs3+G6MnlmmFd0qpxz4TTnKfBslQkMezvu8eFYWRwpE5lu
	 e5+AeZ3FIO5J2ejNLWWWITtCFNFxiF8JNABEJenWMHmJm04pcgjGRb5+2DGhMOt0d5
	 gvDo6p+v9mum5Bk8GcMv1YAjfOJkh0SC2760HjyaVHDVm5Woa1F6ML+R1uSM14SHsi
	 A+8taaKnDq1hWiNWgBof3ltLwLjqzUyegfdAAPgSHP4HlnhTvhdl/hU6iWV5wAwh6x
	 jalm5zxtdKmuA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5499d2134e8so3370436e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 May 2025 04:22:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVhtQOIetEkuxNrTJHYCOV8mDW1fPJOyTjBMPWK+BYgoj4FcswCcb5m1/ibrhOgeIS2nqXbY26/oDtLrdlN/Xkg@lists.infradead.org
X-Gm-Message-State: AOJu0YwH+oh+LjYbh8vVcsdTvsfBMLtjV+hZCfO8+H0yMAcdq2BQabQa
	QjS/PexX6ucbGEvH7MNuol0pFRN2LDYYpLEHRJh0V9A9Z+loHCaJjLKah8/xJLPyfsHiqQyo9NS
	/t5L944PecqxvC+KbBz/StuxGm/A=
X-Google-Smtp-Source: AGHT+IG/LZhJuYwd6BT5g/YapcupnN/sQf19+E1GsW+tcerWCF3qKkEN4dkhge9FjiQ1f4Ybup6+9GqTT5D7d0ujND0=
X-Received: by 2002:a05:6512:108e:b0:549:8f4a:6baa with SMTP id
 2adb3069b0e04-54eb24390c2mr671056e87.27.1746271369757; Sat, 03 May 2025
 04:22:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250502145755.3751405-1-yeoreum.yun@arm.com> <CAMj1kXEoYcS6YPU0mBdvijDRK6ZVB7mPYZsCVpz7sYotabrxtQ@mail.gmail.com>
 <aBUHlGvZuI2O0bbs@arm.com> <aBULdGn+klwp8CEu@e129823.arm.com> <aBXqi4XpCsN3otHe@arm.com>
In-Reply-To: <aBXqi4XpCsN3otHe@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 3 May 2025 13:22:37 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHL5_2TM1ZTaPEgGm9uU7xvFpRxxarKpOTr=YVvj+72cQ@mail.gmail.com>
X-Gm-Features: ATxdqUG1fvw_z6UhDYuaA_GkP9ybtJKQQ9wqgeSGK9OYj_TYO1ZfClLHhMe7z3g
Message-ID: <CAMj1kXHL5_2TM1ZTaPEgGm9uU7xvFpRxxarKpOTr=YVvj+72cQ@mail.gmail.com>
Subject: Re: [PATCH] arm64/cpufeature: annotate arm64_use_ng_mappings with
 ro_after_init to prevent wrong idmap generation
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, will@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	broonie@kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	frederic@kernel.org, joey.gouly@arm.com, james.morse@arm.com, 
	hardevsinh.palaniya@siliconsignals.io, shameerali.kolothum.thodi@huawei.com, 
	ryan.roberts@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Sat, 3 May 2025 at 12:06, Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> On Fri, May 02, 2025 at 07:14:12PM +0100, Yeoreum Yun wrote:
> > > On Fri, May 02, 2025 at 06:41:33PM +0200, Ard Biesheuvel wrote:
> > > > Making arm64_use_ng_mappings __ro_after_init seems like a useful
> > > > change by itself, so I am not objecting to that. But we don't solve it
> > > > more fundamentally, please at least add a big fat comment why it is
> > > > important that the variable remains there.
> > >
> > > Maybe something like the section reference checker we use for __init -
> > > verify that the early C code does not refer anything in the BSS section.
> >
> > Maybe but it would be better to be checked at compile time (I don't
> > know it's possible) otherwise, early C code writer should check
> > mandatroy by calling is_kernel_bss_data() (not exist) for data it refers.
>
> This would be compile time (or rather final link time). See
> scripts/mod/modpost.c (the sectioncheck[] array) on how we check if, for
> example, a .text section references a .init one. We could move the whole
> pi code to its own section (e.g. .init.nommu.*) and add modpost checks
> for references to the bss or other sections.
>

We can take care of this locally in image-vars.h, where each variable
used by the startup code is made available to it explicitly.

Sending out a separate series shortly.

