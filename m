Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0427CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 13:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TDy/ylaNKkcPbDh0SidKsuPyPtCK4ApApGvEb4sbVSg=; b=MNwI2xX6ccZd2D70+DLrdRT+1n
	ZT8jc0dtWJQPQHEBSgaV+TDpx7BW8r5nMFskatP1pHgsnFhEH1740MvSxbcb6dZ5dwyjFoxF4l/6C
	dYeLSOBgR/cA1X5jGu6DK16X3lmuldBdQuRm1MN0S0dmCpflh8xrKqXgU1ezOjRoxL5PjqS0OLc0T
	LzrcoGdMSF0w3PeNzFzc/eWNHqlpR3uNh8yi4VqxT33wG6beDiReNTJzaM+jcPC5suLPygFclSogE
	Viz3TyD5+QUULCtfG/gu3cOq/9YW04fKOwodcly7BtfGNNcuYqe7R6JSK6DTGM3iWz9qxnsmU/uYr
	y8+XZBLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCdKQ-0000000BfI4-1K7j;
	Fri, 02 Oct 2026 13:29:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCdKP-0000000BfHy-0jHF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 13:29:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 30C1660A96;
	Fri,  2 Oct 2026 13:29:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D785D1F00893;
	Fri,  2 Oct 2026 13:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790947771;
	bh=TDy/ylaNKkcPbDh0SidKsuPyPtCK4ApApGvEb4sbVSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=orCruk43+nSFFiP6bOAx0zCF4GQDD0e6+mS4DzJNvojJuXfRJ5aZLkTE+ycffQgvE
	 57P/BrTw9swkFlqjlqSZUJTDJizUBj2l2a1dIWyxdZebhvP9wp4iIvhLwOKy4k+DxP
	 lehxpSmYnrrSt0FER4vI9clI2paYmMfCSCYvfNhhM9qyRygV2djrhv4KBuwPaRJyjK
	 XYDxx2I9CnP1iMom+LlFIrP2xSwCiUllHUO3KHcPcfH9jKx3Sjoa3TE3AoQ3SNiyKk
	 2OLf9F7UW8KaCEf8cu9b3y0iiBQWVx2bsrpC2PLfCkCLTGmUPUoijT66lByFjHMQwk
	 lCKAtLnXv7big==
Date: Fri, 2 Oct 2026 14:29:26 +0100
From: Will Deacon <will@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Fuad Tabba <tabba@google.com>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/boot: Don't set PMUv3p9 FGT2 bits without PMUv3
Message-ID: <ar-xtsSOqwWK9jWQ@willie-the-truck>
References: <20260930121212.3101361-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930121212.3101361-1-fuad.tabba@linux.dev>
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

On Wed, Sep 30, 2026 at 01:12:12PM +0100, Fuad Tabba wrote:
> On a CPU with FGT2 and an IMPLEMENTATION DEFINED PMU (PMUVer 0b1111),
> __init_el2_fgt2 sets the PMUv3p9 bits in HDFGRTR2_EL2 and HDFGWTR2_EL2,
> which are RES0 there. The macro only checks that PMUVer is at least
> PMUv3p9, and 0b1111 passes.
> 
> Exclude 0b1111 before the compare, as __init_el2_debug does.
> 
> Fixes: 858c7bfcb35e1 ("arm64/boot: Enable EL2 requirements for FEAT_PMUv3p9")
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  arch/arm64/include/asm/el2_setup.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
> index 87560d8b254e6..1da277baacf78 100644
> --- a/arch/arm64/include/asm/el2_setup.h
> +++ b/arch/arm64/include/asm/el2_setup.h
> @@ -421,8 +421,9 @@
>  	mov	x2, xzr
>  	mrs	x1, id_aa64dfr0_el1
>  	ubfx	x1, x1, #ID_AA64DFR0_EL1_PMUVer_SHIFT, #4
> -	cmp	x1, #ID_AA64DFR0_EL1_PMUVer_V3P9
> -	b.lt	.Lskip_pmuv3p9_\@
> +	cmp	x1, #ID_AA64DFR0_EL1_PMUVer_IMP_DEF
> +	ccmp	x1, #ID_AA64DFR0_EL1_PMUVer_V3P9, #8, ne
> +	b.lt	.Lskip_pmuv3p9_\@		// Skip if < PMUv3p9 or IMP_DEF

Are you sure #8 is the correct immediate for the ccmp? My reading of the
pseudocode is that it should be #9, but this instruction has always confused
me and I hate the fact that it doesn't take another condition code mnemonic
instead of a raw immediate value.

Will

