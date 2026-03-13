Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C08105F789
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 09:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=86FZvQSPCl867RJ7yY+gpvVu/WKWsCxG782ZR1R285g=; b=FDQy0dqAmwAEcavHLhqxHDEj6n
	E61COWwbZNymZaq8VTbjHiRn3XLNM3X6D/EukH8u3FUpPvegR52Opy+bOHry1lyNhj30/5LTqdmLA
	Oiyy2JUAMzDHp9Pxpwf211nyDQGxXDQEju04Lo1ZRInXJ+cRfRUlLNuUmhh+j5d6sZkkpHgHeDoAF
	FSpUOZ7XoIfU2keQhr9axnl4QVK6dUs2OWNgo11oDn+hvm1fb+7bmbXsRoNt7b3r8xQkgMGfNdZ8c
	HLTNQ1G5F33Jc53gbF1uQUXZyny5hQTFyJYISM0E9OrgTibYBmTb4dGnbd/GQxfdok5a9lLclFLqX
	hcdrRvhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zJ6-0000000HSx8-3f0T;
	Fri, 13 Mar 2026 09:59:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zJ5-0000000HSwM-0Rqq
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Mar 2026 09:59:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=86FZvQSPCl867RJ7yY+gpvVu/WKWsCxG782ZR1R285g=; b=OSfKiNZFm9P7pI6QUB7i3tim41
	NDb7Jnu7dZ5RriOLYoUF4kBdieE25e8xZ9vZNglM5HMts7Q4RMtcc8mSuVMCce0hOQgJUC9ZEmEg/
	dmYy6nRWhUt5vueteLyveoZsQumY1qorXwAwCqmSLVRdlrUg7h2r5z5GLUdxnM6xT7ojcfBJAA+yU
	sjl2iGOv28YmfcFpya16d22fC6L2KV2efQFxQ6ixlrM5Abr5h/RJ5uxW+0VGIZ6JYiiBcpBYQfCVE
	6uNRy/kKCay/rTGiBPzrbmZMKbsZLRH7P5dzizY3SIT79QIAF65a4UAoj/3ygpEk8RhamUVr+d+CZ
	Jr5bl2jA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zIy-0000000327z-1QwU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 09:59:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D33CE165C;
	Fri, 13 Mar 2026 02:59:30 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BA0773F73B;
	Fri, 13 Mar 2026 02:59:35 -0700 (PDT)
Date: Fri, 13 Mar 2026 09:59:30 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: Clear VTCR_EL2 in __init_el2_stage2()
Message-ID: <abPgAi2oDd_jFK_s@J2N7QTR9R3>
References: <20260313053857.1277828-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313053857.1277828-1-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_095942_646303_39E6AE98 
X-CRM114-Status: GOOD (  17.64  )
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

On Fri, Mar 13, 2026 at 05:38:57AM +0000, Anshuman Khandual wrote:
> Clear VTCR_EL2 along with VTTBR_EL2 register in __init_el2_stage2(), which
> ensures that MMU stage-2 translation remain disabled.

As Marc noted, that's not true -- whether stage 2 is enabled is governed
entirely by HCR_EL2.VM.

The only reason to initialize VTCR_EL2 here would be if some field in
VTCR_EL2 applies when stage 2 is *disabled*.

> Although clearing out VTTBR_EL2 probably should have been sufficient
> but adding VTCR_EL2 improves overall safety.

It's unhelpful to send patches like this with unclear or non-existent
rationale, and vague statements about what the patch might do. Was there
some specific reason to send this? e.g.

* Did you have any specific reason to believe that setting some field in
  VTCR_EL2 was necessary? e.g. is there some misleading documentation,
  or comment elsewhere in the kernel?

* Are you trying to fix some problem you've encountered, but haven't
  managed to debug?

* Was this purely from inspection?

Mark.

> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Oliver Upton <oupton@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/arm64/include/asm/el2_setup.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
> index 85f4c1615472..2c88033591bb 100644
> --- a/arch/arm64/include/asm/el2_setup.h
> +++ b/arch/arm64/include/asm/el2_setup.h
> @@ -189,6 +189,7 @@
>  /* Stage-2 translation */
>  .macro __init_el2_stage2
>  	msr	vttbr_el2, xzr
> +	msr	vtcr_el2, xzr
>  .endm
>  
>  /* GICv3 system register access */
> -- 
> 2.30.2
> 

