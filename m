Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CC6C02182
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jan 2025 05:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2wBlvQUhns2Fl5P0fg/DPPg45l3SQWGXjsshoQlChso=; b=qUeIgqQxd/t0XywdcFfJfpwiv4
	0IRbRmmmije8ZMYFkqI+h2A6f4q3ApaJA4rcM6umApUuf9K5kmgckqt0TjjxHikK1lYwSMpkfiJ7r
	APL52FztrkO4pSKyA0bDMFko0P6plNlL8gTWSVJpWnltZ1Vlp5AmLtY0f8EsZ+DwsGjdYC7fgMePX
	b+7Sa96aXQfKNGzMmyvRCqHmgQt1FUnJJBGtkvB3xPWHLFRsRwOXxrIIQx+dRNAB7FSaTicf0CKNx
	3aOrpNR15BTt3zilWwleNpy4jTL0MjO7HLOl/NrnaAeUHf2h0bArt0b4cWTRyZjks3JIG66MgWnDQ
	/oIn1CpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbYtR-0000000G39A-02Rb;
	Sat, 25 Jan 2025 05:39:41 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbYs7-0000000G31n-2Ufz;
	Sat, 25 Jan 2025 05:38:21 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5d414b8af7bso6193159a12.0;
        Fri, 24 Jan 2025 21:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737783497; x=1738388297; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2wBlvQUhns2Fl5P0fg/DPPg45l3SQWGXjsshoQlChso=;
        b=bQWt1ZG1vfAjr7VI2wwIb8qDAwK/hMG6DiKPk3RwCZKv+sbMANPy5scc2eWpmtfrRJ
         f0kIp7b+zsj4zp81J63wPygcl1hFwQAZs52p/XZYVh2TIg76ntA2OB4xiFeQbwSzfine
         J2xnS7QSSRx1HcRwRNnaOD+BFeh8D6OgfdXnhyHZTikfDzsb40GQj1nKNojBcHcT5nto
         9MWPLLpB/zBkJrABim0W6fvIWYoUJnnLtpyy21hE9ouSuWQu7RfcRFXJ2bBIybhtXmSm
         Bz1ZQ3OerrrA0+dIRat9fc0prysITibUH+6tO3xI7U+GO6PdNVx/WYDFqlQV+beAdYrK
         vk1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737783497; x=1738388297;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2wBlvQUhns2Fl5P0fg/DPPg45l3SQWGXjsshoQlChso=;
        b=LfrPoE1FDWGsrLpa+yZWc4gckVVK4eZrLEg3X/y4g3b7qD/Q2U57P8idlLcshe2o3m
         gD2BhQAdCPZNvakz3FwXSTK3QRTT5xpjbTQqEqIIxBYccjqCNpoo8BE500R2JQ0zsua5
         gLcSIhikODDP/mlz0pf73dcHvGNvEyTBy99MfUC9iLZ8qT56WAr8uPAfc1gdXuBGH6h7
         e9n7AFOMsnD/L6QNspuAq0ArJiVdkD7SduwO82bg4cBidrLrB7t8zs2MtoFmwEGxFuSj
         7S4CyufjWbQ3GODTcXf++MduUgARJIof9egzAgAp71Fx0wkEwld1CpUWTyw3jzVJW718
         cLGg==
X-Forwarded-Encrypted: i=1; AJvYcCXKYRb8rKWeVOZwoE3mOSNj6czgY9IibCi5ezGXH1XQzz1D2894fAYjqqPfTRbRGpnAYdoGJQU06P0G3pcgpTnU@lists.infradead.org, AJvYcCXUTA8GlwurIesWzNNeKuifMzHOJZ0oJW03yCLZZFzA7mZS/22zmPpJq0Fn6JHGMvHeImjDTSS8S6kDNLp8bFM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxszsrm+eItyJ1/ajvLKU0gbbHbPg46Zyc516lDA2vZkVzggZt+
	5PMMiCfkfrN3qpFlEGz6wnPpBBT6PL4X1v5HkTVWJv+/mZbZIbbBqxXe
