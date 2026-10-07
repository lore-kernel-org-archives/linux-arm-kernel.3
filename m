Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA85CA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 08:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B1Uiwh5jX0BC4w6e0wMBFDp0eTMeyg7ke9kUoqxSZi0=; b=pFly+RhiX4z60u6DqmYep/QvkU
	aTQBl8F/SsUtO24HpB2K7N08ZcZx9jORkvcv9iZcDtwmd/2oyHkOaHRaD2WY/d3a6rdY8aDeNgkG4
	+r96bERCyk/SwBAmDx1KyFdJIH49Bsb5E4fRj9m2sVurVys/EgWWggJNvvwl1KtdxndvoBDcOPTd5
	+LfbeuH6gX8ZlZ8u72Y6QPw6+LuabmzmmebmLQ6dIq4ypMtnhNTT19kreV/eQRY7mr8FpEJow8z4B
	0jJPBAJ0zo3Fbvkh4IF+rRiGunMQ6ek7xaataERrXf6nMDSdon6e5J2Yoh4OhqwmTlgnzgL5CH1y+
	YsLHEdDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMin-00000001vZo-3Edn;
	Wed, 07 Oct 2026 08:09:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMil-00000001vZC-1Ijo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 08:09:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1FAFD1477;
	Wed,  7 Oct 2026 01:09:45 -0700 (PDT)
Received: from NH27D9T0LF (unknown [10.57.10.243])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 613683F86F;
	Wed,  7 Oct 2026 01:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791360588; bh=XkR9yeNdMSFEwvPlpk4SbHA8XMyXCGDkACApJUQd+iE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eG5BO9Flg7nSzjbWy5bqmKFKgAHlOCOJlq2tABAMJWVnr/aRSBRa28JtcMNCyyeqW
	 L+w+oytM08OB3NUR7Q0vZuiCxVworucaLfx7Gl44JfOHnZsKOe6OQAPHyFm0cmebfY
	 whZMe1g0GAvtVEubvL+paqu6vV/2PJFTlSlZdG60=
Date: Wed, 7 Oct 2026 10:09:37 +0200
From: Emanuele Rocca <emanuele.rocca@arm.com>
To: Jeremy Linton <jeremy.linton@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
	linux-modules@vger.kernel.org, broonie@kernel.org,
	jpoimboe@kernel.org, nathan@kernel.org, nsc@kernel.org,
	mcgrof@kernel.org, petr.pavlu@suse.com, da.gomez@kernel.org,
	samitolvanen@google.com, atomlin@atomlin.com,
	ndesaulniers@google.com, mark.rutland@arm.com, will@kernel.org,
	catalin.marinas@arm.com, ardb@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC 0/3]  kbuild: modules: Fixup arm64 BTI relocations
Message-ID: <asX-QZPtpUG5UdBU@NH27D9T0LF>
References: <20261006221815.2823252-1-jeremy.linton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006221815.2823252-1-jeremy.linton@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_010951_440544_C2D80B69 
X-CRM114-Status: GOOD (  16.34  )
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

On 2026-10-06 05:18, Jeremy Linton wrote:
> The kernel module loader, the arm64 ABI, GCC/Clang, and the static
> linkers operate with slightly different assumptions about which
> functions require BTI landing pads.
> 
> A static function called only directly does not normally need a BTI
> landing pad, so compilers omit it. A static linker producing an ET_REL
> module treats R_AARCH64_CALL26 as a direct branch and leaves the
> relocation for the module loader or later link pass. It does not know
> the final distance between sections or whether the loader will later
> require an indirect branch fixup.
> 
> This matters when a caller and callee are placed in different sections,
> for example by __init. The arm64 module loader may replace such a
> CALL26 relocation with a fixup containing an indirect branch, making an
> otherwise direct only function a BTI target. Ftrace makes this more
> likely because its entry NOP can replace a PAC instruction that would
> otherwise be a valid BTI landing pad.
> 
> A linker could conservatively add veneers to affected cross section
> calls, but that would require knowledge of arm64 module loader fixup
> semantics and is not part of the generic relocatable link contract.
> 
> Lets fix this by handling the module specific transformation during
> the kernel build. Scan cross section calls and, when the target lacks
> a BTI compatible landing pad, place a veneer in the target section,
> redirect the relocation to the veneer, and branch directly from the
> veneer to the original function entry.
> 
> Jeremy Linton (3):
>   kbuild: modules: Add arm64 BTI fixup utility
>   kbuild: modules: Build and trigger BTI scanner for arm64
>   arm64: bti: Drop compiler specific BTI checks

Tested as follows on BTI-capable hardware:

- Built a kernel with these patches and CONFIG_ARM64_BTI_KERNEL=y
- Verified that a test kernel module can successfully branch indirectly
  to a valid 'bti c' landing pad
- The same test kernel module triggers an Oops - BTI if branching
  indirectly to a nop

  Internal error: Oops - BTI: 0000000036000002 [#1]  SMP
  Modules linked in: bti_probe(OE+) binfmt_misc nls_iso8859_1 aes_ce_blk [...]
  
  [...]
  
  pc : bti_bad+0x1c/0x28 [bti_probe]
  lr : bti_bad+0x14/0x28 [bti_probe]
  sp : ffff800083933a40
  x29: ffff800083933a40 x28: 000000000000000c x27: 0000000000000000
  x26: 0000000000000000 x25: ffff800083933c90 x24: ffffaaa7c52c7058
  x23: ffffaaa7567d1040 x22: 0000000000000000 x21: 0000000000000000
  x20: ffff0000d11cd100 x19: 0000000000000001 x18: ffff800083795058
  x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
  x14: ffffffffffffffff x13: 7465677261742049 x12: 54422064696c6176
  x11: 6e6920676e697265 x10: 0000000000000000 x9 : 0000000000000000
  x8 : 0000000000000000 x7 : 0000000000000000 x6 : 0000000000000000
  x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
  x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffffaaa7567cf044
  Call trace:
   bti_bad+0x1c/0x28 [bti_probe] (P)
   bti_probe_init+0x78/0xff8 [bti_probe]

No Oops was hit, as expected, booting the kernel with arm64.nobti.
Other than that, the system works fine under regular workloads.

Tested-By: Emanuele Rocca <emanuele.rocca@arm.com>

