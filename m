Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F82AFD3764
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 15:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=joTPipNFHu59OdMkfE+xQxRwOrFr1KjwgYQLCdHrQ6k=; b=iuhTkXR1Hz8O02yMqeMEZ0/Mrr
	zFphJzShWiIn+k/RUcTOW8RIXHp6dAlVGZF1K96o3l8VSW81R2gwwqW3UoZIunekA5cgPJ5opA8wn
	DOnkqM4q/o+UE2n3UKTLbK+2pWqmRmz/de1czQTmNG5VCAN3b5R2AS3qNbyoDTzKtoeSMU4w5kiFT
	YDs8V1Gjiksg9zzcWdPdCyTNMcG6wAvlLjQA38HrnX1je4/bMoa1zKydZgwT7n97eyhSPjOpqi22Q
	Lu5AXQbJpql+X+2f44DNvISt6fYLYGjJ+Xu7+BTiGlOSpD5APzPFJJT6cv0s4+RCX+D8pZxfltTTp
	pmeU43pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvGa3-00000004G6c-15YH;
	Wed, 25 Feb 2026 15:13:39 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvGa0-00000004G6F-3UC5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 15:13:38 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2add623cb27so6513005ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 07:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772032416; x=1772637216; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=joTPipNFHu59OdMkfE+xQxRwOrFr1KjwgYQLCdHrQ6k=;
        b=UP8giFc9+hB+d3G5G08DxX/Zvz/oLcbSP3bvYtLcMQsWYe6Ebo29bj2xrnjCTREbPe
         af4tfDyA0hbbAJA4/qWic6hJi87LMUFkw/6PZRVeAfz4VO1atiLnbc4vDUz4e92OCsxi
         lOsadNMt3OAT3UbUv0t95iottvXxoLYjo6vqJh4+km+17NjfTxWW8JyEJELMij0CiKKj
         ovs4q9q+3+F7DQl7Lcab9kQtTJGZR+IKWkLEDEYNy4PZVsqVKHiKK7ZB8RclCrtvPR6c
         JxGEMSMO2UtrOTmofWwYLOw21a8d6WafYHbtWHQ7zIlZlbRyn45PrMz5BcW2C1KC6ZbZ
         mZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772032416; x=1772637216;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=joTPipNFHu59OdMkfE+xQxRwOrFr1KjwgYQLCdHrQ6k=;
        b=VycPTxpXnWIQyQC6yHES5UkKSLlZ96BK7HmgrG8p+HLT7xBoBIakh/ci3CstUtJOJZ
         RVhrXN1AXwfRU1wJ3WRDjqNWunCcjlmPUdQ3rMkBasBHqAu8NmXLnuFj304t2RyW93wD
         TZtxB4BHG+w4Dg3U8sBCTvRDehVXd8qbKlx8H6C2+UgWlFgR3RIEpI/LoHKPAoB18y+W
         4VN/dlWgHxzwNtwgBSI5sIzs53yzVvdS2vsUfYco50RvQM6v373bfU6S4+ehLEnhFUOB
         tW8owxAa0GHhH5z+9GHQxo9Zl5CaKtq/0UyFDqvcPfWGCbJ8YLN0u1oAUaHJx3a61X3K
         QbsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwB1jxX2wsZAKh01592y/0yDSysQd3bYi3AMmgRgGpHpD6uuXoemAq8Ar9SpNm0cY/0AjbLlxMIEDUkoiJa5fe@lists.infradead.org
X-Gm-Message-State: AOJu0Yzwl2CaxAwy3EPsMPRtbpCQBHK7n5TSr06dLl740Izkuwz633lV
	GoySGpPlm+cM7mH2pRlxxHOIwHVnUzQsr0XASryBPvuTIHMX/76mnwWX
