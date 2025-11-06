Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CDACCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 17:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jUOcQwJRln67uS82tlcAA1G+Boy+nymiclVKiSDZbQQ=; b=4NPPeo1LYB1432IbVmrzazcr7w
	dN2VxzrrEYzFBYpVUuELLkbSk+RBkphwDwbIFuaw+dhkyN/Sq5IbN9eA0OxhL3KwEEdVDknZaRtpt
	MThteQ4sk+UvfULn/jHfT4nyCqIAYjAm8kfeWmPmQ+aEkdKBuDkVzCfSgk8zH6xfiqwk2cXI3oz8o
	PBkialwne7oGx9oVtcoHAYl40lR3eG7UMfjo/hJ4jM5jph+S0Kfs/5M1h0YiiHy13gv/wYlwPF2uF
	AqBDYqisysG2RxtrGNZMkRkk6hDyXMeZt2SqtSBQcktSg/USbRhENFFr8/zAwR0UX6IVvu+gInQEr
	uqKsqe8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH45c-0000000G3H3-354p;
	Thu, 06 Nov 2025 17:48:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH45Z-0000000G3GX-3Yfz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 17:48:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 23E6042B05;
	Thu,  6 Nov 2025 17:48:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCD86C116C6;
	Thu,  6 Nov 2025 17:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762451281;
	bh=13WsgUGoeK4bC41loapHpdur+Ccm2Mdg30VVAbVHLjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z9FnDBrLQxnVZ8j0S6dXWmgDdhzRapTlDLeZphuGquMG48Y0ehHhp+zTZ1t5KXHbE
	 txcGrmgh0jjFrb2R7Z4I4+T/u5lzxWz5dX1+SmKtEgYTcAlIG9Z7mJs448ffRsunb/
	 NKjfdgOv8bmEebgrBMp3h9vh4pR0Pq8RkV/w1GvjFyMBhyadJ/0oXUr1y1nJ50U0ub
	 aJnzIoOLRuwk0h/lQKZix1kH9a4jtd/PFlGQeCzBFejhXmzM34PXGVkA6w+0UTpxmg
	 kZW7+JyfWA+DtE0VoLbWXC2bDxthopkWbymWnjEda4G9uauXq3ZbYJQm9H/atPuoWh
	 K90fOO5tmdSWQ==
Date: Thu, 6 Nov 2025 10:47:52 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Christian Brauner <brauner@kernel.org>
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
	linux-efi@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] kbuild: Add '-fms-extensions' to areas with dedicated
 CFLAGS
Message-ID: <20251106174752.GA2440428@ax162>
References: <20251101-kbuild-ms-extensions-dedicated-cflags-v1-1-38004aba524b@kernel.org>
 <20251105-amnesie-eisig-277559b69bae@brauner>
 <20251105193931.GA2480016@ax162>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105193931.GA2480016@ax162>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_094801_927629_0A3C8A7D 
X-CRM114-Status: GOOD (  15.72  )
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

On Wed, Nov 05, 2025 at 12:39:31PM -0700, Nathan Chancellor wrote:
> I was planning to make it stable tomorrow to give folks time to chime in
> at the beginning of the week. I have your tag and Ard's to add. After
> that, we will just have to rely on the link to this submission for
> follow ups.

Alright, this should be the final result. If there are any other Acks
that come in later, they will just have to be recorded here. If there
are any follow up fixes needed, I will apply them on top and update the
tag but the branch will not be rebased.

Cheers,
Nathan

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-ms-extensions-6.19

for you to fetch changes up to 5ff8ad3909524ad55297a434f87c238224825bf4:

  kbuild: Add '-fms-extensions' to areas with dedicated CFLAGS (2025-10-30 21:26:28 -0400)

----------------------------------------------------------------
Shared branch between Kbuild and other trees for enabling '-fms-extensions' for 6.19

Signed-off-by: Nathan Chancellor <nathan@kernel.org>

----------------------------------------------------------------
Nathan Chancellor (2):
      jfs: Rename _inline to avoid conflict with clang's '-fms-extensions'
      kbuild: Add '-fms-extensions' to areas with dedicated CFLAGS

Rasmus Villemoes (1):
      Kbuild: enable -fms-extensions

 Makefile                              | 3 +++
 arch/arm64/kernel/vdso32/Makefile     | 3 ++-
 arch/loongarch/vdso/Makefile          | 2 +-
 arch/parisc/boot/compressed/Makefile  | 2 +-
 arch/powerpc/boot/Makefile            | 3 ++-
 arch/s390/Makefile                    | 3 ++-
 arch/s390/purgatory/Makefile          | 3 ++-
 arch/x86/Makefile                     | 4 +++-
 arch/x86/boot/compressed/Makefile     | 7 +++++--
 drivers/firmware/efi/libstub/Makefile | 4 ++--
 fs/jfs/jfs_incore.h                   | 6 +++---
 scripts/Makefile.extrawarn            | 4 +++-
 12 files changed, 29 insertions(+), 15 deletions(-)

