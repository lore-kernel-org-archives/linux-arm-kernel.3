Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DEFBC98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 13:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0lryHDGBzH0yt6rZeb3UHP0vuOu2NeBF2okLNiTIg9o=; b=TZGZ/Ho70nRdbxFMIXZ6mtCEvf
	+SfPAq7CGlNDkv+dLGkptPGnm/t96oz6n8iiHFftAaVRTex5K2ve3TkDfG/cSAbC1V4qfWa2MJG8v
	DzxgEIX1+LCDce9wwcx1IDKKNncNuDNDhA4CUag8HKMFCDwzyRCXvfWM6egIuZgzKNGmXnVnttp/i
	PO3o4v6vWTBsb+a99QqLemjX1qn3+plD8EscoqY1HkvJKv7AgXeWkMjDMdgq6MACC/DG4kJKzBlCz
	N0uI8UJLog3IrRW28czUPTQhfsoLRff8RIjCM1lBsH4kUcGY85CQzyJnyCZ57ObyWXNj/5o24zX7f
	R/iuBwVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90RZ-00000005V7h-0180;
	Tue, 22 Sep 2026 13:21:57 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90RV-00000005V78-2bpW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 13:21:55 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e83a388f8so24840575e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 06:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1790083311; x=1790688111; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0lryHDGBzH0yt6rZeb3UHP0vuOu2NeBF2okLNiTIg9o=;
        b=KtRBlkCw2T5TDUJ8O2NYDQJcYR1HpWNEzyKz4ZDjwPDxm4ex69jwghnea1pqEoEHBf
         hc8divgm2fqewGjnLuNnyjEKt2hvc+WrjcUAlaCXHGfNB+xrO/IoWpXZt3TAeysPgimn
         CQH2btJ1HPUmH+HzUoOiIScru+ahOggnwpR9nGO+aZN2E0fPyybqinRC5O63K28lJQ03
         kU3dvSby2FJ1sgGEMGqbRz6MZmrA6QNOfYByvmgcYcFVnCPeNwe33t+rpYm1dor3854q
         6kqhyL0rT3vIdw0RrvD0GEivOdFSckfGyeDVSqaMF7ofVFTUGPcrik/rhrRqAgRvL3SR
         LSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790083311; x=1790688111;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0lryHDGBzH0yt6rZeb3UHP0vuOu2NeBF2okLNiTIg9o=;
        b=qtb/pa57OElbN1Y74eB27WZcVVdNekJn+B7kU5zSR7E5r1x7mWuu4M/iY6sXwNkeYb
         en7X7N5okDcx6mKNhJIrT8PkCm1pj184DHtJurYkY1UQD7qa1GAbzNzu0iXde+SjjUNg
         wTGHRE1Kv3ePudv5OOOt02ILi6bUqVV7QDEB1EfNq+mT6Ivaa1BYMvnXbOnRgwL7Vfxw
         Sdwo0fefGnTIIl4ofdEw1p+PH6fue3MZNvujOQsR2bixDZBIiYKFA8XoPjsZJq+AGyS2
         Oe8XuUfhn9Uur7hQpLGEXsaaFdCCZj4YCLpvVV2vxr2+M99BDt6cLrZEVgHSun9bqi8O
         yBjQ==
X-Forwarded-Encrypted: i=1; AKwUvBxwQmE/jVjFd1O7r+qgBhVrDvm0Y1IXw8nV5VVXPkoFBwSB32p3LeNGw4tvTO49tDSqoCVwBnH/CtcyfK4khKq2@lists.infradead.org
X-Gm-Message-State: AFuF++n7ypWX/aGuTFmIjgXRDizHpxWm1Yu6XAwIHAybvM8wzGMmr08D
	pgU8lJrTuYKkmKG4/Lhn1YbEuBKauW/+DiRZlEvq7qJ5zO2YMMkTm5KQqNusQED/eDY=
