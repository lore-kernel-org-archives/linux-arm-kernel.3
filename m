Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37912C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 16:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E9Xd/U2z4tmfw6ztPMpuZGjzJCTGLEXhl3vszeoyDjk=; b=f1jph47r2J+lVuMeAjWM+KDg83
	hi4rxOoF9wT48h5vzURlnZShAQQ5o+B99VdeseCZ83GQfNm09iweo5nNscObqyu8+xuDVjghkNCAa
	GkaH0udaa+ETtqtawnsP3KdW5muoJSrwGwQiCL4pGDalIPyuv3HasyvzdNaRb2nqNEJzth1w+GDDV
	wi78ysyVJwtq1PzWMYK8OEry9O2C30orpUMw/ooLxQjMPGkEI2dQgdBnaaaQkniVnBN/bEITTacHv
	8+fxyskkUpfMoN8jJcyc/xByBAeHXzEM81/EOmNSViOyBFr55nQuqJkGd4O2E8Kfy5hiHY9rWJ2N9
	sLtJapmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uecSj-00000005Vmk-3sPA;
	Wed, 23 Jul 2025 16:37:01 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uecQI-00000005Vei-0qLk;
	Wed, 23 Jul 2025 16:34:31 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-31e3d29b0ffso54480a91.0;
        Wed, 23 Jul 2025 09:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753288469; x=1753893269; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E9Xd/U2z4tmfw6ztPMpuZGjzJCTGLEXhl3vszeoyDjk=;
        b=mi3JrWV9zs3IzsgR+U+HIbHbn2SxfPeKHPSIQD+nSXhyOFeh/ZUes9e/KwhcaQqyp+
         EJRXKP2LLnlCqJOoHGqmMgoyz7A+44EkcqErIJZAKV+s9uaFZlTcMx+vaBkCi8XhH1Uv
         CE9mwTfTaoXVW0mFVCGinefIcYcK/CgrCcE8+Ui/+UVP/eL9GKYxCggA0u7T6+GFBYgw
         jLtSUsMQinTQtAciN0D9iDKzz8ii5k2wyUtUg6cUCgUJRwIfHY8fp0mKPcltPY5rYruM
         uf0jr0yRml5exv8kaVLqc2zt1skMray2UBlXGBnAkWodBAhiTqgNBeLfdelhxYLvQWV4
         FQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753288469; x=1753893269;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E9Xd/U2z4tmfw6ztPMpuZGjzJCTGLEXhl3vszeoyDjk=;
        b=NGlXs3agS+6qonBXKr38y0Ni6LBthI9sx5xXFouk5Njyg9pN/uJJ3gv1loRdQTTKB0
         M+C4kK5XYiliUFNB7wA90C+SuIrsmfpCKnTFIkRv5H/Y9YTNw0EuSsCEYW6DyIFMOcrA
         tQ1kRe1Qd+Fj2UmnpoqdLw1IuZu8WTb6sZZ+NrikxsWLbN5x4OVSwtpbsTTfyjsqxBJW
         GdimfE0h4ERUaYAdEdBG9RmO+4N5rQhKPGPGIIfvQgxLoVcRVJZNm7RNEk7bj1692e5j
         wPqIyWJ2Z36X6yVeQfuWyyOOoLsBNI7Mxm+Q1DrZ+lib56ese597rvxNJkwwUkxZv4Tg
         HRdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEr1ft94yl50R2MoMoR2oQCEyOxZPy4mSonujddvWO2Z/lMj34YK9xswxE0DhqkqO9fUUgF5BklQIeEaKH@lists.infradead.org, AJvYcCWVVHf76FkZJbYbGM0dDzxTjye1QcuapC85eh2zPoCjZo1JAIbSB2GvqgL6hJxieelUH7imzv2kaTPvY3H5FHMDew==@lists.infradead.org
X-Gm-Message-State: AOJu0YxAPu3QNehAnJx59iDQnkprPcUK1anHj5zkwqmqwqYCfC5wpCSg
	O1I764OdVbEZKSGIBmVx97xDjgNFOJt28Pk6DhaVogZT6y8UPJFYktkA
X-Gm-Gg: ASbGncsUBNw9fjjH2xjnuoRnM8r8Usq11wVJ3GQ/p8u2atbY0gQRQGw9SNrAW82noYM
	gLc3afDo+aKt7slErG1WqFBziYgS/ZGC7uRQL0KK1bHMm472o/I8v6zJdG4IcUJuxxEGLmq3ZKz
	E/ndhZwZ+V+fvj0YNZO6dpDTFkXIUcI7AAevK+WP3JcZ7rSXCHnWlZe2t3wVVUyBpWMmSh6RNTj
	nq5Stn5XfC5JF8p5AP8615JTLS9oruf7yJJX8PgpNz6GcVQpCzQoOV9WfYqP2zl7uqP7MNA8/Rj
	fhIpo1JbEFODiLMAt4+lh4B785ph03FC5gWX4WK8EEshiyWqG1qdLA6WdgsuZvsOQ8QiGq24QpI
	m+WPo56KbjV/ebMI5o4vTvWZKGwdMZu0No5Et3+hX5uiSIX8P/w==
X-Google-Smtp-Source: AGHT+IHk3A6YXkSfq5EiTOgSQfJLMSFz6qiFQuW3inOO+ZCDhCMcwUobbP9gZ2q3IPF2326ki+C4wQ==
X-Received: by 2002:a17:90b:2b86:b0:311:e605:f60e with SMTP id 98e67ed59e1d1-31e507c19f9mr5756344a91.20.1753288469351;
        Wed, 23 Jul 2025 09:34:29 -0700 (PDT)
Received: from [192.168.1.143] ([49.207.192.227])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e519ce288sm2047652a91.6.2025.07.23.09.34.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 09:34:29 -0700 (PDT)
Message-ID: <169f4fd7-7ea6-4764-aaca-c08cafb36762@gmail.com>
Date: Wed, 23 Jul 2025 22:04:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: cleanup: fix duplicated 'is is' in YAML
 docs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 ribalda@kernel.org, jic23@kernel.org, dlechner@baylibre.com,
 nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
References: <20250722170513.5854-1-sanjaysuthar661996@gmail.com>
 <20250723-foamy-glaring-tench-561fe2@kuoka>
Content-Language: en-US
From: Sanjay Suthar <sanjaysuthar661996@gmail.com>
In-Reply-To: <20250723-foamy-glaring-tench-561fe2@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_093430_244020_B52A84A2 
X-CRM114-Status: UNSURE (   5.74  )
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

On 23/07/25 13:12, Krzysztof Kozlowski wrote:

>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> Best regards,
>> Krzysztof

Thanks for the review and suggestion throughout the patch review 
process. Let me know if any action item needed from my end related to 
this patch. Best Regards, Sanjay Suthar


