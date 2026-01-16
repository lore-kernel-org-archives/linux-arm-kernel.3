Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E6BD4A61A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 09:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hVybfYbe8i3MrpO08VfiZkufpjg080yyEME6uzv1ZzY=; b=pxEgwPP19EW/8s2yAEdI55B5lW
	gg6RbACXJZCAgJV5h4YdNNwLU0kL4lLtLZvY9OCLHXcBh5f8nUY3rk0SPLKPW9h9tgP/JPb8yAV/F
	T6KCYnsWWodEeMQdMtSCQfMr/gSkKRqsfolui9QNFeE83YKkBqmrbujL0WT2zzcXgc6lMSsEDErZZ
	lAvP6QNwOXw6BMbLn9fJ3Dsdx/IvGgu2nVsZw7InzWN8Eqqcg/AUNoPTP3etIhePlpQi1Aqok+1Hg
	aLN6rTdr/HWcvzAY0t4XpxO7iVuKHfZQYgg8R3JUylDvuPy11mEI8z1fOYFrS2T0cun87h3mpoqx2
	Vm/KHAVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vggLE-0000000DsRl-2wvP;
	Fri, 16 Jan 2026 09:42:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vggLC-0000000DsRL-0kj3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 09:42:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 379AC44190
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 09:42:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D218C19421
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 09:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768556520;
	bh=/E8pjL1Rg4kjh10yWKXAfqGFi3+btd20CKL87Qc6xYk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VPASkmLvCW/t4XmsQcmEBMDBN6Np6o9rMBqRv0awasGACRhWea5bRnd9A+VLI+NCs
	 dIOhMy0sajBtbGyDu9uVrXkjyIivOBJELkA5/q/4uW2MVZdwif+Sp2+i0XqCrTiY5V
	 1KA83r7fBXyaU5DDLzRKsGpWG3+5hmKtEVtCmxu1hgjn3vYeSFlJpj5eVFe/Ievqfl
	 KZgXntrkuNOXkkx9bZH1SNmuZHxxpA2fODGUvnAxdX2bcG0uDEaKicAUoeBrHNqpUs
	 FNslAZOVGw7n8A5D4kGOULTX8nF3IzRI4xn4R3dZbn8JeuL3MTbn5K967B+ogy3rK7
	 zdKB3gNFNNE6A==
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-34c71f462d2so1273742a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 01:42:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXQwWVQW3JzdyRDM+SMar5YkKgXrkiOxh4na50+ueezXFdAvvjY1wZCLii3RAqXLnZHXJf8g6zQZliBnkLf68AF@lists.infradead.org
X-Gm-Message-State: AOJu0Yzm3VjoFk3XNxNlIweFYqdAl5wz3jehIS6ESTXK3foHnQeBJWMF
	FaAg/n3d6IGHc44+zDZQH+kfrQyWWhANS0U+fKDU5ONEgINHWtwI2/Oo6jQUgoI9RQ1C0X+OO/m
	Ivul2TasJQtdesU9l3gY7kx62GF8c6Pg=
X-Received: by 2002:a17:90b:3dcc:b0:340:c4dc:4b70 with SMTP id
 98e67ed59e1d1-3527315e60dmr2091280a91.6.1768556519441; Fri, 16 Jan 2026
 01:41:59 -0800 (PST)
MIME-Version: 1.0
References: <20260115004328.194142-1-coxu@redhat.com> <20260115004328.194142-2-coxu@redhat.com>
In-Reply-To: <20260115004328.194142-2-coxu@redhat.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 16 Jan 2026 10:41:48 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFXNo1-pMbo-VZrjQ3TYe1tufebrLr_avL12A0nHMSGnA@mail.gmail.com>
X-Gm-Features: AZwV_QjmUt_PmrwfWvkU01-td52KzVOAwQnoeyg_Oar6lj-mB--Ez-fk2UXAfCg
Message-ID: <CAMj1kXFXNo1-pMbo-VZrjQ3TYe1tufebrLr_avL12A0nHMSGnA@mail.gmail.com>
Subject: Re: [PATCH 1/3] integrity: Make arch_ima_get_secureboot integrity-wide
To: Coiby Xu <coxu@redhat.com>
Cc: linux-integrity@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, 
	Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu <roberto.sassu@huaweicloud.com>, 
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_014202_260951_26FD5FEA 
X-CRM114-Status: GOOD (  18.49  )
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

On Thu, 15 Jan 2026 at 01:43, Coiby Xu <coxu@redhat.com> wrote:
>
> EVM and other LSMs need the ability to query the secure boot status of
> the system, without directly calling the IMA arch_ima_get_secureboot
> function. Refactor the secure boot status check into a general,
> integrity-wide function named arch_integrity_get_secureboot.
>
> Define a new Kconfig option CONFIG_INTEGRITY_SECURE_BOOT, which is
> automatically configured by the supported architectures. The existing
> IMA_SECURE_AND_OR_TRUSTED_BOOT Kconfig loads the architecture specific
> IMA policy based on the refactored secure boot status code.
>
> Reported-and-suggested-by: Mimi Zohar <zohar@linux.ibm.com>
> Suggested-by: Roberto Sassu <roberto.sassu@huaweicloud.com>
> Signed-off-by: Coiby Xu <coxu@redhat.com>
> ---
>  arch/arm64/Kconfig                            |  1 +
>  arch/powerpc/Kconfig                          |  1 +
>  arch/powerpc/kernel/Makefile                  |  2 +-
>  arch/powerpc/kernel/ima_arch.c                |  5 --
>  arch/powerpc/kernel/integrity_sb_arch.c       | 13 +++++
>  arch/s390/Kconfig                             |  1 +
>  arch/s390/kernel/Makefile                     |  1 +
>  arch/s390/kernel/ima_arch.c                   |  6 --
>  arch/s390/kernel/integrity_sb_arch.c          |  9 +++
>  arch/x86/Kconfig                              |  1 +
>  arch/x86/include/asm/efi.h                    |  4 +-
>  arch/x86/platform/efi/efi.c                   |  2 +-
>  include/linux/ima.h                           |  7 +--
>  include/linux/integrity.h                     |  8 +++
>  security/integrity/Kconfig                    |  6 ++
>  security/integrity/Makefile                   |  3 +
>  security/integrity/efi_secureboot.c           | 56 +++++++++++++++++++
>  security/integrity/ima/ima_appraise.c         |  2 +-
>  security/integrity/ima/ima_efi.c              | 47 +---------------
>  security/integrity/ima/ima_main.c             |  4 +-
>  security/integrity/platform_certs/load_uefi.c |  2 +-
>  21 files changed, 111 insertions(+), 70 deletions(-)
>  create mode 100644 arch/powerpc/kernel/integrity_sb_arch.c
>  create mode 100644 arch/s390/kernel/integrity_sb_arch.c
>  create mode 100644 security/integrity/efi_secureboot.c
>
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 93173f0a09c7..4c265b7386bb 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -2427,6 +2427,7 @@ config EFI
>         select EFI_STUB
>         select EFI_GENERIC_STUB
>         imply IMA_SECURE_AND_OR_TRUSTED_BOOT
> +       imply INTEGRITY_SECURE_BOOT

This allows both to be en/disabled individually, which I don't think
is what we want. It also results in more churn across the
arch-specific Kconfigs than needed.

Wouldn't it be better if IMA_SECURE_AND_OR_TRUSTED_BOOT 'select'ed
INTEGRITY_SECURE_BOOT in its Kconfig definition?

