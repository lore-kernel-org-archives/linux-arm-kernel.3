Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B8BCD343B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 13:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=21im18CnslCvYwXS2NJ84S3pXykaNCx3/vuExYBK0cE=; b=1/+nyQYvcnew6XqZa2PhCOzdwK
	pmxQu9WsJiSQq70hrvEWtyX/VyIC7gFxPkk1mzwrxfMPnYyaK/IMtQB+hZWDRoGhEK0tLuPEx9wkJ
	nDJ5ThaAchjrrchdBpj56ZuXEcHfliB1IB+IkqOsznUX9bPr2gbYng6sNC5AWM37Z5wmBGpgC4JjX
	aUW4sw7jKSdZqXMtGSPUoRVkuaMhq4gJnULGlTzpVfxboSu472JRmDcjuG5axxsVDADQh4Y0jZQM0
	8Y+8eBz2lzXGwfZwAwNyNpKLUYnlxk7kmoeIP/dJU61aSaU617cBXf5X6TOWpRjFljItRHB1UMXU4
	85qMyyTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcjM-00000000yO5-3hra;
	Wed, 06 May 2026 13:56:04 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcjK-00000000yMY-0aEi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 13:56:02 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c70c112cb61so4058079a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 06:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778075761; x=1778680561; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=21im18CnslCvYwXS2NJ84S3pXykaNCx3/vuExYBK0cE=;
        b=Jx60ETY8Nyyi9vJ3RL/GBhAPimmFauXTBevLgvsR27T3OEKW7ZSfjySfWeniiMIyZO
         dDjS2127HyDEAqhqj3Ctk7ddZYD2sW3EszoK07uWd5Ie75JfL9charYvTzh9CuHhwAdP
         QUp4/9rt5g7izDxlx5SAz2w3mZLFsfq86TaAiLDlK0AiXUC8UNBdTyoeCr5lk7nWfZMw
         Vo5DGlFtA2NJGk6UYgPEQ/ChSFiXOtRB+W0pecJ3B7FzrRCavOucD8foAM0w8Y5pR42w
         1p4LgpCHOlUBsxTLMBP9c9i7LMaXpbNxSiPM3XAlPfAzrtuhz1FGtiLE5EIlREOYm6cK
         yWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778075761; x=1778680561;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=21im18CnslCvYwXS2NJ84S3pXykaNCx3/vuExYBK0cE=;
        b=dKFz3beqVOcS7OyauvTCDp7XFL9ZaIu2ElmO1YI/lh+8XL3059d4c3bB316qDcrg7O
         rD18gEbwBTXn2XpQ/L2kMCEdu9aaM+L4PMdI3UvI/OgjpH5JiFBsFcCep+Xya/Qu9Dm6
         lx/EAoHfCXgpZzeeTtSKHbnPGcQ9a6O7UGyoD5r8yfSii3PxDB/EYHf+aSkaAgDpCzIL
         gZsRSrOONxqDOHf5W93bawwDXYKrLHdpybYSO+BVt+0wiRPJjv1sZxnFBORfaVzaF5x+
         5v2MhA+PURDIvwuwjTNsxBiqSBGn7cY5AgxyCAXoBDgh0pclFhGey+EtkXniZBOE+6Pv
         mcCg==
X-Forwarded-Encrypted: i=1; AFNElJ88YX2/qZ7yyfk3Bfua11nVhA/lrYUpKGdkc+Choa8wWMrEVKZy08QzEhWxuKLS9ToKRONU0gDtxXeZdy2PYW5w@lists.infradead.org
X-Gm-Message-State: AOJu0Ywn83F0isXU7lCYWEZjsyat9BGNajKXS5+F9E4qZye49m/7FqwT
	9QG64GJ2thOo+bA0DKXTx7jTfM+8BQ0170Cq+Sj1crWgCnvLpusHgY+J
