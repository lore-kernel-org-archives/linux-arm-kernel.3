Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B529CCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 20:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YLcI7uh56ZVRt3C9U1s60gRSr20JslBP/aA229quIic=; b=peyPnxIV53Yc4L2zLC6v2SLfGG
	+u7f36H07AoKA/Ycb7jpaz2IBXcm4lteHF+loiqn224Cv1Zj90pisBm1S7EDHDiSNwSjfZXYGRonk
	7hp2Tj5BTAzwrIN+UvNVPPV32ATjUl3uiNAXTosZz2ptjG0xgFocwuNbntZjlS3/W5VqME7VmKbRP
	mXcQ+4Rtkv2IBufAoVdHj4ffHuznoNlOJmnGAyPZkomRzjTYiofDfUSzzcALCjPH7I6Favmt1G4Ay
	zpbr/xhaE8uHvU7/5b7vtE3MBHicvaH7AvJ1NqZm8eNnZYvmmUOG9kitY3jNYXwXHT7Mc/sn03u+5
	2PB3+1uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGjun-0000000EMQ6-31wA;
	Wed, 05 Nov 2025 20:15:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGjum-0000000EMPw-42Al
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 20:15:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 056A0601F1;
	Wed,  5 Nov 2025 20:15:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4A94C4CEF5;
	Wed,  5 Nov 2025 20:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762373731;
	bh=Lw++o2HELy2ZtWzBIbekYFJktkL5pR/Om2RKn74v1rQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tVjlLypvxp3tK6h3M4G7McwvdI6gA8sxm/UocCXG0mBUTsqUSzgrjT87E1jK3B7rE
	 ibU2ywmazXPh8J10A3IxweVZ8xaZofARrlwX0OlWkDzUJKqErx5FjL0EPddsf91/NQ
	 3oPru8Psy5xRWnEgEShymCYgSetPXqw72puMPnE6ccAIz+Fu5j6x1iwibexdQ9zoiS
	 fe18mkKCL625LUctrbKaESMKZ7GPUJftYZvZ2rxKR4a+sJN2uJfeLNcoyICvtUikQi
	 PLh4WhrsOD8YLyih3t766j/ZSJe7NBsghwm5c25JoUzABBadcnwyLdEVVQJ7W553rD
	 0eOxjwkaepv7Q==
Date: Wed, 5 Nov 2025 13:15:22 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	linux-efi@vger.kernel.org, llvm@lists.linux.dev,
	Christian Brauner <brauner@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] kbuild: Add '-fms-extensions' to areas with dedicated
 CFLAGS
Message-ID: <20251105201522.GB3787308@ax162>
References: <20251101-kbuild-ms-extensions-dedicated-cflags-v1-1-38004aba524b@kernel.org>
 <aQtUujos2ADVs-_O@gate>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQtUujos2ADVs-_O@gate>
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

On Wed, Nov 05, 2025 at 07:44:26AM -0600, Segher Boessenkool wrote:
> On Sat, Nov 01, 2025 at 12:35:47PM -0400, Nathan Chancellor wrote:
> > There are many places within the kernel that use their own CFLAGS
> > instead of the main KBUILD_CFLAGS, meaning code written with the main
> > kernel's use of '-fms-extensions' in mind that may be tangentially
> > included in these areas will result in "error: declaration does not
> > declare anything" messages from the compiler.
> 
> Please fix such non-standard code then, instead?  The only (documented)
> thing -fms-extensions does for C code is give meaning to something that
> otherwise is a syntax error (and it is for a good reason!)

Right, the kernel would like to start taking advantage of one of those
extensions. See these other threads for more information.

https://lore.kernel.org/20251020142228.1819871-1-linux@rasmusvillemoes.dk/
https://lore.kernel.org/20251023082142.2104456-1-linux@rasmusvillemoes.dk/

Cheers,
Nathan

