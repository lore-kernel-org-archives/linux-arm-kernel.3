Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F071CCFA02
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Nov 2025 16:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G0jsLZvsAQ9jUhuq/Qy/GAwPEDahTIIfhybMb8BvNq8=; b=kzpZtJuTBcA7oUvy/FZTcJ23RX
	beFXFnjBMu7iK0Jt1c+UL6ZHGZGABI22Qod+ZvKQAKkd9h1qs/A0BL4nyDAArG2N5jh7CzXTgVFMP
	3ZeetVJ5PJBHpSxD4UR1/g8PJk9ZmXqVUU/MfWaaIHyi68qJ0qKqR/sh/NwJcuGHiF4uWit6v8+xS
	w1E8sDHXDozZRn7v2RU+6+ZXEq4nFiZsLCXQhSV5+Xa0E0yoS9WAXQkA7A2i0fSAG9U+9baYw9VGd
	p/0gisXgho9gyL5sJdM+IKKmnWd2jWmqCE8+wVQavVwit3VXd8V5eqTmlLnF+ePpsaL/fi2yh8J9V
	2OvYBuDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFEtO-00000007xKP-0IJi;
	Sat, 01 Nov 2025 16:55:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFEtM-00000007xK0-0f4o
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Nov 2025 16:55:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C26AE44254
	for <linux-arm-kernel@lists.infradead.org>; Sat,  1 Nov 2025 16:55:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1C43C19424
	for <linux-arm-kernel@lists.infradead.org>; Sat,  1 Nov 2025 16:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762016150;
	bh=sP80vbxc0GNP/r5uXwFDomQ23UoJ4yroWxjXP3XmNMU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RF0EYwGkYWAviePjW7xN/OJRvwNhbqV1hMMNIs20gYmgWjrUhX3VTiMTlz9ZOCZ5B
	 NXQkgiqk8kYiwPDsvTA0VFMALLKyf5rQdgj/CBG1sTE15ccibfrhS1g63ZlKX1lHKM
	 7UL3/hfHnLT5czan5cp/tcrvWDt4uWQ6UuGsdc+QEdMaz7s1qTGKGYYXQJYBe6vVca
	 z1o0oo3gMr4PFJwzcE+qRl/dEms8SbUHTB8ZwVA2Uf/IDxdQO9JDrNb7/WRWaVtzGH
	 71Lh5gelYwPa5qTi/Hg3BmeOn0k8gVwdT2WJ5JcjHGb8oMfT8U2c1Ut/j9b0mZ+sFJ
	 GEsrrsx0XoT7g==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3737d09d123so42399961fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Nov 2025 09:55:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUs+7vWgH6blD+8ZK4srRFG9/7QSKuFjTHqlHE3FLJdUUjPvbuj3R8cnEez+VFlLZTOkIgHP5ac73l6Yyv7OQym@lists.infradead.org
X-Gm-Message-State: AOJu0YyKVFcCRbQzSlXJGwdrbHmlUm3G6CTABuVv/O84BZKZLzdCh64O
	tezmjp8rnRVIhrILD/K8aZM2Oy3OhHmFWfTdNZpgVV52gXD4un9f4hdPhADaO5D/LMBTn/9Nqmi
	LaZkaOZr++kYchGRAjNAEFsOVdSm2rWo=
X-Google-Smtp-Source: AGHT+IFzm6byOVEcoCYQ/cLxtsweQADoRZYzXMb1uWfsMHcHS2qxBFBPxKTICmebgyez5+m6RGoVxWrnW9Pxli+8r4A=
X-Received: by 2002:a2e:b8cb:0:b0:37a:2c7d:2d69 with SMTP id
 38308e7fff4ca-37a2c7d3241mr5473091fa.40.1762016148544; Sat, 01 Nov 2025
 09:55:48 -0700 (PDT)
MIME-Version: 1.0
References: <20251101-kbuild-ms-extensions-dedicated-cflags-v1-1-38004aba524b@kernel.org>
In-Reply-To: <20251101-kbuild-ms-extensions-dedicated-cflags-v1-1-38004aba524b@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 1 Nov 2025 17:55:37 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGy8s7Cc=aycKymv2d5wEZFL5J5_HxWyMb-QYDXkUrU9Q@mail.gmail.com>
X-Gm-Features: AWmQ_bnURnp_FaiKs8-FENuEErFxDHIc7i6dKr7lAYFTzEG_ElUiaSBCxPBJiyA
Message-ID: <CAMj1kXGy8s7Cc=aycKymv2d5wEZFL5J5_HxWyMb-QYDXkUrU9Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Add '-fms-extensions' to areas with dedicated CFLAGS
To: Nathan Chancellor <nathan@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-efi@vger.kernel.org, llvm@lists.linux.dev, 
	Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_095552_290415_12176B86 
X-CRM114-Status: GOOD (  22.49  )
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

On Sat, 1 Nov 2025 at 17:36, Nathan Chancellor <nathan@kernel.org> wrote:
>
> This is a follow up to commit c4781dc3d1cf ("Kbuild: enable
> -fms-extensions") but in a separate change due to being substantially
> different from the initial submission.
>
> There are many places within the kernel that use their own CFLAGS
> instead of the main KBUILD_CFLAGS, meaning code written with the main
> kernel's use of '-fms-extensions' in mind that may be tangentially
> included in these areas will result in "error: declaration does not
> declare anything" messages from the compiler.
>
> Add '-fms-extensions' to all these areas to ensure consistency, along
> with -Wno-microsoft-anon-tag to silence clang's warning about use of the
> extension that the kernel cares about using. parisc does not build with
> clang so it does not need this warning flag. LoongArch does not need it
> either because -W flags from KBUILD_FLAGS are pulled into cflags-vdso.
>
> Reported-by: Christian Brauner <brauner@kernel.org>
> Closes: https://lore.kernel.org/20251030-meerjungfrau-getrocknet-7b46eacc215d@brauner/
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> I am taking the original '-fms-extensions' change [1] via a shared
> branch in kbuild [2] so I would appreciate acks. I plan to finalize that
> branch so that other maintainers can safely pull it on Thursday.
>
> [1]: https://git.kernel.org/kbuild/c/c4781dc3d1cf0e017e1f290607ddc56cfe187afc
> [2]: https://git.kernel.org/kbuild/l/kbuild-ms-extensions
> ---
>  arch/arm64/kernel/vdso32/Makefile     | 3 ++-
>  arch/loongarch/vdso/Makefile          | 2 +-
>  arch/parisc/boot/compressed/Makefile  | 2 +-
>  arch/powerpc/boot/Makefile            | 3 ++-
>  arch/s390/Makefile                    | 3 ++-
>  arch/s390/purgatory/Makefile          | 3 ++-
>  arch/x86/Makefile                     | 4 +++-
>  arch/x86/boot/compressed/Makefile     | 7 +++++--
>  drivers/firmware/efi/libstub/Makefile | 4 ++--
>  9 files changed, 20 insertions(+), 11 deletions(-)
>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

