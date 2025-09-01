Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B070CA0FFF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 14:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/SyVhSrpIopy5tAXrZM1C7QBHH3aNqDn8lxKBUW9xaA=; b=2TmLhPrv3WjDFHRMrBgcbqFpY8
	IO+26YuLdLASiFSo9zheewKUIIDDLSN9lS/hAqpbVl/6laBTxyqZHdWzFmqvCz1oxqQt7LmxtPtse
	k1MtTU8dYD9oR4ySeKpReqM3x2OSmU+IC74pM8warNt11Dm+kVoYftZUrBTPjOXGd7xL+BJJI2g3B
	FpkVEUykcetUpYsWy3UJIFClJjMy/IITwsxWha4wP4qlZLgPL1m0K/14bHF1COv3ZxlmKuhDWdKMf
	GPaVln4A+QXx5frD3P8yib0DmCdT66JqmRfY51onh9eejBfVOiGcgoOZjYLsNf2LTJUMPumosR/Iy
	F8LjlpVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut5oe-0000000Cssq-20XD;
	Mon, 01 Sep 2025 14:47:28 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3Me-0000000CEL5-0KAj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 12:10:25 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4cFng12cMNz2VRdZ;
	Mon,  1 Sep 2025 20:07:09 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id E36991800B2;
	Mon,  1 Sep 2025 20:10:13 +0800 (CST)
Received: from [10.174.178.247] (10.174.178.247) by
 dggpemf500002.china.huawei.com (7.185.36.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 1 Sep 2025 20:10:12 +0800
Subject: Re: [PATCH] ACPI/IORT: Fix memory leak in iort_rmr_alloc_sids()
To: Miaoqian Lin <linmq006@gmail.com>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Joerg Roedel
	<jroedel@suse.de>, Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Robin Murphy <robin.murphy@arm.com>, <linux-acpi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<bpf@vger.kernel.org>
CC: <stable@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>
References: <20250828112243.61460-1-linmq006@gmail.com>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <a2ac5b97-ea63-3187-164c-9568d7810a0a@huawei.com>
Date: Mon, 1 Sep 2025 20:10:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20250828112243.61460-1-linmq006@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.247]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_051024_288962_D7B37BA0 
X-CRM114-Status: GOOD (  17.74  )
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

+Cc Catalin, Will

On 2025/8/28 19:22, Miaoqian Lin wrote:
> If krealloc_array() fails in iort_rmr_alloc_sids(), the function returns
> NULL but does not free the original 'sids' allocation. This results in a
> memory leak since the caller overwrites the original pointer with the
> NULL return value.
> 
> Fixes: 491cf4a6735a ("ACPI/IORT: Add support to retrieve IORT RMR reserved regions")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
> This follows the same pattern as the fix in commit 06615967d488
> ("bpf, verifier: Fix memory leak in array reallocation for stack state").
> ---
>   drivers/acpi/arm64/iort.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
> index 98759d6199d3..65f0f56ad753 100644
> --- a/drivers/acpi/arm64/iort.c
> +++ b/drivers/acpi/arm64/iort.c
> @@ -937,8 +937,10 @@ static u32 *iort_rmr_alloc_sids(u32 *sids, u32 count, u32 id_start,
>   
>   	new_sids = krealloc_array(sids, count + new_count,
>   				  sizeof(*new_sids), GFP_KERNEL);
> -	if (!new_sids)
> +	if (!new_sids) {
> +		kfree(sids);
>   		return NULL;
> +	}
>   
>   	for (i = count; i < total_count; i++)
>   		new_sids[i] = id_start++;

Good catch!

Reviewed-by: Hanjun Guo <guohanjun@huawei.com>

Thanks
Hanjun

