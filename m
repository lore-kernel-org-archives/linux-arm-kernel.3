Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D00C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 13:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ndsmfORnkICQk8jSCedUOIfsQUGdzXAUTeHyArpuUsw=; b=BiDbu6SvStVGTGa3f3H1B54xrC
	S+iiQhXp6Tkz/LHLEPVf6yaQ9eCKwS6k0nZ+aj9ePajnmN9nuFVbGerdJAX86Hdqyn4P/Ii9JfTs/
	uwqjiGi5pwexgb/AkjwqTTF3ZnqltpXuqty2jS/sjlLqEF/t4H4fQMvUJZXQhbCA7tzY6HSMLo633
	lEvvwDZPvVHh4YbbloEaJoNb7z2NuIh5WHoYlXW+meQsMopSmSHAQZ7z4lOO8VdLtis76yXbpfzkF
	LVtG6VTFLrZYgrzcwoQLJwVaLqRrPLEFuAgDcPGOKEDDQxESEt7jaQH5etPO5DXQr8C+i2dOQQUr1
	1SZGpilg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBvkf-00000007Rw5-3l5c;
	Mon, 05 May 2025 13:20:57 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBvI3-00000007OVO-44NJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 12:51:26 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-39123ad8a9fso258745f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 05:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746449482; x=1747054282; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ndsmfORnkICQk8jSCedUOIfsQUGdzXAUTeHyArpuUsw=;
        b=CkVmEK+QALJ6g4sEBG8DTL2GXNsQcI+SGprWj1srtmnjBGLNdSNRpu5xETwYdMGD/Z
         J+n83Xz68KeHs5aG3MMLvq4Bq216LR4zqFYmPbBRNUMKFhjn7UyVveRQxN+vTS7X1OQz
         I0/gTkmf7z8/mavoDE3rQYlUQDT8aIlxCJWUlpbDrVXIZEpmHQIyB9oqowkhpJEs4GJp
         4qfi/uXsXFahoN62r9oWDMEJWrzu2soSNi0Gi4/AX952gjspxi6F92SrD+5JG3SZMH27
         Xm5erG4R/rQ0krnlUT9I3+YDZnLwh9qiWJSJSVUYEA9I1iONNFFn5or+QW2VRr+GhUCO
         mlHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746449482; x=1747054282;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ndsmfORnkICQk8jSCedUOIfsQUGdzXAUTeHyArpuUsw=;
        b=Srx8q+b7viIvBA56mIzEEl7bhcBXRoDEuq5MbSMrj+QNsXpTce2tMHNHWiYtQIJEe2
         5YgUBBx6BjIhoZNjPxx5MdNltAjQoeaX9Z8iO7FSHnZpHvT+FNTp9ACkupMaVL877eoR
         smsqAaaZK4+Wa9DcTxMM2Y8Cff3uCO0TZIG7IFVTPxpDKK8V61gtZg6BQ7os5+2rlGXu
         t9eLdbFFvUuqFoHTrl3pOLfMhUFOD02bUHYG5ZlNuzgkQ08Vkx14iADIBrAxN+qFrJ8d
         pFWHzcCP+ktIGwZmkx0sh6TOh5qbY+idhtu2q5dWprUCdW1BdN+x08ElZS/cGMae9D2O
         b/pg==
X-Forwarded-Encrypted: i=1; AJvYcCW5TFiy8U27AfPKqX+vO6cgZ9c56dJv0EU5iVZWN4Jm5opZhDqd9VtVs88HWE4tbp0tPrTBnQDbPu58dtSB+bgz@lists.infradead.org
X-Gm-Message-State: AOJu0Yy89m4XY4DAnaSyBOaHLdQdBxcoGHb186TbVBvn8LitFFuTEGL8
	ezO1CRR0aKh55ta5nt3MlDJ9n5ttF+FlmIxol183ejnRAxC+3Uod7tb3nJt+Hxs=