X-Gm-Gg: ATEYQzyjnKmK+kyBpjdjgqjuGYDCq1HR87ikn9Br1IXkBHOLhUX07/nV2/6Tegwmyi9
	WEE7inrwulputdagmdJb38IodkSIlrqJpyFB7+PW3HZuzNJ2f0RFWpvLnAU694laUjbnGfUFqtE
	Bp63vbZs5Xnoa2V4bszdB2eSugsgqJNWET6a5aBKvKk1Q+lvgbfLGCVy3uYzThb+4kzqbUf9gXN
	gHOBDqdPRXzlkF55Rxy17xgAmTGSOj4MYNsGlo5fh1EC19FqTxQtupQigHVXlo3oB0VJS3z6T1D
	g1c6IWC4wGn8kEhsEz3hKAJO4ZHoE8al5A40wYArxHmuBAbIqHb2wwKiVE8HGGF7qLX8phClC7L
	nQGD4CDHBmahQHPdcV5d1Plrh8YKKNYbh4l3f+70po4YQkLsuklGAXmhhQuGbVoLN9/UjkCNmmO
	9pURXyUQGu49XydIUTeNULTCQBDkOr2dQOeWMDM9nenbyvT0TLNuHHM+yTmt5eIjO7W7CmnIL91
	e458ez/N6w=
X-Received: by 2002:a17:903:3b84:b0:2a7:3dbe:353d with SMTP id d9443c01a7336-2ad745697f6mr146921445ad.53.1772032416069;
        Wed, 25 Feb 2026 07:13:36 -0800 (PST)
Received: from ?IPV6:2401:4900:892f:f52a:c575:426a:cd40:5f5d? ([2401:4900:892f:f52a:c575:426a:cd40:5f5d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad750586e3sm145714935ad.90.2026.02.25.07.13.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 07:13:34 -0800 (PST)
Message-ID: <f78e59c7-547d-4a78-8092-e9b7d62cff78@gmail.com>
Date: Wed, 25 Feb 2026 20:43:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] dt-bindings: Microchip/Atmel AT91/SAMA system
 peripherals: convert to YAML
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu@tuxon.dev>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260224-arm-microchip-v2-0-8bedacd2cdcb@gmail.com>
 <20260224-recolor-hatching-e7d1b1894953@spud>
 <20260224-resisting-mongrel-531537974fa3@spud>
Content-Language: en-US
From: Akhila YS <akhilayalmati@gmail.com>
In-Reply-To: <20260224-resisting-mongrel-531537974fa3@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_071336_894896_9145230E 
X-CRM114-Status: GOOD (  10.43  )
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


On 24-02-2026 23:21, Conor Dooley wrote:
> On Tue, Feb 24, 2026 at 05:43:15PM +0000, Conor Dooley wrote:
>> On Tue, Feb 24, 2026 at 02:46:45PM +0000, Akhila YS wrote:
>>> Convert various legacy .txt bindings for Microchip (formerly Atmel) AT91/SAMA
>>> family system peripherals to proper YAML schemas. This includes:
>>>
>>> - CHIPID (SoC ID register block)
>>> - PIT (Period Interval Timer, old style)
>>> - PIT64B (64-bit Period Interval Timer, newer parts)
>>> - ST (System Timer, including watchdog subnode)
>>> - RAMC/SDRAMC/DDRAMC/UDDRC (SDRAM/DDR memory controller
>>>
>>> Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
>>> ---
>>> Changes in v2:
>>> - Change email for maintainers.
>>> - microchip,sam9x60-pit64b: modify compatible and clock-names in properties.  
>>> - Link to v1: https://lore.kernel.org/r/20260217-arm-microchip-v1-0-ae5d907e10e3@gmail.com
>> Please give me a chance to respond to your messages before sending new
>> versions. My comment about partial removal of the text file still
>> applies. You've got to send another version anyway.

Ok, i partially  remove binding from txt for each patch.

> Also, you probably should have checked the what I thought was Claudiu's
> email was actually correct. It's actually claudiu.beznea@tuxon.dev!

Sure, i will change email id for each patch under maintainer.

-- 
Best Regards,
Akhila.


