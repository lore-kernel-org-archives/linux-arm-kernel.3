Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1440AC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 09:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mxeXusIpT4JLAHg8TjA/zy2FFJ5nu9a/hyR+4Ib3PRc=; b=AdK+Dodk3ugysUgoYsscLkhYJZ
	u0jG31z+ljKTDLGb2i6l03/wYQbJUn4LrRdRhsRloh8efuomTVEiy2lhh5jje+IAq9cotzBhEdBIe
	7hO+k9doRhOyilo7072yjHZPL5aiXfB+fbXEYgfKjxLq9XKUx9pcdRxkDRWwwhwTuZsdGFVhQF/96
	dI4i3+YO+Qfiktgq9eoNXpeir7tNId53+ByurIl7oiE0KjdIqh4/G1WmiL+dNcw5VuN79ghyCxsMd
	ajYbGTdnBLJDaoTe2TmSUk51qaJxRwq+LK2Q5tIi2dqj3BCxR8MvJ3K8wGPXL78ZdF/dFz4xpE5Zn
	SOhIPJgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueVW6-00000004TNU-24iy;
	Wed, 23 Jul 2025 09:12:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueV9s-00000004PpJ-109P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 08:49:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55BED1BCA;
	Wed, 23 Jul 2025 01:48:57 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA52E3F5A1;
	Wed, 23 Jul 2025 01:49:01 -0700 (PDT)
Date: Wed, 23 Jul 2025 09:48:53 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Weikang Guo <guoweikang.kernel@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: mm: Ensure phys_to_ttbr on pgdir for
 idmap_cpu_replace_ttbr1
Message-ID: <aICh9Z3dsEQj_79y@J2N7QTR9R3>
References: <20250722082117.1777570-1-guoweikang.kernel@gmail.com>
 <aH-mlN88NrTzahfM@J2N7QTR9R3>
 <20250723024923.GA1884099@ubuntu-virtual-machine>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723024923.GA1884099@ubuntu-virtual-machine>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_014904_353282_FAFDD9A1 
X-CRM114-Status: GOOD (  34.89  )
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

On Wed, Jul 23, 2025 at 10:50:55AM +0800, Weikang Guo wrote:
> On Tue, Jul 22, 2025 at 03:56:20PM +0100, Mark Rutland wrote:
> > On Tue, Jul 22, 2025 at 04:21:13PM +0800, Weikang Guo wrote:
> > > Commit 5ffdfaedfa0a ("arm64: mm: Support Common Not Private translations")
> > > changed the contract of idmap_cpu_replace_ttbr1, requiring that the TTBR
> > > argument passed in should already be processed by phys_to_ttbr (i.e., in
> > > TTBR format, not just a raw physical address).
> > > 
> > > However, the current map_kernel implementation does not always convert the
> > > pgdir/ttbr argument via phys_to_ttbr before calling
> > > idmap_cpu_replace_ttbr1. This can lead to issues on systems with
> > > CONFIG_ARM64_PA_BITS_52 enabled, as the TTBR would not be properly folded
> > > per the ARMv8.2+ requirements.
> > 
> > For the cases below I don't believe that this is actually a problem.
> > Since commit:
> > 
> >   453dfcee70c5c344 ("arm64: booting: Require placement within 48-bit addressable memory")
> > 
> > ... we require that the kernel Image (including any trailing unallocated
> > bytes accounted for in image_size) are below the 48-bit address limit,
> > and so there should be no difference between the PA and TTBR format.
> > 
> > We could probably test and enforce that in the early boot code somehow,
> > if we're not doing that already.
> > 
> > If we were going to change things to avoid accidents in future, I think
> > it would be better to enforce this with the type system. e.g. we could
> > have a ttbr_val type that's distinct from phys_addr_t. Even then, for
> > the idmap code I think it's better to avoid the phys_to_ttbr() dance,
> > since that has runtime patching.
> > 
> > Mark.
> >
> 
> Thank you for your detailed explanation.
> 
> As you mentioned, if we can guarantee that the kernel image is always within
> the 48-bit PA range,then there is indeed no real difference between the PA
> and TTBR formats in this context.

Yep.

To be clear, I'm saying that there's no functional problem in practice,
and hence the description in the commit message is more alarming than
necessary.

Since the conversion is trivial I'm not against applying the conversion
consistently, but if we do that I think we should enforce that through
the type system so that missing conversions will be identified by the
compiler.

> In that case, does it mean that the conversion of `reserved_pg_dir`here is
> also redundant? (There may be other similar cases.)

Yes, 'reserved_pg_dir' should be part of the kernel Image and hence
below the 48-bit limit.

> If we already ensure the kernel is always mapped below 48 bits, it does
> seem safe to remove `phys_to_ttbr`here as well.

I assume for both instances of 'here' above you're referring to the
macro below.

> .macro  __idmap_cpu_set_reserved_ttbr1, tmp1, tmp2
>     adrp    \tmp1, reserved_pg_dir
>     phys_to_ttbr \tmp2, \tmp1    // This might not be needed either?
>     offset_ttbr1 \tmp2, \tmp1
>     msr ttbr1_el1, \tmp2
>     isb
>     tlbi    vmalle1
>     dsb nsh
>     isb
> .endm

Yes, the phys_to_ttbr conversion above isn't strictly necessary today.

Mark.

