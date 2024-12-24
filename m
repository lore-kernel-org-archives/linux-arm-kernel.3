Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 593A2E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 09:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rqjl308OuNRMbWugA4jzjOfqs1qN28qDlrGRi1lmlOA=; b=cr/FynV2HTJQTfwAKHQQfj47mA
	wMnGFUjSF8asCdFQzDj6Mkf2H1rYV3O9X7x2DU6F528ZauTRLHCl3/g7Xxy8QlFaBg/CH1gedS44G
	08F3UGNVWLj6+hY5+HYJaY3R3QsSPaHzDrWteTIuwtkMamATSQlHJ9gfHnI//QKWIRAs3MRKATcAa
	6vONkbG6g5Cvxy7bLzPv9ZKxq6umpEwn9jHFw92/eiuUucFOLbviojxqu5lPjveM9Xtm9+azZ9wT/
	tU5DhivRDF1mjHE4VvOKlasVmgRpPkdjGLxCYqTOKCoxriM5J6NkCbEiO49XAt4BAMHVAEt57xhT7
	nekQ4ShA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ0pF-0000000BYHR-1gTc;
	Tue, 24 Dec 2024 09:03:37 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ0o3-0000000BYCG-3mts
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 09:02:25 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-aab73e995b5so96025266b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Dec 2024 01:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735030942; x=1735635742; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rqjl308OuNRMbWugA4jzjOfqs1qN28qDlrGRi1lmlOA=;
        b=lD7RAGBsqzHiXT7rME93K46XkFWYfAwvw8O/PDqTb++KuWCkV4/vpVl7PzAbn9iQ2V
         r/fG0IUxN7WtGIXEbbxUqsFIbLjYxCWQnIJw7EVkkb0ZYqYsHVAC5ShEUlu0V/f9KHnN
         qEC2FhHkSaey8seLYTyO2HVsBWMkAyhFR963/uxyrhnt0gKtSSBC8lpQxnq7m53slPSj
         kH7kGE3qfKljRFWvjOOE+9cEezEZzEmAG2rvmew1YROGsPsrTH4o4FIlA5PGHNogot8S
         JV2rLMqG3K4z72g87LPmIyI3YqGiqhQrJjXJG7X694Mw/RlpmJgyGg4LZu2vjJJQ2EeY
         j9XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735030942; x=1735635742;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rqjl308OuNRMbWugA4jzjOfqs1qN28qDlrGRi1lmlOA=;
        b=Ef0ru6WmxwPtYQ/poEF7V1wCfPTHv8mhfPecfRQ7UxhtFznLHl0qUnote2uhp/uRL0
         wru4fSLC3vXCFGYYQW5A8tcFrt2s541HsAzssr6tuL6O9bct2w+/UcfoSsD+UCGh3aFA
         iUcEhwk8ZzEXnth01EantwErghu84bTymjYDNZWk436pD2Tre+kg28X+VsXC8kxVC9rD
         QVm4UaWLuFe+bmaFOpil2AU1yhz5XGLyBHdwynRBPlK/mQzNyHYSbVuPeFO95ea88n2m
         14vRzYiZSYjFoozKGEal9OWlfvs2Cwl/ftPFiwqbfywBr7P+vhqgQi6jl0fAkcK+A6xn
         rv9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXfVorM6a0wZ4RNUPo4+tvxafWqSxGW9d2pFVr2Eg/ETtNgPaqx3y1JzrGkaRLvLe5bjU7dpTWn2SBGznsPmpPT@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+DWNFX8Q23eUmIxHTtUXgyD1RVgNLWYQa0xddzj07G0SapKce
	gGYo5k/m0BZBCW2ttPiGld90ZJP3rhUxQjNg4zNOTNMafbTlG39yJRHq2QvDw3E=
X-Gm-Gg: ASbGnctEp93doHUkEak4NcNn8CEuzsc3/RTA6PoY/mvN1YUnUptrB8XCLZmoSl9zoJ3
	Ga3GHSg9MQQnG07UKqf7p3shLFPuyikQJuEZdYlXiHrM++C540wJEPvfL7/nBqHa3YFMsQDP3hc
	UUHDn8tw2NNDzEsqzquOItbfaz+5HWy7KsHxV5BN6fDcVO2w8DGwK0x7NU/WxGxwRVFXx5A1vGg
	V1jRC4qgiwe8nCU1is7lLp5EoRrK6FajL2sFILWPNJlAsgSiJNRTFFhrSUE3wk21e4dbqfQlEdY
	Gm4wqPZo8NvghD4oe0xp/d+m1Vmclur677s=
X-Google-Smtp-Source: AGHT+IGykTi7JHcE7u3RIbhw9nHMoGJBAN6VL/xBiSZ3UlC0+Pn4XzS4kF3dFtZfJ0nP0IfLmC2iOA==
X-Received: by 2002:a17:907:2683:b0:a9a:8216:2f4d with SMTP id a640c23a62f3a-aac2714a5ecmr510447666b.3.1735030941539;
        Tue, 24 Dec 2024 01:02:21 -0800 (PST)
Received: from [192.168.0.18] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe4b6bsm630137966b.93.2024.12.24.01.02.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Dec 2024 01:02:19 -0800 (PST)
Message-ID: <7813f2b0-e76a-463c-91f9-c0bd50da1f0a@linaro.org>
Date: Tue, 24 Dec 2024 10:02:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: net: qcom,ethqos: Drop fallback
 compatible for qcom,qcs615-ethqos
To: Yijie Yang <quic_yijiyang@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20241224-schema-v2-0-000ea9044c49@quicinc.com>
 <20241224-schema-v2-1-000ea9044c49@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20241224-schema-v2-1-000ea9044c49@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_010223_963335_71C87D1B 
X-CRM114-Status: GOOD (  13.07  )
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

On 24/12/2024 04:07, Yijie Yang wrote:
> The core version of EMAC on qcs615 has minor differences compared to that
> on sm8150. During the bring-up routine, the loopback bit needs to be set,
> and the Power-On Reset (POR) status of the registers isn't entirely
> consistent with sm8150 either.
> Therefore, it should be treated as a separate entity rather than a
> fallback option.

... and explanation of ABI impact? You were asked about this last time,
so this is supposed to end up here.

> 
> Fixes: 32535b9410b8 ("dt-bindings: net: qcom,ethqos: add description for qcs615")
> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> ---
>  Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
Best regards,
Krzysztof

