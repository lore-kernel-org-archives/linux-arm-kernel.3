Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F57E77173
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 16:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZOi2LT6/bSAyzBeK+6Fj/VJjHRIZTnvrX9jpLhKvAB0=; b=JBK0KRHocqPUZY6EJClgv9a0hq
	ksng0cxkoYGnOIyrG8BOO4J9/yJyMXw7nh8zCW0S89A3H4m/FlyQWg1HWOpjT1kVdcLMsXllJPWN5
	TIfQn+DdNi/8gNq3FrJigEt2JAsi2sYFrSDC4xXDf0/P2Aa3X0XzijQRO3MiJRnsRCmZ2TOx7U+SN
	iOgacUWm7fHL0NkXqklPLSChXyz57NkPLkG4dUJAOiIuSm6CzXy+OuJh0EN725ZMt8QQhDpxJJFmx
	d67A/0W4Dd6DXxY2/HoP7IP2V2V8klwLI+eVCWV7CAgAZ3t2XxYEHBZBaKA6eA6xRyxjNDTvlArTs
	kC/X7DMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKKPB-00000005aAv-1YTU;
	Sun, 08 Dec 2024 16:45:13 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKKO9-00000005a3J-0wOo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Dec 2024 16:44:10 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-385e87b25f0so2703673f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Dec 2024 08:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733676247; x=1734281047; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZOi2LT6/bSAyzBeK+6Fj/VJjHRIZTnvrX9jpLhKvAB0=;
        b=YzEKGmlmSvw3A6auHkBM3fv+duQVjpU2xPN7JFCL5qytUD7h81v7HkOVuVbbqt7te4
         LpydgYPioevyubxtcizRS00HkfVtzkcLcN+O05DvdZQcQ8GxMQlOODnRlkb5OLVP3dUH
         Enj9KRSFbBOLAnz9GEdZRCDLIHD3AybAkHiIV+xp79YhF6FOJO9cZd3zIHFqxJS64plu
         6udS7IQaBAorcZ2qGRC6dhenxblXMqWqsABBy5bDuOH8muLHXTUZUzI5rSbZM92M4O5I
         db4/82ddwAga6KlrlCLbYvBf5R8pc2O61WQmgfFWrH/4pttcbfnddfAmpvUYEeEBDfX7
         jLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733676247; x=1734281047;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOi2LT6/bSAyzBeK+6Fj/VJjHRIZTnvrX9jpLhKvAB0=;
        b=XZ4/MuG8oo3JLucJqOAjMmSlm77HtdhCXY89uJq/ECU0xsZojNH3Ti2ZxAKPVO2+kS
         T/LvpQkDPm5xDa2/Aj4CLaSYHPO8yfoT0pEuqfIJ+wnA97XXsYRCw+/wW6u3ZpLgxviH
         jZFnvgeaiZJGCXUu0ibHOFEfODY+cAlenhKI0okiK0yicch+5/iIF+1DK+Ng7Iw7O3DD
         pao8cXdPL9ssBlBgQqBGOzGkQF6YDSFHikVPqzLBgG158cVqNZed4nNaJqQM8v6HHy9E
         Ga0rgsm50N0QK88MrsXfOJ1Nqm5xo6uDIizieuoWksCMbpKklEwYl+7N0Y7SInZ9rnV9
         9v2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMqKuhuS8vwxlg5TMpYrBBAiL88ZH2miSd6gI+oXTic2o7d675jFgNYUcW7jznNZzsGZg8m68f4ps1YFqma7Wi@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8GCUwPmxG81r9UNQY27szWNjWzCEUd7OuHJMMEIiAGfQ5IGMQ
	cqfa4p1B713nytdzLICik1T+eFkVesn35ZQrZz8312YT8t6aEcYR5wgNWKwKgm4=
