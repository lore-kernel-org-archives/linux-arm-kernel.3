Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD430CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 18:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DRNHZG+0rjn+MS3ZH0CrvoAZYe+hwRcWZ5W/r+K9L0c=; b=jX1TmofhjyXdZ5knksM2XYxP0O
	vMYBJbiXNNOfuoTO2F9oGTGilNWF246WBzy3qBehiw8qMyT5jCLh7dunb9i7nS+5WLjXErO4H/Co2
	VfpvY6wlLm7dcPRMQDA92ow4To6psTRB25v2Mk2RVw0VP+vVGFCSDKI5FLqXNVdICOxkSWagXUp4V
	A/hNyk5mVM2F6sDttsG5xeynKdg7SzaMw3OGZk+i3NxQ4EBnMeCVfzIa7h/QYmGNZghYwgDtnZmON
	L3a0azVNqTGmZbY7HN/BcJec9P2EOE9UltmCG3Vc5SePh6PRARHZ0eaiuRs/z6yIrqp2Rn4Kcnrzn
	evahq8Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChtV-0000000CGOS-3ZH6;
	Fri, 02 Oct 2026 18:22:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChtS-0000000CGO8-3W4H;
	Fri, 02 Oct 2026 18:22:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D4CCD60A52;
	Fri,  2 Oct 2026 18:22:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3496D1F000FF;
	Fri,  2 Oct 2026 18:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790965321;
	bh=DRNHZG+0rjn+MS3ZH0CrvoAZYe+hwRcWZ5W/r+K9L0c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=QXsaGbmntNXtf8qGXbZm0VEFHH+Ktxq2NycVl9EA2UFJL5xoZ/7d0KfIdhvM22cGE
	 5Br3otgO+SIMvA5iH1BDByi0k1+DbOmVY77NPu8uIBzzMghHQETQUbBZPcYRFv0a8z
	 DRT4z9LSccwooBqwo4wg0YXKYC/2UL07N1MZQ4w/MUtqRI2DC5QYE+9qvmyD6dutEL
	 pmpMLRcOBj6u8ddAC/t2x5aZ1IapKtAA4XNzeDWqBXI76qzsqx+oc5+bkxEYoavYYe
	 /Q3H+GcrB9mDK4EhLPYavMssqFQA/PeSVeY0TOuLGECUEB+VovTtunZjz65tDBhUi5
	 0EAsTq4zf3ulw==
Message-ID: <2618625a-864d-43a4-b151-100e0d76ff87@kernel.org>
Date: Fri, 2 Oct 2026 20:21:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 llvm@lists.linux.dev
References: <ar0a4b9CjL2YHCkY@zx2c4.com> <ar0gTS71qxnx9AkW@zx2c4.com>
 <20260930151337.GD3142230@ax162>
 <CAHmME9pA+AntJ6hWoFYpTVjh-NUSd0ZGXp5XiUuhQcq3HjQT3g@mail.gmail.com>
 <ede392d7-3104-4a0f-9fa1-99b22552dcd6@kernel.org>
 <ar4nD8aRH7wEvTMt@zx2c4.com> <20261001102059.GA4176271@ax162>
 <ar46ap4jzLWyP92C@zx2c4.com> <20261001110310.GA138012@ax162>
 <20261002094932.GA3435055@ax162> <ar-Dx-deXN93M24v@zx2c4.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <ar-Dx-deXN93M24v@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



