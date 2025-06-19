Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 701FEC71159
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 07:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IymuwWFz5efXWH2kgyyNSxlRPSBhBIlq8B6srm/Era0=; b=4bjFwzbG65cYr5P4J0kLCzjKKQ
	/yuSRTM5Gsd/xiXbKTh1tMYDfcx+AlhIxOgSih57IgbSti5leX8ObD4NHsu7tmOZlUOd+COW4+u5q
	+RsiS32r9vjFYe1RoaFvNMNdtWjbyBD3F2MJ+ATHFpQIn/E/YD9kbU0DXOZHUmhd14l/4L560DvAf
	IGeVHau2Sb7CoT3UlK4XXMl8Kt8FnYB/fAGy/qGVj1bPbLCUs5oh0gJL0Zw8RXdYF+V2FwMb2EIEc
	4pPxwhbpg4O+29K81NWBoguJC8IIszm0fr88Uq1IuSsTUSGXunlkuLFNU+fIYCGXAl9+1vK+Qajx4
	8Jjw25pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS9oX-0000000CJUq-25et;
	Thu, 19 Jun 2025 07:36:01 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS9MT-0000000CFrB-1xhP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 07:07:02 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso588136a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 00:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750316821; x=1750921621; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IymuwWFz5efXWH2kgyyNSxlRPSBhBIlq8B6srm/Era0=;
        b=sVUmz1eRf0fbkZwGTwIV42pjJw0f/jBu3DqVo1TJiJCKNrVqokb/52ZtgMP3w520QV
         3f0bCTKwoSkC82PG4vxj5nUiqpGuYiHgFgqDPrdL+Dd6wCAxEE84zScAzMHcOwaWJBss
         vYNRLv1aRhZS9C5+s050TL9banyftFnMnnqVaHEII+M376SkniLIJ4XwqcF/Pw/vdbS5
         LPEgHOBpRyNCb7PSXzThjvsVO4WDvWNf+JROMANxpCRAUxi5S6KZ8LAvMzF7vVQFgFWr
         lDKiY7p4lfx+/c557ksAAwbivklkTzr0rBsBFS4fY/Q3GCdRiT+J0+GREpUtIrg18uoz
         B9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750316821; x=1750921621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IymuwWFz5efXWH2kgyyNSxlRPSBhBIlq8B6srm/Era0=;
        b=LgYtzNUqV2P0EArCPS3FUA4nstCwXrKtPTBtt/FIh5p8MgUr3JXCX8RrM2AqmCtgiu
         zDh1obHtOpRG3NPOhPBKnFD3DeX8FZD5zFAPT1DP0uXPXcru0cF5v9Ktd/YnpT8AQzNj
         3ev7yM5cB+CyoMGc6LL1uscAT2CuS+dGlVa6FQh2LEVjKZQDC1JutuTjZdgmZI8V02UZ
         5r27q/k8oMRwyZZJStrXDntoO2EXn6XDs5Yiz8m48/q5Rbrvcdo9e0myt4sO8EcO8iwH
         Yh2bY54AhB3OMUuVW35jvPeCmuZvaVFD5m5WYhW2YrVuHOiu2m1/eFxRG6pUmRQzlixS
         Cu9A==
X-Forwarded-Encrypted: i=1; AJvYcCWK7u9RMp5T1knmgOcnBOFaOV7MzdwDk3TpAbf+as4rsqE36W6PK+WbKDt5UMUVVZsJxPdJ23+xSWmAoMVA0crM@lists.infradead.org
X-Gm-Message-State: AOJu0YxKbzaalwXea9oisXazNe1jr1OkYm30Sk4UdNlXZDUOlwS2rRYn
	yGs7/Q/p9pIxneEGjRFslEFDzbLoPcw+Gj2Z18Y7jR76w0CH2q4eX9/Kmiuar3VlaNg=
X-Gm-Gg: ASbGncu43hewxvp4KkbxD1KbBiht5rxCF69Ai3eNIUugbpMXvsUbtcg6CZOQS56XzVI
	Kxc3LFr5WCDGlNVejKHXy44Xy9RHCrUpT8vbNIM2RaUlGQ9y16qvlUgZS39/bJrz47HXI6isTQ2
	rVOhPQtQUuJuSpc7fNThLvHRapuZ1HfmZnf4g1OhKcJfkBIkvhbPpzNCL8rvyAjUAe9CP6IwA2x
	2RyqDYV3W5+5XK17DIRs9lWzs6tAwNAxl70KYgWwhZfpEhI55Fjs+dSrVg6gy3pfMYAze+GIZnS
	NkOFyS2RiUWwA/6JJRq2Av1PUnbb2Il6sQT34KKceG9l0tXjUyjQpxy5MSORK/M=
X-Google-Smtp-Source: AGHT+IGyYaOKIL36CbVXP5wK2R0Ni0YKSM2IJpGDucT9Et2S+y0DrU3AlyTGX8LLr5798o70TnJH/A==
X-Received: by 2002:a17:90b:380c:b0:311:baa0:89ce with SMTP id 98e67ed59e1d1-313f1c06bf5mr36604358a91.12.1750316820675;
        Thu, 19 Jun 2025 00:07:00 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a23e627sm1365892a91.18.2025.06.19.00.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 00:07:00 -0700 (PDT)
Date: Thu, 19 Jun 2025 12:36:57 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Markus Mayer <mmayer@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: brcmstb-avs: Fully open-code compatible for
 grepping
Message-ID: <20250619070657.dshqwhulzadxpyz3@vireshk-i7>
References: <20250613071643.46754-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613071643.46754-2-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_000701_516574_8FCE9467 
X-CRM114-Status: GOOD (  13.02  )
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

On 13-06-25, 09:16, Krzysztof Kozlowski wrote:
> It is very useful to find driver implementing compatibles with `git grep
> compatible`, so driver should not use defines for that string, even if
> this means string will be effectively duplicated.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/cpufreq/brcmstb-avs-cpufreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied. Thanks.

-- 
viresh

