Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BC0D637DA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 03:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kqdKV0lmwkX3AOG4noYjKFF33Cp/QAC9ugYznViF9DU=; b=UH5GvTN2uo/EYrbJs7jPMOD4RP
	w9qPfZ2sJriYrJsida2jfazApfFUhKsmAST3PMsGnsm6QiezGY2s0goLVIG2RU9BTO/2q/Vd8bbzm
	5dAiSKXtveayrJL0M+JwKfasCmy0y7ejUpxgHd+xUI1JX28rqGSPxV9QtheSbAqmsXYMPBgWPQ3+Q
	DskBTBPzFIdhj0YCVzNzglEevUSZqu+F23VQKghrI1qaUgMM1XQZEOeYSF9wLGkc9FfM8++w3li2r
	CwT1TegnOWKgrVExhvwFl0Jh/5XvdQll3KwQJkGBF68J1/eidXqk7yQjliWCe0cX3twWgo/Pc54Wh
	EIwIXjCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBQCI-00000008dcI-38vu;
	Thu, 14 Nov 2024 03:07:06 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBQAT-00000008dRC-1cnj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 03:05:15 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4XplPW1lwQz4f3jXP
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 11:04:47 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 80ABE1A0359
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 11:05:05 +0800 (CST)
Received: from [10.67.109.79] (unknown [10.67.109.79])
	by APP4 (Coremail) with SMTP id gCh0CgDHoYXhaDVnQrnoBg--.58951S2;
	Thu, 14 Nov 2024 11:05:05 +0800 (CST)
Message-ID: <a761125d-42cf-46d6-bc38-0422bcc6b890@huaweicloud.com>
Date: Thu, 14 Nov 2024 11:05:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: at_xdmac: avoid null_prt_deref in
 at_xdmac_prep_dma_memset
To: Chen Ridong <chenridong@huaweicloud.com>,
 ludovic.desroches@microchip.com, vkoul@kernel.org, mripard@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
 wangweiyang2@huawei.com
References: <20241029082845.1185380-1-chenridong@huaweicloud.com>
Content-Language: en-US
From: Chen Ridong <chenridong@huaweicloud.com>
In-Reply-To: <20241029082845.1185380-1-chenridong@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: gCh0CgDHoYXhaDVnQrnoBg--.58951S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtr1rtF1fZFyfAFWrJFW5ZFb_yoWDuwb_Ga
	4xur1xZr1DGF17Can2krn5ZrWakFy7Xr1S9w1vq34fCFZ8ZF95Zr4xtr95G345u3yxGFW5
	Cr9YvFZ5Wr1UZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbckFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWUAVWU
	twCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij
	64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr
	0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUG0PhUUUUU=
X-CM-SenderInfo: hfkh02xlgr0w46kxt4xhlfz01xgou0bp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_190513_644216_2820A70A 
X-CRM114-Status: GOOD (  11.36  )
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



On 2024/10/29 16:28, Chen Ridong wrote:
> From: Chen Ridong <chenridong@huawei.com>
> 
> The at_xdmac_memset_create_desc may return NULL, which will lead to a
> null pointer dereference. For example, the len input is error, or the
> atchan->free_descs_list is empty and memory is exhausted. Therefore, add
> check to avoid this.
> 
> Fixes: b206d9a23ac7 ("dmaengine: xdmac: Add memset support")
> Signed-off-by: Chen Ridong <chenridong@huawei.com>
> ---
>  drivers/dma/at_xdmac.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/dma/at_xdmac.c b/drivers/dma/at_xdmac.c
> index 299396121e6d..e847ad66dc0b 100644
> --- a/drivers/dma/at_xdmac.c
> +++ b/drivers/dma/at_xdmac.c
> @@ -1363,6 +1363,8 @@ at_xdmac_prep_dma_memset(struct dma_chan *chan, dma_addr_t dest, int value,
>  		return NULL;
>  
>  	desc = at_xdmac_memset_create_desc(chan, atchan, dest, len, value);
> +	if (!desc)
> +		return NULL;
>  	list_add_tail(&desc->desc_node, &desc->descs_list);
>  
>  	desc->tx_dma_desc.cookie = -EBUSY;

Friendly ping.


