Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACAEDCD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 02:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Subject:CC:To:MIME-Version:From:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F+HNNdlyuRmjijcNZ9VuH9FOCs8YBSRZkVxVMqWsky8=; b=EfVWd1KW12Mlur1e2OAX4B/2DJ
	u6w0x70BJwRy3v3n3csUvoyPF+exyQyQAz/4izOa0X4/m+5R1fMpD5Y+Nes64P3z1mpKvAXN+DB9v
	A2Uo2IQ+lqgxyI886oQm2iA3L55bUS7YnhSqhfUO9sTaNGlXWNNTqjeLGIE/PH71NuFQpDymxymJq
	DVGxIb/AeS0TlqH450RHzXxNRF1EsfyTidg0Pgx7/gmHo6M094RkfN5UTHRevT0OHNn1yIBulNUib
	vKDsSwR0w+7u2wkriY7Lgc3BJpARF9PFEiZSt760oxR6hlzXxmJ4/L9ob4gqU/0xH9ZVi7OjBVvDq
	kw5afh7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYx0p-0000000DSyD-0lzB;
	Mon, 15 Jun 2026 02:25:19 +0000
Received: from m16.mail.126.com ([220.197.31.8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYx0l-0000000DSx6-3y1a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 02:25:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Date:From:MIME-Version:To:Subject:
	Content-Type; bh=F+HNNdlyuRmjijcNZ9VuH9FOCs8YBSRZkVxVMqWsky8=;
	b=Lvrh4HbF575bJUuKBCxdRbsAm9gfMUVXg9FsTxguQpFvjpNyLER9Eg4DGtvIDh
	g0TMdLw/jVtDtyUq2zmoA7WtgdS8S/ORcXfwEDzddXuZF8uY6X4gpkKlhpbwSHEX
	FXNRa9WO4PjGh4so3uo2RiE58uXtqsAPHKpKYZojS71C4=
Received: from localhost.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCkvCgDHj7RqYi9qrvV3Aw--.16977S2;
	Mon, 15 Jun 2026 10:24:43 +0800 (CST)
Message-ID: <6A2F626A.1010508@126.com>
Date: Mon, 15 Jun 2026 10:24:42 +0800
From: Hongling Zeng <zhongling0719@126.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: =?UTF-8?B?SmVybmVqIMWga3JhYmVj?= <jernej.skrabec@gmail.com>, 
 vkoul@kernel.org, Frank.Li@kernel.org, wens@kernel.org, 
 samuel@sholland.org, mripard@kernel.org, arnd@arndb.de, 
 Hongling Zeng <zenghongling@kylinos.cn>
CC: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: sun6i-dma: Fix use-after-free in error handling
 paths
References: <20260611063631.96566-1-zenghongling@kylinos.cn> <CyWPMXMZRBuYyL_Lpl2t_Q@gmail.com>
In-Reply-To: <CyWPMXMZRBuYyL_Lpl2t_Q@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCkvCgDHj7RqYi9qrvV3Aw--.16977S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAF1DtFW5CFyrCFW3CF1UGFg_yoW5Gw1fpr
	WUCa1rWF4kJ3Wava13Ja4kur1Fgrs3JFy8CrW5C3Z8CFnFvF92va4xCa4rCrn0yrn8Gr4f
	Zrn8K3W5ur17GaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jstxhUUUUU=
X-Originating-IP: [112.64.161.44]
X-CM-SenderInfo: x2kr0wpolqwiqxrzqiyswou0bp/xtbBoQsZ6WovYmsmKAAA3Y
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_192516_382998_65BE137B 
X-CRM114-Status: GOOD (  17.67  )
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

   Hi Jernej,

   Thanks for the feedback. I've sent v2 implementing your suggestion - 
refactored to use a helper function sun6i_dma_free_lli_list() that accepts
   struct sun6i_desc * parameter, eliminating code duplication.

   Please help review.

   Best regards,
   Hongling Zeng


在 2026年06月13日 15:46, Jernej Škrabec 写道:
> Dne četrtek, 11. junij 2026 ob 08:36:31 Srednjeevropski poletni čas je Hongling Zeng napisal(a):
>> In error handling paths, the for loop frees v_lli in the loop body,
>> then accesses v_lli->v_lli_next and v_lli->p_lli_next in the
>> increment expression, which is use-after-free.
>>
>> Fix by saving both the next virtual and physical pointers before
>> freeing the current node.
>>
>> Fixes: 555859308723 ("dmaengine: Add driver for Allwinner sun6i DMA")
>> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
>> ---
>>   drivers/dma/sun6i-dma.c | 20 ++++++++++++++++----
>>   1 file changed, 16 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
>> index a9a254dbf8cb..eb9c4ae87ac8 100644
>> --- a/drivers/dma/sun6i-dma.c
>> +++ b/drivers/dma/sun6i-dma.c
>> @@ -788,9 +788,15 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_slave_sg(
>>   	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
>>   
>>   err_lli_free:
>> -	for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
>> -	     p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
>> +	p_lli = txd->p_lli;
>> +	v_lli = txd->v_lli;
>> +	while (v_lli) {
>> +		struct sun6i_dma_lli *next_v_lli = v_lli->v_lli_next;
>> +		dma_addr_t next_p_lli = v_lli->p_lli_next;
>>   		dma_pool_free(sdev->pool, v_lli, p_lli);
>> +		v_lli = next_v_lli;
>> +		p_lli = next_p_lli;
>> +	}
>>   	kfree(txd);
>>   	return NULL;
>>   }
>> @@ -869,9 +875,15 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
>>   	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
>>   
>>   err_lli_free:
>> -	for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
>> -	     p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
>> +	p_lli = txd->p_lli;
>> +	v_lli = txd->v_lli;
>> +	while (v_lli) {
>> +		struct sun6i_dma_lli *next_v_lli = v_lli->v_lli_next;
>> +		dma_addr_t next_p_lli = v_lli->p_lli_next;
>>   		dma_pool_free(sdev->pool, v_lli, p_lli);
>> +		v_lli = next_v_lli;
>> +		p_lli = next_p_lli;
>> +	}
>>   	kfree(txd);
>>   	return NULL;
>>   }
>>
> This is certainly a valid fix, but it's replicating what sun6i_dma_free_desc()
> is already doing. It would be better to split code to accept struct sun6i_desc
> *txd parameter and call that instead from all places.
>
> Best regards,
> Jernej
>


