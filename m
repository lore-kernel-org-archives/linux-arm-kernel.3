Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBC1C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 14:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sCZsg9RW77pf5g7VO318qCm3+bDOX2VQbow5YNOLPdI=; b=am+OsnvhDbrmNirXPkhYezG06S
	Qm84b9yYMQQP/TmhGCFllDYBeJ1rSlIN+741QHlfVbcTXkEVc4Hfnhb3jW38RK31kNlztroI8uF2j
	awQBMSoSBIjUp3jrrF20BUCDR/1PKGZO+UW5b/86nXa5CDYEKlT3YBddwcNWbK+mjlu8dVq0x0CGR
	mFQZRI/Zha42gSL+34tKG0Cn+60KsAPIb2RHCpsTLo2lfYmtW58TtgA0IP8Y9dT+zGk5Qm3KExpQU
	bWzE7ISthzz0YefPLBkyiPE+UXcb14u5faNhRz0ZmF3C/jfy1ELXgeANDAwj1BjNQGIe6+0CMF+Sr
	zFpllvQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3FlV-0000000EA7s-43V0;
	Fri, 11 Apr 2025 14:53:57 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3FR1-0000000E6V1-1IeK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 14:32:48 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso15630695e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 07:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1744381965; x=1744986765; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sCZsg9RW77pf5g7VO318qCm3+bDOX2VQbow5YNOLPdI=;
        b=TsQNUrRTs0WAFLRiLgCYQO/fJo/WSlszJqKaKnM8cH0vT9+UutXVl4KFrxzI+XRkUG
         mq/VbG/oyJmgEUx4cKiLuchv7IYsX1+gCv64J9x/pdVcUK3qszmn/1haWHmx7EP3erbA
         y+iUEZ12Hsi794W+3VgIGTrZipgCVFg7VL6X8DYFgLDOS1IxJALrtjmYlPx9wv4d/JxT
         IMUvRjwZSVgdM8AnUpjF1uUmblwLDBJ1en35yIg2P/W6saNDeBqka2eIAX4dtidKpBFx
         UdPA9N128pu63HkElGAxQLqZfInxP+1fjZBW7Ht0alAaEGj6yNpj9n6OAMQV1W5T/4dA
         rDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744381965; x=1744986765;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sCZsg9RW77pf5g7VO318qCm3+bDOX2VQbow5YNOLPdI=;
        b=n3gU1A57z7bOTslddfiUGcpFvI0q5yrHwXAzgBitl92m5cC8DSYXIdyH38JYO2OGR8
         BQHLBdFfXJkTtTAPZ9HM+8SdbSn0NydUxoySpREm9g+MRK52TQk4tKaaqZmSOwKB6bnP
         VAfxy3zpFAeClbvIbGGkKSoZk1S5Fi5/igoxGlm7ILEQtU9m3c65fSrADt33TgHBUcfn
         dsXRhSCBXr1rKSiiASa3zSd4DF+f4F3FAytN6hz2xdbB/Pm2QMb8qWDg010+TRnHaSqA
         YIgZMcJD06l9EkmEV7LRr/C+KbJ6JDnkc/R2WUWMOzOBbxmiW0KTwZXGD0MITxA/sqZ3
         NZiA==
X-Forwarded-Encrypted: i=1; AJvYcCVDJaSgMmN8HuPNPyCXOk7koCSl8Ynh3WVOGBwYn36vlR1Zk4kOzzzwOAfjFFyoFRve5zKGIsvQHZEVEcVCJwu/@lists.infradead.org
X-Gm-Message-State: AOJu0YzQy/a/cP4NKkT8Re7qodNiiWBWikhoHV7GA5sjAEksZJlyPuGS
	XTweqMTLBR+rU4qR+gmSGZtY7v9oDkob8ShZjll1SiWsQhpyomUUmmtmNGqbUso=
X-Gm-Gg: ASbGncvu6GEFHOYV10D3gYOJOi/hTWoPTsTdx0PmfEa1pp04rA5fAKV8lOvg+1Jcj53
	7oLOnbZ23wRcLr/HNACYbz5tkw/C4+xerrmcGWs71Aq2FGoVLlyymjqalU1CYIoLSQWdb2QAUm9
	bGJdFvCf0m9r1YlN/9UxtMdRO3K7lzWsnJX8LulwzFM6x7ZqZBM2PskKrGy8XkVBAny3S8VNMH9
	jpBMmJNfh0zGkbbm+IxPA0EIW/obSG0VmJx76llu3tWgAFHQxOaNC3O5BzkY8RZqi2XvG+xuAZ/
	YMj8vI3NPa1jL/4ZW5/U49FKhxEqiVI6kQK9gFveJHFYlHJJ
X-Google-Smtp-Source: AGHT+IGbI/+6LhVUYgb8GsMB4ZDA+r9KYyQ1fgtXp9lmb87IP4nw8EMt5GWurVGG66zKlNQ9uZzoXA==
X-Received: by 2002:a05:6000:2d08:b0:391:2a9f:2fcb with SMTP id ffacd0b85a97d-39eaaecdc43mr2207036f8f.36.1744381965558;
        Fri, 11 Apr 2025 07:32:45 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf4458a8sm2234082f8f.99.2025.04.11.07.32.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 07:32:45 -0700 (PDT)
Message-ID: <e34cc3ef-f101-4ffd-bf8b-d06c7f8ead7b@tuxon.dev>
Date: Fri, 11 Apr 2025 17:32:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: at91: at91sam9263: fix NAND chip selects
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>, devicetree@vger.kernel.org
References: <20250402210446.5972-2-wsa+renesas@sang-engineering.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250402210446.5972-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_073247_349016_84469370 
X-CRM114-Status: UNSURE (   9.13  )
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



On 03.04.2025 00:04, Wolfram Sang wrote:
> NAND did not work on my USB-A9263. I discovered that the offending
> commit converted the PIO bank for chip selects wrongly, so all A9263
> boards need to be fixed.
> 
> Fixes: 1004a2977bdc ("ARM: dts: at91: Switch to the new NAND bindings")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to at91-dt, thanks!

