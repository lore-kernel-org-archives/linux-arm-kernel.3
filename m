Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2108D0BB4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 01:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZZC8vUXOYoxYSD8ql/VS5TkPDqQ3x1C1NI6GDMzH0Y8=; b=DIzSTKgVmDnT8KiiDl7Aq94tSa
	0tIxS/ho5pqD1aoDRHHVmTZNfcqP8MGSG3LsOHhmOq5r7awYLHp+NQ6PcRv37jIGPz+zhawLYe5/z
	VHlNgK1qBmi1aPp0lJcEsDgsnaKFLA3Rs07HMkq0OoQeSqdqeZASx8j00J70XVXHt87sbZmjqZnjT
	ZuAExY28cd5U7qldwPCAPdgZhZ2KQncEByna50ErpTK9s7Um5iM7aBcFyzhn09GCOaCH00SbKIJcC
	6KlRMeS+O8AJJuT9e9goVxpk0RVH29m/ia6OYRNj8Gf5rikFu0hLN6lskIScVRaonpTLgbodFfV1C
	S+aidcSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3mwo-0000000GSTA-1K1o;
	Thu, 24 Oct 2024 01:47:34 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3mvH-0000000GSLb-2mqx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 01:46:01 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-71e49ef3b2bso300073b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 18:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729734358; x=1730339158; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZZC8vUXOYoxYSD8ql/VS5TkPDqQ3x1C1NI6GDMzH0Y8=;
        b=ZXyyw/24zl6d/tKuNjbGHDxkq0tSPOfGhvfz1qunsrW9MkIv+MPphxXere3Vu2XEKy
         YLDJlv4YYydv7wQbwmUQt3919/xvRa8lfkAc+nYrQEm+Uhd4SNcwNHGRXjbSyjsc3e2A
         Img8UySpZRRbzpgRZ8A/FDer5t7UbxQlqR2JB+Rtb878pPuHyNwcm6xUd0+M8nz8BY10
         gN61LUsRqpDs1KRqqDJDsKeBTmdaHYWjTX3OJ09/hq5jh9QsbLggu7XBo5nFBb5SUsGZ
         78Q+phabGQuTUkTUygkg2lXcA1z8UUPRtma5jwJnJLhyTbDgY5ipUisKtlSfvUR9H6Fb
         ok0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729734359; x=1730339159;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZC8vUXOYoxYSD8ql/VS5TkPDqQ3x1C1NI6GDMzH0Y8=;
        b=hHRe2MJYStIdvM8pJWyfQCbnUE87N3A6C61qkeJ1MzprMV8/Os1Bt7hMEg9m6rpnY/
         MJWE25DQsViJT0gIciFgfkP+mmyVTWSQOT3xD8dzDe0uL6eyRG2h+lThcklxOkXmOtlY
         3K0fbAQYIwgzfzBkqyXOYS6gFdb+2jTFwt6BHs903fTTXzaQfauNXWfdjEAGsoJQjI/8
         j/QO5JChCcU3V39xMeUqQYc2DBNIFxznSmArCSvQquQzGZtHOohHesBKsZQK4BHzF+oP
         BGiF2lTlvhCdd6n2zaXTTDZkRc5j0wAbQ4HG528ACj343u9WTt39mLZbYvJBMIfiiaUf
         +alQ==
X-Gm-Message-State: AOJu0YzXgpYQFQQ7D8mBP1eNDLUsD8eVaCz50mMhOO7tLSPcRcPtwwjK
	xLlvuYi9attscr3tB/oIPb6l3dkLj7FClVKqM5/NRHqXsQH8q+iI
X-Google-Smtp-Source: AGHT+IFuF/ZAZGdrP1VRNS25yOA7DLUuOv79sCOHXxqnBKQDPz7B4xhiqqXElobnlwzEGljImyp9Bw==
X-Received: by 2002:a05:6a00:190e:b0:71e:4c86:6594 with SMTP id d2e1a72fcca58-72030a51d13mr6901623b3a.10.1729734358479;
        Wed, 23 Oct 2024 18:45:58 -0700 (PDT)
Received: from [172.19.1.42] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec13ea1aesm6944900b3a.155.2024.10.23.18.45.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 18:45:58 -0700 (PDT)
Message-ID: <c4f16a03-6f4d-4aba-939e-14a406bde723@gmail.com>
Date: Thu, 24 Oct 2024 09:45:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pwm: Add Nuvoton MA35D1 PWM controller support
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 ukleinek@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, ychuang3@nuvoton.com, schung@nuvoton.com,
 cwweng@nuvoton.com, Sean Young <sean@mess.org>
References: <20241023111841.158049-1-cwweng.linux@gmail.com>
 <20241023111841.158049-3-cwweng.linux@gmail.com>
 <1087f21b-d56b-4ab0-bb56-96096c23f0d8@linaro.org>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <1087f21b-d56b-4ab0-bb56-96096c23f0d8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_184559_728828_5DCE0349 
X-CRM114-Status: UNSURE (   9.14  )
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

Hi Krzysztof,

Thank you for your reply.

On 2024/10/23 下午 08:02, Krzysztof Kozlowski wrote:
> On 23/10/2024 13:18, Chi-Wen Weng wrote:
>> This commit adds a generic PWM framework driver for Nuvoton MA35D1
>> PWM controller.
>>
>> Signed-off-by: Chi-Wen Weng <cwweng.linux@gmail.com>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Reviewed-by: Sean Young <sean@mess.org>
>> Reviewed-by: "Uwe Kleine-Konig" <ukleinek@kernel.org>
> NAK.
>
> Stop adding fake tags.

OK. Sorry again.

I will resend patch v2.


> Best regards,
> Krzysztof

Thanks.

Chi-Wen Weng


