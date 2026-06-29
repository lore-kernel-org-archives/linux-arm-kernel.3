Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDDFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 03:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zYaJLO7rVJIlOh5//OZ2QMbg6ndszMv9dZxRzh/XAcg=; b=xA45E9XU+lJP4IkYoxLv6sv9uI
	3Ei4pyqEC0ZEJxkxxgTY0p7D94HtVEO2eI06vw2kDawgR33Fx5jNP7wkqNnyeHc/Ouieh75P4/8Ch
	pykNQNvJvgVFpYJTfArplF5VsNOvzhcTV6SS4xgkiqBbSW3sXw/4DL0+0X88s1a+xJaK8Dy79RLG6
	ghcnMR5EykiRPzAtzCnkZ76WJERjwlb9ICtbtmtewOkOKASGorPGGeMoKFTOGuOEyHyJcAFRwTrSS
	Yz6TDo3v+WhteGHeY7/8reS5UJYqLwMHQpXMcNheY4wg/Ftldo4R6jQ6P4fO+ZBER/UZsqAw6km7B
	hJ7S55VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we2zQ-0000000DeAO-2lpr;
	Mon, 29 Jun 2026 03:48:56 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we2zO-0000000De9q-2duN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 03:48:55 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-8478cc93299so90992b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 20:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782704934; x=1783309734; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zYaJLO7rVJIlOh5//OZ2QMbg6ndszMv9dZxRzh/XAcg=;
        b=mMPt1AAmx+gYqkwizY+hklFTFLlHJWK2n9LhwWDVzN5xm4Mb+WypfKHGURWMCm9k25
         kxUxQRf3tXWKV0erRyo28EoJJpZqxajx7ujJdnRYSMV5onYnZzISB09o8JL5Nt/WX2gX
         4ymTXxJzkaRwogejDmss+aACgJbytsGIOOlUzHBCuUqMis6Jt9lTmn7yqfskrkUvroJA
         gf4PEGLMB2syU4zv8zWvPAtqJZEluqrtFcXOcwf9IT+BXkn6pxsK8gS0C8+N/xqwJ/xO
         0Bx7JfK6gbrN7vSBP3cmpvr4LrXogjgUa2KUcOnwbl1UvWwFOGBH1bw376wN6YQ1wxv9
         nOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782704934; x=1783309734;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zYaJLO7rVJIlOh5//OZ2QMbg6ndszMv9dZxRzh/XAcg=;
        b=DFOxJ0d6T8YoGNJgEvrJ3EdcosM5dVFd+EqT19FfIFjbUNqT5eTyHqODGBBIRz56TP
         pZG093bDdQgjm4Kac3KibdrB9GGM+aSuigezlrIPAijSWI/UPCxpXn4crVv6JBUovD3y
         KVR2h9hX0t/GQydQ7UxHrCHnhqAw2Ju6w9DaebBRQsvZ+OCAfzEC/RAVOwFmdCCA97Wl
         7sZ+lgVUT0l7ieLme1Wrdn7XK4b9Mhxp0N1u8YOnHrPafvKS4J1HgC8iockSg8+ndUmm
         xN/aNqI+H8H+A1OagNklKwPELz62ei59Dsua4YXJpKrk1/w4GjsAhqu3ywgvmvpiKH4q
         Iw5g==
X-Forwarded-Encrypted: i=1; AHgh+RqOIYYlaSz6SYQMuqsXDCNX2N7QnMx/ktdDEGlY/dv//aYwV8GLVcSgpLMNohRWPaQkFbXrcH4ASPpV2JDrkiiD@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5JabbkqluiEy1O8rXJ8WSGjIV7PKdlidICn3Xe4emvB9+6QR4
	eycbqSL8+veYW0psDnvb8+t57ISsk+K9XILjvVWW3PQJQw8QQyac6xCR
