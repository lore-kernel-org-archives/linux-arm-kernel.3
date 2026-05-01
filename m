Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3835FCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 12:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hG1+nTYFaVMeBN3UfDamEXK/Fu0XaXrJJh/rhgkXCuU=; b=aluUbKbEnILF2AdcvpFbWmst6i
	lSxXcw/+qfjYn4MyMMf56+5NA/IZshzlWSqbwhZJksCPFHMToTTYt7c8f0Lkdy92L9qJonR0wXYly
	LLhHK/TGhHs0IJUsSFRswH0z0ndbQ/OFFWgB42b2vx1hrJTC1zPNa4LR3A+e2+PADEBq/NQ7HKiIa
	VXoTnKq9sIFDuIw8GeYDLqI9+zbwCepNXK3ZU0cga5J/R80Ja23WwSu+SJQRBzr23/zMtgV22JFcq
	l+DPnODInzdX9yV0qLxoyLM/y/kvFirCDrPaxZfdd98QXAx7a09VRFTUnckBt7LfG6fRhdnVTfhJC
	jXH9d7Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIn3k-000000076G8-3GuY;
	Fri, 01 May 2026 12:33:32 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wImuH-00000006yly-3EnO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 12:23:46 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so19382445e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 05:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777638224; x=1778243024; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hG1+nTYFaVMeBN3UfDamEXK/Fu0XaXrJJh/rhgkXCuU=;
        b=uEcr5Uxc3o3O92SIRUZlkZu8DvBT/YHg1zQQR8MYekOj4epHIeC2NeKIbxn3yvVGk5
         3RkZ5RxWWmoMiM5B4gfheLfOB/GCdhx1n/f3VsyEZ1w2Ri/lVOAIeJk2Uuity5sroJ5+
         SM0XSRYS3BF7UCGNpN7GAA2lL65s6RMAZUKNydDBlbaFaRuCvsWsH2UCMUen5UgagUZF
         j9I4CJlMNAPZorotyA5sfI8TLNnVXQgp4g8uxdgpmZ5Da/n0ijf8zAQXptTIUO4vhSS7
         zQEDmTStU1q40eZpSONklJBksuO5He1almjemqMezijND5A/ts2/b7lrkdE2k3XiegXO
         EvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777638224; x=1778243024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hG1+nTYFaVMeBN3UfDamEXK/Fu0XaXrJJh/rhgkXCuU=;
        b=YY/ELOKEK9zVzMEK7eurvHHFCa51N1LOtc9aXuE0NMMfGwvyQBsyXGKOzyArbks9DS
         09rgQwZo22hd724wX1Pfvcut6a0oKG6fYKT1R5DjnwllZXHBO4r8MuYgDQaOjLcWMw/2
         ymd+F74Gw9TQAvRLobs2CICr37Q9etiqH3XqtxE6AKcgeoxcKiGnFpk5pBGmEsd0hy/o
         Gwy0qiO8UiNd8Bz8qxNoTccx7VI7E7SWswt/7sWkQ1tsiIWmZXaNyYocaWh3Kql8IZuK
         Lm7btL6/1LdEbW1+09kToO8jdS9oTwyQ6KWOtSOAOIhFNF8ygMn329dXrg45OnHUW5cY
         8ykg==
X-Forwarded-Encrypted: i=1; AFNElJ8+P1/0CMFxO84J3Lkg5UnEeHRTt2s3vRDHtJC1KD0orAHag9i7Noi4+b0neLmyEi7rvLbrBYD9knEtIyLDNWoR@lists.infradead.org
X-Gm-Message-State: AOJu0YxatkmKwgQfTwAVerqxGi3JIfEoRcDvzlV2cZq/060LPci6p4f6
	d32V3s9IkcWBplj/U7qvc4gCrPPBmDR89m9jWvAdhzZ/x6At5DFO68pGdDt9Xg8jL8Ey7ELM13n
	Sh77I
X-Gm-Gg: AeBDievZanhMhS4qbTFAU87bdJVdPOIWZUXB02IZS+BpU37613cToqCD+cyfIvOR2Y/
	BG+SIMUS3pNG6IKinE60IRuHVW2hJE1SD7tBHhleTcZgdDCjFkTJd/+rMhbOGm6zTYSu+Ud8tSZ
	ArGeqM4iJf+HwD0XrsiPiXwUMO8Rc+r/dcr1HQyjCliwCNxvXIk0oE5sHyTu2BkB2DDXOg1AxtS
	lNc5XKKNzM6KGgAdD4yO4AbsyLExF6QBhviGU2gVG1yda7ZQjLL97l4DI+ReNw+6ED7nAbuTcVz
	ybPRRcVtxfkJTfr212eZVF812wnXCf6gR73JNL5jB/ea0C8cNw4hCMiJsobUlLLvpGRXirOa/kd
	8Q3hE0pJx8eB7njfsq/6G3nfayuJy/De9TtPNwZasUC5mvmf4aARV42/GvCeH6wmzY00VG2GzFs
	4SYtSpCtryzGeRPdHCssIp+KCFun/Skvqx1Prw4irbq+I=
X-Received: by 2002:a05:600c:4f47:b0:485:3cf3:1010 with SMTP id 5b1f17b1804b1-48a8eb61e38mr44018115e9.2.1777638223881;
        Fri, 01 May 2026 05:23:43 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aab44sm4869155f8f.29.2026.05.01.05.23.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2026 05:23:43 -0700 (PDT)
Message-ID: <00f82e4b-4e1e-495d-b0bf-b6e4563cfee6@linaro.org>
Date: Fri, 1 May 2026 15:23:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] firmware: samsung: acpm: Validate SRAM shared
 memory and queue pointers
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org,
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com,
 stable@vger.kernel.org
References: <20260429-acpm-fixes-sashiko-reports-v3-0-47cf74ab09ad@linaro.org>
 <20260429-acpm-fixes-sashiko-reports-v3-4-47cf74ab09ad@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260429-acpm-fixes-sashiko-reports-v3-4-47cf74ab09ad@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_052345_843375_3D19B2F9 
X-CRM114-Status: UNSURE (   9.55  )
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

Hi everyone,

After further review, I've decided to drop this specific SRAM validation
patch from the upcoming v4 series. I had the typical band-aid vs. the
surgery dilemma.

While the intention was to protect against compromised firmware
providing out-of-bounds offsets, implementing this in the probe() path
turns out to be an incomplete band-aid. I identified two firmware quirks
that complicate static validation during initialization:

1) Some channels seem to use absolute physical DRAM addresses instead of
SRAM offsets. Mapping these against the SRAM ioremap triggers a fatal
page fault if we don't explicitly fence them off.

2) Some channels are purely doorbells (mlen == 0). acpm_do_xfer() and
acpm_get_rx() functions currently assume all channels have payloads and
sequence numbers, meaning these channels will break at runtime if we let
them pass probe.

Trying to silently disable or bypass these unsupported configurations
during probe() makes the code brittle and creates a false sense of
security regarding bounds checking.

I think the proper architectural fix is to introduce a formal
acpm_request_channel() API. This will allow the driver to validate
parameters at probe time, mark the unsupported channels and gracefully
return -EOPNOTSUPP to client drivers, rather than hacking workarounds
into the probe and runtime paths.

I'll leave the broader SRAM boundary validation for a future patch
series.

Thanks,
ta

