Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00C0C982D9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 10:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o+oZnGlHZIGMyCuHE5hh6qyYk862NKFKTYCCieZ2ADg=; b=gGi3padTygdfr1R/yINHBElOCh
	y0BHi4Gufhh9LP26xW13CTsvxBad5CHk+yY7E6cUlaMjT0XWkCola/TB3NvZ76ys2nl3WiQXwq5uu
	+AcLEq8FapLJfC+peaI0r8eXBfqm/+EcvxIEf09IDPGNv/hhzOkrevSxprOFRG5nHAn2RwNVHbo8x
	n81Z4YN86o2g2XOyFqa97YR7BQ9y0CiJSi0GhMlzxWEvUDfihDYZO72RTeBvUSQzt1w7/UdaLYpBH
	DK/YfoaunztRNJfmkPvDpclu9CpONCRJtiaoztX2ZpAD3tSm6Vk16rMZIPXwYfKsnvQ/LU4FrLpH1
	NE7QCnEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Vuj-0000000E6SI-3QLu;
	Fri, 18 Sep 2026 10:33:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Vuf-0000000E6RX-3zsU
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 18 Sep 2026 10:33:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=o+oZnGlHZIGMyCuHE5hh6qyYk862NKFKTYCCieZ2ADg=; b=FLsQsAx8KE+aLSX99Frqqd/G1o
	6RsGkKYNvXBFbUDRTYV5ZKOK0qS2tg67hZNwgnwaxT/GoTGDP+/pnloI1bsbEnehdujIePHj25q69
	fpRZhg5WEIhun9EJ2CQzCmtXg3Lw+svObqDMByqR12BFcNtvF2xl8JAjgmHvp/S/+hOuEgnW2xot5
	4g7YDl5mywZbrGDcGLf7G7fnT6CaWKoogJVhj7Q+vVRFE4R0/yJplN0sbHrYdo4ADBBVsLUp39I7x
	2NTRdQMqxHYoCGS9nZ5mCFNvogtmbo5odri7Ely3C3fkhMb+NqTlm2GUbyO4734A0fzmfWJqG9rr9
	rhy/qxig==;
Received: from m16.mail.126.com ([220.197.31.8])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7Vuc-00000009w2X-2S0a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 10:33:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=o+oZnGlHZIGMyCuHE5hh6qyYk862NKFKTYCCieZ2ADg=;
	b=Mdj+wLodmw30hc3o+5LCnBT1zwxAS4bhZq8B3ESj2ef5vZ9UbKE+ggW/FtnHtv
	VY8pQMpDfaMEhTDPVPrhX/3c6bRL5gZV8PhXP7Q/MIhO2xRJgSiYWVW4zUP+YC9V
	ox9SWy9QePhHw3+e86s3IcRL6vkJiKfVP0qdHLF0JTQR4=
Message-ID: <62d9f679-68dd-45bc-9754-9e0ae931d2af@126.com>
Date: Fri, 18 Sep 2026 18:32:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: do not cache the new TSO MSS before it
 reaches the DMA
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Linkui Xiao <xiaolinkui@kylinos.cn>, stable@vger.kernel.org
References: <20260917124234.1348673-1-xiaolinkui@126.com>
 <aqwlUWN3rAXfcaWr@lore-qca>
Content-Language: en-US
From: Linkui Xiao <xiaolinkui@126.com>
In-Reply-To: <aqwlUWN3rAXfcaWr@lore-qca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: _____wDnNx9WE61q7PYEBg--.785S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXr1DGFW7ZFWkZry5Ww15Jwb_yoWrKFy8pF
	WUAa90y395Jr4fZw4kCw40qa4rJay3tF4Yyw18Kr9xCw43tr9Ygry3KrW5Wa4Uur95Zr1S
	ka1qka47CF4DZrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UZZ2-UUUUU=
X-CM-SenderInfo: p0ld0z5lqn3xa6rslhhfrp/xtbBqBfftmqtE1ckogAA3T
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_113347_269141_C000F189 
X-CRM114-Status: GOOD (  24.89  )
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

Hi Lorenzo,

thanks for the review.

