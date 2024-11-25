Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1265D58060
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 10:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UpocEaOON1tFBt260iQMhHBj3O22KoL/Zaj+GAgDJeM=; b=nQwglv5mirhcT5EfE+aLm7dddt
	DVN4CqSnTXPlPzZHUS7NOShQTsfUOCUOjFvKFT7S+81CafG36vz50mpXcd50Vuj9Gjmelgws4JEy3
	p7LvMn9IVGjsN5O0kq4MXv540a0etuFjqanLDx8JkOPExnu74KywOjdsU6Gf8GxVIugfbbEMiI6CB
	OZJTL1cth1Rzg9tdujrA2vBFHqyEN6ZFV5VrE3YV1Y4G2kY77vY7gc0MOOR0PsNO7qS34VPYepmRF
	LX7vH4/BwAvEiOIKMAd95dmRiBObtjcBMQW5COvkwpOfMaLoqGbnyuchNfAbtaTEnJWpnn3hiyqYG
	UnpomfMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFWhN-00000007olj-3psE;
	Mon, 25 Nov 2024 10:52:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFWgQ-00000007oZ1-09VM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 10:51:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3355E1692;
	Mon, 25 Nov 2024 02:51:35 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 36CA93F66E;
	Mon, 25 Nov 2024 02:51:03 -0800 (PST)
Date: Mon, 25 Nov 2024 10:50:48 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Zorro Lang <zlang@redhat.com>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Joey Gouly <joey.gouly@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH for-next/fixes] arm64/mm: Fix false-positive
 !virt_addr_valid() for kernel image
Message-ID: <Z0RWcgrQASMIleRn@J2N7QTR9R3>
References: <90667b2b7f773308318261f96ebefd1a67133c4c.1732464395.git.lukas@wunner.de>
 <CAMj1kXFvJGHr_iv6bFQfb89XqPFrNWH7-rV7SFy4QBSWXYC4RA@mail.gmail.com>
 <CAMj1kXER7AbNyUDjtij6Ni0jVRMg11xvyhkCMKAxaKbx=dsgcQ@mail.gmail.com>
 <Z0RJaU4wjU5WeQb4@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z0RJaU4wjU5WeQb4@wunner.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_025110_115362_957A1362 
X-CRM114-Status: GOOD (  26.21  )
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

On Mon, Nov 25, 2024 at 10:54:49AM +0100, Lukas Wunner wrote:
> On Sun, Nov 24, 2024 at 06:13:26PM +0100, Ard Biesheuvel wrote:
> > > On Sun, 24 Nov 2024 at 17:16, Lukas Wunner <lukas@wunner.de> wrote:
> > > > Zorro reports a false-positive BUG_ON() when running crypto selftests on
> > > > boot:  Since commit 1e562deacecc ("crypto: rsassa-pkcs1 - Migrate to
> > > > sig_alg backend"), test_sig_one() invokes an RSA verify operation with a
> > > > test vector in the kernel's .rodata section.  The test vector is passed
> > > > to sg_set_buf(), which performs a virt_addr_valid() check.
> > > >
> > > > On arm64, virt_addr_valid() returns false for kernel image addresses
> > > > such as this one, even though they're valid virtual addresses.
> > > > x86 returns true for kernel image addresses, so the BUG_ON() does not
> > > > occur there.  In fact, x86 has been doing so for 16 years, i.e. since
> > > > commit af5c2bd16ac2 ("x86: fix virt_addr_valid() with
> > > > CONFIG_DEBUG_VIRTUAL=y, v2").
> > > >
> > > > Do the same on arm64 to avoid the false-positive BUG_ON() and to achieve
> > > > consistent virt_addr_valid() behavior across arches.
> [...]
> > that doesn't mean doing DMA from the kernel image is a great
> > idea. Allocations in the linear map are rounded up to cacheline size
> > to ensure that they are safe for non-coherent DMA, but this does not
> > apply to the kernel image. .rodata should still be safe in this
> > regard, but the general idea of allowing kernel image addresses in
> > places where DMA'able virtual addresses are expected is something we
> > should consider with care.
> 
> Other arches do not seem to be concerned about this and
> let virt_addr_valid() return true for the kernel image.
> It's not clear why arm64 is special and needs to return false.
> 
> However, I agree there's hardly ever a reason to DMA from/to the
> .text section.  From a security perspective, constraining this to
> .rodata seems reasonable to me and I'll be happy to amend the patch
> to that effect if that's the consensus.

Instead, can we update the test to use lm_alias() on the symbols in
question? That'll convert a kernel image address to its linear map
alias, and then that'll work with virt_addr_valid(), virt_to_phys(),
etc.

I don't think it's generally a good idea to relax virt_addr_valid() to
accept addresses outside of the linear map, regardless of what other
architectures do. We've had issues in the past with broken conversions,
and the fixups in virt_to_phys() is really only there as a best-effort
way to not crash and allow the warning messages to get out.

Mark.

