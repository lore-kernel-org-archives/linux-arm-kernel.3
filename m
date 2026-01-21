Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CFAC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 16:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TI7qGk8SazbxQIUc8/Muvjcn5BnkyjQqw+DTzn+43is=; b=o33YdaML2tz6rU+vQBQO+jnKyS
	6lJaCv5gyeo9hve/hIaBFTNXCwA7f38JABOudFquuntabiJJo+LGkpMLcJArEy4mqtTPEsdFEd+CO
	fNQ1z4sfk4zVQ9/ex67RmeQfkekfACe97/c7rMivD/l1rBr6H2PWVY/eLiOLXSOgERym7FybNrc8v
	Hxz+GRXXZEIg2qsto79Z1WGCXiyQJuvFhy8PjA87tKfwY0MFo77ngzEpmt4yFiobpaNtjA86JemMp
	UM+w6vymOmviUxFXeLrNvMehNzY1a3a9J6aKvBwXYhYUSQ4mxvLAxl5IQ13RcCUacslN5ewFiTkVh
	+SG6GvuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vib1y-00000005nJV-010D;
	Wed, 21 Jan 2026 16:26:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vib1s-00000005nIT-1itE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 16:26:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5F10C44427
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 16:25:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43C3BC2BCB1
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 16:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769012753;
	bh=sDXZ43cuHWu7fDJemSHBPXvLB0TztHzhjoU8+z2DpEU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NlpFZjd6TpgXF01/VordrzlllHPM/gPrPEksnciVTDQuVgDAmAkxxDWX8wqAavSXp
	 9OHsSfg6KBzHc2nEQ/Tmshv0HgNOByUug3SnVYVM3M/yj37IcUSiBCM9Vc/Pb3ETTA
	 3kk9uFaPORF6ZrfhphA2zG+1miXIKiNshuKktOfe06PK5I99+kF8KYmbAtMyswaSVe
	 oOnpg9Mom7Zr7TyPrppBGXMjFRQwfAC+HI+QIoKl+GyiEajQKmiR7qQko+3o0AhLtH
	 2Ghq/HyOqTD6X0U+VhUqm5YGqnT7/mekg+pRhX50NQkr946rgOozo4CVsh3MMzNHjW
	 7iX1i2EIawUjQ==
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a0a95200e8so94615ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 08:25:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX1PISUtntvcJZT0UcG9UOYmmp1bdTQcRa28p1C0JqNBa5RcsJqDwXIRT6+94CM6/wTkBq3t3ooo4j0UV5vr0f+@lists.infradead.org
X-Gm-Message-State: AOJu0YwJA9Q/TJ3/vCRHdOuDxR0sRARqDSKoQ40i6Aqw5i3OVMV7OEPu
	ijq5YAe0hMEyP6c7Rrjan/v8IuzJF1CNKrbFjK0GsM8GRYqxk6RT+FWcdqcZ7MdeogfXRwKEmKO
	PDbCB1WaGJkE42I25jxWO95KT2H56j8Y=
X-Received: by 2002:a17:902:ecc6:b0:2a0:afeb:fbbb with SMTP id
 d9443c01a7336-2a768b7a743mr46677125ad.1.1769012752394; Wed, 21 Jan 2026
 08:25:52 -0800 (PST)
MIME-Version: 1.0
References: <20260115004328.194142-1-coxu@redhat.com> <20260115004328.194142-2-coxu@redhat.com>
 <CAMj1kXFXNo1-pMbo-VZrjQ3TYe1tufebrLr_avL12A0nHMSGnA@mail.gmail.com>
 <8bfa859ed3a4f1cf0db0ab64d8c1c3b24684582a.camel@linux.ibm.com>
 <CAMj1kXHsJNZoUEnbD1y=v4Ftuv9d2c08VckRV7ru4k4P83vZbQ@mail.gmail.com>
 <97b69bc79a5d9246f7a399510908c7b95b2e95e7.camel@linux.ibm.com>
 <CAMj1kXGx4ebaK87W7k0SNUNQnO9+=z1nmYxXC7retmp3OqRRFg@mail.gmail.com>
 <ac5e5e45c12e9b0bda19807e60b06057d74be0b3.camel@linux.ibm.com>
 <aW2i3yacr5TvWU-m@Rk> <1a0b6e5601a673a81f8823de0815f92b7afbeb60.camel@linux.ibm.com>
In-Reply-To: <1a0b6e5601a673a81f8823de0815f92b7afbeb60.camel@linux.ibm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 21 Jan 2026 17:25:39 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFBMSEdRL8FotASbQO3dcfNG0bpp9Vnm5JPn-yjyDr=GA@mail.gmail.com>
X-Gm-Features: AZwV_QinD8JFxZrBNY-rXjMhWA_acQR-WgojG7fUerVuX5e99sfTa2O6odTmxSw
Message-ID: <CAMj1kXFBMSEdRL8FotASbQO3dcfNG0bpp9Vnm5JPn-yjyDr=GA@mail.gmail.com>
Subject: Re: [PATCH 1/3] integrity: Make arch_ima_get_secureboot integrity-wide
To: Mimi Zohar <zohar@linux.ibm.com>
Cc: Coiby Xu <coxu@redhat.com>, Dave Hansen <dave.hansen@intel.com>, 
	linux-integrity@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, 
	Roberto Sassu <roberto.sassu@huaweicloud.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
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
X-CRM114-CacheID: sfid-20260121_082602_351566_333C9179 
X-CRM114-Status: GOOD (  19.43  )
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

On Wed, 21 Jan 2026 at 16:41, Mimi Zohar <zohar@linux.ibm.com> wrote:
>
> On Mon, 2026-01-19 at 12:04 +0800, Coiby Xu wrote:
>
> > diff --git a/security/integrity/ima/Kconfig b/security/integrity/ima/Kconfig
> > index 976e75f9b9ba..5dce572192d6 100644
> > --- a/security/integrity/ima/Kconfig
> > +++ b/security/integrity/ima/Kconfig
> > @@ -311,6 +311,7 @@ config IMA_QUEUE_EARLY_BOOT_KEYS
> >   config IMA_SECURE_AND_OR_TRUSTED_BOOT
> >          bool
> >          depends on IMA_ARCH_POLICY
> > +       depends on INTEGRITY_SECURE_BOOT
> >
> >
> > Another idea is make a tree-wide arch_get_secureboot i.e. to move
> > current arch_ima_get_secureboot code to arch-specific secure boot
> > implementation. By this way, there will no need for a new Kconfig option
> > INTEGRITY_SECURE_BOOT. But I'm not sure if there is any unforeseen
> > concern.
>
> Originally basing IMA policy on the secure boot mode was an exception.  As long
> as making it public isn't an issue any longer, this sounds to me.  Ard, Dave, do
> you have any issues with replacing arch_ima_get_secureboot() with
> arch_get_secureboot()?

I don't see an issue with that. If there is a legitimate need to
determine this even if IMA is not enabled, then this makes sense.

