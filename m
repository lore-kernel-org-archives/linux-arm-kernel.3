Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899D6CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 10:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oofnoEjFC3k8jMJB3VTduoNGQlCA1NG6eHrRA2nUPzQ=; b=be/hbaiU53fNg8xh0ApgAEgs3w
	Dyu463mXSLQZXN7OrK0bBYV0SeApILLWeZMIEdOPWDRfezSCxO2vccALXjpOxhnCG45C552veunfR
	rIKEuA+DbfMI4EYgs3QD72NCk8G8IgN2B/t/S3cv4zpI53OccaHU++x0AKLB7jRDc0Jj8KEn3Vbu/
	iPUEZG6Yrf1Cs6vW4WNs9Do2Scg+1DBLxPeJaRXqRtW326JEXvXVVhksYyGV9J2wZymXQDVl+tTWW
	MUw42Zv3PZpBpPGu5mFsvqDzBjtaP7IZoKiWznhZIRixNA02IASbA3W1XqYWBB9GtLevFzuLQ56+0
	60tYZ/Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvBz-0000000FDPI-1hHN;
	Mon, 18 May 2026 10:27:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvBx-0000000FDNx-18K0
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 10:27:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=oofnoEjFC3k8jMJB3VTduoNGQlCA1NG6eHrRA2nUPzQ=; b=hcUrp+cLgZNQeim3FeTJutgLeS
	j4op+oiGKBUoKHhNnFJh7Pe0nYaAjRhaUFJHBMzac5aE2arUjcFoRNT6skSuulrutBNnfjQz3Q0mH
	EUSZeNrpWqONsU+sqw6kWyZzs5dLyk/HJoCVT9vCZmtQiAjlcpoGctVLQ5zkX38XI8QkwyuxY4hkW
	vg3JntbTyeI0J80pF0fXhjVVPBF0hc4JrguiNvVd0FNl7Bs70JCSp/QFfmBRSduLsP/qif0DAQubt
	DprWJ/3aMb16k3O9xXgPyZujnN9YzsnTA5ECmXvRCVTm3OBPahlA3jy8Gfk2u53TyNKenuOTjIhpz
	uMajMB5w==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvBt-0000000Akyb-0LXm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 10:27:19 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-48d146705b4so22530305e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 03:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779100035; x=1779704835; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oofnoEjFC3k8jMJB3VTduoNGQlCA1NG6eHrRA2nUPzQ=;
        b=N8nxU3oPS5/f/NkAlNXjfk8uE2h+Yu/e+0dY/NrGaPZNlI0lyjOgl2JiGzXckt8946
         8bDxA0kkkyqd3oQ5OmnJ6hcSK9QlxIjbVre1zhZziSQgZuH5bJqjRMdwUigk3I9Xw7tB
         q4oz7Hktk7NAnCuFNUkBrX8EXHef1HV0oTaHaQhohAMcRkhOZND1e831D9/aMyUD3HGF
         uP67IfqNK2Z18ADkluu8BnicMKMfVk0QZ5gAX8ujrOG4oEeRhdllmutP6id8geKxuD50
         0YpZ8yHGHr68mXcLTnge6yxiBVp3QkYZPAz13GLegb5fSHJ0SpScOwWpnvpENT3b6KsC
         ckWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779100035; x=1779704835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oofnoEjFC3k8jMJB3VTduoNGQlCA1NG6eHrRA2nUPzQ=;
        b=QIjq4l+z7joj6E5jerxDq392JYjJ5gLwwny+ffUzOfZExmyVCtppCB4zLWBPK+Py3m
         rF1yw3XPLe2iyGoCA3gah0igyzexboIdrklsZGdRd6QDLR1us+zh3f/4rD54iEe3tZFk
         LwL9S7Q0+ah1MaM+LCm44g0gV6V1o1F+lt6OD7EB23WDlM/yVLzR6XGyHZUCgVVXl7Aa
         9zEEh68tE/4+ru7Fn0kaZ7a7bQjz+a0Igpj5NzmZm7d3RrGpYAcoTdeK1nknkADMDfxx
         mxWbvIJJVe+cOUU3sUs2uwlAMbRTxc0sR7dfQhyq+RixuROImZpE5UeVAz908sP5TmoM
         9bnw==
X-Forwarded-Encrypted: i=1; AFNElJ+r/cYGrENiMhbVpoWqmWXqX85eItSkWncHezSlgh9WTWeW9VsC1JjvlMsDiag8MnDzh7a8HR5dxnYvcm3FQlEs@lists.infradead.org
X-Gm-Message-State: AOJu0YxQpnoC6hMurfvh8P1ZPSYhGILoBakTnpFWe5An3mLbhEBYv5K2
	ULSMyirbW3WbXnpbH8nBsL4vAZ3aDEJopuk5GED3uIISfS+mHHZVPjOyS/xKrGpj0Ro=
X-Gm-Gg: Acq92OHUJD7u6iwwCKHPVl9ll1DyB3MrODwaxFvy9FJN23Nqjp38BHdDUBe2y1Qp4LC
	JvtJdAY8JtYKQtZ/hnkNgAxFZ8MOEKrmSEqH++kmMMdZF5YO1SUgdNgP09+Rtl34r1dWhMPe7zm
	Uyiu1vpGFc0vx9rAlWLA9mP1hQcoyFXUejSXknNP0LxcpplkMWUM+L70DYAMJ8LvbQmlAL/rJH/
	+4O9QrptI+s3YEnFmEWAv9wb2MUNbcboeKYb0nNwdQ5S2WO7lf1ktGtVBa6vCCVkKgsQ10l/M6k
	flqIeO0YEcgsT41fUQLsPFHqufG+Vo/RNY6RvmR8cO/LT6yoCVsxZK2hXR/eydybnFwPP48b1SK
	kMF8iOOngtnrb24DS9XjAvPG0eWx0xc7nv1ZlosC1hs9Ijlh+YWtwx1ypKA6ah8TsInbKQixnja
	1grOYUWTb2zPu72042iPJO3WqMaKHbSE74PbqFOs5Gkg==
X-Received: by 2002:a05:600c:3b07:b0:489:1a3a:9e45 with SMTP id 5b1f17b1804b1-48fe651e127mr216677595e9.26.1779100035288;
        Mon, 18 May 2026 03:27:15 -0700 (PDT)
Received: from [10.11.12.109] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm37898451f8f.23.2026.05.18.03.27.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 03:27:15 -0700 (PDT)
Message-ID: <6802a856-76dc-4bd0-a026-59b0249646af@linaro.org>
Date: Mon, 18 May 2026 13:27:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] firmware: samsung: acpm: add Exynos850 support
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260513-exynos850-acpm-firmware-support-v1-0-3858d097e433@linaro.org>
 <20260513-exynos850-acpm-firmware-support-v1-2-3858d097e433@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260513-exynos850-acpm-firmware-support-v1-2-3858d097e433@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_112717_639359_5A96FE04 
X-CRM114-Status: UNSURE (   9.26  )
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



On 5/13/26 2:12 AM, Alexey Klimov wrote:
> The Exynos850 SoC contains an APM co-processor. Communication
> with this hardware block is established using the ACPM protocol,
> which handles IPC messages for clocks, power, thermal management,
> and PMIC control.
> 
> Add the "samsung,exynos850-acpm-ipc" compatible string along with
> its associated match data. This includes the specific initialisation

s/initialisation/initialization 

> data base offset (which differs from the GS101 offset) and the
> "exynos850-acpm-clk" device name required to properly instantiate
> the clock provider.

The patch looks alright. With what client did you test it, cpufreq?

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org> 



