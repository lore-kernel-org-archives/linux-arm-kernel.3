Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030C5D10BF6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 12:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yH+o/HY3JXmwHdmBgupIEIWVJlcQTGn4DbO6wqm5C4I=; b=lXOeygHCNsp5xFoV+T0y0JIQH9
	DzVJHXSwMmNh1xnSZYVobBNddigU1pO32YHHbEQPAgkshAJXgBylhJEwdjQ5WD0jdD/TrIuFTRKPx
	XohrfhnK0Oor2CF5HkHqeS9mN1hgDUm4yL7/ocIpDZRw+Tn4+uP3rPvOs5KpWVHCpvsQDfZPf07K9
	dwPFDxyMXCRGbDPfmWx5cojV4+xK9ts1MsMq2V9FKNEwDPTeS7VhvU2CY0W30vstlRLM9KOzvY13O
	ybbKOZI0Im3uJMei2l5tHbRy9YiVODKlqWctsM+k8khUi8P+uvMfgfdWnK3peteG0DY7NJ7moJvum
	Y9Wnqj5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4fly-00000006bAh-2ERj;
	Sat, 26 Oct 2024 12:20:02 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4fkB-00000006aYW-1VnH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Oct 2024 12:18:13 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a9a850270e2so469300466b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Oct 2024 05:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729945089; x=1730549889; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yH+o/HY3JXmwHdmBgupIEIWVJlcQTGn4DbO6wqm5C4I=;
        b=H8ksgjUkt/VQ8uWXqdvVzx/s/sGxPCz4RNZhdn4ClmINYUhXh3g+6umnHj6ivKvw37
         jc+eoXv/n9OAzYyhgeG9xxsUgP4t710nOIw7MWkER18XjEDf1rMPCoBjJQqATOnwtCNh
         HGyd2pxvFy9fe/dys+NEDkUvjjwc4ot0C+wef6VwwML/Sundh4f6qPR9Y19bG6mnirF4
         ThNH6U2A0z3MjqEw+xBLEIvSe9we3mZ8F/2g6xNgPcJGpd8SkWi+oIcvrGMm/Pdwwm0q
         OaWBVF/RztsQV86ic8G+eG7gMtOzXh/bglxekV8ztVI3jqXWC0p5gs6a+x/RRiki8b/X
         AIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729945089; x=1730549889;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yH+o/HY3JXmwHdmBgupIEIWVJlcQTGn4DbO6wqm5C4I=;
        b=TKbCANXd8QmZNoEqTqbtQkHS+LKjaC/BK7c7R3K2pXmSFJRdElDHv7ozXM0pFQ5xOs
         TGwsfkEldozwW7h+ImCzAoVd3eEVY3wivSwUkUviTnybqr6IwICXalz5+bnaC225hsAA
         LsleZ6g6aliKgy3akxqKeiqqfE9PmDi1PXhTaBTujkWgt1/zzR7/CaGfjW5lF2xcChl0
         m6WlEIvpYhFVChItRrhFUeFp+psOMFr4jTtWSZrf37iwXFBUv4nAn1+u2QxuktTJG3c9
         qDBboYdczpeAzp58SA6uQxUGSSSRTU3Ak7e6pz3aAwvfq2inUBrs6k0jkmY0DeSqvEKK
         7qPw==
X-Forwarded-Encrypted: i=1; AJvYcCV1khEP02WfC0zwYKIheRErgOFCAj9w9sPhG5667c21jnIll/3Y5/VBBAkGsMojcU+YEJ64KdoCYF1Qp2FV3y2+@lists.infradead.org
X-Gm-Message-State: AOJu0YxzxAiQugwcTQyRGP5oZPFpUzZq122SqDHCwU5zmL7WVPH5IUrm
	dfAn3scmSdolnGHHAtbDbeKMdmvkux8bq4WAiito787drt+Gkzch3McZTg==
X-Google-Smtp-Source: AGHT+IFYyYwgZquxy67wBugI4PFcafIe8a40Si0QwupoEmiT4JdDegPMKfAYvoQS+vjZC9maXdtMqw==
X-Received: by 2002:a17:907:7ea0:b0:a9a:17fb:4c40 with SMTP id a640c23a62f3a-a9de5d6e1e7mr178998366b.26.1729945088794;
        Sat, 26 Oct 2024 05:18:08 -0700 (PDT)
Received: from [192.168.1.102] ([94.131.202.55])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b3a089278sm168124866b.220.2024.10.26.05.18.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Oct 2024 05:18:08 -0700 (PDT)
Message-ID: <f232dbb0-9036-46d6-83f9-27363813930d@gmail.com>
Date: Sat, 26 Oct 2024 15:18:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] arm64: dts: exynos8895: Add cmu, mct, serial_0/1
 and spi_0/1
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Mark Brown <broonie@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241023091734.538682-1-ivo.ivanov.ivanov1@gmail.com>
 <172994467264.24870.11860096857422265131.b4-ty@linaro.org>
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <172994467264.24870.11860096857422265131.b4-ty@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_051811_533812_B900337D 
X-CRM114-Status: GOOD (  11.34  )
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




On 10/26/24 15:12, Krzysztof Kozlowski wrote:
> On Wed, 23 Oct 2024 12:17:29 +0300, Ivaylo Ivanov wrote:
>> Hey folks,
>>
>> This patchset adds device tree nodes for multiple clock management unit
>> blocks, MCT, SPI and UART for Exynos8895.
>>
>> Exynos8895 uses USIv1 for most of its serial buses, except a few that
>> have been implemented in this series. Support for USIv1 and HSI2C will
>> be added in the future.
>>
>> [...]
> NOT applied patch 4/5 - I wait for bindings to be accepted by Greg.

Alright, thanks for applying the rest!

Best regards, Ivo.

>
> Applied, thanks!
>
> [1/5] dt-bindings: timer: exynos4210-mct: Add samsung,exynos8895-mct compatible
>       https://git.kernel.org/krzk/linux/c/e54eb0465e548a7c6115e336ec5cfec04bbe8747
> [2/5] arm64: dts: exynos8895: Add clock management unit nodes
>       https://git.kernel.org/krzk/linux/c/fa986d1073805154888a788eda38d46a796346e8
> [3/5] arm64: dts: exynos8895: Add Multi Core Timer (MCT) node
>       https://git.kernel.org/krzk/linux/c/9ad6c3bd1bcbb73e2a5723e13b9d06e2296b07e4
> [5/5] arm64: dts: exynos8895: Add spi_0/1 nodes
>       https://git.kernel.org/krzk/linux/c/a5541d737c8de71948bcdaee912bcb6b0781af7e
>
> Best regards,


