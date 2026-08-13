Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC1FC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 07:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YsriNMG9eHDYtRKou8lVO1tS7JrbkBO3e2Yn3QQ/v4s=; b=E8883tIR6SFeC9jQR0+iovDYN7
	YJVbMpY3/J9PKb+EBfrtWYmObRbxBma8vrS8+Is4LH9FuQ2TOkAc0q+CN6an24MD+EiOckBHzYaU5
	Rz7T1cPXM631D39vctL9L7NkP7t6RC3Fgy7RDMdz0Aw07bZ4OJMgwbzaW79yyeDVUuLoyZwZ0Ly7/
	agcK4S8QK1SHtF+K+6X1udfCUymkea8TdQNDhfQcTy3cXw6yEKv1QNnznbEe0gS/QRoaYt3Ky+lon
	x2l+xbtu5f+kG2iw8ulr+DFvk7u6HntgFTanm/PKZ+TQtJmC3990MppOukEbnQN+KbG0DJXCgiQ/m
	Ivt5tnkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQGH-000000003bN-1jtw;
	Thu, 13 Aug 2026 07:54:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQGG-000000003ay-037S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 07:54:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AD5C041FD0
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 07:53:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 382E41F00A3D;
	Thu, 13 Aug 2026 07:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786607639;
	bh=YsriNMG9eHDYtRKou8lVO1tS7JrbkBO3e2Yn3QQ/v4s=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=ODbRou3MPZxRrYn5Xw90E0vFXe2xotqTLhZfIwUZ6ugZusyV0HrLHH2UUlbuT2CQg
	 y1ugnjoEyP3quSAlbw84O2v2HxqFuqGCV6x78DDGV7JX9Wt4/x8gAgxC7vmAU7J0zX
	 7slPlEZ3dVg1eibGk09Ic5eAn8DFpQVsRQHkXm27IzlHvmxl9amiKtd/5d3JX0ws2U
	 6cmQdyUrd432DTYA2BgIiw61IL8YiHvtyIQ1qkLehOsuj8mMArpdSQX1a68fs9S0vL
	 AhYM6avjkaRCgDXXcQtOGCq1S7BcgVKpooRybklhBWEWgsnHAW2RJSjn0mrj1WqTH8
	 h3piYBkZCymlQ==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id B0A7E1980062;
	Thu, 13 Aug 2026 03:53:57 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Thu, 13 Aug 2026 03:53:57 -0400
X-ME-Sender: <xms:E3h9aoWjLJrJKsxxBN33bde3oOVHEwG5B2yVBWmOCbkgyAAuk2mJAQ>
    <xme:E3h9anbxFbAFN1-smXaW7jhiqAk-LkHN5Bb4uzQ93VaQ4PMqEO0ZlhnzwMSlpEKFP
    OoulbDKceWLQ6lw5Spkz93fGunaomKNwYQ2_bgj7F5b0_-N71OTSipU>
X-ME-Proxy-Cause: dmFkZTF/JtEOdBnZjFp8xd8bqyDhKQWuoFDWh/xxaVzRKVjQ6OA+aoka10v0HuFh1axTah
    W5nYZFTHeheEQ5hqEpHj1P3+s9vEPq5fqblBz89MIleAKbhs1U1vzgI9BDvKYbzFDOhIdt
    wXAOjOv8CzELhjKJ+fGKTvqH50UbeBZ3ylbGstsCNw8SiSsizIQERl0l3tuhdDmlold50M
    adijXyJZalBUbvmWwZVfQZ9T7/o9U5J4KkZuFlILeI2UxEr7xmG8Gj3Hcs5Ei3ukP1p3/n
    Zb5tKIYGN+cgVXav1oKE5W0NPH8DHIh1r7xEIY2+k5V4rg+3U+HvSsRGM/VbYLx02g9wkz
    FUIOtBGaVRsG0IOcr1TJsMR0oAUVZsWoKS8uWXjXyqAiFsxruGtc8o7TvMYXPrc/9M8a/o
    IchhH5ZCXbgddpBezeajhY6W07/V9OHtczrkuQKb8QXEZ8z/zL6n/MWGZ3mEVcIKeRn1bd
    n5DzcTLMHC7LOD2fLbfb8T8h8rmUh2UABKDGeZZhobaB0YrRv4X3yOfm0Y87U161A4kQNw
    B4BOFcb+ZC4VWqn3JdWRyZbmBEuH3XGG5+QGfxvzBmCX1GI0TM6cX088h84fHEe65rKKur
    c4nt/o6j4PjKdOu/UuMuVZkB5DZPJ9898O/nwtF+x9dKYbDBAscDivZn6ajw
