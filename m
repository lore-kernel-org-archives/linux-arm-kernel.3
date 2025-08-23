Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00FECA0FE8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 10:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ePE9Dw20L6SlufcmjpXW4urwfW8Opv/KYmQhGsNogQA=; b=OhTQQi+ZeuXtZZ23FHbrJNxJZA
	fSPUvr2+Igs0AZSAhPbWkjtCCgTHdWIMu6B2YuSD31b5lZXy5eRi58eLl/G2x+IpvhIQOhTIRpT9p
	J0oTHKdd8JlC+lKEnlMK9CCcgt83GNUgq7g5crGf2VWGdyeGNc/fnavofrk0w5aI3VMKsPtGskQpJ
	/SLeOn4zDsajMC6UPTyuQ4iscYsew+MHI1BswsS8t2UBn8CaZ/E/8Gx2F3EiSnrWk+fLhRjj9MmAd
	qopEMcv66gFHlou5vAdDHwejKdQradaIQNarNVo7o9E0LLYSES+Aj3Y+ilPHIEkmNmoO3htSg0oAk
	pVh89tgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uplLV-00000004cvN-2Pen;
	Sat, 23 Aug 2025 10:19:37 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upk4s-00000004PiH-3T62
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 08:58:24 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-afcb7ab87ffso39791266b.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 23 Aug 2025 01:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755939501; x=1756544301; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ePE9Dw20L6SlufcmjpXW4urwfW8Opv/KYmQhGsNogQA=;
        b=K6QCMHRnL+J3S+7xnCdHLQXoAeeIZNRjWiE+P0CyW0pRZvfWH9ReA0s/1LUpP7qhHi
         BqhJ7ZEHL6RsZbmBfEcQ0jGZgyedDBQb2lifAe3ouVkueunda5tNyzYtuKcjGdVBc3k4
         vPpReNTes4YXQ8UjU2WJIJlm9z+QCF0Y4E0AqNNYg7LDGUu5ixR5bP4mT6smELp/niyy
         EOsOYCnqTrpn9h5hzS1vxDg62q7Aq3jJCgCvTAIyHvVF6hJs9HCL97xu3HM08c5qrmJz
         bxXO+cJFYYZHRk1f8KvFSTf5Iiw7FXWWA+l6S+uwd1lQJ5N/d/+JO2I94AjheTvDxHRk
         EinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755939501; x=1756544301;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ePE9Dw20L6SlufcmjpXW4urwfW8Opv/KYmQhGsNogQA=;
        b=aUZI1Z2DchvcD0JGOqyqSITMBBe4K7leAM82eabRxEXmKxQSFPGygg+UB1ih3/xP+D
         7I313+RJ+yM25RZ3ahO5jMTpawa7LpSjYZrACkjWK18txSpKqCLTiw3aK0u+DAzVV5Cf
         /LKqUwMoEUkF36WQDtKCqdprLY8Y8HldkmAYZLvWdS/xkZ+tvjCdQBJ4VGrxGuVRyDx9
         SRO8lcoydwhsKFy2eEjhvVCiZz+UiY7q0sAhT3q3AK1XaVPDWLhLbI3ZUakOUqmAnb7n
         AUSuE/ojNFPHiFXAV0QOZcQwVf46fNFMsKOZIKiGoxFRKGQEUwyVM9KcAeef9pHKafki
         HxpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtmzRqpssdYxUwc7HNMd3YKFGeVW/KK5BKOGhJDocPNS+z1flld21siNofm9e6xpyy2AVTZRPSxo6qLxv0HhbR@lists.infradead.org
X-Gm-Message-State: AOJu0YwQ8CXJtE0PbkQClei+53+e2/1BBSqto6njYGn2LoAp2tU7LNU+
	MlC2IkoOP5qoRc6V2t8ePtfO5taTl58SPY+ngVn7NgegUBTZ9Ob7kz3WF32VCn9YXyg=
