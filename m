Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD46E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 17:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=deCdOEFNOf75jPBBQAgdeMZQiPxVvZH3Ou1tOWSHr6o=; b=XPZnFYMOr+UjKM4C0QRNXoLtbj
	0lmtxUZ8G4TEK0vYCptfXVPEkXzke9dODuF8VSTrj1z/XD31qn/2PNaq7CIqIKZTXDwTQtRZfEK0n
	2W4Fy3dg6PFswp1IALyEuVPLcXGP910DdDorNNlzoqUNZLa1gsfoVONgdBYs3Z3KsOyRXv5Boq2Vq
	uDq0tMNO/PUK0IYEHaXBUsKiQOjyTsRY/EkLqPMy9QM6Ec63qDODlCWJXmQ7oYpQxIYJujNTDISgC
	pL2LABRN5vU381DzQb3M+h68tw8aOYxrktEghD3Z7l7oawGOLuIOHQ1aCRNpuvSbQBU8gMW/Ce/dP
	GDR+9TjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVZSt-00000009J3I-3vwG;
	Wed, 08 Jan 2025 17:03:31 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVZ6O-00000009DdH-3pm8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 16:40:18 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-436345cc17bso324795e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 08:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736354415; x=1736959215; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=deCdOEFNOf75jPBBQAgdeMZQiPxVvZH3Ou1tOWSHr6o=;
        b=LlB8cTKO/AsgCfpjAcCXY50ul2vGDV6Re2Z9w6Zcv0ZxRbtT1qEDjse4NozoQ/1ygJ
         C6JpWeZjDQ+2PS7+idYc6GBUIUcvkO7es2A57S5xoGDbI8NKa8AYTaQhiG9kp8Xfh9MY
         MynEE+2ZnJWIK/GJvZWvQU8S+hPW8Zee6dgFQRNceRiuZ5ANzD/rP/MpJo0bQruQQ5Ti
         vfbFL/a665SQ7s09TLlpqKIo9TOQqYCpUBt9k2ZRP7ysB3IvusJiGzKtwSV4/LhdD10K
         3D0Yy6hvT+El2WsnDrBou0jE8mKoNk32ww6X+XkwHD92s5LOc8gWB9l0Wa3Uzt8Px+GX
         rF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736354415; x=1736959215;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=deCdOEFNOf75jPBBQAgdeMZQiPxVvZH3Ou1tOWSHr6o=;
        b=TJnWPV0UTGniJyVSeeuFvDhCSWecMXuwuj2jcDZXUfPdP8MyS9HlTDkqZnua8DqGHx
         /kjx529g1YS73mwZtxEwComAK/4FJGEM6oD1e95ky4tCHO5CPZ7yy67mXJ9r3QlSy9N5
         R6LXqetR0ikb71OXHbo8ti3/mnqZqNF+cYBeKVglSIflpwuakvuwqT1IGozZ1cn/nPNk
         RFdI4CxsHxf88gqq032V+aaIK9z3Hx40kfME+M3SaBEvK5qMOVkOUPhQ1FUPLjSYNXeK
         PRCF3EpBr8pTBNTPhON5y7fIGzuIfQxxRFM5TiKnQYjJDl/tj8gb1lr6ABNzpE0Z3XqQ
         XebQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfaV+qNJu6ENJjcWxkwvuXHuWO1jFBAFofY7Qee6cKbBPzPvovNasp8MCO8uzZB+yW9RVHDGKAt6Wtk+sb12tG@lists.infradead.org
X-Gm-Message-State: AOJu0YwDn5qjdlaojZYdIxS2EQz/+dFh5g7CwVdLVA3Y9tj0qCK8l/p6
	ELwxr1M/HOgQUvjmXhQ35YlofgFu6WENrXC6DM3LJQxj3kLZ3yHbq8NhPiThlxw=
X-Gm-Gg: ASbGncspA6ez87CB0+/WrUdwrRKblKgR2bDcSVleM7zmuoe0t031/FjZWgnmxvAQHOo
	qAaHWIcpMio8JhOi94pwzVxAYrfbucEotAexvTow+fsRgBgy1WY2NVBkgoR6rS2Jqy+QNLZh6a2
	1M8oBUlgK1V8NQoGWEf26urQAE77o6DMEvcd+AiDNfPp0SQarBQa3u9CXTHUvdOTgJYDfbgV4uW
	A+CU5TVLXFR6QOsLem4+EuP/91zNHF91jh5AfFt1O50kou5Ki2C1Hbm4akW/Qb2909PssaicAn7
	2fuhNhBW5MPwovXfVc3V
X-Google-Smtp-Source: AGHT+IE4abllXEGQrABSU9KaQSrAPNt2UJoX+UrddjzVaSi3eoBYN+JcyuNs9drr9UEmuphRRteJdQ==
X-Received: by 2002:a5d:5f52:0:b0:38a:50f7:240c with SMTP id ffacd0b85a97d-38a8735760fmr2780072f8f.47.1736354415474;
        Wed, 08 Jan 2025 08:40:15 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436e2dc0bb7sm25990875e9.16.2025.01.08.08.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 08:40:15 -0800 (PST)
Message-ID: <076daca7-55e0-40d4-8ea5-93254ecd19b8@linaro.org>
Date: Wed, 8 Jan 2025 17:40:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: timer: exynos4210-mct: Add
 samsung,exynos990-mct compatible
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
References: <20250104-cmu-nodes-v1-0-ae8af253bc25@mentallysanemainliners.org>
 <20250104-cmu-nodes-v1-1-ae8af253bc25@mentallysanemainliners.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250104-cmu-nodes-v1-1-ae8af253bc25@mentallysanemainliners.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_084016_961062_1B280E96 
X-CRM114-Status: UNSURE (   8.73  )
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

On 04/01/2025 21:54, Igor Belwon wrote:
> Add a dedicated compatible for the MCT of the Exynos 990 SoC.
> The design for the timer is reused from previous SoCs.
> 
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
> ---

Applied patch 1/2

Thanks

   -- Daniel



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

