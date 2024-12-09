Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423ADE77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 08:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dTSM1ZL3lya31wOa2eA8/XL6JcurxnBBkRFyqfdvl2E=; b=mhK6GLzJK/160fu0rV45fa6ymj
	gi72vJK9is8hUl5ccTquXbeq4S9hkhUTdIV1k7gWPvsHaHNxJzI6q+TuFHnw4wj50E0a0/uGcKn+7
	ZWvwWNko8ViOYdaVVhOq2bZovpQn8n/Mzz1vmAoC4a7hNdKOqj1Nn0YIJZ7/TbswlerhZ0ld7Jh/J
	tFl/wXGT8unqcv53XtVzNGPPsVOjIrYuQS+PjyYEU02/zfTvRD0MDFSKvUxVbIGCAWYO1CGPXNPmH
	WI+KtPUApwLQTlLnMF8GF36G73pLLTYHiMmB9naeq+dqnqxST7fOlacNLvxkHWZjb0FiMFGlysH92
	QhRi8ihw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYuI-00000006rd8-1rtZ;
	Mon, 09 Dec 2024 08:14:18 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYrj-00000006r6P-1ItT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 08:11:40 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-434b3e32e9dso45192595e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 00:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733731898; x=1734336698; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dTSM1ZL3lya31wOa2eA8/XL6JcurxnBBkRFyqfdvl2E=;
        b=CiKf2BPypLD+shmEbCPGmprH87r/FifffAcsO89lFbnkJ/Qxhb/SCViN5IPf9/gxQC
         gJsm1n+vT5TJk7J/9+SdlTcBfgHPu++/iuMWV8NI1bmlXyGo5kw9quhjmOl6ymqEKpuT
         r0L0L/CSpVyH1XN8wWRW5JXhY+CvlPH/0xZyYcjgNOwaj9w2/0KeFwEV8YbGOtDP66Do
         VGFOUyhC4rbZlhrlx6K0kiJ7tf4Jihk8dS8tuZJ8JZ3N3UbbtZZ5z1mK7LcA0d3M/Kje
         V/F7EgKcrqMkI+TtpCCZbTsIjWE2zWACEc5HTBoFdhcO59OD6rea1WwU3lO9bS0bwAEP
         o1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733731898; x=1734336698;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dTSM1ZL3lya31wOa2eA8/XL6JcurxnBBkRFyqfdvl2E=;
        b=ZKmJk+SPmJNIfHxklB3xHwzKE06XNsN/vKbyv+L8jFCW6NyHqROQJgQr+n1niMscFz
         LR59WEAa3A+qBQkNGeGsR+vvEgmXc+WRGtd6hWEntEUIdxQk9SI6jZ49iNeUsDm8DT0b
         4osSHF0RJb1V2TYcjpfrISRdfX/IE9J8sSmJqbQJ747DvZ5Uqb1jPtk+o7gTSuJW/jGp
         v+RK0GfZ3UADPeal+DfiS9K9L42puxoOasRl0YpL5hIOu9xAPlHs9Ude7xnqUHmpFMJ0
         dPcU3lHAHUHjiBS2RhGKyIZiKYoQlLDh2FFnUBtqmZKBuizjSmkpJGEXMVjD/rfqyVcv
         izmw==
X-Forwarded-Encrypted: i=1; AJvYcCW40VvuAL2WZDuBWD9uRBMbYHbkYOASYWlS3G7HGXPezfqLDrlwsnErnFoClpgiSjKWKNBYdQ5C7j1DTyMXaoL1@lists.infradead.org
X-Gm-Message-State: AOJu0YzSYw6aIvhDEvO1zLNALQYhpW7oTpYW3QRlFnN78OL8zRi+INtY
	R/2+XyJv/TBGdSI6gKzOrfLhouCqXplyjUEWAlISpMMr5ksqhN/eIRAcjf7VaUw=
X-Gm-Gg: ASbGnctPS9mPK1aiT5BgW8GNgAL4JWR6yAAMzt58cu0i/uJPc6C1XA0he7GlLMD3v9y
	+yBC2DSBiq86Utcr/q5i385o4HvX7onSdHzm1ZufIphpZeBKCvUXT4BFq+2qzHtrjMpPCn2u7Dg
	g/ec2z7huEf5jHqGWfzuCrbw63+LICRiK4ea4vizrCZ0FFIFchl6wxQdINprNEWriTcI17x4MI/
	j/xbkyhmu1oLT/uXKiJeCxjI7R4j2u7uScfJNa7PecZASIG7GMXQS/4Xg==
X-Google-Smtp-Source: AGHT+IFX24cUkHhTSqFHYkRi7Ptj8ZcdXz5CIVRSOflj14yH1xBA/yL8IBUKGCaXaPHX5jvTE/xqpg==
X-Received: by 2002:a05:600c:450d:b0:42c:b905:2bf9 with SMTP id 5b1f17b1804b1-434ddeb8ef7mr104821245e9.16.1733731897663;
        Mon, 09 Dec 2024 00:11:37 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da113508sm148897065e9.35.2024.12.09.00.11.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 00:11:37 -0800 (PST)
Message-ID: <9886429b-1bf3-4dc3-b0d4-294a98e44ff2@linaro.org>
Date: Mon, 9 Dec 2024 08:11:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: mailbox: add bindings for
 samsung,exynos
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, alim.akhtar@samsung.com, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org,
 kernel-team@android.com, willmcvicker@google.com, peter.griffin@linaro.org
References: <20241205174137.190545-1-tudor.ambarus@linaro.org>
 <20241205174137.190545-2-tudor.ambarus@linaro.org>
 <2lkowhldq5i4otniijfw7cb3jm6ttatwji3npw5w7c5fyevnn5@ynojupmdyqy4>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <2lkowhldq5i4otniijfw7cb3jm6ttatwji3npw5w7c5fyevnn5@ynojupmdyqy4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_001139_446598_A48921CD 
X-CRM114-Status: GOOD (  14.92  )
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

Thanks for the review, Krzysztof!

On 12/9/24 7:52 AM, Krzysztof Kozlowski wrote:
> On Thu, Dec 05, 2024 at 05:41:35PM +0000, Tudor Ambarus wrote:
>> Add bindings for the Samsung Exynos Mailbox Controller.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  .../bindings/mailbox/samsung,exynos.yaml      | 70 +++++++++++++++++++
> 
> Filename based on compatible, so:
> google,gs101-acpm-mbox
> 
> but then entire binding seems for different device, so you most likely
> miss here actual Exynos devices.
> 

I need some guidance here, please. The mailbox controller can pass the
mailbox messages either via its own data registers, or via SRAM (like it
is used by the ACPM protocol).

I'm thinking of using the same driver for both cases, and differentiate
between the two by compatible and `of_device_id.data`. Thus I propose to
have a "google,gs101-acpm-mbox" compatible for the ACPM SRAM case and in
the future we may add a "google,gs101-mbox" compatible for the messages
passed via the controller's data register case.

Given this, I shall use the more generic name for the bindings, thus
maybe "google,gs101-mbox.yaml"? But then exynos850 has the same
controller, shouldn't we just use "samsung,exynos.yaml"?

Thanks!
ta

