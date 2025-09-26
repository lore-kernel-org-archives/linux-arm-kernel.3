Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF114CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 00:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9e9NdOcaym+Fuz3o7AoDLOamjILGzKfxxMvCkH865N8=; b=17zZBeD38HpSyrplW0DT2twspy
	VXqfFFjrWnzRghofMkqG0HNpyOvqPnfFEPUDv2Vp3FpH4ZQ4gtoq1qrRH8Tzq6lyKHEvr1WbTbE+6
	Qfx73Br/2/W03E4ZjzUToWluzI6MF+8CyprncdmDYcGstwa4XWqf0HqU5UgStm8Lk9I2qcmd+3+/M
	3xaI5KGzRrDqk7Exk2YeXPG/loEmttqQnYFNy6Y2R89Lik+Ni/hz5GajCxV0DQTUuLGvehh2tzNul
	wVjTTAuwKUbiNNuZmjgNEyNgxWufT1IXGibkMpbk+elj6xv12/XcikJb5bBFApssfOr7bv7MbuwZ9
	JGQ3wqiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1wkg-0000000EUow-30xE;
	Fri, 26 Sep 2025 00:55:58 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1wke-0000000EUmO-0ImV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 00:55:57 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-46b303f7469so10799255e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 17:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758848154; x=1759452954; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9e9NdOcaym+Fuz3o7AoDLOamjILGzKfxxMvCkH865N8=;
        b=H+EadbU3bX3uxhINwjRQSSZF34iOMZPBVp7SDIHYz13+BDtO/eSYp2fUL2IvzQJUiB
         AY63g2RWCTKjqRM/l9yTfWXpH1CiJFYPoqxtksnbM/p5YYrQ/kHgqRQypKoGYaT0uUox
         oGs6N9BNl0mgGeSrqwYp5ZpO3A2/tc4FSBIhRP1WrkrB9WP3uMmjF63O1qTLrZr9CF/9
         6Dx0UBL9JD4nn6sy7NMpVCe4ms1nyCoDHjNSWAbRcLZ1tvStx8iCyynEo7++0+Yzr+nv
         EWF8NHM448OEPOukzM/9FABnbSmOAm5fKPysKOpIqf3UIFF37yoaDmHHHNBEU8z2HXvG
         Ierg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758848154; x=1759452954;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9e9NdOcaym+Fuz3o7AoDLOamjILGzKfxxMvCkH865N8=;
        b=WRSlOe8a99EifdXZCKfrxQynYaHumSiDWUFdAEf6aZWIDDRXlvr8yv6zdGdcF/iDzn
         0KRHFfjYB8tw7kpcW/h2wOXMwKbq3E5pojcY+vJzNYJh3AWZYyATWEHz7QdLFkglugpU
         a4oCmmUyu4nKQWzVJ79XKWwnGru9Bc4+lxTUTY14MIWzY+mfHcOVm46e7pKLa+9oyuTu
         /Qzi5U5beTOt1Lkw7kcSnC4EyrpxoADy84Iz6BJrWY55C4gR0isxXLZxMH2JBmDkqw/V
         fVJRUk8JD2QBzxWWSUFIbLSV4OMJzMbhfenYB+IOw0uJIHLVAA2mzYklQxUzmY3wFAnI
         5GJw==
X-Forwarded-Encrypted: i=1; AJvYcCX/qnC+KptsnKY2kdWmEEUPFTN8m5JqJ4Qh9xcPGgNU88sk1bH10aptfEf3ftTVGyC/mwQcJlzzkKIzicPfepDh@lists.infradead.org
X-Gm-Message-State: AOJu0YyBpdZBJD5U77eOrP7Z9+rgeVkK7S5J65NdYwYVSsvPTZD5QtTw
	I+8S4Z6LdjcZjNKWqbaqrLXLy+gwAwprqscJQwsFiK8FcSC2mIfUJdDcxsp4KW3zOyQ=
X-Gm-Gg: ASbGncsAYE46E3utj3kiXn5TwMrkumyFWTYqxdxeC9bC98xVBrS2qVy0Z3fT0b1RTqU
	btluBLVFvG8gey8ypSTU4XwokHGIXlLzYN9WxrJ6QTn94BhdsUBSM4hzOhe9xw0Pn79Yx/aOBAY
	hbI05OiBNBO8v+a7xW6gGu7k9oCfWEnQCN50cqVy4JdTKL/8XlFDGD4F7dr8ZFlAyGjm3O1NzNn
	EdhK3drk4IQ+rnnUeOF6ES2RUrpu4Fd+U1lmOzy2tDbI3ipfgVFJ2kWy7GQURcZflOAas7eieG2
	qjSaCFjItcDs9qcVNXX9Nc2q9ZAOJ0PW9TR6WYx8hh6vsxfWINRqBz5wPs1gQr2+HmndJUVKRKW
	XQUfgKVgfqpDcPvvKnP5I6Y6H7LPtYoRytUw8V1Aul4E+VxB0U7CNstnmsCy0RJPhOcKZLzvtXf
	x+KFWop9gA7BVesoPraVC5
X-Google-Smtp-Source: AGHT+IEi7fDGWCixHLoidioieRVuXJUMu0nnRncjPtslMOdDH/jitf97iTqziYXoLsGnOKsP4maIXg==
X-Received: by 2002:a05:600c:3551:b0:46d:a04:50c6 with SMTP id 5b1f17b1804b1-46e32a10ef4mr59198215e9.30.1758848154080;
        Thu, 25 Sep 2025 17:55:54 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2ab62233sm97057095e9.21.2025.09.25.17.55.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 17:55:53 -0700 (PDT)
Message-ID: <f705e9b3-864d-46bf-a6b3-f3be4756293b@linaro.org>
Date: Fri, 26 Sep 2025 01:55:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] clk: qcom: Add support for VideoCC driver for
 Kaanapali
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, aiqun.yu@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
 <20250924-knp-mmclk-v1-8-d7ea96b4784a@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250924-knp-mmclk-v1-8-d7ea96b4784a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_175556_145128_83898D17 
X-CRM114-Status: UNSURE (   9.09  )
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

On 25/09/2025 00:56, Jingyi Wang wrote:
> +	/*
> +	 *	Maximize ctl data download delay and enable memory redundancy:
> +	 *	MVS0A CFG3
> +	 *	MVS0 CFG3
> +	 *	MVS0 VPP1 CFG3
> +	 *	MVS0 VPP0 CFG3
> +	 *	MVS0C CFG3
> +	 */
> +	regmap_set_bits(regmap, 0x8088, ACCU_CFG_MASK);
> +	regmap_set_bits(regmap, 0x80b4, ACCU_CFG_MASK);
> +	regmap_set_bits(regmap, 0x8100, ACCU_CFG_MASK);
> +	regmap_set_bits(regmap, 0x812c, ACCU_CFG_MASK);
> +	regmap_set_bits(regmap, 0x8158, ACCU_CFG_MASK);
> +}

How ?

You're doing the right thing commenting on what is being done but, 
you're not providing any context on what that thing is done.

Write a set of unnamed bits ?

+#define ACCU_CFG_MASK GENMASK(25, 21)

It's only five of them, please name in your comment at least a give a 
clue as to what they do.

---
bod

