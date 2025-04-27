Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E34C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 13:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+Wfmpz8YwSC/QTc9cmf3K4nEaVMfqyTaWeqvvdrAgc=; b=mKxB9iRBsvvOV4hMqrNkQ1dVLj
	wDMYeFOGP3uhItNI3ypOHkV6uaD7Gz2QVyuGbh1Ci3St0AQ+tbzHKebuBVBEtMJCJ8zYne7r2Wojc
	1dQvAgldm+c1wUDgGpYu/gWYYjDay93ouaCk9oW1byhuQ4kmQTITspLtvq0aEKwT8GRSqaAe7+KBe
	JMC2QLSQsapbEx8OqzuhRkXRqFxAeXOdYI53AGJ/1g+B5XW05zoAgk3Ba+hwVGK8snhHE6ZhWKfsw
	QcDHMsh03apAKHobgFlRsrRhlfqOBStg2CMEfJS4nJUj5l5u/KQ8iyhdI4DW49mkPiJ+wunQsuOeN
	+FymJxtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u92Lv-00000003cZN-2QYL;
	Sun, 27 Apr 2025 13:47:27 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u92JP-00000003cN5-2Vf3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 13:44:52 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso830026866b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Apr 2025 06:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1745761490; x=1746366290; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a+Wfmpz8YwSC/QTc9cmf3K4nEaVMfqyTaWeqvvdrAgc=;
        b=iBgZZUf37GVfd3zL+RBJoP4fPk0edSLp9QdEOrXGX8DBvPz1hHrhu8X9dc2BZyNhpL
         WrD8wL+v8qsKadqzTfhRffElB1tH4ldYeH6ldVmvJtCD768UvWxqtW3V8/ueMp9pXNTr
         OPdNj5jIsJ0WPvPhyo+duaCRrYNx3HyPiVoi3Ci+/4Vsq3WcmyDJoC1QVd847hqHlw9j
         fJ2HqSc5u5Z2Gs8r3y3LuTxJaLFd2ZCl9nwTJ4UBvfFP0MqFrrUUdDApZbybPMuGoOsa
         uA8P41HkyJlbDB3KD2anGBI5jlnALH/GTcPfYFHbRmFxgsObA7ApIEX/U+kmNkLbP+LV
         yIZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745761490; x=1746366290;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a+Wfmpz8YwSC/QTc9cmf3K4nEaVMfqyTaWeqvvdrAgc=;
        b=nEnyRnxCgE5cHee4+buirMmV9ovdpaeEinL4O5V+y9itlSRecgOqSfCYz0z7pgwl7W
         VPKPE0z7oWbUxON21iD+lG38AhlNQXLv2p5Vj/hM95N+dWwZ64w6UuoY5Pmm6BACNn/2
         XoZa55W1a3AB7nutj8pk0Zc/MGEU8YphoXoMiwhGmLGGbrQZpibjljr7zHbw2g5tUucc
         lPtzNKvsHP9V7vd29z8tz2zba5JCEp3I6boJLPEaGjkpxmJ2G6Gp5/aeJ4XTnocc6lTq
         FP80SdDRWz7DI/TUyLqxejnTi5mycmqengWq3cKC5uLZ8iS1qaDRfexqw4DufByH4yul
         m/fg==
X-Forwarded-Encrypted: i=1; AJvYcCUqgnB/JD3ogeRdpwbDkG/W3s+8kUIJtLSXD4wasjml2rvLAch73Heqw/UMfuVydftvj0z9FK9k0Ub/R5QdA7Xr@lists.infradead.org
X-Gm-Message-State: AOJu0YzkPQgTcfsDDkoBxByv4KaOb+ObCrWKzkgtuuVh7pl40vkeCanv
	SNTaqk7+n3J392m/aHlbM4n5hqOwT0XlTETKsNlaTW2cQJBHTL73k6v2DiWRdVA=
X-Gm-Gg: ASbGncsVfn7+QS9TMRS7dm2KaW0kXy53RiHOt1RD/uyw83DAHpNAB7HI2MsXVGFCLdh
	sHmzQwXc6rTIlQRTQpx/2oQUkMGua3t1Kgj+Ul5d1cxK3QQnmctBcA3w4X3Za9JwUaSTgBwVL8n
	HQ3xOz5hOZKXHXdVql8WpXcxQVG+S7OQ3AZaqi+JrjMueg0B8MHxm7EgxYIKUFpJpDjWONbxLzr
	a8hyHqyficp5qHwGrKjbzw9gwLWeIowdRTCe6BrsNbpY21Q2PBRapiRZnyDgZLvZup8QN59AHzQ
	bcoZDP52EW0Jzn0T7uLCeECyyF+wDW2/PDm+sUGOHE/SBOisLg==
X-Google-Smtp-Source: AGHT+IEOypUTitKBpixzEKZqDNNK3xNvWnlomy9oSqUcmZFU4mdU5oeaOXGJJJq0BB7OQNIo/j8EWA==
X-Received: by 2002:a17:906:dc8b:b0:ac3:26ff:11a0 with SMTP id a640c23a62f3a-ace7133c83emr870058566b.38.1745761489851;
        Sun, 27 Apr 2025 06:44:49 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41a850sm447491766b.32.2025.04.27.06.44.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Apr 2025 06:44:49 -0700 (PDT)
Message-ID: <b50ca268-1eb5-4f73-bfb6-db4273cd6894@tuxon.dev>
Date: Sun, 27 Apr 2025 16:44:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] Enable FLEXCOMs and GMAC for SAMA7D65 SoC
To: Ryan.Wanner@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, onor+dt@kernel.org, alexandre.belloni@bootlin.com
Cc: nicolas.ferre@microchip.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <cover.1743523114.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <cover.1743523114.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_064451_643682_CB61BC6D 
X-CRM114-Status: UNSURE (   4.89  )
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



On 01.04.2025 19:13, Ryan.Wanner@microchip.com wrote:
>   ARM: dts: microchip: sama7d65: Add gmac interfaces for sama7d65 SoC
>   ARM: dts: microchip: sama7d65: Add FLEXCOMs to sama7d65 SoC
>   ARM: dts: microchip: sama7d65: Enable GMAC interface
>   ARM: dts: microchip: sama7d65: Add MCP16502 to sama7d65 curiosity
>   ARM: dts: microchip: sama7d65_curiosity: add EEPROM

Applied to at91-dt, with specified adjustments, thank you!

