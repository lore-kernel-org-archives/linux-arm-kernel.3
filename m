Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5686E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 19:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kgYtVUqUlEZ8VSuTq+I8ySRpCil6RgGzEne2MvLY5yE=; b=ZiBtuy7qLW2xDlnxeTdO++w2gG
	VKUfDP73JpuiPEjHs5awfy83Q3yE423a54gCM70T+tHbbFtNAEKzm3Uwxsjcf+DLbLv6kVcBV+xVX
	HZp1c7cg5TWNKSvAld3CsaQ/OnxlJ0TiedOfok+v5cbAq+mWTUIIfH6+WU/GhpETXCngFBYnGwIEB
	NROr+YbJqYrmwQhoMEA1rKw2kigorWxI7fSLHh2yyFYznM9HibZaOkfMRC0eOGGlcgSR37+aKNw6V
	tswHanHhiVA38xn77YoiUfaBtSE34qeh81eZEBE9juIHbftxPcNSHkqDnhqMgPqn462sfll7/6uQg
	r6/+WPwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJeMK-00000002bMm-25rM;
	Fri, 06 Dec 2024 19:51:28 +0000
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJeLI-00000002bDx-1Mrd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 19:50:25 +0000
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-85c5a913cffso123921241.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 11:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733514619; x=1734119419; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kgYtVUqUlEZ8VSuTq+I8ySRpCil6RgGzEne2MvLY5yE=;
        b=tOg5YAeX05RN9H+tPc2tCn76cQqC81Hh4z0MY89mI6Oo1gb34sOBev+MIZXtvPK9pp
         KpPL97fjxT6W0MsWlVR1INzYcfAwIvXAiMf+Bh9sCB15daBicR8IYMgsqAa8glV6ru8a
         5/e5MfTPZGyO+S+ieRrYWZzX+LUjMxFYzs/eoIDPP5UpCikArltF63uFS2SIcyn4pivp
         pmax2kqz7A/BlS5ku0WMfNQMvXg5PKzMr0KAcp2GJbWdCxiPlSfC3/Yx9McIzBOyvjwb
         A45B0+btagsEtdxPZpgqACN+zLEUdAc51KrJ5WOWRPQH9OLAXJD2D3mAayhhCXk5vVNS
         rw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733514619; x=1734119419;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kgYtVUqUlEZ8VSuTq+I8ySRpCil6RgGzEne2MvLY5yE=;
        b=bXvYdhLEQNS2ae3gj5NFS6BXKxf5t2L6/GvNB9IdTWaEQSFVzGENcItgM63wDsxE0A
         GH0DlFCeBG8WLoWKX3XlTwsaP2gsXBe6BtIuJfv6BOWXIL5GhXTbAhT9vM6lYvHLUbDw
         IDp6u5k/mESmlbYF6O2WrStAxd1IMRM+0wxRq/7VT3GmSipDV6dj1qDsjoKRaXjvvFlm
         HgC7Ee3pHN6UujrubzUEcATvuVR/h+/nQVnGJptBE2Hg+7pvWb6Xd4js4j1EvobTEbNB
         6aD2b37cgTadtK3WH9hQteWntMCzy5V76qxOM3ibT0TuOWDG5hGE9Tt1mhrWZ7buLS5g
         EroQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuKECHN2Iyg5D97l79qx4E/Y1tuqBsWShRRujE7o/9f9QvXAc0Qmdzz3V4GfURLuGReqqtHK9JaXHorK5JOutS@lists.infradead.org
X-Gm-Message-State: AOJu0YwIJxZquLlNNqyHQ/HjW6Iw/2hMhy8JzFgFO1j0uQRPMV/qLUL8
	IdfOcDuUIaiahoapKaeodNziVFtgd8ZwT5NYxE9jVrraaSOjQUDAvqyEUAcIvZA=
X-Gm-Gg: ASbGncvUHerVkfBLEM65TZ2PyxlEH0s8ZYHYdJUsiAjv6xigAaN3fxB5bgRdKlyll9f
	ykIlQRJWS7aKoRZj8gL/ep1GBavOWbEK7o1xVWJIo9R1enxXzECsrbZFrFnPzmqkxswN5MzlrlP
	SVFrl1bhcxRcA6GGJ+iQTxqR7kXrJCIR/g2RDK6l/xh+4rbGdcj4sfGX2lAcXN5YHvdADfCjmxc
	Qg7HdpNlWHMHpOmTZamjz/ie1dt1DG+Fd7gyK8LTXw/OnEn33USURgmZdeBm2mK8OOB05Rs9LWW
	jXQuTVCa
X-Google-Smtp-Source: AGHT+IEeWUUJbrxyEjeWWA+oNy8sSHBMGYhIlHk+x4xxBQvnZSCGxkbHgUu85h0IP51FdasOJcUIAQ==
X-Received: by 2002:a05:6102:5486:b0:4af:4ccf:e99 with SMTP id ada2fe7eead31-4afcaacd044mr5735787137.22.1733514618823;
        Fri, 06 Dec 2024 11:50:18 -0800 (PST)
Received: from [192.168.1.124] (49.93.157.89.rev.sfr.net. [89.157.93.49])
        by smtp.googlemail.com with ESMTPSA id a1e0cc1a2514c-85c2bd4f2fasm552887241.32.2024.12.06.11.50.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 11:50:18 -0800 (PST)
Message-ID: <2eedbbe1-6b4c-427b-a369-5b08dc27deaf@linaro.org>
Date: Fri, 6 Dec 2024 20:50:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] firmware: add exynos ACPM protocol driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com,
 peter.griffin@linaro.org, javierm@redhat.com, tzimmermann@suse.de,
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de
References: <20241205175345.201595-1-tudor.ambarus@linaro.org>
 <20241205175345.201595-3-tudor.ambarus@linaro.org>
 <ce757b8e-4e6c-4ba9-9483-b57e6e230fdf@linaro.org>
 <vxqi23hxw7bmtfs5wk3u7szganpv5aa74b26xrvpmbehkltodw@dpum7zrxdz44>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <vxqi23hxw7bmtfs5wk3u7szganpv5aa74b26xrvpmbehkltodw@dpum7zrxdz44>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_115024_377267_B7030262 
X-CRM114-Status: GOOD (  13.38  )
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

On 12/6/24 14:28, Krzysztof Kozlowski wrote:
> On Fri, Dec 06, 2024 at 12:39:56AM +0100, Daniel Lezcano wrote:
>>> +# SPDX-License-Identifier: GPL-2.0-only
>>> +
>>> +config EXYNOS_ACPM_PROTOCOL
>>> +	tristate "Exynos Alive Clock and Power Manager (ACPM) Message Protocol"
>>
>> Given the importance of this driver where a lot of PM services rely on, does
>> it really make sense to allow it as a module ?
>>
>> Some PM services may be needed very early in the boot process
>>
> 
> If it works as module e.g. on Android, it is beneficial. I think the
> platform was booting fine without it, at least to some shell, so I can
> imagine this can be loaded a bit later.

Usually the firmware sets the frequency to the maximum in order to boot 
the kernel as fast as possible. That may lead to thermal issues at boot 
time where the thermal framework won't be able to kick in as some 
components will depends on ACPM while the system stays at its highest 
performance state.


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