On 2026/9/18 01:37, Lorenzo Bianconi wrote:
>> From: Linkui Xiao <xiaolinkui@kylinos.cn>
>>
>> stmmac_tso_xmit() fills the MSS context descriptor and stores the new
>> MSS in tx_q->mss right away, but the descriptor only gets its OWN bit
>> much later, right before the frame is handed to the DMA. Every error
>> path in between - the dma_map_single() of the linear part and the
>> skb_frag_dma_map() of each fragment - returns with tx_q->mss already
>> updated while the MAC is still programmed with the previous MSS; the
>> abandoned context descriptor is later reclaimed by stmmac_tx_clean().
>>
>> The next skb carrying the same MSS then compares equal to the cached
>> value, so no context descriptor is emitted and the hardware segments
>> the TCP stream with a stale MSS, generating frames whose payload size
>> does not match what the stack accounted for.
>>
>> Only update tx_q->mss once the context descriptor has been given to the
>> DMA so that the cached value always describes what the hardware is
>> actually programmed with.
>>
>> Fixes: f748be531d70 ("stmmac: support new GMAC4")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Linkui Xiao <xiaolinkui@kylinos.cn>
>> ---
>>   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> index af2d38a2bb3d..a8f94cd6abb4 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> @@ -4563,7 +4563,6 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
>>   			mss_desc = &tx_q->dma_tx[tx_q->cur_tx];
>>   
>>   		stmmac_set_mss(priv, mss_desc, mss);
>> -		tx_q->mss = mss;
>>   		tx_q->cur_tx = STMMAC_NEXT_ENTRY(tx_q->cur_tx,
>>   						priv->dma_conf.dma_tx_size);
>>   		WARN_ON(tx_q->tx_skbuff[tx_q->cur_tx]);
>> @@ -4714,6 +4713,7 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
>>   		 */
>>   		dma_wmb();
>>   		stmmac_set_tx_owner(priv, mss_desc);
>> +		tx_q->mss = mss;
> 
> I think the issue is real. A couple of comments:
> - do you think we should run stmmac_release_tx_desc() on mss descritpr in order
>    to clean it up?
> - I guess we should use the same approach used for data descriptor and advance
>    tx_q->cur_tx when there are no other possible error condition. What do you
>    think?

I started from your second suggestion, because that is the one that 
makes the
error handling consistent: tx_q->cur_tx is no longer advanced while the
context descriptor is being filled, it moves past it together with the data
descriptors, exactly like stmmac_xmit() does. On failure the ring index is
therefore still where it was and there is nothing to unwind.

That in turn makes your first suggestion mandatory rather than optional.
stmmac_tx_clean() walks the ring until it reaches tx_q->cur_tx, and the
context descriptor now sits exactly at the slot cur_tx points to, so the
cleaner cannot reach it and a descriptor tagged with CTXT|TCMSSV would stay
in the ring until the slot is reused. The error paths release it explicitly
instead, using the same helper the cleaner uses for descriptors. OWN is 
never
granted on that descriptor on these paths, so zeroing des0-des3 cannot race
with the DMA engine.

Concretely, v2:

  - keeps tx_q->cur_tx untouched while the context descriptor is filled 
and lets
    it advance together with the data descriptors;

  - moves first_entry past the context slot, so the error_dma_unmap 
unwind loop
    does not call stmmac_free_tx_buffer() on a slot that has no skb 
attached, and
    is_last_segment = CIRC_CNT(tx_q->cur_tx, first_entry, ...) == 1 
keeps the
    correct value for single descriptor frames;

  - updates tx_q->mss only after stmmac_set_tx_owner(mss_desc);

  - releases the context descriptor at the common "error:" label, which 
covers
    both the dma_map_single() of the linear part and the 
skb_frag_dma_map() of
    every fragment.

Nothing else changes. first_tx is sampled before the context descriptor is
allocated, so the tx_packets accounting used by the coalescing logic is
unaffected, and stmmac_tso_get_num_desc() already counts the context 
descriptor,
so the stmmac_tx_avail() check is unchanged as well. The
WARN_ON(tx_q->tx_skbuff[tx_q->cur_tx]) that followed the old cur_tx 
update is
dropped: it checked the first data slot, which the WARN_ON on
tx_q->tx_skbuff[entry] right after the first_entry assignment already 
covers.

v2 follows in a moment.

Regards,
Linkui

> 
> Regards,
> Lorenzo
> 
>>   	}
>>   
>>   	if (netif_msg_pktdata(priv)) {
>> -- 
>> 2.25.1
>>
>>


