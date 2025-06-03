Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA59C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 10:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DfwZTORNY7rUwxL491Aubhp4hYI00l3DpyDmUKkI5n4=; b=AmzowExbak+7f0nj5fFvyh9qBx
	LeGr/sAzkZlRp2X0QevEfyvM20RYWIQPr+9BAdjrz11jMp/MUDkaNpOp2C/vJ+U16noRiqs43++x9
	cSxaGLbZ7GqcHPzlWqHx//F0RHS3yQIOMblgfpDjrta1cDIZ/oz/eGflAbqUGKk8Anem37xy8G6z2
	+S8cMugwYRacbsfTzkKIVw/tZ3MU4aEego9Vjo6e3UGz4fpejyqTb4ESk2UyMkRB5EBOSPvii/dNm
	3Q9L4Kudwd71pAdppr3mhXIfS+IPhORufeb4ecPu4B8bTCit0wIRGOsjiZviXwOWWxELKs6qd7X5t
	Ou0sltoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMPBE-0000000AhEh-0UZ3;
	Tue, 03 Jun 2025 10:47:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMOJL-0000000Ac5d-2VkM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 09:52:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0EFB812FC;
	Tue,  3 Jun 2025 02:51:42 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B9BF3F5A1;
	Tue,  3 Jun 2025 02:51:58 -0700 (PDT)
Date: Tue, 3 Jun 2025 10:51:56 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	James Morse <james.morse@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Subject: Re: [BOOT-WRAPPER PATCH] aarch64: Enable access to MPAM by EL2 and
 below
Message-ID: <aD7FvJjQP8dU-EBg@J2N7QTR9R3.cambridge.arm.com>
References: <20250603084923.92311-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603084923.92311-1-vladimir.murzin@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_025159_681008_2BFDAE51 
X-CRM114-Status: GOOD (  18.63  )
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

On Tue, Jun 03, 2025 at 09:49:23AM +0100, Vladimir Murzin wrote:
> Disable any EL3 traps for MPAM and reset to default PARTIDs and PMGs
> by clearing enable bit.
> 
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>

Superficially this looks fine, but there's nothing about in booting.rst
in the kernel tree, which seems like an oversight.

James, are you happy that this is sufficient, or is there anything else
we might need to do at EL3?

If I don't hear anything I'll queue this by the end of the week.

Mark.

> ---
>  arch/aarch64/include/asm/cpu.h | 3 +++
>  arch/aarch64/init.c            | 5 +++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/arch/aarch64/include/asm/cpu.h b/arch/aarch64/include/asm/cpu.h
> index 2b3a659..ff38bf8 100644
> --- a/arch/aarch64/include/asm/cpu.h
> +++ b/arch/aarch64/include/asm/cpu.h
> @@ -143,6 +143,9 @@
>  #define HCR_EL2_RESET		HCR_EL2_RES1
>  
>  #define ID_AA64PFR0_EL1_GIC	BITS(27, 24)
> +#define ID_AA64PFR0_EL1_MPAM	BITS(43,40)
> +
> +#define MPAM3_EL3		s3_6_c10_c5_0
>  
>  /*
>   * RES1 bits,  little-endian, caches and MMU off, no alignment checking,
> diff --git a/arch/aarch64/init.c b/arch/aarch64/init.c
> index e1640a9..b31c4f3 100644
> --- a/arch/aarch64/init.c
> +++ b/arch/aarch64/init.c
> @@ -194,6 +194,11 @@ static void cpu_init_el3(void)
>  
>  		msr(SMCR_EL3, smcr);
>  	}
> +
> +	if (mrs_field(ID_AA64PFR0_EL1, MPAM)) {
> +		/* Use the default partition and disable lower traps */
> +		msr(MPAM3_EL3, 0);
> +	}
>  }
>  
>  void cpu_init_el2_armv8r(void)
> -- 
> 2.34.1
> 

