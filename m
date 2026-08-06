Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D98C56205
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 16:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s2TkJw4qV4dMHeSE8n4BR00N5vqDbN8wATqN3VEnGD4=; b=ccikv8/pOiXJdmxUbeduUNJP35
	qsec6sOvh+KYrWedX3ZcIi94/E2vxYAeI78q4MkYm1qoufJ69IKwh93B9aDWoN1aMtVfCQS4QZNqa
	VNIBrC1O1VHjuZpotfK/UW3P9JjVGk6qm83POyq4mKWXcdyz/bwTmgfCLg8ulsTLyoZsx1MzSUS43
	yjM0zZgBnDAt3X814HfH6FwXQ5uxHVg5aJFF7mrsg9RL8YxWIonZ91tgI+aXQeG5mguXneQu8+3U2
	9cCo3BYuKcpyVtGNSxzBBrFeUBxs+y3SMmCSUb4pzIXaH2ccA/Af6G9/dLQX14LGG2OhBDmRhdTZK
	xrjoRP6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws0n1-00000006Bhr-2ZBv;
	Thu, 06 Aug 2026 16:17:51 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws0my-00000006Bg6-4BZF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 16:17:50 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-496b7622a83so20531525e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 09:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786033067; x=1786637867; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s2TkJw4qV4dMHeSE8n4BR00N5vqDbN8wATqN3VEnGD4=;
        b=TVdhFkr2XuRx/SupdPJLNXl7kVK60qPid/cfC2XpmtJP6ZRLG/Buw/UU8e3gbX+8jQ
         rbLhCjIo30mwHrEM2vVWvjZhCNn5yB3X8UPGi9eT6Oe8jZZKjIYwwHo/9wVcLxz1D95s
         hbiWNipcIk7k2+BMdNmbFKprhBUxyJlLHQCbIw8j/noxcPkT0jD++xVA6dF1PJJTyvr9
         lmXSPQKkJ3WF2GLg103yjOm74Dj5N2lsFqeyEAVoLpzR35XvWXULMUIm3ya+M9+IRzRG
         gbrDhGPWX+dXY5nhJIo/+hQjoonQqhreGgDpjQnOGWxR4ksm7f7izLVYhMcOMzXWQgo0
         X3mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786033067; x=1786637867;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s2TkJw4qV4dMHeSE8n4BR00N5vqDbN8wATqN3VEnGD4=;
        b=GnXV5Vstak/Tf4Uz55lRMoLKMWEDA6DsnhotVfTHZHJfrDmJfyL80HM3UTAsl8PH8c
         6/mVmcNoLNR/jG2HuKGbjQxrEeDGDY0UKTle/cKBbieKWmSln+Q+SDdtyWxaVepizY42
         2SOuFsE1BvkwtLBZBxuBHohGw44IaOnahWAyuiGdxdxPb5ks9Y3yVd2Ek4khFJ2ltS/z
         oi7JbMl5PeRqcC215VLJurqMeS2OX3ctTrR9guCYU6y3r14o+0ydEdjxY4MRtz8FxJlb
         3amDTHcNefN1rZRN3wENAT7qlgakxHEYCSgv6GmOjwACuD3cQKNbXauSwPX/HAv4Ph45
         ZPbA==
X-Forwarded-Encrypted: i=1; AHgh+RormVBC7Ekirdrv0TOekkaUfGQ1rI1Ujz8ciwlKWTEtz/wZn5/7CAVxgGqpZfnd41SNFzZNMI7VMSGHHtYMpoz1@lists.infradead.org
X-Gm-Message-State: AOJu0YwgLtScfdWnYL9YTgnbF89o0jRyAu0osr51x0OlOZYLnSeDCYFp
	5VUUiV8smpYDTWTyZRjQ5nUv5tPMfnE2cw3qn5B4mWluqYT3T7eQk7+yRjTCDAy2VGg=
