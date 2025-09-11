Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E07CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 15:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WHL5LcsLI9dIOkErscuPn0aXfUSWi6A2LqSujMYzR68=; b=PXOYfjaBLfsFkjwse85qH+3KkX
	b2vmZujemzX55mvXiYUsukuw+PTNKD/gM2WEjx2ahBkPC2OkkZrV+vfe2TZyoVRQpVrguiukIuDNV
	G7hFWI42vvftmvFgemBcSCXG3usk5HjnQiHp5tjUzsu2b6zJml4Opm1lsGUwu4GtO6uXdveGCyV30
	3zRjYxdUnvSA+c2vlWhJrpOaa/KyLqUKqT0PNegXhE9XUE4lS1zulWT90Au49BOV0PWxlRxaVwyuE
	hD7ucZHTEVGDiRnv9dVz9Ehn25AtlR9F5l+wpjcxwt1vShCD4Wf2EQxiyvHcGh4yefmy8Qn8bs+Sm
	VD1A2SKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwinc-00000003jzv-3N7t;
	Thu, 11 Sep 2025 15:01:24 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwina-00000003jyX-1EzM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 15:01:23 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45de185c04aso736565e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 08:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757602880; x=1758207680; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WHL5LcsLI9dIOkErscuPn0aXfUSWi6A2LqSujMYzR68=;
        b=aPjieEqB+rQRr0rCbUr9O+9wlKEYz+daqGNqTCzwZal/vBSf1I1AnvnYrnpwgVhLgV
         h2pmBFSzQ2cx0sQJxAVeVaujc9Ccr0Fi7YymaTBjgDSzzRypxvIthIl6FW5aHn6ZVeWl
         3eYvtVD5bRRDjg4ctufjKXYoEjxdRlkwgxn8+xh3RtrTKenNYFeKNR3ZarUsrMHGdU+w
         PHF2tHHVIbDuU/HvwM4ippzU4UM2Yd33fXIeAvsJF6mnQX3bgB2JgNOky4kPQi3hK9dU
         aS/hbXnAUSRyP72YoMAicuM/ooY/Pf+SU+Qtx7wxE4tMHPsR2xsipy5Hk6BWbhu/Ld0m
         kNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757602880; x=1758207680;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WHL5LcsLI9dIOkErscuPn0aXfUSWi6A2LqSujMYzR68=;
        b=SSiNdid8vXUAVGHVUNdTWzJGtBvJo3cXEhEFKrnnXRzj3CgpqHv91NjvO9j6KTjUIh
         DOghP5aF6uYCTrN5H2W/0znrGmFBadZIy0M1U0A7RTtmHuP9Hoki8EQCLn3oSZNH8LO6
         mBDZbB5T/9e8mhw5CJPpjKxwUVK2smeJvGs5IOq4hxml0SF9dpkrWb5hrnqOc+/NAslj
         gsJe1UuwEq4wT5N404N+CAO8apz2Wajrfx+6sd144gvNYXRSFjRfBjT+lEysmtdaDOT6
         w93MdNf5MHfIdsX0BF8uLN7P6j+dGvkUXhoPJu7HulXvVqXLDFzeXrJKJogFBt0bAdAb
         pSOw==
X-Forwarded-Encrypted: i=1; AJvYcCVYh7sQkmdfSZIhcJ8RqX9qde09yHEzJjr0DheUB/biHjAZDqznsFeZ/DxVcrkXt2IYC1y1ptj4cQOYE/SfW0F9@lists.infradead.org
X-Gm-Message-State: AOJu0YzzlFtlicXT1X7s4qeCNUJJ9ylzYwQLQExhOFgjl6B8oSkkHrGY
	OysdyBsaakxfQ7D1EoGUIv1P3p06iznlQolV0VID+G/V1xpZuChbZKLhnmmyKLd4/7KgpFUb0Ov
	Yx13z
X-Gm-Gg: ASbGncvXN/eRvPbn62fUnTkSi0fhvirlPWMdLPWq3oY6kXgPa0q7Qg2oCwYOd6/ii2n
	0RxIgCS2qug1r+n79va+jJSK/yhPdN9zP8fSfXuA6C5evZ68LQR3NSc+xBd0hluraaTtTVroLLa
	nEq1ZQC0jLvZrbKXgeFVM26/u9C3Gb8ca4nRW6FkcF9vF642BTwpgc2tB58DHs37Q44WEmfMnyW
	xYvAsRvFpzgjOs+4JaW1CDcuoJ/+UAExVhKDhLKqEooqJ200GaDXd1Clbaj6TUzGBjPEBPiWETx
	Y5JaANztr0GauSypa9aOru+UeYMzUlRt4f/M10zmbMEpEwuKQXdcOR8zFS2E33BYr4iGKqjohNs
	/9f50vBXAmgu8T6ZSgIQLA+ykasZdn6Y6186gpeP8lYFxpt3JZoisGJR4BTGUbnEX
X-Google-Smtp-Source: AGHT+IG/d1aWzZ0Ltu8iCu+Yk7Oxm2T5kOcTdTAB1ZLqJif8CiH/SJeBlnAzTppkpTuXinpQ1q86sw==
X-Received: by 2002:a05:600c:870f:b0:45d:c85f:5030 with SMTP id 5b1f17b1804b1-45dddea1c78mr91523505e9.2.1757602878916;
        Thu, 11 Sep 2025 08:01:18 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e01865ff7sm15772975e9.2.2025.09.11.08.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 08:01:13 -0700 (PDT)
Message-ID: <386a9d77-f708-4a47-8318-b83f862d5c1d@linaro.org>
Date: Thu, 11 Sep 2025 17:01:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64 defconfig: remove CONFIG_SCHED_DEBUG reference
To: Mikko Rapeli <mikko.rapeli@linaro.org>,
 linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
 will@kernel.org
Cc: arnd@arndb.de, stable@vger.kernel.org, Jon Mason <jon.mason@arm.com>,
 Ross Burton <ross.burton@arm.com>, bruce.ashfield@gmail.com
References: <20250911144714.2774539-1-mikko.rapeli@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250911144714.2774539-1-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_080122_371974_9B7BF434 
X-CRM114-Status: UNSURE (   8.49  )
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

On 11/09/2025 16:47, Mikko Rapeli wrote:
> It has been completely removed since v6.14-rc6 by

In the future please use kernel style commit SHA ("foo") style.
Checkpatch probably complained about this as well - are you sure that
you had no warnings here?

> 
> commit dd5bdaf2b72da81d57f4f99e518af80002b6562e
> Author:     Ingo Molnar <mingo@kernel.org>
> AuthorDate: Mon Mar 17 11:42:54 2025 +0100
> Commit:     Ingo Molnar <mingo@kernel.org>
> CommitDate: Wed Mar 19 22:20:53 2025 +0100
> 
>     sched/debug: Make CONFIG_SCHED_DEBUG functionality unconditional

So all above is not necessary.

Anyway, this was already sent:
https://lore.kernel.org/all/20250828103828.33255-1-twoerner@gmail.com/

Best regards,
Krzysztof