X-Gm-Gg: ASbGncsQd8fDGDVFi6KYfj8LzgW/oUA1+tFC07maG+Q3x1E8VKZM7wVH5aCCAg1gUkY
	1MfKFpG+Fll21pTRAWEPALpYR+jB0tyZGl2Y67VOA6WU8cybbT9P0oIqX6X107J/x/gR+AF4QTk
	oTX+FhGk16cKbj7b4W6tJoVfRlmmRJPbvYdufX3/gkz+1Io05WIwjme6lNsNmd4gMUHGfPBfku9
	K/n4TBzlafztofGZkAxOg0HG4FRJPdR4k7/qYOAiquhvA8TrUCrE6/Gcq6iWiwrggPTXm0T+VxH
	DJDR2mw6SgW6E3RWeQMOphSI2REbuVQDEsC4F0ef35JF3galKOx/z7+ggNQ=
X-Google-Smtp-Source: AGHT+IFh9MqrVoggZusz4VHj0uAdGrHI1bTqOdCSn/SPHpGaUlPhaICa/6fcOPCGmTg/zC8S7KfQeQ==
X-Received: by 2002:a05:6000:1a88:b0:3a0:6c12:237e with SMTP id ffacd0b85a97d-3a099af3ac6mr3160293f8f.16.1746449481965;
        Mon, 05 May 2025 05:51:21 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b0ffbfsm10134616f8f.80.2025.05.05.05.51.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 05:51:21 -0700 (PDT)
Message-ID: <a53149e6-2273-458f-9fa3-89fec112f4d4@linaro.org>
Date: Mon, 5 May 2025 14:51:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 0/3] Add STM32MP25 SPI NOR support
To: Patrice CHOTARD <patrice.chotard@foss.st.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: christophe.kerello@foss.st.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250428-upstream_ospi_v6-v11-0-1548736fd9d2@foss.st.com>
 <174636664232.45285.4829080141383638928.b4-ty@linaro.org>
 <ec294e4f-274a-45ae-ac10-464ae4ae6f66@kernel.org>
 <6d697e1e-84da-4988-8564-91430e820fef@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <6d697e1e-84da-4988-8564-91430e820fef@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_055124_016693_289A1006 
X-CRM114-Status: GOOD (  12.93  )
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

On 05/05/2025 14:15, Patrice CHOTARD wrote:
> 
> 
> On 5/4/25 18:16, Krzysztof Kozlowski wrote:
>> On 04/05/2025 15:50, Krzysztof Kozlowski wrote:
>>>
>>> On Mon, 28 Apr 2025 10:58:29 +0200, Patrice Chotard wrote:
>>>> This series adds SPI NOR support for STM32MP25 SoCs from STMicroelectronics.
>>>>
>>>> On STM32MP25 SoCs family, an Octo Memory Manager block manages the muxing,
>>>> the memory area split, the chip select override and the time constraint
>>>> between its 2 Octo SPI children.
>>>>
>>>> Due to these depedencies, this series adds support for:
>>>>   - Octo Memory Manager driver.
>>>>   - Octo SPI driver.
>>>>   - yaml schema for Octo Memory Manager and Octo SPI drivers.
>>>>
>>>> [...]
>>>
>>> Applied, thanks!
>>>
>>> [1/3] dt-bindings: memory-controllers: Add STM32 Octo Memory Manager controller
>>>       https://git.kernel.org/krzk/linux-mem-ctrl/c/43eb1b288072641b7de8f5d5c15bde69e6e8589a
>>
>> And dropped everything - it is full of warnings.
> 
> Hi Krzysztof,
> 
> What are the warnings you encountered ?
> 
> On my side, i double check and found nothing wrong neither on bindings side nor on source code side:
> 
> I previously checked that everything was up to date : 

stm32_firewall_device.h:117:5: error: no previous prototype for
‘stm32_firewall_get_firewall’ [-Werror=missing-prototypes]
  117 | int stm32_firewall_get_firewall(struct device_node *np, struct
stm32_firewall *firewall,

and several other like that.

See:
https://krzk.eu/#/builders/38/builds/915
https://krzk.eu/#/builders/40/builds/900


Best regards,
Krzysztof

