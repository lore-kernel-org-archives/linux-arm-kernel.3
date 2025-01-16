Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CCDC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 10:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LiwOgjzr0Zs7CdFBBC9wjKWud3Y5dwg9wFfYkI7dOT4=; b=STS5r2J8bWQhsxQVeWPa5KkXhU
	nzXaScEGI9PwqXPATPo806XAD8WYZpYVWkHWiyNBfkNxeRDKRJFxkgzlQSipzJbgCuDGAZs1IbvnQ
	IUcOW3LOMgHyFxrvB8LkmA2DjeDcH9jFR3wlmBWcmN5G4HpDF+lwTU1vIXDATK2PWh63UGyNkR9TU
	28RHQ1PgC2HIqrdtrJLxGQd3PDskrdNxf6PKjY0ZpK/P7PvcaFfAT9KqgiyzEN99nqOPpm9mfwPls
	M1VpS1oGreBUCbaZYBT9N43LJTQEA0iPf2pDsYhGBMwv9v0hOIoFpiT56xtXhSlUmMUaRnN/UOdmE
	JMYhuW3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYN5E-0000000EUwh-2ihs;
	Thu, 16 Jan 2025 10:26:40 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYN3y-0000000EUbU-1Eiv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 10:25:23 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-38637614567so372804f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 02:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737023120; x=1737627920; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LiwOgjzr0Zs7CdFBBC9wjKWud3Y5dwg9wFfYkI7dOT4=;
        b=ulCkMLalWjgz8mT7rZlTd9f0BUw89s8+yCKDlIOTT9rHo0B6Z3YHktbmk7zqRV8pBs
         1ljXgRXxpzjsx2sPjnGp1BtJPpn7GBeGDD/iJwhy0eaqyrOUAk2dX8XHJmffBR9uLfdP
         2m4Fw4yJzVNzxhsIEhwBNW9MZEWeMtikwLxRkE9g3qQ8QxrHHm/dOp/D1cJXQlAKklBT
         j9SqKht3P0DHzIKn2EUNZXklUXojdb5V96WBjAh4cG1YeMbP9T7V2a5Ah7Xy1ejWcEbV
         qhmU4RVj0MDt3Bc9IzhY+v9cwPrlwsy0g+pV9KC4nm7YMCoas3U0u19cPkYWT/sJZWxg
         WyDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737023120; x=1737627920;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LiwOgjzr0Zs7CdFBBC9wjKWud3Y5dwg9wFfYkI7dOT4=;
        b=gdq0f7w0Y/6VDgd6uyXpQW6oRiTplrhZ8IvwxgR4y9zo60eetWRxvbBDEWuvYG1cr8
         4ZDWzVC5ngicZTnztvPTzFtnNN/UY4G6ftcF6Vesqd5N/xT+PB0FnwQDTBQPG+/NhlOT
         tpAupir1qpVqlApJfPzEVa6tas9s+BanQZCRkBt47IbuHqr+jZ9OlhF9oHSQ6ciQqfVZ
         cNNuYd4HVZwpkALFwUCokfQCw4jMhP2gX7H+GF2KeiCby5nCIa3Qo5P4jajiuExr78jc
         mKXup2Nh9UgFumhvOokuTG4rcAc+pe6moJ5mABuPd3h7qlhxI623DaMhjHjSI980sOLa
         hORg==
X-Forwarded-Encrypted: i=1; AJvYcCUKRWIR7EsIazWsLwhyyrF59aoJGTAilV4FP51WSqgqws4epu6DSOL7LQI1snGgdQpkxgZcT3Fv9k13kZnbFgzi@lists.infradead.org
X-Gm-Message-State: AOJu0YycUWfm51yWG3OGqSmLN7ZzP3Ewplg/jiMchU186+pA3G+DFZjf
	4lqoWPASOb0o9In4ywhn0mrnM23d7xZGreaBXKBB3IdaiI7Z1GHJLxjS+T1VczA=
X-Gm-Gg: ASbGncss6/GWQupqlBiWy6R8W8+RuHxjtnD2LgPp7KcXEXe1Ekq4hwVxuHjrDUeX1mT
	OI3lZ+BswVDM3mlzR1tb9MVVgKD5pq3ZPEur9DdDm+VokAzwNAh5Q2sF++bv+YBgyBSTbepZuBI
	SjPNHFv1GtFG+KByx+QJscKb3kpEGXYtTu1TplNWWsnowudTX5sPAa5AoGviShNXlhtAsQ8Gj1j
	uiwW7NVnF94OXoaLh1KR5wbfSsl34PQZ/jI5f1B19K81b8te9+sxVu9DiWeL0s1eA==
X-Google-Smtp-Source: AGHT+IHgtbt+EaNxS3u2GMo/lKqoRgdyj4oUx3R7FGdiMpBhsnBW+9JkBsCH8gDH0F7CuPh2h+lifA==
X-Received: by 2002:a5d:64ce:0:b0:388:da10:ea7e with SMTP id ffacd0b85a97d-38a8730a4d8mr23833472f8f.24.1737023120559;
        Thu, 16 Jan 2025 02:25:20 -0800 (PST)
Received: from [192.168.68.163] ([145.224.65.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38c1d6sm20394820f8f.50.2025.01.16.02.25.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 02:25:20 -0800 (PST)
Message-ID: <e50c0e5f-6142-48f7-b6ac-30d0ed8b7604@linaro.org>
Date: Thu, 16 Jan 2025 10:25:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: Use str_enable_disable-like helpers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>
References: <20250114192730.912515-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Cc: Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250114192730.912515-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_022522_355300_30D16D5A 
X-CRM114-Status: UNSURE (   9.94  )
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



On 14/01/2025 7:27 pm, Krzysztof Kozlowski wrote:
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>     operator has three arguments and with wrapping might lead to quite
>     long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>     file.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/hwtracing/coresight/coresight-config.c    | 3 ++-
>   drivers/hwtracing/coresight/coresight-cpu-debug.c | 3 ++-
>   2 files changed, 4 insertions(+), 2 deletions(-)
> 

Reviewed-by: James Clark <james.clark@linaro.org>


