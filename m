Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543EAC98315
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 04:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rQ/pt5veFEgJZqTxKk8ueI9Za/xjDVCyikH3Hycx4Iw=; b=XedoDsyQW4pVxOsjxPHrnl3jgs
	KT+8WYgkEPcnUc7ei6wqmvS63QUBe5ZwxlhxAkxUiLLSxYRJHA+/3Sq5RYqp9yUER4ziFQeT6iWe5
	LP4k+M80iIDGsSdFv6AE7P6rZwKN/3JfiEKnmxITCSMsauIFkNGA/PtfZE04/4v/n9uqRfQ93gcpi
	Cxj2UujRnLNHZU6MKdk41dF4tbrfBg/k7gKUJsdlSxkssCdhwSVPMYFLXaBStU7bXkvm5N3bIRKde
	QsFZ5F+sbgFY0eACyxtiiI+8OZf4ZhKfRMrcrdnqLlyqbD6C76EL/uPba70lTSbleSnLY88eav2vK
	bTkOZHIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhgWk-00000001L6I-0nEH;
	Mon, 19 Jan 2026 04:06:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhgWg-00000001L5b-0RU0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 04:06:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768795559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rQ/pt5veFEgJZqTxKk8ueI9Za/xjDVCyikH3Hycx4Iw=;
	b=OQYZ+/M7g5n3Y1TTim3LE4V+cYUN47AIZzzJlweKJNdoH+HvVlkjwfA+PPaQj+nT9bbm7G
	gAaXjfMGMWl//H8XrzprKdBdsmbBeFk7l7jlMwK6cHfq2S+XgCi8npX804mdCvGbmsmsre
	o3BKnTRdRVhjzPizvWn8LgZuPZLVzLc=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-Hx8kqRNDMfWM2-JGzN4Gtw-1; Sun, 18 Jan 2026 23:05:56 -0500
X-MC-Unique: Hx8kqRNDMfWM2-JGzN4Gtw-1
X-Mimecast-MFC-AGG-ID: Hx8kqRNDMfWM2-JGzN4Gtw_1768795555
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7fc82eff4adso3227023b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 20:05:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768795555; x=1769400355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rQ/pt5veFEgJZqTxKk8ueI9Za/xjDVCyikH3Hycx4Iw=;
        b=J/nof4ZF4gLr2ytJ+VIE7HE+Bt2fd/th8kTXIFEWMzDrYuCBzkoYJr4GXsqka9f9Vy
         rdMoEw89+s9j1l1gsl3XstV5pAbMulGoWBpIjLcZDVhw/iAkVYuhntn01PH0RPfgqt08
         1EZX12Q1K0aBjQJCxCQki3url9MDF84gdBi1VXSK7CkQrX/kyXixZylyKiEOZp1R6VQT
         BX0q7NqWauGjlQHCLP7RxrVqs/HCrRZuaVKzFiPO2fnVqjOL9z9QrzSAn++ecO2bag8U
         tt52pjDk3gQ0sVRVsNzRKRO7p5XTxPhpMjPSC6jLMf/dULDHunvQBNV38OChHWPNzVAO
         xcBw==
X-Forwarded-Encrypted: i=1; AJvYcCUTo+7ZM9Y1bxnySSdQbZrYfnTNNqdS3krhInK7dbacv4WPMttTPz9Pk6gxqDBhsh/1yBcMjolrnoBOZJf3e+pe@lists.infradead.org
X-Gm-Message-State: AOJu0YwH13lzKT4y2Kjk3ObWwLVuzD1X/Lj5NDjqtUvZ9dqkbP1rt8Ji
	2byznwB6wu9cU1JLXKx2DGGusGh6ZHOJ+NOQ1hu6NKodSxw2l0wBltUeKZcFf50ADhU4aNADcUG
	2mQ4Mv872BzVjuc/RBb3eYKcjRhzUugWEnfR3OUP586EEsjFZbJBoa2V65EGk+CCXBirUVghRAw
	ci
X-Gm-Gg: AY/fxX6ERBXMGpWiQ5aOnO27WISxa96I/cm4rnuCaVzJ2W60Q0d3VMBpfR++Y907lVs
	cSW0DEZyixq/dUF6SK/hzm2ksux+iQpNieS8fKgiYvg7tfzy72RnhnRSZWrWc1+MOwe3oScn0N0
	9YU8zK1qqMbiCVyXN/G4R7sihH7z/dQOWg7OVFpT9m5vmDzssFlrYzUiWGZZdAlpLutrebYdaTX
	lCx5x3y+bnTA3yNUv/u2doeg/QkbpDNEnVEUgQv/fjNvYJE9PwMoEQzK/XJBIXdryXEJ5oisH67
	h8aTNUz/VfcQQm7rVPoUaRLtbM20k1KTGbJ2I3U4cz57bqNEcXVtxu2bgBMDXyoLt+UG2iyLlNY
	w
