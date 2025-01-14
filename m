Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11A6E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 11:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qbJZNH3I2kHSJ3p3lZHpAuzG4uICLJvj/AiJ0Ww5yMA=; b=4MY+t5ex+GLb24QLf+1kDVEZb9
	LXwhS96gskh1jsw84mqeJp4lkv/87KNNPN3v8m74eNxae6n669hg4LfJYoIM7E5u/XBluOItPZ85V
	dSo+KrnOxxJuwU39yfAXiF8G/3dHehQUHtOWEuywupjR79qNmeefFWX1MYJLh/AKlrddohuwB4IL/
	NTWyyHrvwAc93n/5KaaOebtc5ZCDXF4nI1Z3nfHB9hnhbMz67UeG04wWwOABUjM/ZIpC6XGUjgAru
	5VB+2Kfrj/5AGvcNARodX/UWBWY0r1fa8kYYk7jp4Jk8V4Rxxwq6uiL0DOofV8o2TOjN9qRw6EYvd
	UxoUHI9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXfWd-00000008Jx7-3UHH;
	Tue, 14 Jan 2025 11:56:03 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXfVN-00000008Jqu-3zV0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 11:54:47 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4361c705434so38377075e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 03:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736855684; x=1737460484; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qbJZNH3I2kHSJ3p3lZHpAuzG4uICLJvj/AiJ0Ww5yMA=;
        b=AulqPZQePp+TrSK/xOGXb3nQOZJvHu3GMytzJvbNkjQWkMsHZbl2plTolkl2FJ14Iw
         0BxDf5xBtY7PbjmYtBU57MwgmFfdTLYGaM/3jG3OpIdWtZ9GSUse+76KKrd15BOLPNWw
         HybrYDOnrEDmP5X224JYv7vv7qShry2vCSeUA4qSdkLuop+X7kSbRUWzE1RilM8JQjZL
         dqfWII6ZVfp0a3k4GjiwjvI1BG79uI9xJMRFIeToybSPBiwuDNI4BBVSLGmCgFgo/UF9
         YQKvhtiFgBifeFeOlEkk0C30U5VGDyXjQ2e2lA3WgLq4tTDz+b0mFTcuKDRXh8Rz7aLs
         YDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736855684; x=1737460484;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qbJZNH3I2kHSJ3p3lZHpAuzG4uICLJvj/AiJ0Ww5yMA=;
        b=BOJ8BssyNlp6eAH+ZTOSOzWE3pGCfv/OtvwqtN5XXQlu0NJ0xOXmEGZ+EH9EXJxSoy
         o+VO5zpPFl+OVK8iBsQWSHwfkapqwCzhq4sDp79ruEaEUKyq8WiFD3wD5AHYGJ5RnNvZ
         SMGiVpn732e/bkVKWXo11gMrfL5JfYR6gVSnbTKKWNulGPT+/d4wKQpQ/HiYdLCgIvHy
         /tFnIXoG6AzFfHc7U5419E9eUN03e8N4ceaMhnylgW5Zp4pQ8v5iwFeedyhxdI1DuR6S
         EdTY8T2wcvZadCrZTRNckBXh/sFUtKElwfEFsIvnOvSGZCmFXYn8GyNbMRKSdVyJ7EHf
         OLXg==
X-Forwarded-Encrypted: i=1; AJvYcCWWGeZd3DeEYlsrHQu3d/+VMjw11cCELK0voeiAABNT4f7zcGm4+og/TN+tSs91r1lLsAHQbOcT3oMkOsbzFTx7@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0hQrxZtrglPY+V5uNSIsJFIw2EP6nU9tR2JRHUti1I5WtTpkg
	9KfXPaAxexSvg9kR/ejz8ho3SVjkiQzhAWrdAC+U3YgFR/cK4lOgl8nMosZjzQk=
X-Gm-Gg: ASbGncvIn1vgsPTh1y82F8VBy/GFNuTypmvmBjHvFQVo86EE2utGz7oMR9sFBM3KkPw
	dd7VbaITqzlmVioMfEzFHXFDdBOxr2t6t63bfE3UNZdosRoQZvW+PCUHIXc4TkxH+wn0MVRYqcF
	I/UD+9V2+ZJcDPpVTXh7TImmcb48Hv1gNxV4GXAiMNtIIP/z8m2JdjFeSJBy2q+HgmH7OJHbrv+
	xrLud1H4GhEwTO1JLh7AiavnsuBDXr+jg+awbt0OCG9DWtgttfvaqKqxEwR7eo+shKxhx9QdLKh
	MtPJWbhCIErU0Rl5zuUP
X-Google-Smtp-Source: AGHT+IFlWMbt6nrzrirx/rDmydW/pVj5xprtbzyuAVBQY0lAHuDRdBjo+/B7yttkEhzKPsZ0JknC1w==
X-Received: by 2002:a05:600c:283:b0:434:f1e9:afae with SMTP id 5b1f17b1804b1-436ee0f8783mr124040565e9.1.1736855684496;
        Tue, 14 Jan 2025 03:54:44 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-437c0f03984sm13710775e9.0.2025.01.14.03.54.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 03:54:44 -0800 (PST)
Message-ID: <53f3803f-c6ef-40db-9794-6c90b37659c1@linaro.org>
Date: Tue, 14 Jan 2025 12:54:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 2/5] thermal/drivers/mediatek/lvts: Disable
 Stage 3 thermal threshold
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, Balsam CHIHI <bchihi@baylibre.com>
Cc: kernel@collabora.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Hsin-Te Yuan <yuanhsinte@chromium.org>,
 Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?=
 <bero@baylibre.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 stable@vger.kernel.org
References: <20250113-mt8192-lvts-filtered-suspend-fix-v2-0-07a25200c7c6@collabora.com>
 <20250113-mt8192-lvts-filtered-suspend-fix-v2-2-07a25200c7c6@collabora.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250113-mt8192-lvts-filtered-suspend-fix-v2-2-07a25200c7c6@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_035446_000950_E81AD8E4 
X-CRM114-Status: GOOD (  16.91  )
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

On 13/01/2025 14:27, Nícolas F. R. A. Prado wrote:
> The Stage 3 thermal threshold is currently configured during
> the controller initialization to 105 Celsius. From the kernel
> perspective, this configuration is harmful because:
> * The stage 3 interrupt that gets triggered when the threshold is
>    crossed is not handled in any way by the IRQ handler, it just gets
>    cleared. Besides, the temperature used for stage 3 comes from the
>    sensors, and the critical thermal trip points described in the
>    Devicetree will already cause a shutdown when crossed (at a lower
>    temperature, of 100 Celsius, for all SoCs currently using this
>    driver).
> * The only effect of crossing the stage 3 threshold that has been
>    observed is that it causes the machine to no longer be able to enter
>    suspend. Even if that was a result of a momentary glitch in the
>    temperature reading of a sensor (as has been observed on the
>    MT8192-based Chromebooks).
> 
> For those reasons, disable the Stage 3 thermal threshold configuration.

Does this stage 3 not designed to reset the system ? So the interrupt 
line should be attached to the reset line ? (just asking)

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

