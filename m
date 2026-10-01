Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 673E5CA5FC1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 03:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y2Zpul71weD9CBI7DrcMs31UK+QoDuNhk5HtLjz6AqI=; b=KITN7a/ReCm6UuHWuNDbyy0RFD
	0wAO6TRxwzapuffc6EvQPAl5Gw4f9BQ1nQJswrml05dKB5qdJedKbKVJ/mkVUo4jLapgJhPfZ5gJH
	yIFnsWpb5vy7Gf9hWC5zGZZu5bsuuN0jIW1pRoMIALGopWPq4p2fV+CWBuRv3H9mmXlTMRFo68XMk
	CCugB7cErQTwXSux3hmfUjMtRpfOKESBU+GtoDXCyEYGyMI7BxgbZLTqjRwKn41uK7aunG17LAVZK
	X+RjfQgD4kWN3exO1vh8MMxn7Z1utotWL+CMxK1FzmjJy0djRMjJQ2aMe1l/SoobnFaCLVqanOmp7
	oFt5QzCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC71e-00000007dMQ-1qg8;
	Thu, 01 Oct 2026 03:00:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC71a-00000007dLj-32BR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 03:00:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1CA2497;
	Wed, 30 Sep 2026 19:59:52 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6FF653F85F;
	Wed, 30 Sep 2026 19:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790823596; bh=7wWqjUAtG6cJhxUSqEkx6oz3OQgDJX1WqKbWG22ua2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gC4pQso9ESgG/Q0N1vngKej9BTI28UHobOVW5bFvnHCuP48fJUqCWAlH+cC7O2y4j
	 pZmOpTCJKaTPkV96kH98MViAgMiEXSX3t4qShWCUbMICTml19XKKFlaPtL3mRccylI
	 NQVNmrKCnBZ+w1VcyDlxdbLN6gPYrtmiPNVFJXYA=
Date: Thu, 1 Oct 2026 08:29:52 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	"Rob Herring (Arm)" <robh@kernel.org>, Fuad Tabba <tabba@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/boot: Don't set PMUv3p9 FGT2 bits without PMUv3
Message-ID: <gdmzysvukt3vvpvd32d2ahvzaclsvo24rmlihjlipbfvw3n3sg@66ofbfh7tsfg>
References: <20260930121212.3101361-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930121212.3101361-1-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_195958_899988_2CDCF289 
X-CRM114-Status: GOOD (  16.71  )
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

This fixes a semantics error during feature detection while also preventing
undesirable writes into RES0 fields in IMPLEMENTATION DEFINED PMU instances.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

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
>  
>  	orr	x0, x0, #HDFGRTR2_EL2_nPMICNTR_EL0
>  	orr	x0, x0, #HDFGRTR2_EL2_nPMICFILTR_EL0
> 
> base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
> -- 
> 2.39.5
> 

