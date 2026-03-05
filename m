Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC848F3092E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 10:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gcVApjQ1o1JVCGuBa6YFi63UPRhbqz227MwCDIrxk4E=; b=PIoyDt8+ellarlAbqxgI1qhm6c
	e8cG+1+9FMEbysC5lCISL7d3d1oYFSWdjpDybWF4Ninp1upYLEtO7OFpakk7K3TCJrowYDNCOy2Nj
	lfoj9FviyqI6J3W9/vkMYDfcKZKFDWDkuXPSkvXRumlibttYsOPUaNCJg0Ec7Y67vv/tGppF/MQhP
	LHSqq+RLbLWFEXm0sq8p6XCuD0ttbcnGy6AhEqahjrxlOCr3PzHQ/TIOjgh4B/1wnzg7Jp2x3ZNBR
	fnLE1WYwOQ8UVwEltl0Lh8aeT5F296J1mKClXB/Zg8AHlrKWTdrol7K1fv1V3k5E+GZz0T8Ee1Okr
	zjPd/rBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5uJ-00000001ZoP-25M5;
	Thu, 05 Mar 2026 10:26:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5uH-00000001Zng-0ZN5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 10:26:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 06788419D5;
	Thu,  5 Mar 2026 10:26:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CCBDC116C6;
	Thu,  5 Mar 2026 10:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772706371;
	bh=yN3P+dfcabxAsputqX2/k7Zr9ICjFZ2rKGQwcJ77ONY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=FJavDVBxKwwmbEjYfckKeUlfCtzMeXpgCqvyUVluMmj92x2uHE5fETjD/KdfhaGmp
	 W69DhQVjX5f2Bggj687uC072S8pKdkl3r/K6fopCoZrrggIIHKq3IbBQJ0QzlZEM6i
	 d01z8oNDXHqv0upfXsyrDrSO7Awi8f8Mlk0kk130h9/4SGOrW8Y3c+7jlDXl+pVIZd
	 FxSD53/g5n9tZ/N+BaDWwwgNi/X/RhTMQ4Dh1YEyXCNDNiRLogolhRakJO+fZHVXNo
	 nZt8YOThjrFK9zPioKTSC0vKnSb34kxK+cW0/V7t8/lmbA2N1l+7otpwsfJAa1YMQK
	 X6BJSOlBpVPQA==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/2] kbuild: Use '-fms-anonymous-structs' if it is
 available
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Kees Cook <kees@kernel.org>, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-parisc@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
 linux-efi@vger.kernel.org, llvm@lists.linux.dev
In-Reply-To: <20260223-fms-anonymous-structs-v1-2-8ee406d3c36c@kernel.org>
References: <20260223-fms-anonymous-structs-v1-0-8ee406d3c36c@kernel.org>
 <20260223-fms-anonymous-structs-v1-2-8ee406d3c36c@kernel.org>
Date: Thu, 05 Mar 2026 11:25:55 +0100
Message-Id: <177270635550.104478.3620211579416140490@derry.ads.avm.de>
X-Mailer: b4 0.15-dev-363b9
X-Developer-Signature: v=1; a=openpgp-sha256; l=715; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=yN3P+dfcabxAsputqX2/k7Zr9ICjFZ2rKGQwcJ77ONY=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBpqVo1djCIKUbWSXBEArtpABeIBK+n1YrI8VPfM
 6rRmf720ZWJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCaalaNQAKCRAHUgpwFiYS
 acK1D/92cHSfhwuIxsSSGbf7AoMStLJHAyJ9ekSE905rEEJRKebqeuxxJKFxr9E/3hV9eT4T1Mf
 Zy0/lwNJvAl0P+2Npsjg3RW/VvZGx3HkeTGOIFKFa7cu/sJAK7CDAG1uksbjMoYrxkL0EQbWWvx
 o5AnNIPZiGrG4LbGLZXw9+m2OZ8nvR0fwwDn/wCe1qlz3uv/Lt5jZZCSRzYvYdOqX98An9l0IxY
 ghkLt9IwT8q2W+6Gt1lCl16CbGnQQCv+gZ5zaJ4rRAcMxVMzd4hnsOCnHXQReJPpdJD632TdLDK
 C0Eq7DwWxusmyDJ7DJdBFs/GyOo5KFuhwPDHGyIJ73OMBlatww/k4TIz6yxvX8iQc4iozm5XGv4
 oIpH0FK9SPTd9aI2pdYFI2B9K88SC904VWodBYOGEqYlReL+u4hQGXbf04M5wP3M0vimqB+im2m
 fOzd8uqOhnQHW7ZQ6E2Uiq+5wwj/ONcO8OhJVYsGYKNxpjpYsf3S/c/ZHL3aopsAuZX6IQR0Rrm
 euDSGTLgYKvNl7pLI/Z+S3kMM+PVUoqeftWN9VrNHhXqAcmteIHQOHXE1R3YekPTKhjZ02E2dO/
 +2jvsUWph7hAsv7v5WBQPblz5x7EBO406DhrYA+ycdR0eWd0gDBYPr2QkniMoO4M6rdqvkgfCKl
 Px5LzhExqCJxAow==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_022613_248463_BB38846D 
X-CRM114-Status: UNSURE (   9.22  )
X-CRM114-Notice: Please train this message.
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

On Mon, 23 Feb 2026 12:10:29 -0700, Nathan Chancellor <nathan@kernel.org> wrote:
> Clang recently added '-fms-anonymous-structs' [1] to specifically enable
> the Microsoft tagged anonymous structure / union extension, for which
> the kernel added '-fms-extensions' in commit c4781dc3d1cf ("Kbuild:
> enable -fms-extensions"). Switch to this more narrow option if it is
> available, which would have helped avoid the issue addressed by
> commit a6773e6932cb ("jfs: Rename _inline to avoid conflict with clang's
> '-fms-extensions'"). GCC has talked about adding a similar flag [2] as
> well but potentially naming it differently.
> 
> [...]

Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas


