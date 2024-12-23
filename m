Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A61E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 11:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lIzrCOLTPK2oqU6LRa5ckw9KatXFpfcT3tl+jD2/46A=; b=nMz7jF1mxa7KgwiQ66XaRjAFwK
	EC0BTql3fLochQid3+tsNecsRJib5/gQm1Hqd02zjol87axnxWFJUtJyl5SeA1ReopDXNZBY/h05v
	4RB36GXwsi15/CVUenFRqT4Hgrwt6XVwY5wMkH/1BXfIopPGWqDWqlAPNsqt5rd7Jx4ew3gtpTiEd
	FcsglKC1MRom3xAlK6OUoDk7a6MLJld40yIqMKlndEXrRVk/GjOnciD40wGT1OCAKmhtUvKBV7Whu
	56bWGWD2V60P6pofipN09+6Z2y0z/ppmixzXMxrOXR8wZHVRHnkaniU7MTd18g1OwDLOHbptCzREp
	m16CD6zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPgrX-00000009vjC-1Lxh;
	Mon, 23 Dec 2024 11:44:39 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPgqL-00000009ve8-01Xd;
	Mon, 23 Dec 2024 11:43:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734954202;
	bh=M3WuYSWs0zHI98S5beONgrZ1qO8VjPrSO1Yc8PMbt4M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=P+uCfPwn5Wi/Rmt6SUZuwur04l5evK1m1dOFxgBRY+q/WF3qe+oqM3VxuxFmLj6hU
	 XvPcKTkW55V2tUGrAV+4+SlrHQGbu8lUNRPMI/DHWHzMBb+wSpN8oKUg8d0hFK51jl
	 BbnnHkVRT6xH7wMDquv2g4bctZTt02GpiELuYAXGiI7Nd9dDUI2chKu72qGrWUoZhq
	 aHbP/UQDDGMci5RPTbpdHqWi87DK/qCWeTXGs8bjKmMYudp8EBZ685kWEHyAUrT7mI
	 QA8UiAOgAhrAK+4TR+bBRGJ8fajn6TE29aoB76glkRkID6GQnIIkDQ3cZBjP4JEAyW
	 xJhN5H8oSpk5Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 452B317E3684;
	Mon, 23 Dec 2024 12:43:22 +0100 (CET)
Message-ID: <bbc6aa2a-fe48-4e06-b070-fd66dbd00e15@collabora.com>
Date: Mon, 23 Dec 2024 12:43:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvmem: mtk-efuse: Enable GPU speed bin post-processing
 for MT8188
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 stable@vger.kernel.org
References: <20241223100648.2166754-1-wenst@chromium.org>
 <481a6eec-c428-45cd-98a6-5a91f3ceb187@collabora.com>
 <CAGXv+5Fj5s9FUyaxmEkGimxjEcS6OEfm4_5Zso+YocSi+Vt4pg@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5Fj5s9FUyaxmEkGimxjEcS6OEfm4_5Zso+YocSi+Vt4pg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_034325_198116_87E8A3CA 
X-CRM114-Status: GOOD (  13.78  )
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

Il 23/12/24 12:24, Chen-Yu Tsai ha scritto:
> On Mon, Dec 23, 2024 at 7:11 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 23/12/24 11:06, Chen-Yu Tsai ha scritto:
>>> Like the MT8186, the MT8188 stores GPU speed binning data in its efuse.
>>> The data needs post-processing into a format that the OPP framework can
>>> use.
>>>
>>> Add a compatible match for MT8188 efuse with post-processing enabled.
>>>
>>
>> Let's just change the MT8188 compatible list to
>>
>> compatible = "mediatek,mt8188-efuse", "mediatek,mt8186-efuse";
> 
> That would be "mediatek,mt8188-efuse", "mediatek,mt8186-efuse", "mediatek,efuse"
> then?
> 

No, we're dropping the generic "mediatek,efuse".

Cheers!

> Fine by me. :D
> 
> ChenYu
> 
>> instead :-)
>>
>> Cheers,
>> Angelo
>>
>>> Cc: <stable@vger.kernel.org>
>>> Fixes: ff1df1886f43 ("dt-bindings: nvmem: mediatek: efuse: Add support for MT8188")
>>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>>> ---
>>>
>>> I'm not exactly sure about pointing to the dt bindings commit for the
>>> fixes tag.
>>> ---
>>>    drivers/nvmem/mtk-efuse.c | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
>>> index af953e1d9230..e8409e1e7fac 100644
>>> --- a/drivers/nvmem/mtk-efuse.c
>>> +++ b/drivers/nvmem/mtk-efuse.c
>>> @@ -112,6 +112,7 @@ static const struct mtk_efuse_pdata mtk_efuse_pdata = {
>>>    static const struct of_device_id mtk_efuse_of_match[] = {
>>>        { .compatible = "mediatek,mt8173-efuse", .data = &mtk_efuse_pdata },
>>>        { .compatible = "mediatek,mt8186-efuse", .data = &mtk_mt8186_efuse_pdata },
>>> +     { .compatible = "mediatek,mt8188-efuse", .data = &mtk_mt8186_efuse_pdata },
>>>        { .compatible = "mediatek,efuse", .data = &mtk_efuse_pdata },
>>>        {/* sentinel */},
>>>    };
>>



