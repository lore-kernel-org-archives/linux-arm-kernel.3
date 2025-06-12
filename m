Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70EEDC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DKvQ0kizkJd8CblYTjjvTx/DyqmBuLZOpwvQ/Oh9KYc=; b=YvNT2WhhmNg8Kopow1R4bCWz3y
	IACkJfLoT+3dtHEm8G9aJDxFo5+qkGcr4N3aeTK9TBPbItCAk1ZAAV4UiIzhKWXq8O2yyyVS09rwW
	2fwHgeDcvyBxGy3eG7KCjHnYuNAPUErsCV4HP2zeROuPWip2YqB6diU+7C9nvKiULTrPfXHR5PeDk
	ELTExtm2xq8DVen+krABryRtSNxhnEjjFG6t1EyMXoRudUcVihM8YcNMsR+kAUPhyUHEEnvditvwW
	4erhmfkLsOz1oapC+sgCDHrV/1XdMZHx8vqGGGiUOgVvi5k9Ezje1S+MPuFNoR/Q72iTcKK/tBP/C
	T5notBow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnr0-0000000EJlh-1WUs;
	Thu, 12 Jun 2025 19:44:50 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPjsG-0000000Dn8N-2Xpt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 15:29:53 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-44069f5f3aaso1514255e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 08:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749742191; x=1750346991; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DKvQ0kizkJd8CblYTjjvTx/DyqmBuLZOpwvQ/Oh9KYc=;
        b=UWAfK/ERJFzWEOXlhVvTaRvyRfrP6jbPOpASM9qWPjG7FX1+VCtFM08wcmJwcOm+KM
         7G+8HhY4+LaLbEfj91BSHaXUaoWmzNjmXrMYRqXWUyGSi6tC9yDJu84yijkwkid43M8X
         4746KEe0eMFh7nPe/4UlyGuralFE33uVpi8AgF3QApK2jG0JQ6lEHP5E3jsBoTJ4gXJy
         yktSB97KGkO6GjFSlN8X7XIxPt4QlHYuBgJFq1Z92J2ojJr4qPq8j3QZLdlR1CeG3p0l
         vmdf8OcoyuYestEEwCo3VGXt+ajYoFND6xNETFrzm7Nox7vwop61VWyPmoi4xkJanHYJ
         rsYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749742191; x=1750346991;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DKvQ0kizkJd8CblYTjjvTx/DyqmBuLZOpwvQ/Oh9KYc=;
        b=B4XA3xnxkFo9arxS3WmNdcV5hqB4BOZsXHzEMjuw8Ysr5JhYRUtQlThDAJV5KJAFAY
         zIc+aMJnhtriPBeo4JZY88xk4uvE+SSa1tXYRhXywpYBDIq3WNdn95ImaqYeht4000hb
         1qsmcCuq5LkvdAHQooTQw97ErLAKQ5c2v0nTU9CamCw/jGU/Cd+Abv3aYH2qkml8g92M
         wiTgOIwbKsW3Yi789636ObBXpWXwmpp5dtEVow9iFQd8xlS1NhiZGuVmwcVcpZjNVOB4
         TXZsk0nRv37cVa8eV6Oae2Bz6lSs4vh6U5yo3sgg1Wfo8irpyGS3O3nTctJt/fadjS5Y
         hZYg==
X-Forwarded-Encrypted: i=1; AJvYcCWsicyA0mqgcGPS67QxXH8mYBl+3Dad+gStm3DaveeJW1T9K1budjc4zFdNbJhCNsKuh12p37XEJcC8hPp68kHc@lists.infradead.org
X-Gm-Message-State: AOJu0Yxu90se5yUTtzopQAxm6Rz34+Z0UubUGUg2Pp+pJ5ni+ew7pROo
	bDL2pStj/XLI3TYabwXmIjHFV/tbuo0KaJ0mNnuzBLdul+OSaGW93w0sJQ1iBIQ7ijo=
X-Gm-Gg: ASbGncsVCsi5fr4coeDHkp4cbm6jFeVaOOI96HxisR6njm8G7K8VmX8ne8YmZZObjm9
	9D1XdyNx5zn/e43/fVp1tuRF1sWYnM4RdO/MFMPhhLgYYz/7k5HyCAAldasdZkr5cDLCy7FIhuZ
	9wEVqeUmz5KCKy/IZZOU4uVAEk8vSKSykERIJF6+vjp9JGOkmW4nf2r5ROnQsHz6HYqlhSq3h8T
	e0WmNXOPMTT7wz0ohZ9xSXO0TFF85qwMMgn5Zn82ZaCn8k6pECccLs4gkkgd7Dx+yPmuo3fvGk1
	0xd35wBDR3EfWAc4mM+nRopIs6FKkOSyae8ccE1sb8mdtENh9VCzCYVEtMX5VSz5bteRUefrG86
	TrgV8hIc=
X-Google-Smtp-Source: AGHT+IHcEf5K0JeoZyRffkMk2oZLKO8IT8ky+qUldOOWFDZEO8dRcFFzDiYHDmEiK60pzDMoVYDLyQ==
X-Received: by 2002:a05:6000:26c1:b0:3a4:f8a9:ba02 with SMTP id ffacd0b85a97d-3a5586b8858mr2648512f8f.1.1749742191063;
        Thu, 12 Jun 2025 08:29:51 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e232e4asm23557265e9.11.2025.06.12.08.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 08:29:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
 alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, 
 robh@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com, 
 sunyeal.hong@samsung.com, shin.son@samsung.com, 
 Raghav Sharma <raghav.s@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 chandan.vn@samsung.com, karthik.sun@samsung.com, dev.tailor@samsung.com
In-Reply-To: <20250529112640.1646740-1-raghav.s@samsung.com>
References: <CGME20250529111705epcas5p25e80695086d6dc0d37343082b7392be7@epcas5p2.samsung.com>
 <20250529112640.1646740-1-raghav.s@samsung.com>
Subject: Re: [PATCH v3 0/4] Add clock support for CMU_HSI2
Message-Id: <174974218878.126240.878153774506566554.b4-ty@linaro.org>
Date: Thu, 12 Jun 2025 17:29:48 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_082952_649469_04216C1D 
X-CRM114-Status: UNSURE (   8.11  )
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


On Thu, 29 May 2025 16:56:36 +0530, Raghav Sharma wrote:
> This series sorts clock yaml and adds clock support for the CMU_HSI2 block.
> 
> Patch[1/4]: dt-bindings: clock: exynosautov920: sort clock definitions
>         - Sorts the compatible strings for clocks
> 
> Patch[2/4]: dt-bindings: clock: exynosautov920: add hsi2 clock definitions
>         - Adds DT binding for CMU_HSI2 and clock definitions
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: clock: exynosautov920: sort clock definitions
      https://git.kernel.org/krzk/linux/c/3d6470990bfc8600609177962a53201cb0640daa
[2/4] dt-bindings: clock: exynosautov920: add hsi2 clock definitions
      https://git.kernel.org/krzk/linux/c/da5cb65d25f747236a003b82525eb6de5d49a2e6
[3/4] clk: samsung: exynosautov920: add block hsi2 clock support
      https://git.kernel.org/krzk/linux/c/2d539f31ab0eb3eb3bd9491b7dcd52dec7967e15
[4/4] arm64: dts: exynosautov920: add CMU_HSI2 clock DT nodes
      https://git.kernel.org/krzk/linux/c/e2016763590f571cdc3912d6a7ec848d2b61e6c2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


