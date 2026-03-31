Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1027FF60FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 10:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iTRjFtodY6zz6hsjwtMEZh9oRqLgaEJ+snOXbwMDaaE=; b=Nbxgg4y6HMZgQDz2CO+vmVTU8+
	WXJTw0XaCDuBhPtEsByUIHhTYfOieOhqzr8MwIKUQcXP0GLQ69pe7P7+66/6IRvMvR+LoHrivXqjC
	uGZn3APWh3tXdtL61sKjJFDTLXJz8hZGpFwyyvAAof9fssMKUZNcO7JuI9TnLKzoAzbqrTuoFDvKD
	dSCg20N/zMWnaISIa8FDBfOPxyXmQVrN/VTaq5bFHHsy6ax5fxA/cAlLmiFwqHbPauLNK6LIG0nVY
	3NDm8WkHMaQV1Gjf1d9EsPXacUVNWqeERoyUPPnv7RlwXffoMxuQbYoFVZN6cm7u4NUjLkihSGO74
	Nc9vLDrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7WZi-0000000CnrX-0gsb;
	Tue, 31 Mar 2026 10:43:58 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7WZg-0000000Cnr2-0PPI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 10:43:57 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5a285840940so729240e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 03:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774953833; x=1775558633; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iTRjFtodY6zz6hsjwtMEZh9oRqLgaEJ+snOXbwMDaaE=;
        b=p3yhb4vzDqcU2eGMleTGWkVx99cJVRSuN9wGRd+9u5rz1WEwUsej3spTpRzH4tHUfT
         d1eleb2m1Er3Z3WAdLocwLkvdd02mnh3YTyImOH9BxkVoJUcCFvNJ2fIkUvZJOmS/KBU
         MM7YINi5OJcFRqfKe3GpSI/AGKVckXlF1/JAGMyYwtEBYCRjr5AXC3zrQOXUrlUMG+Lf
         U44e3+mnosV4wFbWb4h6gwOUkIaq5FTIxdjbXPon4Z2B6au/JZJ+WFV0giSyo2Cbw+uG
         q8deFQaR7nhHl/fgkCgreE80ua84WsfKKzOuzBkdzIvCnrUn7Eq2eTqPLLcfuHY8yyci
         jUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774953833; x=1775558633;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iTRjFtodY6zz6hsjwtMEZh9oRqLgaEJ+snOXbwMDaaE=;
        b=RIBy20+6tNtCEoyAJnOK67G8iP8z+lpzFTcO75kletIWTQLWiw74bsmqLTtkI7vhna
         ZVUwyD/gvWvafaKfiJVqqsM6bBNzbXt1pbib/41HiB5Z/dAN+rzSfh5b9MxJxIHxj44Q
         NonvvceLk9tJfEgW2r3vV3ZIJ+8x8weflImY0Xn7MqfhdYvHo5DRjDW6sn+DgDfTK+pX
         mPUthwLjxvsuk2NvIQAkEvyaiGx/9h1T/zif7mJauyc+OTaZpTxdvf/tjYFBgg6Bf1xI
         0AYVpsGus5Utv8RiZyjbZbiyiMyrZc+a+kXUG0eBFuKPOKH4mlyp3jJa/sat5bMXEY1R
         pVww==
X-Forwarded-Encrypted: i=1; AJvYcCVJeYQq3YWUmVkFpRJPPWjuZ6KyYNPOB/tTcc/Ry9hakubR3+SJz0zxubPLafnvLf9JJ3F72Sk4PIiypaFfbkLw@lists.infradead.org
X-Gm-Message-State: AOJu0Yyoo43d2ZZ4Hb7OVm/Q2ws0XUS+QWK0I1U76WrmOS+sHbxRwXZd
	xRkV5PsOd1Cl0DkvrblpkkR6Diqc0brXRX2ZsX1CgmWKYILmzOOQDslpU6pBx0ztcnk=
X-Gm-Gg: ATEYQzyBX8Uv8nxIBVFBk6lbQhZIDc8nfy/wHDcg172iMfcjpKhBrVblRH9l3e9LRsx
	i5SdhI7rD2I9idJCCzrcbSTK73bEmOu4OebiHPY24kDaOlyPan6574oCx4MpMdJku3gAp1VRqxT
	RYxoVTHyPvKayRgILRPfaNqSQcTtiVFyzF7w753rusHSua6iMDOg6n4jgEPSMC8yUYLkUWdB6MS
	37iXfVT3FurgSjBhC0Qbi7Mg6EcNc0DWohSyg1KSrbf3P140bgKfZIDpLr/W7DiGqzx6OTzP2TA
	334nNPZWPRek55Ux8BPyLOMrs/7shktAxj4A3h9qpFI91n+hT0uKnMO4wKoeiYN54vVq0C691rW
	P/dQmyMKOKwmKr4K1GgFOwOQfUd7yjsfeLanpgHk/2Cg5/VQPqD7T2iIcHfBcyUd5BpAIcLNYxw
	TpJU8aaWmGI/iUzs31uXdOky+47jVnbWRfVJJO5C4t6yGYVZJn1rcyGr6q4z4yuLh6Fdm64+jDx
	Uxf9w==
X-Received: by 2002:a05:6512:4022:b0:5a2:82b9:afb7 with SMTP id 2adb3069b0e04-5a2ab5fa11fmr2488669e87.2.1774953833180;
        Tue, 31 Mar 2026 03:43:53 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13fd008sm2350070e87.19.2026.03.31.03.43.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 03:43:52 -0700 (PDT)
Message-ID: <040edb24-3689-404e-b16b-c3ead54aba19@linaro.org>
Date: Tue, 31 Mar 2026 13:43:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: Constify qcom_cc_driver_data
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_034356_151704_93D98E2A 
X-CRM114-Status: UNSURE (   9.46  )
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

On 3/31/26 12:17, Krzysztof Kozlowski wrote:
> The static 'struct qcom_cc_driver_data' contains probe match-like data
> and is not modified: neither by the driver defining it nor by common.c
> code using it.
> 
> Make it const for code safety and code readability.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