X-Received: by 2002:aa7:888b:0:b0:81e:b93a:ab09 with SMTP id d2e1a72fcca58-81f8efbbe1amr10668398b3a.1.1768795554638;
        Sun, 18 Jan 2026 20:05:54 -0800 (PST)
X-Received: by 2002:aa7:888b:0:b0:81e:b93a:ab09 with SMTP id d2e1a72fcca58-81f8efbbe1amr10668347b3a.1.1768795553931;
        Sun, 18 Jan 2026 20:05:53 -0800 (PST)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa10bdc65sm7831738b3a.21.2026.01.18.20.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 20:05:53 -0800 (PST)
Date: Mon, 19 Jan 2026 12:04:04 +0800
From: Coiby Xu <coxu@redhat.com>
To: Ard Biesheuvel <ardb@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>
Cc: linux-integrity@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, 
	Roberto Sassu <roberto.sassu@huaweicloud.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	Roberto Sassu <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
	Eric Snowberg <eric.snowberg@oracle.com>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, 
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)" <linuxppc-dev@lists.ozlabs.org>, "open list:S390 ARCHITECTURE" <linux-s390@vger.kernel.org>, 
	"open list:EXTENSIBLE FIRMWARE INTERFACE (EFI)" <linux-efi@vger.kernel.org>, 
	"open list:SECURITY SUBSYSTEM" <linux-security-module@vger.kernel.org>, "open list:KEYS/KEYRINGS_INTEGRITY" <keyrings@vger.kernel.org>
Subject: Re: [PATCH 1/3] integrity: Make arch_ima_get_secureboot
 integrity-wide
Message-ID: <aW2i3yacr5TvWU-m@Rk>
References: <20260115004328.194142-1-coxu@redhat.com>
 <20260115004328.194142-2-coxu@redhat.com>
 <CAMj1kXFXNo1-pMbo-VZrjQ3TYe1tufebrLr_avL12A0nHMSGnA@mail.gmail.com>
 <8bfa859ed3a4f1cf0db0ab64d8c1c3b24684582a.camel@linux.ibm.com>
 <CAMj1kXHsJNZoUEnbD1y=v4Ftuv9d2c08VckRV7ru4k4P83vZbQ@mail.gmail.com>
 <97b69bc79a5d9246f7a399510908c7b95b2e95e7.camel@linux.ibm.com>
 <CAMj1kXGx4ebaK87W7k0SNUNQnO9+=z1nmYxXC7retmp3OqRRFg@mail.gmail.com>
 <ac5e5e45c12e9b0bda19807e60b06057d74be0b3.camel@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <ac5e5e45c12e9b0bda19807e60b06057d74be0b3.camel@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fq_5d2VTPtmYVZidJl0SS17w5bG9jumqB6XXOh7d3Ss_1768795555
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_200602_299466_322CB32B 
X-CRM114-Status: GOOD (  47.22  )
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

On Sun, Jan 18, 2026 at 01:25:52PM -0500, Mimi Zohar wrote:
>On Fri, 2026-01-16 at 18:27 +0100, Ard Biesheuvel wrote:

Hi Ard and Mimi,

Thanks for your discussion on improving the patch!

