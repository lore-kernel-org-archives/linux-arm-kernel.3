Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B935CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 16:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ukJvVGY67SRCEDRTUAiknYRlpJloxMFuVeYboh/clkg=; b=gwedVtMDSre8jlx8A3ySILdepb
	J7Wtvi8GrwnrngcYqwLjLZM9jGCcDa078xzdaczAqSq1AkKQl0NzFx+WyXG/jqw4+Ese5wyXAddz6
	iy5MLhW8tDrvMpwCMjixHLP13IPkEfosYQVqt7FUTyWAZrr3/cFwuMytsQzEkdkhIB+Rdknx/B1PJ
	CzsafQUk24mByVtCrido11rqgDVH5t4tPlaEda9VoxSzJzKoJprmhMKblwacy5NKo+Rl61n30ChDn
	oUXyCj1Ji14oiXYl1mk2VA6bKPiH4OZXwJ3rHhe92NbD1DLl8UrNTY+TRdj1NHxQSf2tL5MyM+9R1
	Z1V9vh2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulVVl-00000008Qej-2dE1;
	Mon, 11 Aug 2025 16:36:37 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulTN8-000000080EF-3TWi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 14:19:36 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-af92f13d27eso51679766b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 07:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754921973; x=1755526773; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ukJvVGY67SRCEDRTUAiknYRlpJloxMFuVeYboh/clkg=;
        b=YFO8v4drv0we0RzITEQbLxx4b54pakDtdU+bWJO6Rz2pW8FReNnhzJHPnfB9sKchFO
         R9GOYn/DIKUbMZPYYEgtBWnc1Akb3Qr9XxHtFxPQapAe8hYT3kQncBW/eZX3i2ddU/L8
         a2d66xIgbg9n41n8eWx2cqW7BCYA/oPhjq98gFLpchGeWmwTtQB3HWJMNEkIKtgzj41X
         cvxhZNa1ctLJDo4moCFuWOkEv42L0bRTjMrEg4wYb91byjhaOlNU3HKnCpl1MN+s6BPj
         ngYqxjyOSY8jMYeFx8sKGANZ81lAAnR3XejaYwkLMKBPl51FdOtOHeYcfJwEgOK2JCkd
         a8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754921973; x=1755526773;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ukJvVGY67SRCEDRTUAiknYRlpJloxMFuVeYboh/clkg=;
        b=D1BCHLiqD9C2NqNCGprpEP4Z/392ZEd5W+GrQLvM7mh1B5sOLu1PyJxr6z6JDVQwmH
         GKhmuuGkq0ugErlRfEhszGA4xkujcM+dc9SiQ/TPx4htY4lSa4pSf7XVUFbtHMxzOx4b
         /tJUEQWWe0uLOaR15x9C41oDWazUICQyySBYcWZZdJeJCfTR4Ew/qVVp6dGp0RMe5CdP
         URs/esrQ8wqFNtJ/s8DINojvP8y2Sk8vRhlu/u7bQVQ/HlOdkLMZa3TCBRDpE4ry8foA
         JrrazMe1IMtmrae0qx+LRBvv142qXSREv+AEQQNsuVTUZ4F7LnPM9Ig3aMMwBpYq56fy
         25XA==
X-Forwarded-Encrypted: i=1; AJvYcCWfGoeAw3hoCyhlkBf02fUFfRMfDB/DZFpjRXmhN75aC1K3epFs6wDfIJBpeT/qrdvNOuTtx54FRC4Hui3iKMOl@lists.infradead.org
X-Gm-Message-State: AOJu0YyE4QqyCqWz/9Na5FZhGFKFUz+xbwUcUxCu4W1jmuyMoIX6AVUg
	5y2o9Y+H2wE2aFImddiXGqEdfI9KMdk4ZcH8YTDbmwOjTl5BIkw8nkyeVHldR0VP8uc=
X-Gm-Gg: ASbGncundnU7OSUGzY0f2xsQarLhcirUw/NPHpjiezVWDMRXrIDBQBFyfaQVgjTgqVH
	3TNjfUnv1/cd1JLsIF0UtE3Y96UB58eNsM9wdZY40yMyTmp0F/ASguQHc7KI006oQB4xiHgR4on
	5Lo9CBvpmSsrzee2dejJEZr6OzG14UmSPsr/pO7ZAq2W+CZklipP91pjDyJB2oOIOObDeYwD6Ex
	PBjeKrEbBQ6XifGXllRmjtG7lHJ90idyndCwz1QPPuD/L8sc2jqgWTkcVRD5GuoE9cPErPh6Wdl
	tP4Kb2OoGgSUgGFybTptY6324DgL1eLdW4FDsMGsK5pmMjJbGfDJWcE/1H9DZDDLRz6iV3Q4HsO
	c+f+KDgxllKN0PhXh8IJlbSqjjw2JAELmlcTHYm+5s4M=
X-Google-Smtp-Source: AGHT+IGISlXXKbNN4WBuSR8PDVvMccroTXbeDu/hTumwuwdfw4oDAbeip4RuSSQ7J2kZBKfEYuZPlg==
X-Received: by 2002:a17:907:3da9:b0:ae3:cd73:efb9 with SMTP id a640c23a62f3a-af9dec80ca5mr366356666b.12.1754921973223;
        Mon, 11 Aug 2025 07:19:33 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a3e80sm2042966466b.47.2025.08.11.07.19.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 07:19:32 -0700 (PDT)
Message-ID: <6203a510-da79-42bf-9f85-7a2092b5057c@linaro.org>
Date: Mon, 11 Aug 2025 16:19:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 2/2] dt-bindings: phy: fsl,imx8mq-usb: Drop 'db'
 suffix duplicating dtschema
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Vincent Knecht <vincent.knecht@mailoo.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Li Jun <jun.li@nxp.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250811-dt-bindings-db-v1-0-457301523bb5@linaro.org>
 <20250811-dt-bindings-db-v1-2-457301523bb5@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250811-dt-bindings-db-v1-2-457301523bb5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_071934_871533_AB3E4565 
X-CRM114-Status: UNSURE (   9.89  )
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

On 11/08/2025 15:54, Krzysztof Kozlowski wrote:
> A common property unit suffix '-db' was added to dtschema, thus
> in-kernel bindings should not reference the type.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> RFC because this depends on dtschema changes and should be accepted
> after new dtschema is released with this merged:
> https://github.com/devicetree-org/dt-schema/pull/166


This note is outdated - you can apply the patch.


Best regards,
Krzysztof

