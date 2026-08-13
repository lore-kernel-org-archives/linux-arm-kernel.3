Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 286D6C5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 06:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zunZIGyPfoBnf+StgiT5qJaLGefqa6q+YI+ZNu87vWI=; b=wEli6BackZXn2/cndFKpcOntKT
	iqO7vWd1JQkbdD+2UYsgLpSQyrNEfxELsF8n32eNEmE8O0ermTZeuWbDaEcUbDx4ZD+LylBKfMbgT
	lbwNWZpyGIEMygNz6vl9Zlc879jdNBdUAnqPUUqYa9ZOpZBIDgxAEAhL3D9rIrY/iGmtCERGl4fdr
	o+rB5XbAldKENC1qUhBSaHvSYEXhjHokCTdIxFqYIBFRJPNOmfhJE3Niq8cbaC6fmXyuXikSc6UJM
	2PE5Wwxfe9FeXF2WaxXqJMc7hIJamzJrc5IlYVTQemde/iv93X8pjYRaaOPNGJviYVjGqTh6QWZaQ
	U1Y+i0cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuP1y-0000000HUK8-34uY;
	Thu, 13 Aug 2026 06:35:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuP1x-0000000HUK1-2M9y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 06:35:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0FAE0408D8;
	Thu, 13 Aug 2026 06:35:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AE321F00A3A;
	Thu, 13 Aug 2026 06:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786602908;
	bh=zunZIGyPfoBnf+StgiT5qJaLGefqa6q+YI+ZNu87vWI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=Nxzc+fxV4wTOFZrZRW3Fo5t5cPU/W3IHONuTCYVWk0RhvECxyBopSV7+p3092kRjO
	 Sm3PzEk/4FcY/zmUvZZHSTvHKFi53wCA9e3mtnvYuy0zZ8IW1YdQj7WpLjhBkv5gZW
	 F8pW91kCFqb+2m5v14FPsdZHk7rjP0NetML9/PtLzzGag7DTmtci1c080EOZvW14wG
	 lxj1oqW8fOWTnx1VBFlSwMCuexgAsp7Cb9BBJ/zVGZXpM5RpgjOHIB6Ti9YD16VIFa
	 Wm6cY1zDe3/IEiBRQgaDaDy9GJOIDxOOQmHJTRmc6IuV8Ff6STHQ1ssxV0Xx9SCAaj
	 tLqP/jFxWOKww==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id CB5B9198005E;
	Thu, 13 Aug 2026 02:35:06 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Thu, 13 Aug 2026 02:35:06 -0400
X-ME-Sender: <xms:mGV9ajhUMDb5PoJcNok_0aiRwxLBlK5fUt01msSN5YD3yJ8BCHIpCw>
    <xme:mGV9aq3_bI3g_ZNihjHQ8j9wwEU4-FaeKknaFcteo14655ILKlcHQ-cnKfR7jAfcZ
    d32tvfd9O9IL2uGyTok6mcE3r2GxV7vwh-fBvbHHvtY3jdZU-IVUyAs>
X-ME-Proxy-Cause: dmFkZTGcXrxVSGoKgStFf2fyxRCLVTWU7kdNW7lArEO6sR2jbhmCp+SJajHB6eggVFLqLX
    g4gAPq8VAPPJ7ChBDMQzbwNxZF1Kbdl9Qx384PLASvx0F+Tetm7b83sMFhaCbNCo815Ihy
    8x0u7uqU0wnkuP+ehMYzKmcgYws9DXItcpwYAeQ4lb0FVFDn0F0UpukfdyGFrgduyZXn03
    vvFGCIMlTClGz9idSwFI9+TlXvwH2OjZcwa7h0yw1bmXDf0gUU8ZX/YpZLAasulahSAsev
    1/XjbJc/FDAnljjH45z2H4eYeqKyMNzgNzTt79sCNiFz5gBYyHhrUt5F/mz0tQG3qkycem
    oCnviP90Tio30EAsP+EJ5ZeSHzrGGhwGri5kbJN1E/hNU0Ka1MtGd7junuwoSx0caoFkCO
    iJBSUzzmsntDWyOnstImdVPeli19b2Vl9fh259RJBJVSb2yPYu/GJrHG5LWEHwLdPslyy3
    Ekq4za/y3amlTeC3WRvMbH8xv/j3AnguixlKW53My3NRQzCTHGu7rLW9dDf9dVdzwRSf/v
    doYBpvIUnrzwTKBCC0SVFCENU92G3aGiBnHJrBoHjYg71ERCONfakGk1kIfElaIw6LQK4q
    5LKgh6ULucwu/0SdGfW96RFgMqjcOCK258bow/5nFXTlrXIg7+R3hoveU2Yg