X-Gm-Gg: ASbGnctcVV+5U6xbaU8nFbAL5JcME1jIF4rhPwxYIWekjvqHUMsYEMihyJsu/QHTN/T
	u10g4JTkHMy+CQpLaIZ64nY3GFiO9cmupenPeGJh4k4QfWymyDNRDt8oOtz4pNRq3vqVsqEpAC0
	8mVuPHUprXQ45q37nG5fJ+QzUB6N9w5yIYDI9JlmA39lk3KA3SYvoqxQgPIlQBXH1vFKtVreB+o
	1pF1bgm1mXQPTIZflFJjcSof9nOLE+2u5uSIPAQr83lFcaSzYn5BMe2JnQkXTnDSPDV0UzE5p33
	GwKtcHML5m3/XzXOTaWOUFvKi/aTVGTEGcp/+klCcnPNGKL0zniL8N0E/RB2C1wp+ugKn4hpd60
	2qAQSC50ZMTvhhoH+GFmuenR524jj97SR0lpxjf4KUq8=
X-Google-Smtp-Source: AGHT+IE5Kj/tNqfuyToKzvzvaC9n0CcN3DlFEwwJPvxFSpgq3gCwweIjYQFV2Y8GFhKp2y+Z1KhycA==
X-Received: by 2002:a05:6402:42c7:b0:617:d608:86e0 with SMTP id 4fb4d7f45d1cf-61c1b217ddemr2487383a12.0.1755939500828;
        Sat, 23 Aug 2025 01:58:20 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61c3119ffdfsm1245064a12.9.2025.08.23.01.58.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Aug 2025 01:58:20 -0700 (PDT)
Message-ID: <99f27c6c-50d9-4290-9a78-c3461a136798@linaro.org>
Date: Sat, 23 Aug 2025 10:58:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: mfd: Move embedded controllers to own
 directory
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>, Tim Harvey <tharvey@gateworks.com>,
 Michael Walle <mwalle@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jean Delvare <jdelvare@suse.com>,
 Thomas Gleixner <tglx@linutronix.de>, Lee Jones <lee@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>, devicetree@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-sound@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Mathew McBride <matt@traverse.com.au>
References: <20250822075712.27314-2-krzysztof.kozlowski@linaro.org>
 <20250822204027.GA319356-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250822204027.GA319356-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_015822_876971_CEAD6495 
X-CRM114-Status: GOOD (  12.17  )
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

On 22/08/2025 22:40, Rob Herring wrote:
>> ---
>>  .../bindings/{mfd => embedded-controller}/google,cros-ec.yaml | 2 +-
>>  .../gateworks-gsc.yaml => embedded-controller/gw,gsc.yaml}    | 2 +-
>>  .../{mfd => embedded-controller}/kontron,sl28cpld.yaml        | 2 +-
>>  .../devicetree/bindings/gpio/kontron,sl28cpld-gpio.yaml       | 2 +-
>>  .../devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml     | 2 +-
>>  .../bindings/interrupt-controller/kontron,sl28cpld-intc.yaml  | 2 +-
>>  Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml | 2 +-
>>  .../devicetree/bindings/pwm/kontron,sl28cpld-pwm.yaml         | 2 +-
>>  Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml     | 4 ++--
>>  .../devicetree/bindings/sound/google,cros-ec-codec.yaml       | 2 +-
>>  .../devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml    | 2 +-
>>  MAINTAINERS                                                   | 4 ++--
>>  12 files changed, 14 insertions(+), 14 deletions(-)
>>  rename Documentation/devicetree/bindings/{mfd => embedded-controller}/google,cros-ec.yaml (99%)
>>  rename Documentation/devicetree/bindings/{mfd/gateworks-gsc.yaml => embedded-controller/gw,gsc.yaml} (98%)
>>  rename Documentation/devicetree/bindings/{mfd => embedded-controller}/kontron,sl28cpld.yaml (97%)
> 
> Who's the maintainer for the 'embedded-controller' directory? Fine if 
> me, just need to know.

It does not have corresponding driver subsystem, then I guess you.
Placing above bindings, whose drivers are  MFD, in the MFD subdirectory
made it obvious. Now it will be a bit less obvious, but that's the
drawback of organizing bindings per hardware, not per Linux subsystem.

> 
> Other candidates:
> Documentation/devicetree/bindings/platform/*
> Documentation/devicetree/bindings/misc/olpc,xo1.75-ec.yaml
> Documentation/devicetree/bindings/misc/ge-achc.yaml ?

Indeed, I'll move these as well.


Best regards,
Krzysztof

