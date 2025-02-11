Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B508BC021A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 08:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WiK7BHSVgTdQkQZzP88yLZAKhA2S6bWhUg1LMOvnPkc=; b=vMiEtrNFn4MsDP3yyT62gBdsoy
	n8rxPw1whP16Jh75lCk5r4kV5sHT6RbO0axNnCha7wV20S+nDrgnHvm3NX0ICR2OWUX8C5aEL6MUn
	eozpS0uPxuu23jUDG3JZLgSVseDyCmtwYQHRrW7hO87ROmxwTRinQ0RReCL765fSQIkBf7M/OjnEM
	a7a9J7wQshs/c2bF4QHzoEOGZeH01lv1ZWjamk+4bghLy552mQjDyokX3biXOLitPl87SmXiE5UPk
	MIzU2erlTsn6SP9Y6jAhZ3N9/T9wNZlIBtZsAglwDN+uFZFydBlsbI5y92WWYV8aqHi8mizyG8zH5
	AOOxc4OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thlLH-00000002wg3-09AT;
	Tue, 11 Feb 2025 08:10:03 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thlJT-00000002wII-0xhO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 08:08:13 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-38dc0cd94a6so2413403f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 00:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739261289; x=1739866089; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WiK7BHSVgTdQkQZzP88yLZAKhA2S6bWhUg1LMOvnPkc=;
        b=GYJffrDuXLq2teG07qkGmQT1wtYrMMjM71uXJHs4/mxArKDh/UQqAx3JiqGvZ5r34p
         bfHB69Upi+3H/0XLgzSmWnkPRTYfyiBfRkIYVj9W1jjIl0oN1EbXSOokK08twmzpjOc/
         aWv2ON2y1a8Kp0ghPv7kFa4+hFDs/sgOpyuRodM19EPnyCb+2Cz569YMbjg1UDgfbS2n
         bWQf4zsNFjcW47KkpNC90xArFCiAKwk9XImZoFg4NWdFijfelgA+htqAn3ozrlt2vpvi
         qkC+Pjis7S1d9xrplN2OiV8x5tk2qucT8+4PGqw5Hg5LkFpjfN2ROf6DqsMXD4Aqofsc
         hLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739261289; x=1739866089;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WiK7BHSVgTdQkQZzP88yLZAKhA2S6bWhUg1LMOvnPkc=;
        b=c2vCgqn7d9PF3ht6/ZWIvOyvzwqktGsSqeDdH897fdRGyliCPjvflYcMChClp+gHkC
         tjS/AU8gKyGlcbiNgqtU84F86Wiu8mnJpNoZeA9xBzyKMaar7W7xChkuLe8KqubcZh3T
         aiXkjn+ikks1goTL7yf4r+z9SAoJZDIa/Qf803WXYHXBRwDb6Petym5/ptaWOt/OYaWQ
         28auRoHuspHQDSqGyhdAsvH4srF9WyKOoLY4k3qkqkIC+9Fn4k8inRw2n8TCfrG4glZF
         A4knoRGekfBmJeHQKrjzwQo0dALjcDTCDEDA6DeQqFVynN0QYzifiug8Jyrrh6eYkXwZ
         tHeg==
X-Forwarded-Encrypted: i=1; AJvYcCXIfIxPE65kuneOvp0pOZ/UsDZuWLGAmydUAKdyLEpRxmS6li5WJt2Ud+nuXqwfdXGLRyXr1ER3n7Q1dQ8Yt89e@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9DYaiC9GWgBz/PWqq4N/xveo5wK1f9j4sZwZTaTyKglFwtMzu
	0NDoG7bIcJQlHs3vktUefF1enFd7EjodgYdurbSsjradQ58/KVBxTUCgvd2X9R4=
