Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D424FE668BB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 16:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qQm6bVf/4ltr/ujc1ydQY5ajzT7bkLtyYQuXyO2SU0Y=; b=ha67wKNutlV+dVi7OiXzFa0l3B
	IglHXxWb6Gsv3SxccQZWPUceI6UZteh+5Oc/94yp8VnYLEPXools1YPu6c9e/aSPHGSHGLd1+C8Tf
	s/uGb5J36LCAuscua1s4aDeHXX+RU5AJPgqlYb088zoDkphzIDemZRp8Cs25cNdZGPXmtRUaSMhKN
	xXYchHIKwAjKabY1a9NySyohYlWfb/TqCUVu+d00Ri+JuI2WPaKNv4p8BIx2vzTbrorhRVhhWduKs
	Nr9NbH2HuaPRaF2rqh7icyM//5G8OyqrkJNoT0n3qCsHnjQtoE8Ae8PFk1iV9GX3H6z6p4+8epHCi
	E1KP9/ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFFEM-00000006Jtv-0EqL;
	Sun, 24 Nov 2024 16:13:02 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFFDP-00000006JpK-1Uy2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 16:12:04 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4314ff68358so5552975e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 Nov 2024 08:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732464721; x=1733069521; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qQm6bVf/4ltr/ujc1ydQY5ajzT7bkLtyYQuXyO2SU0Y=;
        b=s+Ca1A7qksFRwC/NsmPNz/MWp1tU9gj1+ReswSc7yJ91csCls5RQrsiMA9RLQeb66D
         ucWAv/rJ39jG7MM5Ae2qy4ofLE2+0HJVWUYWz/plmgw1eVsBVRhqpsVdiBwUo5VgY8cw
         ufoU+U9e2ZQdF8j8CUdKuN0CiWbJuPFzVnGKefx4Am2tPVehkns5QVI/jjf6HHS/GOVA
         Bpr3eiWIXaZLFXXyt8o85/YfacGz+4KA/X2DY8SigHg7i+zBMLU+lJuLJWU38iuz5TqG
         srzPpVkkTZrjUNyv8ff3a9XkAlorbgkYCxVBZSdMZa0Rz8942HxHWDvC7dXjk6Ie6q+6
         Gpbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732464721; x=1733069521;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qQm6bVf/4ltr/ujc1ydQY5ajzT7bkLtyYQuXyO2SU0Y=;
        b=MU0HdMghJ06jgxP5RsicSt4umkE/OvGvzqD2/taP4IcDrIgT2AZQtYhK4xnuQ7LAgC
         VgacO9szN9rjKvbvVjrKiya/BHxKUkNrpQCIPx+hKx8vYvnV+hcy6inOLSozjf1dXG06
         UqQozWRxQPk5jbJ6PmuM97+cQvDVcaAURHiE/mhNQTudYNIvk8Nbv9jTzgzh3uJwN4AB
         mko7QH5fIfuF2eTpzt24pr61FBcqzxFIpd25J+zEcc04rTaD3a6w2rJDQfz3ItiwAx8j
         eZs9YETd1QlbrHmevVTm/W6ICM+vqRM6HrcM6PSpRyQfYJq/1a4I0XYwb6wjsqNpfQ7J
         KRPQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8FJmpEi5rgw9WOg+GssFPx/o2Zki0qDLLl5PLHPYRbCpzn3gL68Cay49FBDgWr4A1zfwbwP/h4evwGSKwYqwR@lists.infradead.org
X-Gm-Message-State: AOJu0YyLe0QBHrn3hbde8eErU6SIHreU2lgLT/wwIlQaZkd04phdmtE2
	lwxRg0tlnBM6x15ou1ztgzo5RM+uWiVwV+5Fzm2IZGyIq/EkoIZyepSe+oja7OM=
X-Gm-Gg: ASbGnctixvuxcViE8dG/vlsV1DbOCSLI64iITI8NrcM4n6Gjkcbd9wYpP/1If6JhCQs
	7cAuhm/tdEX804nJ++azIyfbJQH+rBeQ+XJYMeYFZPxhTeL6L0P9i0KTzb5E6lVJstTX4Pteh/x
	0QgVGnq7aWeG//VN6nfbbBdcWFkRtkcrl8yorPAfkjn4E53dDcXxOsNt9G7eB8PM3SrpnIF6R5O
	bhMVXJdzma+OiOMWIo8ZqIRQT40tSMGT7jDBfl0Af9MYWfOrCoV1jXXEnDgoZm/oM48aQ==
X-Google-Smtp-Source: AGHT+IHgR5KeuA3oyfRDBJFP0KZz5l5B23PsJTeLmKZrmZd8h4yWmBqlsCgmqP5F0Hxsdg8tYQ/oaA==
X-Received: by 2002:a5d:5f85:0:b0:382:46cb:5469 with SMTP id ffacd0b85a97d-3826089cdc5mr3452504f8f.0.1732464721200;
        Sun, 24 Nov 2024 08:12:01 -0800 (PST)
Received: from [192.168.1.20] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbed85bsm8030423f8f.90.2024.11.24.08.11.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Nov 2024 08:12:00 -0800 (PST)
Message-ID: <027767d4-89e7-4665-b840-294a84a89869@linaro.org>
Date: Sun, 24 Nov 2024 17:11:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] WIP: arm64: dts: meson: drop broadcom compatible from
 reference board SDIO nodes
To: Christian Hewitt <christianshewitt@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20241124083453.900368-1-christianshewitt@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20241124083453.900368-1-christianshewitt@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_081203_402757_A4798497 
X-CRM114-Status: UNSURE (   8.77  )
X-CRM114-Notice: Please train this message.
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

On 24/11/2024 09:34, Christian Hewitt wrote:
> Drop the Broadcom compatible and use a generic sdio identifier with the Amlogic

1. Heh, what? Why? This is not really explained and does not look
sensible at all.
2. What is "generioc sdio identifier"?

> reference boards. This allows a wider range of Android STB devices with QCA9377
> and RTL8189ES/FS chips to have working WiFi when booting from the reference dtb

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597


> files. There is no observed impact on Broadcom devices.

So how does it allow wider range of devices to have working wifi?


Best regards,
Krzysztof

