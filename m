Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4ECC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 08:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D0ZfT4hXcILXw0tTnywFXr8dP4zdAlX+Ff7M5SnOmcE=; b=XtGpI//ceTuawmeLzVxc8Agu5j
	vRAXGJp5P+UOQ9gyqcF03OtlMrl/GHSo+YrkPMInTn8WTAfXbN+guDp0E3WjNjQ73C/BSRrn/+yFv
	Nh7ueFdzN1gs1Jvmrjm/wwv5DbQRldD0Y4bJy32/e/w/VhvUkaXy+f9kPcJnbi57JGqUuiQcjwYTj
	S1GOkabJQu9pgsegjYA5yNck8p6yv8wI5mQ7evZ+GWAoZyBBHWid6Lp91iWoihMtky4J+IQ+D0iEH
	xqm+lxn0+xkyGsviGjIVxzquVSUiPdOSyxpccJkjH8VvgZUFtD0i53RqbbS5mVIiismRteEGg72X3
	UaE7OOgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIL2-0000000C8An-225X;
	Mon, 26 Jan 2026 08:52:48 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIL0-0000000C89P-0dve
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 08:52:47 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-47eddddcdcfso24065175e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 00:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769417564; x=1770022364; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D0ZfT4hXcILXw0tTnywFXr8dP4zdAlX+Ff7M5SnOmcE=;
        b=JJP9V8NFzY5fywbEBAUWhAK1/m2OHrt8OnkoOpGYrSZgRKQLjwJ12glyDjtNqRs3EA
         GtlPG1AOQBxJVF9ptg3wi43rsQdau32sim+fL/XZdDjp+WfPfkThCdoc3pppIIi6DEYp
         /2iMkUbZO8GSAEMXzycYpQ6/rHe2uveDoYMI8OKa834eZsE8Ht7fopT8f/PXetCGzxjc
         fQgtNWQDraYQgmOLYUA6HayFaSHRoGpCzl442pT8VNRQxHCKOuJ2pQtQ2esIEn2ltNAT
         Niw2l3M46eIswmIIDdEoG6uLsnCnx+KZkQmI/Gp7drPwPxgWaiCHm0yJUJKLxVhDecsi
         crKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769417564; x=1770022364;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D0ZfT4hXcILXw0tTnywFXr8dP4zdAlX+Ff7M5SnOmcE=;
        b=GhBObPZRbeIcaV1HszDmV15Mk6frn06wJHXEhfWWNraTIuxwKnwConhEycq3ai07+O
         xWrxZIlZtlFr4GuobvXKNgdWkur2kWEeCuNFixM4UP3J5h90m6fVUw+42BVyh/Dpvq2/
         YJJ075DbHindSiqB+7HVMYHzedwRvr05TaEDndq/mBto5PLjn3aIFUivrqFReoz0Pm7P
         KMfZJ4OTDo01AX5NA4Ih65AB7lORbyF8sZcJqyP3UkrqwPOdVpeRN7ngoEDdrehi5thh
         KA5VyM52fBjV7zllOmbRhH6UooBjW+DT9kv0rbAQ4kzmLlMVB3GqAxLkluqIZpZxOSC8
         Uzqg==
X-Forwarded-Encrypted: i=1; AJvYcCXEtZUxp+Co5uVUxNe3x1PTRrWSOlZvHesbILmNAFJYh8GA6aFiRwDrwEckxrtf4tsYKg404f6pmJZK9pAM1dIx@lists.infradead.org
X-Gm-Message-State: AOJu0YwubKGWqU0tzA6lvQcuWH9Wfa1vq43rBmgfC3thdbQd7LtheweV
	1v8hWJYUvD+ZXkM+c8kzeE5L6vJZAtVdKl3FTiWNyEt6Uye81xh5mxS+qHqWCNJ8gjY=
X-Gm-Gg: AZuq6aKV44lQEJgHxqo7oPIKosbayoiWfJ8BIgFcGj1lBz0JgJeZW1X9CI71uwWsJzr
	otG/uhYKbCDdz7OrupQw9pb+/PNqhW4E1HGPlliGAuk1HKPZ4m54v+8ZTIXJJs6jt+lzvtUIqrz
	WnJIDBcnjRs5ywHKbd4kHLA60KGZpcIuFJ9MK+blEgooYL6HJQWvTiZulQYc0M/6HQ2Y3IDJjlT
	EeonmyOZVaccQZDJdAVcmuNqhBR7CyXHj/bmimXxg9RY114a1oA7yl608yUh+ALiJSge+aWV99q
	5rBmW4N1/e8ZTfncNJuPR4MrW99MjHnRW5hfGWEc+w35Aqd1l6zhkZOhTtec9DOeqfdtjj9auBW
	+INFheeu4FsePKOFpGhpnCcYjbJ9RD/5pC8jZTDfTWz+6o/bu9HXkGToOIhDTreA9G6st2JdIwr
	1wkwVp6nh3pn1jx23BnAu/xO8yzeLt
X-Received: by 2002:a05:600c:1909:b0:480:1d16:2538 with SMTP id 5b1f17b1804b1-4805cf67512mr68019415e9.23.1769417564125;
        Mon, 26 Jan 2026 00:52:44 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d3ae17esm102494225e9.0.2026.01.26.00.52.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 00:52:43 -0800 (PST)
Message-ID: <15b0d275-1b40-442e-81ae-054ef391ae98@tuxon.dev>
Date: Mon, 26 Jan 2026 10:52:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/31] clk: at91: clk-utmi: use clk_parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <e7757e961b1ba514bcab3178ac65b4ee8040b80c.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <e7757e961b1ba514bcab3178ac65b4ee8040b80c.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_005246_220354_EF8AE1E2 
X-CRM114-Status: UNSURE (   7.73  )
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
> Signed-off-by: Ryan Wanner<Ryan.Wanner@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>


