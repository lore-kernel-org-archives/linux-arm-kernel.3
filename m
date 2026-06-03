Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8E7CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xhcEhoEwa+kbbZMwGdMBL9zpe4dw2cwYVPVEVWGmIVE=; b=3MsGYNTiQelz7QhciunBTNLjiD
	RjpjJOLktMvCkAhEXPTizh4K9czdRC1wCOMMgNX4bhTdLaVo1iMCs6XeCA6oMLzLX+xR45oz546DM
	eHHhAD7HtCFWTkSkC17fjpfVqHp1z0XN2/M1HdJWFYnTxndZz3YVg63jjTGTaCrt9p8CMtlJU1CLy
	Wib2Cw0waU9uCjfqIxvPQxf0t7fYELkXZ212yXvLpWnMERLIpdYAFdvnotPMxKg+GD+Phw2TRtIY5
	kQVZWFhTkqjDpQMJu1oLNM5O/ql7EoxFORyOuYCrK3sA4hmM8whBGl3ZY1F06Gm3+H90lHzk+fxwz
	QRMczqzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnl2-0000000FRYu-0WwE;
	Wed, 03 Jun 2026 15:43:52 +0000
Received: from dispatch1-us1.ppe-hosted.com ([148.163.129.48])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnkz-0000000FRYR-3vGY;
	Wed, 03 Jun 2026 15:43:51 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id ECCE0A80092;
	Wed,  3 Jun 2026 15:43:44 +0000 (UTC)