X-Gm-Gg: AeBDiesIkfuh5n/iUQA9ui7gxXTWhUdmb+177QbMNhquJXMQMbi6cTlYRRgID3JU/gt
	+iglcBp3Up/F6r/ZXlotMmdCzs0ut5OC1kPCvdpWQs6+6+JGLulKBY+xSormbKmZ58JRUp6VpbZ
	/G8Wt6bgQ9ZxMih4i/7NCs2vhgQSBD8KxwRfuHqgZMI9EZVtd3oxGYA2p5P7NZPZJ6HrdXGLYO6
	NjSumMrdK2gu6IaSYF+mxgH06sqdIujgk81BfB3gLLn1itmxyVIzZRpRCPPOfQ6Jx/+bFBjAgrm
	t67ZmIZphXQErLbUExtK/fh9OOecSr6zCrcmPVCo5fZiJWIk7wpgaTkDbwaq25PSfS7YGcZuJG/
	D2W4QHBtSRLHdk+5lOX8RQ1a3yH2zw41wUngh0bnuFTnlkAWdacEdQxBLSs/2bUltvtxQAF3PJy
	U/7aYZNaqHiRCuMRn1AfBRJFKYR4aBjaDOdx2CQGkvfoC40+t6Ep74TtCj
X-Received: by 2002:a05:6a20:2443:b0:39b:ba95:b127 with SMTP id adf61e73a8af0-3aa5a83151bmr4200206637.4.1778075760634;
        Wed, 06 May 2026 06:56:00 -0700 (PDT)
Received: from [192.168.1.3] ([60.243.224.75])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8242b811a5sm2326811a12.20.2026.05.06.06.55.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 06:56:00 -0700 (PDT)
Message-ID: <b386707d-944f-485b-8a06-236c1242f5ee@gmail.com>
Date: Wed, 6 May 2026 19:25:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] dt-bindings: mmc: st,sdhci: convert to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 Patrice Chotard <patrice.chotard@foss.st.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260503-st-mmc-v2-0-11ae3216d2ce@gmail.com>
 <20260503-st-mmc-v2-2-11ae3216d2ce@gmail.com>
 <20260504-rational-gleaming-clam-aeaaff@quoll>
Content-Language: en-US
From: Charan Pedumuru <charan.pedumuru@gmail.com>
In-Reply-To: <20260504-rational-gleaming-clam-aeaaff@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_065602_187644_EC5150DF 
X-CRM114-Status: GOOD (  17.39  )
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



On 04-05-2026 13:13, Krzysztof Kozlowski wrote:
> On Sun, May 03, 2026 at 08:35:30AM +0000, Charan Pedumuru wrote:
>> +$id: http://devicetree.org/schemas/mmc/st,sdhci.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: STMicroelectronics SDHCI-ST MMC/SD Controller
>> +
>> +description:
>> +  The STMicroelectronics SDHCI-ST MMC/SD host controller, which is
>> +  compliant with the SD Host Controller Interface (SDHCI) specification and
>> +  is used to interface with MMC, SD and SDIO cards. The ST SDHCI controller
>> +  extends the standard SDHCI capabilities with platform-specific
>> +  configurations such as additional register regions,clock inputs, and delay
>> +  control mechanisms required for signal timing adjustments which are
>> +  necessary to support high-speed modes and ensure reliable data transfer
>> +  across different ST SoCs.
>> +
>> +allOf:
>> +  - $ref: mmc-controller.yaml#
>> +
>> +maintainers:
>> +  - Peter Griffin <peter.griffin@linaro.org>
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: st,sdhci
>> +      - items:
>> +          - const: st,sdhci-stih407
>> +          - const: st,sdhci
>> +
>> +  reg:
>> +    minItems: 1
>> +    items:
>> +      - description: Base address and size of the MMC controller registers
> 
> s/Base address and size of the//

Okay, I will remove these words.

> 
>> +      - description: Base address and size of the MMC delay/auxiliary registers
> 
> Here the same

Okay.

> 
>> +
>> +  reg-names:
>> +    oneOf:
>> +      - items:
>> +          - const: mmc
> 
> Drop three lines above

Sure.

> 
>> +      - items:
> 
> So this is just items like you have in "reg" part. Same syntax.
> 
>> +          - const: mmc
>> +          - const: top-mmc-delay
>> +
>> +  clocks:
> 
> Here and:

Should I add minItems and maxItems instead of items?

> 
>> +    items:
>> +      - description: Clock for the MMC controller
>> +      - description: Interconnect (ICN) clock
>> +
>> +  clock-names:
> 
> here: Old binding icn is optional. You need to explain in the commit msg
> all the changes done during conversion.

Okay, I will write this change in commit message.

> 
>> +    items:
>> +      - const: mmc
>> +      - const: icn
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  interrupt-names:
>> +    const: mmcirq
>> +
>> +  resets:
>> +    maxItems: 1
> 
> Best regards,
> Krzysztof
> 

-- 
Best Regards,
Charan.


