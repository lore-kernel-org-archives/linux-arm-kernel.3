Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF2CFCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 09:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K1Ng01oxY3M5qfiAudxVi2TxeWSFnm5beqIzfkI4jBc=; b=DYs/X+HMKM7Gkd78GfBB7X9kKL
	pmqBi+3sNeLLvyPlaG6C84b4IngoyzLjZEUectmtUUgaBKrcVK60IUjDF8bBCI8HVgifwD5gLAhj1
	6HlzUfFU6Jcxb/7ITamQaqG6UU4Yogs5TlP8DYtCpOCRtLcTY5qX0t1jJcZOh1wAn38XwKy98zBkw
	8KIen9UE+g30KtqBiOhYo5zl5H9facIn0mYz8gD5SGgB76OqwOlUPiehlkeXd99SheJiys7b/Ph7G
	qf5bhdO2gzmonpVMo2/OU4ymRD+EgcbMdscwqCaSXxyOZ3T8ZNup5t1jC0D8Q4g+ezTgd8kBx8yu3
	ymz7PoWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8EmA-0000000Cj1N-3ROB;
	Mon, 13 Oct 2025 09:23:30 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Em7-0000000Cizj-3Bdk;
	Mon, 13 Oct 2025 09:23:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760347405;
	bh=wzHuBDOU8kepU+v/s/kU0biC94VoWJWWLYgEY55sewM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A3RmQx9mY3Mbvkt/m+Q54nSz2oBNeLtAGVRadSuAurMJDO8WG5GtuU3NWLDCUW0NR
	 7mHvRv2tQSfuXf5GRV3kSWwsdkBPv6qDWdc8XHpNIl29XF7jL3U1YKVqz1FRYogFxq
	 okj1XCfPw+d8O5x8vjmhGzvryt8keQMKtYbVcnuPGTdorNU0v5TFZSQJgvjJjuc9tC
	 w1wNsAk2H1UActkUfKK7iLt2tkwIZOtCiIIjg9g9E9kYNRxr4jvFxDGFNgWQwyS3xj
	 Q/N970Ooa+DipdNDQbujbbbHCQF0ARayiDN+HZbWn67bGo2zGBRryYstTNlABIED59
	 DAm9WMXEV35ag==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 965E717E0CF8;
	Mon, 13 Oct 2025 11:23:24 +0200 (CEST)
Message-ID: <4716fb90-a6d3-41f0-af8f-b6eb64dca36a@collabora.com>
Date: Mon, 13 Oct 2025 11:23:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: mt76: mt7996: fix FCS error flag check in RX
 descriptor
To: Alok Tiwari <alok.a.tiwari@oracle.com>, sean.wang@mediatek.com,
 chui-hao.chiu@mediatek.com, Bo.Jiao@mediatek.com,
 howard-yh.hsu@mediatek.com, meichia.chiu@mediatek.com,
 Money.Wang@mediatek.com, StanleyYP.Wang@mediatek.com, nbd@nbd.name,
 lorenzo@kernel.org, ryder.lee@mediatek.com, shayne.chen@mediatek.com,
 matthias.bgg@gmail.com, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
References: <20251013090826.753992-1-alok.a.tiwari@oracle.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251013090826.753992-1-alok.a.tiwari@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_022328_139768_AAF9D9E7 
X-CRM114-Status: GOOD (  14.29  )
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

Il 13/10/25 11:08, Alok Tiwari ha scritto:
> The mt7996 driver currently checks the MT_RXD3_NORMAL_FCS_ERR bit in
> rxd1 whereas other Connac3-based drivers(mt7925) correctly check this
> bit in rxd3.
> 
> Since the MT_RXD3_NORMAL_FCS_ERR bit is defined in the fourth RX
> descriptor word (rxd3), update mt7996 to use the proper descriptor
> field. This change aligns mt7996 with mt7925 and the rest of the
> Connac3 family.
> 
> Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> index 9501def3e0e3..59744e5593b6 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> @@ -527,7 +527,7 @@ mt7996_mac_fill_rx(struct mt7996_dev *dev, enum mt76_rxq_id q,
>   	    !(csum_status & (BIT(0) | BIT(2) | BIT(3))))
>   		skb->ip_summed = CHECKSUM_UNNECESSARY;
>   
> -	if (rxd1 & MT_RXD3_NORMAL_FCS_ERR)
> +	if (rxd3 & MT_RXD3_NORMAL_FCS_ERR)
>   		status->flag |= RX_FLAG_FAILED_FCS_CRC;
>   
>   	if (rxd1 & MT_RXD1_NORMAL_TKIP_MIC_ERR)




