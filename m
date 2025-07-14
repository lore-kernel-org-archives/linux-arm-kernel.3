Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB29C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 06:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vvozbmvdghn0xuJhVjwu4pQc8eFowQW5vD9wXdzvh2E=; b=nba7wDx3834dZQtDRfhGToLaIo
	FHREUMUojL+JWbNEYKLiDT09xS6h0kYY+I9+rIZk21nRvea0H/+cjlZYlP+dXZ40mPu1ZB4Vh1DYL
	0k1tMt5Fa3zpGIl8i8EJfflMhKepTMJiP0U0cByHoeQmLd9oG4DCNT+4Wcx2Tt1DuY9vPNNhV5FSr
	uc9c3mT9DjrbJ/84QqV0+4di6ncUlPzb0G9jnKnzeW+B1/3uU7MUC6bb3qijJEnFRCOmBEb20a6nT
	sh58c73E7aIAgRy0Rr3g2wIFGfDe6TNtqDBkRomMPAXXnSe9MjvjIoCMf02uQcNUnw3L8Z0hresq3
	hiq4Am5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCsE-00000001Nlu-2mES;
	Mon, 14 Jul 2025 06:41:14 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCR6-00000001Its-0nDR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 06:13:13 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-60cc11b34f6so8787257a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 23:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752473590; x=1753078390; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vvozbmvdghn0xuJhVjwu4pQc8eFowQW5vD9wXdzvh2E=;
        b=RWyRLR0MYgiM6wKvPXsXbt98OaJYqleA3iil7aab55gNX42qn5Mc6iOvfk+Spn8LvT
         4i2Ar/g8+oP7emOozrQUy42NEClEB+RiWlTKzyq5DRSIhLt2/jM6qnmEA4/mQCqcLW/2
         QsKPOcEhBQeOiWkVxxmsiOqWrf4qIUnpXT6vCg1Zt2/I8gRyxf7nWZ6b3xFfpDJRNK4g
         Gj1uEytIslOR7q7XxOAykZK+x/LQidjsMDfoCuB8E+5d2q440rvRZkG13QvhdbL5HK1x
         nSpB80lIz3xmvEIc4Cv3UzBhANa/unSv9ubniRII4fmgsWLPc5xTRHEHvNzqEjdHZfOq
         Q9zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752473590; x=1753078390;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vvozbmvdghn0xuJhVjwu4pQc8eFowQW5vD9wXdzvh2E=;
        b=PcJ2qYzSrOrsBznPwskEPO3stCGvXe8FPsVXOr7jw5KRIIYaIiT7yLCBU3FDErxI8c
         1p7SboM3P55ZUDvxO1BSw9sGtRHvZBEtPz9daNU9hVCIZVXDD3DjSbtDX9CtXO1liJcC
         9gVL+K/Jdw8z/h7J9xXRcyTjyvon8HilNxppGak6OxOD6OqmM6IDdYbQzeETVqWiOqz1
         1ipAXszKBaCB2L5GCKWmtSo9FWAjEz6Sf0FERp70s9A/novXb6LMskAIQzxWTSVF5XNV
         NgI/vnFhQcJrBK0ZSjVT3aJMYPUFDd80wEjLTWS/Fpec1bZAgWORMz0QFXEgU6XvgYEY
         gXdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGYMzZ+RS0a9ue37OGhJ+MLfF+k+0ZDQ/YAAJZ/S496E/nHDbLu3d+5AUAaPRQ7qz6bcLdW5nkQFhpNznSG37C@lists.infradead.org
X-Gm-Message-State: AOJu0YziseBIDYhi23Zf8jediURo7h/LQNM1xC8QJNDonhB0wYQO/6Zp
	axrgl1ywuOwMFQ+xENCxA9mK4YY0vJAnLW//2tKLMDL8T5vJpBdpapfA
