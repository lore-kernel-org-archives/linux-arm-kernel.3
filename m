Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA354C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 14:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jwmdQqglUsHFWpk5iMe/ySqB2I3J+4h1U7l6JuJEn8M=; b=SAtm77fc3DFF/hsVhi87IPPhLv
	m+GLwucR5kdn83AjODJ+QlVcvsUD3J7lXBakHIQGNNxpDB604PC1ToI38RRcjfBrBXWoSO6WHQfvx
	5bvHiNSg//Xso9hr5x/TCKh7YgbtYXiZllPOgzBxbNPFt87VNJ/xSrVULyFX8eLvW0qZrgAeqC7XS
	Nh+eTaM0l46HyLKqUgO9AJwgrWfSg4qTe5ZlenCD7nxuIyr0dUtk4xI76gA9bnWOFv5C9ZzLrnKlD
	gskxkJLfcpBqpfxj++weDByC1r3eK8no1YGsXvtpoOiFQ/MKCljnk2+OiDzWkoUJF4ztxSJ0NEd/y
	5LBP36eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7wFF-0000000GOBm-4Amz;
	Sat, 19 Sep 2026 14:40:49 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7wFD-0000000GOB1-2uhE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 14:40:48 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49ccead2aecso8064545e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 07:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1789828846; x=1790433646; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jwmdQqglUsHFWpk5iMe/ySqB2I3J+4h1U7l6JuJEn8M=;
        b=IfXLyEUfA8idm0/K05I+SryJL29WY+GxgIGPkXQa29IDn90QN1ZczhmnwW8eCt5T4t
         DMr5KFEXV8t+yIyQrMqfLveVCW8xeE28awl1UFOg3fhZiUxTvMWfnMHS/4OqggFW2a1w
         GOe4yXX/wtpotTpZxaO9ixDMbCjj/tXo1/Ci+IP/L1v2DSGluKU3JAEuG2M/8NLF8ioT
         z1Mjoib9PdZDNvPdOGgUL2sU6j2ea0vJeAA9rLKB5dVAsvNE68Xw0cENtUMS4ktxjWgc
         YVlasAN43KNgajJerX8U+ihBiUbvcSGwPoQ/kne34WpbEiN34yxxyLFupdF71PuERQBB
         VMcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789828846; x=1790433646;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jwmdQqglUsHFWpk5iMe/ySqB2I3J+4h1U7l6JuJEn8M=;
        b=Cq08pAAo300HH30N29Knu43TVNz8eJZAsIICs4aUFuNJEaIaNYRpIITt8b3lHrz5nh
         rfHzFJ3j2DUEm8v7tiJUvcbTCgK7SuMtIVgmXlIvJtD7JbrimyU7D/DsZqGq4jGB4jpF
         vnFPrzpcZSxQjJNAl1JEHgqSKw7xzcQXbhS87nApYzHZY3JafwDn/kodxu5fAdZwbbZX
         /Vesuqfg1ALfPwjDcVWI8rzouU5aL2renVa+vw5XOTCdBruicyyhNouCF23L1n/ygewE
         WKAME50P4RixsVadGtL7CTFKeKVOdCYC2e/HYslbL/+J5HodndvgXYz9u7L/kOvshT3l
         DWZQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6sGDPxNbUp7UZaTjAsHfKfzPUvrr1RWCBeq18Mt1m4TTY1w2D4TxizIdwgp2J+DTTB5jk2bYAy2LgwETTRbNj@lists.infradead.org
X-Gm-Message-State: AFuF++nFET14SmzDqyzFSjUwPwnIW1xzWMGeTaLpldjC8rdAzp5hYGJr
	y8FMWcDe0GSXUzq/E9gsecYyUP1GFJXEawYYh5xqsgyB3E6KKPD3X2vdT9vEgimpDNk=
X-Gm-Gg: AYBFou0d3eG/ZA4yu2Bubg6GK+EQfEtMSiuDnqOGx/dJkk/KBPEHfXJwM3j5Ukybo4B
	XgNz4Pt9SjPQSZ3usGPghh/Z2DAR2PeVeRUZY+E6N+BRFAtw1E51qTptfGsByAAtfa7qKDFj4E6
	01sTJ+VnUrWTeGJaqqXfmH9AiaQQ2cDOO8+sPTHq+ye7/XVenaonfiYSkVKCgV71vT5M5YddqRD
	lHVK0Fwi2fsgkrywzY7RXpY8XhfKBvPZbzoWvYFTkbzkUINQaN073OXWaYp+fUI5bGPAmWEyITc
	oP/MQwF0Et2xIyoosW+oVQq221FpGEhkG9Z3PKRvFTT2htpi9T4shcwDT6ox4C3zcSOb7jeVzbK
	EkwQ6XDZejL3Pc5z/XhzmQy9ZbmUeMU9P400ru6vBgJo4th3TBtqttxx2pybbjJAb1O4u9z5epr
	IcH/q41xMOzM4jGJx47k176wVCjCBO/PBs/ONgf5053ENsLVG6Z2R3MCTtFf4cBb1pH2gsGELc1
	d+dgd9o4Uf5QaqNB+BqzV3eUtUvS8hjCNTN2Q6Ilv7Fwe/sRYIMsvA=
X-Received: by 2002:a05:600c:4ecb:b0:49c:fc6c:be03 with SMTP id 5b1f17b1804b1-49fc5754e06mr75514935e9.26.1789828845928;
        Sat, 19 Sep 2026 07:40:45 -0700 (PDT)
Received: from ?IPV6:2a02:2f05:1204:e000:2cf7:c250:64a9:ae77? ([2a02:2f05:1204:e000:2cf7:c250:64a9:ae77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc52a5b6esm67531315e9.4.2026.09.19.07.40.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 07:40:44 -0700 (PDT)
Message-ID: <be98fdf7-17d2-4b41-ba9f-df4c8bc276c6@tuxon.dev>
Date: Sat, 19 Sep 2026 17:40:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: at91: main: Drop unneeded cast in
 at91_clk_register_main_osc()
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Kees Cook <kees@kernel.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <51abd9177801984889c2a0c321ea8587677178c8.1787316176.git.geert+renesas@glider.be>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <51abd9177801984889c2a0c321ea8587677178c8.1787316176.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_074047_743028_B5E6BB29 
X-CRM114-Status: UNSURE (   7.20  )
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



On 8/21/26 15:44, Geert Uytterhoeven wrote:
> When assigning a non-const pointer to a const pointer, no cast is
> needed.
> 
> Signed-off-by: Geert Uytterhoeven<geert+renesas@glider.be>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

