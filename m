Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FEACC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 15:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q7DM/H4J88m5LTg/VF1cfOXmgjLK3cb5liieOWEufiM=; b=Xl/ML7i/QSJDs7bSQgGkVdB+CN
	jE4kZL8mXAOoPok0oggzRiozdEzty2+/buK2WICYn9X7cDqdQtFABFGdeijMdmlziX6wKIqHFlyBj
	6gyuNlXUfKT1py/bjwiBusZD9w0NxITBSObt7qWQL/zeJLPgAyPiyOXeRbzo8Ssh7ra2+HkYgYc3q
	Ok9KHthnFC3Z4NnXRAyA68pUW2JkIGuaIxJSjUxZ5IW+fp6s44xvaLrd6Ik4Xp6AdGgqbUHRtpdPW
	9/JhKUlEgijIa7UsKbhtuVxEx9TNYifWfq58fWWpYi4SGyGxu4Ka2zLBRTQDiYw0fjvPTLik8i3Dz
	vdFHtcug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uix4b-0000000Amro-0mFB;
	Mon, 04 Aug 2025 15:26:01 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiwFf-0000000AgEc-1ra2;
	Mon, 04 Aug 2025 14:33:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754318001;
	bh=6Xq6lWAgsDQe8fpl2VHDMWoTzwPSyCoMukrEfer0HQo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ieC+jPHWLIqpcxWfiCI5ZBZF3lrt/PH7DpOrmBy8SUmxy4WSdvO9+9kiobgrXV1tz
	 tQCcYzC8rKK4R51vxyToNhsfOT/jp80c1fsSBVbhmorKH9DW6Yyc2dKJLAxYoSn2+y
	 9D0VZfkrdcleIjglnbOI6hx9NshSa7RQpsbKOP0sGUTgDIBjOefS9yVi0fALn54Y14
	 Cst3AeNQHTbRnQM47bwRLEQ93kLYBkSzB5sD302LkDVLPHgHRQGZVPQtqsbsLERtjZ
	 UV3x9C+WKLvvIFYYrT1qIfXO6EcyTj2CcvdlkCzMWN8UImFXt59okWn/Im7I7RUcx/
	 Pxa4l8u68V5Tw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ABD2E17E154C;
	Mon,  4 Aug 2025 16:33:20 +0200 (CEST)
Message-ID: <061374da-fa6e-4074-9451-1b3722217188@collabora.com>
Date: Mon, 4 Aug 2025 16:33:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/27] clk: mediatek: clk-mux: Add ops for mux gates
 with HW voter and FENC
To: Krzysztof Kozlowski <krzk@kernel.org>, Laura Nao
 <laura.nao@collabora.com>, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, p.zabel@pengutronix.de, richardcochran@gmail.com
Cc: guangjie.song@mediatek.com, wenst@chromium.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 kernel@collabora.com, =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?=
 <nfraprado@collabora.com>
References: <20250730105653.64910-1-laura.nao@collabora.com>
 <20250730105653.64910-6-laura.nao@collabora.com>
 <29ad5f60-6148-4e9b-8498-83a30a520536@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <29ad5f60-6148-4e9b-8498-83a30a520536@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_073323_661668_702B7BAF 
X-CRM114-Status: GOOD (  13.88  )
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

Il 04/08/25 16:05, Krzysztof Kozlowski ha scritto:
> On 30/07/2025 12:56, Laura Nao wrote:
>>   
>>   	clk_mux->regmap = regmap;
>> +	clk_mux->regmap_hwv = regmap_hwv;
>>   	clk_mux->data = mux;
>>   	clk_mux->lock = lock;
>>   	clk_mux->hw.init = &init;
>> @@ -268,6 +329,7 @@ int mtk_clk_register_muxes(struct device *dev,
>>   			   struct clk_hw_onecell_data *clk_data)
>>   {
>>   	struct regmap *regmap;
>> +	struct regmap *regmap_hwv;
>>   	struct clk_hw *hw;
>>   	int i;
>>   
>> @@ -277,6 +339,13 @@ int mtk_clk_register_muxes(struct device *dev,
>>   		return PTR_ERR(regmap);
>>   	}
>>   
>> +	regmap_hwv = mtk_clk_get_hwv_regmap(node);
>> +	if (IS_ERR(regmap_hwv)) {
> 
> This is either buggy or fragile. mtk_clk_get_hwv_regmap() returns NULL
> or valid pointer... or error? IS_ERR_OR_NULL is not the wait to go.
> 
> Choose one - IS_ERR or NULL, preferrably the first, since you must
> handle deferred probe.
> 

if regmap_hwv == NULL -> there is no HWV for *this* clock
if regmap_hwv == -ERROR -> there is a HWV for *this* clock, but something
                            went wrong, we have to return the error.

>> +		pr_err("Cannot find hardware voter regmap for %pOF: %pe\n",
>> +		       node, regmap_hwv);
>> +		return PTR_ERR(regmap_hwv);
>> +	}
>> +
>>   	for (i = 0; i < num; i++) {
>>   		const struct mtk_mux *mux = &muxes[i];
>>   
>> @@ -286,7 +355,7 @@ int mtk_clk_register_muxes(struct device *dev,
>>   			continue;
>>   		}
>>   
>> -		hw = mtk_clk_register_mux(dev, mux, regmap, lock);
>> +		hw = mtk_clk_register_mux(dev, mux, regmap, regmap_hwv, lock);
> 
> So NULL is passed and stored... are you sure this is 100% backwards
> compatible?
> 

Yes, it is. This got tested on multiple legacy SoCs in our lab.

> 
> 
> Best regards,
> Krzysztof