X-ME-Proxy: <xmx:mmV9akhMg10SjLFa3FXDrEgzemVMek5QVU5vQgUwKqsEVpo8iDRRrQ>
    <xmx:mmV9apAoiGoMrgL1y1gsSqj1xH7mAq2P-ng7A2gkfNXea7grMErbYw>
    <xmx:mmV9auT17Xe1nTKo0SucYUPO3ELDvLu10OWMiEeFFTdjLNmBPxBhMQ>
    <xmx:mmV9amVqIHSTHgwiM0QDog_1uBsch7chwP1EUqHXb-Jsq5L0DKVBhQ>
    <xmx:mmV9avffncOVmr8u-KMPof3UjLqVlIU_DiKqA2vjtfU3hF-UJcYFWE8y>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id B22ADF8006E; Thu, 13 Aug 2026 02:35:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 13 Aug 2026 09:34:44 +0300
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Josh Poimboeuf" <jpoimboe@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Will Deacon" <will@kernel.org>, "Catalin Marinas" <catalin.marinas@arm.com>,
 "Mark Rutland" <mark.rutland@arm.com>, "Mark Brown" <broonie@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>
Message-Id: <ba248b4e-958d-4eef-bb66-22a737a6412d@app.fastmail.com>
In-Reply-To: <anzo2Q-TxbB0PUhi@jpoimboe>
References: <20260812162058.612202-4-ardb@kernel.org>
 <20260812162058.612202-5-ardb@kernel.org> <anzo2Q-TxbB0PUhi@jpoimboe>
Subject: Re: [PATCH 1/2] arm64: module: Emit BTI veneers for cross-section calls
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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


On Thu, 13 Aug 2026, at 00:52, Josh Poimboeuf wrote:
> On Wed, Aug 12, 2026 at 06:21:00PM +0200, Ard Biesheuvel wrote:
>> The compiler is permitted to omit BTI landing pads from static functions
>> that never have their address taken, but are only called directly, even
>> if those calls originate from other code sections.
>> 
>> This means that calls into a module's .text section from .init.text,
>> which may need to be routed via a PLT if .text is out of direct
>> branching range, may result in BTI exceptions due to the indirect calls
>> performed by the PLT veneers. (Note that calls to .init.text from .text
>> are not allowed.)
>> 
>> The 'solution' is to emit yet another veneer - this is what the ELF
>> psABI for AArch64 mandates in this case.
>> 
>> So derive an upper bound for the number of veneers that may be needed in
>> the core module region to ensure that any call from init code that ends
>> up needing a PLT can be directed at a veneer with a BTI landing pad, and
>> allocate the additional space.
>> 
>> Then, emit these veneers as needed, i.e., only when emitting a PLT entry
>> for a call from an init code section to a normal code section in the
>> same module. In practice, this only occurs when a module's .init.text
>> happens to be allocated far away from its .text section, which might
>> happen when the initial 128M 'near' module region runs out of space
>> between allocating the core module and allocating its init region.
>> 
>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>> ---
>>  arch/arm64/Kconfig                  |   2 -
>>  arch/arm64/include/asm/module.h     |  12 ++
>>  arch/arm64/include/asm/module.lds.h |   3 +
>>  arch/arm64/kernel/module-plts.c     | 128 +++++++++++++++++++-
>>  4 files changed, 138 insertions(+), 7 deletions(-)
>> 
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index b3afe0688919..25fa80b5591d 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -2114,8 +2114,6 @@ config ARM64_BTI_KERNEL
>>  	depends on CC_HAS_BRANCH_PROT_PAC_RET_BTI
>>  	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=94697
>>  	depends on !CC_IS_GCC || GCC_VERSION >= 100100
>> -	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106671
>> -	depends on !CC_IS_GCC
>
> This doesn't work for livepatch though, and removing the "depends on
> !CC_IS_GCC" is a livepatch regression as it broadly increases the
> likelihood of ARM64_BTI_KERNEL (default y) getting enabled.
>
> So "livepatch broken on arm64 clang 21+" now becomes "livepatch broken 
> on arm64".
>

... when kernel mode BTI is enabled.

I have no insight into which pieces of livepatch for arm64 are actually
upstream. Is it just the tooling that is missing? In this case, though,
I think HAVE_LIVEPATCH should depend on !ARM64_BTI_KERNEL, rather than
the other way around. I can add that in v2.

> So either ARM64_BTI_KERNEL needs to depend on !LIVEPATCH (which will
> keep BTI disabled for most distros), or we need a different approach
> which uses __vmalloc_node_range() to allocate a veneer within 128MB of
> the target.  I can try to write that up.
>

Yes. Or pre-allocate some space in vmlinux for this purpose. I suppose
we might just use -fpatchable-function-entry for this, and add one
additional NOP to vmlinux for livepatch kernels, so that a landing pad
can be patched in as needed. AFAIR the ftrace code already deals with
the BTI landing pads gracefully.

> Hm, does the omitted BTI also break long intra-vmlinux branches for
> vmlinux text size > 128MB?
>
> The linker adds veneers for that case, but doesn't make them
> BTI-friendly unless GNU_PROPERTY_AARCH64_FEATURE_1_BTI is set on *all*
> .o files, which is not currently happening for .S files.
>

I think we should fix that.

> And when I force that bit with "-z force-bti" on a 700MB text
> allyesconfig vmlinux with 22k linker-created veneers, it's crashes the
> GNU linker :-/
>
> Seems kernel BTI is borked all around...

allyesconfig is useful, but it is not a configuration that is expected
to boot successfully. But it certainly shouldn't crash the linker, so
this is something we should report to the binutils folks.