Le 02/10/2026 à 12:13, Jason A. Donenfeld a écrit :
> On Fri, Oct 02, 2026 at 11:49:32AM +0200, Nathan Chancellor wrote:
>> On Thu, Oct 01, 2026 at 01:03:10PM +0200, Nathan Chancellor wrote:
>>> On Thu, Oct 01, 2026 at 12:48:10PM +0200, Jason A. Donenfeld wrote:
>>>> Does this commit seem okay with you? I used the diff you sent below and
>>>> adjusted the commit message: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.zx2c4.com%2Flinux-rng%2Fcommit%2F%3Fid%3D56ff95ee85715047eb5b5220243778af657778c8&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C4caf8956c2d94439c19a08df206dd40b%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639265328227648970%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=H27VGYLdNkvQiA6l%2BJNnEModMbEySwTMXpLAt8iAFiI%3D&reserved=0
>>>
>>> Yeah, that seems fine to me, thanks for taking care of it!
>>
>> Can you adjust the LLVM value by one from 4294967295 to 4294967294? ~0U
>> is actually a special value, so we hit an assertion in the SystemZ
>> backend.
>>
>>    https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fllvm%2Fllvm-project%2Fblob%2F3f48e22a1f321d5d3341bd812803694cea588785%2Fllvm%2Flib%2FCodeGen%2FSelectionDAG%2FSelectionDAG.cpp%23L9547&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C4caf8956c2d94439c19a08df206dd40b%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639265328227670583%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=u8petgY9wU9ur%2By4kaOrb6VFKL%2FNf4tcCIUL%2BcUcDfs%3D&reserved=0
>>    https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fllvm%2Fllvm-project%2Fblob%2F3f48e22a1f321d5d3341bd812803694cea588785%2Fllvm%2Flib%2FTarget%2FSystemZ%2FSystemZISelLowering.cpp%23L1470-L1471&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C4caf8956c2d94439c19a08df206dd40b%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639265328227686571%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=cSwt%2BTJdYa%2Bbwe8HyO6FsIq6oU6YNplRlwCa0upif9Q%3D&reserved=0
>>
>> clang: llvm/lib/Target/SystemZ/SystemZISelLowering.cpp:1471: virtual bool llvm::SystemZTargetLowering::findOptimalMemOpLowering(LLVMContext &, std::vector<EVT> &, unsigned int, const MemOp &, unsigned int, unsigned int, const AttributeList &, EVT *) const: Assertion `Limit != ~0U && "Expected EmitTargetCodeForMemXXX() to handle AlwaysInline cases."' failed.
>> PLEASE submit a bug report to https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fllvm%2Fllvm-project%2Fissues%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C4caf8956c2d94439c19a08df206dd40b%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639265328227701575%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=%2F3q8laZb%2FDhCWp117N9EtyxLIc5lq%2FzEN2l0z%2BXwDHY%3D&reserved=0 and include the crash backtrace and dumped files.
>> Stack dump:
>> 0.      Program arguments: ...
>> 1.      <eof> parser at end of file
>> 2.      Code generation
>> 3.      Running pass 'Function Pass Manager' on module 'arch/s390/kernel/vdso/vgetrandom.c'.
>> 4.      Running pass 'SystemZ DAG->DAG Pattern Instruction Selection' on function '@__kernel_getrandom'
>> ...
> 
> Holy smokes. Sure, fixed:  https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.zx2c4.com%2Flinux-rng%2Fcommit%2F%3Fid%3Deb13a1ff271b0d180687eebb30611b0b276d5193&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C4caf8956c2d94439c19a08df206dd40b%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639265328227716550%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=WcnFE6S72OrDTNNvU1T06BtUTyI1sDx%2F%2Btz%2FkpGslMA%3D&reserved=0
> 
> 
>  From eb13a1ff271b0d180687eebb30611b0b276d5193 Mon Sep 17 00:00:00 2001
> From: Nathan Chancellor <nathan@kernel.org>
> Date: Fri, 25 Sep 2026 22:46:32 +0100
> Subject: [PATCH] random: vDSO: avoid call to memset() when zeroing reserved
>   parameter
> 
> After a recent change in LLVM [1], builds with the random vDSO
> implementation, such as PowerPC and RISC-V, fail when checking the vDSO:
> 
>    arch/powerpc/kernel/vdso/vdso32.so.dbg: dynamic relocations are not supported
>    arch/riscv/kernel/vdso/vdso.so.dbg: dynamic relocations are not supported
> 
> memset() is now generated when zeroing params->reserved for some builds
> because LLVM has an optimization (now run in more instances) that can
> recognize at compile time when it is assigning a static value to a
> contiguous area of memory and turn that into a call to memset(). Both
> clang and GCC assume memset() is always available [2].
> 
> Clang has an internal fiddly hook, -max-store-memset, which we can set
> to a high number, to disable generating out of line memset calls [3].
> Similarly, GCC has -finline-stringops=memset to do the same [4], should
> this issue ever hit future version of GCC. While these options wouldn't
> make sense for normal kernel code, it is fine for the extremely limited
> and intentionally compact vDSO code.
> 
> Link: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fllvm%2Fllvm-project%2Fcommit%2F90cebef1411617fc3eedd359bdf00cb44b1c2439&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C4caf8956c2d94439c19a08df206dd40b%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639265328227732238%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=cYZ2nUalY%2F6yarydfMIlcGpDVlztXRBeg7UG7tpCO9g%3D&reserved=0 [1]
> Link: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgcc.gnu.org%2Fonlinedocs%2Fgcc-16.2.0%2Fgcc%2FStandards.html%23index-ffreestanding&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C4caf8956c2d94439c19a08df206dd40b%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639265328227748542%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=vRl%2BQgL5GJ0wowXAIlRIczC5XqUXyOFUvFVe5C8XWAc%3D&reserved=0 [2]
> Link: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fllvm%2Fllvm-project%2Fcommit%2Fb28eeb28bea39148738dc375e8a97072a1907e64&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C4caf8956c2d94439c19a08df206dd40b%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639265328227762721%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=nt59J3%2BOoiEKYGzfFfAq7WoAnEMAimt6vKDaJjhvHtg%3D&reserved=0 [3]
> Link: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgcc.gnu.org%2Fonlinedocs%2Fgcc%2FOptimize-Options.html%23index-finline-stringops&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C4caf8956c2d94439c19a08df206dd40b%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639265328227777215%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=fyZA9XC%2FwSAUc346VWT%2FmyeqddqeTo62dBKtiJilR9U%3D&reserved=0 [4]
> Closes: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2FClangBuiltLinux%2Flinux%2Fissues%2F2183&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C4caf8956c2d94439c19a08df206dd40b%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639265328227792263%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=49HfUDlzn%2FLUeISQ7%2BFR5jE7lZkqfORaqjauLn8cdm0%3D&reserved=0
> Cc: stable@vger.kernel.org # v6.12+
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Ok, I checked the version that is in the rng tree, namely commit 
eb13a1ff271b ("random: vDSO: avoid call to memset() when zeroing 
reserved parameter"). Looks similar to this mail.

It looks ok, no change to generated loop on powerpc32 neither with gcc 
13 nor gcc 16.

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

> ---
>   arch/arm64/kernel/vdso/Makefile     | 2 +-
>   arch/loongarch/vdso/Makefile        | 1 +
>   arch/powerpc/kernel/vdso/Makefile   | 1 +
>   arch/riscv/kernel/vdso/Makefile     | 1 +
>   arch/s390/kernel/vdso/Makefile      | 1 +
>   arch/x86/entry/vdso/vdso64/Makefile | 2 +-
>   init/Kconfig                        | 5 +++++
>   7 files changed, 11 insertions(+), 2 deletions(-)
> 

