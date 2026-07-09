Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A497EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 13:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rNnJX95hxQbwaDCrTdkHMqalJBPk7e0f/tiIZCqkdK8=; b=llCMFtuXBS3DoRa3RZs/ejyhlI
	nUWoKBSInpQSp/N7DGb5Og9qFSgfJTWYS6SYoJZNV+kIxjXBnEbZMHRS+FN5lycGs86lj7YgxwLFY
	Kypv277tAm26ALKH71n5YlUYmNp4YktGpwRGx1tLBtpQmZRtISa1TnHS3DxwdOExAdqM8GPDBlKwH
	PbznMrC62NOXo99LhXXNgA/G+PSx5Ejcy/DbSJLlJGvCRqBcqACMVKDzROOICGvXsvvXKyrlsPpR/
	xZFUqVw1RSydfVELP5spuNaEl7GD2tZBzoHocIjj3kw/zJU179aMgKDTWhnXDoBJgumDhU5LbdHuK
	TsjUE9fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whp5c-00000002dCz-2q5t;
	Thu, 09 Jul 2026 13:46:56 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whp5Y-00000002dBG-24Pc;
	Thu, 09 Jul 2026 13:46:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783604810;
	bh=fXn25ZsmdVpUiLsx2pP7JkadS6xlM44NBZ70tKQQ9o4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hQy9NFg4XtsNDOBKUxhEGPib64Xh1t88b02AJ9bSgq+ZyWEkZ8fXwUFANP9B18aHV
	 5ReH2DU82A3Vdtkl96w+kmypV5/Zu2cHDbGdPomcdh8QiGG5K1THGO36F2cIz3EjAn
	 ypXIsOQYYB8l6UBa1DtF2HP4CejThANdcvW5jDUJGD5C8T6zBAOmRJfnjtT85QzEvi
	 d4Ig9JzoithRQWyoF3P3k9vD7OgS5TrHmMukTAhzIjjr7/cyCFWZENZBGzotJitjCR
	 l4DZGn7qY/vLnPeqIdmImj3zNSVqclsqL4RmPbS9N75ClXogGVQMnpr0cwOf10ZRG7
	 2sHpMT3D1RyRg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7F4F717E003B;
	Thu, 09 Jul 2026 15:46:50 +0200 (CEST)
Message-ID: <5b6b81d1-5492-486b-92e4-dc67457fa9d3@collabora.com>
Date: Thu, 9 Jul 2026 15:46:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: mediatek: mtk-socinfo Add error handling in
 devm_kasprintf()
To: Griffin Kroah-Hartman <griffin@kroah.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>
References: <20260709132416.212212-1-griffin@kroah.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260709132416.212212-1-griffin@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_064652_682978_32734AFA 
X-CRM114-Status: GOOD (  14.32  )
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

On 7/9/26 15:24, Griffin Kroah-Hartman wrote:
> Add an error check to the devm_kasprintf() function in
> mtk_socinfo_create_socinfo_node(), returning -ENOMEM if the function
> failed.
> 
> Assisted-by: gkh_clanker_t1000
> CC: Matthias Brugger <matthias.bgg@gmail.com>
> CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Griffin Kroah-Hartman <griffin@kroah.com>

Yeah, makes sense.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/soc/mediatek/mtk-socinfo.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-socinfo.c b/drivers/soc/mediatek/mtk-socinfo.c
> index 424a1eb82c20..e294730ba709 100644
> --- a/drivers/soc/mediatek/mtk-socinfo.c
> +++ b/drivers/soc/mediatek/mtk-socinfo.c
> @@ -76,11 +76,14 @@ static int mtk_socinfo_create_socinfo_node(struct mtk_socinfo *mtk_socinfop)
>   	if (!attrs)
>   		return -ENOMEM;
>   
> -	if (data->marketing_name != NULL && data->marketing_name[0] != '\0')
> +	if (data->marketing_name != NULL && data->marketing_name[0] != '\0') {
>   		attrs->family = devm_kasprintf(mtk_socinfop->dev, GFP_KERNEL, "MediaTek %s",
>   					       data->marketing_name);
> -	else
> +		if (!attrs->family)
> +			return -ENOMEM;
> +	} else {
>   		attrs->family = soc_manufacturer;
> +	}
>   
>   	attrs->soc_id = data->soc_name;
>   	/*

