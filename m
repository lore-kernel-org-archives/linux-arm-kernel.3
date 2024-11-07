Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1FEFD5AE6B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 07:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kqdKV0lmwkX3AOG4noYjKFF33Cp/QAC9ugYznViF9DU=; b=rW2n1orq017UhG/4mPNPhNB+M9
	RzhDwZLgOdvVn/sqGA+LZQWeSl+B3FZjBWgg+Nx7dOwEdIgBGf7jMeF9jQM9cSJNQ2dwE+uOUaAHb
	7F88mn0nNWFJ3HKBj5Z4u0i0dB5PE0GkmMIa2uHe77M2+kiSN3VGbsobW+u/nXw6aJaZEH09V9VHa
	QUe+AdY7xsrfWbgFg7utmPBsbjp8awdFfr3GXzFc9pcpgI0ub6co8z8WrQZgd6SrbNlPHqEekAiFM
	LE6tKF2IRdqvPD2uZ2tYavMRy+7WVbbajEQuYKIYkxDxgmMBP4+lCq91Aol3kC+nNdvynkRxqcIDI
	VAbxaMCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8xPW-000000063XZ-3C0C;
	Thu, 07 Nov 2024 07:58:35 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8xHq-000000062QM-0Vgg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 07:50:40 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4XkZ48496Rz4f3kkd
	for <linux-arm-kernel@lists.infradead.org>; Thu,  7 Nov 2024 15:50:16 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 7D0F81A018D
	for <linux-arm-kernel@lists.infradead.org>; Thu,  7 Nov 2024 15:50:29 +0800 (CST)
Received: from [10.67.109.79] (unknown [10.67.109.79])
	by APP3 (Coremail) with SMTP id _Ch0CgAX9sJEcSxnr0I7BA--.10235S2;
	Thu, 07 Nov 2024 15:50:29 +0800 (CST)
Message-ID: <9fec1ee8-7c6a-46f1-80cb-9b7cd1dd2d12@huaweicloud.com>
Date: Thu, 7 Nov 2024 15:50:27 +0800
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
X-CM-TRANSID: _Ch0CgAX9sJEcSxnr0I7BA--.10235S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtr1rtF1fZFyfAFWrJFW5ZFb_yoWDuwb_Ga
	4xur1xZr1DGF17Can2krn5ZrWakFy7Xr1S9w1vq34fCFZ8ZF95Zr4xtr95G345u3yxGFW5
	Cr9YvFZ5Wr1UZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbcxFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r126r1D
	MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
	W8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
	cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbSfO7UUUUU==
X-CM-SenderInfo: hfkh02xlgr0w46kxt4xhlfz01xgou0bp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_235038_389457_5D1B47D7 
X-CRM114-Status: GOOD (  11.37  )
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


