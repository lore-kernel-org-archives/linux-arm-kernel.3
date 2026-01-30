Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5763D49C60
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 07:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9DIjHWeNH/g3qucwaMkrhvsbsbLff0rW4S4BIIu3q7Q=; b=YvlMfR8c31lo+mqMrm9Fvxf/jC
	o0dXqhpQT40E9fzp1iy1RqupD9fEbnDI1c6MBpHbbRzNkG4BLkL9wdGieuXT1rXftKQkIdKU9HJFm
	zSy65VJmzG0iJIXAnFxw7JCjM+dnAO5EcYajRlRf96xrtgZPYV1EauEXgSkzqy5VtUzARqXuw+wk4
	DCTWiAHnu2Wg5LlfC+xxMSR/tbboy6tAEscDEIdZs6DkRILvMjplzGYbFieA8fL7a2pbCDGN8RAWD
	0UMpmGjuWHtp+IH7oTuEHeUCRI3dKE17g34jXKgWKCOV3+1r7YWxBhrUvJLZdn3BCyDhU1CekHQ06
	ndiHUBpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlic0-000000017fG-3ZYC;
	Fri, 30 Jan 2026 07:08:12 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vliby-000000017en-1AIr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 07:08:11 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so16527495e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 23:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769756888; x=1770361688; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9DIjHWeNH/g3qucwaMkrhvsbsbLff0rW4S4BIIu3q7Q=;
        b=P0c0iQzHIZQAKu5X2bJB+ecGf/sMviWEQJH6pycs2KcvjVOffw+5D18Cqv+9+h423Y
         c8lZ+4rFWlXJ3lWwYsrkHRsekoL457DIJAbmqTogVn0P7KyaRozJf5FCSNkRVcvXE3X3
         De6ERZpmx0hN5ljItrtZUh5wnRN5BA7yN8Ty67PMbXv6r3FSyPn9SF1RAwwkWyuZ4HLu
         Nw9I6fBk+rk3HPvcIxKPFGY4YzbwfMRP/tuoxMAAjVePjOogUzZWM89odAbIPdnhQoz6
         QzrmH1Sn2JWAEmXmw83ZN4OkoxCvhgrPwS6us/HptWv0xAvN9LjRxMjFewXj/+5vHiGt
         uKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769756888; x=1770361688;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9DIjHWeNH/g3qucwaMkrhvsbsbLff0rW4S4BIIu3q7Q=;
        b=K/7m78iXejfAqtP+6D0huO457Ix5QCqNCwhVwgmu519ZFRlTL7dtne7f5/dCSrn1wR
         /GRzuZKumwfOD6wLuOTU/m2j8DnBTAEHmCnAmXrUzAVek9EfNpgb9+nVpETxci+wMegc
         FYFPSd5LBOJ7occaYDM+RXtx5GfSufI3CYqpWp/kb4le40kVEHVGyBy2+IjjHUaiNZMf
         cD7gIzxa4sSybTw72DmrlNqtS5bwEAVI7B6BOTx9Ffte/hAoAIcV720d6VfQbu2XqhUT
         59H/2UMRxh7560cfVWNWyOAs2CwzGsktmTlKvvoNNS7NX8ErOS87ahPJRlufoRKKP821
         c33Q==
X-Forwarded-Encrypted: i=1; AJvYcCUFYsecLEnBUcIkaAyI60u45M834tFD1YqS6WUMFd5wSggWnrH2XNH6qMhRnUEZYuEj+1aGMDs5zIqdJIz4MTSR@lists.infradead.org
X-Gm-Message-State: AOJu0YwYhiBv2sgDVqb1oqDd//0lvbmyU9tRFUL1ONiT18UrV+P7hiwO
	UvFeiArJiT5hKtMqD5KAtVA2sfMCq5LcqvcJMa279pH3aoyUiHt7DHbJ26igmFY6I/M=
X-Gm-Gg: AZuq6aJ3JQI680EtUsvxad0bwjrjUBaXMQwV5LhZ2GBfo7bKEj5bb1d54wmYdPimSwS
	Du2GyNB/UNJPLkEmIv+V+J0rzGY3XKqN3YB5GJSIcVNPYYEWmq+1mAgEicpKx4YHDGr61T8yZop
	CWWo8HYu5e/W7W1zHBqWF72GiaWZyqtShQaKc0rJt7YIvdq50VwYhRbeZLUQeSfBI8yu661KFqL
	0w8HLOavQeQFsYh94XkZhcL4RSJFztQ/EjQn7Lg5D2sbXt4GbFZq42NcqNeXW5Lc2afDuJa55jz
	+komjPhMstjdI+M8WQhWA4RVv9mWqvOGQhgaPVefwuT0p5eZIxp51y30aRIYCdQEEpTvUwNEowW
	Q6GETULFGijD0qX0EIFyOQ0EHMpvJ3xK8pKpGlDYvyTctn9D7mxyazohNtMEswExmXP34uMAuEy
	2R+hQJxaI1hAHWiswFww==
X-Received: by 2002:a05:600c:3b1d:b0:477:9cdb:e32e with SMTP id 5b1f17b1804b1-482db46014dmr20938165e9.9.1769756888362;
        Thu, 29 Jan 2026 23:08:08 -0800 (PST)
Received: from [10.31.13.216] ([82.77.28.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482e04a082dsm7883645e9.3.2026.01.29.23.08.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 23:08:07 -0800 (PST)
Message-ID: <4d3e2027-21a6-428a-9986-83b8e41f1263@tuxon.dev>
Date: Fri, 30 Jan 2026 09:08:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/31] clk: at91: clk-system: use clk_parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <7537c90e81803116bbf440c08f883c4e0f30a28d.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <7537c90e81803116bbf440c08f883c4e0f30a28d.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_230810_322288_B502EC2E 
X-CRM114-Status: UNSURE (   7.53  )
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
> Use struct clk_parent_data instead of struct parent_hw as this leads
> to less usage of __clk_get_hw() in SoC specific clock drivers and simpler
> conversion of existing SoC specific clock drivers from parent_names to
> modern clk_parent_data structures.
> 
> Signed-off-by: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip: Update SAM9X75 clk-system to use parent_data.]
> Signed-off-by: Ryan Wanner<Ryan.Wanner@microchip.com>


Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

