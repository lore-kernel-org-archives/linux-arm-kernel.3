Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D13CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 07:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2YeKuNtpPLqtxqq8gC2tE+cTRtA0VGDqCWttaxdOw1c=; b=aFGnF+H+SxrPPEvOq7N33rLZGb
	9RVAZWK2jWyhFLzU5cwAEjKSZG9IzmOe9xVr1K0gKTqmh5nDMJuCorKKNt7qaqeuOSfEwQGOMmrf9
	BFDGK4Gm+WOxkwEgrYZ1xRn3hjTTS9P3EBE3thdKXx0FVkFTGjpSfloVMD7IB2k3vsFxwyiToPiO2
	TQQijGD3Nz777RoKToUwjMBM6lPXvYAhF+V+puTupapP6W5AHdWvcQPQAe29uKD2v1E9ib3ZT7kx+
	A70ocGyb+OhjL2rnNFHiA/0JEgjfRwyxSm0TS+jmgUS1PscdAKYRPtL3tAtSM0hKLRnnGFkRGl1m+
	84YrHLyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usyaZ-0000000BOum-3QRi;
	Mon, 01 Sep 2025 07:04:27 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usxyV-0000000BJz5-1w0k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 06:25:08 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45b7d497abaso24673765e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 Aug 2025 23:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756707906; x=1757312706; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2YeKuNtpPLqtxqq8gC2tE+cTRtA0VGDqCWttaxdOw1c=;
        b=dU6vWcAcNDeQnjsym9IUM/n1FNB/9HaX+FHbGIX/dlfuFXaGR05myWhLiY17r+n/3U
         G42iUg4clyGzIYKaZLL/z9EHwl2Avo50EdVSD088omm18KPM/9HFjNcG70d8RAW5ihr1
         aiOHfXNveKiBlrg9mK9re0tKrRV/8u8v0ON1wt+W2LTS7PRevfeXwkm7z433e/53j6ok
         Kt//ewj7mGlglTtxMrb31N7R1HUTGcoIYv/hgClXEFwd+Eh107sgte398QzIPkCG67pM
         +LbLE9NwRm9s5z9y4yzANZbIbXIbOlf7p4Wenkk+9LEdvsGKoPx/kzf8pPEm5ikHFXbc
         BWeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756707906; x=1757312706;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2YeKuNtpPLqtxqq8gC2tE+cTRtA0VGDqCWttaxdOw1c=;
        b=wyCsR6RzgDfL0E6JUoeNkXdT1Zy8A2y5VDlXltoEECV5F/585br9KK1cO6Jcef/XiL
         2GiD7wAFzM1JsvtkeC0vAIAY4j3rcFwR/JQHhQvpPIh1VxR57yzAVTihDiZNIJpSpFdm
         wJbPFp14CaBfp08AW0Z/byRMn20Xoz1VEy9XA9FImo2+P5IctOfxuy0w25gzoulGPDJz
         D3QTCqr/vS6Th2ZsdBdbEJIXxO8pXg2WDC11lndmLIBm1jfMhzahJhGjMVJegMe0yJ6m
         pKYjW2MiFsvREORc3jtvFiLX4+QYw+Z6s1LdwU0EOUINk0mDN8gfV+M+d1wzv0T0JNIl
         azlA==
X-Forwarded-Encrypted: i=1; AJvYcCWv/5UQVz8yygLywNSo4P5tatokoApcrrxXWv7w20803QMrXQcrmh2KH5Q4obgS2jeo4K5JmOY+iCr0OFwi/lvI@lists.infradead.org
X-Gm-Message-State: AOJu0Yw04P/CzhmyFpeDzTAXwisbhZj5wzPTbuvZzoZzJlfOKCqMLuD6
	OIwuF6yWlI8NaJU9rTOa6Q4Nws6yJJJKmuv/BiZve0LUna0aXbG+lDnNKOYYY6JI5uM=
X-Gm-Gg: ASbGnctJ+4Uoz+hHaAvw+w8RckS7P8gCC4u0CRyrNPmhv2df6jIBFyjVkUvYXrN7ppK
	6xPHGyG6JbNN9qx2dBAqY9hvrahTKyimkBE0ZWX0jR7iyTJ6iYBsVSx+QEXjgEND03kdb5jtWeo
	2YvQnU73MMIkGtKBpBEe9a2qasSFQX/SNEzKXOwDH5yeYZVdm6wenqbRQdt+LP6L/aJ3VjQtT50
	jsOIaQPwYXN0bKflbSLG7oEB8G71BbvLIcEgJ0uSmY0mVVLnxZeSbEIH5k51sFF+pqNireUGeFq
	w9DekDVKs5Aq/OCEZv+Uh+QNeCWRNkWG/GG/Ck09WZreBzKPdNYoR97U9D+zMUKZQNfkOGJ8+as
	qgrtmODDqxcUe9zlrvSLAEJFgZokvCwnBE1vfOiTL
X-Google-Smtp-Source: AGHT+IHnke2GT0NOJivpigEQtNHBZdI155ZzMIvdBsIqtx3ducDptv4HE++iJXeOAgJzi8Q9MoWEvg==
X-Received: by 2002:a05:600c:3b9a:b0:45b:8866:50fd with SMTP id 5b1f17b1804b1-45b88665357mr41091535e9.32.1756707905579;
        Sun, 31 Aug 2025 23:25:05 -0700 (PDT)
Received: from [192.168.0.251] ([79.115.63.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d3a7492001sm7507997f8f.42.2025.08.31.23.25.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Aug 2025 23:25:05 -0700 (PDT)
Message-ID: <788c3aba-568d-4297-bc8e-f47921859d57@linaro.org>
Date: Mon, 1 Sep 2025 07:25:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: firmware: google,gs101-acpm-ipc: add
 #clock-cells
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
References: <20250827-acpm-clk-v2-0-de5c86b49b64@linaro.org>
 <20250827-acpm-clk-v2-1-de5c86b49b64@linaro.org>
 <b5d0e355-2681-4eaa-8a67-82a364312ec5@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <b5d0e355-2681-4eaa-8a67-82a364312ec5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_232507_518872_8B001539 
X-CRM114-Status: GOOD (  10.21  )
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



On 8/31/25 11:40 AM, Krzysztof Kozlowski wrote:
> On 27/08/2025 14:42, Tudor Ambarus wrote:
>> diff --git a/include/dt-bindings/clock/google,gs101.h b/include/dt-bindings/clock/google,gs101.h
>> index 442f9e9037dc33198a1cee20af62fc70bbd96605..f1d0df412fdd49b300db4ba88bc0b1674cf0cdf8 100644
>> --- a/include/dt-bindings/clock/google,gs101.h
>> +++ b/include/dt-bindings/clock/google,gs101.h
>> @@ -634,4 +634,19 @@
>>  #define CLK_GOUT_PERIC1_CLK_PERIC1_USI9_USI_CLK		45
>>  #define CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK		46
> 
> I missed it last time - this is a header for SoC clock controller
> bindings. ACPM firmware is completely different device, so should go to
> its own binding header.

right. Will do, thanks!

