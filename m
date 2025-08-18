Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1EADCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 13:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PicMLicWgcMH+mLk0wlRK+dheWk3LZxxS2oIHGKz9Tk=; b=BfFqGIuakAQPsbk0xHq1jVVRMs
	P684b8HsoK13xNyxK4ULsi32OxPwA7f0TrLFo0OoIqWKyAaKduLkuQVZc1nbWRHOiXIxW4gAdlhke
	mtaWkmv5jPzVc4F1TPEuGiReVNKf4/p3qpv4MUm38T3+U4NpdJV9GpdZaXUqM4V144ORsXnFzaGZX
	wKubSNS9ixYTxhxQBLThxIuieghjnTQ9SeZywvckpK/fPCxNWY1LaHUCBPEnKtWI6n5oeZoyfjjua
	K6H6IBp1GUEZVVD7YggQciy5t7Atng/+VRc7YMph2UKl4Qes67hMUNihhoX/c4xdX8Kae3FkXJAfp
	LaxUxGdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo060-00000007YbK-3nI0;
	Mon, 18 Aug 2025 13:40:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unvzZ-000000072A7-402e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 09:17:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0BA63150C;
	Mon, 18 Aug 2025 02:17:17 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 42C723F58B;
	Mon, 18 Aug 2025 02:17:20 -0700 (PDT)
Date: Mon, 18 Aug 2025 10:17:15 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64/sysreg: Add TCR_EL2 register
Message-ID: <aKLvm2_bNtxcs8Dz@J2N7QTR9R3>
References: <20250818045759.672408-1-anshuman.khandual@arm.com>
 <20250818045759.672408-4-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818045759.672408-4-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_021726_043365_D4130024 
X-CRM114-Status: GOOD (  11.32  )
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

On Mon, Aug 18, 2025 at 10:27:58AM +0530, Anshuman Khandual wrote:
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 4bdae8bb11dc..d2b40105eb41 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -4812,6 +4812,50 @@ Sysreg	TCR_EL12        3	5	2	0	2
>  Mapping	TCR_EL1
>  EndSysreg
>  
> +Sysreg	TCR_EL2        3	4	2	0	2
> +Res0	63:34
> +Field	33	MTX
> +Field	32	DS
> +Res1	31
> +Field	30	TCMA
> +Field	29	TBID
> +Field	28	HWU62
> +Field	27	HWU61
> +Field	26	HWU60
> +Field	25	HWU59
> +Field	24	HPD
> +Res1	23
> +Field	22	HD
> +Field	21	HA
> +Field	20	TBI
> +Res0	19
> +Field   18:16	PS
> +UnsignedEnum	15:14	TG0
> +	0b00	4K
> +	0b01	64K
> +	0b10	16K
> +EndEnum

Same comment as for patch 1: this is not ordered, use Enum rather than
UnsignedEnum. Likewise for the other cases below.

Mark.

> +UnsignedEnum	13:12	SH0
> +	0b00	NONE
> +	0b10	OUTER
> +	0b11	INNER
> +EndEnum
> +UnsignedEnum	11:10	ORGN0
> +	0b00	NC
> +	0b01	WBWA
> +	0b10	WT
> +	0b11	WBnWA
> +EndEnum
> +UnsignedEnum	9:8	IRGN0
> +	0b00	NC
> +	0b01	WBWA
> +	0b10	WT
> +	0b11	WBnWA
> +EndEnum
> +Res0    7:6
> +Field   5:0	T0SZ
> +EndSysreg
> +
>  Sysreg	TCRALIAS_EL1    3	0	2	7	6
>  Mapping	TCR_EL1
>  EndSysreg
> -- 
> 2.25.1
> 
> 

