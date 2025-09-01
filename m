Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DF5CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 19:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cV5OJglULPTt+xt0aGUVyF0eHFXIwnz0I/sY2PHK9D0=; b=FKUTNFeX665g9MiM4P7MZSBD2Q
	v8GKi3uJc1WM3tQzpRtWps55uu5gZvjrG2/00coXx51R9BzjRU+jL6rX99rjqLxRgA66NvHXsmht8
	0ozoUMzEVA2Zp6WAaCiPC7Ilseffdfo86Wx9NcjTciP31WDX3NTAKSqq6i8w3YB+9cMbjsA+zQAUZ
	oQgyUU1VxuTnJRMunRDpn/dV6UaLpMLJMfd+jV7hzYM6TnqRdy7LOKwTaGVlGsm/BSPJzIEnwAWZ9
	DuKEcBuLmqRZ9zdYs+pk9kc7iUVu+yyiIuGcJUh0qOjrV5NK+MZDnSw8KY3SrXt52pNtaTsiWpwy9
	eAdOKa0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utAXf-0000000Dgm0-0ttg;
	Mon, 01 Sep 2025 19:50:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut6Dc-0000000D1Lk-15AX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 15:13:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9EC916A3;
	Mon,  1 Sep 2025 08:13:05 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 33B8D3F6A8;
	Mon,  1 Sep 2025 08:13:10 -0700 (PDT)
Date: Mon, 1 Sep 2025 16:13:07 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, broonie@kernel.org,
	oliver.upton@linux.dev, anshuman.khandual@arm.com, robh@kernel.org,
	james.morse@arm.com, mark.rutland@arm.com, joey.gouly@arm.com,
	ahmed.genidi@arm.com, kevin.brodsky@arm.com,
	scott@os.amperecomputing.com, mbenes@suse.cz,
	james.clark@linaro.org, frederic@kernel.org, rafael@kernel.org,
	pavel@kernel.org, ryan.roberts@arm.com, suzuki.poulose@arm.com,
	maz@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v4 2/5] arm64: initialise SCTLR2_ELx register at boot time
Message-ID: <aLW4A3rTcJvA0c+j@e133380.arm.com>
References: <20250821172408.2101870-1-yeoreum.yun@arm.com>
 <20250821172408.2101870-3-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821172408.2101870-3-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_081316_375962_CCF89DFB 
X-CRM114-Status: GOOD (  25.70  )
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

On Thu, Aug 21, 2025 at 06:24:05PM +0100, Yeoreum Yun wrote:
> The value of the SCTLR2_ELx register is UNKNOWN after reset.
> If the firmware initializes these registers properly, no additional
> initialization is required.
> However, in cases where they are not initialized correctly,
> initialize the SCTLR2_ELx registers during CPU/vCPU boot
> to prevent unexpected system behavior caused by invalid values.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---

[...]

> diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
> index 23be85d93348..c25c2aed5125 100644
> --- a/arch/arm64/include/asm/assembler.h
> +++ b/arch/arm64/include/asm/assembler.h
> @@ -738,6 +738,21 @@ alternative_endif
>  	set_sctlr sctlr_el2, \reg
>  .endm
>  
> +/* Set SCTLR2_ELx to the @reg value. */
> +.macro set_sctlr2_elx, el, reg, tmp
> +	mrs_s	\tmp, SYS_ID_AA64MMFR3_EL1
> +	ubfx	\tmp, \tmp, #ID_AA64MMFR3_EL1_SCTLRX_SHIFT, #4
> +	cbz	\tmp, .Lskip_sctlr2_\@
> +	.if	\el == 2
> +	msr_s	SYS_SCTLR2_EL2, \reg
> +	.elseif	\el == 12
> +	msr_s	SYS_SCTLR2_EL12, \reg
> +	.else
> +	msr_s	SYS_SCTLR2_EL1, \reg
> +	.endif
> +.Lskip_sctlr2_\@:
> +.endm
> +

You were right that just doing

	msr_s	SYS_SCTLR_\el, \reg

here doesn't work.  It looks like we rely on the C preprocessor to
expand the SYS_FOO_REG names to numeric sysreg encodings.  By the time
the assembler macros are expanded, it is too late to construct sysreg
names -- the C preprocessor only runs once, before the assembler.

So, your code here looks reasonable.

But, it will still silently do the wrong thing if \el is empty or
garbage, so it is probably worth adding an error check:

	.else
	.error "Bad EL \"\el\" in set_sctlr2_elx"
	.endif


Also, looking at all this again, the "1", "2" and "12" suffixes are not
really numbers: SYS_REG_EL02 would definitely not be the same thing as
SYS_REG_EL2 (although there is no _EL02 version of this particular
register).

So, can you use .ifc to do a string comparison instead?

If might be a good idea to migrate other macros that use an "el"
argument to do something similar -- although that probably doesn't
belong in this series.

The assembler seems to have no ".elseifc" directive, so you'll need
separate nested .ifc blocks:

	.ifc	\el,2
	msr_s	SYS_SCTLR2_EL2, \reg
	.else
	.ifc	\el,12
	msr_s	SYS_SCTLR2_EL12, \reg
	.else
	.ifc	\el,1
	msr_s	SYS_SCTLR2_EL1, \reg
	.else
	.error	"Bad EL \"\el\" in set_sctlr2_elx"
	.endif
	.endif
	.endif

(Note, I've not tested this approach.  If you can think of a better
way, please feel free to suggest.)

[...]

> diff --git a/arch/arm64/kernel/hyp-stub.S b/arch/arm64/kernel/hyp-stub.S
> index 36e2d26b54f5..ac12f1b4f8e2 100644
> --- a/arch/arm64/kernel/hyp-stub.S
> +++ b/arch/arm64/kernel/hyp-stub.S
> @@ -144,7 +144,17 @@ SYM_CODE_START_LOCAL(__finalise_el2)
>  
>  .Lskip_indirection:
>  .Lskip_tcr2:
> +	mrs_s	x1, SYS_ID_AA64MMFR3_EL1
> +	ubfx	x1, x1, #ID_AA64MMFR3_EL1_SCTLRX_SHIFT, #4
> +	cbz	x1, .Lskip_sctlr2
> +	mrs_s	x1, SYS_SCTLR2_EL12
> +	msr_s	SYS_SCTLR2_EL1, x1
>  
> +	// clean SCTLR2_EL1
> +	mov_q	x1, INIT_SCTLR2_EL1
> +	msr_s	SYS_SCTLR2_EL12, x1

I'm still not sure why we need to do this.  The code doesn't seem to
clean up by the EL1 value of any other register -- or have I missed
something?

We have already switched to EL2, via the HVC call that jumped to
__finalise_el2.  We won't run at EL1 again unless KVM starts a guest --
but in that case, it's KVM's responsibility to set up the EL1 registers
before handing control to the guest.

In any case, is SCTLR2_EL1 ever set to anything except INIT_SCTLR2_EL1
before we get here?

[...]

Cheers
---Dave

