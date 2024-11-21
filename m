Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1374D75BB6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 04:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1/0XIMY2uA6o6zIyzy4M5ULjqGepYEcYqaZjgiCOkJw=; b=nGj/pptgkue+b+lR8PSLI6x01B
	TKw4Nrcy8R0XntBoBfFuEeOn0E0HsEahsYET4bC8rXWv5Uk5umu2J4UqwzftGVig+Tes5IY+6E0+H
	wrh1QoWa0zSOqJn1RMLNbjkRa/T8b1QvKIn6FM3iKKL8wFmqKPAE5Og+yUljfo+5yYUo1/y6BVm+x
	p3CrZb3MNMuyLXgV7lLvpTFZh870cAFmTgzAcazWP0zCkYMWlXZ467CR6+pVX6eyF4ybo/MSezX9H
	HfePg8USIPomVMr4WKNcd+VxypeKVcwJxAeDKoP5PYh7Dm4BFT188i97aBf2Kcl4vzu5suzwwxzu1
	7D+a99Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDywD-0000000GoDl-3y7r;
	Thu, 21 Nov 2024 04:37:05 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDyvE-0000000Go23-49Sa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 04:36:07 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-71e52582cf8so386926b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 20:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732163764; x=1732768564; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1/0XIMY2uA6o6zIyzy4M5ULjqGepYEcYqaZjgiCOkJw=;
        b=BJcmB8/3E/hyDy8P9K2nvS0zmLaMuOXttF81RWyc1/A8nMA4+2eYV3R4Yo/UT5F+jE
         QlWL07wBdedZSaVKF4kGCQP+y6KjIsylb9ozPfmS3hEzS0bVxFW9+JF6/bOp7JwM1R4W
         0iuJnmt0RMODDL4FLW6JkPRMqOplAX3spJKEs/X1fMeNBnOvGviSaB4Smw1AehK0Sklc
         dXFRX9op3ejP0tw8GeWDjNOeQLRMoH+Ssm5OXiq/LWu4HfEt78BA0Kc0ZeBXaS1EZu+e
         p+cWaBh0lTBQ9g65beeppyp0GXOFk7zoXreaszu8Ee5O4ZERVHlzCyA7pIcHQXx1U+c7
         2yNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732163764; x=1732768564;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1/0XIMY2uA6o6zIyzy4M5ULjqGepYEcYqaZjgiCOkJw=;
        b=dBgGouVcCUWgPSQN5n86EtXAAaoFbLwCpXjEajaYdVNcBdobLO4bAyrPuGcEJXMyqB
         ObRyGuz7rygTP5x/jfzb4kWMx+f3fT7CpzD41Mb29D6oRmVIGjiy9L1ajql0Kg1CS3Z/
         R13frOIfsof6aDFQ5Wj86it6xoRrzFYfGtDofJ9ZKKoun8xF88FPD+24u2C/Vf785AJj
         jZSOSXZg/XhUgp3bhjBR0L0jIfQMY00Y1x73Q2cvgUiivMRTvVejwxjVYyVPfQqZspiW
         Qp6KVm5DIMmgnsW2A6fX1Z2VJ4DiMQuqeN9Yr4CK6wjhb3nvJ+LJ1jsE6l/fmb0BoSNI
         kViQ==
X-Forwarded-Encrypted: i=1; AJvYcCUX5VDW3xWzswDA+MTCXt+tZbG0Um1tcJj8HD0Zp9THLtLkV7M/WcW6nxCI37YrWbvUoBmakFVCP6ru/GBQwi3p@lists.infradead.org
X-Gm-Message-State: AOJu0YxcA4ya+JqqankOnS7KBk3rWUAKIP2BPIyq5SL8HTHxZeADBeAx
	45amcjUYS6AxGaKvLo1/zelt2pVQ+GFYcgW536IkYeiYUXvPusjY
X-Google-Smtp-Source: AGHT+IFaemvzryO7WCLz5Ca6Xg1J+x2yyqw0JJSN0FkNyVQdTywTiZN7n88034g5Msg4VO8+oq5ykA==
X-Received: by 2002:a05:6a00:21cd:b0:71e:1722:d019 with SMTP id d2e1a72fcca58-724bed5a647mr6328217b3a.22.1732163764184;
        Wed, 20 Nov 2024 20:36:04 -0800 (PST)
Received: from [10.10.14.80] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbb659fccesm393651a12.73.2024.11.20.20.36.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 20:36:03 -0800 (PST)
Message-ID: <b13e5063-3b07-43ec-a7cc-b19e73b7c9e0@gmail.com>
Date: Thu, 21 Nov 2024 12:33:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] Revise Meta(Facebook) Harma BMC(AST2600)
From: PeterYin <peteryin.openbmc@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20241121025323.1403409-1-peteryin.openbmc@gmail.com>
Content-Language: en-US
In-Reply-To: <20241121025323.1403409-1-peteryin.openbmc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_203605_026202_20D35AAE 
X-CRM114-Status: GOOD (  10.01  )
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

Hi Andrew,
   I believe this series' path will conflict with upstream due to 
version differences between OpenBMC and upstream. I will update to the 
latest version of the DTS from upstream and submit a new version 
accordingly.

Thanks,
Peter.

Peter Yin 於 11/21/24 10:53 寫道:
> Summary:
> Revise linux device tree entry related to Meta(Facebook) Harma
> specific devices connected to BMC(AST2600) SoC.
> 
> Base on:
> https://github.com/openbmc/linux/blob/dev-6.6/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
> 
> Base on:
> https://lore.kernel.org/all/14e1a0f581417d4228aea8c2569598d42b4bd334.camel@codeconstruct.com.au/
> 
> v1->v2
>    - Provide additional details for SGPIO.
>    - Add adc128d818 device
> 
> v1
>    - Patch 0001 - Harma: Revise node name
>    - Patch 0002 - Harma: Add retimer device
>    - Patch 0003 - Harma: Revise GPIO line name
>    - Patch 0004 - Harma: add e1s power monitor
>    - Patch 0005 - Harma: fan board io-expande
>    - Patch 0006 - Harma: add adc128d818
> 
> Peter Yin (6):
>    ARM: dts: aspeed: Harma: Revise node name
>    ARM: dts: aspeed: Harma: Add retimer device
>    ARM: dts: aspeed: Harma: Revise GPIO line name
>    ARM: dts: aspeed: Harma: add e1s power monitor
>    ARM: dts: aspeed: Harma: fan board io-expander
>    ARM: dts: aspeed: Harma: add adc128d818
> 
>   .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 134 ++++++++++++++----
>   1 file changed, 110 insertions(+), 24 deletions(-)
> 

