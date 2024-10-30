Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DFA9D5CC9C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 11:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VeIG/ZcqI3p+nLl4RvpoP3/dtuBOLvCoB03RCodl0P0=; b=HEjWCbKD68BOzi/qMclxlFsAsz
	YgM+rTZ/s+rWrFIvpWMe+mX9zzykEhuRQNmGL5w6ixR9/tQpTHN2SwYiZbcuhyCGjnky09zRhWhfj
	sO+cWz18CE4JdIEAPR0P5JnZl1wHWi7cfkHDKDxFbCmoDJEBWpsiDQ69JL1L4f1cATl+Gr4lIkEUP
	B1ECarH5XGOj0Ag6MlQ3rJq4eTagOJvuJN7fGIR+0zFFs79Im3fHVfavzs7Tlwj4wG4KSoC5jImAH
	PCmmOCMeS/ADDLrEBL0glZfemYUnheuShLIjYYtl6no6bWEL7TWE+RJUQeyElSVa4KuRN2xtAiWZz
	/NxYm7RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t67F3-00000000DmS-3olS;
	Wed, 30 Oct 2024 11:52:01 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t673E-00000000Ark-2oQ4;
	Wed, 30 Oct 2024 11:39:59 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1730288386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VeIG/ZcqI3p+nLl4RvpoP3/dtuBOLvCoB03RCodl0P0=;
	b=rhEg0d1z87PUbjnSMEsHa2ZTMjm4V7As2oyILf5i4K2VK/32cI0L1o8550RHGdp6sqGjh3
	ErfD1VAW2o++iRalLhw8wi1ciSvnXToQPU/7Dqz5Wlnc51fuF7yZtMempbYTt2HzLBGqx0
	Y9YSzHbUO+IR24Yjq+Ny338RBqa0jzNLUw2m9Vrr52kzfVeGJB4+uj1JaJRYCIo3DE6Lly
	bobxafA+CuOfJYFL3jZUIAtXVESnMTctTppzVthR6fn1ijnvzGIvSfDwZ8yFMWE8zMh75v
	CjtAzrsY5JQC46+IYsUu5faYS3U6XCuR8hSr6G0+pno9IQ0T9vFbLX0np3OHDQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1730288386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VeIG/ZcqI3p+nLl4RvpoP3/dtuBOLvCoB03RCodl0P0=;
	b=Sf9t6VjHntegt94+/ZST48Lk206fyTt9ZFie/7zblKXgaCtLwerDU5H5dAAiGuPUAe0Y5b
	9F1eFOTF9JGc5hBw==
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, Guo
 Ren
 <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik
 <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Russell
 King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>, WANG
 Xuerui <kernel@xen0n.name>, Theodore Ts'o <tytso@mit.edu>, "Jason A.
 Donenfeld" <Jason@zx2c4.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Thomas
 =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, Nam Cao
 <namcao@linutronix.de>
Subject: Re: [PATCH 00/28] vdso: Preparations for generic data storage
In-Reply-To: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
Date: Wed, 30 Oct 2024 12:39:45 +0100
Message-ID: <871pzxzuny.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_043948_900220_D570B883 
X-CRM114-Status: GOOD (  12.63  )
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

Folks!

On Thu, Oct 10 2024 at 09:01, Thomas Wei=C3=9Fschuh wrote:
> Historically each architecture defined their own datapage to store the
> VDSO data. This stands in contrast to the generic nature of the VDSO
> code itself.
> We plan to introduce a generic framework for the management of the VDSO
> data storage that can be used by all architectures and which works
> together with the existing generic VDSO code.
>
> Before that is possible align the different architectures by
> standardizing on the existing generic infrastructure and moving things
> out of the VDSO data page which does not belong there.
>
> Patches	 1- 2:	csky
> Patch	    3:	s390
> Patches	 4- 5:	arm64
> Patch	    6:	riscv
> Patch	    7:	arm
> Patch	    8:	LoongArch
> Patch	    9:	MIPS
> Patches 10-20:	x86
> Patches 21-27:	powerpc
> Patch      28: 	Renamings to avoid a name clash with the new code.

As this has been sitting for two weeks now without major comments, I'm
planning to merge that through the tip tree tomorrow.

Thanks,

        tglx

