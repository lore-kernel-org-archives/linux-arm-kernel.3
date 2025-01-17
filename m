Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A46C02185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 07:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QhnZV2qLygGGQYrfuXJ4IFopDJzf5nAynmXZ+qlJOqI=; b=FMo6rT5LMmCL/xsrdKTtMnWuGT
	Gu3YeJkdQwrCoImz5whbmTMigqejogI4fvbioWkW9VOCqnoJE8H9QV7dswwuLpoTrh8INnKbYFyFq
	qI1C7nGQD4NaGai/eB/bA62CC4dn9HUVpGqPncKj0n19swwwOQTd6b2sNLAvGqUpHTkSwUtVZywEA
	hkcYdw658aKtnfk1keedaASKZeIb0E5+3JWsIAAdufdT7CbgD+LeNgmbOBqkA/9BoGmTVmIGXr04t
	+EnigU0XRh+kTZL8n0Th+Q+GYlYOkI0kkeWw+Xt6zo/LNBAKa70C3Jc9MhEN1Vbs1H/PHkzhyzXp9
	/UhxmWpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYgr6-0000000HDRq-2sSq;
	Fri, 17 Jan 2025 07:33:24 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYgpp-0000000HDDQ-1W5w
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 07:32:06 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43616bf3358so2264265e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 23:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737099123; x=1737703923; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QhnZV2qLygGGQYrfuXJ4IFopDJzf5nAynmXZ+qlJOqI=;
        b=R++qjq5NL6nVt+BSk4e15P9tY4f2HW+byV2Mh+vA4/RfgYzg7G04mxkJaJh9PhURXC
         6aNkOuTjJMgfumrM9z6Le/qdzIV/Z7WycY9SVvT1QH9LXgwQyDSyZM3yHkSKHdGDjPPT
         hsUiWhtMFxBSyIWB3gk/BiWVvetpciPl1rKemMxQk/RUU2lQe2VgVb9r3od3e2QpwEys
         tj2BEVj3LWokay67e+noJf7AHIs4vyT17horWHs3cLWG9XSRFU8ANggtSf5bY43sNvpp
         P2rZS+2IuMnpF/izGj9x538dha6T5vuo5kTomlQqUHr1HVHN7HM4IhG8RDXHq++fuT3e
         nsyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737099123; x=1737703923;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QhnZV2qLygGGQYrfuXJ4IFopDJzf5nAynmXZ+qlJOqI=;
        b=mTNyuyAiVhaStVGSTMxvLJhNEUZc4pFW3VUdEcQKk8lXSDnfuL0PJlphjyPu8BmQYO
         gq2eipV2lZBM8FoZjUFa0WVyAK1GtBT+TL86HbQlnhS/E3f80D6Du9CkMDeAv/FbWf/Y
         v6kUSieGZ2VV3xqI09+dbWUUx0Fo4m6ADE/bSwONPFazaaZPOIX58fl98K9NUezrQs3Y
         5IhCo8zDgeUUNFmWJIi87nvcx+9O9gbhbJMsH0FNsVr/+n3ieKsuolrqjsIr/yKG/7Y/
         lEtmKIlMLh7q0vWJzlOr2ZJF4AKZYTo7ZmqR09aVl1cbyWFfNsRMfzPoadG2d2ZC+j2A
         UMKw==
X-Forwarded-Encrypted: i=1; AJvYcCVak0az+wj4SQaFe2HZmFnxCp44gsBMnRQDRZiXkNH18HqyK4GiNr+HPfIUl6K5ydCES/rrJSAhfidX3MtqWAlD@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu7NwdD3A8a2mJpK2qJVzyDDL1nBn9rJIT9D0YHRs4lPAGvSV0
	X/4aKYTMcuWZYnWoL/OHg+m0KeugB4dXF+cYQ5/+XnEFZuBQmfult+dCN8hDHlY=
X-Gm-Gg: ASbGncsPnY9CoMRW8kXLPhJ4C4QHvVoSotzfBD45Sh3iZ4g4V+czcq4ENWTVbuL7qYk
	Dd9NVPFgIU32QQZdUCN5mJtESF5CCJlUP6DqTOw2eV6sGh8JTpS54oSqNRuxcr17Kmfs7ZdscKM
	1/VFXRF1zfB2upckkF/kBC/b7ifEAnHzLgNYi8S+HYS9sLrDtXXX4RMZwD1RN3Z9NrKadDV8+gP
	oLEGtISsxq0KuWYcUnkIY8AowKb4JYXXoGeUynrll+VPrghE7THwVwAVCzREN0CE4Wa9GmkC+AK
X-Google-Smtp-Source: AGHT+IGa9SO+65kR3fV0CVKf2Dpp0m4XXlC1sodI+HOrGtEKptb60EuOzshMaTW5d4BO54Rq0idoyg==
X-Received: by 2002:a05:6000:156e:b0:386:3c21:b1f7 with SMTP id ffacd0b85a97d-38bf56789d7mr502409f8f.7.1737099123403;
        Thu, 16 Jan 2025 23:32:03 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c753c60csm82333035e9.36.2025.01.16.23.32.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 23:32:02 -0800 (PST)
Message-ID: <3712d97e-8a2d-47fb-8f95-a9153c71dab3@linaro.org>
Date: Fri, 17 Jan 2025 08:32:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] soc: rockchip: power-domain: add power domain
 support for rk3562
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org,
 Finley Xiao <finley.xiao@rock-chips.com>, linux-pm@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241224093920.3816071-1-kever.yang@rock-chips.com>
 <20241224093920.3816071-2-kever.yang@rock-chips.com>
 <CAPDyKFqYjTsWsqf-C+iHJz3x-RKdsm2-2cPm-HMeH=WBNzcSLw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAPDyKFqYjTsWsqf-C+iHJz3x-RKdsm2-2cPm-HMeH=WBNzcSLw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_233205_413525_EF80D880 
X-CRM114-Status: GOOD (  10.39  )
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

On 16/01/2025 15:46, Ulf Hansson wrote:
>>  static const struct rockchip_pmu_info rk3568_pmu = {
>>         .pwr_offset = 0xa0,
>>         .status_offset = 0x98,
>> @@ -1429,6 +1471,10 @@ static const struct of_device_id rockchip_pm_domain_dt_match[] = {
>>                 .compatible = "rockchip,rk3399-power-controller",
>>                 .data = (void *)&rk3399_pmu,
>>         },
>> +       {
>> +               .compatible = "rockchip,rk3562-power-controller",
> 
> I couldn't find the corresponding DT patch where this compatible is
> being documented. Can you please re-send and keep me posted for both
> the DT and pmdomain patch?

I already commented on this on 1st patch - the split of original
patchset is entirely broken and actual binding is missing. Or not
missing but sent to entirely different folks in different thread...

Best regards,
Krzysztof

