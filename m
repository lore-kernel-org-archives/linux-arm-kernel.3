Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CABCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 18:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nNYM3PTBUmmX8hJjPEtf+m9eY33C4VyMUMluZcFKYYg=; b=bsiIf2Pn4tNGbcReufitxjZ3x/
	qXXv+eafuSw+Ng/TzFvv/zhBJvD9OjHUXVRU6YqiIKYEJbJ/pDYoc76vP8FvhgO3ySqaQYUFexkT8
	epzl5JEwjY/ZfVf6+i0iXpnp8vicG090pKkLvyVNakO1th8sLIwhptsamoCXgCJzeLhAjEk+1EhqF
	Kzaoq0UxG3RyFjUcEhCUCYoY2j+toigBj7fnU3xp+k8niQmPor2+x3sD+0T437kehE6WHlqAUgQhL
	qLtRKTOa6m5CMp31GhSzx0F4859M8+kL2iw7t99FxNaJKqM1d1q5a1jr0XAH1Fwjnv5023JUeW5jp
	zwm71zPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uonah-0000000EgqN-30I9;
	Wed, 20 Aug 2025 18:31:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uokSg-0000000ECXk-47Ku
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 15:10:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 270261D31;
	Wed, 20 Aug 2025 08:10:42 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 695743F738;
	Wed, 20 Aug 2025 08:10:46 -0700 (PDT)
Date: Wed, 20 Aug 2025 16:10:26 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, broonie@kernel.org,
	oliver.upton@linux.dev, anshuman.khandual@arm.com, robh@kernel.org,
	james.morse@arm.com, mark.rutland@arm.com, joey.gouly@arm.com,
	ahmed.genidi@arm.com, kevin.brodsky@arm.com,
	scott@os.amperecomputing.com, mbenes@suse.cz,
	james.clark@linaro.org, frederic@kernel.org, rafael@kernel.org,
	pavel@kernel.org, ryan.roberts@arm.com, suzuki.poulose@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, kvmarm@lists.linux.dev,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v3 1/5] arm64: make SCTLR2_EL1 accessible
Message-ID: <aKXlYhhrNp/8StK2@e133380.arm.com>
References: <20250813120118.3953541-1-yeoreum.yun@arm.com>
 <20250813120118.3953541-2-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813120118.3953541-2-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_081051_056673_4B4A4135 
X-CRM114-Status: GOOD (  16.99  )
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

Hi,

On Wed, Aug 13, 2025 at 01:01:14PM +0100, Yeoreum Yun wrote:
> When the kernel runs at EL1, and yet is booted at EL2,
> HCRX_EL2.SCTLR2En must be set to avoid trapping SCTLR2_EL1 accesses
> from EL1 to EL2.
> 
> Ensure this bit is set at the point of initialising EL2.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Reviewed-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/include/asm/el2_setup.h | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
> index 46033027510c..d755b4d46d77 100644
> --- a/arch/arm64/include/asm/el2_setup.h
> +++ b/arch/arm64/include/asm/el2_setup.h
> @@ -57,9 +57,15 @@
>          /* Enable GCS if supported */
>  	mrs_s	x1, SYS_ID_AA64PFR1_EL1
>  	ubfx	x1, x1, #ID_AA64PFR1_EL1_GCS_SHIFT, #4
> -	cbz	x1, .Lset_hcrx_\@
> +	cbz	x1, .Lskip_hcrx_GCSEn_\@
>  	orr	x0, x0, #HCRX_EL2_GCSEn
>  
> +.Lskip_hcrx_GCSEn_\@:
> +	mrs_s	x1, SYS_ID_AA64MMFR3_EL1
> +	ubfx	x1, x1, #ID_AA64MMFR3_EL1_SCTLRX_SHIFT, #4
> +	cbz	x1, .Lset_hcrx_\@
> +	orr	x0, x0, HCRX_EL2_SCTLR2En

Nit: prefix immediate operands with # please -- see usage elsewhere in
this file.

(This comes from the legacy AArch32 syntax and has never been required
by AArch64 assemblers, but it has become a tradition in the Linux arch
code...)

The only execptions to this rule are macros (mov_q, mrs_s etc. --
frequently they have an underscore in the name; "real" instructions
never do.)

> +
>  .Lset_hcrx_\@:

Maybe rename this label to .Lskip_hcrx_SCTLR2En_\@, so that people
don't have to keep renaming an existing label whenever they add
another block here.

>  	msr_s	SYS_HCRX_EL2, x0
>  .Lskip_hcrx_\@:

[...]

Cheers
---Dave

