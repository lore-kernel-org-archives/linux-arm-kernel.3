Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DED4C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 11:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bKtUMEoqDHLTfhHmG3inCWsYClLTJL5ZLVp5zayXN6U=; b=XoCOI7x24wTelQ9BsizXYHSv+R
	auzvWvyCnJm/q6CtjaxznVhZQ/huYazSXwLu+7yWL5crC0rm9hVOPPiqGoghRkUs0eXJxvcdB+ehz
	8IdEn1EV4SD9ypaSm/+nk+enA+/AfU6VAVI6THvxkb+psuemqqKCZ/SVO6f4BnUNwMO46z2E/RWua
	BX2M1pa/htrVcli/4kjQMSkJDoRajRq40bhENgJFAGSRUGxedFVEccMpU2ZulHgjrvkvyEhvnn0yJ
	473awMGv41Gv7a1BtBcfkd1RGNj2eVTwzO1CfVLhohrwwray3kzlUZKGoOtrxWohNUxyRsIlDZuMA
	0w3NsuGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYOHA-0000000EmSE-0qYr;
	Thu, 16 Jan 2025 11:43:04 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYOFu-0000000EmFw-12hx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 11:41:47 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3863494591bso437319f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 03:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737027704; x=1737632504; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bKtUMEoqDHLTfhHmG3inCWsYClLTJL5ZLVp5zayXN6U=;
        b=T/DsgAuI9pRn3qvHcozvrJflc6JIRS90uOipi2Um5o18G/v0+NYx/d2RuroPOSKQVR
         1umPYDmdEdMJm6gt49VQb6IGVEQg4oAwPLVHZWtobXJajY/54YC4qWqarLZLUVAa88ce
         NpPX9mfYv7RjITtsVm14J03uOj8t9n4yyM88nSgz1t/szSAFMcuhfXlL9VC0pV+fK/+5
         woHooXHwnZZOzqmllZwRyEPN1wRM717nSJEQh/bOL6NXHH+tQTaQfjNRoo596AIluFEZ
         RaAb+BdbrS4B8YKwkt33/r/yXQfob+DjYeQBA6dfIRs2bTVUM0Oxv+b5q/AK2W6Mi/vN
         yJwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737027704; x=1737632504;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bKtUMEoqDHLTfhHmG3inCWsYClLTJL5ZLVp5zayXN6U=;
        b=FWcf7HtsqUUTWJnx656ip8U42J2vLmXw/wdxo7IOmzo4nn4E/fKRSdpgfgIahI7Qx7
         0qRhnfrv7SjlI4FHi1Nv7/qi9hq5FdWhbRtKpRbeNC6saPa4bwaCautg7/jGRy7bZgw3
         6MVPQtpdo3hQAlz3sLGYgs86rEJD734mQQEDL/1JSdGuONiTVT3KS1lqbyIRkBwk0bxC
         swauEg/zIQ1puVgst8jtvnnm9xetYIbTsUtTeIGxQw+NROR6fTaSZ/WnzxcahCwYsjey
         mid6lFHTa9s7woLrJTYjCgGNam+NQU4QebED3dFqv6K2EHu1/Yr2qrHD7/FDp59vsQrs
         l7Yg==
X-Forwarded-Encrypted: i=1; AJvYcCUcnEZMXngQ2d5QLZSnhGK4tkOBH5ejOqNqUuIqC+DZ5KNbU4uRCfAlTeyTzLVrcYV+OywXCGdsD/bdITK+uCrQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwgMqhFhCquOceZjAWd6zZ+Mbgws7ZG+T1njG22CIyxdL3lB0I+
	x8q2s0XhcFVOWoWCiIpbX0Znyu/sTxxmDh41pHvxiUdZU69xGtIn8QaCrTFfm08=
X-Gm-Gg: ASbGncvtXNxCtW6FUYNHqow7Dc+/ec4RoeeOcKrh4i+9EkHyAcs8epal4Diilm+eXb9
	3fGQwWzV1JZsuk/E7WFzJLgeBx1yQtyT9B/PSiK2o7cxVrHQv09un7NJET11KCSQKrEENNhmHrE
	QX8rmIeJX65Ycdcm/fFbhYI8oWDhaac/9BsyGpa6xAgK8kjpqG8Ff5BRpdzY4Xq+Ch0MMxpprh2
	kX+96DR2lY4ELeg9BWZe8XVtB4nalGOLGyYLv57Kg4ku/7gphcYd7KL4xbGOSjSsQ==
X-Google-Smtp-Source: AGHT+IFueE/gZTYtweq/GR16SLOOq+RSDS7PYuc5QwoykXqiYGNy+orWNKBAzKyMcjXwFzsBcfLt3A==
X-Received: by 2002:a05:6000:401f:b0:386:3328:6106 with SMTP id ffacd0b85a97d-38a872f6193mr33619540f8f.35.1737027704561;
        Thu, 16 Jan 2025 03:41:44 -0800 (PST)
Received: from [192.168.0.14] ([188.26.60.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74aca93sm57515965e9.13.2025.01.16.03.41.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 03:41:44 -0800 (PST)
Message-ID: <77eeed18-4a48-4407-ae83-7a922045b29a@linaro.org>
Date: Thu, 16 Jan 2025 11:41:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] firmware: add Exynos ACPM protocol driver
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com,
 peter.griffin@linaro.org, daniel.lezcano@linaro.org,
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de
References: <20241220-gs101-acpm-v5-0-4f26b7fb3f5f@linaro.org>
 <20241220-gs101-acpm-v5-2-4f26b7fb3f5f@linaro.org>
 <8e6bade0-5184-4bf7-b1f0-103a77d0f98b@kernel.org>
 <060c7a96-c1ed-4c97-8a3f-f510102466f9@linaro.org>
Content-Language: en-US
In-Reply-To: <060c7a96-c1ed-4c97-8a3f-f510102466f9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_034146_298151_FB94058B 
X-CRM114-Status: UNSURE (   6.75  )
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



On 12/31/24 2:32 PM, Tudor Ambarus wrote:
>>> +config EXYNOS_ACPM_PROTOCOL
>>> +	tristate "Exynos Alive Clock and Power Manager (ACPM) Message Protocol"
>>> +	depends on ARCH_EXYNOS || COMPILE_TEST
>>> +	depends on EXYNOS_MBOX
>> Is it build time dependency? No || COMPILE_TEST?
> There's no build time dependency, I'll drop this line.

There's no build time dependency on EXYNOS_MBOX, but there is on MAILBOX:

ERROR: modpost: "mbox_request_channel"
[drivers/firmware/samsung/acpm-protocol.ko] undefined!
ERROR: modpost: "mbox_free_channel"
[drivers/firmware/samsung/acpm-protocol.ko] undefined!
ERROR: modpost: "mbox_send_message"
[drivers/firmware/samsung/acpm-protocol.ko] undefined!
ERROR: modpost: "mbox_client_txdone"
[drivers/firmware/samsung/acpm-protocol.ko] undefined!

Will replace the line with "depends on MAILBOX".

Thanks!
ta

