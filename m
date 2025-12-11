Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0754D4334A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 20:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RFNvjy025P4j3juJp/7mMNUGy36biZNwQLRzE8g0SZM=; b=lYdordH2bpKFGTvOqrZhqkOUge
	544tVN9YoaVCwiKoXZYS44i9G9UsUNw3Kem6n6Qe7ekSCQH8abe4JhhVKyGQMvO6Fg6VbpLQax0A6
	RD9ZNMyRE7okDThNwvxkgnHrBllb36UKDrFyEBq7s4WAitB9qEVUJKsLw0cWlx0CMQaTz5bThMBjz
	bervgNnX/Ie9qkE21lOHJ9NPcwVt8X6PBxFi4tDpWQ+kLa+kA14+oADwdxiCrn3pKmT8c+kkHMZUh
	G+nEAx0y5mSWbFzZX0DjPvgqJCdNwH2ADUMjWvogSieqOGUATPzlShdd75iBlKJD9TEh33w8h7ads
	mMdvy1NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTnGV-0000000HDlt-2ktD;
	Thu, 11 Dec 2025 20:27:55 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTnGS-0000000HDlV-2wY7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 20:27:54 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7b80fed1505so517114b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 12:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765484871; x=1766089671; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=RFNvjy025P4j3juJp/7mMNUGy36biZNwQLRzE8g0SZM=;
        b=d0FGVHavuiLLJCgBXpVI/ZvYG4qYUkl8XOATY1g3EV+GT8qMd60GmvptnkCCRIWOGi
         Ei6MMqSMQWwJLbMPBQcvmdx8rHHf+jC+kOWM1Vjc9IbwVrOXsutGeTBchv+bYIbho+fW
         EWUawPzbCYgEIfHr47eDHP0ix/EbEuh+c47FrhGZY/VcCEXDBJYDP9cYCX2qYRlVL7Ae
         UbJnxQW+jnApbG21C91ND/fnNN00mPy+6cCiqFCE6HdhZBMXNf4pPqO69IbNFpK0b5dO
         U8j/R/SV1Mc2uEYCOBst0dt1jDOtXDgNNjOXNW4ykfKPm03mT7julPQxYBx6bqbC7Ogw
         mKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765484871; x=1766089671;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RFNvjy025P4j3juJp/7mMNUGy36biZNwQLRzE8g0SZM=;
        b=Lj8UbOjhYEj/b/owr0xjJT8ZD0ULswbj6wT8na2PG+t4Be359bFvrqEutNwhSlFoel
         k+Tf2jsHkjTGTb1BwFXCBPY/604wwCmfxKFGed8jvx5eqM78ypysXefXJGLjvFqAUhDB
         rxWOm4uBfSXPvdu9RCLv/jls8KrCCy6fPKdySeZ3VKnzpc3b8JUoCR19WxGBx42DruZ0
         H3S6yrnRo/f54vLVCeSUehIpQ94+Kdvy+ZDeLdUnuyD7qdCZDw6oNCDTVSCtKO/Nmmh4
         0w3wRgDtgbmGyropRwB4rtFwbQLBb3wAfhIBzIfvbhNjmJWwOb+BeOBgVs2rdoQXOBFD
         MlMg==
X-Forwarded-Encrypted: i=1; AJvYcCVohMi3pBjJddJNfMDouuqS+JBNOykxTEKVEszUBoNNxXbavA9djnSjESSBx0mqXU+LK5IrPMi7ULiQekDpv/YR@lists.infradead.org
X-Gm-Message-State: AOJu0Yywl4ZFXZNDpGrE6XxyB6+u4/mPTPgiNU831xVW/weze+m4l6PB
	L3H8/rrOOr5VdVCR7AJAuD3lNqYKYzXCnwtWRaXvLiZDFzQD697gb8o/
X-Gm-Gg: AY/fxX5XySfPEM4Pof2RGll6Pv8iC+Q/5H244cqTHsvR2W+EvpoA19qzeUS0HUKfOmB
	d6NM+LHpxDDj+KBZm1Ac/u+QkluuKRVHP7KaL1a/35HREqj0B57nOOjKueu60m/5l88L4ITsx3J
	uatsH6Rh4rGFF7ScYRbft17NOzj2F4JIb1gPLfhfyIk/Pp1ucT8d2TcTeeOOh9ilNinE8ZbIfd7
	ClY5ZxYrFHWCYInDN/qWjKlz59bH26XSZ/wojjSonkqfsQihRlJIEAq92i1gAFjgX40alJo2oiH
	pZzxNrZxlnpreiVS/P+EAF/KGg1zyJtgKpRLvPRKGtDCJfKFOS0I0DKc7l+udOI6mOKfoYnFNiu
	mKU/wcVeIlZSPn5bZWicH4/bcwlTaPd6jA7SGFQP2nxkJOA3jvS0zqUiYN2A6FxyCy4KBR7fpTW
	kzGZT+cWzLwZp3CsvbFkaaChtjBpINVo9TJ7Hc1QWsPJ5dKzOtVB8dw+Yg738=
X-Google-Smtp-Source: AGHT+IHV4Iszd+K6pE+L70YOIdvHkZVJ03UYXalyKOYspoVp8AFbIBx4gAlLx501zb5azUo1ikN80g==
X-Received: by 2002:a05:6a21:6d89:b0:244:d3d0:962a with SMTP id adf61e73a8af0-366e0de878dmr8196886637.22.1765484871216;
        Thu, 11 Dec 2025 12:27:51 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0c2ae4e3casm3142680a12.21.2025.12.11.12.27.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Dec 2025 12:27:50 -0800 (PST)
Message-ID: <f17d93db-f96b-469d-88f0-0878a0fc9fe7@roeck-us.net>
Date: Thu, 11 Dec 2025 12:27:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 01/16] dt-bindings: hwmon: Convert
 aspeed,ast2400-pwm-tacho to DT schema
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Joel Stanley <joel@jms.id.au>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-iio@vger.kernel.org
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
 <20251211-dev-dt-warnings-all-v1-1-21b18b9ada77@codeconstruct.com.au>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251211-dev-dt-warnings-all-v1-1-21b18b9ada77@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_122752_752236_37ADE23D 
X-CRM114-Status: GOOD (  10.85  )
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

On 12/11/25 00:45, Andrew Jeffery wrote:
> From: "Rob Herring (Arm)" <robh@kernel.org>
> 
> Convert the ASpeed fan controller binding to DT schema format.
> 
> The '#cooling-cells' value used is 1 rather than 2. '#size-cells' is 0
> rather 1.
> 
> Some users define more that 8 fan nodes where 2 fans share a PWM. The
> driver seems to let the 2nd fan just overwrite the 1st one. That also
> creates some addressing errors in the DT (duplicate addresses and wrong
> unit-addresses).
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>

I am not sure I understand what the plan is here. I am assuming it will be
applied through a non-hwmon branch.

Acked-by: Guenter Roeck <linux@roeck-us.net>


