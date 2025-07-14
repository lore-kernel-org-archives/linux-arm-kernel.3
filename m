Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4068CC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 16:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zf0VuAFPqypXuyEhckICR/n6MHtsYAlxuzA2uJX1ddw=; b=GXjxzysmisH+IhgIQ+b+Zfll6U
	SzzA3m+JYEJw9vvXnid1hN6W4sav3nLtkpDwY3ECXgjtLiVmHhHjYz5MdiKmxm0a+FHCkhHYKHOFl
	bmqGzotLYRuYu+gHF2Ga+9AzqJA4KTExEZCn5va9+3Q6Vww1ZqdY9L7cOrj2gfz2Yl5gL5kQVX8U7
	BneKQbHL08ZdxnTyC3wf/9wwr63iW2vWUFrK5UQXZXg5SDMNgwopAabttq/0P1PWvCkyLyUs4EZUn
	JfVv3VkD+yb0eZW1uaq2mt6NBKm6ed7On3heQYUBDyqgne7K10KqQ3/1juDjZ1j5ncEP7H5kgZAAG
	rqnBPvSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubMBO-00000002qpA-49WS;
	Mon, 14 Jul 2025 16:37:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKqf-00000002bkw-2gMy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 15:12:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E6C74415D;
	Mon, 14 Jul 2025 15:12:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77D99C4CEED;
	Mon, 14 Jul 2025 15:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752505929;
	bh=26IYlYe0seETAdGJ661Ilcz5CFOkeFLOZRNhB9DEQqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KxG5ScAXHk+Rl0eeBfa4igek8hkW3Yvbk+n1Gx8+5Xq2Nhuq+w1hYegvBAzPkxp6g
	 MDxabxOCAKq2VAi5NEbCaf31UCeihxlhL2sUrhHEKgmX5RcyLd7TnES7tsqKlxOrHc
	 I37W0h8nE+kxfXCLBkOdea8h04lVhoEHIvfaFOLetv7pdHv8PkT+8UAJ2z1BEveOjR
	 K46WQMIuLbzCDzWT9r66y4yGimYxg6WpIiNaoD+pUbX+m7YTeBH+EfnaElf2JKXRpG
	 4e2soIHN/UREhccMk7xW3el0crejY84dSxrGjRWWKlybyA0e/2rmMjjegEem8uwTLk
	 PkHJDeYoyDDTw==
Date: Mon, 14 Jul 2025 16:12:03 +0100
From: Will Deacon <will@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>,
	Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v7 05/21] drivers/perf: apple_m1: Support
 configuring counters for 32-bit EL0
Message-ID: <aHUeQ8at8UnNtE4m@willie-the-truck>
References: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
 <20250616-apple-cpmu-v7-5-df2778a44d5c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616-apple-cpmu-v7-5-df2778a44d5c@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_081209_696002_7CA11F76 
X-CRM114-Status: GOOD (  14.65  )
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

On Mon, Jun 16, 2025 at 09:31:54AM +0800, Nick Chan wrote:
> Add support for configuring counters for 32-bit EL0 to allow adding support
> for implementations with 32-bit EL0.
> 
> For documentation purposes, also add the bitmask for configuring counters
> for 64-bit EL3.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  arch/arm64/include/asm/apple_m1_pmu.h | 3 +++
>  drivers/perf/apple_m1_cpu_pmu.c       | 6 ++++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/apple_m1_pmu.h b/arch/arm64/include/asm/apple_m1_pmu.h
> index 02e05d05851f739b985bf416f1aa3baeafd691dc..6e238043e0dc2360c4fd507dc6a0eb7e055d2d6f 100644
> --- a/arch/arm64/include/asm/apple_m1_pmu.h
> +++ b/arch/arm64/include/asm/apple_m1_pmu.h
> @@ -38,8 +38,11 @@
>  
>  #define SYS_IMP_APL_PMCR1_EL1	sys_reg(3, 1, 15, 1, 0)
>  #define SYS_IMP_APL_PMCR1_EL12	sys_reg(3, 1, 15, 7, 2)
> +#define PMCR1_COUNT_A32_EL0_0_7	GENMASK(7, 0)
>  #define PMCR1_COUNT_A64_EL0_0_7	GENMASK(15, 8)
>  #define PMCR1_COUNT_A64_EL1_0_7	GENMASK(23, 16)
> +#define PMCR1_COUNT_A64_EL3_0_7	GENMASK(31, 24)

No need to add this one ^^

Will

