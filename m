Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F86D79745
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 14:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qc3eedRalwu3ot9spaNpjRwC5f0S028YjliYaYwkd7Y=; b=HM0627RS/Xh6Fffru8VDPYixcN
	kakVob/Abf66YhJZeEVlutMgx3F6VupTKZaoexutQgEXNbz1FDOBuhIKre+Uze8JENH7MhrsSoxQw
	TOffzTBjjoScEf3a8n2PPtjRyeuqIMUVcH3YI26pGjAjzQEEIhs2YUQltoGoa25Rw7lXifLoai92a
	Dohm8sXpoWY/E7EGx/p3rDygtuPB6771o0aTj89VSdH6U8v0I4tjWpxwT0xbnclvE/bqtlME6I7XB
	bM1AFu1eJiSfqNhyS2n3YceuNWgNSF2SD/jFgjJJdTTR646+upnnZaWcbaTBOPh8QXFIaJuGhOICh
	u+SNAp9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmBuL-00000002h3s-3ULj;
	Sat, 31 Jan 2026 14:25:05 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmBuJ-00000002h3a-2kNg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 14:25:04 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-43596062728so2608323f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 06:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769869502; x=1770474302; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qc3eedRalwu3ot9spaNpjRwC5f0S028YjliYaYwkd7Y=;
        b=kx4pPFADGp+0hHsJA/glSbxD8ORdVPPzJuU6WBh0hOHMfLyiJyj7QkfHZuayl0lQqs
         Sbj+OnkhRLKokCZ1RCepUFbO+c92i6Yqs2l7CkfXlLF33GYU66yTzA3Tr7bMs7BF4IFI
         lqUGrfuR5ZRT6suStbF+hNXmtEsFaaMn2NW+boza+3zVN5/ZcFy0f+5f2MyE7ZPhDRHf
         rZ12zxM1TwZHvFngI46yYb/hqQ882Dogo8KnOnS3UHBPO7//deh4EEH5VHxSlnq4VVbV
         AeKg4sOn3OWBt+nD3TzfwxiRm0DZGHUWYYhYGJzSnx+/6RmuEGHjApKXbBK4ec8CRnUI
         xneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769869502; x=1770474302;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qc3eedRalwu3ot9spaNpjRwC5f0S028YjliYaYwkd7Y=;
        b=ifF5BgZ9eAWu/ECnx2wgH/RhCyTHt9aqyu+fHNAlWF8L9vQ9GiRIisCKmnRq0B3gtN
         a77lDYyH3drERvK5QRS9CGmSafl0PDDcOgvKb/zOUt5ILTAF18bob8UAadixN7cz/6r+
         ZKD9slXxMY7fSZOAP8EMhkXig0Sz7jHU/wIia1xn4T9P0hfdXXtyKkcjFchoWf5rcgOQ
         CNKFNoz0ncYef2hYSeXsx443tzQMAytApk11pJBP9/2SlsRcNfvlYxxwV8jiE6lWk2B/
         UwqVXP7CJa+BFN90y6QpywENIsGdaPziqPu7w3A74GBGqt4YBfYr3fcDHTlMliH/Aeuq
         pJKg==
X-Forwarded-Encrypted: i=1; AJvYcCXINqevB04trFkHkC1cpfP65nSx82rL65qejIg0lNNJrdFpmJEjScHmmDjw8qkI+nU7EYAxZRt5aN+C3ipr5476@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9d026ipt1dDu8zGij48UUSHdJdzCld7Subln96VsmcxPlKa4a
	V06LinfS7W9Gi8Mwlx4yyOFSZHDCjlvg4GJttGbVLfO0aLzdD7oVcaXigB0KoSA416o=
X-Gm-Gg: AZuq6aKqBfzlvhQDxUiFtV6qzqdka9x4mD5xP8/9YaR7KK5aFwYYcIghJvAawWTkoEM
	gqqYzc/34XPEDDENN9p6eg6gxDrpAywCQzNHW7AmIjGFuBKgU+TOqua94saEUjw/9a7TI8YBxIQ
	5nloAesoAuTFfuK3kX8nJ5fvSScZR6wGQ9SJJXFURW4ZvB+NHV3DXF/FJ8MlhwkOp/SUe4dm0D3
	5/cjsKL9DhaUCmq+Dhc3yObrnpiabTcXOGDhCejKMpljNGSlXi9JpxBqIfyrKbb8Zs4/X4ebP+J
	ovwZH6bAmzyZxetT6twzIsgFgbvc6M2BlKWF6q5oESjeevWBWbZ0UDuiP+n6Qh6PZPQw79/3I0K
	r5+yWMOzTI/TFAMthEB7OU4Dqddtfp6fgkROUppnT99xUlSPwp7wKWxwNrZCMCXVBwvKB4ADcXR
	KMqPaK7+bL5b20KCzruQ==
X-Received: by 2002:a05:6000:2585:b0:435:9e32:2b85 with SMTP id ffacd0b85a97d-435ea2209b0mr15783726f8f.29.1769869501605;
        Sat, 31 Jan 2026 06:25:01 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10edf62sm32649421f8f.13.2026.01.31.06.25.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 06:25:01 -0800 (PST)
Message-ID: <b5020405-c860-46c3-84d6-152de117e6ab@tuxon.dev>
Date: Sat, 31 Jan 2026 16:24:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 31/31] clk: at91: at91sam9rl: switch to clk_parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <2eece965466a91c95b0a958e7396cb16f60e0ba4.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <2eece965466a91c95b0a958e7396cb16f60e0ba4.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_062503_708242_A78CEE35 
X-CRM114-Status: UNSURE (   6.33  )
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



On 1/16/26 22:07, ryan.wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Switch AT91SAM9RL clocks to use parent_hw and parent_data. Having
> parent_hw instead of parent names improves to clock registration
> speed and re-parenting.

Please drop parent_hw from from the description as well.

> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>

With those addressed:

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

