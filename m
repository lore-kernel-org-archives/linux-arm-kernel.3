Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E838C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 08:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7jGzhFWIZ8jRzbCcQfjDKAUo+hlscYAz5XQrdnrI5ao=; b=hJ0EDmnFUdOi1oSPR656+1SGw+
	JJb5kn6DO/+V4CgH2DW0KpcQI//XRvJivED1qFGqBRKEL2uoZyqoRbZR3Ell//rzw34go6/iDPutb
	PMDQ88wRwLeb22q/kzhMN6yIp/UKnmGqp2FU8nEprrwUFGaNBbcTuVZBFdzKeIOrwKqCfSAlZCvtD
	esxjDYsm45Ie7ekoAkpU6dnLrqAVZFZlr0bMO9s1KETwZkkiMEXFti1BMPfw/1sXmcvot3FP8OCH8
	U3FWI6I958gXtzUr2utNu9NTVPYhHZEVlQZg4qjx6YSIFWYiR2wYlF9U5UYm7y75dBBWsHvcI+D2d
	LyDWPw7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkILM-0000000C8Hi-3RkV;
	Mon, 26 Jan 2026 08:53:08 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkILK-0000000C8GI-0diE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 08:53:07 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-4359108fd24so2474971f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 00:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769417584; x=1770022384; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7jGzhFWIZ8jRzbCcQfjDKAUo+hlscYAz5XQrdnrI5ao=;
        b=fswE1OCs5VyNAvqil5nDf0TvtipC6iv2SjcteWVj9bJr/th+CA9OZBZnjgJDs1TRAs
         5OTZYvPhUoH8G+4HV/8+WIsp4aLcGJLePOj+UHfZ4fdKeQzr0JhycwtoEt2B6Tor5WAp
         2glO7o2/q4puNt9p7DEbUEIYDQ5NuPsLky8i9SdpaK2hsIKrGYEuwI0TsBjkDQX5j1dZ
         sVdTlmPtHMgVIBSD/xLIkU1VVz/9eXRvfdZqksLofEYCY2uKoWBUmbMhLRZGfLGwyfxZ
         4xizXI1b1YiLZUJgOFP8WVOBhHm0oL0hLnYeaeaaoEOvq+RBEXtlqAtklnXwXAWxN/pZ
         bR/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769417584; x=1770022384;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7jGzhFWIZ8jRzbCcQfjDKAUo+hlscYAz5XQrdnrI5ao=;
        b=sx5TrbdvhpfBsSpz9fmL5UhFVmzXlrA+g3T6Wig/Zm1FuCk7vkQPj9DLmN8zpEFXT7
         xwKb516kGrrf1xq4e1euNk8pvE7pCkIL2VeW+pNjOy8jkYvLTtGtt+ykWmKk80oSIcmY
         5jLAlyHpheiPts1lddVMUXfi+GW2WGMYyRgIYKEEXTf6EkWFCijn1ntVMxIO0MgWx1W/
         UqWGHg6nad9wOG+CdLZaBwDx9mB5ErUmk1RxWG9iJNSgzqivE6+QkFbtHeqspqUZBSBM
         ccBW8Vk67NpDJeiiA34EkT5EQWTmp5/rGedfSxYufXpqjPE9yRml78jF6b6lIcCYdlkp
         M6og==
X-Forwarded-Encrypted: i=1; AJvYcCX36jL+3gXepAjJR/pPL7vdibwNWZ1j4lHszHPMCmA2Fj29Qgmrx4MAy4j3eh+c99ynM/FcrXjnxkPmN7dVFou2@lists.infradead.org
X-Gm-Message-State: AOJu0Yxa03PBSzk3u51Jwb7bXew0TQejX7vgKjIcuATJoJAfqz+/UQ2/
	lcR/4+tJ08kLYmN54+oB6fdP15+L6eoLsWK9HvHzqGaHDTDWbRGtl5f84Y+BJr5dHc4=
X-Gm-Gg: AZuq6aJ5oSFNszezuDswrI8gOCXxsztrQZ5dh2E7xcUrjUmH7Hmzf4VhnoInBedPfhD
	eH+BmMiS5G1Yee5z7BJSzQH9vdbrZvZ1CXd5T32iOUItKIVLWdkknbWwjt9zx/tZZU0sPbl8LjU
	Zi82p0+f8ei6eus/YSLtoTkicvISN+bz9hq0Dkah3PAMMDoSuo4nJKpEML3U6qr2eqvsijXtrVV
	c93y9eLeJWekgjZUexanJuoixEX4IEu+gSO7kUoe/SdGiW0i7NwEl1LFvNZOr09pt+bKU91m/xg
	5aCW9nDi21KEJibhbOAEW2Tjqo1a196nu/xM4AzwTBWT1qTykKXBhv+DzZcAUaotItFWUJSQW2W
	UVYEvNhQV17Uzmh7ERHXwY3DtdDNJOIrwE73bOs/nuTpBUjBXN7r8tMtCJwOd5cLU28jWY54zRC
	Fuk/a4ZrdVt4ho8VTuAg==
X-Received: by 2002:a05:6000:1446:b0:431:656:c726 with SMTP id ffacd0b85a97d-435ca124817mr5395609f8f.3.1769417584092;
        Mon, 26 Jan 2026 00:53:04 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f7ba0bsm28791612f8f.40.2026.01.26.00.53.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 00:53:03 -0800 (PST)
Message-ID: <10329006-dc97-4a1c-acff-cd8d583f2678@tuxon.dev>
Date: Mon, 26 Jan 2026 10:53:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/31] clk: at91: clk-programmable: use clk_parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <6139b579434c16fefacd3635d2c7ea67b9ef7822.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <6139b579434c16fefacd3635d2c7ea67b9ef7822.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_005306_234573_ABEFC37E 
X-CRM114-Status: UNSURE (   9.70  )
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
> Subsequent patches will aim to completely remove __clk_get_hw().
> 
> Signed-off-by: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip.com: Add the clk-programmable changes to the
> SAMA7D65 and SAM9X75 SoCs.]
> Signed-off-by: Ryan Wanner<Ryan.Wanner@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

