Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82969CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 13:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xOEfFPITo4fAFtVzaerZsFgMN9QeCzQUrj0jDvlbyhU=; b=rGh8qZQQf0WulKLSBwqA66OfZj
	IBpdRZUBiig2kWYlurR782QzSYaAwe/JDDcEHTDXe3qKCPIIg/NsTuZ14CONZzNUWbvscMgKG+NFL
	xC7hhpAgpXgfJt0/c8OPYBNi0RfuoxMRyP3D8qfqUHATkyAdCTsy1MpigsAHzcovTFYcD+Sbwa/mQ
	qNysCZekyG8DUABHESbtRKaT/3d5jeKPPVBcluWzeBE+YPfCPSDqlCbyUHrxBpfW1Qc/wHySq7rEM
	71ThSpKf24tCs9v/KLzVEF3wR4vunEBbM3ilKbwRQwftHJluxFBZHJ/PEDoByd0dukphy94Bg02zu
	F+q1xklg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo06G-00000007YyO-1WYX;
	Mon, 18 Aug 2025 13:40:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unw4f-000000072jT-0gpe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 09:22:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6829150C;
	Mon, 18 Aug 2025 02:22:31 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 438963F58B;
	Mon, 18 Aug 2025 02:22:35 -0700 (PDT)
Date: Mon, 18 Aug 2025 10:22:30 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64/sysreg: Add VTCR_EL2 register
Message-ID: <aKLw1jvwOo4wG64n@J2N7QTR9R3>
References: <20250818045759.672408-1-anshuman.khandual@arm.com>
 <20250818045759.672408-5-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818045759.672408-5-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_022241_242433_AB0FC465 
X-CRM114-Status: GOOD (  11.79  )
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

On Mon, Aug 18, 2025 at 10:27:59AM +0530, Anshuman Khandual wrote:
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index d2b40105eb41..f5a0a304f844 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -4910,6 +4910,63 @@ Field	1	PIE
>  Field	0	PnCH
>  EndSysreg
>  
> +Sysreg	VTCR_EL2	3	4	2	1	2
> +Res0	63:46
> +Field	45	HDBSS
> +Field	44	HAFT
> +Res0	43:42
> +Field	41	TL0
> +Field	40	GCSH
> +Res0	39
> +Field	38	D128
> +Field	37	S2POE
> +Field	36	S2PIE
> +Field	35	TL1
> +Field	34	AssuredOnly
> +Field	33	SL2
> +Field	32	DS
> +Res1	31
> +Field	30	NSA
> +Field	29	NSW
> +Field	28	HWU62
> +Field	27	HWU61
> +Field	26	HWU60
> +Field	25	HWU59
> +Res0	24:23
> +Field	22	HD
> +Field	21	HA
> +Res0	20
> +UnsignedEnum	19	VS
> +	0b0	8BIT
> +	0b1	16BIT
> +EndEnum

You left TCR_EL1.AS as a single-bit 'Field', so please do the same here
for consistency. I don't think there's much gained by making this any
sort of enum.

> +Field	18:16	PS
> +UnsignedEnum	15:14	TG0
> +		0b00	4K
> +		0b01	64K
> +		0b10	16K
> +EndEnum

As with other patches, this is not ordered. Please use Enum.

Likewise for the other cases below.

Mark.

> +UnsignedEnum	13:12	SH0
> +		0b00	NONE
> +		0b10	OUTER
> +		0b11	INNER
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
> +Field	7:6	SL0
> +Field	5:0	T0SZ
> +EndSysreg
> +
>  SysregFields MAIR2_ELx
>  Field	63:56	Attr7
>  Field	55:48	Attr6
> -- 
> 2.25.1
> 
> 

