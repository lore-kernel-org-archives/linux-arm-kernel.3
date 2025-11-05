Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC6BCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 12:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bE00UD2ozi1TjxFPhaSfMHrkqaRtzchM5nf4A0iLV4Y=; b=tJ81WyVKhPy8o6pezfoOURuAXu
	iRQB3nKtjtHavbULrPZK+TLrWRA53ExWmkeGGdW1QpinKngcF0oixd27WDCk7e0ncjHbgzoD5SDDx
	8eDrUsOx9AC9+5/T8PbbJEfEe8YnIMpb54A3AWOJov8F0T0p9S6JwxRke50npnzIqTGIUHohUypvj
	rRMg9Yd5fCHtSPxqQlx5TfNaB/+UaV6REx6tChKcMxQNQJMdxwRZjHhBGVJ8wg+OXOVNMBKiwnRDw
	KlHSEM+gvi9KhmeVFqx8ipoE4CkyYJ/hH6MXS3+dvzTO3A7Q4Ws7GVYgJFtiTZLeDFWD4CyWg8DGI
	SiSY4sQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGd3f-0000000DiQr-48TQ;
	Wed, 05 Nov 2025 12:56:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGd3c-0000000DiQ6-3xlV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 12:56:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D19A6434D3;
	Wed,  5 Nov 2025 12:56:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E408C4CEFB;
	Wed,  5 Nov 2025 12:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762347371;
	bh=/8YIJ/IkaELHTBMMbQStDRua58EN3fZrFED65ddxxfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dvflcplcUhWkJ2R5yUdEfOV14GOSJI1qYLRskRrXY6+YlGQtU6WAL9dBEJQSIOCgS
	 SBA0Geu4mEjZ3pzr3SUXhUWkAZkJqYZeEJunjGOel6gLcX1D93hLyZVB+oL/5Mpgg+
	 4StU+OVzJpR3qdc0Igqi0KZCrTOhcErDOPCdPO58yadioNazHWvPuR8oeDBMe2EwQi
	 cfdIuD4LR5NZ9Rj5U1BRa2r1H/CPvA3H5Y3JgiS8VXyzleSNHWS0An+h80XOTz9i0i
	 +yjVbmYtY9B8+ntPBhb6kdfqZ96VHiMDCh+1okcWT0YHUnoS5evcpNcpWG3oSbFKCs
	 rL6FTo2ATZ5LA==
Date: Wed, 5 Nov 2025 13:56:02 +0100
From: Christian Brauner <brauner@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, linux-efi@vger.kernel.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH] kbuild: Add '-fms-extensions' to areas with dedicated
 CFLAGS
Message-ID: <20251105-amnesie-eisig-277559b69bae@brauner>
References: <20251101-kbuild-ms-extensions-dedicated-cflags-v1-1-38004aba524b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251101-kbuild-ms-extensions-dedicated-cflags-v1-1-38004aba524b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_045613_023552_0A6F38EB 
X-CRM114-Status: GOOD (  19.87  )
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

On Sat, Nov 01, 2025 at 12:35:47PM -0400, Nathan Chancellor wrote:
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

I'll give my ack:

Reviewed-by: Christian Brauner <brauner@kernel.org>

but don't invalidate the branch just to add my RvB if you've already had
it stable.

