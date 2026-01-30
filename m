Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1ECFD49C65
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 07:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xpxkN9CzPqlfY/w02rIxvFlrDNaXNReJDm117rqc8w4=; b=r3nGC1j7N51rKxcZEZRkTa80Yy
	tZbCSfcWq6mvPKCkiUIW0WXyk9Lk/BbOLiHsIYGBvrlWaDiYZcYnSgm2oKRJuekFzMVjoQeEIk1MD
	/aTqW8wJWOhqC769uQUCv8IHd/e4stELRyKp19nh6RmyViZ+PkHmLRDu5CombqZvts11jCoBwvLYF
	/yCk1qCayKKypLn2JR7cTjiHvfKM82qVPBA/K1JXSStFRwe7wbiZ3ejLT4LqbKzC0/00nIjgA6w4z
	wed5KDs7HKFrBVkTaheM3DGBhEt2SuGOT/jx6BaCfganrq1GZytTplllhswHiJOju2YVjP+0bEhVl
	CEO4K15Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlilt-000000018R9-0gpd;
	Fri, 30 Jan 2026 07:18:25 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlilr-000000018Qo-0UbO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 07:18:24 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-43591b55727so1557194f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 23:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769757501; x=1770362301; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xpxkN9CzPqlfY/w02rIxvFlrDNaXNReJDm117rqc8w4=;
        b=TyK8PzCFmGGUSc3j/werFI7o+kPqPjxy05Gsa7+aUR3wloxD/SffHFz9+a3QWun6k8
         hwZ9u/wRC0s63t1/l3KNgrXw++NomGy3dGOZkpFnc0zJc/Ym0XErrsWVjcfUHIIO9Oit
         dWZ58l6w2RC9OG5lVuUR6haoj8uTPbuX7BdlSvqxMP741Twjq46jeZA8RPqRdIv22S4H
         +I5D4bllEhaseHJEjEohZh2RJl1NeBn5IPVJVBnqF+eGWwp//tSftnLl7+7WeaEw4azK
         y+2OmJSWqSQTjHhrZ6uxerMl+9cjKnFz8xZ4rt23ZhUpjzpuNSiXufkwv+BA96bDS+sL
         kohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769757501; x=1770362301;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xpxkN9CzPqlfY/w02rIxvFlrDNaXNReJDm117rqc8w4=;
        b=BjbldeRDrYUZMeM+9jHkiv8tEPDUvgB39FUhsX+7c325h1vrMqlsC5pPmud78EcYbK
         i7elE8wIichITPwczMxFydKrdneeqj79cbJ+YEb7BLarZQT05ZL2v5+In3ljtK6sS4N6
         f7slts27K0FWH3MjUmj9Vvs93gnBDRtVfoGBi5YnfXNgQj8EwwDtYfU7LAvnDrNIxHIY
         RVB8YUuJtgTmp1w2M1FFyjjyH8+OgRfNTaQv1Wg3UEojA19CndUqRusaP14sEQa6K0KI
         /Xkh/5IVs2XuOvkIYYAA2S8+L9zibWhhMiQG29bDWDk2ITRQcXD2454Rp2zjXrBp5fWN
         VEUw==
X-Forwarded-Encrypted: i=1; AJvYcCV/sWycHIl48FzypKRltbqZv1YzZOMMSGTrqPrKTQ1L8qwUQsiMgP1zz4vhJBVIDUfQgvlKOIrTAYATSTrGFKV5@lists.infradead.org
X-Gm-Message-State: AOJu0YzC7ju/puNGmOPmerxfCPRkGjI4TkRugNywcEpkLunCFSlt/l2L
	3aBfnIZ6bxy6G9R+issM/OyMniTGRl2ItWOUqrVa50KEw6WlymBkCLgJj/GY815Kkus=
X-Gm-Gg: AZuq6aLHf+1yMGzbgdVfzchvtOPd7xyctgdSGVhS35MmJGmypjCcd3hAtt+vN4UUgn2
	HIRYZRNZYWPlhCNv941vX6i+kaZhYSuxvCkc3Vb+25h0ZjIJJfpSjk+UqzO5kO/+eoK1WpEqc/y
	KroJNZkI5So10c97LIVyvWFv+6me3dLcvT4AX2kHu2hAm5ZYkmP7T3SxIOmdM5xawi/Q3S7NjA6
	MHZd+Mw7K7bPIO2bamCZqbGRyCW/rlcf6RKuKQRqL0CnWcvn/X6hcrczW18GMwMnUMkoPNeSkRN
	opoFfO2xeu/vJHu03MwHtiSJ1GXjtluXI01QT1Gea9CO+YSUZ99gFG1d1zQQWe5Ekuq/G3t1jzC
	CJ09f/5LdjqYuFbMZCqTCiZLl/xHqcjuhFccsoFO2pC0FkTeK7x6syILkUtQWcZzJGFFoAhOpLN
	BSPn3TYsUZI6NGRitpXQ==
X-Received: by 2002:a05:6000:2910:b0:431:864:d48f with SMTP id ffacd0b85a97d-435f3a8689cmr2938639f8f.27.1769757500929;
        Thu, 29 Jan 2026 23:18:20 -0800 (PST)
Received: from [10.31.13.216] ([82.77.28.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee040sm19847702f8f.11.2026.01.29.23.18.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 23:18:20 -0800 (PST)
Message-ID: <8d3a2c5e-b31d-4346-ac47-12f9aa1b49aa@tuxon.dev>
Date: Fri, 30 Jan 2026 09:18:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/31] clk: at91: clk-pll: add support for parent_hw
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <7b6cc0e89a31b5f0196c0770dc692edf550e01d2.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <7b6cc0e89a31b5f0196c0770dc692edf550e01d2.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_231823_189783_9B5C2E43 
X-CRM114-Status: GOOD (  10.04  )
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
> Add support for parent_hw in pll clock driver. 

Isn't it parent_data?

> With this parent-child
> relation is described with pointers rather than strings making
> registration a bit faster.

Please update this along with s/parent_hw/parent_data above.

> 
> All the SoC based drivers that rely on clk-pll were adapted
> to the new API change. The switch itself for SoCs will be done
> in subsequent patches.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>

The rest LGTM. With the description adjusted:

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

