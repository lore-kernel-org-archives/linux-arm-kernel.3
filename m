Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5012C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 10:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eycY61Wk6wfvZBg4chYuMAQviSFft2VvOnLfN3NdZe0=; b=zskuMjM3138556vjDp8q1YG9sM
	eGnClIarmCzD12zKfMoQy9pkq/aWFGuUJo3Gyh6A/d0A1pgTs9YoJm2op8lUkQhF+5Cw9Nf7/WWhZ
	MP7ivVbY4w6Sb1GHAwQtNPPqhV6pKfuUD41aTv67h4E0Ur+BPbHvW1i/35JOAPqaAMdxUwzhEFpKY
	I5qDcTYLU3/JyFHPMJebYO3stws2uXEAhTZi2gMFsK1fNSQtUI1MxekMtvjh+EYwI65drww5zoW+e
	hwyWkw2cZJ9FHZFud1yCKHras+af30Qujbbf3ztTlfFf/o3vSy98gj4n+ZemysR5IbjDvWn0I7YKz
	72XMyGvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu83r-00000002Fl2-0oWV;
	Mon, 17 Mar 2025 10:51:11 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu81Z-00000002FJ9-0fM0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 10:48:50 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso8308785e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 03:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742208527; x=1742813327; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eycY61Wk6wfvZBg4chYuMAQviSFft2VvOnLfN3NdZe0=;
        b=ACpS1iJqdvV0DX3wh13ILGpWpcPuHU0VQ5Ubqr6Ha7NSuik2Mr5CURXasmGhK4RdJJ
         vAGpnw/PPATkIdcW0jzgu7R/jHgFhwNDsHaHwUfslKs33xeJ9Gtz7sRSGg3hgjzLsRdx
         o2Tw7HJPiFoNtiIUGQUu6pLLqzI1mZqRljZ7xPcg2pbFqqCoyjfVafxe18eKHYiGjjpp
         zVgrNjOFpAHK3tHvVnxp87YjIu5nPHndRhogctVy05wMA5dAcd+vgAyPZ8j9BrIGvmCw
         2m3yrppqrBJ/+8KYGGFb7d3WJ8NhzWwlso3dld878rH/siF/lQEgwFSwarUJUoopjYEF
         zYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742208527; x=1742813327;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eycY61Wk6wfvZBg4chYuMAQviSFft2VvOnLfN3NdZe0=;
        b=YWGGgtU/Gi+udP1xCdoQoMYGEMTCgwjOMUbr/YV/tePKgwUukv1Dd6dN9m67y0+X0L
         m6VIeeDtYRA4WmrP53JXGuZEL2vCbCDbyJOAcsPmvOsB+4Q0pwBmqnhWSS25EGRPG5VV
         p0bzDjf2DFqLXt+ehhCWdFlo5iQfcB5DPX4J/7w2fqYpUyvg+E84EKg7p2SijMxLCqXm
         gGZ6YvmqbOTPuy667yf8CNR8DEj1S0ZIWR8ei6n5iS+jjlTX5t8QvTEpnQbcKnwIAyZn
         JQKNflgleP1Nnx1LXhLVs0g6zv/RvqHG/Kk+ADZPJYHZh1x3tY92ySfzUssgG8zXod+c
         hO0A==
X-Forwarded-Encrypted: i=1; AJvYcCWhk+jqNLTkI2uD/AXAwaF/FSzw72UvT29bJFL20KyqxxuAVT9l6JOyYmzHYLyMxKB1E+gwN5hdt4YwIR+nwn6Q@lists.infradead.org
X-Gm-Message-State: AOJu0YwnXGhaZik5pwIfaRrbBiTTo8BL8O4UKxnmF/VtLIPaD8RTnhZS
	TsqaFLq6qA7xCnq4JI2b35NbmkqqUqGNV5GgKHtEB/QlEmkGATEyRgejvlxaTvk=
X-Gm-Gg: ASbGncs0rEoykOkYNGvt2S4nZcEnto+bd1tu72JbTlyVnfbednnKfohL0V3qAhdalg2
	QgzHxo9HrTWIBj1S00XVtvWlkTY6uMJw6tr2zeefCf1syf+dYFIC9EA1fwm/CfiwvVnS/2y+8OX
	8G2V5UngAEo1GmuTOlH358hJ30FVpfyqdMeGYjH35Hn3xDo+faWmVEe2SsRJWQhsLilCC92E7rp
	4pP6HoIlpwopxG1np6XG2xxCTbLAOP163nN/6fQpxqOSJJpu5RqgaZyyV6O0TIIG8+fHo6KQulu
	zAyiNz2cO4XacvaAI4mawSvbvSU8VP+1oL/TjqhlPZUKZiPkt7+KT84YUdXXS+UHHWAVePguZR/
	jIlmOYDQMtTvLQMDm69s=
X-Google-Smtp-Source: AGHT+IHwbJoYZqGiwb6co2hREAgWTQOaf/s4YEZo96aCVG79kC6hdFtxQajN7lHob6EAvFbTP7K5bA==
X-Received: by 2002:a05:600c:3592:b0:43c:f44c:72b7 with SMTP id 5b1f17b1804b1-43d1ec86200mr141007775e9.14.1742208527614;
        Mon, 17 Mar 2025 03:48:47 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:900a:ff00:eb98:2c37:6a77:39? ([2a02:2f04:900a:ff00:eb98:2c37:6a77:39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fe609a2sm100628115e9.30.2025.03.17.03.48.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 03:48:46 -0700 (PDT)
Message-ID: <d2e162cd-b12b-47e2-9190-2ecce3489b9c@linaro.org>
Date: Mon, 17 Mar 2025 10:48:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] firmware: exynos-acpm: silence EPROBE_DEFER error on
 boot
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>,
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250314-acpm-fixes-v1-0-ab03ca8e723f@linaro.org>
 <20250314-acpm-fixes-v1-2-ab03ca8e723f@linaro.org>
 <638cf070-9fd1-416e-8172-75f189ab0dfe@linaro.org>
Content-Language: en-US
In-Reply-To: <638cf070-9fd1-416e-8172-75f189ab0dfe@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_034849_199014_FEE8A492 
X-CRM114-Status: UNSURE (   9.96  )
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



On 3/17/25 10:26 AM, Tudor Ambarus wrote:
> 
> 
> On 3/14/25 4:40 PM, André Draszik wrote:
>> This driver emits error messages when client drivers are trying to get
>> an interface handle to this driver here before this driver has
>> completed _probe().
>>
>> Given this driver returns -EPROBE_DEFER in that case, this is not an
>> error and shouldn't be emitted to the log, so just remove them.
>>
>> Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
>> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> 
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

I see you kept the error message though for of_find_device_by_node()
failure. You either get rid of that too, or maybe transform all to dev_dbg?

