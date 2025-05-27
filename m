Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A7CC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 09:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W2mToIyIa5Ja0YaaEHQEF3YpU/0epNXWQBEOE7nzIqI=; b=GyZPPDiKeQ4RvCq5DC9m9gENdf
	d8rHrSj2BIXPp2UdFf3uydhUvWyRHSnR/OgBEC9AN0hgPDnzB3aL6TdkCBvSHp/rxzrm2qnfxDSXl
	aXChMu1JbFBh1MmAKQxuxvXgHYvqvKbPgtjWB9HWCNh/ocowUGa0IWUsWQk24KLBzGnq0TlbiXB5c
	ubYCPWs9iLTHv32w21xL9IErBiesL9x+Mo0snfUK2CxP1jK7hwdo2mz5nvxPCDhx193vof7RFynBY
	1BrekIlY/N4F156sv4E4Be9Nx+SJws3HstaoC4QBxZA26RUOvXaFgaPR17KFLS0/f4PT8iS5B0XKp
	/EEP3Acg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJqvm-0000000APSU-3J6h;
	Tue, 27 May 2025 09:49:10 +0000
Received: from out-177.mta1.migadu.com ([2001:41d0:203:375::b1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJqte-0000000AP6Q-1sI0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 09:47:00 +0000
Message-ID: <3a0cbaf2-4da8-466c-9e00-54a141e67f38@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748339214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W2mToIyIa5Ja0YaaEHQEF3YpU/0epNXWQBEOE7nzIqI=;
	b=sf0H2jutzm+M6Kewo8aEN82uyhjWN2Cy7AQjNbz3gsYy9718T7noxdgiyaAQMzuovju2Mq
	/hI2hQ9BfEwJUTDq/TCF/XzG2SMO13rKEYk55du1CQBT8ixog/9/tOFxD0m4TPKB+rQI4+
	Y5KjB0kw+JLuxGzJCjmesXDL/QguquI=
Date: Tue, 27 May 2025 17:46:46 +0800
MIME-Version: 1.0
Subject: Re: [PATCH] net: stmmac: set multicast filter to zero if feature is
 unsupported
To: Nikunj Kela <nikunj.kela@sima.ai>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Cc: rmk+kernel@armlinux.org.uk, 0x1207@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250523221938.2980773-1-nikunj.kela@sima.ai>
 <e0552940-9fbe-4375-a9a9-e26cd425591a@linux.dev>
 <93ae82e6-44f4-4f2f-b3b6-71240f84500c@sima.ai>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <93ae82e6-44f4-4f2f-b3b6-71240f84500c@sima.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_024658_932219_73AF53AF 
X-CRM114-Status: GOOD (  26.05  )
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


在 5/27/25 12:17 AM, Nikunj Kela 写道:
>
> On 5/25/25 7:09 PM, Yanteng Si wrote:
>> 在 5/24/25 6:19 AM, Nikunj Kela 写道:
>>> Hash based multicast filtering is an optional feature. Currently,
>>> driver overrides the value of multicast_filter_bins based on the hash
>>> table size. If the feature is not supported, hash table size reads 0
>>> however the value of multicast_filter_bins remains set to default
>>> HASH_TABLE_SIZE which is incorrect. Let's override it to 0 if the
>>> feature is unsupported.
>>>
>>> Signed-off-by: Nikunj Kela <nikunj.kela@sima.ai>
>>> ---
>>>   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c 
>>> b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>>> index 085c09039af4..ccea9f811a05 100644
>>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>>> @@ -7241,6 +7241,9 @@ static int stmmac_hw_init(struct stmmac_priv 
>>> *priv)
>>>                       (BIT(priv->dma_cap.hash_tb_sz) << 5);
>>>               priv->hw->mcast_bits_log2 =
>>> ilog2(priv->hw->multicast_filter_bins);
>>> +        } else {
>>> +            priv->hw->multicast_filter_bins = 0;
>>> +            priv->hw->mcast_bits_log2 = 0;
>>>           }
>>
>> I didn't read the code carefully, just did a simple search：
>>
>> ❯ grep -rn multicast_filter_bins drivers/net/
>> drivers/net/ethernet/stmicro/stmmac/common.h:611:    unsigned int 
>> multicast_filter_bins;
>> drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c:26: 
>> plat_dat->multicast_filter_bins = 0;
>> ***
>> drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:512: 
>> plat->multicast_filter_bins = HASH_TABLE_SIZE;
>> ***
>> drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:536: 
>> &plat->multicast_filter_bins);
>> drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:541: 
>> plat->multicast_filter_bins = dwmac1000_validate_mcast_bins(
>> drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:542: 
>> &pdev->dev, plat->multicast_filter_bins);
>> drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c:523: 
>> mac->multicast_filter_bins = priv->plat->multicast_filter_bins;
>> drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c:527:    if 
>> (mac->multicast_filter_bins)
>> drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c:528: 
>> mac->mcast_bits_log2 = ilog2(mac->multicast_filter_bins);
>> drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:516: 
>> (netdev_mc_count(dev) > hw->multicast_filter_bins)) {
>> drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:1527: 
>> mac->multicast_filter_bins = priv->plat->multicast_filter_bins;
>> drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:1531:    if 
>> (mac->multicast_filter_bins)
>> drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:1532: 
>> mac->mcast_bits_log2 = ilog2(mac->multicast_filter_bins);
>> drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:1568: 
>> mac->multicast_filter_bins = priv->plat->multicast_filter_bins;
>> drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:1572:    if 
>> (mac->multicast_filter_bins)
>> drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:1573: 
>> mac->mcast_bits_log2 = ilog2(mac->multicast_filter_bins);
>> drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:543: if 
>> (netdev_mc_count(priv->dev) >= priv->hw->multicast_filter_bins)
>> drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:633: if 
>> (netdev_mc_count(priv->dev) >= priv->hw->multicast_filter_bins)
>> drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:679: if 
>> (netdev_mc_count(priv->dev) >= priv->hw->multicast_filter_bins)
>> drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c:31: 
>> plat->multicast_filter_bins = HASH_TABLE_SIZE;
>> drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c:84: 
>> plat->multicast_filter_bins = HASH_TABLE_SIZE;
>> drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c:98: 
>> plat->multicast_filter_bins = 256;
>> drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c:365: 
>> mac->multicast_filter_bins = priv->plat->multicast_filter_bins;
>> drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c:369:    if 
>> (mac->multicast_filter_bins)
>> drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c:370: 
>> mac->mcast_bits_log2 = ilog2(mac->multicast_filter_bins);
>> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:7240: 
>> priv->hw->multicast_filter_bins =
>> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:7243: 
>> ilog2(priv->hw->multicast_filter_bins);
>> drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c:570: 
>> plat->multicast_filter_bins = HASH_TABLE_SIZE;
>> drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c:707: 
>> plat->multicast_filter_bins = HASH_TABLE_SIZE;
>> drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c:479: 
>> plat_dat->multicast_filter_bins = 0;
>> drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c:456:    int 
>> numhashregs = (hw->multicast_filter_bins >> 5);
>> drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c:485: 
>> (netdev_mc_count(dev) > hw->multicast_filter_bins)) {
>> drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c:1057: 
>> mac->multicast_filter_bins = priv->plat->multicast_filter_bins;
>> drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c:1061:    if 
>> (mac->multicast_filter_bins)
>> drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c:1062: 
>> mac->mcast_bits_log2 = ilog2(mac->multicast_filter_bins);
>> drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c:43: 
>> plat_dat->multicast_filter_bins = HASH_TABLE_SIZE;
>>
>> and
>>
>> drivers/net/ethernet/stmicro/stmmac/common.h:265:#define 
>> HASH_TABLE_SIZE 64
>>
>>
>> From the search results, the default value of multicast_filter_bins
>> may be meaningful. And I think that even if some hardware does not
>> support this feature, it should still be overridden in its own 
>> directory.
>
> There is a DT property 'snps,multicast-filter-bins' available to 
> override the default value for a platform however this property is not 
> taken into consideration in case of xgmac. That being said, 
> stmmac_platform.c logic can be modified to extend the property use for 
> xgmac also however the value will be overridden later based on hash 
> table size read from the HW Feature register. So only zero value will 
> be usable via DT in that case. Hence I thought of setting it to 0 in 
> the else part of the code I 

> modified in this patch. If you think I should extend the DT property 
> for xgmac, I can modify the patch too. 

Thanks for your reply. I think this is better.


Thanks,

Yanteng


>
> Thanks,
>
> -Nikunj
>
>>
>>
>> Thanks,
>> Yanteng
>>

