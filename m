Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80290D2F001
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 11:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c8Qf93RX7VEHMbBpA5pIJBA5s/lMrQt5oBh+YBjXjfs=; b=o7AzWx7YvYahIA6t3oVPywSl1v
	jVhxKCP8oHTIMc2k5rPkcwyfYisSg3STMz6039KldA32xyOt6DkHTHF28mLWsEpBSBVAr0DcFEow9
	wqnJglPR29+P7K+/tkTYv/gOZhslSy8cbuE92y9yfkOMo9UXahlQzBoB/WsgAHsE7ssS4SA5mA/c1
	KAR55BKITk5XYppnL84znqkCMCmRZoLQtASY+MRdLwkQ1hFIdCQLf16IkBNXWhTyCRTrLKaJEteeJ
	PEuc39O5wqghh9F7ENQvfERT8u69ObU2yUwNVmD9ZKozurkNyPY60mePLpD7Sec191qYss2sfFwWv
	zTfBlLZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkhOd-0000000EAVS-3iU3;
	Tue, 27 Jan 2026 11:38:11 +0000
Received: from sinmsgout02.his.huawei.com ([119.8.177.37])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkhOa-0000000EAV3-12k1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 11:38:10 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=c8Qf93RX7VEHMbBpA5pIJBA5s/lMrQt5oBh+YBjXjfs=;
	b=ahKSiTskLWSTmZTdccVc0LMMcFMd6Rq/4jlbCOt8pgjJpmIZaaiBXTXxmGP6463UlBeysIW+C
	9ybS8YDkXMMZAT0vcA53S+dhINlYXAScuaNfBQPTYRuUVDmDQjsd/SA1mQRjiIoLJ6/tO9F4zHr
	GxWDyKU/i3PjaEQFO5za8b8=
Received: from frasgout.his.huawei.com (unknown [172.18.146.33])
	by sinmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4f0jyD271mz1vnKH;
	Tue, 27 Jan 2026 19:35:32 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4f0k0N5QdfzJ46n9;
	Tue, 27 Jan 2026 19:37:24 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 94C9140086;
	Tue, 27 Jan 2026 19:38:00 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 27 Jan
 2026 11:37:59 +0000
Date: Tue, 27 Jan 2026 11:37:58 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ryan Roberts <ryan.roberts@arm.com>
CC: Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, Linus
 Torvalds <torvalds@linux-foundation.org>, Oliver Upton
	<oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, "Dev Jain"
	<dev.jain@arm.com>, Linu Cherian <Linu.Cherian@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 04/13] arm64: mm: Push __TLBI_VADDR() into
 __tlbi_level()
Message-ID: <20260127113758.00005bea@huawei.com>
In-Reply-To: <20260119172202.1681510-5-ryan.roberts@arm.com>
References: <20260119172202.1681510-1-ryan.roberts@arm.com>
	<20260119172202.1681510-5-ryan.roberts@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_033809_060383_BD0C471D 
X-CRM114-Status: GOOD (  15.22  )
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

On Mon, 19 Jan 2026 17:21:51 +0000
Ryan Roberts <ryan.roberts@arm.com> wrote:

> From: Will Deacon <will@kernel.org>
> 
> The __TLBI_VADDR() macro takes an ASID and an address and converts them
> into a single argument formatted correctly for a TLB invalidation
> instruction.
> 
> Rather than have callers worry about this (especially in the case where
> the ASID is zero), push the macro down into __tlbi_level() via a new
> __tlbi_level_asid() helper.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> Reviewed-by: Linu Cherian <linu.cherian@arm.com>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
One comment inline, but not particularly important given it's
about reducing readability of a workaround a little

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> @@ -674,6 +679,7 @@ static inline bool huge_pmd_needs_flush(pmd_t oldpmd, pmd_t newpmd)
>  #define huge_pmd_needs_flush huge_pmd_needs_flush
>  
>  #undef __tlbi_user
> +#undef __TLBI_VADDR
>  #endif
>  
>  #endif
> diff --git a/arch/arm64/kernel/sys_compat.c b/arch/arm64/kernel/sys_compat.c
> index 4a609e9b65de..ad4857df4830 100644
> --- a/arch/arm64/kernel/sys_compat.c
> +++ b/arch/arm64/kernel/sys_compat.c
> @@ -36,7 +36,7 @@ __do_compat_cache_op(unsigned long start, unsigned long end)
>  			 * The workaround requires an inner-shareable tlbi.
>  			 * We pick the reserved-ASID to minimise the impact.
>  			 */
> -			__tlbi(aside1is, __TLBI_VADDR(0, 0));
> +			__tlbi(aside1is, 0UL);

Dropping the explicit ASID sort of looses some meaning here vs the comment just
above it.  Meh, it's in a work around so most folk will ignore it anyway
if reading this code, so I don't mind that much.

>  			dsb(ish);
>  		}
>  


