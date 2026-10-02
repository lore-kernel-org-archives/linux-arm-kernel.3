Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CEECCA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 09:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O1NvwTXORD+Bb07RA52Wu5WZWJqKJmdYmCUZOMWRc5g=; b=BT9pn0lPV0DGO0r4ixWjjBN2xm
	jXao6w395dEGBbEMT1naGlPP96J3o7h0DKeZAw3ZrGf6Xo0qS7EqZeXipFTyR5RpeRLIU9O3CS2KJ
	gHc7DGnOzxs0g4hT2RfMPlFW6/BNklGqTDK77PrYc5Yq7pDP5JIekGAHdZFsNjHVnfnV3l1dYQeHA
	UgKp1jVXpn+EcS3aY4ZqHZ9THoZ0X/O5gPIa4nIIl3U038c6un4rD09J5wbFes6Lp9tt5R7mKOp4N
	HtIB7YsNnJ9VNFzSbfofstJORCnwOKK+YGrDXeXjP7rEyiTSJAHL4AZOQQVJAKESqaEeg0nX4OMA6
	Lo4UT1GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZth-0000000BCTO-0GW7;
	Fri, 02 Oct 2026 09:49:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZtg-0000000BCT4-0B0I;
	Fri, 02 Oct 2026 09:49:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2F6F060A70;
	Fri,  2 Oct 2026 09:49:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89C201F00898;
	Fri,  2 Oct 2026 09:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790934582;
	bh=O1NvwTXORD+Bb07RA52Wu5WZWJqKJmdYmCUZOMWRc5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aOMAm0+cj8fILcHV8Uj0RSZsjvcpY1RGYRxgNmibtLJucq4PJOFYlIeiGQVMfrMtH
	 DuOOY8IKcr5yOnM73cxavmFw/nMHIjF2qDFrl5uDmTm4oMLgD066mfJFMfXw9Bc49t
	 csqzp1wUBMrdSv3SghZJ/e5GLtijiu6xy2aZ5PO4v+0coTfSNOC/XZkaenDtUej0CP
	 i/q/JrIeY1TU8Nol9o5vJO8rP4m5pAttrz6dh8syfIsV6x0pir8FExIzAdOKEXHnA9
	 Cm8d729oJ1G8qj87sC00EzJFfXA+tDEZru+V9USQSA1Xg//ndb/O3J7bRLVs8z/I4V
	 zfigDTcHw5t/g==
Date: Fri, 2 Oct 2026 11:49:32 +0200
From: Nathan Chancellor <nathan@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
Message-ID: <20261002094932.GA3435055@ax162>
References: <20260930133813.GA3142230@ax162>
 <ar0a4b9CjL2YHCkY@zx2c4.com>
 <ar0gTS71qxnx9AkW@zx2c4.com>
 <20260930151337.GD3142230@ax162>
 <CAHmME9pA+AntJ6hWoFYpTVjh-NUSd0ZGXp5XiUuhQcq3HjQT3g@mail.gmail.com>
 <ede392d7-3104-4a0f-9fa1-99b22552dcd6@kernel.org>
 <ar4nD8aRH7wEvTMt@zx2c4.com>
 <20261001102059.GA4176271@ax162>
 <ar46ap4jzLWyP92C@zx2c4.com>
 <20261001110310.GA138012@ax162>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001110310.GA138012@ax162>
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

On Thu, Oct 01, 2026 at 01:03:10PM +0200, Nathan Chancellor wrote:
> On Thu, Oct 01, 2026 at 12:48:10PM +0200, Jason A. Donenfeld wrote:
> > Does this commit seem okay with you? I used the diff you sent below and
> > adjusted the commit message: https://git.zx2c4.com/linux-rng/commit/?id=56ff95ee85715047eb5b5220243778af657778c8
> 
> Yeah, that seems fine to me, thanks for taking care of it!

Can you adjust the LLVM value by one from 4294967295 to 4294967294? ~0U
is actually a special value, so we hit an assertion in the SystemZ
backend.

  https://github.com/llvm/llvm-project/blob/3f48e22a1f321d5d3341bd812803694cea588785/llvm/lib/CodeGen/SelectionDAG/SelectionDAG.cpp#L9547
  https://github.com/llvm/llvm-project/blob/3f48e22a1f321d5d3341bd812803694cea588785/llvm/lib/Target/SystemZ/SystemZISelLowering.cpp#L1470-L1471

clang: llvm/lib/Target/SystemZ/SystemZISelLowering.cpp:1471: virtual bool llvm::SystemZTargetLowering::findOptimalMemOpLowering(LLVMContext &, std::vector<EVT> &, unsigned int, const MemOp &, unsigned int, unsigned int, const AttributeList &, EVT *) const: Assertion `Limit != ~0U && "Expected EmitTargetCodeForMemXXX() to handle AlwaysInline cases."' failed.
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace and dumped files.
Stack dump:
0.      Program arguments: ...
1.      <eof> parser at end of file
2.      Code generation
3.      Running pass 'Function Pass Manager' on module 'arch/s390/kernel/vdso/vgetrandom.c'.
4.      Running pass 'SystemZ DAG->DAG Pattern Instruction Selection' on function '@__kernel_getrandom'
...

-- 
Cheers,
Nathan