X-Gm-Gg: ASbGncvAltk0c7BwYgsKCCI4PTyp0rjqHINzRGzxmh+7koxQzm+Aj1OQ0m7kvmX1Ndk
	qxeQfzMbv4L0lRXulhjvhWmXzyfoYsKUU2rMowaI5JD/lJaM27HKChnWrWsn/m8nPVJMa56BrPB
	72MLbNt7A25iXucXSNaCIDDlbucpe7CcIyAL6zCplHNEbHLxnud78R74IqauS9sncqvReovt60N
	qJJSPddmNQ7+qSpjDl1hw11A0lEprE8ob7LKQpzmNiUCRwTR8baNdp91coQRgBOYYQb72Qvrltd
	TFYd0qdUZ7FmALdi3VFUO/5yIwxhMFRa1ibbunxYiI2YhAClg7N5ueh45YXCjw==
X-Google-Smtp-Source: AGHT+IHAvNy64vq2AlNHzrqw8S9bi5DJ7yFZQfWAQC3Lt7zxz1sa1Y3OWNi5oA+jIVvNPXiO9gaMQQ==
X-Received: by 2002:a05:6402:4416:b0:5d9:a84:d4b6 with SMTP id 4fb4d7f45d1cf-5db7d0e8a21mr31148865a12.0.1737783496938;
        Fri, 24 Jan 2025 21:38:16 -0800 (PST)
Received: from ?IPV6:2a02:810b:f13:8500:3620:7e8b:b241:a0c8? ([2a02:810b:f13:8500:3620:7e8b:b241:a0c8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc18628282sm2071358a12.17.2025.01.24.21.38.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 21:38:15 -0800 (PST)
Message-ID: <8752cfda-b90a-4296-a08b-054b177aa586@gmail.com>
Date: Sat, 25 Jan 2025 06:38:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] Revert "clk: rockchip: Set parent rate for
 DCLK_VOP clock on RK3228"
To: Elaine Zhang <zhangqing@rock-chips.com>, mturquette@baylibre.com,
 sboyd@kernel.org, kever.yang@rock-chips.com, heiko@sntech.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, huangtao@rock-chips.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250125011545.15547-1-zhangqing@rock-chips.com>
 <20250125011545.15547-2-zhangqing@rock-chips.com>
Content-Language: en-US
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <20250125011545.15547-2-zhangqing@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_213819_661136_7127CBE4 
X-CRM114-Status: GOOD (  20.13  )
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

Hi Elaine,

Am 25.01.25 um 02:15 schrieb Elaine Zhang:
> This reverts commit 1d34b9757523c1ad547bd6d040381f62d74a3189.
> 
> RK3228 Only GPLL and CPLL, GPLL is a common clock, does not allow
> dclk_vop to change its frequency, CPLL is used by GMAC,
> if dclk_vop use CLK_SET_RATE_PARENT and CLK_SET_RATE_NO_REPARENT flags will
> affect the GMAC function.
> 
how do you come to this conclusion?

On the RK3228, hdmiphy is the default parent of dclk_vop, a clock that is
not even generated by the CRU but is the output of an external HDMI PHY.
The CLK_SET_RATE_NO_REPARENT flag ensures that the parent of dclk_vop never
changes to sclk_vop_pre (and thus never uses CPLL or GPLL). With
CLK_SET_RATE_PARENT we only ensure that we can use all rates of [0] since
there is no divider between dclk_vop and hdmiphy. Overall it is pretty much
the same situation as for RK3328, which handles these clocks in the same
way (see dclk_lcdc for RK3328).

Regards,
Alex

[0] [1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c?h=v6.13#n293
> If the client application does not use GMAC and CPLL is free, make this
> change on the local branch.
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> ---
>   drivers/clk/rockchip/clk-rk3228.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/rockchip/clk-rk3228.c b/drivers/clk/rockchip/clk-rk3228.c
> index ed602c27b624..9c0284607766 100644
> --- a/drivers/clk/rockchip/clk-rk3228.c
> +++ b/drivers/clk/rockchip/clk-rk3228.c
> @@ -409,7 +409,7 @@ static struct rockchip_clk_branch rk3228_clk_branches[] __initdata = {
>   			RK2928_CLKSEL_CON(29), 0, 3, DFLAGS),
>   	DIV(0, "sclk_vop_pre", "sclk_vop_src", 0,
>   			RK2928_CLKSEL_CON(27), 8, 8, DFLAGS),
> -	MUX(DCLK_VOP, "dclk_vop", mux_dclk_vop_p, CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
> +	MUX(DCLK_VOP, "dclk_vop", mux_dclk_vop_p, 0,
>   			RK2928_CLKSEL_CON(27), 1, 1, MFLAGS),
>   
>   	FACTOR(0, "xin12m", "xin24m", 0, 1, 2),


