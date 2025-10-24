Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85260CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 11:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4UMPDfQ6PuPOQC+bvltkEyQ8+xopQBoiLu+OoONi8G0=; b=wDf458mFuwxqVxrjaI5VuTfIJM
	TZ5T6j1MZLDKirhwq6oINSdR5tOH10ojWH0Lv7VEBH9g3IJ3PGedV82F3M6Zl+wsKwgp1UFzwanWq
	FXiJJHOi4dGNegL1jkfF7SlSNu3gdWtDSsPR4BRWOfKViWoeak8uWbCHKTZEQupigSlP5Nr6SEoDi
	woSwGyDit0bX7Ioej8HPO/pvELL6sYAMjDf0VjGavG60/3bk9W0Vk4EMofXoCeb61rc0dM9WKzxMh
	qFHEhRF3rCP6s+vqiTgK+sX5ujuFCwqMRvDHtz1uuUAf8dvXY3bCCHMRfJzMrNEikpUmP5TxicmA4
	fkrLq1uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCFX4-000000096ZP-3do1;
	Fri, 24 Oct 2025 11:00:30 +0000
Received: from sinmsgout01.his.huawei.com ([119.8.177.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCFX1-000000096X9-3x4a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 11:00:30 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=4UMPDfQ6PuPOQC+bvltkEyQ8+xopQBoiLu+OoONi8G0=;
	b=DDZFKj8kmPinEskrMJO9itfgm2rN0noacKtHlzLWMdwfrCcs1QLnENC7AuER4chtFiFxcyCkr
	p4d6LXnHmTm8zGM6ipHRaZn1qdlkr86aNYkWqSlfasyqvWOunX4oVdrgPkdq64LNr4pzuKlMQyr
	Y2dgHkbhQnJz1PSJ0CO3eME=
Received: from frasgout.his.huawei.com (unknown [172.18.146.37])
	by sinmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4ctKgJ26dJz1P6gM;
	Fri, 24 Oct 2025 19:00:12 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ctKbZ2T7wz6GDCL;
	Fri, 24 Oct 2025 18:56:58 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 6A4D914020C;
	Fri, 24 Oct 2025 19:00:16 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 24 Oct
 2025 12:00:15 +0100
Date: Fri, 24 Oct 2025 12:00:14 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <ben.horgan@arm.com>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Marc
 Zyngier" <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	<linux-kernel@vger.kernel.org>, <kvmarm@lists.linux.dev>
Subject: Re: [PATCH V2 2/2] arm64/mm: Add remaining TLBI_XXX_MASK macros
Message-ID: <20251024120014.000020af@huawei.com>
In-Reply-To: <20251024040207.137480-3-anshuman.khandual@arm.com>
References: <20251024040207.137480-1-anshuman.khandual@arm.com>
	<20251024040207.137480-3-anshuman.khandual@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_040028_650763_ECBB0214 
X-CRM114-Status: GOOD (  17.07  )
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

On Fri, 24 Oct 2025 05:02:07 +0100
Anshuman Khandual <anshuman.khandual@arm.com> wrote:

> Add remaining TLBI_XXX_MASK macros and replace current open encoded fields.
> While here replace hard coded page size based shifts but with derived ones
> via ilog2() thus adding some required context.
> 
> TLBI_TTL_MASK has been split into separate TLBI_TTL_MASK and TLBI_TG_MASK
> as appropriate because currently it simultaneously contains both page size
> and translation table level information. KVM on arm64 has been updated to
> accommodate these changes to TLBI_TTL_MASK.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Oliver Upton <oliver.upton@linux.dev>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: kvmarm@lists.linux.dev
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/arm64/include/asm/tlbflush.h | 26 ++++++++++++++++++--------
>  arch/arm64/kvm/nested.c           |  8 +++++---
>  2 files changed, 23 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index 131096094f5b..cf75fc2a06c3 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -57,9 +57,10 @@
>  /* This macro creates a properly formatted VA operand for the TLBI */
>  #define __TLBI_VADDR(addr, asid)				\
>  	({							\
> -		unsigned long __ta = (addr) >> 12;		\
> -		__ta &= GENMASK_ULL(43, 0);			\
> -		__ta |= (unsigned long)(asid) << 48;		\
> +		unsigned long __ta = (addr) >> ilog2(SZ_4K);	\
> +		__ta &= TLBI_BADDR_MASK;			\
> +		__ta &= ~TLBI_ASID_MASK;			\
> +		__ta |= FIELD_PREP(TLBI_ASID_MASK, asid);	\
I think you can replace the two lines above with
		FIELD_MODIFY(TLBI_ASID_MASK, &__ta, asid);

It's a small reduction in code but I don't mind much either way.

>  		__ta;						\
>  	})
>  
> @@ -100,8 +101,17 @@ static inline unsigned long get_trans_granule(void)
>   *
>   * For Stage-2 invalidation, use the level values provided to that effect
>   * in asm/stage2_pgtable.h.
> + *
> + * +----------+------+-------+--------------------------------------+
> + * |   ASID   |  TG  |  TTL  |                 BADDR                |
> + * +-----------------+-------+--------------------------------------+
> + * |63      48|47  46|45   44|43                                   0|
> + * +----------+------+-------+--------------------------------------+
>   */
> -#define TLBI_TTL_MASK		GENMASK_ULL(47, 44)
> +#define TLBI_ASID_MASK		GENMASK_ULL(63, 48)
> +#define TLBI_TG_MASK		GENMASK_ULL(47, 46)
> +#define TLBI_TTL_MASK		GENMASK_ULL(45, 44)
> +#define TLBI_BADDR_MASK		GENMASK_ULL(43, 0)
>  
>  #define TLBI_TTL_UNKNOWN	INT_MAX
>  
> @@ -110,10 +120,10 @@ static inline unsigned long get_trans_granule(void)
>  									\
>  	if (alternative_has_cap_unlikely(ARM64_HAS_ARMv8_4_TTL) &&	\
>  	    level >= 0 && level <= 3) {					\
> -		u64 ttl = level;					\
> -		ttl |= get_trans_granule() << 2;			\
> +		arg &= ~TLBI_TG_MASK;					\
> +		arg |= FIELD_PREP(TLBI_TG_MASK, get_trans_granule());	\
>  		arg &= ~TLBI_TTL_MASK;					\
> -		arg |= FIELD_PREP(TLBI_TTL_MASK, ttl);			\
> +		arg |= FIELD_PREP(TLBI_TTL_MASK, level);		\

Similar potential to use FIELD_MODIFY for these.

Jonathan


