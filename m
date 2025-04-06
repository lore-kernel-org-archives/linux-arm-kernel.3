Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069B3C36002
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 21:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zDleBR0jwFGhTNeC9UeCz4wwAyXYlgAVasnWCtF6ZzQ=; b=BArPl9En9rUSMYXbCfHZ3p6v3m
	ANiYdAbUHL3mctu3mL8jkVdONyFuMCQnHdTK2gKRu3Wh4FsdJjQ/8yzw8icEok1Q4I4fqjCYdwfIZ
	GHQtwcapO+F5n7fpsPFm0BxlSXkZqZ4onAJuGZalMPWBvGsPgMbJah0B7SGVpMCkyQIZq2sIiRANW
	F0GyQSdy7ln8V71TJKgUuk1qX0GdbEG9C75l0g1pgqR3+aTxiYUdR2I53Z2OGiSNzwsmmuRv0gs6a
	u2SctASTJAFRvVeN+XyU44vKLqTFgD5fpoKoVkbNirW0vIH+XOJzvL0mjD8xltsNQx9lihfO4HK7F
	GEInLu5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1XMR-0000000Fpep-2aHP;
	Sun, 06 Apr 2025 21:16:59 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1XKd-0000000Fpa2-2V9G
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Apr 2025 21:15:08 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7376dd56f60so2566114b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 14:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743974106; x=1744578906; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=zDleBR0jwFGhTNeC9UeCz4wwAyXYlgAVasnWCtF6ZzQ=;
        b=Hgwl14SctBqbA+SEXBgS00XBkDLaohwmx+gsiqEFxHJKwOToUx6lkjiDw9UKWCL1Hb
         hYa5brxVkBzqLKxzrB/+bZgDqi7RGJs+PBfLJh7kjWDfuYg+9TXEn+xEY/VV/DzsN92b
         bWByMhmyKVXEib06LjHWt5YCZ6gZ/lC412dXfBfokjqpVzez/+Udsm/pV9B8Z1QQ/UwA
         p4EJXXN0R7yfSnDFCkyenqXmP6iGP9wzPQV3lfOmV+O5WMW2dYLOJRWhD5y+1anc3QgB
         f+VO+12vKNsN9pOCr9oRFGZd0axSYYGg3U5NU7nPK7PZgS+S2SWRPQqgx9X3wcjl+xf/
         cIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743974106; x=1744578906;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zDleBR0jwFGhTNeC9UeCz4wwAyXYlgAVasnWCtF6ZzQ=;
        b=Sohdc77XS1DGVs5Yveb4SbR6yzILUQK2o291cxS0scnR2KwP5ltXRSkB4ldA3HK/tp
         W9vCcFiQtu0wYCwjHxYBxF+JEx41QSbBQpwYo1lSYo6SjAYNffnOi65T9JVMsu991iZb
         t9N7fIdFHCUoifKXGpl3egriHLA4XDqCbkkeA8l1XvWypYlzFnLveOgnvmx4yC82XJYN
         /kCz72yvCPBFl6Vxf/+AqmVJktK8Pee8jrQKX3EoJBcxFV+FjfU1/6aB0QPcXPdcp6q/
         WRjhtawHw653SrmG3YotAFvDFFsQM24udAPk5P1mKBqeCvsbvPxV/Gsrudj82U14meGW
         tibw==
X-Forwarded-Encrypted: i=1; AJvYcCWzRpZUId7kVHlN3SJb1+vZlGw9Le5mn/td2Fm339fFbL/VVkwoGCpFCd09WCQUjlgi8Tl/h5Xm4/J/T0qbwpTl@lists.infradead.org
X-Gm-Message-State: AOJu0YxADWmpo+tIDn3zUHGvAnMo+HNO9QZCi0ER7EGQNZVcKNumDBiN
	T5/emzLDh010CayhoG6ZnVHMrDi2h6djpAuSaq8tmnpMEBG89iPFlf9FHw==
X-Gm-Gg: ASbGncun8XIvxfZLpeDUAznbyw1OCWixzCBc9P+KeZee+F39yymgeBmxocqe57nBGof
	+potc9NZzFYUjY3UW5e4KnKhCX3x1xMuyCzWVo0cIPkblW1T2FqRrgyYAvQ1jnVyct+44wqdLpJ
	bvYPwdh7w0nwzENkRFPbzKqelsArPWmqnqLA6NwOtTlARBOrTgecvPm/qfIXWlIfjkXxjlHX229
	uwaMHEI3a8uP6hShXRYr1Fl3Us2FmpEfFpWmJSKmm1PobjZk/XUHbuVDpF/3SbeqQP+tnlvxmAp
	Cgu+RBRvnSew4oHHlv7X9Xn6Tbp41/IYiCwBtqO1PzOBsiaQCXPGBVqLS6PRbOj2ZCoCJdUbqne
	TyJvHeeN4h+g68OrPaQ==
X-Google-Smtp-Source: AGHT+IFQ8QWvvd1ZviCya2MeIjl1ablt6V+jxnurJmhA/g3jhsv/TE0Na/5We5Jj9KIVyelIFaeiUA==
X-Received: by 2002:a05:6a21:9211:b0:1f5:7873:3053 with SMTP id adf61e73a8af0-20108187d17mr15484006637.29.1743974106291;
        Sun, 06 Apr 2025 14:15:06 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d9ea080esm7286630b3a.108.2025.04.06.14.15.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Apr 2025 14:15:05 -0700 (PDT)
Message-ID: <c3c22904-d684-4294-99d6-a83f53545934@roeck-us.net>
Date: Sun, 6 Apr 2025 14:15:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] watchdog: Correct kerneldoc warnings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250406203531.61322-1-krzysztof.kozlowski@linaro.org>
 <20250406203531.61322-2-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250406203531.61322-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_141507_647773_52A3BCE3 
X-CRM114-Status: UNSURE (   6.39  )
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

On 4/6/25 13:35, Krzysztof Kozlowski wrote:
> Correct kerneldoc syntax or drop kerneldoc entirely for function
> comments not being kerneldoc to fix warnings like:
> 
>    pretimeout_noop.c:19: warning: Function parameter or struct member 'wdd' not described in 'pretimeout_noop'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


