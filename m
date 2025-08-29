Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65086CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 14:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=25YrKnNhHO/S9MLRItgGncu8kEuQN8nwgpQEWcshZOo=; b=XYwJ23xAOcFHyCr8pOy6pqb43X
	X44BpnHThT6MJ1ZWCpWMksm01WEHiYVTB5JAOekDcQPJz6USZGNFcIiZP/f8PiFvhBHe1fTRClHA4
	LcIWV8HKSocBos1q8RcBVk81JkGrWNVh75wQGMeLaU7lK6ZMPq/mJDIxKc+cEl46hMa2xMBQUSUBv
	tXGp0pwv7c4gVkaqfeF/ANEiivuP7xLOW2hM7+xpxjFKpJrtrTyYa4Q7lb9ZVH6PeVSaFHDlR6iVd
	HeqHAref0r3mh42SkDyltw7aSfAOAiN7+d0gRL4IAveRnF5bv2qFNe5hpaTOJDZC0JcIZfE3CLKYY
	/nVZt7mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us0Kf-000000064wG-3HeF;
	Fri, 29 Aug 2025 14:44:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urw1X-00000005GER-30dv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 10:08:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF2A31758;
	Fri, 29 Aug 2025 03:07:48 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C09F23F694;
	Fri, 29 Aug 2025 03:07:53 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:07:46 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Fuad Tabba <tabba@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oliver.upton@linux.dev, will@kernel.org,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, vdonnefort@google.com, qperret@google.com,
	sebastianene@google.com, keirf@google.com, smostafa@google.com
Subject: Re: [PATCH v3 1/3] arm64: sysreg: Fix and tidy up sysreg field
 definitions
Message-ID: <aLF78ux6oTQYKnHr@J2N7QTR9R3>
References: <20250829095143.123476-1-tabba@google.com>
 <20250829095143.123476-2-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829095143.123476-2-tabba@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_030759_801515_E61136D4 
X-CRM114-Status: GOOD (  21.89  )
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

On Fri, Aug 29, 2025 at 10:51:41AM +0100, Fuad Tabba wrote:
> Fix the value of ID_PFR1_EL1.Security NSACR_RFR to be 0b0010, as per
> DDI0601/2025-06, which wasn't correctly set when introduced in commit
> 1224308075f1 ("arm64/sysreg: Convert ID_PFR1_EL1 to automatic generation").
> 
> While at it, remove redundant definitions of CPACR_EL12 and
> RCWSMASK_EL1 and fix some typos.
> 
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Acked-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
> Note that NSACR_RFR isn't used in the kernel as far as I could tell, so
> I didn't add a 'Fixes' tag.

Since this is all cleanup, I think that's fine, but were that necessary,
it would be nicer to have the NSACR_RFR fix separate from the other
cleanups.

FWIW, as this stands:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  arch/arm64/tools/sysreg | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 696ab1f32a67..f1a012ee0db6 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -31,7 +31,7 @@
>  # Mapping	<name_EL1>
>  # EndSysreg
>  
> -# Where multiple system regsiters are not VHE aliases but share a
> +# Where multiple system registers are not VHE aliases but share a
>  # common layout, a SysregFields block can be used to describe the
>  # shared layout:
>  
> @@ -54,7 +54,7 @@
>  #
>  # In general it is recommended that new enumeration items be named for the
>  # feature that introduces them (eg, FEAT_LS64_ACCDATA introduces enumeration
> -# item ACCDATA) though it may be more taseful to do something else.
> +# item ACCDATA) though it may be more tasteful to do something else.
>  
>  Sysreg	OSDTRRX_EL1	2	0	0	0	2
>  Res0	63:32
> @@ -474,7 +474,7 @@ EndEnum
>  Enum	7:4	Security
>  	0b0000	NI
>  	0b0001	EL3
> -	0b0001	NSACR_RFR
> +	0b0010	NSACR_RFR
>  EndEnum
>  UnsignedEnum	3:0	ProgMod
>  	0b0000	NI
> @@ -2528,10 +2528,6 @@ Field	17:16	ZEN
>  Res0	15:0
>  EndSysreg
>  
> -Sysreg	CPACR_EL12      3	5	1	0	2
> -Mapping	CPACR_EL1
> -EndSysreg
> -
>  Sysreg	CPACRALIAS_EL1  3	0	1	4	4
>  Mapping	CPACR_EL1
>  EndSysreg
> @@ -2576,10 +2572,6 @@ Sysreg	PFAR_EL12	3	5	6	0	5
>  Mapping	PFAR_EL1
>  EndSysreg
>  
> -Sysreg	RCWSMASK_EL1	3	0	13	0	3
> -Field	63:0	RCWSMASK
> -EndSysreg
> -
>  Sysreg	SCTLR2_EL1      3	0	1	0	3
>  Res0    63:13
>  Field   12      CPTM0
> -- 
> 2.51.0.338.gd7d06c2dae-goog
> 
> 

