Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA54CC021B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 13:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O8RAAJFBDvPkSDNDOMYWdLDxkjRCHTk0liAfbgqSq2U=; b=2NULjvqdHFJSwp4KSuzmpF5evS
	mFspzcS01oQ5awIQ3CLmfRQlttQjUWahcbbPJUIrWIXyZ38AU4s1zVi229RF+SjBN1rWc8H9hckV+
	2ojMye2kk7SJEWwL40BQEkN1TIqa4ZWu+F2lQeoHxAevR/av7PDqQyNsbmeIU6XjzzFIkWGzXQWMJ
	BFhScBwTEPEm1q6Ap1t76oIhvnLNyJsVgEu9r5kIS/1jvr9h6qN2S8p6RoBq3Df5724gWtLK3i3PZ
	Wdw4nv/hbFO+oNNoglSIeCWs+yqoW8VPv4jjFD7RWzPMeDCUR2O6c+n58EE9Iwo6QZ6pFLQnIWybR
	H+Ds54nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYHs-0000000Dnxi-2kN7;
	Mon, 24 Feb 2025 13:14:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmXbv-0000000DhPO-09xf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 12:31:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16E761756;
	Mon, 24 Feb 2025 04:31:13 -0800 (PST)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9C133F6A8;
	Mon, 24 Feb 2025 04:30:55 -0800 (PST)
Date: Mon, 24 Feb 2025 12:30:50 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Subject: Re: [boot-wrapper] aarch64: Enable access into FEAT_FGT2 registers
 from EL2 and below
Message-ID: <Z7xmenE0scM9omcU@J2N7QTR9R3.cambridge.arm.com>
References: <20240730054643.157295-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730054643.157295-1-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_043059_118378_B394F673 
X-CRM114-Status: GOOD (  19.02  )
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

On Tue, Jul 30, 2024 at 11:16:43AM +0530, Anshuman Khandual wrote:
> FEAT_FGT2 adds system registers HDFGRTR2_EL2, HDFGWTR2_EL2, HFGITR2_EL2,
> HFGRTR2_EL2 and HFGWTR2_EL2. But access into these system registers from
> EL2 and below exception levels, will trap into EL3 unless SCR_EL3.FGTEN2
> is set.
> 
> Enable access to FEAT_FGT2 registers when they are implemented. Given that
> these new FEAT_FGT2 trap registers have fields that reset to UNKNOWN values
> when resets are taken to EL3, this initialises all registers as cleared.
> 
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> This picks up from an earlier discussion regarding [PATCH 2/2].
> 
> https://lore.kernel.org/all/20240404073726.947215-1-anshuman.khandual@arm.com/
> 
>  arch/aarch64/include/asm/cpu.h | 7 +++++++
>  arch/aarch64/init.c            | 9 +++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/arch/aarch64/include/asm/cpu.h b/arch/aarch64/include/asm/cpu.h
> index a5744e1..878d03d 100644
> --- a/arch/aarch64/include/asm/cpu.h
> +++ b/arch/aarch64/include/asm/cpu.h
> @@ -23,6 +23,12 @@
>  #define SCTLR2_EL1		s3_0_c1_c0_3
>  #define SCTLR2_EL2		s3_4_c1_c0_3
>  
> +#define HDFGRTR2_EL2		s3_4_c3_c1_0
> +#define HDFGWTR2_EL2		s3_4_c3_c1_1
> +#define HFGRTR2_EL2		s3_4_c3_c1_2
> +#define HFGWTR2_EL2		s3_4_c3_c1_3
> +#define HFGITR2_EL2		s3_4_c3_c1_7

These all look correct per ARM DDI 0487 L.a, table D23-2.

> +
>  /*
>   * RES1 bit definitions definitions as of ARM DDI 0487G.b
>   *
> @@ -63,6 +69,7 @@
>  #define SCR_EL3_SCTLR2En		BIT(44)
>  #define SCR_EL3_PIEN			BIT(45)
>  #define SCR_EL3_D128En			BIT(47)
> +#define SCR_EL3_FGTEN2			BIT(59)

This looks correct per ARM DDI 0487 L.a, section D24.2.163.

>  
>  #define HCR_EL2_RES1			BIT(1)
>  
> diff --git a/arch/aarch64/init.c b/arch/aarch64/init.c
> index c9fc7f1..b4d64a0 100644
> --- a/arch/aarch64/init.c
> +++ b/arch/aarch64/init.c
> @@ -68,6 +68,15 @@ void cpu_init_el3(void)
>  	if (mrs_field(ID_AA64MMFR0_EL1, FGT))
>  		scr |= SCR_EL3_FGTEN;
>  
> +	if (mrs_field(ID_AA64MMFR0_EL1, FGT) >= 2) {
> +		scr |= SCR_EL3_FGTEN2;
> +		msr(HDFGRTR2_EL2, 0);
> +		msr(HDFGWTR2_EL2, 0);
> +		msr(HFGITR2_EL2, 0);
> +		msr(HFGRTR2_EL2, 0);
> +		msr(HFGWTR2_EL2, 0);
> +	}

Superficially, this looks sane to me. I haven't audited all the bits, but I
assume that you have gone through all of the bits and checked that zero is a
sensible reset value for all of these.

I intend to apply this shortly.

As an aside, I think some necssary support is missing on the kernel side -- I'll reply
on that front shortly.

Mark.

> +
>  	if (mrs_field(ID_AA64MMFR0_EL1, ECV) >= 2)
>  		scr |= SCR_EL3_ECVEN;
>  
> -- 
> 2.25.1
> 
> 