X-ME-Proxy: <xmx:FXh9au2iZdkSVPj71TVOedzzYwrDTpish5vTi6noUcvEFfwWLJ31LA>
    <xmx:FXh9atFK23m7kZ-G1zLketQan2XFWBESBAeRi0Wlg0Xiv6wUmtPGMg>
    <xmx:FXh9apHxBaFARa1fc3mrt6ShzTUld8WKVsciW2pqq3Iq-hq9okSBHg>
    <xmx:FXh9ag4B8IhFZpI2O6ZtgBXM1-VT_gEpunU6kjKcq70t6h443Vm8Uw>
    <xmx:FXh9auzbKJPC_IbE2lJzXqZ7KEwIhuaORJSA-E-QODRvz5ZjpU9z6AaN>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id ADC14F8006A; Thu, 13 Aug 2026 03:53:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 13 Aug 2026 10:53:34 +0300
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Josh Poimboeuf" <jpoimboe@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Will Deacon" <will@kernel.org>, "Catalin Marinas" <catalin.marinas@arm.com>,
 "Mark Rutland" <mark.rutland@arm.com>, "Mark Brown" <broonie@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>
Message-Id: <e75e5fd3-d7c7-43f0-bd30-d7f2ac834942@app.fastmail.com>
In-Reply-To: <ba248b4e-958d-4eef-bb66-22a737a6412d@app.fastmail.com>
References: <20260812162058.612202-4-ardb@kernel.org>
 <20260812162058.612202-5-ardb@kernel.org> <anzo2Q-TxbB0PUhi@jpoimboe>
 <ba248b4e-958d-4eef-bb66-22a737a6412d@app.fastmail.com>
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


On Thu, 13 Aug 2026, at 09:34, Ard Biesheuvel wrote:
> On Thu, 13 Aug 2026, at 00:52, Josh Poimboeuf wrote:
>> On Wed, Aug 12, 2026 at 06:21:00PM +0200, Ard Biesheuvel wrote:
>>> The compiler is permitted to omit BTI landing pads from static functions
>>> that never have their address taken, but are only called directly, even
>>> if those calls originate from other code sections.
>>> 
>>> This means that calls into a module's .text section from .init.text,
>>> which may need to be routed via a PLT if .text is out of direct
>>> branching range, may result in BTI exceptions due to the indirect calls
>>> performed by the PLT veneers. (Note that calls to .init.text from .text
>>> are not allowed.)
>>> 
>>> The 'solution' is to emit yet another veneer - this is what the ELF
>>> psABI for AArch64 mandates in this case.
>>> 
>>> So derive an upper bound for the number of veneers that may be needed in
>>> the core module region to ensure that any call from init code that ends
>>> up needing a PLT can be directed at a veneer with a BTI landing pad, and
>>> allocate the additional space.
>>> 
>>> Then, emit these veneers as needed, i.e., only when emitting a PLT entry
>>> for a call from an init code section to a normal code section in the
>>> same module. In practice, this only occurs when a module's .init.text
>>> happens to be allocated far away from its .text section, which might
>>> happen when the initial 128M 'near' module region runs out of space
>>> between allocating the core module and allocating its init region.
>>> 
>>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>>> ---
>>>  arch/arm64/Kconfig                  |   2 -
>>>  arch/arm64/include/asm/module.h     |  12 ++
>>>  arch/arm64/include/asm/module.lds.h |   3 +
>>>  arch/arm64/kernel/module-plts.c     | 128 +++++++++++++++++++-
>>>  4 files changed, 138 insertions(+), 7 deletions(-)
>>> 
>>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>>> index b3afe0688919..25fa80b5591d 100644
>>> --- a/arch/arm64/Kconfig
>>> +++ b/arch/arm64/Kconfig
>>> @@ -2114,8 +2114,6 @@ config ARM64_BTI_KERNEL
>>>  	depends on CC_HAS_BRANCH_PROT_PAC_RET_BTI
>>>  	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=94697
>>>  	depends on !CC_IS_GCC || GCC_VERSION >= 100100
>>> -	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106671
>>> -	depends on !CC_IS_GCC
>>
>> This doesn't work for livepatch though, and removing the "depends on
>> !CC_IS_GCC" is a livepatch regression as it broadly increases the
>> likelihood of ARM64_BTI_KERNEL (default y) getting enabled.
>>
>> So "livepatch broken on arm64 clang 21+" now becomes "livepatch broken 
>> on arm64".
>>
>
> ... when kernel mode BTI is enabled.
>
> I have no insight into which pieces of livepatch for arm64 are actually
> upstream. Is it just the tooling that is missing? In this case, though,
> I think HAVE_LIVEPATCH should depend on !ARM64_BTI_KERNEL, rather than
> the other way around. I can add that in v2.
>

BTW we may still try and get the compiler folks to add a command line
option to force BTI landing pads to be emitted for static functions, and
enable it for vmlinux only when livepatch is enabled. That way, we can
re-enable kernel mode BTI for all toolchains for the common case, and
have livepatch on arm64 (with BTI) depend on recent versions that implement
this option.



