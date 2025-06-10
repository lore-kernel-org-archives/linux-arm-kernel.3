Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954BEC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 04:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r/Et+5TuD3+3/eVjp6CpBE4hmFK8ASCNFdhg+aniT+Y=; b=3LL/a2+Nteuobl2INLg7nKr3Je
	4ccTG5gs7QxsNCcegI02aoX+/rTN3DR83L/3iXtVYTvawmAIFAIFqyNUvQUH5PJT/bSEcCvCKKzZ5
	+WMCgHEcl4d6oQJ3NNkRovw8S89MIRSnmiGJQAFkQRp090pvBSrBgcAvBWw3VSHt1AFUxMEhfnnL1
	fDCBHr6Hn4lJugDc30Rta9h+kmgeH9y2omhyBtnym8ME/+iXiscJpUe+arMZQN6sj9fBNmShTtIHG
	PNsVNRht1qJb2SkMn6z8xR5/lPfnuw2i/O3KvdbZyPQ8x5owRdcTgVIor9iriz5ZKGYEKfp6oLrRJ
	vIUGoJqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOqtc-00000005mIu-2yyn;
	Tue, 10 Jun 2025 04:47:36 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOqrU-00000005mBN-3Rgm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 04:45:25 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-234f17910d8so48601925ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 21:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749530724; x=1750135524; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r/Et+5TuD3+3/eVjp6CpBE4hmFK8ASCNFdhg+aniT+Y=;
        b=eD7nx69OyX8sjmqMs90jmJNc2gveyYRp64XlESBTMIHUqdYZZtjXv4LarG7GxM3A2t
         Lw7gzRoz5X+njAR8DxPxdMSQvQugCJ6+JEEcZ+zqx4uvQzmacTYr4C2kzvZ/I1noMoN7
         Y2hBJ/A4wr5T3PpUfLggOgY/67IZ0VqoO18ZWDuAWMB9BcHCoGYuxi5uNkrfR/jCjgd6
         Kw3RI1p2LG9yVD18So5L2Nsrrn9IuyWda1Be9GHCEln6Z7Yr/Gizp8pfU5fQQdXOYuun
         SVw+fvH69k9ExRn4caaPUUvc+VXVIyhqUoDVQjIy7FCSCaeXGC8gYs8ay5ixMtpoALJk
         ONsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749530724; x=1750135524;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r/Et+5TuD3+3/eVjp6CpBE4hmFK8ASCNFdhg+aniT+Y=;
        b=kRxZhXypymmLmYNa8J0tbLTy5oulBpvn/NmuYfSLiMWHb+XUWLul1SArdfuepMKhG8
         +K8cqYlvGkggQOz4s7CHqHB2aP+wgMLs1QNIQCDimbJ0xRYTdWXjhPwznCRwzdAkhWac
         fJtB87ypz+jayImOGnw+hOXsUhdPa0+MY8Q1z+zPn4c94pdyde0umQ6td4BG7ZfdYseD
         V7Q5W8BJsvvoaYiB6cbDAgeU0D4mMFs7oKhsejGQ7KCIVimM4EDLY9tvEm9UGau55KCF
         tmyYZhPKkHcfamR2X5mqqtTUV6Xl/ly/rYFDqXC7D9174N64VvxjWKmSGtu/vuBz3saM
         ZbkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUogwgj6tPTdCHvqpacIJyT9V/wCuI0B3lybtuxeVL55aDXRcfuq2w1DX7ypCGeBcSxrTmNnJWbQaD8e6oG5Fy4@lists.infradead.org
X-Gm-Message-State: AOJu0YwRNriSfBc5Uff5ycj6PBthf14WlSEmws/Rtzc0YNobYRaxlzXY
	DYX7a1163NIZnW+II7D9Pg8fPVGqKAH7+mxKrdYQ1o/BTYtlaK0ZpGTI
X-Gm-Gg: ASbGncuZcuxl0WNE/oFjrnn8+8x3XCQEg6XAYzvV077482EpX9PzgWA9TwGmwI2meE2
	3lU0KInvbOzkcYfHrF0VRfygmE1hvN8qe0Yd9eD4aDB0FkL5cvcCBdoZjAtgXpIqGBFp93vCNe2
	5gqu1btDHSYIUEWhl/uBh/7xWXv+WCT3hKEH4h9WI/D8fOIy/aBOzJdkK2n5n5VdAz/T+rKuubi
	0wczOOpcB8lRTBhmXXZ49mgtnfFaGPF6vrkFdcNm/bfGy3dd1+KU8L8vQoy3T/9aLv+JKr68Yoh
	839/6AlqYArrmEmK/JuMmxZ7/AZdIk2ObVWds9Chw7Xq/HdI74gvGg9W0FsPr2/6N2LquvxDYdf
	loLM7NVNJ6g==
