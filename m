Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8030FD2F00B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 12:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S8LiAGHz52z0JtOCVGrYooVecD5f4OG6WmvXLSeQJ94=; b=fAzK9xVEgD1eJ7MjwdkpIK/dgr
	koXArlrQUbvN0/nr5SWFkRQCe/DELYfTLtrU65649WXk2ApoRiJQKbA1r4A/RNetHgk+qoDE8aKoR
	uVfQaB7OW8M7lGtXVnZO6YPAfgF7CHM6ahEGt+1yTQMZqNmd7pwSKzmdTzY7tyG5Qh4z2vRBkOCMJ
	P30cGAp/gA7ZUQ7SSrmkZOdaPusHckpWy+t6T4PZj67ANhZeACqEN/Qv8GwQRJvkkcrnL4zw/Qs05
	3okAK2y3lD3bmKw9m+JKv6uMkc8gjZkg7JUKaeZa5S14aOEguz7LLfjlFo0ajBJbpAMUXOyY5s9a+
	zD1z7aHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkife-0000000EHfr-2TtI;
	Tue, 27 Jan 2026 12:59:50 +0000
Received: from sinmsgout01.his.huawei.com ([119.8.177.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkifb-0000000EHfU-0Q7r
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 12:59:49 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=S8LiAGHz52z0JtOCVGrYooVecD5f4OG6WmvXLSeQJ94=;
	b=VQ0c7KuUR7UMFx/neAsOM+A0UyzZZQQnpflYqPcMK/NC9NWvn0dkstOr2MbI02XuwWvVyRzDq
	+kIVwz9HE6+QCVdWAjCwjCSqkEXZUhbxhT2+R/3nQurOlxC3nxJfbW14vqQwMiQFz0+3+IBM7h4
	BTsB7HTMqRR7BhR3wuIYpM0=
Received: from frasgout.his.huawei.com (unknown [172.18.146.32])
	by sinmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4f0lmP0zWMz1P6jV;
	Tue, 27 Jan 2026 20:57:08 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4f0lpL1wRfzHnH5y;
	Tue, 27 Jan 2026 20:58:50 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id CF08440584;
	Tue, 27 Jan 2026 20:59:35 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 27 Jan
 2026 12:59:35 +0000
Date: Tue, 27 Jan 2026 12:59:33 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ryan Roberts <ryan.roberts@arm.com>
CC: Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, Linus
 Torvalds <torvalds@linux-foundation.org>, Oliver Upton
	<oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, "Dev Jain"
	<dev.jain@arm.com>, Linu Cherian <Linu.Cherian@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 12/13] arm64: mm: Wrap flush_tlb_page() around
 ___flush_tlb_range()
Message-ID: <20260127125933.00006101@huawei.com>
In-Reply-To: <20260119172202.1681510-13-ryan.roberts@arm.com>
References: <20260119172202.1681510-1-ryan.roberts@arm.com>
	<20260119172202.1681510-13-ryan.roberts@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_045947_842035_5914555D 
X-CRM114-Status: GOOD (  19.93  )
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

On Mon, 19 Jan 2026 17:21:59 +0000
Ryan Roberts <ryan.roberts@arm.com> wrote:

> Flushing a page from the tlb is just a special case of flushing a range.
> So let's rework flush_tlb_page() so that it simply wraps
> ___flush_tlb_range(). While at it, let's also update the API to take the
> same flags that we use when flushing a range. This allows us to delete
> all the ugly "_nosync", "_local" and "_nonotify" variants.
> 
> Thanks to constant folding, all of the complex looping and tlbi-by-range
> options get eliminated so that the generated code for flush_tlb_page()
> looks very similar to the previous version.
> 
> Reviewed-by: Linu Cherian <linu.cherian@arm.com>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

So this does include the use of the

Case TLBF_NOBROADCAST from previous patch, but only whilst (I think)
slightly changing behavior.

Gah.  I'm regretting looking at this series. The original code is really hard to
read :)  Rather you than me to fix it!

>  static inline void flush_tlb_kernel_range(unsigned long start, unsigned long end)
>  {
>  	const unsigned long stride = PAGE_SIZE;
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index be9dab2c7d6a..f91aa686f142 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -239,7 +239,7 @@ int __ptep_set_access_flags(struct vm_area_struct *vma,
>  	 * flush_tlb_fix_spurious_fault().
>  	 */
>  	if (dirty)
> -		local_flush_tlb_page(vma, address);
> +		__flush_tlb_page(vma, address, TLBF_NOBROADCAST);

Ultimately I think this previously did __tlbi(vale1) and now does __tlbi(vae1)
Original call was to __local_flush_tlb_page_notify_nosync()

I'd like to see that sort of change called out and explained in the patch description.
It's a broader scoped flush so not a bug, but still a functional change.

>  	return 1;
>  }
>  


