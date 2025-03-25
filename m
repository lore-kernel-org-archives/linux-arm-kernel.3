Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9B9C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 06:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UpkYXileyTcIk8TFV6as38CU1iJIxbB4fpN2GYjcrIo=; b=BGcN6VlWMFaXU/nRNe+HOrk+H5
	i5dBwu+c71VMJV55a4zwXGqYph8cKeDHdOHxaTwJ524wCCk0NjtPfp4MmvNv4ZZyhDNRpManqS9f6
	F2l3ylbQwGz5S+r0YbJ+Jw09+aNxIwEv/8s1M+nTSAzNlYYLsZoh55NYPRQhEfxCyworyBID0NNy0
	KqcGHHL1Gv24Wdwr07C5L9gH+7GTPoVE7jN7ls3PjVK9O8XPM27ohKmlwJyz7q62NbXAJ/uEcX6IT
	FNjqjb7EeN3/ME9i7NMDoBMQekgYzmhMEPqKNFO5NCUrR5uqlJphmdF5b8c+msS0W6ZIJhf9fWybQ
	ODnIbdWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twxSZ-00000004weU-431y;
	Tue, 25 Mar 2025 06:08:23 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twxQq-00000004wSU-3IZm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 06:06:37 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5497e7bf2e0so6051766e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 23:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742882795; x=1743487595; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UpkYXileyTcIk8TFV6as38CU1iJIxbB4fpN2GYjcrIo=;
        b=jP03EJDNBoR2Gi98UnXb3UA2+9eb7ElJZSDyi5zT+XvsnyLa7td19K/krkYv3Wd2pX
         G+wLCgVYYiNzd3muTlpbppZN1J4LOSi4SiZMrjNTJwb6VrfCxFDOyjFO+PivEJZQliYP
         DA973/gxi+M8OBDj9nzCK2LYcYMVYkUDOQEMxVKWlLJA7J+Ue7TjlqDqJCzrBPlj2DUq
         +LsiMWrszlb4asdJ/WrrJxqb6aoCRYNDTW4ZlWeMO9S3uCRlzO7JFQWVQrjAQhPWtJjl
         KGG9Jadz5J88/WVBiMtB6X15rqgxMTK0Eh6/0zzLLfaSm6GKwUUPO8ZztxL/I1Sn9zG5
         /g3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742882795; x=1743487595;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UpkYXileyTcIk8TFV6as38CU1iJIxbB4fpN2GYjcrIo=;
        b=guuxsV9KWlNO2ZdFx4BjPxzJWlw7Vttd2oIvpw8aL9Xj23lyqe02fGNZVjX8WvgnX/
         LylPe+yeG3hD5uWOBiLq6XE0Oaz+XL1CQfRNp1KveTPjy1mOOBAP0yRzKdrb9/vSAnWC
         gsOQPdblkvXn5kRbVqG2wdqdEWX+D0cRffWdrQ7iG+0AVABCW87xG95Jufv0dEQgrPWh
         KBmKgFWmqFqt6+HLMQZ7QMc3MtF/TnP65oO+vHHKpzVeMIh6AqhDkfLAtKrXlmmvri5X
         vgveABcTlJNKjpqTt7hibJkjmzNx9F00RiMuTARmE0K7kLH/tLUYU8KM3xMVlZna0ZhY
         xcIw==
X-Forwarded-Encrypted: i=1; AJvYcCW5pUi3PU8Vd25jnniP2KmFTh7PdXzHU5dqPUigoFH2RGVPNX0Ay6gqvtreCVhXWZRCk/nDVnR+rxC0eAHYkeR5@lists.infradead.org
X-Gm-Message-State: AOJu0YxlyNy+z+Nllf9hUDSdBdVOutGXE9LlLjjj3MpzShOsQL4RTOoP
	AnVZSS7gU5MJOkGsVDbj9d6PpYyIfWvZFPle4JZMmA0zJczHQcnj
X-Gm-Gg: ASbGncsBOEK/kzguEg+L9fZ6nKh7X+rN2fZdq/yK0I7DN0zTZBcChb6Hma/x3HJd0F1
	qcJtsMkgtvr/suN70k/YLqegWOr7El9Awgx8b/QNIdeLFj5dItwEq+aQYjLrGSz0uJZEPaOIGxS
	pJHYPAgevb5A6erwKc0P/zPt6cyngDc8mGPcyfiKbtU9gZdiGMTkv8dOhLi/6DhBx/wi/tOHlZ5
	BwZ+T8B8C1gi9lk9+lciVIfAyk2Y5uFcPzf5splsdZVDifdqtSWMd8CLmP0V82hvZUOkQ3UyvXB
	c9sht9I6LExpazbCgsaJzeTnWi/vlQs+vpOeYCwc5KzRQeEAevoeUyF43NIWtnpikcZV4ejDQeJ
	TnhPHagpVtglKHxQuBevmE3SBcsHxYaBX0mJg
X-Google-Smtp-Source: AGHT+IHRTEer1v2dD1wPBDR8uDVpWnU/Fj1Edj8fXP52s1Zi+C3mR/ra+yeS2GT0K1XmpsBuk0gkKg==
X-Received: by 2002:a05:6512:ea2:b0:544:ffbe:cd22 with SMTP id 2adb3069b0e04-54ad6500d8fmr5018858e87.46.1742882794350;
        Mon, 24 Mar 2025 23:06:34 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad65037d5sm1368146e87.180.2025.03.24.23.06.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 23:06:32 -0700 (PDT)
Message-ID: <007c6e9b-ffcd-42ef-a3f2-4b8fb62e99eb@gmail.com>
Date: Tue, 25 Mar 2025 08:06:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: iio: Use unevaluatedProperties for SPI
 devices
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Michael Hennerich <Michael.Hennerich@analog.com>,
 Kim Seer Paller <kimseer.paller@analog.com>,
 Anshul Dalal <anshulusr@gmail.com>,
 Ramona Gradinariu <ramona.gradinariu@analog.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Robert Budai <robert.budai@analog.com>,
 Petre Rodan <petre.rodan@subdimension.ro>, Andreas Klinger
 <ak@it-klinger.de>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250324125313.82226-1-krzysztof.kozlowski@linaro.org>
 <20250324125313.82226-2-krzysztof.kozlowski@linaro.org>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250324125313.82226-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_230636_833822_76F38DC2 
X-CRM114-Status: UNSURE (   8.02  )
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

On 24/03/2025 14:53, Krzysztof Kozlowski wrote:
> SPI devices should use unevaluatedProperties:false instead of
> additionalProperties:false, to allow any SPI device properties listed in
> spi-peripheral-props.yaml.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

Thanks!!