X-Gm-Gg: ASbGncv3mkkgx76ktPeXJma8R/9t+kC1ICZX/xlojHQ3luKez9e3iJk0nvAVr4KP1mV
	m0Rx/OOS2xoz++vGtFMXhNPazXYP9NliWDuTADDqSc654syeFwm5nArkd0mVdZoJFyVQC5dFuIA
	Ca69SAU7Poi6rjilx36NA62IiLRH2mLs+ORXKQW2jgmQGtFubDgwtb7s5FQmYdOzGvuUSz6SXa7
	kpQh+NY45jQB4xo8hpOQTW6Oa9oLxR2/e8q0pEwQfrfMtUZULCXdoWS7yg=
X-Google-Smtp-Source: AGHT+IGGy6Ldhaa4YTjG8IieQa8Oj6Mw4sjYxJ+7EDklp4oAAKnvXJZlWaCkP9Zsx1bWxvnFCp2yYw==
X-Received: by 2002:a5d:64e7:0:b0:385:ee85:f1bf with SMTP id ffacd0b85a97d-3862a8b530bmr7258225f8f.18.1733676247575;
        Sun, 08 Dec 2024 08:44:07 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861f4a85f2sm10302736f8f.29.2024.12.08.08.44.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Dec 2024 08:44:07 -0800 (PST)
Message-ID: <d5d102c0-e4d8-4041-8899-6a732a514046@tuxon.dev>
Date: Sun, 8 Dec 2024 18:44:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/13] clk: at91: sama7d65: add sama7d65 pmc driver
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
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
 <6cf9921c6d312193c34f6f5cbd9eda7d0f9f317c.1733505542.git.Ryan.Wanner@microchip.com>
 <c0206c74-33d3-4715-9a01-256394919fc8@wanadoo.fr>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <c0206c74-33d3-4715-9a01-256394919fc8@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_084409_260653_BCF79D51 
X-CRM114-Status: GOOD (  12.03  )
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



On 08.12.2024 18:35, Christophe JAILLET wrote:
> Le 06/12/2024 à 20:59, Ryan.Wanner@microchip.com a écrit :
>> From: Ryan Wanner <Ryan.Wanner@microchip.com>
>>
>> Add clock support for SAMA7D65 SoC.
>>
>> Increase maximum number of valid master clocks. The PMC for the SAMA7D65
>> requires 9 master clocks.
>>
>> Increase maximum amount of PLLs to 9 to support SAMA7D65 SoC PLL
>> requirements.
>>
>> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> ...
> 
>> +    for (i = 0; i < ARRAY_SIZE(sama7d65_gck); i++) {
>> +        u8 num_parents = 4 + sama7d65_gck[i].pp_count;
>> +        struct clk_hw *tmp_parent_hws[8];
>> +        u32 *mux_table;
>> +
>> +        mux_table = kmalloc_array(num_parents, sizeof(*mux_table),
>> +                      GFP_KERNEL);
>> +        if (!mux_table)
>> +            goto err_free;
>> +
>> +        PMC_INIT_TABLE(mux_table, 4);
>> +        PMC_FILL_TABLE(&mux_table[4], sama7d65_gck[i].pp_mux_table,
>> +                   sama7d65_gck[i].pp_count);
>> +        for (j = 0; j < sama7d65_gck[i].pp_count; j++) {
>> +            u8 pll_id = sama7d65_gck[i].pp[j].pll_id;
>> +            u8 pll_compid = sama7d65_gck[i].pp[j].pll_compid;
>> +
>> +            tmp_parent_hws[j] = sama7d65_plls[pll_id][pll_compid].hw;
>> +        }
>> +        PMC_FILL_TABLE(&parent_hws[4], tmp_parent_hws,
>> +                   sama7d65_gck[i].pp_count);
>> +
>> +        hw = at91_clk_register_generated(regmap, &pmc_pcr_lock,
>> +                         &sama7d65_pcr_layout,
>> +                         sama7d65_gck[i].n, NULL,
>> +                         parent_hws, mux_table,
>> +                         num_parents,
>> +                         sama7d65_gck[i].id,
>> +                         &sama7d65_gck[i].r,
>> +                         sama7d65_gck[i].pp_chg_id);
>> +        if (IS_ERR(hw))
> 
> If we fail here, mux_table is not freed, because it is not stored yet in
> alloc_mem.

You're right! I missed that.

