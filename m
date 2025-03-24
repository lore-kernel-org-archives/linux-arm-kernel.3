Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 732E1C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 16:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wZEReYFBLgPBx6msQMgi21dW4Zu9uLX2ewii7o9t6CM=; b=1CX2ZhVDF3TtoqomX1+ISQnWD8
	zkn6kI+qyWEouCEKpAbWu6gOiYsK15+O+33AuZpUad2DctPqCgiJDeoLpgt6BCRpUoqn6qclaESkK
	EqzhvSohbml7dLN7SHZlONhNECtR+4D6+BqZCWKFOa3c1jN/Ny26HwKgC4FlWVtSEN31mdXXV/+kP
	cZ4B36B4YR4RYyA4QdODdI05Uyqol1dx/TSoufhUbBWjF5cqmBJCJ+LQ8SldjfvraKFXMxkwx93iE
	kVCO59EVGxg81SevzEtwT/fWrKPB8lFC+wAf7zyB7xxO5Ke17MZwOYCNSECX+6xYrnUC8D9jFfXdP
	dSh93C9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twkhL-00000003eYI-1Yde;
	Mon, 24 Mar 2025 16:30:47 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twkfb-00000003eHa-0mFP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 16:29:00 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43938828d02so6926615e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 09:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742833737; x=1743438537; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wZEReYFBLgPBx6msQMgi21dW4Zu9uLX2ewii7o9t6CM=;
        b=AtJ7tIJ5EBhnX/mEeZxBzN1ejPVo+dMAnyu+4iBMbbSwVsaFxXTxATwy2Q8Hdsq8Hi
         lRd3dQ5hTQckvqCvd2QU6cWTi86J5c2kqTyIUVM7Oy6dxnAR4mL0FJZhhF4HnAAGbQ1j
         p94zV4He9Ey8Wkr1hWliyDs8lesYuvx6MzsEmTlkI/KntPaMgzlt4+33r5ml4L68TA+A
         I8nOIlAb1MQ8pQkDyZoilA1uvoqEDjaI1V5pD9jr5sS7uS+jDmgHN+8Wnvj+uLK+3Zpp
         tLvss+ZuJPL5vvvfGiJdnCC2VPgTHohJcYsj8eDI8dw0276gLc0utyZwBAcew0oyH7QX
         /WyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742833737; x=1743438537;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wZEReYFBLgPBx6msQMgi21dW4Zu9uLX2ewii7o9t6CM=;
        b=cydjW74Uya7pJ1i6xqoZlINdPf6Q8eb4aSPILfWlFBT6j4bV2sgPTkdbAeGlzcElTw
         JkFi28QaPSfSLDms/akbTNdittS1v3gaxg8tumV889gcfsUo5LygjGDgpR+jBNUy/QLR
         HIa8tpU7QKN1IazYagImlbFaXz083VXhRmsUEypW1qhGZ6plAERj9CCP2wDP6jU0nxOe
         k7CocAAPVqXd283kp76mhlDpOSqTDqdGjkUq2SeN09IhJNlMVhPzeFlq47V2xVdTJZM9
         4P0SIsc/EjXuJkSZFcfM/mYkcUcqzdm0KWfvIP/yOG2dCED2033Asj9BJ8gUPlAIZOzH
         IphA==
X-Forwarded-Encrypted: i=1; AJvYcCUiGtycOnnlNKcgks996NwEv8jd6izS9CaC3WQBdmjxLTTaUR01KyTQ7HCGCDkwx7H3704ZQQzDlWBXNgZI/VOt@lists.infradead.org
X-Gm-Message-State: AOJu0YwuP7xZdLZO99NlBnPLxcvwtdWyRXEWCYU1ZmXutfYuLg/42T4+
	oPRZ6sHQTj5YpUJUNTLtGZ9PEMFKvWIGuVf2b2u7WivAQ1gjmo8lsyoEqYrzsR0=
X-Gm-Gg: ASbGncsIMplKffBD77cR/BL7KIMOk0NoyD5uikWLL+VE5Q/aW6DWtW1JMjX7mX0qt03
	FbfhDpf+S8D21HavhW0p7eN1cshoy6r0a8ngA0YJgsr0zyQyaEi6sJIR2Z/DvKQnop3CS/P3oVy
	VygMVu6AQGLql7h4w+N2x9o6Iw46adOnxPSR0bzCbZdqOht0VEDgu6Aqugn7BMNeda2+N8qer6c
	Yy7i/GNEoKxDsU8O9LHkdKz7tCZq/7u3ViSwoQSl0+iCtgdce2Wix4Y7I6shqB+wZjA7wi7F0wg
	ouqCDlq8Elh/e/rGmebppHBvidto6JE3xNOK1yfhg++LvcXu4LwwclkqECFBEUk=
X-Google-Smtp-Source: AGHT+IFJIYkh8vR9dlTNbyS66WVsmBjsvJ1GO0jTZ0q/rIGpNF+C4dmPmFyT8t4LO/JNW4kAQQ/RpQ==
X-Received: by 2002:a05:600c:4e93:b0:43b:c0fa:f9c4 with SMTP id 5b1f17b1804b1-43d5100ad46mr44338935e9.4.1742833737453;
        Mon, 24 Mar 2025 09:28:57 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd26cecsm124700985e9.17.2025.03.24.09.28.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 09:28:56 -0700 (PDT)
Message-ID: <86a15b6d-6195-4b4a-9820-081f07fd72cc@linaro.org>
Date: Mon, 24 Mar 2025 17:28:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] spi: dt-bindings: st,stm32mp25-ospi: Make "resets"
 a required property
To: Patrice Chotard <patrice.chotard@foss.st.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: christophe.kerello@foss.st.com, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250324-upstream_ospi_required_resets-v2-0-85a48afcedec@foss.st.com>
 <20250324-upstream_ospi_required_resets-v2-1-85a48afcedec@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250324-upstream_ospi_required_resets-v2-1-85a48afcedec@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_092859_233140_00BA3544 
X-CRM114-Status: UNSURE (   8.21  )
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

On 24/03/2025 10:40, Patrice Chotard wrote:
> On STM32MP2x SoC's family, OSPI is child of Octo Memory Manager which
> must have asccess to OSPI's reset to ensure its initialization.
> Make "resets" a required property.
> 
> Fixes: bed97e35786a ("dt-bindings: spi: Add STM32 OSPI controller")
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