X-Gm-Gg: AR+sD10CZ7IB/AITJJGWJbsom9+dXTkETiztBNd6EQhKHxD0DNFuFzqOFDDirqMerZ7
	Si7BQ7k5awjRxdmZfckbaJNZ+CKwwWsim9HQwy8/dGdRprI2CZktovf6jKAyR5VhsMzyKKQooYc
	mTZEwM979inYYQO/8oRErSMEfHEJgTy86R7DM6y2qxtMl6OtgAgRt7qMrVgsJKMHzN+bFuGGeRq
	KT6DUL2t7TFnviDiggEOD4jwFKLK8sPYy/qqrCLK/GcvXqf5gCRiITMPBMHpypwH/caYvr4W0Ya
	tEd4y2CavM3D6CYWYtF2KFjqtG0VqlWena+pCyvaIfIZ4FGvRBeNUEK2xjcC+RwAWMyUYO5E8Q/
	AynLSYXA6Pqq5SPOVvI+7D8+A023qeMU01ni7JOGkfaUQ1Za2hVt25fo/f409HpsilXOKDUpQPI
	g3ZmSG12oD8x9ZSeXzzvR7wcLA0xkFucvX54rNTAPClTuqLvTG/oKI6s+8T/eoazUkMnanGc2nk
	g==
X-Received: by 2002:a5d:6f0a:0:b0:47f:8a1c:54d8 with SMTP id ffacd0b85a97d-47fec502df3mr23870212f8f.3.1786033067170;
        Thu, 06 Aug 2026 09:17:47 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.115.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff7b32487sm6964879f8f.34.2026.08.06.09.17.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 09:17:46 -0700 (PDT)
Message-ID: <43327fb2-0085-4d86-b408-8723d852c258@linaro.org>
Date: Thu, 6 Aug 2026 17:17:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] phy: rockchip-samsung-dcphy: factor MIPI D-PHY
 power on/off into helpers
To: jason98166@gmail.com, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Guochun Huang <hero.huang@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260726-dcphy-rx-v1-v2-0-cf9cc34a412a@gmail.com>
 <Ji-6adk9LJbP87Y7X6SfOcAyVnGpO4dbHk0lBikX3NGAPz3dynWpvL8QjkVM3G3jEnwTrTV0p7nOqBxPRaH0MQ==@protonmail.internalid>
 <20260726-dcphy-rx-v1-v2-2-cf9cc34a412a@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260726-dcphy-rx-v1-v2-2-cf9cc34a412a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_091749_060654_E1E90003 
X-CRM114-Status: GOOD (  11.68  )
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

On 26/07/2026 15:55, Jason Yang via B4 Relay wrote:
>   static int samsung_mipi_dcphy_power_on(struct phy *phy)
>   {
>   	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
> @@ -1368,7 +1376,7 @@ static int samsung_mipi_dcphy_power_on(struct phy *phy)
> 
>   	switch (samsung->type) {
>   	case PHY_TYPE_DPHY:
> -		return samsung_mipi_dphy_power_on(samsung);
> +		return samsung_mipi_dphy_tx_power_on(samsung);
>   	default:
>   		/* CPHY part to be implemented later */
>   		return -EOPNOTSUPP;
> @@ -1383,16 +1391,11 @@ static int samsung_mipi_dcphy_power_off(struct phy *phy)
> 
>   	switch (samsung->type) {
>   	case PHY_TYPE_DPHY:
> -		samsung_mipi_dphy_lane_disable(samsung);
> -		break;
> +		return samsung_mipi_dphy_tx_power_off(samsung);
>   	default:
>   		/* CPHY part to be implemented later */
>   		return -EOPNOTSUPP;
>   	}
> -
> -	samsung_mipi_dcphy_pll_disable(samsung);
> -
> -	return 0;
>   }

This looks a bit funny.

Do you have an int method() {} with a final path that returns no value ?

Tooling/compilers will definitely and rightly complain about that.

---
bod

