Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA35C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 07:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g8yFIMfXcamOSTdytiUcdogK/QABhn5sWuK0oBzBWh8=; b=EYN49zeJUe18c6lZ3VqaupGqkR
	FPDB8EvKq/2ABaCUCdxxifSI/bhR0i1sCEG77lw3YtUZ/ow2O54GIHOqBI47zZAtf0ZAt7J8L1hqj
	hwK1NSOzAZvsKqrT7o6/DalTKsBX2ahCCm4WupUkSivml28M+jS4QO/VmPofLCRNYIJj6vHGdnrxj
	En7PFrXu/OcigJ5AV4b/Cb9jd6sd1lvuKEEN/YhkBG5bH9OyGneOaP7vwZ6otUh9fGaQi4YRyDyC7
	kleL+H0R7C2mWx11Qqed/QenskH2VD7l32/BB6tNsrFr+QsxEGIZH+kJTUfhrFl2yxZZBrT0MRqI8
	q0vq0jGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBS57-00000002ZnT-2bD1;
	Tue, 29 Sep 2026 07:16:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBS4r-00000002Zj6-0dCB;
	Tue, 29 Sep 2026 07:16:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=g8yFIMfXcamOSTdytiUcdogK/QABhn5sWuK0oBzBWh8=; b=JU6SdQtfHbp7GOa0g/LtGGQiur
	j3xDjNclktugrMB9t0vVuOriXQQUp8D8yojzbTQES5lCn3nJYWK7KgedNcyDhWL9yx22KjTWgWxPA
	Aakyp7g4tdpT8aRGIcuHtOxrFiGuOFa1CN2835Vgki+tcJUnmbmak3nmM/NpBjE28BJNW7jnchm0t
	e1FiCVG7magzcbdrffqTs4ICN/PQqLnbZhyQ4Mxpulu5NKC3ABgq+hQ3O97/ohioCEb4MPLPu6NCD
	0JRTXMPsYfSh41U6eTYcy7IRgam7nju2X7l7MQANT/nqeil9bIgwz8Xl1f1doW9BVjJoIxHX9/foT
	tAkvCy/Q==;
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBS4n-00000002HSQ-1rT3;
	Tue, 29 Sep 2026 07:16:36 +0000
