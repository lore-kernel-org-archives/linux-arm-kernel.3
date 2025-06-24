Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F59BC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 19:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pBPEC7Udike9uc6BfC0QMKbP5KqggcKqpjSgmkMdnKY=; b=Oq4PNA2p4+pV/gARjNxjkhX48J
	zzbvlS6Fc0eapdoaK6iv9VPT7Mqagd1l2ZaTcYMCPE2SWkW66LfEM0U5XUyJldVGc5N+vot6/0Z9l
	YhaGAQ9QYIrzOTEjHJJB3nyO3alZyVE9l4drXEyujQmvtfycui6XoxnMRsP6YT1Uq7pEMvZq37Fed
	Wu18LXLEfaTSYkzg+0i++VyjY9Bk9i5BTF+rmSynt8D8KpW1IqlhoiVk0RtRhPqzFAiv8dL7NahC5
	iShWOaKTJFX5Qe6PZk7rdX8h1NcvmN1fxuWph5G1nsLyLCEw+LF6Q02oneN4lXkZd6AHXszHVjo7T
	sLyhacfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU9jV-00000006fsH-0D2s;
	Tue, 24 Jun 2025 19:55:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU6OJ-00000006GDq-1abT
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Jun 2025 16:20:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=pBPEC7Udike9uc6BfC0QMKbP5KqggcKqpjSgmkMdnKY=; b=cMjOYchJvHYAJxqNkoKjdngAXp
	fSc5dA/LgGAvM2OHPTNaU38TZc+qn4Oc3Y1C2RtgvR4xRQvdVAjFdLCiw9GTI7lOpKEy6jg+5Uu7R
	0NiGZaLJA5I2y8B/YkaPVE76GbEeXa7TS6ZQJQN3Np7YnzFRTqWqEqQY2N4cZvVwdB8iw06Ix7dkz
	ZdeTx+JjRdTxgN3zHDsPU3s7EDaXK+C41SrkFFYYAPUiZ6DZysxZi5AJoG6dZ/b9LObPhSCDB2SXR
	PIhMVobtJrNODV4LCz+sCyxeBrOQQIrfqQpUPLS4QbDarTyizAU1ouKorhol/aYjlV59ya3vlukY3
	iG2LP34g==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU6OG-00000005Ukk-2Yu5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 16:20:58 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4535fbe0299so31011785e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 09:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750782054; x=1751386854; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pBPEC7Udike9uc6BfC0QMKbP5KqggcKqpjSgmkMdnKY=;
        b=V2BhUgIjMsVuHwOIs3NFbzsz4wvfmvEnPkyx08Y3ZqD0pQdd2EfzCLMNIKXssDUIcF
         PO4jWXZNfjHUCgAdNqWy/o9VVaJFiT7qqjeYkpWGeC6FPjIyhD2xuhODJ5up28fbBfaJ
         HdUPJbLiPHQPkCy5Li+/gIsNWJAJylnwIc3Fkwd+y0kQDzwJT9+2xJST6uIi841R/iu0
         NCJjcaDeXI/7c/CMwSAs009Nnz1jAt5w5WJdoxj39wz4w/xCZuaunUpXABwZe1hl6N1F
         rHpZqO16Zps6ecI4Y4IPJktYTA15IFc52nUwE20P/M9XpAFHo2RDMlKS6a0cDki3HFCH
         QIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750782054; x=1751386854;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pBPEC7Udike9uc6BfC0QMKbP5KqggcKqpjSgmkMdnKY=;
        b=FEqoj5N4nHZYjhErd9lOSg1asL6mmJsKbcmeYFruN97zrlr53n+jb+lv28GpwnWXS/
         hgSb/SdiTefu12ECNsGhhK/11XwIMaaHOXzgLBcXYgrnbj5zWt4xJ6YouqqCN/1Ih0mV
         JrbsvC3BfNg33+QchbNdz9IvuMI3JmfwUfr0udEvXmoc7U83qZiD7FATR0wxw+KkpYdD
         iEHke53X88HSSxlhszWL2gS1vU9mxA2fVsYeoFVwzRZhowj0+3xqytrl3JqYyB6zXoO9
         eJujY1kbZHU6go97USzKy98dalosPEKUUv6NmcOutYTDFD5xUQJ6y54xWOVmmmJq0Lro
         ZBxw==
