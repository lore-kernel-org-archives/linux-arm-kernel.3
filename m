Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD9EECEDD89
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 14:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kUQiNM1iR2tDzAghTzR3NUuXi2I+iCz3M8l6XyCorP4=; b=2tvWf/1ZuWR1nuSHA6vJfoTLqn
	5i4+b35Zgh1PEToiMx1yWp3q6A3vqOrU1oztYStDbMaf3QACEIkLpFHTOZpO9ikBOxI7/IvTKB5rH
	GSl/Gxvb7QJKFbGg/U3uPShxrRc7AlnCgi4TconTp5iI825FzZ4JzhgPqiv3x8scOEILBStDYvj7N
	WSPoPTyNXSw582mGucjZ5/1XFQhHOUjS/Ula2bEjRUVafzQN+WKas+yvFBv84EjsDF6Oi38mOs7CS
	FH1bTB0ktPlsJGIPA7Cz+/zrqKaACyMavZcKkioGn0VmaX9GbTImcIMx+Mlv46WPbRwEAMGs8+ZPR
	UcstT11w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMGg-00000000Wgh-2yid;
	Tue, 18 Nov 2025 14:01:14 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMGe-00000000WfO-2NpT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 14:01:14 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4779d47be12so23594615e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 06:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763474471; x=1764079271; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kUQiNM1iR2tDzAghTzR3NUuXi2I+iCz3M8l6XyCorP4=;
        b=Zl/bqu1c9ln7hbQvle5SOYzL9wwJ5vJWm5WFf1Bvur+lUYeVtpfyjBNIx20XsEGuEB
         vBzmfbj3/6H2OYuMCgaudWe7LYbFFhAU5hUIl7xU9FN58XizF7RfxZKXSrYBXLJ3skBZ
         4POhyaEf2iR+n+0RAp3mlu9fTsrJjeSz2E3eg2O+086wMyGWwJKvjFlUyWC0wUaQXf2c
         WT5w+ySJ/8eJcKUejRpzVw6IPTx1UiU6kBSGcbbz9BoNl+/6f0mESueC+w+BRVJ4oML4
         O65PLnac3KCmTDyLTNRf3IeDZHWlkn4GsirdFpOBU/Pi35pIjErEdsVHZ4eKKjWDJRta
         fw6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763474471; x=1764079271;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kUQiNM1iR2tDzAghTzR3NUuXi2I+iCz3M8l6XyCorP4=;
        b=eZ4MtMXApAlfgHjkfm1cVm8YlYWHAFn8CbC6Y2dW07tzPA08AHwS9h3NeDl9b3K6HQ
         q+WaiMpm/XjBsaYsQDFeBcqB30b34zwggQYjmNfrp+m+5NzOE5ilST4WNtPispiQCt9g
         4gODJq/wzUdIJwzosRY11MPxgH2LDolk9v7HT1IqlZfT5p8c/yBr7VJqDOQjFTQr5AVK
         E3dWfjJ4PYry6ZdZA6RgzTnZeNN49YR2FbUaWc0o5PXSslalsvoBsAMVhpLtYJ6kH0kg
         ITAos6hGk/Btk2AsKSFY231ubmeSYsQrMqn4w6MH1qZAImCUxdUMosxvXioLhUrB1SgO
         Apnw==
X-Gm-Message-State: AOJu0YwQX2L6WcDd6a4vXOb7/aNKWhIAp+YSqpJi+Ba1cpMYt0JqIfPG
	zV2/UYkndJfxrmj+4p7jYsiSO23QDB2PK6LVSoYtuhA+COLBhQAiaYzj1FotyVDWvEQ=
X-Gm-Gg: ASbGncswFTMSlrkZ2ZfHuysQjkJPvbBUjrzmRGFUNhWaEVcEIVdlPDGsGZ7gsufI7pH
	JhOcCH+kSl/O2kEFXnNr4+jqLBbIyyBhpSQLy0ZfG2MmKYrouD3pprQeTLEmWmcmw2S/DQ0sXDQ
	8Odzio8fPu+vUt6c+pEI6PMCTJ8n0jbId5daTnpuhYJXPglf3D7g4aowhiDjuMKD7M2ytkaAARj
	EcHIti0ZWZQTNeHFEqQNkL3VpdVx+RKdT2NFPGbl4zDBnO0VFc0lZpXAKVuXjDgP4f/EsZczukm
	7GJ5dbnSHTrT9klDG1uB1236hrA9wy9U2dhHH3pD6jid8tBmKQUxU3+4rBA+RjV2dbqWdTGrS9X
	lj805pq3vkTi38TEaEKOw4CK/U0caftpX6FXHDT+ZFcv9guj8kf2aM7rmsrLf7fPyxz27Be+eUT
	3kFdcNKb8sigydGihAdjreBXm9HXw=
X-Google-Smtp-Source: AGHT+IFV7jGZZLi+9VlgcvikNoydlmxYBSoOTOe6Mj5xjf+0oslhVnUW95h+9A6e60q9KlZeiWFBjw==
X-Received: by 2002:a05:600c:8b22:b0:477:7b16:5fb1 with SMTP id 5b1f17b1804b1-4778fe553a5mr150619835e9.7.1763474470556;
        Tue, 18 Nov 2025 06:01:10 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42c97745f79sm18177019f8f.23.2025.11.18.06.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 06:01:10 -0800 (PST)
Message-ID: <729cddf3-a21b-4503-b9c8-d3b5708243e9@linaro.org>
Date: Tue, 18 Nov 2025 16:01:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] soc: samsung: exynos-chipid: trivial updates to
 simplify code
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, peter.griffin@linaro.org,
 andre.draszik@linaro.org, willmcvicker@google.com, kernel-team@android.com
References: <20251112-chipid-trivial-v1-0-ec2dea03bd83@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251112-chipid-trivial-v1-0-ec2dea03bd83@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_060112_625982_C8C72A82 
X-CRM114-Status: UNSURE (   7.48  )
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



On 11/12/25 10:48 AM, Tudor Ambarus wrote:
> Trivial patches to simplify code done while handling the GS101 chipid
> support. Compile tested only.
> 

These trivial patches are superseded by the following patch set:
https://lore.kernel.org/linux-samsung-soc/20251118-gs101-chipid-v2-0-e9f1e7460e35@linaro.org/T/#t

Please consider reviewing the replacement set instead. Thanks!
ta