Received: from [192.168.101.110] (firewall.candelatech.com [50.251.239.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id 7C54313C2B0;
	Wed,  3 Jun 2026 08:43:42 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com 7C54313C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1780501422;
	bh=hLgshgyS7YOQD8gzLaUT8Q0QxecehSkbR1QldyX3hdE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ltKjLR/TkctAaphEbOismKYxMmiEtTw4a/WbAZf219lvTIoyYzW4KTLg87+C5FSQC
	 hE402zaAXw6i5OLokUqaiQZHw+8EgNmS0z8PMavM7bTK9FKkVxrytr/NLpWNl26Uvv
	 Cx6wqP6W43MdN7oiV2N6egC8MjQ/kpvlRWH0QS88=
Message-ID: <a8a4f908-f8f1-4cbc-9be5-bbf8e109743f@candelatech.com>
Date: Wed, 3 Jun 2026 08:43:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: mt76: mt7996: Fix possible token leak in
 mt7996_tx_prepare_skb()
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260531-mt7996_tx_prepare_skb-token-leack-v1-1-2b9c9f59ceb1@kernel.org>
 <80ff2108-dce3-4060-a8d0-59740979a99a@candelatech.com>
 <ah_TG4bkzitM4AER@lore-desk>
Content-Language: en-US
From: Dylan Eskew <dylan.eskew@candelatech.com>
In-Reply-To: <ah_TG4bkzitM4AER@lore-desk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MDID: 1780501426-zW_PSR9LY7Sa
X-PPE-STACK: {"stack":"us5"}
X-MDID-O: us5;ut7;1780501426;zW_PSR9LY7Sa;<dylan.eskew@candelatech.com>;40f3b03bb24907b736a33b345f288e14
X-PPE-TRUSTED: V=1;DIR=OUT;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_084349_998692_1DAC3625 
X-CRM114-Status: GOOD (  18.53  )
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

Hi Lore,

>> Hi Lore,
> Hi Dylan,
>
>> We have been seeing the token memory leak in our custom kernel. After
>> pulling your patch in, we are still getting the leak (validated with
>> kmemleak). How did you figure out where this potential leak was? I want to
>> determine if we are leaking because of our changes or if there's more areas
>> for token leakage.
> Can you please try to run kmemleak on Felix's tree to check if there are any
> leftover leaks not fixed yet?

Ran kmemleak with Felix's tree. I brought up only a few stations, no 
traffic run yet and kmemleak flagged a possible leak, same allocation 
location we've seen flagged in our custom kernel.

kmemleak trace:
```
unreferenced object 0xffff88811e6ca380 (size 128):
   comm "mt76-tx phy0", pid 1164, jiffies 4295044455
   hex dump (first 32 bytes):
     44 00 00 1a 0a a0 4c ae 0d 00 00 00 02 78 00 30 D.....L......x.0
     00 00 00 00 01 00 00 00 14 00 27 12 00 00 00 08 ..........'.....
   backtrace (crc fba2c5a3):
     __kmalloc_noprof+0x38e/0x480
     mt76_dma_tx_queue_skb+0x522/0x890 [mt76]
     __mt76_tx_queue_skb+0x3e/0xa0 [mt76]
     mt76_txq_schedule_pending_wcid+0x12b/0x200 [mt76]
     mt76_txq_schedule_pending+0x122/0x1b0 [mt76]
     mt76_tx_worker_run+0x1b/0xc0 [mt76]
     __mt76_worker_fn+0x49/0x90 [mt76]
     kthread+0xdc/0x110
     ret_from_fork+0x190/0x280
     ret_from_fork_asm+0x11/0x20
```

In dma.c, line 19 is the where the kmemleak trace points:
```
10 static struct mt76_txwi_cache *
11 mt76_alloc_txwi(struct mt76_dev *dev)
12 {
13         struct mt76_txwi_cache *t;
14         dma_addr_t addr;
15         u8 *txwi;
16         int size;
17
18         size = L1_CACHE_ALIGN(dev->drv->txwi_size + sizeof(*t));
19         txwi = kzalloc(size, GFP_ATOMIC);
20         if (!txwi)
21                 return NULL;
22
23         addr = dma_map_single(dev->dma_dev, txwi, dev->drv->txwi_size,
24                               DMA_TO_DEVICE);
25         if (unlikely(dma_mapping_error(dev->dma_dev, addr))) {
26                 kfree(txwi);
27                 return NULL;
28         }
29
30         t = (struct mt76_txwi_cache *)(txwi + dev->drv->txwi_size);
31         t->dma_addr = addr;
32
33         return t;
34 }
```

Let me know if you need any other information.

-- Dylan

>
> Regards,
> Lorenzo
>
>> -- Dylan
>>
>> On 5/31/26 2:10 AM, Lorenzo Bianconi wrote:
>>> If link_conf or link_sta lookup fails in mt7996_tx_prepare_skb routine,
>>> mt7996 driver leaks an already allocated tx token. Fix the issue
>>> releasing the token in case of error.
>>>
>>> Fixes: 7ef0c7ad735b0 ("wifi: mt76: mt7996: Implement MLD address translation for EAPOL")
>>> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>>> ---
>>>    drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 8 ++++++--
>>>    drivers/net/wireless/mediatek/mt76/tx.c         | 2 +-
>>>    2 files changed, 7 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
>>> index c98446057282..8c56344d211b 100644
>>> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
>>> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
>>> @@ -1067,11 +1067,11 @@ int mt7996_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
>>>    		link_conf = rcu_dereference(vif->link_conf[wcid->link_id]);
>>>    		if (!link_conf)
>>> -			return -EINVAL;
>>> +			goto error_relase_token;
>>>    		link_sta = rcu_dereference(sta->link[wcid->link_id]);
>>>    		if (!link_sta)
>>> -			return -EINVAL;
>>> +			goto error_relase_token;
>>>    		dma_sync_single_for_cpu(mdev->dma_dev, tx_info->buf[1].addr,
>>>    					tx_info->buf[1].len, DMA_TO_DEVICE);
>>> @@ -1176,6 +1176,10 @@ int mt7996_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
>>>    	tx_info->nbuf = MT_CT_DMA_BUF_NUM;
>>>    	return 0;
>>> +
>>> +error_relase_token:
>>> +	mt76_token_release(mdev, id, NULL);
>>> +	return -EINVAL;
>>>    }
>>>    u32 mt7996_wed_init_buf(void *ptr, dma_addr_t phys, int token_id)
>>> diff --git a/drivers/net/wireless/mediatek/mt76/tx.c b/drivers/net/wireless/mediatek/mt76/tx.c
>>> index 22f9690634c9..f96d9c471853 100644
>>> --- a/drivers/net/wireless/mediatek/mt76/tx.c
>>> +++ b/drivers/net/wireless/mediatek/mt76/tx.c
>>> @@ -933,7 +933,7 @@ mt76_token_release(struct mt76_dev *dev, int token, bool *wake)
>>>    #endif
>>>    	}
>>> -	if (dev->token_count < dev->token_size - MT76_TOKEN_FREE_THR &&
>>> +	if (wake && dev->token_count < dev->token_size - MT76_TOKEN_FREE_THR &&
>>>    	    dev->phy.q_tx[0]->blocked)
>>>    		*wake = true;
>>>
>>> ---
>>> base-commit: 4913f44167cf35a9536e9eec7352e15b2de0c573
>>> change-id: 20260531-mt7996_tx_prepare_skb-token-leack-82e240d8c66f
>>>
>>> Best regards,