>> On Fri, 16 Jan 2026 at 17:39, Mimi Zohar <zohar@linux.ibm.com> wrote:
>> >
>> > On Fri, 2026-01-16 at 14:18 +0100, Ard Biesheuvel wrote:
>> > > On Fri, 16 Jan 2026 at 14:11, Mimi Zohar <zohar@linux.ibm.com> wrote:
>> > > >
>> > > > On Fri, 2026-01-16 at 10:41 +0100, Ard Biesheuvel wrote:
>> > > > > On Thu, 15 Jan 2026 at 01:43, Coiby Xu <coxu@redhat.com> wrote:
>> > > > > >
>> > > > > > EVM and other LSMs need the ability to query the secure boot status of
>> > > > > > the system, without directly calling the IMA arch_ima_get_secureboot
>> > > > > > function. Refactor the secure boot status check into a general,
>> > > > > > integrity-wide function named arch_integrity_get_secureboot.
>> > > > > >
>> > > > > > Define a new Kconfig option CONFIG_INTEGRITY_SECURE_BOOT, which is
>> > > > > > automatically configured by the supported architectures. The existing
>> > > > > > IMA_SECURE_AND_OR_TRUSTED_BOOT Kconfig loads the architecture specific
>> > > > > > IMA policy based on the refactored secure boot status code.
>> > > > > >
>> > > > > > Reported-and-suggested-by: Mimi Zohar <zohar@linux.ibm.com>
>> > > > > > Suggested-by: Roberto Sassu <roberto.sassu@huaweicloud.com>
>> > > > > > Signed-off-by: Coiby Xu <coxu@redhat.com>
>> > > > > > ---
>> > > > > >  arch/arm64/Kconfig                            |  1 +
>> > > > > >  arch/powerpc/Kconfig                          |  1 +
>> > > > > >  arch/powerpc/kernel/Makefile                  |  2 +-
>> > > > > >  arch/powerpc/kernel/ima_arch.c                |  5 --
>> > > > > >  arch/powerpc/kernel/integrity_sb_arch.c       | 13 +++++
>> > > > > >  arch/s390/Kconfig                             |  1 +
>> > > > > >  arch/s390/kernel/Makefile                     |  1 +
>> > > > > >  arch/s390/kernel/ima_arch.c                   |  6 --
>> > > > > >  arch/s390/kernel/integrity_sb_arch.c          |  9 +++
>> > > > > >  arch/x86/Kconfig                              |  1 +
>> > > > > >  arch/x86/include/asm/efi.h                    |  4 +-
>> > > > > >  arch/x86/platform/efi/efi.c                   |  2 +-
>> > > > > >  include/linux/ima.h                           |  7 +--
>> > > > > >  include/linux/integrity.h                     |  8 +++
>> > > > > >  security/integrity/Kconfig                    |  6 ++
>> > > > > >  security/integrity/Makefile                   |  3 +
>> > > > > >  security/integrity/efi_secureboot.c           | 56 +++++++++++++++++++
>> > > > > >  security/integrity/ima/ima_appraise.c         |  2 +-
>> > > > > >  security/integrity/ima/ima_efi.c              | 47 +---------------
>> > > > > >  security/integrity/ima/ima_main.c             |  4 +-
>> > > > > >  security/integrity/platform_certs/load_uefi.c |  2 +-
>> > > > > >  21 files changed, 111 insertions(+), 70 deletions(-)
>> > > > > >  create mode 100644 arch/powerpc/kernel/integrity_sb_arch.c
>> > > > > >  create mode 100644 arch/s390/kernel/integrity_sb_arch.c
>> > > > > >  create mode 100644 security/integrity/efi_secureboot.c
>> > > > > >
>> > > > > > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> > > > > > index 93173f0a09c7..4c265b7386bb 100644
>> > > > > > --- a/arch/arm64/Kconfig
>> > > > > > +++ b/arch/arm64/Kconfig
>> > > > > > @@ -2427,6 +2427,7 @@ config EFI
>> > > > > >         select EFI_STUB
>> > > > > >         select EFI_GENERIC_STUB
>> > > > > >         imply IMA_SECURE_AND_OR_TRUSTED_BOOT
>> > > > > > +       imply INTEGRITY_SECURE_BOOT
>> > > > >
>> > > > > This allows both to be en/disabled individually, which I don't think
>> > > > > is what we want. It also results in more churn across the
>> > > > > arch-specific Kconfigs than needed.
>> > > > >
>> > > > > Wouldn't it be better if IMA_SECURE_AND_OR_TRUSTED_BOOT 'select'ed
>> > > > > INTEGRITY_SECURE_BOOT in its Kconfig definition?
>> > > >
>> > > > As much as possible, EVM (and other LSMs) shouldn't be dependent on another LSM,
>> > > > in this case IMA, being configured.
>> > >
>> > > Sure, but that is not my point.
>> > >
>> > > This arrangement allows for IMA_SECURE_AND_OR_TRUSTED_BOOT to be
>> > > enabled without INTEGRITY_SECURE_BOOT, resulting in the stub
>> > > implementation of arch_integrity_get_secureboot() being used, which
>> > > always returns false.

Since both INTEGRITY_SECURE_BOOT and IMA_SECURE_AND_OR_TRUSTED_BOOT
don't define a prompt, they are not user-configurable and will always be
enable/disabled together with arch-specific secure boot feature. So
despite the "imply" key word, the case where
IMA_SECURE_AND_OR_TRUSTED_BOOT is enabled whereas INTEGRITY_SECURE_BOOT
is disabled won't happen.

