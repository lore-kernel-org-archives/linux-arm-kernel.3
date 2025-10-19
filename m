Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28BDCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Oct 2025 16:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F4nurm4C437GvY/MkSXGc1LFe/0pjdPBVL3PvhKGUy4=; b=dXkzO+7EfxXRYRRQkyI9I0mWPm
	HmJR2egWMWvxpop1Pt1IxBjRdKjKsrQSVuiHkfS3h3pJpzOmbJjWeMLtib8KmZXvJFu1ecglNN3GX
	W3MdsEHk2VPbreqiBlpd7cJY7epxtslqoAcz/YaG+iCApTrPxKwi0qLyEbHtZsUrU0BEjOPtaNb0s
	+cYV6nd4EHfBe3UDWKrbKJY63b09l/FOnsYkPxsjJUqzqYCKcxBvdx/0kWTEwUUNTvuUZZMeNr0rK
	kiUwpIpIbN94MnwO7D0auDNzvUHLGZc1Kwm7ziaEgKIVvuOP3yKzRPLyy45NB9PYk/rKv84FNN+GT
	44ieaHrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAWFb-0000000BCav-22hW;
	Sun, 19 Oct 2025 16:27:19 +0000
Received: from dispatch1-us1.ppe-hosted.com ([148.163.129.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAWFX-0000000BCZw-3iLm;
	Sun, 19 Oct 2025 16:27:18 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id B5E5FC00063;
	Sun, 19 Oct 2025 16:27:04 +0000 (UTC)
Received: from [192.168.1.23] (unknown [98.97.32.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id 9D2B513C2B0;
	Sun, 19 Oct 2025 09:26:44 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com 9D2B513C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1760891222;
	bh=BJmOPFG38eK0SQjYH7HJARC0SJdnqD67ngX0T+67GTA=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=clqctUPTKzP1E+Q6/vsaq33wdwavDRqx0lN7mQQg3rVaeGoQ7ttwFl0FFv9KkQdYh
	 F6oSDhZPdku7Wcrqr4ercqiQPlc15qFsoPOMMHl51T0U4WHKUBbI65JV8WF8tN/pAs
	 VeT9Dv2x2qqBfNKV19u3z0j6PUgMXdDrl26MnGZc=
Message-ID: <fa7befd5-b2c7-4277-ad57-a1577216ba83@candelatech.com>
Date: Sun, 19 Oct 2025 09:26:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: mt76: add tx checksum offload for mt7915, mt7921,
 mt7981 and mt7986
To: Aleksander Jan Bajkowski <olek2@wp.pl>, nbd@nbd.name, lorenzo@kernel.org,
 ryder.lee@mediatek.com, shayne.chen@mediatek.com, sean.wang@mediatek.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 howard-yh.hsu@mediatek.com, StanleyYP.Wang@mediatek.com, rosenp@gmail.com,
 luoxueqin@kylinos.cn, chad@monroe.io, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20251019155316.3537185-1-olek2@wp.pl>
Content-Language: en-MW
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
In-Reply-To: <20251019155316.3537185-1-olek2@wp.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MDID: 1760891226-AlOZrs4LaPdf
X-PPE-STACK: {"stack":"us5"}
X-MDID-O: us5;ut7;1760891226;AlOZrs4LaPdf;<greearb@candelatech.com>;d5c215dcae166280e85b20da571dd1ee
X-PPE-TRUSTED: V=1;DIR=OUT;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_092717_552164_5DC75A80 
X-CRM114-Status: GOOD (  20.13  )
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

On 10/19/25 08:51, Aleksander Jan Bajkowski wrote:
> Supports IPv4 and IPv6 TCP + UDP
> 
> In various tests between MT7986 and Intel BE200, I observed a performance
> boost ranging from 2 to 12%, with an average of 5.5%.
> 
> I did the tests on the MT7915, MT7981, MT7986, and MT7921 variants. The
> MT7922, MT7925, and MT799x are untouched for now and still have
> checksumming disabled.

At least with  7996, tcp csum only worked on the first few vdevs
created in our testing, so we had to add logic to disable that flag
on subsequent vdevs.

Have you tried creating a bunch of station and/or vap vdevs to see if
all of them can still transmit TCP traffic?

Thanks,
Ben


> 
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> [rebased and resolved conflicts]
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>   drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c | 5 +++++
>   drivers/net/wireless/mediatek/mt76/mt7915/init.c     | 3 ++-
>   drivers/net/wireless/mediatek/mt76/mt792x_core.c     | 3 +++
>   3 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
> index 0db00efe88b0..e31b3e7e2038 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
> @@ -372,6 +372,9 @@ mt76_connac2_mac_write_txwi_8023(__le32 *txwi, struct sk_buff *skb,
>   		wmm = sta->wme;
>   	}
>   
> +	val = FIELD_PREP(MT_TXD0_ETH_TYPE_OFFSET, 10);
> +	txwi[0] |= cpu_to_le32(val);
> +
>   	val = FIELD_PREP(MT_TXD1_HDR_FORMAT, MT_HDR_FORMAT_802_3) |
>   	      FIELD_PREP(MT_TXD1_TID, tid);
>   
> @@ -391,6 +394,8 @@ mt76_connac2_mac_write_txwi_8023(__le32 *txwi, struct sk_buff *skb,
>   
>   	val = FIELD_PREP(MT_TXD7_TYPE, fc_type) |
>   	      FIELD_PREP(MT_TXD7_SUB_TYPE, fc_stype);
> +	if (skb->ip_summed == CHECKSUM_PARTIAL)
> +		val |= MT_TXD7_IP_SUM | MT_TXD7_UDP_TCP_SUM;
>   
>   	txwi[7] |= cpu_to_le32(val);
>   }
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> index 5ea8b46e092e..a3bab240afb7 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> @@ -359,7 +359,8 @@ mt7915_init_wiphy(struct mt7915_phy *phy)
>   	hw->queues = 4;
>   	hw->max_rx_aggregation_subframes = IEEE80211_MAX_AMPDU_BUF_HE;
>   	hw->max_tx_aggregation_subframes = IEEE80211_MAX_AMPDU_BUF_HE;
> -	hw->netdev_features = NETIF_F_RXCSUM;
> +	hw->netdev_features = NETIF_F_RXCSUM |
> +			      NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM;
>   
>   	if (mtk_wed_device_active(&mdev->mmio.wed))
>   		hw->netdev_features |= NETIF_F_HW_TC;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
> index c0e56541a954..fe138d2e8e62 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
> @@ -632,6 +632,9 @@ int mt792x_init_wiphy(struct ieee80211_hw *hw)
>   	}
>   	hw->netdev_features = NETIF_F_RXCSUM;
>   
> +	if (is_mt7921(&dev->mt76))
> +		NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM;
> +
>   	hw->radiotap_timestamp.units_pos =
>   		IEEE80211_RADIOTAP_TIMESTAMP_UNIT_US;
>   

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


