Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230D0E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 17:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iS6863oeUmKqOBJ6Lt6qSkxo7yA97VcWeLWD1WZrtzQ=; b=lVaQiomlFt/H3DHxNQM/U3jSN2
	Ydc6v2/OdH7X098j49r5Cqcn9sR/C7CBWliuiL4wGxLMJoU1knoUI+ovgv6IoRr/aCUPRR0CGuqJG
	7bTFgBT2GIXgyNhOOrKd27j6/eT0F4W8AT+V8Wri1hlfvqZKPTGp/p51Akppdpw3bhPOp2SX1dB38
	kzF3ItAroqymIhrIncTy1fuu1USc880rFlD5rvHIjGAZMZQ/aJ7uHEo7XnAEx/mHeg0nw0Kuno8pW
	FE2xFK4xPtLxbkITAPZyDzoQvmTXv0BjyER3BUj8qAA9DIYrZpWY3Enr9AzBY9SlBfZ2ePFVcKoqr
	xkcfNYUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnOT-00000001I0B-2YMq;
	Thu, 12 Dec 2024 17:54:34 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnNO-00000001Hod-3Bdn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 17:53:27 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4361a50e337so6796905e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 09:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734026005; x=1734630805; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iS6863oeUmKqOBJ6Lt6qSkxo7yA97VcWeLWD1WZrtzQ=;
        b=Ps3uCeCdOi72RUeVStinVU9vKE7am59seF2hy9bDBftrIgDFi0bW0xCXhHKUYv1Ri9
         2CppY9YoYUI7KdGYbfqHRIHLPltn3fjcwlwwMYYBaeJTWz20FMNfiVF+ZlogW3dhhdK4
         mGbxd23QXKoPqiXv7Pm26OXw6uLWTEJL2AkzwMgj0cUHJRdsZrZsB3f9yLEsBIq9LES8
         aaRVCf8Pa7wFusVpTu3/naARXHjDo6+NamD9q4Uine856dNFm4pBqRF4dyHCzne86Sv+
         feVn1UnUaJp1pEY9ypRnp+T0e7/NmleV4kJGoEtz19fNFS98LJ1SL1QthavB01yFHUNm
         wflg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026005; x=1734630805;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iS6863oeUmKqOBJ6Lt6qSkxo7yA97VcWeLWD1WZrtzQ=;
        b=UFBbSpHwOOpoHtMyfjtVaumzfPEjtSQDXtrwreRVnrbrTgbqf7ocqrksZ5lNhU1t+W
         VKoi75GHUuSKp+lVaM1g4BInSMxhui4QEO8qr9lojwA7YKoFTjv8NjZPoxnfVIHRpYlt
         U6V5sp3QeLpbv0qtxD/96p9LJD2TkKp1r3zqygBRHcr7NaytzxLXqUjYh33EL6YaEBEE
         sQQBHnoR5o5/nVmrlR3kSRnm0mlL58XKHuqWAJcKqc8QK64Mp9OTLrhsCyi/YSIxuTa5
         46xjtMbj67OrmY9uwo3To8X87u8W+gy4eAQw1YA2Mmtd6iZ6h+HKwcO5wqSf353DVptk
         i6BA==
X-Forwarded-Encrypted: i=1; AJvYcCVBzNzHJA6dEfIvrhjROSFE+2PbXAvoRSZ1VJUL43jGhviimwU964Xmid+RSgtj6/oJ7aLx+4fIuK04JdJM55/w@lists.infradead.org
X-Gm-Message-State: AOJu0YyTfvcAD+D2TTF/7VVybuScMq5saezwY77so3geHjnFMYY5Knly
	BpdQh7tXYVPSU4tOtKJymgw0pLhekzX7dhzuA6Y+gZmNFtG2+JxaTwEeFN9rjBM=
X-Gm-Gg: ASbGncve2MHWLH7uDiH8eMdlpCp3+G8lGr7abNNH3XEzV+Oh3I13bQWD+Vkx7znKWRn
	kTXxymm3Q+2oar98u3yf/xYBOARBFDKVboozO0yRitP43R/cdHN5lGw56oMGWBLYq7npDdqwU6T
	xjvBKhrYK55Th9CUuhHX4NgsK0+ElfwnjYxha2KoQlUT0BjqpYykuhLHv9x60O51d5dEsq72fOx
	JJDAe6m7eov3vlAq6kMQTFPWpG8T2nR6VHU80M97cRvYBfTckUuRzfjg9Euv+PB
X-Google-Smtp-Source: AGHT+IFRGvN+/sW8H26flYvrygsp+C9djqkNOUFxuOEJhm3v18/iBNpicIZcLpwU/7AIFCb9hRvAuQ==
X-Received: by 2002:a05:600c:1c14:b0:434:ff9d:a3a1 with SMTP id 5b1f17b1804b1-4361c396c09mr67357115e9.2.1734026005162;
        Thu, 12 Dec 2024 09:53:25 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38782514f29sm4767900f8f.77.2024.12.12.09.53.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 09:53:24 -0800 (PST)
Message-ID: <90720b8f-340f-4f27-ae51-df98b2e5e820@linaro.org>
Date: Thu, 12 Dec 2024 17:53:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: mailbox: add google,gs101-mbox
 bindings
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: peter.griffin@linaro.org, devicetree@vger.kernel.org,
 daniel.lezcano@linaro.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 willmcvicker@google.com, vincent.guittot@linaro.org,
 kernel-team@android.com, arnd@arndb.de, Krzysztof Kozlowski
 <krzk@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 ulf.hansson@linaro.org, andre.draszik@linaro.org,
 Jassi Brar <jassisinghbrar@gmail.com>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20241212-acpm-v4-upstream-mbox-v4-0-02f8de92cfaf@linaro.org>
 <20241212-acpm-v4-upstream-mbox-v4-1-02f8de92cfaf@linaro.org>
 <173402453635.2828943.15564980222849076434.robh@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <173402453635.2828943.15564980222849076434.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_095326_805462_2B4842C3 
X-CRM114-Status: UNSURE (   8.00  )
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



On 12/12/24 5:28 PM, Rob Herring (Arm) wrote:
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/mailbox/google,gs101-mbox.example.dtb:
>  /example-0/soc/mailbox@17610000: failed to match any schema with 
> compatible: ['google,gs101-acpm-mbox']

ugh, I remember I fixed this, compatible in the example needs to be
updated to 'google,gs101-mbox'. I'll send a new version tomorrow.

Thanks,
ta

