Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85160C021A6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 12:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D6Mlr0wbAMCOEN0+YLkpDA5vstdeAdhSzTHRytWnpTE=; b=FyufAA4GoY7ZEA97OZ6BHjF/e5
	/bdXb+zbLqQRbYDCeZu1EmTcrxxZAzWDKYn7IOWSzSjPC3pqGURxAjmfxbWK98lpmhJeVsqCmEoQI
	DANLnm5LNqHLwSNjIOyyrM6IaGn62xYhW/LpLAnSUg4O7shuLjUZVRib4ETy2E8e180Uy+T2W4yJ9
	q/orlKxVv44qszKFkARQQpsdGci4+EM74Op7bZ9fK/ekVYjBRwSGFHKnLrZrmP+YwK/Iu3AJZ+QS3
	2UDANCdtPDKESYRMcFU8ORAF8PQ7b0zp59wfhxGJX9N1Danmjsma+tuL+fJ9cPh2V0u2CN0YxevtQ
	xbjOU6xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmXDO-0000000DbgX-0Rhw;
	Mon, 24 Feb 2025 12:05:38 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmWs7-0000000DTUw-2B5u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 11:43:40 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-aaecf50578eso841751666b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 03:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1740397418; x=1741002218; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D6Mlr0wbAMCOEN0+YLkpDA5vstdeAdhSzTHRytWnpTE=;
        b=dr1COaedEgM60DKaQ30VqqUbvjMT1wP9HoV4ZlyiBpsUe7bPjqYbplzOYq3idpJDyy
         i6kqsLCQHHcNR+gx9C61b93e5QbKVUb3Gy653Sf9JdDHXh2FvxSNIjO3AHsbjf0mvIXb
         agL3I2/iOj0OEeKtipQLMohz+pbibhvtCCt6gaUtyZi0cuQTbBrBjH0jEtgWeEyQ6Tyi
         0X0Yz0DF9P3mcm68wCBtHPM1SUWfKlR3ZfqEuCki5XHiT2Vk9JPPQUfi1JfE1FXTa7GD
         LUdoZI8kmzQ1ZqagGEievAcS83H9OlJjlwOrYa2TgeaJ4Lt+05CTn+yoSOl+Ru26tZfU
         Fx7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740397418; x=1741002218;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D6Mlr0wbAMCOEN0+YLkpDA5vstdeAdhSzTHRytWnpTE=;
        b=XgpvKY7VEXptbtgXj1dXn+gWp/kQf8Te5wqSA9sTHOurKB2AN4bhpWiSyFd5MzYU/D
         s3QEp8K2uyR2MhkPBC71L7j283QQqOHLNU6JVbr8L0cVqluH/oux102W+Hn1aCaJvh3L
         cZVIhjIee2Hp5vM0XqRsUA9F86k5raEdlA8nIxA7Dz/vF4F7zyoWxtEmG32hunIDRDdf
         po8i8tE0KPm300goMhRCGxzpqVtNOo6UM1F1Ip0ONF4Dgmd66xsr189mL2Pxof988UPq
         wXVVzJYxaKT2jCTM/ZTixezt7UdxJzlN9nbESoUTTF9nnORjD863AAgBmOsY/hghlmB9
         GhCw==
X-Forwarded-Encrypted: i=1; AJvYcCXKJ9TUd1CKbYqmeVSGmTWwjRAhgSb7MG614Kpx37Lf7AZnEGeazhywx0YmSuW1Ln1pApzj/j1SGMsNxGWMwd8x@lists.infradead.org
X-Gm-Message-State: AOJu0YztcLHmCa8tj6nvkt+KPfJJ8JJUKEa5oaSOhlld+ZmHARLDWCr5
	6Af9cNFBXltMP7AbGFPsn+0ScoMih+ehz0+u4ZLLIoWyWbRJg7LgF5cc23MWvPrP1+sIiFAhOq2
	4ZW4=
X-Gm-Gg: ASbGnctpPCw3IMSlDF+TLl6x13floIv4mC4QXKCbm7E0MVTzvCCCccmWGIX7CTOZcx2
	Mn5mRHmIjbAY+Xvt7wp7yr+iMBr/aog+fJ6XYWGyW527Cb31ACBSlUm+yZmYNwMp/mHKgBTrKlx
	zPHRTw8wWeYulsaXW3n6CiLbCJTEjnmS8tCAdkuByq4nF5iUZ/LhN/VofkSAs3wTfyz7VdxPIOL
	0xhMYAvku20qShmcA1pZ/cCcw19pZzR32RpxYnvG2yAvxOZ5T/AV0l4AO88KG+EtgV7KAbQJKsk
	33REz7u0k/VCxVcIuiVURDKca4/p2tRGDA==
X-Google-Smtp-Source: AGHT+IF5iaBYNZgpTldExBVQhpm8bwV77vFMEYcbfb9p2terRRNut6cbNBxpAfkhBHP6mSJK7U7EiQ==
X-Received: by 2002:a17:907:7e93:b0:abb:6b1a:7b22 with SMTP id a640c23a62f3a-abc0da3b46fmr1334031166b.29.1740397417602;
        Mon, 24 Feb 2025 03:43:37 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb8ab30726sm1658222166b.153.2025.02.24.03.43.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 03:43:37 -0800 (PST)
Message-ID: <2ef91384-53a0-4eeb-8eee-3f704416f299@tuxon.dev>
Date: Mon, 24 Feb 2025 13:43:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] ARM: dts: microchip: sama7d65: Add watchdog for
 sama7d65
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, vkoul@kernel.org, wim@linux-watchdog.org,
 linux@roeck-us.net
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <cover.1739555984.git.Ryan.Wanner@microchip.com>
 <05431cf86beb742a9a53336c4ec792be8bde14e2.1739555984.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <05431cf86beb742a9a53336c4ec792be8bde14e2.1739555984.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_034339_559609_7E4BCAF9 
X-CRM114-Status: UNSURE (   6.09  )
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

Hi, Ryan,

On 14.02.2025 20:08, Ryan.Wanner@microchip.com wrote:
> +		ps_wdt: watchdog@e001d180 {
> +			compatible = "microchip,sama7d65-wdt", "microchip,sama7g5-wdt";
> +			reg = <0xe001d000 0x30>;

The node address and the one specified in reg don't match.
I will skip applying this.

Also, please sort the nodes by their addresses.

Thank you,
Claudiu

> +			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk32k 0>;
> +		};
> +


