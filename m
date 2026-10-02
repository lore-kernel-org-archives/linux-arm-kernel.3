Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FF3CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 10:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XhYZeDORiSI8/JK5prOnI48AZTeR83aeNlRw2yNVr5w=; b=QvY/mIlKRg0vtMWmSzd+f6wT8N
	QHDMbejQ5gfXUbAFcGvX9xq15rYrC8tKby4baUVslxgUKe2JxQAJBZIHRYA9Yx1YcFp3f1Z6GSZc8
	69jHjKXk64OnnTQgrSqozW2ZyGybDCoP+P9BucDfJ84jJHC6RahoWzI6y547jfge8UZqZIYtKA3Xe
	0dyyMiwfLYZAM+4x80ef9SDjq40q5EEPZgb+f2I7N2c5nmADrMH8RZipwfj4JH7Et/jxDk2B9v/5U
	dmJG+D2LyTlWx2Xz8SuVZ+9SgvWArSfIQ0K21YMldJp+tWX6ucaJdd8szBeQafAmwnjsvLJlIvvGO
	Y9UiRkWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCaxU-0000000BOXj-450i;
	Fri, 02 Oct 2026 10:57:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCaxU-0000000BOXM-2KMr;
	Fri, 02 Oct 2026 10:57:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B0FA43E34;
	Fri,  2 Oct 2026 10:57:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFC801F000FF;
	Fri,  2 Oct 2026 10:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790938663;
	bh=XhYZeDORiSI8/JK5prOnI48AZTeR83aeNlRw2yNVr5w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aWofcNL0IpfhNz1F+V5tIezxAIC+6gSsXgAkREeV4BVed+0FiauQXMNWVw9LKPLB6
	 ir4DE+mQOj7fAnn9wWN24mGIs2yiLoWuxDgSoIcePHXYebp3Jn+1nUa9x2wySQefzf
	 WQmIi/OFo2WoqQKAzGhoPoMrrzBB5bUlFah8eMf2FJVRJ6H6P9gC/qpBZuRnPjv0y/
	 F5TtGt5oyxTCxCgpw9JS+D+Ugcg53pdmW58E1qfTVRE4UNxCd1Jv8/fulyxe9xvM3n
	 QuSyWTZZF/fLNAxS4cWJJyIBxQRSN/S3tMrqSUHZbQdB27JrxaRUMLy+tg6NqQf98F
	 +C8Ubag62FOcA==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Theodore Ts'o <tytso@mit.edu>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Christophe Leroy <chleroy@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2] random: vDSO: Avoid call to memset() when zeroing reserved in __cvdso_getrandom_data()
Date: Fri,  2 Oct 2026 12:57:06 +0200
Message-ID: <179093852073.149722.832232613857480812.b4-ty@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925-vdso-getrandom-avoid-memset-llvm-24-v2-1-ce640f872393@kernel.org>
References: <20260925-vdso-getrandom-avoid-memset-llvm-24-v2-1-ce640f872393@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=948; i=chleroy@kernel.org; h=from:subject:message-id; bh=cZWyz0y5XGYe9zKs9PNHSxiUlxW65egvfT4xEgdntpI=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWTt7+OJ/rvq89WD/OHOTgfiuFYb3eV9siQjX6ZB4uV8W fGZTfsNOkpZGMS4GGTFFFmO/+feNaPrS2r+1F36MHNYmUCGMHBxCsBElsQyMkw/0pmesd3U1s2/ +cCt35+i1GxcP3PlXZzn80qx+rxOmQLD/5gj9bZ29RUatWfD9vbt1+NKmTHbS7kya1+avMNCTlt NfgA=
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
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


On Fri, 25 Sep 2026 22:46:32 +0100, Nathan Chancellor wrote:
> After a recent change in LLVM [1], builds with the random vDSO
> implementation, such as PowerPC and RISC-V, fail when checking the vDSO:
> 
>   arch/powerpc/kernel/vdso/vdso32.so.dbg: dynamic relocations are not supported
>   arch/riscv/kernel/vdso/vdso.so.dbg: dynamic relocations are not supported
> 
> memset() is now generated when zeroing params->reserved for some builds
> because LLVM has an optimization (now run in more instances) that can
> recognize at compile time when it is assigning a static value to a
> contiguous area of memory and turn that into a call to memset(). Both
> clang and GCC assume memset() is always available [2].
> 
> [...]

Applied, thanks!

[1/1] random: vDSO: Avoid call to memset() when zeroing reserved in __cvdso_getrandom_data()
      (no commit info)

Best regards,
-- 
Christophe Leroy (CS GROUP) <chleroy@kernel.org>

