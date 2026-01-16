Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCFED4899E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 13:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WIN2mxq/KhACMDMrF+Rs48U5i+CaZOdJF/Gqqy8Yo4k=; b=eTwMbFBFGo9Ev5CXdY+lwSZeea
	15/RymBMM4EA0lwDODqGRp/uV+x6LsYVpSOY0v+M0ARhMnRlyrnQLzgLhfVaTALmH1IlPNudyR88Z
	L9yRiYTMqT+aDS2LP9wuqr6P8rAxe6RkUjFI0irJfXZOQo+Ml57EIDR1muQ9RvfdN8bfOrsoiChdb
	YmJ0bt1n2e7eLgZIHW5Vx2xYajuqgPUS/JOBP7xKiktRaNoZBSWYLOa3+gSJpULOzwUohAbcQjJgG
	g1d77X4U2JoZDUYbshYJ3zufP+KdI7m5oeNjdKJjhMHgzxy5yZyZyKMQthP06lS9ynndLLjEmCg+X
	06wPfFAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgjjC-0000000EALg-0RzN;
	Fri, 16 Jan 2026 13:19:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgjjB-0000000EALZ-0SKs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 13:19:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2322E60161
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 13:19:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCBFDC2BC87
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 13:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768569539;
	bh=paGgdC+WfYWTfp4FQwhsSNV0x9rGHQk4MpKoJN/J6kM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=M7RJ4xWT43ADC98PxDV0e9HkP280IMkU6DuUIegDtDal1O+uBc54Tkxa09dLwjXub
	 YPFl3yiwWiS0BjazyBIjIvXj1bPBf9HUWuATFQjjMPIvMRiBVdB9C6gvatACsVQCZn
	 Q1cxodFpUXGz/ppkN2ieUnX1UvKai1MwWgfE/yv/G9Xt/x5hhIuTv4iowkxTtGCBWQ
	 iokXcbIAWUFqEg83r2kyYQFtPKeFO4/VXnU+HH4ZYJCkE5wTPD/IBLgTw3lEsycgkl
	 sSyPHDNvSqz/qFWqe4fO7qelHdj37D5Baf+lKFgJMZwu/rOBKY0Ayr6dZxSemsXv+G
	 WQqfmNw8427fQ==
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-34f634dbfd6so1505011a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 05:18:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXGMJnzbDiNGqUGe/3Pjj8iIOpfkF6X5BUsjgYu593fl1fp5KFP6YDqM4DkLQmlxWk6/QwQbQ01RWq2lfkoslLW@lists.infradead.org
X-Gm-Message-State: AOJu0YzR/QZBg4Q/FVaB1qLR8N9iUUIm+rXyqhatZ5zjhKe3lo+1bWmS
	Lp5O2q2bioOP3y4UBDDyuIWCqmbhy2KymzpbZ9YqkKbFR5bs5/61ZVGV+HJ53APH6kRcazZoEWO
	mUi7oy5BVA/8jwRbz2us0ZxfodUXXNJA=
X-Received: by 2002:a17:90b:3c49:b0:341:88c1:6a7d with SMTP id
 98e67ed59e1d1-35272f87eb9mr2433924a91.18.1768569539305; Fri, 16 Jan 2026
 05:18:59 -0800 (PST)
MIME-Version: 1.0
References: <20260115004328.194142-1-coxu@redhat.com> <20260115004328.194142-2-coxu@redhat.com>
 <CAMj1kXFXNo1-pMbo-VZrjQ3TYe1tufebrLr_avL12A0nHMSGnA@mail.gmail.com> <8bfa859ed3a4f1cf0db0ab64d8c1c3b24684582a.camel@linux.ibm.com>
In-Reply-To: <8bfa859ed3a4f1cf0db0ab64d8c1c3b24684582a.camel@linux.ibm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 16 Jan 2026 14:18:48 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHsJNZoUEnbD1y=v4Ftuv9d2c08VckRV7ru4k4P83vZbQ@mail.gmail.com>
X-Gm-Features: AZwV_QiR8f22XUrZO7Ho9HKYBQjvJoHCgOD5leRDTv3x2USeTKmIDvLwsh7DTh4
Message-ID: <CAMj1kXHsJNZoUEnbD1y=v4Ftuv9d2c08VckRV7ru4k4P83vZbQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] integrity: Make arch_ima_get_secureboot integrity-wide
To: Mimi Zohar <zohar@linux.ibm.com>
Cc: Coiby Xu <coxu@redhat.com>, linux-integrity@vger.kernel.org, 
	Heiko Carstens <hca@linux.ibm.com>, Roberto Sassu <roberto.sassu@huaweicloud.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Roberto Sassu <roberto.sassu@huawei.com>, 
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Eric Snowberg <eric.snowberg@oracle.com>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)" <linuxppc-dev@lists.ozlabs.org>, 
	"open list:S390 ARCHITECTURE" <linux-s390@vger.kernel.org>, 
	"open list:EXTENSIBLE FIRMWARE INTERFACE (EFI)" <linux-efi@vger.kernel.org>, 
	"open list:SECURITY SUBSYSTEM" <linux-security-module@vger.kernel.org>, 
	"open list:KEYS/KEYRINGS_INTEGRITY" <keyrings@vger.kernel.org>
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