X-Gm-Gg: ASbGncv/5CSM+pHAJMh5ytyKld8+TH8LSKgyxXSWlxgDvVuuaxktuZRW1rUXopG+liD
	Dta7SAKv7HbasAMoUVGIZ9uVy2HcYxXCP7ZjMkxePBOXIY13vZE0lGvyXvlNkVgPpO+TEc2l0Rx
	BEDwTNLBs1D1R9tMBsiHwQuB+Df+rto7hoEUVhpEzTjbvnXjmGmyFyGEhqRn9s82mTYyRGT0Tm2
	35g8TsqJCYJ1GIdaQN496akPtqAgIP1gGX9GipaL+2MSBL9KXnrrr70JjdcvaaS17wCML6sWxdV
	qJCoYstZV8KzfFmouqB8wB65C0nbSsk91dF1M9cyTPAIl1RwoPIpf8o=
X-Google-Smtp-Source: AGHT+IE2oWYuWjmjvpu3ABr0HEe1925aEaOPbTS7VONKBvqKWoMObjwVOs9MsKRzrKKQMRmZMw7JGQ==
X-Received: by 2002:a05:6000:1561:b0:38d:e38a:5910 with SMTP id ffacd0b85a97d-38de38a59bfmr2866271f8f.28.1739261289162;
        Tue, 11 Feb 2025 00:08:09 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4392fc7ceacsm102977005e9.20.2025.02.11.00.08.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 00:08:08 -0800 (PST)
Message-ID: <0b37e5e1-6dd6-49fc-b874-741e75c8d56a@linaro.org>
Date: Tue, 11 Feb 2025 09:08:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] thermal/drivers/rockchip: add missing rk3328 mapping
 entry
To: Dragan Simic <dsimic@manjaro.org>, Trevor Woerner <twoerner@gmail.com>
Cc: linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Heiko Stuebner <heiko@sntech.de>, Caesar Wang <wxt@rock-chips.com>,
 Rocky Hao <rocky.hao@rock-chips.com>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 stable@vger.kernel.org
References: <20250207175048.35959-1-twoerner@gmail.com>
 <5f9cf65221690452d7e842ee98535192@manjaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <5f9cf65221690452d7e842ee98535192@manjaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_000811_280680_A40A7299 
X-CRM114-Status: GOOD (  24.14  )
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

On 11/02/2025 02:40, Dragan Simic wrote:
> Hello Trevor,
> 
> On 2025-02-07 18:50, Trevor Woerner wrote:
>> The mapping table for the rk3328 is missing the entry for -25C which is
>> found in the TRM section 9.5.2 "Temperature-to-code mapping".
>>
>> NOTE: the kernel uses the tsadc_q_sel=1'b1 mode which is defined as:
>>       4096-<code in table>. Whereas the table in the TRM gives the code
>>       "3774" for -25C, the kernel uses 4096-3774=322.
> 
> After going through the RK3308 and RK3328 TRMs, as well as through the
> downstream kernel code, it seems we may have some troubles at our hands.
> Let me explain, please.
> 
> To sum it up, part 1 of the RK3308 TRM v1.1 says on page 538 that the
> equation for the output when tsadc_q_sel equals 1 is (4096 - tsadc_q),
> while part 1 of the RK3328 TRM v1.2 says that the output equation is
> (1024 - tsadc_q) in that case.
> 
> The downstream kernel code, however, treats the RK3308 and RK3328
> tables and their values as being the same.  It even mentions 1024 as
> the "offset" value in a comment block for the rk_tsadcv3_control()
> function, just like the upstream code does, which is obviously wrong
> "offset" value when correlated with the table on page 544 of part 1
> of the RK3308 TRM v1.1.
> 
> With all this in mind, it's obvious that more work is needed to make
> it clear where's the actual mistake (it could be that the TRM is wrong),
> which I'll volunteer for as part of the SoC binning project.  In the
> meantime, this patch looks fine as-is to me, by offering what's a clear
> improvement to the current state of the upstream code, so please feel
> free to include:
> 
> Reviewed-by: Dragan Simic <dsimic@manjaro.org>
> 
> However, it would be good to include some additional notes into the
> patch description in the v3, which would briefly sum up the above-
> described issues and discrepancies, for future reference.


Applied and added the additional notes in the patch description.

Thanks

   -- D.


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

