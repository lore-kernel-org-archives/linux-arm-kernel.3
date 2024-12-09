Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A96E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 14:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eA3wHznIgEWE+6VDzY/QbZo8uWhkqZTo8yDgVkF9b58=; b=G44KvkKyz6SMNPP8HhmG8FcYfU
	CxwEPt2DO3XRjdoMndpCuQMENH+2Wj6daBfIeB/IFgzNa9KrHhLFQRmNn1ddrzamR/O2PxARerzAC
	cIX2erPqnR67qpUy7/VpoqA1AIlQcYXhKnSIARed/xg6d3GQ18tIH0HqcfvO5hTUBrk6DTkZnopqQ
	lZX3oTXR65m2gDRG4VNNkHFdrdg1R4/GSwiIzZJOFjPmQY3S73GHUho7MQLi9H1BTgxTkHmIBtaJJ
	DV7D5Qx6vojnqFKMORilOfN2w09fgMCFCqKJY+5Q2Y41EPhJN2nuDnmOufA0tiAkZhyrBa5b27r9M
	hqMWyu1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKeMH-000000088Az-2zDb;
	Mon, 09 Dec 2024 14:03:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKeIN-000000087JD-3UD1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 13:59:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4DC2113E;
	Mon,  9 Dec 2024 05:59:58 -0800 (PST)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C0BE3F720;
	Mon,  9 Dec 2024 05:59:29 -0800 (PST)
Date: Mon, 9 Dec 2024 13:59:27 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 3/4] arm64/sysreg: Convert *_EL12 accessors to Mapping
Message-ID: <Z1b3v3NvMK28NqTt@J2N7QTR9R3.cambridge.arm.com>
References: <20241207190740.2607673-1-maz@kernel.org>
 <20241207190740.2607673-4-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241207190740.2607673-4-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_055931_911619_7B9DB542 
X-CRM114-Status: GOOD (  13.98  )
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

On Sat, Dec 07, 2024 at 07:07:39PM +0000, Marc Zyngier wrote:
> Perform a bulk convert of the remaining EL12 accessors to use the
> Mapping qualifier, which meakes things a bit clearer.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

I haven't looked at the code in detail, but conceptually this makes
sense to me, so:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  arch/arm64/tools/sysreg | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 19d137d9c50ed..ad2f6265f7948 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -2954,23 +2954,23 @@ Field	63:0	PhysicalOffset
>  EndSysreg
>  
>  Sysreg	CPACR_EL12	3	5	1	0	2
> -Fields	CPACR_ELx
> +Mapping	CPACR_EL1
>  EndSysreg
>  
>  Sysreg	ZCR_EL12	3	5	1	2	0
> -Fields	ZCR_ELx
> +Mapping	ZCR_EL1
>  EndSysreg
>  
>  Sysreg	SMCR_EL12	3	5	1	2	6
> -Fields	SMCR_ELx
> +Mapping	SMCR_EL1
>  EndSysreg
>  
>  Sysreg	GCSCR_EL12	3	5	2	5	0
> -Fields	GCSCR_ELx
> +Mapping	GCSCR_EL1
>  EndSysreg
>  
>  Sysreg	GCSPR_EL12	3	5	2	5	1
> -Fields	GCSPR_ELx
> +Mapping	GCSPR_EL1
>  EndSysreg
>  
>  Sysreg	FAR_EL12	3	5	6	0	0
> @@ -2982,7 +2982,7 @@ Fields	MPAM1_ELx
>  EndSysreg
>  
>  Sysreg	CONTEXTIDR_EL12	3	5	13	0	1
> -Fields	CONTEXTIDR_ELx
> +Mapping	CONTEXTIDR_EL1
>  EndSysreg
>  
>  SysregFields TTBRx_EL1
> @@ -3087,7 +3087,7 @@ Fields	PIRx_ELx
>  EndSysreg
>  
>  Sysreg	PIRE0_EL12	3	5	10	2	2
> -Fields	PIRx_ELx
> +Mapping	PIRE0_EL1
>  EndSysreg
>  
>  Sysreg	PIRE0_EL2	3	4	10	2	2
> @@ -3099,7 +3099,7 @@ Fields	PIRx_ELx
>  EndSysreg
>  
>  Sysreg	PIR_EL12	3	5	10	2	3
> -Fields	PIRx_ELx
> +Mapping	PIR_EL1
>  EndSysreg
>  
>  Sysreg	PIR_EL2		3	4	10	2	3
> @@ -3119,7 +3119,7 @@ Fields	PIRx_ELx
>  EndSysreg
>  
>  Sysreg	POR_EL12	3	5	10	2	4
> -Fields	PIRx_ELx
> +Mapping	POR_EL1
>  EndSysreg
>  
>  Sysreg	S2POR_EL1	3	0	10	2	5
> -- 
> 2.39.2
> 

