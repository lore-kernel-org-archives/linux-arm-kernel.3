Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F7D7E77173
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 16:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pAZgKK7Ob7dVD/6GRHg29F0t0wRjMiOSNr01J0LKftk=; b=Hapm6HbehCe959wdX3R4wnHSJx
	YxVyfxWwLnemJdJMEH8nC6iuJLCe8i+UOFDaBHgVx9An/s9YjsHpZJ9TioMH2EiHI6C4jnyIpHfFg
	yE6Z9hKQX+XpHIh8w/nQWk4VJufBeU3h/QMd+u+MG2Ar+319dJ7bIhnOaQB5yTJmW6lLt11Nc6p6d
	4aA854JoxkUfRS3F4eZts51eGmXEBxmJ7ckNVt6LWWc4BUqieacbY6bxzluqRV/LCgOV1A0eAkJjA
	kdnb/hGIPonPd6kFVBbf8c1sQ+U4ryZfC8ceQzNTxjUTKejB/9jEfXTr05PY9xXgYIfkXqpAnBMcR
	wHBPlUDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKKFI-00000005Z4P-23KM;
	Sun, 08 Dec 2024 16:35:00 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKKDy-00000005Yrp-0yW6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Dec 2024 16:33:39 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-aa64f3c5a05so229647266b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Dec 2024 08:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733675617; x=1734280417; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pAZgKK7Ob7dVD/6GRHg29F0t0wRjMiOSNr01J0LKftk=;
        b=cyyvWlrT2KA+5t0j4viQFYJZFLxu52DOTQYkrTC+GLjD9uUjIkWi38Ej98PnlQOZM3
         ZhtohzI0Knnkgk966ADFPedTVJVsg62kcP3+lEr2NFWsL2ms4j5/yzwcB4VFvji6cb+n
         QO9q7MhdkgSMmRlf3MZ8fXDNlcdvMv3D3sX1fbNH01MVD98NEyGQQQ5YtxAlTThF7t9w
         do3FKy03rErHH7HQcF743nYMFAMseAVIvBTKd4/AvkqnG6fguYYlD0EJNVmdkCTP3j6R
         HhSVdUDNaF7RYXCkBvLjtVvWgUCnczj6ppuT8m8tdrQo0RNXdo0ME1YMpjZZWclKM88+
         zHSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733675617; x=1734280417;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pAZgKK7Ob7dVD/6GRHg29F0t0wRjMiOSNr01J0LKftk=;
        b=kmEvaM4KbW8xrmTx2KhAZcP2+RaNkqbOiNXOy0K+2sq2eSvpqeFrBUzk5qOtQCHx0H
         8iXG3dPp66xM/tApgNrCW6X/VLwPegVBqgnl3kSTlEc/+ZcvCU5kz/ydcSol+Zy6u8Oz
         c2641C7PKi7X8RirPIa9yRZFwXuo6+VoJqyyh8qTHbVXeLgPM5qlezW2gOD9ALUDbOvi
         lMl0J1k6qsd0Yu5feSc7DyAdJEpBnbII1BEM6DL56mMEVRDe9c9MjAmW/ywlFAr2dvVF
         sPae1IT1LtgU+zMTdFDPcJ/wOjWeNU7Z02AYTjEkQPw4I6CBEr3/GWawU8A+cc39OFQG
         /yVg==
X-Forwarded-Encrypted: i=1; AJvYcCU0Vj4tKP9a1wM+sON0JOGGUxOdZHhTG5tm2ISgvGZjmtvDZaVQEuEkHZsEWyjK0fGmdbq/ohYRI6FrrHSnvGx2@lists.infradead.org
X-Gm-Message-State: AOJu0YypnFxhI0eT1W0D3zfszgTYxpWpB5qGVMaQggi5KaYuH85PqCjk
	nux8HSUBSYljBB7jj6DnC7bFZPnwKcEmTrjLY/HQpKbYGSfaBD1M5zm5lPuGmj8=
X-Gm-Gg: ASbGncsW1swC/0V4ANaq41Vikfq4ujBT60qiZP7FOKcXqK+a1Rd8iwsVLlLKm6heM3z
	EdqSOY2vH6ClOfcZB73qgnRPA3tdsnj5nVYvrDK/TjA091J1Qjw3f3mI86G3MeTReTQfuAupNTD
	7hQsXJlxLiyaq5DU0EesLXVVLj1lAh+3vBs7EA6HyGU2SgrLWuEjy7Vp0jtI7KGsCyT9XajJY3D
	eZBD6prc/EWX6NofobLk/PxWAoCMavg4thqpYocV+/X7VJGc4QFabLkJhk=
X-Google-Smtp-Source: AGHT+IEG5BzdBKSU5T5ma5GlgSE9+K05duEqvgjt64DfRU1QPy3ISe7GWbOxCcAy7BgfRsflElX9gA==
X-Received: by 2002:a17:906:32d0:b0:aa6:7027:7b01 with SMTP id a640c23a62f3a-aa670277bf0mr300268066b.20.1733675616848;
        Sun, 08 Dec 2024 08:33:36 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa67a4f8dc2sm113804466b.179.2024.12.08.08.33.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Dec 2024 08:33:36 -0800 (PST)
Message-ID: <6ea8fa5a-78e4-46d3-8e20-c2a723bb7e86@tuxon.dev>
Date: Sun, 8 Dec 2024 18:33:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/13] ARM: configs: at91: sama7: add new SoC config
Content-Language: en-US
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, mturquette@baylibre.com, sboyd@kernel.org,
 arnd@arndb.de
Cc: dharma.b@microchip.com, mihai.sain@microchip.com,
 romain.sioen@microchip.com, varshini.rajendran@microchip.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org
References: <cover.1733505542.git.Ryan.Wanner@microchip.com>
 <e5a1311100a4f05fdc44107e124129d2d93df2e0.1733505542.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <e5a1311100a4f05fdc44107e124129d2d93df2e0.1733505542.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_083338_305409_BDF97632 
X-CRM114-Status: UNSURE (   5.85  )
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



On 06.12.2024 21:59, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add sama7d65 to the sama7_defconfig.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