On Fri, 16 Jan 2026 at 14:11, Mimi Zohar <zohar@linux.ibm.com> wrote:
>
> On Fri, 2026-01-16 at 10:41 +0100, Ard Biesheuvel wrote:
> > On Thu, 15 Jan 2026 at 01:43, Coiby Xu <coxu@redhat.com> wrote:
> > >
> > > EVM and other LSMs need the ability to query the secure boot status of
> > > the system, without directly calling the IMA arch_ima_get_secureboot
> > > function. Refactor the secure boot status check into a general,
> > > integrity-wide function named arch_integrity_get_secureboot.
> > >
> > > Define a new Kconfig option CONFIG_INTEGRITY_SECURE_BOOT, which is
> > > automatically configured by the supported architectures. The existing
> > > IMA_SECURE_AND_OR_TRUSTED_BOOT Kconfig loads the architecture specific
> > > IMA policy based on the refactored secure boot status code.
> > >
> > > Reported-and-suggested-by: Mimi Zohar <zohar@linux.ibm.com>
> > > Suggested-by: Roberto Sassu <roberto.sassu@huaweicloud.com>
> > > Signed-off-by: Coiby Xu <coxu@redhat.com>
> > > ---
> > >  arch/arm64/Kconfig                            |  1 +
> > >  arch/powerpc/Kconfig                          |  1 +
> > >  arch/powerpc/kernel/Makefile                  |  2 +-
> > >  arch/powerpc/kernel/ima_arch.c                |  5 --
> > >  arch/powerpc/kernel/integrity_sb_arch.c       | 13 +++++
> > >  arch/s390/Kconfig                             |  1 +
> > >  arch/s390/kernel/Makefile                     |  1 +
> > >  arch/s390/kernel/ima_arch.c                   |  6 --
> > >  arch/s390/kernel/integrity_sb_arch.c          |  9 +++
> > >  arch/x86/Kconfig                              |  1 +
> > >  arch/x86/include/asm/efi.h                    |  4 +-
> > >  arch/x86/platform/efi/efi.c                   |  2 +-
> > >  include/linux/ima.h                           |  7 +--
> > >  include/linux/integrity.h                     |  8 +++
> > >  security/integrity/Kconfig                    |  6 ++
> > >  security/integrity/Makefile                   |  3 +
> > >  security/integrity/efi_secureboot.c           | 56 +++++++++++++++++++
> > >  security/integrity/ima/ima_appraise.c         |  2 +-
> > >  security/integrity/ima/ima_efi.c              | 47 +---------------
> > >  security/integrity/ima/ima_main.c             |  4 +-
> > >  security/integrity/platform_certs/load_uefi.c |  2 +-
> > >  21 files changed, 111 insertions(+), 70 deletions(-)
> > >  create mode 100644 arch/powerpc/kernel/integrity_sb_arch.c
> > >  create mode 100644 arch/s390/kernel/integrity_sb_arch.c
> > >  create mode 100644 security/integrity/efi_secureboot.c
> > >
> > > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > > index 93173f0a09c7..4c265b7386bb 100644
> > > --- a/arch/arm64/Kconfig
> > > +++ b/arch/arm64/Kconfig
> > > @@ -2427,6 +2427,7 @@ config EFI
> > >         select EFI_STUB
> > >         select EFI_GENERIC_STUB
> > >         imply IMA_SECURE_AND_OR_TRUSTED_BOOT
> > > +       imply INTEGRITY_SECURE_BOOT
> >
> > This allows both to be en/disabled individually, which I don't think
> > is what we want. It also results in more churn across the
> > arch-specific Kconfigs than needed.
> >
> > Wouldn't it be better if IMA_SECURE_AND_OR_TRUSTED_BOOT 'select'ed
> > INTEGRITY_SECURE_BOOT in its Kconfig definition?
>
> As much as possible, EVM (and other LSMs) shouldn't be dependent on another LSM,
> in this case IMA, being configured.

Sure, but that is not my point.

This arrangement allows for IMA_SECURE_AND_OR_TRUSTED_BOOT to be
enabled without INTEGRITY_SECURE_BOOT, resulting in the stub
implementation of arch_integrity_get_secureboot() being used, which
always returns false.