X-Gm-Gg: ASbGncsA0UWyy6wep8DwafCyj1lMbPpaXlKT2tJ5qGYnIymjlPd/OFg+bVaJ1prenLG
	YQIV/wSDJwl21J25iPzdGaTQaCs8q2aHhLXslNJVqvVdpkCeiXRM8+UHP5nUwg7/ZJga6Xp9wEU
	5h9/xMjJBapnXCao5s2kzzOxumAPsHc386LYPgh3T59VKsU2xH0X56nBzVdYn8cWZE/OHZ+BuGT
	Pjpzh+/4vth6O2WrsXG3vFwxiMZKjByYzUnhFDVXXMPhJ2MzIhAzUaSrDSdcuY5s60KUWSsSl4y
	f0p3JfLxDVoVu/YiVDfLABRsSDzLpGXMJz7K1StTcHEuMVwyIXW41zuPFrl3zTgWOP57W6wOGjY
	37aTN54CK62bdD0rim57pJ7CDYyhTd2OArpz8TO+wnkrvJfln0czY1LFt0K/xDDZnTGRkieipEg
	5rjZsBsvmCK1P+EpDWShej8w==
X-Google-Smtp-Source: AGHT+IHhpjs0q3mi1BpnwNvryChqNwp5/Dw+yK56vrj/BWwwZ/DXYC0z9I3eOOpItRqe5sk1H/USWg==
X-Received: by 2002:a17:906:9f86:b0:ae3:a4a6:a32e with SMTP id a640c23a62f3a-ae6e253ddf4mr1701256366b.29.1752473589912;
        Sun, 13 Jul 2025 23:13:09 -0700 (PDT)
Received: from [192.168.0.124] (ip-37-248-155-42.multi.internet.cyfrowypolsat.pl. [37.248.155.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8294bc2sm766171566b.135.2025.07.13.23.13.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Jul 2025 23:13:09 -0700 (PDT)
Message-ID: <ee0d148e-71cd-4136-b3cb-145566abdfbe@gmail.com>
Date: Mon, 14 Jul 2025 08:13:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/14] Various dt-bindings for SM7635 and The Fairphone
 (Gen. 6) addition
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 Luca Weiss <luca.weiss@fairphone.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>,
 Das Srinagesh <quic_gurus@quicinc.com>, Thomas Gleixner
 <tglx@linutronix.de>, Jassi Brar <jassisinghbrar@gmail.com>,
 Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-mmc@vger.kernel.org
References: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
 <aGMI1Zv6D+K+vWZL@hu-bjorande-lv.qualcomm.com>
Content-Language: en-US
From: Artur Weber <aweber.kernel@gmail.com>
In-Reply-To: <aGMI1Zv6D+K+vWZL@hu-bjorande-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_231312_233036_51762291 
X-CRM114-Status: GOOD (  18.41  )
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

On 6/30/25 23:59, Bjorn Andersson wrote:
> On Wed, Jun 25, 2025 at 11:22:55AM +0200, Luca Weiss wrote:
>> Document various bits of the SM7635 SoC in the dt-bindings, which don't
>> really need any other changes.
>>
>> Then we can add the dtsi for the SM7635 SoC and finally add a dts for
>> the newly announced The Fairphone (Gen. 6) smartphone.
>>
>> Dependencies:
>> * The dt-bindings should not have any dependencies on any other patches.
>> * The qcom dts bits depend on most other SM7635 patchsets I have sent in
>>    conjuction with this one. The exact ones are specified in the b4 deps.
>>
> 
> Very nice to see the various patches for this platform on LKML!
> 
> 
> Can you please use the name "milos" in compatibles and filenames instead
> of sm7635.
Hi, small half-related question - does this mean that future Qualcomm
SoC additions should use the codename for compatibles instead of the
model number as well?

I was working on SM7435 (parrot) patches a while back; when I get around
to submitting those, will I have to use "parrot" or "sm7435" in the
compatibles?

Best regards
Artur

