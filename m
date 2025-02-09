Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BCA4C02199
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 12:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wea7b3/6KxPyJ8w3sB9xSdUtZBJ/VStaOad+Adh4tTc=; b=biOUXDL+aPBeVOe/0dEZjJ5cda
	mbY2vLJLETUneqUYdDvaoZOOG/YFQDlqwtLdYZHH77QLY1zFqOrZ7ahY4d9gtpTC/cT+VmJzWCIjA
	NXiwkxXK9Mz1HhtGybFprtQg4qXuqB6hhvZuvfM6FVlb7wGalLuoL/J6dLSYkHNWV+/q8EqMWZjvB
	BZ+VMr7CfQvCtzYtkHDTLcVXytrtWBm5oHrLjQDSqpWBazSePqorO7dNa0AYQQbZ7AmKv2HEOHRBr
	pyR2EqRwBwr7gQotwSASQVqHiGOns50HEcG55F/L+DG4rBekpYTVr4ra0iTtkAWk7YQKVVa9O+9ou
	+KLkER4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th6eC-0000000EtMA-0VCt;
	Sun, 09 Feb 2025 12:42:52 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th6Zt-0000000EsRS-2gbF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Feb 2025 12:38:26 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-38dc6d9b292so1206381f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Feb 2025 04:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739104703; x=1739709503; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wea7b3/6KxPyJ8w3sB9xSdUtZBJ/VStaOad+Adh4tTc=;
        b=N/F6GDLz8T/lgbuIKJipMuP7wT8/lgfJXXSFTvyq5gGOObbG5SaF38dfP3SwThV4wp
         8nFX3KHiNIz+viwUpz3nU937s4GOLhF1lwhJGqnzmKNuelB+rXJd/eDg5/BzBV1SS9uD
         43VJh7KSdGeMsfRPb0r4NMq/UiubwC01F90rjVZfq8iOyCHPJGOk/8FAcMYYfu0sFDZn
         2whdehJqpg2zKF9/I52l4gVxEf2X89JGRCr5qe9iM/SDBcorEY9OaW7msRkD1hKE6N0h
         7DMHgzAZ6D1GkZd++bssuxfUJOnXFhvxiAn9JH6FNh6cokCwLHU5JVJaqGM7Kk4DMte+
         UP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739104703; x=1739709503;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wea7b3/6KxPyJ8w3sB9xSdUtZBJ/VStaOad+Adh4tTc=;
        b=u7VP5Af79VA2Y7r1KqAaroi+2YBw/WECOu3nbTGz6HGbvfZyzjkJd+gF4YawKfnA5+
         E1DsHA95hxD/VJFFRXFAD/OaWkNdK8R9bGXyIlE+2s5FnayXvlOdkgTla/xhChkmFxKG
         629svx25k6u6D0CgcSSBQJwBOomNgW58HwOr0nQ8n6BM6tSnYGk/CVlKCNxtQdE+F498
         mtGbIcRFow/NXDEIM5gHJR7G7pKgTuhFS0VvA0IRhpSgZ3wUwaEQs5yTtkyLOtqm7p2e
         RAI/olN6/zKE+IL+blw3LzOEVIeIsQbez87nB/MMErFa3zUaiv5ZeHQnYXQaAjrYDJpA
         OxmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvOL0CcPZk4bp/O44afX5ccFCG2IXb/9zMxAzHedrJ4Nc1WX4qctcsWI9t3ej4pbsMQZx8lL22quW0eRf9Ikm5@lists.infradead.org
X-Gm-Message-State: AOJu0YybpkC3T2RWAY00EGkBfLjE1fN3fDFcGUMQw8gsx14RiJmrfGx0
	fHHr50UHrH44ln/kAmK1kS6SEgBSWOyc4mHDxanhNN07wuzlr8S0reBcAMEfi18=
X-Gm-Gg: ASbGncuYPXtXBf9s0WATfuaGhfHdG9ZQ3zFTIqQuuuRT2bfZrhJ42RIPJdCa9SXiswT
	jtLhH2OyGWk9uMC+klgy+PjicnGoMgZIKKpeoYfW8moLTsNR0b7hoC/UhuYxY+h39A2iB8VMLTx
	dfLZEBusUzMr8HsRwaSdiTEFCik/hyRxslKLVXlakz3w0mSc/AG9rhyp9Yr5hqQim1WTD041tQk
	ekCvTLIz3VSO/3UAtCfVLEjU8gulnJYCh+irK0L/hL8+3XNvJ4sH6Ayr5RvMv91mGElJ22j2BLy
	8SuzyGkEojYlBv9sD6c+tJXlIEr2JJlfI1c95ivNbryuf/A0JWWHoN4=
X-Google-Smtp-Source: AGHT+IHAn5dBvK+eaCAM1hEAPTzgaHWbJSRPVCMLhYu3o81y2gOi4Jhi71LuCjv1/0szAK/gcgf8sA==
X-Received: by 2002:a05:6000:1865:b0:38c:5d42:1529 with SMTP id ffacd0b85a97d-38dc9491b8emr6932878f8f.36.1739104703361;
        Sun, 09 Feb 2025 04:38:23 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4390d933523sm151223495e9.1.2025.02.09.04.38.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 04:38:22 -0800 (PST)
Message-ID: <15a1cb62-9d02-400a-9760-d741440c1b81@linaro.org>
Date: Sun, 9 Feb 2025 13:38:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: timer: exynos4210-mct: Add
 samsung,exynos990-mct compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
References: <20250104-cmu-nodes-v1-0-ae8af253bc25@mentallysanemainliners.org>
 <20250104-cmu-nodes-v1-1-ae8af253bc25@mentallysanemainliners.org>
 <076daca7-55e0-40d4-8ea5-93254ecd19b8@linaro.org>
 <9142e874-cefb-404b-8932-3e712b2d8bf0@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <9142e874-cefb-404b-8932-3e712b2d8bf0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_043825_689947_B9B26355 
X-CRM114-Status: GOOD (  11.51  )
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

On 09/02/2025 12:14, Krzysztof Kozlowski wrote:
> On 08/01/2025 17:40, Daniel Lezcano wrote:
>> On 04/01/2025 21:54, Igor Belwon wrote:
>>> Add a dedicated compatible for the MCT of the Exynos 990 SoC.
>>> The design for the timer is reused from previous SoCs.
>>>
>>> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
>>> ---
>>
>> Applied patch 1/2
>>
> 
> Hi Daniel,
> 
> Did this really happen? You replied month ago, but linux-next still does
> not have this patch and now we got new warnings on next:

Hi Krzysztof,

thanks for pointing this out. Actually I forgot to push the branch :/




-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