X-Forwarded-Encrypted: i=1; AJvYcCWRt2Es8kRi5ylMCfmtI9lXqBCF3yVVujiOv5pziTfAGOPggfJrna0sfdb0AiT4T7tQBFf8lCfTwtMxxM+PEi5/@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2tnhKE5RDZxus0MCg0do8qKYeSObAwYa7gVxNvPv5O6zNnk7Y
	95ym8Dfawr/XiYQSt2jcxHWJQ02Z6tT6L6MO62uATQVslUMwhTk1cYfx
X-Gm-Gg: ASbGnct85l0/xrAXiaVQxogmpbnZtSlBXBOej+d0z6pVxo1pdPRz6bH17pShyPXrqgv
	6jovxly8O47GUXsdaMbTmAqWsXwg1CQqO+nCWIILop2MNuUoE2DckE7AMdDkyQLfpxhvzUPG5d9
	ZajGlnHvMwlB0Tt3VMLGvW9EiFJd2aBjE+vfqf4EmU8HeZ/pU4LAyPvQeLDpAgmAsFBAPxEZvTk
	XNJ5SJlZLT6yVA4X6lrk1ouFvRTM13hhuMOHc9Gm5RZXhnmAyf945ud4TfPXBjVR58FfhL0MsXI
	C9B3Aj3ADIqw0aleGTX9sSBKajMcBxc58gWwTd+u/cInFyrxrV4rpcdOQTJrBpax2AIE
X-Google-Smtp-Source: AGHT+IF6pE2IAJ7Y1LDV5YWms/8jtl6+meXsDEGvoE2TkHeD+D5JYR9IpOTJZUfa+CipAih/vfpv8g==
X-Received: by 2002:a05:600c:a016:b0:450:ceb2:67dd with SMTP id 5b1f17b1804b1-45365a0026dmr149159215e9.33.1750782053900;
        Tue, 24 Jun 2025 09:20:53 -0700 (PDT)
Received: from [192.168.0.100] ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535eac8c41sm183195695e9.26.2025.06.24.09.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 09:20:53 -0700 (PDT)
Message-ID: <f6847b24-aa57-4ce5-995f-03b3056f88a1@gmail.com>
Date: Tue, 24 Jun 2025 19:20:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/19] dt-bindings: media: i2c: max96717: add support
 for MAX96793
To: Martin Hecht <mhecht73@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Julien Massot <julien.massot@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS"
 <linux-media@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
 open "list:GPIO"
 "SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)"
 <linux-gpio@vger.kernel.org>, Cosmin Tanislav <cosmin.tanislav@analog.com>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
 <20250618095858.2145209-7-demonsingur@gmail.com>
 <49977010-65a5-4ad7-b86d-5e779d0de3de@gmail.com>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <49977010-65a5-4ad7-b86d-5e779d0de3de@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_172056_738051_40F555E8 
X-CRM114-Status: GOOD (  17.07  )
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



On 6/24/25 7:14 PM, Martin Hecht wrote:
> Hi Cosmin,
> 
> I'm preparing a test with Alvium + max96717 + max96716. I can't see away 
> to overwrite cfg settings to force pixel mode or tunnel mode. Any plans 
> to add this? Sometimes it is required to force the other mode than set 
> by pin-strapping.
> 
> BR Martin
> 

Hi Martin.

Pixel/tunnel mode is chosen automatically based on HW capabilities
routing, formats, etc.

I don't plan on adding a way to force it, since the presumption
is that the serdes framework will pick the best use case available, as
long as all the data can make its way to the PHY.

Forcing pixel/tunnel mode shouldn't be done via device-tree since it's
not related to the way hardware is wired up to the rest of the system.

> On 6/18/25 11:58, Cosmin Tanislav wrote:
>> MAX96793 is a newer variant of the MAX96717 which also supports GMSL3
>> links.
>>
>> Document this compatibility.
>>
>> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
>> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>> ---
>>   .../devicetree/bindings/media/i2c/maxim,max96717.yaml          | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/ 
>> maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/ 
>> maxim,max96717.yaml
>> index ab46a5f0bd7e..23f611177a87 100644
>> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
>> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
>> @@ -30,6 +30,8 @@ description:
>>     MAX9295A only supports pixel mode.
>> +  MAX96793 also supports GMSL3 mode.
>> +
>>   properties:
>>     compatible:
>>       oneOf:
>> @@ -39,6 +41,7 @@ properties:
>>         - items:
>>             - enum:
>>                 - maxim,max96717
>> +              - maxim,max96793
>>             - const: maxim,max96717f
>>     '#gpio-cells':
> 


