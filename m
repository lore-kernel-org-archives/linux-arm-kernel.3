Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E5CC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 12:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=APcD8eR5Rx2mejIYFbbWIeB6SYD94yIJ2SqD2Y1vzjY=; b=bOq/W8THAt9yr2+mImkSHMrHx6
	Fsw43NHEWrvNoPMRru+lO31RGVcAMiBP8f/pgt/8sthp2qxKdIqG0M4hAPV82S52zkfU7jG1F7pwd
	Ugz6uaPT087oqoRlgbJ643TuIbxtVXzAnvsCHRRuHlfYYdGYwCUrbZZQ3zOl19dcOwgciWUKRkvHE
	RRDz1DZ/PC4Wxl1NJiUQ3cwH2yzCKnwoMArrdPuQBNTeKH9fFpErWdzes2uOa/w/hoB37TGUx0uwP
	UkfNwo9FcdUwaznkYPYM9JYf5nEsAGYut18myXveaHjM6cr+QVpEKXUyMqvfEKHi6jPVH0pdfyL0y
	xOLA4PHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt3ny-0000000E6XE-1hIp;
	Fri, 14 Mar 2025 12:06:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt3k0-0000000E5lw-0CWv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 12:02:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4B541424;
	Fri, 14 Mar 2025 05:02:25 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F08C23F5A1;
	Fri, 14 Mar 2025 05:02:13 -0700 (PDT)
Date: Fri, 14 Mar 2025 12:02:11 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, robh@kernel.org,
	broonie@kernel.org, maz@kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] arm64/sysreg: Fix unbalanced closing block
Message-ID: <Z9Qaw_EVGVdv3Qyh@J2N7QTR9R3.cambridge.arm.com>
References: <20250115162600.2153226-1-james.clark@linaro.org>
 <20250115162600.2153226-2-james.clark@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115162600.2153226-2-james.clark@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_050216_128067_B4E4D161 
X-CRM114-Status: GOOD (  16.31  )
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

On Wed, Jan 15, 2025 at 04:25:55PM +0000, James Clark wrote:
> This is a sysreg block so close it with one. This doesn't make a
> difference to the output because the script only matches on the
> beginning of the word to close blocks which is correct by coincidence
> here.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  arch/arm64/tools/sysreg | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 762ee084b37c..bbe7df69da9c 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -2074,7 +2074,7 @@ EndEnum
>  Res0	4:2
>  Field	1	ExTRE
>  Field	0	E0TRE
> -EndSysregFields
> +EndSysreg
>  
>  Sysreg	SMPRI_EL1	3	0	1	2	4
>  Res0	63:4
> -- 
> 2.34.1
> 