But I agree an arch may not care much about INTEGRITY_SECURE_BOOT so it
may be a churn. So limiting it to the scope of the integrity subsystem
can be a better idea.

>> >
>> > I understand your concern, but instead of "select"ing INTEGRITY_SECURE_BOOT from
>> > IMA_SECURE_AND_OR_TRUSTED_BOOT, how making IMA_SECURE_AND_OR_TRUSTED_BOOT
>> > dependent on both IMA_ARCH_POLICY and INTEGRITY_SECURE_BOOT.
>> >
>>
>> Given that INTEGRITY_SECURE_BOOT has no dependencies of its own,
>> afaict, selecting it is the least disruptive option, as otherwise,
>> existing configs will disable IMA_SECURE_AND_OR_TRUSTED_BOOT as the
>> kernel is being upgraded. But conceptually, I agree that they are
>> equivalent.

As already pointed out on by Mimi, INTEGRITY_SECURE_BOOT depend on
arch-specific secure boot feature. So we can't say INTEGRITY_SECURE_BOOT
has no dependencies. 

>>
>> > Including the "imply INTEGRITY_SECURE_BOOT" here in the arch Kconfig allows EVM
>> > to query the secure boot state without relying on IMA_SECURE_AND_OR_TRUSTED_BOOT
>> > being configured.
>>
>> Yes, I understand that this is the whole point of the exercise. But
>> 'imply' should be used with care, and in this case, implying both from
>> CONFIG_EFI really makes little sense. INTEGRITY_SECURE_BOOT should be
>> selected by options that need the functionality, not 'implied' by
>> options that might provide it.

But again I agree INTEGRITY_SECURE_BOOT should "not 'implied' by options
that might provide it".

>
>As not all arch's implement arch_integrity_get_secureboot, the definition in
>include/linux/integrity.h would need to be updated.  Something like:
>
>-#ifdef CONFIG_INTEGRITY_SECURE_BOOT
>+#if (defined(CONFIG_INTEGRITY_SECURE_BOOT) && \
>+       (defined(CONFIG_X86) && defined(CONFIG_EFI)) || defined(CONFIG_S390) \
>+        || defined(CONFIG_PPC_SECURE_BOOT))
>
>Then IMA_SECURE_AND_OR_TRUSTED_BOOT and EVM could select INTEGRITY_SECURE_BOOT,
>as suggested.

Since INTEGRITY_SECURE_BOOT has a dependency, select doesn't seem to be
a good choice. If EVM does select INTEGRITY_SECURE_BOOT,
INTEGRITY_SECURE_BOOT will be enabled even if arch-specific secure boot
feature is disabled and this can lead to a building failure. How about
always enabling INTEGRITY_SECURE_BOOT when secure boot feature is
enabled and also making IMA_SECURE_AND_OR_TRUSTED_BOOT depend on
INTEGRITY_SECURE_BOOT?

diff --git a/security/integrity/Kconfig b/security/integrity/Kconfig
index 916d4f2bfc44..cd44b46d0325 100644
--- a/security/integrity/Kconfig
+++ b/security/integrity/Kconfig
@@ -97,6 +97,13 @@ config INTEGRITY_CA_MACHINE_KEYRING_MAX
           will not be loaded. The remaining MOK keys are loaded into the
           .platform keyring.
  
+config INTEGRITY_SECURE_BOOT
+       def_bool y
+       depends on EFI || PPC_SECURE_BOOT || S390
+       help
+         Provide secure boot related helper functions like querying the
+         secure boot status.
+

diff --git a/security/integrity/ima/Kconfig b/security/integrity/ima/Kconfig
index 976e75f9b9ba..5dce572192d6 100644
--- a/security/integrity/ima/Kconfig
+++ b/security/integrity/ima/Kconfig
@@ -311,6 +311,7 @@ config IMA_QUEUE_EARLY_BOOT_KEYS
  config IMA_SECURE_AND_OR_TRUSTED_BOOT
         bool
         depends on IMA_ARCH_POLICY
+       depends on INTEGRITY_SECURE_BOOT


Another idea is make a tree-wide arch_get_secureboot i.e. to move
current arch_ima_get_secureboot code to arch-specific secure boot
implementation. By this way, there will no need for a new Kconfig option
INTEGRITY_SECURE_BOOT. But I'm not sure if there is any unforeseen
concern.

-- 
Best regards,
Coiby


