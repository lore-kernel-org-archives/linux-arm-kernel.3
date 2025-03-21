Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB55C36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 14:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ytG4OhmvAoifvIavHR89GwgHjeqU42K8UC/AJE3bg8s=; b=bEi0aN5zp+jktMluu7a41NsTmd
	qVihdHPCBmNfMqas626o6/313pCtqH/DDLKpODd4s3SvSCXZpIq2of7SqMxmU5oaLduJa3fUM2+cw
	43IyYbr3oOsBEAZJPifvprGh4D5pS/NAyOU3OrIyImrFiCDoMwt+GdjMe2z9Sn8UuMWdv69RBowlS
	yWGVqk1HUi2iSPTkcIAodX1xTs1S3Vg4W1e5D1zw4KQyxXIjZXU7hdfKhk3MTLBTyjCRQwnIR4ufC
	7x9ui+/VT4/AHv6ENKwkLgTUV4svEHKe0iarmDi1F9GR9fp5P0GkwHjNZkbRFVH7DYKRW1X/wnnBM
	khLgOA4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdIg-0000000F624-0AqU;
	Fri, 21 Mar 2025 14:24:42 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdBh-0000000F4Ux-2ad2;
	Fri, 21 Mar 2025 14:17:30 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43cf257158fso14307295e9.2;
        Fri, 21 Mar 2025 07:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742566648; x=1743171448; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ytG4OhmvAoifvIavHR89GwgHjeqU42K8UC/AJE3bg8s=;
        b=kLa922Hy2QvIm2EDbTMM3RMzl+jRv2b18n3hDKk63CwDf6WL+WwPRN5+habLAJDJ2C
         wCh1tqRkzujoKCMf0Zt0YZZSQ9M+4pGZiWZl7tXJqa6Ta18TG8ohTcjhTw9rG1D9unW8
         1YOaC0GVKmUJKdAwFSNdKExlYLR4hgPPTHcEHIiriaV4J7x87RJw6YwnxrNvaqx2Noyw
         hflBQ7BRckrsAiE+my5LPyx+tqyZ2etvUpxzkbtrWM2glo7ptJNivknROobjR2rEmaOn
         K3YpPaYcmGniS4suaBEhwvXEy2LJQ3RQtL0V244D/r2M4Q8b0HWLuLTp4t1DCnjD4F+g
         Tasw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742566648; x=1743171448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ytG4OhmvAoifvIavHR89GwgHjeqU42K8UC/AJE3bg8s=;
        b=Sb75vqhF46w9yIKQEZQxRiSvvByuw93fxckWs/xkZ70hSxWMK4lpgXXR0CJ2oH4pEU
         AYphorNgNYA00J8oQ6mI/ZzKR1BMEJTi/zmeZvjTPWAZVYbNmOBhxJ+YIVapGYpCj+6l
         c+0afliTAbjK7BGBJP6cfXqCXdRoU2wuqWTy4cCtXyTXpX96i+zuTs2LKheLkUrKa3OL
         yQjb5AGbxTJOdsXw+FAO1mGqmMuQBB0sE7orxfEYEYv5s5PdiPTIPqiy9Af6xdePddW8
         e7ehWhmySXuWO/c6mpBON1WEjTRJsn0VFP57PHFEDUVzzQTltDXEfZaXjMG8pl39FK8D
         /JQg==
X-Forwarded-Encrypted: i=1; AJvYcCUK9qOG0jF+SzHSmO4XmzRVM+WZz+sm/AUT82BJ7952M+jDG9u9MVgNYK/jfDky5QBny7453tO2KRxnI8SprW1d@lists.infradead.org, AJvYcCW0TFjQ7mewrYTLJ31Ny3R3bO+dDEn+b31yYBcLxhVjWH4WF+BBLE9xSmlo3OXpSJfK91PygrCxJB5w@lists.infradead.org
X-Gm-Message-State: AOJu0YxwOgFgDfvQRF8mDqd/iBHi1MiwOIUwx1i3kRZSXHWJX+TnUg8u
	CFx6BDD/UXDp7ZDa8I2pmOPX1mpglgELAvs2xgr8mTzlhUpXUbI1
