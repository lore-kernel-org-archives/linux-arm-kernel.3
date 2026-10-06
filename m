Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B7FCA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 10:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M/hrvnn0z+2DlIg4l/OJm7mUefYyBjl4fij27fEnYo4=; b=BJdMQvrusp9BFZw0GpTv0RsAbH
	zm7CryFzqbLAohU6oGP6W46m5c9YS6mWFBQex33C2veS0zlo7QjdKhDHlYGxK4LQvNZ0nUHcEsobC
	+bsOZeWlgxzrYUlFpnK0OYcb+dVB5JLxVqGiuitBWNqNr4ZECecJcmS51xTi310RQpvXSsuY/iAfw
	H7cr1Sy2lAW6Mmxc4EvkFIwNFPBbIW/ngpgoODj3vJ0iTQ2CdiiBpj0b77l3OG2Qhc6UTIPGq0HvL
	4HklmVXpr83aPpO3+K7ry2PWSFGFgB5918OwY6jDgtMxECUAHZqvternHiJ+XXqI93xQm3YY5pu2J
	juInebvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2JU-00000000Ucz-1WLQ;
	Tue, 06 Oct 2026 10:22:24 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2JS-00000000UbX-1maA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 10:22:23 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso1206101a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 03:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791282141; x=1791886941; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M/hrvnn0z+2DlIg4l/OJm7mUefYyBjl4fij27fEnYo4=;
        b=YUgAv4Q1CIpgLgvktynvzrXnLj7mPUA/1pM4yfs6qJmacv0bUz1qxnbn/WGm656oj6
         Op6aj1c/aU2COxOi5RYviqDvcuQsjxvCrdqIye4HbHYHrA7fsi44s/6hKYKO027gFGIW
         6nNKN0+sQoHQyHpjDEgWCdMTzCBLPG8n7TnwB6L6PhMM/hiKaRcGYmNu8r1FcEtTSAHR
         vFgiXaDdKF7xUdZ3X6m22QDYG3ShCNN1pB2LaDY4hLREl+WZLhTkQ26s+6gcmEblDbgN
         LtLyIjxyi0Q6hIPf4y9iVD+lIqWs09l1EjXgWwwjOHtO9y0T/ve2yPNxHU53qj0N4bLV
         HmbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791282141; x=1791886941;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M/hrvnn0z+2DlIg4l/OJm7mUefYyBjl4fij27fEnYo4=;
        b=Q5+4KlGQQOZ8wAD4CrniM4s273bEq9dQRfXY9HEhx/mu6Kd7DG0nFI8/RM0636jvKq
         TyuikJZC1RyxGOw79lmaMQ3Bk2yFF9eu64E3F+HKUghRotq1r4p5R2yLJBZdwEd5yXVQ
         ZiJpMousfJ+zqdRY7clGl4Fmj6Y8SCM9f6ZO6Z0qqEirLMdUIs6jDBFV0nnqa52P7eDE
         K2UUGusdf8qDZZdQc0wnyUGMs4471kc7bVKN5n6mRsjVsMdcNVSxmTM5KRuDf0P+1Jrc
         biS/lbB0pmmJOzSog04tahtBomZ99t+LWZ52n6yv7NbSeylhToGC51+09oT3+lOOM8eh
         /ESA==
X-Forwarded-Encrypted: i=1; AKwUvBxkuu2ADqs73WbcPgqVuJDb9cVh3Tpq2PNl27dhcvC1irgT5X2yOIKFHydoAkPrTJ5CRJ0OZVRpm8cvwx2L9LMW@lists.infradead.org
X-Gm-Message-State: AFq9FYLsIPcPt8EfYNYJ2SnMXuyM0JEdN7iw/h7qmT1TTdnvdm+OZRhn
	5uUjaZDo1vhOvWCUIcvBrTVSUymKcg/lRWMT0D7fQVj16PRzZJgdLyXS
X-Gm-Gg: AYBFou3+GDniu7MwhQFEsYRcWfCcbAfBJeP9fjbG1EAWxtVRGaFtc9vw/VxFVhsgw2W
	dB1Mpi9GUEzrujHcp6TyDUE4Deg6tCJuVDcTmiqIQbeoEWYD6ba1kfvG0W+gE3L29qS1E36T6bH
	JSxCOB5XSj8bJ1+FuG5KeI/LYQiB19+WWHeQjujzN9ontrp2wSsOtyNnA/pIwuz8bLYrmUQkcxq
	+kG1y7Vvr3fPcc3w8m+oOKdRUc8htOlZuj7AmVPh80EcxXCArx/zR5iqppPgvhwTCuEUsBn68dd
	rQ1bOLP75cBzI35r+B9RTEp4GitFFdLRnL/NRviparBPGCyYlQlcS8l9uE33cCfCkGaH/yMBo2j
	Udm+QBJL2C1jk0siN0LDRi0Nf31oNL+Hq+30ltyKngOoAOKw5EYuH3IvBW/vM4unUR8FzVpRz2I
	JhiwXjP4r7v5bYwqCZfWsBsDdBsg6PO7yKhmDepAe/3V3KjETzleH+lhuJW6cVpcGj3HvMFnzDb
	+i1VwBBAkOwk/rktJO29vgEcnvFqgjNA/M5s4G2RUsmlzYhX4NzJ5U=
X-Received: by 2002:a17:90b:4f:b0:3a0:deda:3d07 with SMTP id 98e67ed59e1d1-3a787181df6mr8026458a91.14.1791282141410;
        Tue, 06 Oct 2026 03:22:21 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a85436fb54sm4153971a91.10.2026.10.06.03.22.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 03:22:21 -0700 (PDT)
Message-ID: <413f21b6-90ca-4102-9466-3cf7b9feddc3@gmail.com>
Date: Tue, 6 Oct 2026 18:22:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] phy: nuvoton: phy-ma35d1-usb2: extend to dual-port
 with OTG support
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Jacky Huang
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Hui-Ping Chen <hpchen0nvt@gmail.com>, Joey Lu <yclu4@nuvoton.com>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260929020854.1282339-1-a0987203069@gmail.com>
 <20260929020854.1282339-4-a0987203069@gmail.com> <asN29Gi71MIA-2fq@parshuram>
 <ab91b558-e7e6-4758-b4e3-66e5db75b790@gmail.com> <asSzYUA5W51Ngn4X@parshuram>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <asSzYUA5W51Ngn4X@parshuram>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_032222_560938_5AF19262 
X-CRM114-Status: GOOD (  10.57  )
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


Vinod Koul 於 2026/10/6 下午 04:37 寫道:
> On 06-10-26, 09:37, Joey Lu wrote:
>> Vinod Koul 於 2026/10/5 下午 06:07 寫道:
>>>>     */
>>>>    #include <linux/bitfield.h>
>>>>    #include <linux/clk.h>
>>>>    #include <linux/delay.h>
>>>> -#include <linux/io.h>
>>> why is this dropped?
>> This driver never did direct MMIO access (no readl()/writel()/ioremap()/
>> __iomem), even before this series - all register access goes through
>> regmap via syscon_regmap_lookup_by_phandle(). So linux/io.h was an
>> unused include already, and it's dropped here as part of the broader
>> rewrite touching this include block. Happy to keep it if you'd prefer
>> not to bundle unrelated include cleanup into this series.
> Then it should be a different patch explaining this
Understood. I'll drop this change from the series. I'll leave the 
include unchanged.
Thanks for the feedback.

