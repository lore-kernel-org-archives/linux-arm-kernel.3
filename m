Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F6ECD79769
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 11:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tdH4255hYxmy/F++J6erRokTwGbIkqj4FsLH5B/UD/Q=; b=mpGVNUpCoYQBiKLnv/e/f0bH9Q
	owkkhSLX4dnTuLAs9UIWyTrkGI6Vv2o2a+x1qORcQZplEgmtzGLw3rFV15ujudmWNOun7s00fHWJu
	D0j1i/17rnMTyMjpUWK1nRVyVUOkMqtF4o04UMVCE6E/9nKCSyaWGLIuQymsceVB60cagOllH9vVb
	dtisNACD0DdYF+5T4Cf1lb6zstpfK96PaVZ3in0lH8kPF/yuohAJrLp4OAkBs1v4TxPGj4ermWcMF
	9dihLdcz3nCagXt1IIoLa7x3VytRJXyWik0Jjg5FbgGu58J8cS2m9x+LQZs+WgCD+iz/cc7Wpzi6Q
	YKN0c+BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm8vp-00000002WjJ-0DfG;
	Sat, 31 Jan 2026 11:14:25 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm8vl-00000002Wiz-3kbY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 11:14:23 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4806dffc64cso21655555e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 03:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769858060; x=1770462860; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tdH4255hYxmy/F++J6erRokTwGbIkqj4FsLH5B/UD/Q=;
        b=GyEzMJqtwO3rhQhk/NexJhuGqZ1p4L/GdLsYQTYVhQpdSmqNtCHQlSGw7Mp6CB/Pq6
         MxbD6SO2YY3O7U1/527SAz+mc/uDdt0oCjUlXAY1Og1i6X959ZGUpwexHgMvS7gP1hf6
         CMkhM5WAg63JizWWQEcTiAQvj5V5GKhOgLFPjog7qr/ta2EX7SlcLkJmd+Tb1y0o4B3G
         /93GSKeb2ft1P8Ac7wfCAPIJ29A1KBNaFjv8tr5V51ZOMJ0462dWtHDtKFjMddzsWfIc
         JAuntj1e/M/w86h2U8ItX28Me62/Db/KYwU07vx+/zTN/2UyKv8O7YuN4zHkCYwCLlW3
         uKCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769858060; x=1770462860;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tdH4255hYxmy/F++J6erRokTwGbIkqj4FsLH5B/UD/Q=;
        b=Gy+vOalKkls31B6ipUIa9h0idyaoEy7ZCnrqttp4LMNax15XGra8q7Jv2nhxQIi3lt
         nE2VWWqRAQ3A0oFHe7xNAFxqcnXQtcv5RoRQUGnhhJPYYwlCB8wYA5DfzvUhP82b510U
         +KxN+mn/O6fL5Ou42EbKq3VZz6RQfk9N0CUCDborxgshl/Fh6U9yRHIuKcMgEbHDscEP
         oaAQ/mvCInyR8mOJco+tBoEUaMe9V83AGmQJXPA13oXRW8qa5qvECMWgUrlThE25PNgf
         LpgdfZfR+ZGknH9xeTITLaloH6V45HxuXZslprTTWnuoADIFIfcrViKtt9uScVaAVRyl
         MqLg==
X-Forwarded-Encrypted: i=1; AJvYcCWjErFXOCEEjuzzgePSCWw9CZEyZI2fYsFZP9vWQl+M29lKQjh2lITYjDdIFU91ZJJr6Ns3BU+IKcEUVr3cLMrB@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8kpDIeB3ZBUd8hxGIxTJHT65m3ihYmk/262gXQsMXmjWIIIRc
	XYisURkq63qXDeYCTsC6Ue4/tD2aJFLLAs4DEglryA4YEw7LYPJrfbgVlmn4z1sRtsc=
X-Gm-Gg: AZuq6aK+8axt5vW8nOTwW01Mbn1mydcFQMoISWHe6Wr42/1ti8dipTh83CY/rcjlVVs
	xZ3Z2xv2B7Cy0l6dqV86jh7GBZrAmiuTZkXWeqMlmhn5FP81fCLFjc2KqW2qFYCZ5yCk+4ayOOS
	+D6j1U7qfmL8+q4kdmtowys3SBlKHfHWGL5JYikY4QW4kO43hhbB0HkxeJvXK5L0oLoND+yGPYZ
	kW0q/hWsW6HGepFfCzmF69GAJrAKrVblDF+BzJKhoBfWtyNwoaVc2X5cAhAqcuwx5LocAMM6BjI
	AmERPTKAxmXxkJQNvswVPTzkKf9xd5ppyI+yfPu/uQzt/YgyxexPsBlJXc22VoQcaif7HRbSBiA
	u2v3GAYAVb5Y/xxptsE7bcidZDeHhn4ii9vvRqQdsNMeqLSHsnS3VLlmZjheI7KaygjJQmyIW5U
	qRpAXI2P0PdWPmBWP5JCxNjyeI
X-Received: by 2002:a05:600c:1e89:b0:47e:e72b:1fce with SMTP id 5b1f17b1804b1-482db4b5e04mr64888425e9.37.1769858059938;
        Sat, 31 Jan 2026 03:14:19 -0800 (PST)
Received: from [10.100.159.246] ([213.233.108.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cddffc0sm303822115e9.5.2026.01.31.03.14.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 03:14:19 -0800 (PST)
Message-ID: <56076f82-f255-422b-b99f-f182d413b34c@tuxon.dev>
Date: Sat, 31 Jan 2026 13:14:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 24/31] clk: at91: sama5d3: switch to parent_data and
 parent_hw
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <9431385f28f6a5fad9b4ee37086be58d87643856.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <9431385f28f6a5fad9b4ee37086be58d87643856.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_031421_963469_6DBB6160 
X-CRM114-Status: UNSURE (   8.65  )
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
> From: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> 
> Switch SAMA5D3 clocks to use parent_data and parent_hw where possible.
> Having parent_data instead of parent names improves to clock registration
> speed and re-parenting. Update the clock registration functions to use
> clk_hw.

I think you can drop the last phrase. I don't understand what it refers to.

> 
> Signed-off-by: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner<Ryan.Wanner@microchip.com>

With the above addressed:

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

