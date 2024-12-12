Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62AF5E77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 10:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fke4O3DZIsPBXopAuMCgSIChzUf1Or43DEXH3RtJKvM=; b=z+nqHd36JmJTwoQ9Ndq0guOUI0
	zRKdKY8CFrt9H3AwIQ+fN5BRBPYY7Lnn8ATXzu6zl9UCcuM/mxOK81HW9m7PLOSKZUNgSWmjc0bjs
	VWAS5jbJOoiZsbxgAmaTPLZLwy7U94Wj4nJGQeC2gJT2jF6hcnRlUiFvbmNuKzDLW5X5LLBkgzhi8
	h7I95hAVESayvOnOjkkPCczIt/I1OVU/ZtSmQhdG5092hHNyHSzom7EZ1Yd63AHj0C32nGjoew64X
	mWwlpDsGA3RXmebSa1It6qKoHGnt60Cdl+YPQ4Jehq0AgJhqpEy2AVpLUdKgKv4p3gzCbV1eBQFHK
	me9U5NJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLgLn-000000002vf-0ZDM;
	Thu, 12 Dec 2024 10:23:19 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLgK0-000000002Ze-2E7k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 10:21:29 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-434f1e5e77dso523165e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 02:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733998887; x=1734603687; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fke4O3DZIsPBXopAuMCgSIChzUf1Or43DEXH3RtJKvM=;
        b=Yp9S21dwsaBdDGnOwQppj/Bzc6wj2ayAFXlTmI46pZjcO9+AkkFWiPI2n5BmBdb3VH
         ifiUJwsrZH4nEz3kEqqNjBW/196B+P9ItftR4YWfGWoVH75BK/UdpFiIZQHfod/vXqnH
         3VHLxan6+iQOTLbNT47BqPiZENbbJzQckdJ3DkjqhIhB+n9z8LydA+FvBa7OQpo5vL2X
         tpeGmE7Cn01Q2OlbPEUueylhFVKvKltXgOK2L5+kR8eNJrPfT1ZaIlccYq6KQul0rs+D
         SVe8g8SnWT4MLTVBmW0H7lZKDysBwHwWB0w+xUIBJtU2BQgEPNrNDnDlKQT/Rp+Ju628
         exNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733998887; x=1734603687;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fke4O3DZIsPBXopAuMCgSIChzUf1Or43DEXH3RtJKvM=;
        b=X85fd+ytEhIUdD9FMqBBwcoC9xnc1um7iVg5TbAnSEXMXHbxDFM4A1wINPidERVJqE
         TBWHCQnwztGIGaHVfqjiRhJi+epZHorpC83+Gcme70Qzl8oCdCCWoNoBe0wyMF8XQcu1
         r38RTIlbdPubIk186iSDBMBH7+3xkzK/FcWnQiaECigqg4EANmw6XZXR5l4fcjlsm8N2
         6qaAHxAAbP9QgsYiXI/8sWd3BRB4PPw9dIfvXME8IDJriXio4V8rk6/UKLn2JxwshcMW
         f/Ia/Cnfj+B0xXAAEIa15u67BI2CjDGdrYKCyYTwXmciHWj3SM7B2OtU9WhPITF3ZxCX
         /WuA==
X-Forwarded-Encrypted: i=1; AJvYcCWOyaNRlgVibSX5nJu8E0Awo4PBBC5INjwXsbTBU+/txHDaBqGu1y+H+abymVdGzGNeVG0DaHvosxvpCe8PS7xs@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/1uioGhVUdJZxNxahRm6bvVqcwhHke+BAlcI32piglFKzaM+H
	SSgDGsZ9KHhZ46EbVlu7nC3kUFt1YhjkNH9iUvb8s4IWwSmjPuCvjYxVtM9j/r0=
X-Gm-Gg: ASbGncuaQVgL2ITMjdSXHwQEMmJ6ePrB1VpXt6hyj4gf9m5Ejmv5OXC06hy2y3JZnhx
	QDIpJ+vTYlXDBlFiSuMPa2Jbo+WJ7AlXZJqpCYttphJGvlVnQ35JQerpviWEtYiuSm4Q/RKIKrx
	tvbPrjnvOuywF2diWRXKUVX6+lPozuGFFcadkbFtdoOQXr4Wx8AOTw51N9vTxjFKUYvSSQn90Sn
	dbCmAFbZ1ZW1yK5aQDb/6suL3ebqxsg7RjWTBbO0zn/KBfQFUXtqU+B69pZRLLrnR2GreVt5zL0
X-Google-Smtp-Source: AGHT+IEcDdNRYWnvjCFEOsKyDvJiRhKNRQ1eVSRm7pLVduVuKq1rXUwsE5Gc/9YVe8Jw1Y7nTqaF8A==
X-Received: by 2002:a05:6000:2ae:b0:385:f1f2:13cf with SMTP id ffacd0b85a97d-3864ce55683mr1853061f8f.5.1733998887082;
        Thu, 12 Dec 2024 02:21:27 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3878248f680sm3668445f8f.9.2024.12.12.02.21.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 02:21:26 -0800 (PST)
Message-ID: <f19b4400-b94b-47ff-8431-2363d396284e@linaro.org>
Date: Thu, 12 Dec 2024 11:21:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] mfd: syscon: Remove the platform driver support
To: "Rob Herring (Arm)" <robh@kernel.org>, Lee Jones <lee@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Pankaj Dubey <pankaj.dubey@samsung.com>,
 Heiko Stuebner <heiko@sntech.de>, Liviu Dudau <liviu.dudau@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>,
 Will McVicker <willmcvicker@google.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20241211-syscon-fixes-v1-0-b5ac8c219e96@kernel.org>
 <20241211-syscon-fixes-v1-2-b5ac8c219e96@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20241211-syscon-fixes-v1-2-b5ac8c219e96@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_022128_574377_62F4EB04 
X-CRM114-Status: GOOD (  13.37  )
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

On 11/12/2024 21:57, Rob Herring (Arm) wrote:
> The platform driver is dead code. It is not used by DT platforms since
> commit bdb0066df96e ("mfd: syscon: Decouple syscon interface from
> platform devices") which said:
> 
>     For non-DT based platforms, this patch keeps syscon platform driver
>     structure so that syscon can be probed and such non-DT based drivers
>     can use syscon_regmap_lookup_by_pdev API and access regmap handles.
>     Once all users of "syscon_regmap_lookup_by_pdev" migrated to DT based,
>     we can completely remove platform driver of syscon, and keep only helper
>     functions to get regmap handles.
> 
> The last user of syscon_regmap_lookup_by_pdevname() was removed in 2018.
> syscon_regmap_lookup_by_pdevname() was then removed in 2019, but that
> commit failed to remove the rest of the platform driver.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
FWIW:

Tested on arm64: Qualcomm SM8450
Tested on armv7: Samsung Exynos5422

Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