X-Gm-Gg: ASbGncsESBKNaiC+0F9TULUdBiItVvsQCDs8GvwpxM5pVTd9fzVegAqzmF603YPEvW5
	ZnMfZzZBU/+W/HHAene7O2HxVXCdgO3RVTOgZn0uuwW0ZqkPHW/+sRy4IVvTy24FTZYLO/1Mpso
	lrP08QDKph8b8RA7kQnF5uvFhF2Z0FJq53unXG2IebfvUwUlk5OSJSipujysNGM2+HtI1QtGqil
	beqrRYgjdGSu7jKU7N478BDrjmfudqi1fgqupDHNeOcwwrIkMXbUHAF+8/fUC5o9Her9UjlByWG
	Bj2fmoNc2fSww8JduGj0R4fzEk9yCrgnYB4FeItYqQTKkuo0h2qWcvywoIk3SmtMXA7nYzqU9pj
	TZA3yt5rSibEHwNQJw5RXzcQ=
X-Google-Smtp-Source: AGHT+IHhU4LPTyHnNGvQrOFARSFPEWbuV6vlNsGOFbI3T/MO3rQl7YpluNrCNXFAx8Jyi8/qc5iipw==
X-Received: by 2002:a05:600c:1d87:b0:43b:ca39:6c7d with SMTP id 5b1f17b1804b1-43d509e6544mr37272295e9.3.1742566647738;
        Fri, 21 Mar 2025 07:17:27 -0700 (PDT)
Received: from [192.168.1.105] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a3428sm2517405f8f.26.2025.03.21.07.17.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 07:17:27 -0700 (PDT)
Message-ID: <782c2211-aa75-43b1-995a-2c93d75d75e7@gmail.com>
Date: Fri, 21 Mar 2025 16:17:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/10] phy: move phy-qcom-snps-eusb2 out of its vendor
 sub-directory
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Abel Vesa
 <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
References: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
 <20250321135854.1431375-4-ivo.ivanov.ivanov1@gmail.com>
 <vzlylhf5r5xy4ip4hkcolt3iye4stiabzxc4jwdzenbhll45ct@hx5gwpzrd33y>
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <vzlylhf5r5xy4ip4hkcolt3iye4stiabzxc4jwdzenbhll45ct@hx5gwpzrd33y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_071729_657451_38506613 
X-CRM114-Status: GOOD (  14.45  )
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

On 3/21/25 16:15, Dmitry Baryshkov wrote:
> On Fri, Mar 21, 2025 at 03:58:47PM +0200, Ivaylo Ivanov wrote:
>> As not only Qualcomm, but also Samsung is using the Synopsys eUSB2 IP
>> (albeit with a different register layout) in their newer SoCs, move the
>> driver out of its vendor sub-directory and rename it to phy-snps-eusb2.
>>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Please fix the order of the tags. SoB should come after Suggested-by
> (and usually it is the last one).

Hm? I haven't had issues with SoB at the top in the past.

>
>> ---
>>  drivers/phy/Kconfig                                      | 8 ++++++++
>>  drivers/phy/Makefile                                     | 1 +
>>  .../{qualcomm/phy-qcom-snps-eusb2.c => phy-snps-eusb2.c} | 0
>>  drivers/phy/qualcomm/Kconfig                             | 9 ---------
>>  drivers/phy/qualcomm/Makefile                            | 1 -
>>  5 files changed, 9 insertions(+), 10 deletions(-)
>>  rename drivers/phy/{qualcomm/phy-qcom-snps-eusb2.c => phy-snps-eusb2.c} (100%)
> With that fixed:
>
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Thanks!

Best regards,
Ivaylo

>
>


