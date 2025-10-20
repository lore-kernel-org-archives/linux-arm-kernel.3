Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF9ECCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 19:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zkbTEtqdRTfgmATvZD4Qc4DJJkydsbu/UNnHytD9sg4=; b=veYZhx7+QgIjLZWg8rjDwRvt/Z
	Y2TZYFhwwk+WbvAC28BebBRpnG6OdFDCA16mnksgiyvOH7UtcIUyxD2QDDgNglF4HYrfR3btWT917
	R0EZVL3gf0VviViHrZyZBEuZPIbpjs+meif0+1LVjWIdOKX6OWlSBS2aqcwuHumqojWy7XgBerJiC
	jZP2fopmHUuYJ32QjL9yQ1mWuX8VTcR5Kzv736mng7sWYwOLgayfi1r6jokfH6gcbKr8YyuS9Vg9b
	syZEhLOOzGjGg29FfvJP1us/J/b8wJp17J0xovNBI12PyjqC6XDbk5sC9J5nRupp4oYt0TFqbcyK3
	BLj8Tw5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvJV-0000000Ejw8-3Azn;
	Mon, 20 Oct 2025 19:13:01 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvJT-0000000Ejum-2iSI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 19:13:00 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b457d93c155so716783566b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 12:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1760987578; x=1761592378; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zkbTEtqdRTfgmATvZD4Qc4DJJkydsbu/UNnHytD9sg4=;
        b=XK8K33l8TYALDfR86C9calNuhywYpWDpu8+VPcCZTiq+XhPOTdwsizk7WXtHEPBDTu
         TRDy8HUXx4bT+9ycrph1ksH0d1Fb0avoGPrstU4NS7PWlAxjzn2vvrFEjMnaOVWNM598
         ApfqBddrkV7Iz1LoUt2OowTew0hb4OkHJqWhbdwdFRgD98PdMNPToE1ryN6cJdbES+di
         x+hmIehd30B5O6f6GZa/WpZPDdUcOaHbE4b09Midy8bYhX6GuGMn5dXt6JgkO8QaCvBo
         KdsBW611134nHT1MInWsGy7VcTAPClGfOIoNPc0RUCjCd94gObLNVDZ/olRbxO+S/TGv
         40gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760987578; x=1761592378;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zkbTEtqdRTfgmATvZD4Qc4DJJkydsbu/UNnHytD9sg4=;
        b=R/O2A5Q13h/SFBB3j9JK28ilw7NBeT7E1owT9fTBQnnGLO1R/Pk+l+19mvEOwqqE1K
         1Fz2Hio0yzg078L/34z3JWihmGlpH9cu4+kL+dCH8lNpMaK2iqRM+n3WqpvHeP3pjfsj
         SFz2QAOVrNYWsL5KImELnZi+3rpNd5cwP2yJUKf5UaNVJmTiC3tIxoY9NnHgC9zhrcut
         4I8Yp8HyEtWkHHcGtx/ckdxO04yWADnIzfb17z9cJ/XdriBblg9of6XQqfuE1HzvZLMT
         O1y6+VvYvpNLBEbvBY/s+F7E+7G2WmuJ/AAsb1ubwPUxBQZthM8ntvtOq2DqczdHpLci
         5iiA==
X-Forwarded-Encrypted: i=1; AJvYcCXDA68a/NsyrpQhdwJrbsqNGtZsUMNlVVITxGyaaXTWOe2tDD0XLIBMeiMdEb6tJgIXhRpRRhTnZqTAPltenFc5@lists.infradead.org
X-Gm-Message-State: AOJu0YxtAJW0W0OQxbtqxrTpcaqvby3f2j3+f21QEyakuddh2WhB5z3x
	5HkHypID13xJ3pOlbYZibxR51aiBbRvat393B9bFLMpc4l34sfdQacxMNB2AMfYTFuw=
X-Gm-Gg: ASbGncsvknBtftSb9qsN72EsFxCWbijENBj4MUPkE1AriUu6wRQoBlg8+lfFuFZN46F
	3ZjVJ7sm09DPRGX8QuSS2eVPkvr2mToOS2OAkDt54n9etp8aqZVWAHrPPd1pBfEnHxQX0M+ybYa
	BUXCChQ5BIA5iB/lU7tXo0A5P6TLS7ZuKyzySV2HY2N9VU6cq7qCIi1eoHTlbltVYhiJZBEqk1l
	4St3BOpQZ2kBTM274RumYW32vSa8i2u1ATO5wPdbk077sOq9cjlLXE1etPmy4YLhBoJE1pZrE+B
	q6q+6zAAnYkG9HBIeoJKOTrxffmpJC/0YcKRKAk4PItuAalgHhWA/G+cgLKxbJ3VA6PWYVfynwh
	pLrru70ejWvHPcTrC/QimsQCm8IzMcXOpa1gTTqT+bIjt908uDNJEcK/nluAZeULtWU+K2uyFWn
	e3wlIlg4zd
X-Google-Smtp-Source: AGHT+IE+X5JpzMaImDhaId50MFj6FY2X9vUqqcmU/xQrocAAwZvjv+bdBOOQS4rP8CKvZNBKJCdcDw==
X-Received: by 2002:a17:907:728d:b0:b3f:f6d:1daa with SMTP id a640c23a62f3a-b647443cf06mr1587664466b.37.1760987577301;
        Mon, 20 Oct 2025 12:12:57 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb952046sm861152966b.70.2025.10.20.12.12.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:12:56 -0700 (PDT)
Message-ID: <89e15554-e4a2-4f74-8ded-1fbec7ec5000@tuxon.dev>
Date: Mon, 20 Oct 2025 22:12:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/31] clk: at91: clk-plldiv: add support for parent_hw
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <ab562d7a5492e45878aa3d4160ad9079571625b0.1758226719.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <ab562d7a5492e45878aa3d4160ad9079571625b0.1758226719.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_121259_695249_25AF7246 
X-CRM114-Status: GOOD (  10.94  )
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

On 9/19/25 00:15, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Add support for parent_hw in plldiv clock driver.

s/parent_hw/parent_data. Same for the patch title.

> With this parent-child relation is described with pointers rather
> than strings making registration a bit faster.
> 
> All the SoC based drivers that rely on clk-plldiv were adapted
> to the new API change. The switch itself for SoCs will be done
> in subsequent patches.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>