X-Gm-Gg: AYBFou2dBZH+hNeDzwcBxj1wL0iiseeozlP2P51WkPoGluHQDKPKdj0nbuOElwq/8Zm
	EyknLpMYEURje2rDa8vpMTSibxrzfYXt4Cs2yuaAbe9qfW/htc8g7lEAhTkuYdyvV2e2YXluddN
	nd178+aVeATzMJHF7WQaiCX5AAM6d7gtiWi/1iqZ8Wfr36Y06gBgWa8I7PNwbKOfnw7XdJ8eLhX
	HSN8Ly+FFGqE6i/TmH/g7+2Ggqv774/wEXSpOfp88Ztyx2KER/4J6FM4+BKE3q09I5r3RxtBcC8
	IuHEBP6XhT/ikrCbwzWf8YZxDPk22MBcDhqHaJLYk9DYqxy9MbnqDQ0sq8dGWYt1frsAX5yf+BZ
	glFnkQxOLTdJl7YuM+LUGjsL4UG57O8QUbMtcCgHEPoHTGSQo0XqPRlY2lBWfmlGPvd/vPBW6tP
	y+HVClYDXpF897nf9YzUAX7V46/Ip/HkOClIq2+BZonV5vByjB9VQvohEX7w1DXQyED7zUakMLu
	HNclL5bct/E5zTujW/wlFd9LzgQwjwuvepQWTMNIxoyrMwpauygvjf42/Xjug==
X-Received: by 2002:a05:600c:8b03:b0:499:a277:e8b5 with SMTP id 5b1f17b1804b1-49fc566e609mr187887745e9.3.1790083311001;
        Tue, 22 Sep 2026 06:21:51 -0700 (PDT)
Received: from ?IPV6:2a01:599:842:c46f:7b1d:31f2:7a17:2f4c? ([2a01:599:842:c46f:7b1d:31f2:7a17:2f4c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdad2a3e0sm70823335e9.5.2026.09.22.06.21.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 06:21:50 -0700 (PDT)
Message-ID: <8cb38ff6-1210-4c5a-b0bc-b0b50dd2b9aa@9elements.com>
Date: Tue, 22 Sep 2026 15:21:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
 support
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>, joel@jms.id.au
Cc: andrew@codeconstruct.com.au, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, ryan_chen@aspeedtech.com, billy_tsai@aspeedtech.com,
 andrew@lunn.ch, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <cover.1790079398.git.prasanth.padarthi10@gmail.com>
Content-Language: en-US
From: Tan Siewert <tan.siewert@9elements.com>
In-Reply-To: <cover.1790079398.git.prasanth.padarthi10@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_062153_780815_08C0D5F3 
X-CRM114-Status: GOOD (  11.31  )
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

On 9/22/26 2:34 PM, Prasanth Kumar Padarthi wrote:
> Add support for the ASRock Rack B650D4U BMC, based on the ASPEED AST2600 SoC.
> 
> The series adds the board compatible string and describes the BMC memory, SPI NOR flash layout, UART console, GPIO line names, graphics reserved memory, I2C EEPROM, and MAC0 connected to an RTL8211F Ethernet PHY.
> 
> MAC0 obtains its MAC address from the EEPROM on I2C7 and uses RGMII-ID mode.
> 
> Changes in v7:
> 
> * Correct the GPIOP bank line names for the reset, power and NMI button/control signals according to the confirmed board mapping.
> * Remove the obsolete GPIOF5 reset-button line name.
> * Leave the binding patch unchanged.
> 
> The B650D4U DTB builds successfully using aspeed_g5_defconfig.

What? The B650D4U has an AST2600, so using `aspeed_g5_defconfig` means 
you're using a config set for the AST2*5*00...

Also, please preserve the trailers from previous serieses (i.e. Andrew's 
Reviewed-by trailer) if you don't change anything significantly for the 
parts that got reviewed.

Tan