X-Gm-Gg: AfdE7cmB6crlpSRE854QKRxqw8EafkG2AYNUsK7LhJHecjzXzh/7+LmVsJPjkqlqtEt
	ljSyUs6zCo7t7KJz5YRMO2W7gJysrqETB9Fw8e9jbbcopqzgtWj9cZ3OB16lTDHeccpdtJHWxVB
	NMjgt+6/0zKl92Y0Yb7GAiCc+rkD+o0ZZyGE3F6d82wKhWzWNTFL6ItzTPAExrHumX3VvBgrdu9
	Ur0GU7hR7ri/9LTe1ucj/vn3hYOs+UcFqOIL2EBesYKMjKl6Taj2EgDjUNyWrsNaDUxOLiYo4+Q
	fcvfu6TBqPOs7dZoUE/7PtgjBUmn841rYQWAxRS6mcrh6QH70Zyt0g1pzLUiVDO0P0pXE339aC7
	Ov8YHXgNicfHBPQ+Lig40Wv0WdLqMfRgsVGgdsfL9ZEc7tCkuJjZX3W7q06W45aMij2rm4jYoAo
	cv1taHqmP9rL1AXU5TfQ0MKiv3aCGmADmNTyUnX5m1G0HMN2Yv/ztezl1Wteu20N4HWqlZgJSyp
	kV6
X-Received: by 2002:a05:6a00:238b:b0:845:e19a:1188 with SMTP id d2e1a72fcca58-845e19a1487mr4616768b3a.52.1782704933611;
        Sun, 28 Jun 2026 20:48:53 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3fedaefsm11603061b3a.23.2026.06.28.20.48.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 20:48:53 -0700 (PDT)
Message-ID: <e44b9d64-95dd-4b1e-bcd3-05bd5a9963eb@gmail.com>
Date: Mon, 29 Jun 2026 11:48:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] drm/verisilicon: make axi and ahb clocks optional
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260625094449.708386-1-a0987203069@gmail.com>
 <20260625094449.708386-5-a0987203069@gmail.com>
 <cf9af38dfe52548649b9010f298341d4064aaa21.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <cf9af38dfe52548649b9010f298341d4064aaa21.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_204854_691879_00DBF0C4 
X-CRM114-Status: GOOD (  16.91  )
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


On 6/26/2026 4:03 PM, Icenowy Zheng wrote:
> 在 2026-06-25四的 17:44 +0800，Joey Lu写道：
>> The Nuvoton MA35D1 SoC integrates a DCUltraLite display controller
>> whose
>> AXI and AHB bus clocks share a single gate enable bit with the
>> display
>> core clock, so the clock driver does not expose them separately. This
>> patch makes the axi and ahb clocks optional in the probe.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ```
> Reviewed-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ```
>
> Thanks,
> Icenowy
Thank you for the review. I will revert this patch entirely. As discussed
in the binding review, axi and ahb clocks will now always be supplied in
the devicetree using the same phandle as the core clock gate, so making
them optional in the driver is no longer needed.
>> ---
>>   drivers/gpu/drm/verisilicon/vs_dc.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/verisilicon/vs_dc.c
>> b/drivers/gpu/drm/verisilicon/vs_dc.c
>> index 9729b693d360..fd1f5fe67a68 100644
>> --- a/drivers/gpu/drm/verisilicon/vs_dc.c
>> +++ b/drivers/gpu/drm/verisilicon/vs_dc.c
>> @@ -90,13 +90,13 @@ static int vs_dc_probe(struct platform_device
>> *pdev)
>>   		return PTR_ERR(dc->core_clk);
>>   	}
>>   
>> -	dc->axi_clk = devm_clk_get_enabled(dev, "axi");
>> +	dc->axi_clk = devm_clk_get_optional_enabled(dev, "axi");
>>   	if (IS_ERR(dc->axi_clk)) {
>>   		dev_err(dev, "can't get axi clock\n");
>>   		return PTR_ERR(dc->axi_clk);
>>   	}
>>   
>> -	dc->ahb_clk = devm_clk_get_enabled(dev, "ahb");
>> +	dc->ahb_clk = devm_clk_get_optional_enabled(dev, "ahb");
>>   	if (IS_ERR(dc->ahb_clk)) {
>>   		dev_err(dev, "can't get ahb clock\n");
>>   		return PTR_ERR(dc->ahb_clk);

