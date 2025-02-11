Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC29C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 09:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wn7f5KmIzBSGwAjAxMKL/5WhoZoIiEa6FOztIQtXGwY=; b=YPxQHTYm1v87HtTDA/dxwCG8wW
	0AJ/0cqRRl8gdid06q0oUAT0oOZK8G3Hnjy6a6LP7Op8B7pEhUQ21qgheLnIMd+Vn2biT9t9sbbfA
	HI/4KKZMsfx9K8aa9KlWwCGOl6Fwmyx2Kwwta6MtCLc9OkppB5Uh28EYnGHrfDTSTua3zmBMgPvBg
	GKKl9MvJ5QtO53k9XCOQY6QpFvDAg46sLFnRqZHnvRbbw5nX5OS9jwme/vKm4QD0ycB4tciRIwh7b
	9lnBOBXKtVY/e9D0AubyBghVikBqJ7KEHnJnZQetPNbHVRYM45Tb+lFrXXFnLHgIN7avSgtm7L5ec
	SADtovOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thm84-000000036LY-0dyB;
	Tue, 11 Feb 2025 09:00:28 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thm1j-000000034l3-3FHp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 08:53:57 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-38dd14c9a66so1307524f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 00:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739264034; x=1739868834; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wn7f5KmIzBSGwAjAxMKL/5WhoZoIiEa6FOztIQtXGwY=;
        b=WGBgKwnjf6L+8qEJ9NJ501qRU29QOv25TQRxAt4UqXSv5FszmdJ7Y+rBGgIrt6ZtJA
         HX25CNsSLJUaJ+AHb7ujxkFXuXBmIwqbeb47M7oHPA2+Eiec1GhHmqO6w8qT783A9oyv
         hG7/lS0ecTY/b2zjb8KTVK4dqor6ZgwsjEjTyU/jfuQxWNncO6fisUiabOlMD0YN8ACG
         WcxpgRE4NEjOdA83yGCtwfZTvcHS2DosA+fitx9c4hFpoeJQnYAQljeh+KMlTOA4uVft
         4VdYMzcNqm0IiuhhqyC2wV92t8+sxPFqESXH2EB5FvskPpYbHScem+bqkCpPmwgb8A1B
         6yOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739264034; x=1739868834;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wn7f5KmIzBSGwAjAxMKL/5WhoZoIiEa6FOztIQtXGwY=;
        b=gcVFPDF2Wwhb3USqyOnzQZQ/xm+KYOqNPa3n4dR8drqskbKu4+dWi25NNTWpPra7xY
         w67YrGwEvkBxyJF4hV58BfA8RBv2w8QuYJIGapCRF4tho+8vpFc2Uu48vhkXe9qYqnWg
         UQZsQ/lFJZEW/XibGfs4nshFcCpBuzxdIvLbKvcDARzcWoQ7jzl9EJv9dmb7JGHOZ0Up
         0fASs0bmRiIZ4Vs3E+MMTVeFhyQ/6atzlkmBkNueN9HO9AZbyT6Tnpwm8GwiIXQCeh/6
         v18poZWDo2xbsdgsfdQCSZa4Ywzi3oHdv2F5UBgzhv4FoUAvUiwZx6wDsbKe13plELpH
         IhPw==
X-Forwarded-Encrypted: i=1; AJvYcCVFKgLnwAV2VdqfuY9n0EUCuca2vEO1t4jteGjwSUlSVXYwNz/B1Kh1RRs2IzKFObmaBgZeVFK1Bpu/dTptEBgh@lists.infradead.org
X-Gm-Message-State: AOJu0YzxIZe0Rk7B8x7DwKE/p5LLmxJq1GXEX8yhZeT3j4ZaO3cwnqT9
	dSWj4M/nBwvp+niZVxmTWckSn37LhRVpE6t8RKGqeWN1ElNcTwDQFh34JgqcMLg=
X-Gm-Gg: ASbGncvMZwueJTWZvLJitW42Zz3o1Pr0Ozf7Yk7BG6zK5Wp0S9A/CrJcNTqcL0niabr
	sh8G+Tz/rN1U0QS1Vy7Fdwbak6w0DmSm69bX3D2sGxOXUbLVr5P77N68dQckh3EUMCV9yVwaaLw
	7gAasBLIesK+lmx2FznZ8lmgIikV5uooBE5XujsOcyvd8j/AiF8LjR10Q363v3PhMGarWpLMgu2
	jkJm7g9VUEA/dKL2hErvpwmSXQ78BnX9K2ZNv+t8FcGe91kfFSICjslWBz3/Y5gBPpj3GNEb7SN
	NKVjqNy5uye0I6sFxxX10oIDfCZ4lEJ8TGiFq74YVQQAkIe1Z4P1NG8=
X-Google-Smtp-Source: AGHT+IHJl8az0biIroaElZQMVe7CvDinXzmDIW3C9slxWarkLuaunRbzDNQ1/xMc93YOJwVs4z36yw==
X-Received: by 2002:a05:6000:400f:b0:385:fc70:7f6 with SMTP id ffacd0b85a97d-38dc8d985c8mr12045557f8f.7.1739264033847;
        Tue, 11 Feb 2025 00:53:53 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38dcb4410e6sm11284454f8f.8.2025.02.11.00.53.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 00:53:53 -0800 (PST)
Message-ID: <843953fe-4c81-4176-845b-0ce9ecb0f84e@linaro.org>
Date: Tue, 11 Feb 2025 09:53:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Thermal support for BCM74110
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 linux-kernel@vger.kernel.org
Cc: Markus Mayer <mmayer@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 "open list:BROADCOM STB AVS TMON DRIVER" <linux-pm@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
References: <20250116193842.758788-1-florian.fainelli@broadcom.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250116193842.758788-1-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_005355_812512_4A02DC65 
X-CRM114-Status: GOOD (  12.12  )
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

On 16/01/2025 20:38, Florian Fainelli wrote:
> This small patch series updates the existing brcmstb_thermal driver to
> support the BCM74110 chip which uses a different process node requiring
> an update to the thermal equation.
> 
> Florian Fainelli (2):
>    dt-bindings: thermal: Update for BCM74110
>    thermal: brcmstb_thermal: Add support for BCM74110
> 
>   .../devicetree/bindings/thermal/brcm,avs-tmon.yaml    |  1 +
>   drivers/thermal/broadcom/brcmstb_thermal.c            | 11 +++++++++--
>   2 files changed, 10 insertions(+), 2 deletions(-)
> 

Applied, thanks

   -- D.

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

