Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED8BC10BA430
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 07:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m/TnutpGNNQMeOJaVLkcKsGuB+WWTz76WYqB2NYpJI0=; b=cysIyAB0gCmIduVE1cYjKle7YU
	ikkxjatSXnN7fNH4ctVMGNpeL7M1cz86re82cnxK6XMCbiY0qFL2IWM7rIFuVjQP5Mc1C2pPURUCt
	AAwA3mi2rt1t93VX3jy2wwBliS/R/VWGHjm6on5Qmtdqq+CqJo49XwPDg8sDttp1UajIPvwJBv8e3
	J4YFr4BjJZoAsvbLbap6C1Yb/gkTeMsA8YMJj+1dZ99C91uuLKOwxlrRXBbX6s2z4kr0ALkOMRsR6
	J/XO4UV+iV6BV4aDXgTdYKiAYaaAiaZuddlB2779f5+Iqe4fD7ZuR6uXOFRkqtpgBRe2icrew24Ru
	wtHzyAhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w61oD-00000006uEi-34fS;
	Fri, 27 Mar 2026 07:40:45 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w61oA-00000006uED-1jIx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 07:40:44 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=m/TnutpGNNQMeOJaVLkcKsGuB+WWTz76WYqB2NYpJI0=;
	b=YlJSh+sD9R73qfN4YoYK35Z5sLwd4T4rTya15zQ6nnbzaxs1AM8MqCvdiBt5Khson6g0EaUdS
	ukF/jBaQHn3UL2erIrEMyYxbMs5l59TdRtynYSuI1mZAASkQUc+dOOZK2Kov2SPPWOnDJ91pSTC
	+6YM29BkZYu04sndbmuTu8g=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4fhsqY1NG8z12Ljr;
	Fri, 27 Mar 2026 15:35:05 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id 695A140561;
	Fri, 27 Mar 2026 15:40:31 +0800 (CST)
Received: from [10.67.120.103] (10.67.120.103) by
 kwepemr100010.china.huawei.com (7.202.195.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Fri, 27 Mar 2026 15:40:30 +0800
Message-ID: <6cce203f-89d9-4e9d-8b28-9629eb53b180@huawei.com>
Date: Fri, 27 Mar 2026 15:40:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/kvm: Enable eager hugepage splitting if HDBSS is
 available
To: Leonardo Bras <leo.bras@arm.com>
CC: <maz@kernel.org>, <oupton@kernel.org>, <catalin.marinas@arm.com>,
	<corbet@lwn.net>, <pbonzini@redhat.com>, <will@kernel.org>,
	<yuzenghui@huawei.com>, <wangzhou1@hisilicon.com>, <liuyonglong@huawei.com>,
	<Jonathan.Cameron@huawei.com>, <yezhenyu2@huawei.com>, <linuxarm@huawei.com>,
	<joey.gouly@arm.com>, <kvmarm@lists.linux.dev>, <kvm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <skhan@linuxfoundation.org>,
	<suzuki.poulose@arm.com>
References: <20260225040421.2683931-1-zhengtian10@huawei.com>
 <20260225040421.2683931-5-zhengtian10@huawei.com>
 <acQj5grOdZT8LUGp@devkitleo> <acQna2hLwdr1juTN@devkitleo>
From: Tian Zheng <zhengtian10@huawei.com>
In-Reply-To: <acQna2hLwdr1juTN@devkitleo>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.103]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_004042_816352_AAD029F0 
X-CRM114-Status: GOOD (  18.83  )
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


On 3/26/2026 2:20 AM, Leonardo Bras wrote:
> FEAT_HDBSS speeds up guest memory dirty tracking by avoiding a page fault
> and saving the entry in a tracking structure.
>
> That may be a problem when we have guest memory backed by hugepages or
> transparent huge pages, as it's not possible to do on-demand hugepage
> splitting, relying only on eager hugepage splitting.
>
> So, at stage2 initialization, enable eager hugepage splitting with
> chunk = PAGE_SIZE if the system supports HDBSS.
>
> Signed-off-by: Leonardo Bras <leo.bras@arm.com>
> ---
>   arch/arm64/kvm/mmu.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 070a01e53fcb..bdfa72b7c073 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -993,22 +993,26 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long t
>   
>   	mmu->last_vcpu_ran = alloc_percpu(typeof(*mmu->last_vcpu_ran));
>   	if (!mmu->last_vcpu_ran) {
>   		err = -ENOMEM;
>   		goto out_destroy_pgtable;
>   	}
>   
>   	for_each_possible_cpu(cpu)
>   		*per_cpu_ptr(mmu->last_vcpu_ran, cpu) = -1;
>   
> -	 /* The eager page splitting is disabled by default */
> -	mmu->split_page_chunk_size = KVM_ARM_EAGER_SPLIT_CHUNK_SIZE_DEFAULT;
> +	 /* The eager page splitting is disabled by default if system has no HDBSS */
> +	if (system_supports_hacdbs())
> +		mmu->split_page_chunk_size = PAGE_SIZE;
> +	else
> +		mmu->split_page_chunk_size = KVM_ARM_EAGER_SPLIT_CHUNK_SIZE_DEFAULT;
> +
>   	mmu->split_page_cache.gfp_zero = __GFP_ZERO;
>   
>   	mmu->pgd_phys = __pa(pgt->pgd);
>   
>   	if (kvm_is_nested_s2_mmu(kvm, mmu))
>   		kvm_init_nested_s2_mmu(mmu);
>   
>   	return 0;
>   
>   out_destroy_pgtable:


Thanks again for sending this patch. I'll integrate it into the next 
version and run some tests.