X-Google-Smtp-Source: AGHT+IHeRu19sm8U6zfByMrOVx2wCrnbnafwzEKk+Sxwil3JgYJqscTx70zWuYMZYSWgk7wrVdu93w==
X-Received: by 2002:a17:903:22d0:b0:234:8a4a:adb4 with SMTP id d9443c01a7336-23601d247demr212907365ad.21.1749530723858;
        Mon, 09 Jun 2025 21:45:23 -0700 (PDT)
Received: from [192.168.0.119] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034109c4sm62853365ad.210.2025.06.09.21.45.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 21:45:23 -0700 (PDT)
Message-ID: <81f03b76-abd5-4803-b8cd-679013aed359@gmail.com>
Date: Tue, 10 Jun 2025 12:45:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] I2C dt nodes and bindings for Apple A7-A11 SoCs
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-i2c@vger.kernel.org, asahi@lists.linux.dev,
 Sven Peter <sven@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neal Gompa <neal@gompa.dev>,
 Andi Shyti <andi.shyti@kernel.org>, Janne Grunau <j@jannau.net>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <20250609-i2c-no-t2-v1-0-789c4693106f@gmail.com>
 <174950228622.2915605.1412644681389156564.robh@kernel.org>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <174950228622.2915605.1412644681389156564.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_214524_861842_C5CD01DE 
X-CRM114-Status: GOOD (  13.53  )
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


Rob Herring (Arm) 於 2025/6/10 凌晨4:53 寫道:
> On Mon, 09 Jun 2025 22:56:17 +0800, Nick Chan wrote:
>> Hi,
>>
>> This series adds the device tree nodes and bindings for I2C on Apple A7-A11
>> SoCs, since the existing driver appears to be compatible. The drivers for the
>> attached Dialog DA2xxx PMIC will be in a future patch series.
>>
>> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
>> ---
>> Nick Chan (8):
>>       arm64: dts: apple: s5l8960x: Add I2C nodes
>>       arm64: dts: apple: t7000: Add I2C nodes
>>       arm64: dts: apple: t7001: Add I2C nodes
>>       arm64: dts: apple: s800-0-3: Add I2C nodes
>>       arm64: dts: apple: s8001: Add I2C nodes
>>       arm64: dts: apple: t8010: Add I2C nodes
>>       arm64: dts: apple: t8011: Add I2C nodes
>>       arm64: dts: apple: t8015: Add I2C nodes
>>
>>  arch/arm64/boot/dts/apple/s5l8960x.dtsi | 76 +++++++++++++++++++++++++++++++++
>>  arch/arm64/boot/dts/apple/s800-0-3.dtsi | 57 +++++++++++++++++++++++++
>>  arch/arm64/boot/dts/apple/s8001.dtsi    | 76 +++++++++++++++++++++++++++++++++
>>  arch/arm64/boot/dts/apple/t7000.dtsi    | 76 +++++++++++++++++++++++++++++++++
>>  arch/arm64/boot/dts/apple/t7001.dtsi    | 76 +++++++++++++++++++++++++++++++++
>>  arch/arm64/boot/dts/apple/t8010.dtsi    | 76 +++++++++++++++++++++++++++++++++
>>  arch/arm64/boot/dts/apple/t8011.dtsi    | 76 +++++++++++++++++++++++++++++++++
>>  arch/arm64/boot/dts/apple/t8015.dtsi    | 76 +++++++++++++++++++++++++++++++++
>>  8 files changed, 589 insertions(+)
>> ---
>> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
>> change-id: 20250527-i2c-no-t2-2f3589996d14
>>
>> Best regards,
>> --
>> Nick Chan <towinchenmi@gmail.com>
>>
>>
>>
>
> My bot found new DTB warnings on the .dts files added or changed in this
> series.

forgot to include patch with the actual bindings v2 should fix the issue

[...]

>
Nick Chan

