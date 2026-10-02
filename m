Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D85CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 14:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wW+usV49Hq4KSQaZfj7w72/oaCFS8UTUq2zzksz+k+4=; b=yuEhomYVDZB3UMxLkDaTfR7x1P
	L3Gj3wx97jIOSmqcIDB/pndVdnVwsxrIurrahcugeJKpo6VLS0zhDdwSwhSZsbOHg/dAERlPx1tXE
	Vj1UFQD4YWGji9kNtLnRSDEsBQvf1tWpPCgZLJ2Nb27M08aiHPfCZNwkGc/F2DLSUvZN9oS688fXa
	UC/nWKvx1t5BnboOb679fQbYZRtk27ODmaUYIPthTX/JPZf2dC7gkFyJQ9C0ERRmrx7bgVLaPtjbK
	FX+bV/H12x3dSOGy98HzGDzoCyhuXGO1ANS2KWC4v/FY21QA8kedSkbxHnxqHEIJhs6pmwml0Lx2e
	A/Y4raoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCdof-0000000Bj4T-1CYk;
	Fri, 02 Oct 2026 14:00:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCdoe-0000000Bj4H-1O9B
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 14:00:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B667E406E8;
	Fri,  2 Oct 2026 14:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B07A11F00893;
	Fri,  2 Oct 2026 14:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790949647;
	bh=wW+usV49Hq4KSQaZfj7w72/oaCFS8UTUq2zzksz+k+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aYzvfQ8oRLk1Q38eLu4xjkTEjKzzwx0LjWfvQzR7IhPwQ/hfr8bkZNGWiB6P5SASv
	 2LF63vEPjr7kQ783XlUeM/HSRGCoLQbYgq3PMQeW46AS6wOX+ug4xnLPTZfTjo8AtG
	 ggGFRnldVc7DNG1B6Yrm6m09bsNGumZCvJ3o4ORLYxlZgCSqFJcUH/yEjR4halyMk6
	 jTTxPgLcw6G9LlgYBO7rFpFNccQt8IAvv61gsATNq7mkw86TAywwiGDvMsTbffXpJH
	 y9OqmUoLFXRc52V/scmRU8YfgEKqJ4cQQfeGFEND1z56pERihYkTiqEdCnqEqYCog5
	 dD1eEBcf/jTWA==
Date: Fri, 2 Oct 2026 15:00:42 +0100
From: Will Deacon <will@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/boot: Don't set PMUv3p9 FGT2 bits without PMUv3
Message-ID: <ar-5CnttybD-1ojM@willie-the-truck>
References: <20260930121212.3101361-1-fuad.tabba@linux.dev>
 <ar-xtsSOqwWK9jWQ@willie-the-truck>
 <CA+EHjTzT+2M40GfyxHp6p6OugjoA2BRSkbFK-PMeLGz+qCUM9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTzT+2M40GfyxHp6p6OugjoA2BRSkbFK-PMeLGz+qCUM9w@mail.gmail.com>
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

On Fri, Oct 02, 2026 at 02:54:47PM +0100, Fuad Tabba wrote:
> On Fri, Oct 02, 2026 at 02:29:26PM +0100, Will Deacon wrote:
> > Are you sure #8 is the correct immediate for the ccmp? My reading of the
> > pseudocode is that it should be #9, but this instruction has always confused
> > me and I hate the fact that it doesn't take another condition code mnemonic
> > instead of a raw immediate value.
> 
> My read is that #8 is right. From the CCMP (immediate) pseudocode in the
> Arm ARM (DDI 0487 M.d, C6.2.81), flags start out as the nzcv immediate
> and are only overwritten by the compare when the condition holds:
> 
>       var flags : bits(4) = nzcv;
>       ...
>       if ConditionHolds(condition) then
>           ...
>           (-, flags) = AddWithCarry{datasize}(operand1, NOT operand2, '1');
>       end;
>       PSTATE.[N,Z,C,V] = flags;
> 
> So when PMUVer == IMP_DEF the ne fails and NZCV = 0b1000, i.e. N=1, V=0.
> LT is N != V (Table C1-1), so b.lt is taken and we skip. #9 would give
> N=1, V=1, so we'd fall through and set the bits on an IMP_DEF PMU.

Aha, that table is pretty helpful, thanks.

I think you're right -- I missed the inversion at the end of
ConditionHolds().

I'll pick this up next week.

Will

