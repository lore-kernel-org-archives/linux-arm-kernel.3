Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8267CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 18:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fXUB63jrlqA3KnuNNESByw9pK0N3zMqOBgrRWCqu1fY=; b=IJTiQfQD+Sld8HUD15tYhDWYIJ
	WsQ269VLXvHiUsbcjczBlOWS6CjrJt/O/P42Ml0EOA0b+wDygp28lvc9Rch1ZKLThUibv/6pkfb8I
	NQz1XNSnxX7E2BncPgiSyBGc3cNICFD+uX4w9CkD+KOLHDkfkU1OyWDcigbe3y0L6dWcFlJgFvRet
	MbddIngauHuz7s74wbJ8UsQETZUnba/EMBnQLUyqJKo+9+4xuT6alZLkJf+K756U/zJTFAQMa5cs7
	ch/94qBw2lGI09U6KYxibwLKDj60EoFMrx+G4r3ZtdvIZqA75pSQB3fRbFKVhlh5b3PaUvBqQGrJ0
	Ko/EF9rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUUK3-0000000DfL0-1DkO;
	Tue, 02 Jun 2026 18:58:43 +0000
Received: from dispatch1-us1.ppe-hosted.com ([148.163.129.49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUUK0-0000000DfKb-39DN;
	Tue, 02 Jun 2026 18:58:41 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id 09C8DC008E;
	Tue,  2 Jun 2026 18:58:35 +0000 (UTC)
Received: from [192.168.101.118] (firewall.candelatech.com [50.251.239.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id E226313C2B0;
	Tue,  2 Jun 2026 11:58:32 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com E226313C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1780426713;
	bh=4klqaW+qlOcvDydYV4JdaHYFzR0FqwPoLlkr0xdbJXo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FuTMALJRvJrpeRqxwCThZVjQY1vWP0JxucKYuEVEbpTXjryKew/mrGPmokove/Nm1
	 OYWL2YcJxzwgKE5C319iRtRTubqsSYqCWyinBlUYNqJxyYqSul1p2qTE8HK0sr5sUM
	 MknIRjOF6wncVnkz05QoEHNSHhr6XwU8ke+sMuWY=
Message-ID: <80ff2108-dce3-4060-a8d0-59740979a99a@candelatech.com>
Date: Tue, 2 Jun 2026 11:58:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: mt76: mt7996: Fix possible token leak in
 mt7996_tx_prepare_skb()
To: Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260531-mt7996_tx_prepare_skb-token-leack-v1-1-2b9c9f59ceb1@kernel.org>
Content-Language: en-US
From: Dylan Eskew <dylan.eskew@candelatech.com>
In-Reply-To: <20260531-mt7996_tx_prepare_skb-token-leack-v1-1-2b9c9f59ceb1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MDID: 1780426717-WQhNphcM8TUz
X-PPE-STACK: {"stack":"us5"}
X-MDID-O: us5;ut7;1780426717;WQhNphcM8TUz;<dylan.eskew@candelatech.com>;40f3b03bb24907b736a33b345f288e14
X-PPE-TRUSTED: V=1;DIR=OUT;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_115840_818772_0E2D684D 
X-CRM114-Status: GOOD (  18.66  )
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

We have been seeing the token memory leak in our custom kernel. After 
pulling your patch in, we are still getting the leak (validated with 
kmemleak). How did you figure out where this potential leak was? I want 
to determine if we are leaking because of our changes or if there's more 
areas for token leakage.

-- Dylan

On 5/31/26 2:10 AM, Lorenzo Bianconi wrote:
> If link_conf or link_sta lookup fails in mt7996_tx_prepare_skb routine,
> mt7996 driver leaks an already allocated tx token. Fix the issue
> releasing the token in case of error.
>
> Fixes: 7ef0c7ad735b0 ("wifi: mt76: mt7996: Implement MLD address translation for EAPOL")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>   drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 8 ++++++--
>   drivers/net/wireless/mediatek/mt76/tx.c         | 2 +-
>   2 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> index c98446057282..8c56344d211b 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> @@ -1067,11 +1067,11 @@ int mt7996_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
>   
>   		link_conf = rcu_dereference(vif->link_conf[wcid->link_id]);
>   		if (!link_conf)
> -			return -EINVAL;
> +			goto error_relase_token;
>   
>   		link_sta = rcu_dereference(sta->link[wcid->link_id]);
>   		if (!link_sta)
> -			return -EINVAL;
> +			goto error_relase_token;
>   
>   		dma_sync_single_for_cpu(mdev->dma_dev, tx_info->buf[1].addr,
>   					tx_info->buf[1].len, DMA_TO_DEVICE);
> @@ -1176,6 +1176,10 @@ int mt7996_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
>   	tx_info->nbuf = MT_CT_DMA_BUF_NUM;
>   
>   	return 0;
> +
> +error_relase_token:
> +	mt76_token_release(mdev, id, NULL);
> +	return -EINVAL;
>   }
>   
>   u32 mt7996_wed_init_buf(void *ptr, dma_addr_t phys, int token_id)
> diff --git a/drivers/net/wireless/mediatek/mt76/tx.c b/drivers/net/wireless/mediatek/mt76/tx.c
> index 22f9690634c9..f96d9c471853 100644
> --- a/drivers/net/wireless/mediatek/mt76/tx.c
> +++ b/drivers/net/wireless/mediatek/mt76/tx.c
> @@ -933,7 +933,7 @@ mt76_token_release(struct mt76_dev *dev, int token, bool *wake)
>   #endif
>   	}
>   
> -	if (dev->token_count < dev->token_size - MT76_TOKEN_FREE_THR &&
> +	if (wake && dev->token_count < dev->token_size - MT76_TOKEN_FREE_THR &&
>   	    dev->phy.q_tx[0]->blocked)
>   		*wake = true;
>   
>
> ---
> base-commit: 4913f44167cf35a9536e9eec7352e15b2de0c573
> change-id: 20260531-mt7996_tx_prepare_skb-token-leack-82e240d8c66f
>
> Best regards,

