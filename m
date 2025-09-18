Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14631CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 12:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/C4yJWSBCLi0lkFojlaxD5BjgP7pobrTYzXzRVALORo=; b=qLo2PsbatXipkp4D9GgwOcnNzR
	mqaYZsZ7t4AB+3cIj4JVsDpvnzREgEf9AIyN6C3hCBE4mwLS1wmnLlukQo/rGnzMeFiDtXRvHKRfy
	H9f0KQFIUUmfIpFV3CdoM9pfz5fEIcSiERNej8gynOfNWxMoHF+anjB8TLn7gbZsufyodDjKYzCBu
	Z4KYXd2vk+88SoxSaglHlKiDF1kaaJ1WxIVx2cmwTTfRxhldCXG021dwKLavoqw1wa/JnzVrHm21u
	b7NQ9g3wCjQiqFF2WNnshgfKxir2oEIDTg5IWKAS4BheSWMqS9QclWhEDa+qoX82v9Vg8WqkZA4Pa
	fXNFMrMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzDfD-0000000HNvK-2P4p;
	Thu, 18 Sep 2025 12:23:03 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzDf9-0000000HNuv-3TuM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 12:23:01 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4cSF7j4llqz1R9RG;
	Thu, 18 Sep 2025 20:19:45 +0800 (CST)
Received: from dggpemf100008.china.huawei.com (unknown [7.185.36.138])
	by mail.maildlp.com (Postfix) with ESMTPS id DCFD11A0188;
	Thu, 18 Sep 2025 20:22:51 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemf100008.china.huawei.com (7.185.36.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 18 Sep 2025 20:22:50 +0800
Message-ID: <2bd52a76-c92a-431d-a26a-ad98ede14431@huawei.com>
Date: Thu, 18 Sep 2025 20:22:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mm: Elide TLB flush in certain pte protection
 transitions
To: Dev Jain <dev.jain@arm.com>, <catalin.marinas@arm.com>, <will@kernel.org>
CC: <anshuman.khandual@arm.com>, <ryan.roberts@arm.com>, <baohua@kernel.org>,
	<pjaroszynski@nvidia.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20250918103638.77282-1-dev.jain@arm.com>
Content-Language: en-US
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <20250918103638.77282-1-dev.jain@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf100008.china.huawei.com (7.185.36.138)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_052300_050829_69F18890 
X-CRM114-Status: GOOD (  18.67  )
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



On 2025/9/18 18:36, Dev Jain wrote:
> Currently arm64 does an unconditional TLB flush in mprotect(). This is not
> required for some cases, for example, when changing from PROT_NONE to
> PROT_READ | PROT_WRITE (a real usecase - glibc malloc does this to emulate
> growing into the non-main heaps), and unsetting uffd-wp in a range.
> 
> Therefore, implement pte_needs_flush() for arm64, which is already
> implemented by some other arches as well.
> 
> Running a userspace program changing permissions back and forth between
> PROT_NONE and PROT_READ | PROT_WRITE, and measuring the average time taken
> for the none->rw transition, I get a reduction from 3.2 microseconds to
> 2.95 microseconds, giving an 8.5% improvement.
> 

Hi Dev，

> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
> mm-selftests pass. Based on 6.17-rc6.
> 
>   arch/arm64/include/asm/tlbflush.h | 29 +++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index 18a5dc0c9a54..4a566d589100 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -524,6 +524,35 @@ static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *b
>   {
>   	__flush_tlb_range_nosync(mm, start, end, PAGE_SIZE, true, 3);
>   }
> +
> +static inline bool __pte_flags_need_flush(pteval_t oldval, pteval_t newval)
> +{
> +	pteval_t diff = oldval ^ newval;
> +
> +	/* invalid to valid transition requires no flush */
> +	if (!(oldval & PTE_VALID) || (oldval & PTE_PRESENT_INVALID))
> +		return false;
> +
> +	/* Transition in the SW bits and access flag requires no flush */
> +	diff &= ~(PTE_SWBITS_MASK | PTE_AF);
> +
> +	if (!diff)
> +		return false;
> +	return true;
> +}
> +

LibMicro mprotect testcase show 3~5% improvement with different size in
old kernel(we did this before, but only check PTE_VALID and 
PTE_PROT_NONE in our kernel), it seems that no one change other sw bit 
by mprotect?

Anyway, Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>

> +static inline bool pte_needs_flush(pte_t oldpte, pte_t newpte)
> +{
> +	return __pte_flags_need_flush(pte_val(oldpte), pte_val(newpte));
> +}
> +#define pte_needs_flush pte_needs_flush
> +
> +static inline bool huge_pmd_needs_flush(pmd_t oldpmd, pmd_t newpmd)
> +{
> +	return __pte_flags_need_flush(pmd_val(oldpmd), pmd_val(newpmd));
> +}
> +#define huge_pmd_needs_flush huge_pmd_needs_flush
> +
>   #endif
>   
>   #endif


