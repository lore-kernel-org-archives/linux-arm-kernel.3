Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7618C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 20:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7itKtlTYX9R4u2oxxBvlnWOsxUd+L61slFivLar7yO0=; b=g35Z5V94k4RO7sCa8O6vVeNBAD
	ESt9SX4AcD8xMBNeqSCr5ewBBc4U56Ba55zm0okljOOWTD6R+JOjsCT5k9vPRjFske2ke4xHCkrjs
	teOaCCi74AbMmgdTpN7qL85Um8uet+nQjEdpGOMajYhFMufXYqxN2Mk5fFWXT8eJxVa0zWKWYYWqj
	wDr8VMi1KG4m+Mopiq7fWfmsHZw0q0YXOiwnrtGJtnqDt8s9U7GLugvKqLE4bCl7KUCrAdIge9fU5
	nfcGQfM+FuqIyK5TYI9D8B5k4I4O+kqzBwf3cOjRYbMsaGX4v5vuQ8QFbfqo+WI6trDtP5EyANCTk
	VPYuTsoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7IeT-0000000CQD6-2T9X;
	Thu, 17 Sep 2026 20:24:13 +0000
Received: from mail-oi2-x05.google.com ([2607:f8b0:4864:32::5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7IeQ-0000000CQCF-0eqc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 20:24:11 +0000
Received: by mail-oi2-x05.google.com with SMTP id 46e09a7af769-7f9cc0e524aso429421a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 13:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789676648; x=1790281448; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7itKtlTYX9R4u2oxxBvlnWOsxUd+L61slFivLar7yO0=;
        b=dq6UQ5l0BqHXf/crOsV6478qNj3ASRWVEBGRIqp+okaUXkWPh2/H+0+lUDfvxjklU9
         Nswd8TPIMw9nP8s06eK+mZJmX+r6Gd40ewCrUveRWu8iyZZrsdI526o8wSqJAD/ZO04/
         vrQ0PH49vZuvOVc2SxKbtvIAg/9uXV30MBjS7pxIbmVbAevH8dKCyAO9YpNARFngleeP
         2Ocula32oWitvqJt9vnxXJwvogbGiE3/33IBMshtU/Vtrcj3bsqZkrrIFz7or9TNQC7q
         IC06aUsW0+fFgPooLNPc0w1Pn16qCe0uP3EN3Nt3gWaDBUQ09h7wcDt7BuUOAlNpCJ3g
         cFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789676648; x=1790281448;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7itKtlTYX9R4u2oxxBvlnWOsxUd+L61slFivLar7yO0=;
        b=eMfPBJJwtdndVylTygB5Pe67spuLU/SRfoi75fsXyGICUz0QLjJFwq0V6UWjIG8DEp
         lwwC9nZ+BSHbhRLDkq1UQvr/INTK8g4wYSm63Uomiwd9mVCOiuieQsa3NOceh3Rp+ob7
         euFxFaAtPo2x7H/SB2C+pR3iyeyciTqNVaB0Gtqgm7sfcY1TD2SnZX7lZ++k7BM100EY
         0L4p+bmtn/36k7+UrqatbH/rARsj8JpuH4hPooplbUgdnahvVuXr8IfvQVyWcTdtWc/7
         9cHtdn99B1EhwunmLjBlohXfb2ouwf1KfhjRTODKDqDuHB+pWOAV7xz/OM0XpyWHle+T
         8Q1w==
X-Forwarded-Encrypted: i=1; AKwUvBwbyoYTewtmzxsdnQc1T5SguAL530zKC2lU5cQnJpbHQ0bPFO4i77yVvK6eif9wSWQSIGlRVWkQwUcR27DeBz/Z@lists.infradead.org
X-Gm-Message-State: AFuF++m1IO9rtEObwVN2tWVsLZztskOznYs5lDKfs6ueolhLvHc5vFmX
	EnWixURBWanpx4ecKUtNY+Y4Tk5Pv7gR4BD6eNMf9Zs3Y8afw6ScTZkL
X-Gm-Gg: AYBFou0AXTaynA6BSt0Stlz30GvHB8hmC7HZPVJNApzbLOQGvUsf7mIZBDppb8tLyjI
	qhiT1d2TOAzco8jszd1nR/0vVplFmAJmWHvCmRCMJ+47SsR2Qgd9e1JvAnBYIEpl0SgCpjLOqb2
	GXqe3AzVTrUN6Ad20e4SenJRkHnZp+XjoputL4xYxmps87eiDBO8YazSXWOAfVXHqJDennPO5F7
	nx+wStHdnByKquhogoy90f+u0r0VY56jZFPPFKpudDyMVp5a2D1kIjFzJUhFVdeTZekV3fCxmSX
	xcAiEhwtBB/Tu9IzE3+ar+N3vg3SIJwMXJqG5usLcyxgazDJVxinWqlEe8/PgpTnNGEPdLDBBCC
	ZGiDMM0gmf5KyfQ9YFDoxQLnihjO6JldqLOruHXAvn7vNfq/GjxiqiyLqzBgZ+0zAiD8YAlB7Ua
	KEUXJbVsfbckY4K+PjXLOYPhHj/P6eNkRFG+4UOzSdQjZRXQsdXWfU4rgHOFqLpezT6CVnHe5Rg
	VQWUXotJJDHc6o=
X-Received: by 2002:a05:6820:2219:b0:6b3:5475:4861 with SMTP id 006d021491bc7-6ca9aa3fb5dmr186014eaf.18.1789676648385;
        Thu, 17 Sep 2026 13:24:08 -0700 (PDT)
Received: from ?IPV6:2600:8804:5716:d800::b712? ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c8f5cf48besm3802412eaf.4.2026.09.17.13.24.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 13:24:07 -0700 (PDT)
Message-ID: <2d1b80f2-53f6-4ed6-81bf-e35c0a9efb26@gmail.com>
Date: Thu, 17 Sep 2026 15:24:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] iio: adc: add mt6397 PMIC AUXADC support
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 mfd@lists.linux.dev, Roman Vivchar <rva333@protonmail.com>,
 Luca Leonardo Scorcia <l.scorcia@gmail.com>
References: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-0-d35d2ac3d6f0@gmail.com>
 <aqpmgliQW7FW53o5@ashevche-desk.local>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <aqpmgliQW7FW53o5@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_132410_209251_A8428978 
X-CRM114-Status: GOOD (  21.00  )
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

On 9/16/26 4:50 AM, Andy Shevchenko wrote:
> On Tue, Sep 15, 2026 at 11:15:25PM -0500, Ryan Brue wrote:
>> The MediaTek mt6397 PMIC has a 10-bit AUXADC that nothing in-tree can
>> reach. On boards built around it that ADC is the only path to the battery:
>> the SoC's AUXADC is wired to board thermistors, and the charger ICs these
>> boards use have no ADC at all, so without it there is no pack voltage and
>> no state of charge.
> This doesn't explain why a brand new driver? Perhaps we have existing code that
> may be updated to support this device?
I considered adding mt6397 support to either mt6323-auxadc or 
mt6359-auxadc, and both had problems.

Both mt6323-auxadc and mt6359-auxadc select channels through a request 
register (1 bit per channel), while mt6397 uses a 4-bit numeric field 
CHSEL in CON1 (10:7), and then pulses a START bit (CON1 bit 0). That was 
the biggest reason I made the new driver.

For mt6323-auxadc, which is the closest I could find to the mt6397 
(CON0..CON27), it has 13 more registers than the mt6397 (CON0..CON14). 
It uses CON22 for its request register, and reads the result value from 
the same register as the ready bit. We don't do that - the mt6397 has a 
factory calibrated value for each channel at 0x16 higher than the raw 
value. mt6323 also has a 1800 mV / 15 bit scale / resolution while we 
have 1200 mV / 10 bits. We also have some per-channel preparation that 
we have to do before the burst, that the mt6323 doesn't have to do.

For mt6359-auxadc, it has a more generic framework for describing the 
AUXADC, but it assumes requests are channel-per-bit, and so we would 
have to basically ignore req_idx, req_mask, rdy_idx, and rdy_mask.

We also have our own software sampling, which the vendor does too 
(Amazon Fire OS based on Linux 3.18). We'd have to have our own sampling 
callback to do it.

I drafted two other versions of these patches adding mt6397 support to 
both of those drivers, but the differences meant I had to add a lot of 
extra boilerplate to each driver and to me it didn't make sense.

In v2 I will add the justification to the cover letter and commits for 
why I chose a new driver.

If you'd like me to instead send the exploratory patches I made adapting 
mt6323-auxadc or mt6359-auxadc, let me know. I'm fine if it ends up 
seeming like we should adapt one of the existing drivers, but I think 
the mechanism for controlling this AUXADC is unique and merits its own 
driver.

Thanks again for the review, I am going through each one, and sorry for 
the delay. I'm rather new to kernel development.

Best regards,
Ryan

