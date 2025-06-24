Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7433FC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 07:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2OVh4Jh0rNBjL9Id+4yEZcEDrJ76F7tEWKqVxELxixE=; b=zbMgtCBIIByjWh8p02rdY/ILic
	jyimB0y86L44sRKxk7Ujrfxl9lpvtXZkM5sLifpWyp4B/MF34Gq1FyeBziNwAy9q8943ylKvIm2Vv
	Cl0kEXLZOQ50lPD8+mFWSuTy9ofzi8TQF6RPGqBmXJm4D70W+7bQxZBa9pkhCd0WkN8PAjfSAY/Ih
	ZP0XzyKo94P7KNDEitFxCbQ6Iqvjlifhdr0W+mdEKDuz/nEVDVLRZ9pKoAVp6iSWnAOf3LNOsNU5M
	9ywBmKKjepFNTeFkhEgXKq3oQoYxtaP3Fa3/3g6o/Hss39b9I7YYfbix054BSmIETSov7/HSwvyi1
	9KDIVs2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTyBW-00000004sxC-2uw0;
	Tue, 24 Jun 2025 07:35:14 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTxvh-00000004qx7-1bWC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 07:18:54 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-adeaa4f3d07so994447966b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 00:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1750749532; x=1751354332; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2OVh4Jh0rNBjL9Id+4yEZcEDrJ76F7tEWKqVxELxixE=;
        b=TQXYN3HQIKtS9BXCRtkI4T6WxMriqhU2CM3ZCl6W1u7ZveXLZ1aUhA3IGWCGCRzUB5
         1jOg2myQSPZkzYPRa/b7RPEBgbduR/+vQNb3HaarsL5QQQf9dzLhmcHmYZupQmq0XQnk
         wDL5L8hD7oB5w5mCbMSGf82OlqVkRq9vZQr2/tdfS5k2IqV8VgO+T+jxwk7PGjUl9+l0
         3USMnCqzcPkaE6LNx0FAsEraTM5yxe783mOpJec+aZsKjz3CjjV1iCZwfR1585Bi7RAL
         mdwRrKs/KGUxYYWS6iVspt/3+zc1ZNNQ9RfT1DiOmUyUinPNFqwFp1QGOcPqNVx9leff
         yZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750749532; x=1751354332;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2OVh4Jh0rNBjL9Id+4yEZcEDrJ76F7tEWKqVxELxixE=;
        b=JRzdU3h/z3WUdJc2NnXYDb5u8P23YtMwGTfHmySvpUGLVIoMRn8pzj7XDYwHAuJkb9
         aTgg1AB3t5IlUPyAaF2ptAiqCR42N0VKKBi2EQWj63T8nrpek+PLjwW7ifolLH2DSoTq
         HexLVkL2Epk8Fnb7Q8Yolg+sk33c/86DuE7ijS1avjDVbtA9PqFAKY1W2oGcUDU5W3IP
         e4dXjx1rtfjAZ3kddZd99X0yW5IitMuMGDBHt0L1KYIjwK7YL8384y5xjI7JQYiMycZJ
         romn8C/sWfJLzdpFm36boZQdPCojwngbvb6ddubGkXZEpRRaN8RU/j7OaGshzlb5CeXb
         qy1A==
X-Forwarded-Encrypted: i=1; AJvYcCU7JAiNaGOShOCN0lEhiV+DLhju5yAvNpJrvmP840olrWo8o7FYTiRUmlKtL1+etEBPIb1zJXwEbd7rp0+PuhdD@lists.infradead.org
X-Gm-Message-State: AOJu0Ywx7B0Lui0TgTdQ6ISpvlCxwZU/EJsthhcG5Z6yRYcVRhvmjOE6
	HjxfdLtIB/PREFlgn+70ca8u5lUNBYSKoXZ8QCxSw63FPi9ZyTbzD/b55MfVc69PmIA=
X-Gm-Gg: ASbGnctim/uNhmBMbw41ahaFXel0crttAq5aAES4cB7DKw3yecQmmxYoF9wKHaApeFZ
	6x7MsW2UJSXnjeZWhIEJ5spsufueTIBr4wje+fxa2CNQ2/PtSYO//CWXhpCYj5EiTDLpQZ/czCE
	zMMLHcvB//L0NGvKAHp4ppGalXKgp5NfrIZxCnZFZJ+stGZ5RXzi8xAIS9j9dSFk024/wevGNHG
	ZAxZfe362tRub4seLnaW5eQFqZFVLlsLsDafOoefGL8CPFCxBm+gxr40Vp1R1aqIaH0SEU0Yaxw
	0DGk3vXFcdeKj7CQWIJWgPk6KWVxIKWCqrZ6ykr2ZRQDjPuNqrXe6Qw1N/RjAo/ZK3EDAN0=
X-Google-Smtp-Source: AGHT+IGI8iwrZ7v404228P/a1AWPFqYItuYifRpy4WeOeTkndey/Diu8iL6ffoSt7fIYpvcvq1pPSg==
X-Received: by 2002:a17:907:c16:b0:ae0:ac28:ec21 with SMTP id a640c23a62f3a-ae0ac28fbcdmr130864566b.13.1750749531544;
        Tue, 24 Jun 2025 00:18:51 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054082d0esm830333266b.79.2025.06.24.00.18.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 00:18:51 -0700 (PDT)
Message-ID: <1524eb69-e3d1-42f5-94fb-cc783b471807@tuxon.dev>
Date: Tue, 24 Jun 2025 10:18:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/10] SAMA7D65 Add support for Crypto, CAN and PWM
To: Ryan.Wanner@microchip.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, olivia@selenic.com
Cc: linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1749666053.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <cover.1749666053.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_001853_428118_7CF0388B 
X-CRM114-Status: UNSURE (   6.68  )
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



On 11.06.2025 22:47, Ryan.Wanner@microchip.com wrote:
>   ARM: dts: microchip: sama7d65: Add crypto support
>   ARM: dts: microchip: sama7d65: Add PWM support
>   ARM: dts: microchip: sama7d65: Add CAN bus support
>   ARM: dts: microchip: sama7d65: Clean up extra space
>   ARM: dts: microchip: sama7d65: Enable CAN bus

Applied to at91-dt, thanks!

