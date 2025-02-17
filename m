Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE86C021A1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 10:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=phm8jSsieZLAYRvU94lHS+2KE6EOrOJ2bxUAvn5iaZ8=; b=daCpI3z1gLVR0P
	6jOQbN6LZbQz+gtMo/K5jj6pj21OGY16lzlXZtujHuFBRYzdgQveTvRplzpwOqdDf4P/vR8LouEkT
	98j6lCPAGkRaGLhmBMOzllq7BPDzQTMhatEZMvKXG5NwGQAzHKAMoEtwCQ9SET+hCbTe9kuicASXf
	33DE6+z5I2MYxVQzrxeytWM/NdZn5ttR4Ux62485+VeYbOBDUmg08Vjh7y9SEZBNAHAMSi+fUxwvr
	TLs7ett0mAUJqwCGPKEYo1CkA+bYAONibPt+w4jRZbnaZf++68oAssP5CRDIfvvrUeXr7QGyM5bjL
	dOxWi9XiEkCbuxvUDArQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjykU-00000004AT7-1fK8;
	Mon, 17 Feb 2025 10:53:14 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxD6-00000003tfv-2FBu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 09:14:41 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-abb7a6ee2deso231163466b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 01:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739783679; x=1740388479; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=phm8jSsieZLAYRvU94lHS+2KE6EOrOJ2bxUAvn5iaZ8=;
        b=XAJSQ14Gb8olNwllUpowtgVJnt25tukj0wUYxWgIUn3BzYqrmzKxxdB+FDJ5WlONQz
         jD6HdxBz4TzLW5FjdaiccWePLKwp3A+zJ/OtTPHl/T5CLlAl/nT7AsNZJMNTi1Y+9MVp
         qayY6X/UVUaRrRoJZ2YXVL2CeeQbRhZHITF1emdsPmqKr65aW/e7khPG2QdOT1s8ypBl
         D3dTclDo++0Jscsv6v8nzJ/dtSvYEXpaz4FO5bq+YmFt9pK7sBHhxdp3wjrrF05wmzYQ
         aGaAZooKiz55APgsvjxoI9AklNft9iorTQxT36ha4EOOVMWBWk4V4HDcxNHqquaLnTb8
         ob0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739783679; x=1740388479;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=phm8jSsieZLAYRvU94lHS+2KE6EOrOJ2bxUAvn5iaZ8=;
        b=aacuXo5GNvW0etBMq246S+jNlDqMQNkz1UBxFYEPKNbdlNyQB91FIGP1UVCV/yhN0M
         6YWgKwBM6b0mV7gdKKX/tG7yqFculpZfM8l6iJObiC4YXjrbyF4L1y7LEA2Rk4niHYpJ
         1YvYgqwKYuG3hxXXYope6l6qqnD61qI5nlokaZMv6cIf+owHQEx9YTBsh+sI9Z35YZB9
         tl1OiP8/f8rs0MGXNmHTpoPJfaahSH6rFIjYWb5aHqion4CMmRIRTIcGzSgtLCDbxzQx
         VZjn+gtiXFAwOl/v6t3H6Loj/Ri+jEaCWcFq8OWQSombF9J2YHX4KTgvjgV0CXfmBgS5
         PZNw==
X-Forwarded-Encrypted: i=1; AJvYcCUlr6xXhwAPBCVEb7S50Tu1/y/PlXZcTbKWLRu3yG8Y1iqrjOqE6eLzXUqr5M15wxpVS9W5aiRhEhtO0WsnxoiF@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6+2Z0l5I+liJuytFtpALR5SaYdNGaTLp7WlBThm9yo6cadp3J
	8XEc/L+E/aJBOXQQ8KVj3oqDuMOy3MxCsSovfrVXGXt1M0+9uRgleTJ7zni5o2k=
X-Gm-Gg: ASbGncvdhuUeq56KMa0es949PYy2eINvz7mAs9libV3rIq9pUIQSxsF7tyhBE41R4WJ
	UzCeKtMlqs6NwTm1co9bJIDeBb5sj8Jrs77LeJOja36jLmESP6sNdCdCQhboD/IBAJntcr9OgI+
	zcCQ4XxlzGMhrkQlvWOv31ivoB7Eq4kEp/Ai1ybLf6oSLZrVmW620rX67/3UmwBb2WCacIi1hAr
	Teh5JCFGfFGylqvNNGvYnO8lny1LSvH/2rIez8qir2ph00eFWuzE+2ZuueqpZRVO2Wxx8tDlFDr
	W831JBKVtLAnY1VjSjgOfzk=
X-Google-Smtp-Source: AGHT+IEpE1aPz/0OBl5FnqhprsbjTn0AOjkVKHoE0FYPvQ0oKK62ZfJEvZI/uI5uJpbb/p9xjwMm6Q==
X-Received: by 2002:a17:907:9494:b0:aba:5f48:eda4 with SMTP id a640c23a62f3a-abb70b6bf71mr866918566b.25.1739783678693;
        Mon, 17 Feb 2025 01:14:38 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba532322aesm861089166b.17.2025.02.17.01.14.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 01:14:38 -0800 (PST)
Message-ID: <7e966eea-e2e7-4fd4-bc6e-67fd49c57ddd@tuxon.dev>
Date: Mon, 17 Feb 2025 11:14:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] ARM: dts: at91: calao_usb: fix various naming
 problems
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-arm-kernel@lists.infradead.org
References: <20250131210236.36212-6-wsa+renesas@sang-engineering.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250131210236.36212-6-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_011440_577301_A24EE95A 
X-CRM114-Status: UNSURE (   6.95  )
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
Cc: Rob Herring <robh@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi, Wolfram,

> Wolfram Sang (4):
>   ARM: dts: at91: usb_a9263: fix wrong vendor

For this, I'll be waiting a follow up on
https://lore.kernel.org/all/20250131162713.33524-2-wsa+renesas@sang-engineering.com/

>   ARM: dts: at91: use correct vendor name for Calao boards
>   ARM: dts: at91: calao_usb: fix button nodes
>   ARM: dts: at91: usb_a9g20_lpw: use proper mmc node name

These were applied to at91-dt, thanks!