Received: from [0.0.0.0] (ptz.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::77])
	(Authenticated sender: spu@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id E1FB5201548;
	Tue, 29 Sep 2026 09:16:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790666191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g8yFIMfXcamOSTdytiUcdogK/QABhn5sWuK0oBzBWh8=;
	b=ZHw0xdkYy/CgZdHMayUgrCk0soMlwyhaMORQtte2UHNbGN0o201RQsAvUvvJO0B/tASX+K
	/e0QmBTAs0E8LKSyAfA4hd2UAsZXpkivVzKhxGuDX4TfgNMICqDkuMmn48zqRWQX3qvPF6
	DfeWkjOBdLoVRw0n213tpVu59oBTgSu9LjsbEOUJxM9A+RyJ3odHCwW9Gcewpwi3es0t3O
	tlfG1smpcr8FKjykCeJJ52sDjjmZdksnikADGoc1+fSMbkdYRyrhl+OErnc/xq3XdEMsv9
	EuR0AYN9PxHH5HcwEeYN9/lPQXY4kV6tWJ5AiUqFE+JQXlWhzHB9qmvqDc6Ong==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790666191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g8yFIMfXcamOSTdytiUcdogK/QABhn5sWuK0oBzBWh8=;
	b=M+JKN1oGvusBH3GBbsSTZwkM4KbQFzknN49NdMhTKlqHKiBQJY4k1juzDjamtQAQ8oPB42
	5aA3ZEb0Ez2mG5RFTyZ0Ban7gPtS1dziE/z1uAc8TrABDztC45SrHuOrk5YQdx0N+1ulIB
	aneZeVJR0b2X2p8GxboV2RsfyDY54tyrxLg5IZLD4VJcttFfbTNBVyHSejK05VXBxle0yV
	kC+bU5sSk0PUkd1z+uVJNKKYqf2NRx9dvHoqNBD2Wo2WGfFQLoWyRHB9HYqPEb9ZvSLq91
	KqdkhQXcWNrik2OuYExfRRGTSyEEY9qCD8rp3VoIJS+NVKJ8JZy7QuZwQGkWSQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1790666191; a=rsa-sha256;
	cv=none;
	b=Ii8cJJuTLEYqiYxjCnvVvpCmlwjg6YT9uF6cvpIcfUkAdlNqZJR+/9KjwdoBQfHNHDdTNI
	r2tpE0lmVSyfwqqWL/5BTsriQOQoQ1DzcdcWbvE6cPVSeraHe9aHfx0ZTpEXUjF2dgs+1C
	1WfW308uJJtKuPmNtHwWlkisDqE9GgAYL2XzaKda1BL5QBRk+wQR1Ld1rYLhku1NzY83bH
	zeLUvWs8BWlZ11bkzJy4O77PE5UbzMj1vTM71AzOJ5cqjIi5tQqKjaROg/B84Wv5OWu5PK
	6tO8nZdpMj/J6UK6/C9ZK+LR1SrUrHEmZKnj/A3uvNtxQlDLkheGUayXk4BftA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=spu@pengutronix.de smtp.mailfrom=s.pueschel@pengutronix.de
Message-ID: <b3b26ca0-c362-47ff-837f-989fb8f9cc12@pengutronix.de>
Date: Tue, 29 Sep 2026 09:16:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: rockchip: rga: quiesce IRQ before releasing m2m
 state
To: Nicolas Dufresne <nicolas@ndufresne.ca>, Fan Wu <fanwu01@zju.edu.cn>,
 jacob-chen@iotwrt.com, ezequiel@vanguardiasur.com.ar
Cc: mchehab@kernel.org, heiko@sntech.de, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260704084659.612221-1-fanwu01@zju.edu.cn>
 <c5bb16dec180576cb7e68221880b5e36b7cb689b.camel@ndufresne.ca>
Content-Language: en-US
From: =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
In-Reply-To: <c5bb16dec180576cb7e68221880b5e36b7cb689b.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_081633_835612_D5B53D9F 
X-CRM114-Status: GOOD (  23.77  )
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

Hi,

On 9/28/26 22:18, Nicolas Dufresne wrote:
> Hi,
>
> Le samedi 04 juillet 2026 à 08:46 +0000, Fan Wu a écrit :
>> rga_remove() releases the m2m state before the IRQ is freed. The IRQ is
>> devm-managed and is only released once rga_remove() returns, so rga_isr()
>> can still run while the m2m device state is being torn down.
>>
>> Store the IRQ number in struct rockchip_rga, unregister the video device
>> first, and free the IRQ before releasing the m2m state so the handler
>> cannot run against the freed state.
>>
>> Fixes: f7e7b48e6d79 ("[media] rockchip/rga: v4l2 m2m support")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
> Again, I don't know if this is a real issue, but seems fair.

thanks for forwarding. Also stumbled upon the ordering in the remove 
function but kept it, as it looked akward if it mismatched the probe 
cleanup order (which comes from the fact that the video device is 
allocated, then the m2m device and after that the video device is 
registered). Is it possible to init the m2m device first and then 
allocate and register the video_device, thus keeping the same teardown 
order (i'd then adjust this in my multi-core series)? Or is there some 
logic behind this probe ordering?

Btw. the irq variable will probably be dropped with my 
mulit-core/component-devices patchset, as I then have a separate core 
struct and can check if my core has been already bound to something (and 
otherwise ignore IRQs). See [1][2]


Sincerely
     Sven


[1] 
https://lore.kernel.org/linux-media/20260916-spu-rga3multicore-v2-13-23aa2cb74e61@pengutronix.de/

[2] 
https://lore.kernel.org/linux-media/20260916-spu-rga3multicore-v2-14-23aa2cb74e61@pengutronix.de/


> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>
> Picked, ty
>
>> ---
>> Changes in v2:
>> - Rebased onto media-committers/fixes (Linux 7.2-rc1) so the Media CI
>>    valid-ancestor check passes. The rga driver was rewritten upstream
>>    (rga3 support, external IOMMU, clk_bulk, cmdbuf moved to rga_ctx), so
>>    this is a re-port rather than a pure rebase: the resource freed during
>>    removal is now rga->m2m_dev.
>> ---
>>   drivers/media/platform/rockchip/rga/rga.c | 4 +++-
>>   drivers/media/platform/rockchip/rga/rga.h | 1 +
>>   2 files changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
>> index b3cb6bf8eb86..fbc99462dce2 100644
>> --- a/drivers/media/platform/rockchip/rga/rga.c
>> +++ b/drivers/media/platform/rockchip/rga/rga.c
>> @@ -797,6 +797,7 @@ static int rga_probe(struct platform_device *pdev)
>>   		ret = irq;
>>   		goto err_put_clk;
>>   	}
>> +	rga->irq = irq;
>>   
>>   	ret = devm_request_irq(rga->dev, irq, rga_isr,
>>   			       rga_has_internal_iommu(rga) ? 0 : IRQF_SHARED,
>> @@ -876,8 +877,9 @@ static void rga_remove(struct platform_device *pdev)
>>   
>>   	v4l2_info(&rga->v4l2_dev, "Removing\n");
>>   
>> -	v4l2_m2m_release(rga->m2m_dev);
>>   	video_unregister_device(rga->vfd);
>> +	devm_free_irq(rga->dev, rga->irq, rga);
>> +	v4l2_m2m_release(rga->m2m_dev);
>>   	v4l2_device_unregister(&rga->v4l2_dev);
>>   
>>   	pm_runtime_disable(rga->dev);
>> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
>> index bd431534d0d3..7bcdf36c11b4 100644
>> --- a/drivers/media/platform/rockchip/rga/rga.h
>> +++ b/drivers/media/platform/rockchip/rga/rga.h
>> @@ -73,6 +73,7 @@ struct rockchip_rga {
>>   	struct device *dev;
>>   	struct regmap *grf;
>>   	void __iomem *regs;
>> +	int irq;
>>   	struct clk_bulk_data *clks;
>>   	int num_clks;
>>   	struct rockchip_rga_version version;

