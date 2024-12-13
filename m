Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E116E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 11:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+E5hzk9rS5dZ8c/Uf93COABPDOOcFsCZtIif80isDA=; b=bS7sXneBEWYUOox2YG4yx+kRh3
	CVclhnUETpjhnUL5pKqmHPjRO6lBDZJRhp+R24QF5S1IdUn8tb3ZHFnb4frjT9X160m6tavOQTkha
	TqsFa34u6ddjGScrkZeAG/F3LZtGXxIXHCz2VuzDS/4maSp/KLEg7+MeaK9FXAaVabrfOe7Vw4P/r
	+DHL89KqKdwIMLtO6wyc/y3QSSndPDCyhlZZpbz0nVoOb4O7I5lXVwbwUnx7ajltYoOs3OAoNA6o/
	Ln/AacTyCVgkggsCCoDsCS8R/QhGRSStWW4J68x9QqyrybpOJH2XOfD4omuRsjW4/D1hLF2peHOhk
	8aEV9/LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM3ca-00000003WZT-43PW;
	Fri, 13 Dec 2024 11:14:12 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM3bU-00000003WPf-3N2Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 11:13:06 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-aa69599b4b0so24145866b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 03:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734088383; x=1734693183; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b+E5hzk9rS5dZ8c/Uf93COABPDOOcFsCZtIif80isDA=;
        b=L9ZF2I4hM5Ad9DGHoxgVxgliSyPgQ755qX5EMKAOvX76Y1PPHjwfHvANOeJXQZPiNt
         koSiy/B1NQ0LRWxVSFQvxHTiUXw7JHn+Ptz1DT9+QvWDSyqTbmvG4g+LlWWt3Z6ynvCd
         zIkcwGeVtkv/MN/QJRfTc5nBPka45LLJ1F1CzQR+6PqzNmE3+3pL0YxKJhafJLGlZ+a5
         PyC0NAlKV0+R+c9fF0ljAeFR21o7hSiruV6TAbF83mwZpBHg6UJcsAIr1UaFoLl9h4sQ
         ODahtwTIjku2PCWrvjsPL0keUHMCtQr3o+es7N+AkTY1rF6FGSbda1tfW4aMJqC1D4UB
         gnbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734088383; x=1734693183;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b+E5hzk9rS5dZ8c/Uf93COABPDOOcFsCZtIif80isDA=;
        b=uLhN4WvgU73vwQhqHohPMeusxTv2PjjEf24ZG5gPJ5mv/Vh1jw9366tohUfr2X2wAI
         rRvKQlcyi5aEcDGo2zlcxXg+3mMuhyqH8wtqzdVBIsY6M8z2osOJwBsekYFcA4ICbazu
         mXlMJmkkT/bbw/74LZh+WC54lF4MLrhrRbPrZKO8a0mkG+Ik2ACVrKY/I9wyHHGtlH5e
         pq7etBXhNiYA2Mq4gjETAB0n0dk3h1ap2dO225CYzvQMGQITL9U5/Pj8cVFyqAb1Hneh
         3KjyUS+7iOYmcymwPrzINHtYRz4ue44af17nIEJuujJzDxP+9YLHTgWrJ9cOuQb2a+Xt
         r8ow==
X-Forwarded-Encrypted: i=1; AJvYcCVd1w3mSRodF2V5uKf2qU8VAkBXXCh3qmOLmr+4azth75ZTZCGcPooZsAam3U0wXNimJWEJR4spWLxpX9QCw80w@lists.infradead.org
X-Gm-Message-State: AOJu0YzKp/pfv2+r9konaYA7DzbIMprnR1bJKzKyMtGuAN7NmFgNzYXj
	4tjlMpndVhtW4CMXVVuLvR2JKhdnFzZh9DS5Dl8B3tljuT5kdL422cGc4DicTEc=
X-Gm-Gg: ASbGncsLLl8hdoqVmRpu3oNOcglIfPX4BEeWUvQZfFovhSVbzoPaI2VbFAM9UX/txy/
	6P7FDh2u/ZB+Oxtx5Oxf4PyPLfQT9tHyJlUIko3XF+zPJ179za6qM/g5L09aWZO1j+2iLnzjPsy
	Ombr2lX7nEpBp9wuUOreCaq8DveGfoZi5+xqrgIZJ9+NmK7NCzn6IxithHq3vIDSK6BBGtXiX83
	I2NTO5H1L7N+FYjPSEdtBtZqRU9tIgBso3oNTgZfDBvEuF4uqCUEbImi3mICr0PEiepMA963Jw2
X-Google-Smtp-Source: AGHT+IGnmOk3a3BoY8152J6bn0Wf1bM7LihNq7gANhmPoA5y0olGDGsEn/VPMC8xmVYLYbJnqljsBA==
X-Received: by 2002:a17:907:60cb:b0:aa6:6f12:aa45 with SMTP id a640c23a62f3a-aab779c1559mr85659266b.7.1734088382563;
        Fri, 13 Dec 2024 03:13:02 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260e6c67sm1224446366b.187.2024.12.13.03.13.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 03:13:02 -0800 (PST)
Message-ID: <17435684-a1f5-44cd-ac25-7e8efe88c754@linaro.org>
Date: Fri, 13 Dec 2024 12:13:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/4] Revise Meta (Facebook) Minerva BMC
To: Yang Chen <yangchen.openbmc@gmail.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 andrew@codeconstruct.com.au, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, patrick@stwcx.xyz, amithash@meta.com
Cc: Jerry.Lin@quantatw.com, yang.chen@quantatw.com
References: <20241212133226.342937-1-yangchen.openbmc@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20241212133226.342937-1-yangchen.openbmc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_031304_845153_96DFB070 
X-CRM114-Status: UNSURE (   8.50  )
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

On 12/12/2024 14:32, Yang Chen wrote:
> Revise the linux device tree entry related to Meta (Facebook) Minerva
> specific devices connected to BMC (AST2600) SoC.
> 
> Base on:
> https://lore.kernel.org/all/172722509817.374662.7338401100529556748.b4-ty@codeconstruct.com.au/
> 

I don't believe. You are working on some old kernel. There is no way you
can get my address like this. It's impossible.

Form letter:

You CC-ed an address, which suggests you do not work on mainline kernel
or you do not use get_maintainers.pl/b4/patman. Please rebase and always
work on mainline or start using mentioned tools, so correct addresses
will be used.


Best regards,
Krzysztof

