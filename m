Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4678CC3601A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 15:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LLzRxbLbGYqFEY7hyGVV9DDJqGfYqDcrqrelLGxLjeg=; b=bWn00RrFy5qOzn5f+D+r6X5P3R
	WFWoKqXVpKn6HTLbWPustkMD2wZS/hB/9OMIfr7rBGSxaJVd3TpkolbceV6CQiSYOoLoZ1c0RTy1/
	lkU2a81Lv+LyYbfsdIytoq9HwmAbKVdsaCBrBc6El7vPb9lIVF+zMiXpkVT8iOKmWduI1dD2rOvkZ
	Uhd58D/02wqsEi3E94EDF9jVbdkg02P1DOK5vrRGW5U0DVyIXjk/pgM90EazZUEHAwuh3NcHLVwBM
	N7gUrgSnD3ioXuXR864LU5mMxObBNmQxqpiA7T5f5JdSisb4CRbZy4cdozSzQpkvs39ui7q1eo48T
	68WYUjbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0MPR-00000009DWC-05Y5;
	Thu, 03 Apr 2025 15:23:13 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0MNc-00000009DBc-2Dyg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 15:21:21 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-39c14016868so941479f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 08:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743693678; x=1744298478; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LLzRxbLbGYqFEY7hyGVV9DDJqGfYqDcrqrelLGxLjeg=;
        b=YkFXOaoMtFHg4Texl7VTDZ16jNlFjE3VMdm+Y6gIWdMONsVYCH4NnzHJXrVK1wbDGZ
         2+NE08Xstpd4Gay00FKrwvo5mATykao37zcY4D25aObxBhTsSZv68VjWb45/j3qD0nac
         2YF1xg3nUlDXmkxJDM3r+acfLqhAPQdbV/p5Fpm7sgSruSHu5en7rmv8UNyl/bu8c/ZS
         rxEEAsBT9dbIDmtPmdf1VzCqLvmPk0mt4BhnNT5+f8yNVrOMRSheobF4AgyEQBi6yIvA
         ot/fMzkpzOVE7kdRphOt21d85r/WQQdPvWoMprbEMyVEugn76kkAizszdfnMBkKeQD93
         e/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743693678; x=1744298478;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LLzRxbLbGYqFEY7hyGVV9DDJqGfYqDcrqrelLGxLjeg=;
        b=DWKXS//lYu/ILkJJDN+H1xRjA4EkAgHfu0h4OTJ/8Y2AugDlly96PSoL7dvS98TI+p
         52QP6seRvz0LoEzoYW1+lSmfD5uCwtjTlzXpVclBuyndDxaI7vQYt2OiAuJs/RrPAO8r
         nOStO1Sardw9NHo/yPkPJZx+G9hX8uzRoj7rb1LOeuNoVffMiXkE0L+E/tUc5NWUX5u7
         cfHr4WvQn/qpr5E7tkw3G+S6/yNcRnDLYlDnXY+voyyqf5K6lJnxsCFtZMkmfQT5nS7X
         NxLOpTEza5PIrQcVkTQDU9PcvR9dWjuh7ZuN8c9vRfrhuM0MLTNVvYDtnk8ozBIKZeT/
         hbpg==
X-Forwarded-Encrypted: i=1; AJvYcCVOiY2bPowlbKHkaUnyEO5uf/TAVINNOziiDRpZjVHXYA3JYm2qJtmLWQmdfmICQyywMh06dsh93eOiTIcD5v+4@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4cN17VITjYwlhsy8A6+8/iODkDMPy3hLq/pzB73AlCqANLs3m
	uIX8egNDToyhTVrBW5WZE1r+ztF4/FaxhI2IY+Rdm6NzmRbf7yBS/05NZI983Gk=
X-Gm-Gg: ASbGnctNYFA5JTMOep9LOdsv+9JlWLkFXVZDZ23ROymfW1M8BcEvkMlwD0ART7Poov5
	pJWe9T/nyIkBt1BC9k+54iUn21j06cElHXtm/7qZxblmGs+5qpubkZTsSuyB8xNM3O9jeQAKO55
	SRL12AKEE2c2+BmkBjN7I7D25jHuPzV/pV8tDPOYzZDBQVELAq9Wl2MV8pF5MOl3sXLt596RV3Q
	GE7BomlzgrHLkB6AxfhYQvDObtVcNQ58idPHEFMiJHxbYCCQE+U5QmE6MT9sVc+fJRLGRGnleb6
	pt8+9nCUWLeLr5OAtNoLacfJQ1nCC/1GX6BugCllbEsN+M9KCXgpryMcwYU6E+mpIc0wDV4Uiyt
	tU6ucwE0N
X-Google-Smtp-Source: AGHT+IGw5ghzd9cHyGdFKWQ5WVPa7dVeNteHj1/e+hjpE89/v7AeOKF8SPeYMkbL/YLt+h17xVXsbA==
X-Received: by 2002:a5d:5c84:0:b0:39c:1efd:ed8f with SMTP id ffacd0b85a97d-39c1efdedbemr11060254f8f.50.1743693678287;
        Thu, 03 Apr 2025 08:21:18 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43ec34bbd9csm21302405e9.20.2025.04.03.08.21.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 08:21:17 -0700 (PDT)
Message-ID: <67daf656-0e08-471d-afce-22ba8f2fa1f2@linaro.org>
Date: Thu, 3 Apr 2025 17:21:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: timer: Add NXP System Timer Module
To: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, thomas.fossati@linaro.org,
 Larisa.Grigore@nxp.com, ghennadi.procopciuc@nxp.com,
 krzysztof.kozlowski@linaro.org, S32@nxp.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
References: <20250402090714.3548055-1-daniel.lezcano@linaro.org>
 <20250402090714.3548055-2-daniel.lezcano@linaro.org>
 <2503deb2-b993-7fd1-adf3-cafa1e7bd2f4@oss.nxp.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <2503deb2-b993-7fd1-adf3-cafa1e7bd2f4@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_082120_566164_6D07CA08 
X-CRM114-Status: GOOD (  12.46  )
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

On 03/04/2025 08:33, Ghennadi Procopciuc wrote:
> On 4/2/2025 12:07 PM, Daniel Lezcano wrote:
> [ ... ]
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    timer@4011c000 {
>> +        compatible = "nxp,s32g2-stm";
>> +        reg = <0x4011c000 0x3000>;
>> +        interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
>> +        clocks = <&clks 0x3b>;
>> +    };
> 
> The S32G reference manual specifies two clocks for the STM module: one
> for the registers and another for the counter itself. Shouldn't both
> clocks be represented in the bindings?

AFAICS, there are two clocks as described in the documentation for the 
s32g2 page 843, section 23.7.3 Timer modules.

The module and the register clock are fed by the XBAR_DIV3_CLK which is 
an system clock always-on.

page 1994, 40.5.4 Clocking, the documentation says: "This module has no 
clocking considerations."

 From my understanding, we should not describe the XBAR_DIV3_CLK as it 
is a system clock.


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

